<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生成方案管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnSubmit").on("click" ,function(){
				$("#searchForm").submit();
			})
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
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">自动化生成</span>--%>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/gen/genScheme/">生成方案列表</a></li>
		<shiro:hasPermission name="gen:genScheme:edit"><li><a style="text-align:center" href="${ctx}/gen/genScheme/form">生成方案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="genScheme" action="${ctx}/gen/genScheme/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
	<ul class="ul-form">
		<div>
		<li class="first-line"><label>方案名称 ：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/></li>
		&nbsp;
		<!-- <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/> -->

		</div>
	</ul>
	</form:form>
	<sys:message content="${message}"/>
	<ul>
		<a href="javascript:;" id="btnSubmit" style="width: 49px;margin-right: 14px;
    margin-bottom: 20px;/*margin-top: 25px;*/display:inline-block;float: right;margin-left: 20px" class="btn btn-primary">
			<%--<i class="icon-search"></i> --%><span style="font-size: 12px">查询</span> </a>
	</ul>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead><tr><th>方案名称</th><th>生成模块</th><th>模块名</th><th>功能名</th><th>功能作者</th><shiro:hasPermission name="gen:genScheme:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="genScheme">
			<tr>
				<td style="height: 50px"><a href="${ctx}/gen/genScheme/form?id=${genScheme.id}">${genScheme.name}</a></td>
				<td style="height: 50px">${genScheme.packageName}</td>
				<td style="height: 50px">${genScheme.moduleName}${not empty genScheme.subModuleName?'.':''}${genScheme.subModuleName}</td>
				<td style="height: 50px">${genScheme.functionName}</td>
				<td style="height: 50px">${genScheme.functionAuthor}</td>
				<shiro:hasPermission name="gen:genScheme:edit"><td style="height: 50px">
    				<a href="${ctx}/gen/genScheme/form?id=${genScheme.id}">修改</a>
					<a href="${ctx}/gen/genScheme/delete?id=${genScheme.id}" onclick="return confirmx('确认要删除该生成方案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>
