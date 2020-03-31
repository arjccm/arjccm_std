<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>机构管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${fns:toJson(list)}, rootId = "${not empty office.id ? office.id : '0'}";
			addRow("#treeTableList", tpl, data, rootId, true);
			$("#treeTable").treeTable({expandLevel : 5});
		});
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
							type: getDictLabel(${fns:toJson(fns:getDictList('sys_office_type'))}, row.type)
						}, pid: (root?0:pid), row: row
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
		function isDelete(officeid) {
			$.ajax({
				url: ctx + "/sys/pbsOffice/isDelete?id=" + officeid,
				type: "get",
				success: function (data) {
					if(data){
						return confirmx('要删除该区域及所有子区域项吗？', "${ctx}/sys/office/delete?id="+officeid);
					} else {
						layer.msg('操作错误');
					}
				}
			})

		}
	</script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">部门管理</span>--%>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<%-- <c:if test="${office.parentIds eq '%'}">
			<li class="active"><a href="${ctx}/sys/office/list?id=${office.id}&parentIds=&name=">机构列表</a></li>
		</c:if>
		<c:if test="${office.parentIds != '%'}">
			<li class="active"><a href="${ctx}/sys/office/list?id=${office.id}&parentIds=${office.parentIds}&name=">机构列表</a></li>
		</c:if> --%>
		<li class="active" style="width: 140px"><a class="nav-head" href="${ctx}/sys/office/list?id=&parentIds=&name=">机构列表</a></li>
		<shiro:hasPermission name="sys:office:edit"><li><a style="width: 140px;text-align:center" href="${ctx}/sys/office/form?parent.id=${office.id}">机构添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead><tr><th>机构名称</th><th>归属区域</th><th>机构编码</th><th>机构类型</th><th>备注</th><shiro:hasPermission name="sys:office:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody id="treeTableList"></tbody>
	</table>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			<td class="tp"><a href="${ctx}/sys/office/form?id={{row.id}}">{{row.name}}</a></td>
			<td>{{row.area.name}}</td>
			<td>{{row.code}}</td>
			<td>{{dict.type}}</td>
			<td><textarea style="width: 300px;height: 30px">{{row.remarks}}</textarea></td>
			<shiro:hasPermission name="sys:office:edit"><td>
				<a class="btnList" href="${ctx}/sys/office/form?id={{row.id}}" title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
				<%--<a class="btnList" href="${ctx}/sys/office/delete?id={{row.id}}" onclick="return confirmx('要删除该机构及所有子机构项吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>--%>
				<a class="btnList" href="###" onclick="isDelete('{{row.id}}')" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				<a class="btnList" href="${ctx}/sys/office/form?parent.id={{row.id}}" title="添加下级机构"><i class="iconfont icon-caozuotubiao-tianjiachuli"></i></a>
			</td></shiro:hasPermission>
		</tr>
	</script>
</body>
</html>