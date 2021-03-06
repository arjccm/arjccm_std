<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>区域管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${fns:toJson(list)}, rootId = "0";
			addRow("#treeTableList", tpl, data, rootId, true);
			$("#treeTable").treeTable({expandLevel : 4});
		});
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
							type: getDictLabel(${fns:toJson(fns:getDictList('sys_area_type'))}, row.type)
						}, pid: (root?0:pid), row: row
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
		function isDelete(areaid) {
			$.ajax({
				url: ctx + "/org/sysArea/isDelete?id=" + areaid,
				type: "get",
				success: function (data) {
					if(data){
						return confirmx('要删除该区域及所有子区域项吗？', "${ctx}/sys/area/delete?id="+areaid);
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
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">用户管理</span>--%>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/sys/area/">区域列表</a></li>
		<shiro:hasPermission name="sys:area:edit"><li><a style="text-align:center" href="${ctx}/sys/area/form">区域添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-striped table-bordered table-condensed table-gradient" style="table-layout:fixed;">
		<thead><tr><th>区域名称</th><th>区域编码</th><th>区域类型</th><th style="width: 700px;">备注</th><shiro:hasPermission name="sys:area:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody id="treeTableList"></tbody>
	</table>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			<td class="tp"><a href="${ctx}/sys/area/form?id={{row.id}}">{{row.name}}</a></td>
			<td>{{row.code}}</td>
			<td>{{dict.type}}</td>
			<td>{{row.remarks}}</td>
			<shiro:hasPermission name="sys:area:edit"><td>
				<a class="btnList" href="${ctx}/sys/area/form?id={{row.id}}" title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
<%--				<a class="btnList" href="${ctx}/sys/area/delete?id={{row.id}}" onclick="return confirmx('要删除该区域及所有子区域项吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>--%>
				<a class="btnList" href="###" onclick="isDelete('{{row.id}}')" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				<a class="btnList" href="${ctx}/sys/area/form?parent.id={{row.id}}" title="添加下级区域"><i class="iconfont icon-caozuotubiao-tianjiachuli"></i></a>
			</td></shiro:hasPermission>
		</tr>
	</script>
</body>
</html>