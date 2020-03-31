<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnSubmit").on("click" ,function(){
				$("#searchForm").submit();
			})
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
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
		<li class="active" style="width: 140px"><a class="nav-head" href="${ctx}/gen/genTable/">业务表列表</a></li>
		<shiro:hasPermission name="gen:genTable:edit"><li><a style="width: 140px;text-align:center" href="${ctx}/gen/genTable/form">业务表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="genTable" action="${ctx}/gen/genTable/" method="post" class="breadcrumb form-search">

		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
	<ul class="ul-form" >
		<div>
		<li class="first-line"><label>表名：</label><form:input path="nameLike" htmlEscape="false" maxlength="50" class="input-medium"/></li>
		<li class="first-line"><label>说明：</label><form:input path="comments" htmlEscape="false" maxlength="50" class="input-medium"/></li>
		<li class="first-line"><label>父表表名：</label><form:input path="parentTable" htmlEscape="false" maxlength="50" class="input-medium"/></li>
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
		<thead><tr><th class="sort-column name">表名</th><th>说明</th><th class="sort-column class_name">类名</th><th class="sort-column parent_table">父表</th><shiro:hasPermission name="gen:genTable:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="genTable">
			<tr>
				<td style="height: 50px"><a href="${ctx}/gen/genTable/form?id=${genTable.id}">${genTable.name}</a></td>
				<td style="height: 50px">${genTable.comments}</td>
				<td style="height: 50px">${genTable.className}</td>
				<td  style="height: 50px" title="点击查询子表"><a href="javascript:" onclick="$('#parentTable').val('${genTable.parentTable}');$('#searchForm').submit();">${genTable.parentTable}</a></td>
				<shiro:hasPermission name="gen:genTable:edit"><td style="height: 50px">
    				<a href="${ctx}/gen/genTable/form?id=${genTable.id}">修改</a>
					<a href="${ctx}/gen/genTable/delete?id=${genTable.id}" onclick="return confirmx('确认要删除该业务表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>
