<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>仓库信息管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${fns:toJson(list)}, ids = [], rootIds = [];
			for (var i=0; i<data.length; i++){
				ids.push(data[i].id);
			}
			ids = ',' + ids.join(',') + ',';
			for (var i=0; i<data.length; i++){
				if (ids.indexOf(','+data[i].parentId+',') == -1){
					if ((','+rootIds.join(',')+',').indexOf(','+data[i].parentId+',') == -1){
						rootIds.push(data[i].parentId);
					}
				}
			}
			for (var i=0; i<rootIds.length; i++){
				addRow("#treeTableList", tpl, data, rootIds[i], true);
			}
			$("#treeTable").treeTable({expandLevel : 5});
		});
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
							type: getDictLabel(${fns:toJson(fns:getDictList('plm_storage'))}, row.type),
						blank123:0}, pid: (root?0:pid), row: row
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
	</script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">应急物资保障</span>--%>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/storage/plmStorage/">仓库信息列表</a></li>
		<shiro:hasPermission name="storage:plmStorage:edit"><li><a style="text-align:center" href="${ctx}/storage/plmStorage/form">仓库信息添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>名称</th>
				<th>编号</th>
				<th>联系人</th>
				<th>仓库类型</th>
				<th>地址</th>
				<th>备注</th>
				<shiro:hasPermission name="storage:plmStorage:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody id="treeTableList"></tbody>
	</table>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			<td><a href="${ctx}/storage/plmStorage/form?id={{row.id}}">
				{{row.name}}
			</a></td>
			<td>
				{{row.code}}
			</td>
			<td>
				{{row.user.name}}
			</td>
			<td>
				{{dict.type}}
			</td>
			<td>
				{{row.stoAddress}}
			</td>
			<td class="tp" style="height: 50px">
				{{row.remarks}}
			</td>
			<shiro:hasPermission name="storage:plmStorage:edit"><td>
   				<a class="btnList" href="${ctx}/storage/plmStorage/form?id={{row.id}}" title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
				<a  class="btnList" href="${ctx}/storage/plmStorage/delete?id={{row.id}}" title="删除" onclick="return confirmx('确认要删除该仓库信息及所有子仓库信息吗？', this.href)"><i
										class="iconfont icon-caozuotubiao-shanchu"></i></a>
				<a class="btnList" href="${ctx}/storage/plmStorage/form?parent.id={{row.id}}" title="添加下级仓库信息"><i  class="iconfont icon-caozuotubiao-tianjiachuli"></i></a>
			</td></shiro:hasPermission>
		</tr>
	</script>
</body>
</html>