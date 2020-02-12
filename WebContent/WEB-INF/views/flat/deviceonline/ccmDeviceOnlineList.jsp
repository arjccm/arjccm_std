<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>设备在线记录管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {

	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/deviceonline/ccmDeviceOnline/">设备在线记录列表</a></li>
		<shiro:hasPermission name="deviceonline:ccmDeviceOnline:edit">
			<li><a href="${ctx}/deviceonline/ccmDeviceOnline/form">设备在线记录添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmDeviceOnline"
		action="${ctx}/deviceonline/ccmDeviceOnline/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>登录状态：</label> <form:select path="status"
					class="input-large">
					<form:options items="${fns:getDictList('ccm_device_status')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>设备id</th>
				<th>登陆时间</th>
				<th>状态更新时间</th>
				<th>登录状态</th>
				<th>备注信息</th>
				<shiro:hasPermission name="deviceonline:ccmDeviceOnline:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="ccmDeviceOnline">
				<tr>

					<td>${ccmDeviceOnline.deviceId}</td>
					<td><fmt:formatDate value="${ccmDeviceOnline.loginTime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${ccmDeviceOnline.updateTime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${fns:getDictLabel(ccmDeviceOnline.status, 'ccm_device_status', '')}</td>
					<td>${ccmDeviceOnline.remarks}</td>
					<shiro:hasPermission name="deviceonline:ccmDeviceOnline:edit">
						<td><a
							href="${ctx}/deviceonline/ccmDeviceOnline/form?id=${ccmDeviceOnline.id}">修改</a>
							<a
							href="${ctx}/deviceonline/ccmDeviceOnline/delete?id=${ccmDeviceOnline.id}"
							onclick="return confirmx('确认要删除该设备在线记录吗？', this.href)">删除</a></td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>