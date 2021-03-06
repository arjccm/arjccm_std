<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>App 上传记录表管理</title>
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
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">app版本管理</span>--%>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active" style="width: 150px"><a class="nav-head" href="${ctx}/appupload/sysAppUpload/">数据列表</a></li>
		<shiro:hasPermission name="appupload:sysAppUpload:edit"><li><a style="text-align:center" href="${ctx}/appupload/sysAppUpload/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sysAppUpload" action="${ctx}/appupload/sysAppUpload/" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form pull-left">
			<li class="first-line"><label>APP名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="40" class="input-medium"/>
			</li>
			<li class="first-line"><label>版本号：</label>
				<form:input path="version" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
<%--			<li class="clearfix"></li>--%>
		</ul>


	<div class="clearfix pull-right btn-box">
		<a href="javascript:;" id="btnSubmit" style="width: 49px;
    /*margin-top: 25px;*/display:inline-block;float: right;" class="btn btn-primary">
			<%--<i class="icon-search"></i> --%><span style="font-size: 12px">查询</span> </a>
	</div>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient" style="table-layout:fixed;">
		<thead>
			<tr>
				<th>APP名称</th>
				<th>类别</th>
				<th>下载地址</th>
				<th>版本号</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="appupload:sysAppUpload:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysAppUpload">
			<tr>
				<td><a href="${ctx}/appupload/sysAppUpload/form?id=${sysAppUpload.id}">
					${sysAppUpload.name}
				</a></td>
				<td>
					${fns:getDictLabel(sysAppUpload.type, 'app_os_type', '')}
				</td>
				<td style="height: auto;white-space: normal;word-break:break-all;" title="${sysAppUpload.url}" >
					${sysAppUpload.url}
				</td>
				<td>
					${sysAppUpload.version}
				</td>
				<td>
					<fmt:formatDate value="${sysAppUpload.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td style="height: auto;white-space: normal;">
					${sysAppUpload.remarks}
				</td>
				<shiro:hasPermission name="appupload:sysAppUpload:edit"><td>
					<shiro:hasPermission name="appupload:sysAppUpload:edit"><a class="btnList" href="${ctx}/appupload/sysAppUpload/form?id=${sysAppUpload.id}"  title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a></shiro:hasPermission>
					<shiro:hasPermission name="appupload:sysAppUpload:edit"><a class="btnList" href="${ctx}/appupload/sysAppUpload/delete?id=${sysAppUpload.id}" onclick="return confirmx('确认要删除该App 上传记录表吗？', this.href)"  title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a></shiro:hasPermission>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>