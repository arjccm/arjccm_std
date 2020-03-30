<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>下级域服务器管理</title>
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
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active" style="width: 140px"><a class="nav-head" href="${ctx}/ccmsys/ccmDomain/">数据列表</a></li>
		<shiro:hasPermission name="ccmsys:ccmDomain:edit"><li><a style="width: 140px;text-align:center"  href="${ctx}/ccmsys/ccmDomain/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmDomain" action="${ctx}/ccmsys/ccmDomain/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>服务器名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<!-- <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/> -->
			<div class="clearfix pull-right btn-box">
				<a href="javascript:;" id="btnSubmit" style="width: 49px;
   /*margin-top: 25px;*/display:inline-block;float: right" class="btn btn-primary">
						<%--<i class="icon-search"></i> --%><span style="font-size: 12px">查询</span> </a>
			</div>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>服务器名称</th>
				<th>编码</th>
				<th>IP</th>
				<th>上级区域编码（本系统）</th>
				<shiro:hasPermission name="ccmsys:ccmDomain:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmDomain">
			<tr>
				<td><a href="${ctx}/ccmsys/ccmDomain/form?id=${ccmDomain.id}">
					${ccmDomain.name}
				</a></td>
				<td>
					${ccmDomain.code}
				</td>
				<td>
					${ccmDomain.ip}
				</td>
				<td>
					${ccmDomain.upperAreaCode}
				</td>
				<shiro:hasPermission name="ccmsys:ccmDomain:edit"><td>
    				<a class="btnList" href="${ctx}/ccmsys/ccmDomain/form?id=${ccmDomain.id}" title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
					<a class="btnList" href="${ctx}/ccmsys/ccmDomain/updateDomain?id=${ccmDomain.id}" onclick="return confirmx('确认要获取该下级域服务器的基础数据吗？', this.href)" title="获取下级域基础数据"><i class="icon-download-alt"></i></a>
					<a class="btnList" href="${ctx}/ccmsys/ccmDomain/delete?id=${ccmDomain.id}" onclick="return confirmx('确认要删除该下级域服务器吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</div>
</body>
</html>