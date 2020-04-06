<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>门户字典管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnSubmit').click(function() {
			$('#searchForm').submit();
		});
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
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">系统设置</span>--%>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/home/plmPortalDict/">门户字典列表</a></li>
		<shiro:hasPermission name="home:plmPortalDict:edit">
			<li><a style="text-align:center" href="${ctx}/home/plmPortalDict/form">门户字典添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="plmPortalDict"
		action="${ctx}/home/plmPortalDict/" method="post"
		class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form pull-left">
			<li class="first-line"><label>标题：</label> <form:input path="title"
					htmlEscape="false" maxlength="256" class="input-medium" /></li>


			<li class="first-line"><label>类型：</label> <form:select path="extend1"
					class="input-large">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('index_sys_type')}"
						itemLabel="label" itemValue="value" htmlEscape="false"
						maxlength="2" class="input-medium" />
				</form:select></li>

		</ul>


	<div class="clearfix pull-right btn-box">

			<a href="javascript:;" id="btnSubmit" style="width: 49px;/*margin-top: 25px;*/display:inline-block;float: right;" class="btn btn-primary">
				<%--<i class="icon-search"></i> --%><span style="font-size: 12px">查询</span> </a>
	</div>
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>标题</th>
				<th>更多链接</th>
				<th>内容链接</th>
				<th>内容行数</th>
				<th>平台类型</th>
				<th>更新时间</th>
				<shiro:hasPermission name="home:plmPortalDict:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="plmPortalDict">
				<tr>
					<td><a
						href="${ctx}/home/plmPortalDict/form?id=${plmPortalDict.id}">
							${plmPortalDict.title} </a></td>
					<td>${plmPortalDict.connect}</td>
					<td>${plmPortalDict.content}</td>
					<td>${plmPortalDict.line}</td>
					<td>${fns:getDictLabel(plmPortalDict.extend1, 'index_sys_type', '无')}
					</td>
					<td><fmt:formatDate value="${plmPortalDict.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<shiro:hasPermission name="home:plmPortalDict:edit">
						<td><a class="btnList"
							href="${ctx}/home/plmPortalDict/form?id=${plmPortalDict.id}"
							title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a> <a class="btnList"
							href="${ctx}/home/plmPortalDict/delete?id=${plmPortalDict.id}"
							onclick="return confirmx('确认要删除该信息吗？', this.href)" title="删除"><i
								class="iconfont icon-caozuotubiao-shanchu"></i></a></td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>