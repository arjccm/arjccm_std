<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>政务查询管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/service/ccmServiceGovernment/">数据列表</a></li>
		<shiro:hasPermission name="service:ccmServiceGovernment:edit"><li><a href="${ctx}/service/ccmServiceGovernment/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmServiceGovernment" action="${ctx}/service/ccmServiceGovernment/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li>
				<label>政务类型：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('service_government_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li>
				<label>事项标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li>
				<label>事项内容：</label>
				<form:input path="content" htmlEscape="false" maxlength="512" class="input-medium"/>
			</li>
			<li>
				<label>部门：</label>
				<form:input path="dept" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed" style="table-layout: fixed;">
		<thead>
			<tr>
				<th>事项标题</th>
				<th>政务类型</th>
				<th>事项内容</th>
				<th>部门</th>
				<shiro:hasPermission name="service:ccmServiceGovernment:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmServiceGovernment">
			<tr>
				<td>
					<a href="${ctx}/service/ccmServiceGovernment/form?id=${ccmServiceGovernment.id}">${ccmServiceGovernment.title}</a>
				</td>
				<td>
					${fns:getDictLabel(ccmServiceGovernment.type, 'service_government_type', '')}
				</td>
				<td style="overflow: hidden;word-break: keep-all;text-overflow: ellipsis;">
					${ccmServiceGovernment.content}
				</td>
				<td>
					${ccmServiceGovernment.dept}
				</td>
				<shiro:hasPermission name="service:ccmServiceGovernment:edit"><td>
    				<a class="btnList" href="${ctx}/service/ccmServiceGovernment/form?id=${ccmServiceGovernment.id}" title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
					<a class="btnList" href="${ctx}/service/ccmServiceGovernment/delete?id=${ccmServiceGovernment.id}" onclick="return confirmx('确认要删除该政务查询吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>