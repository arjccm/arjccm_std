<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>重点区域管理</title>
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
	<div class="context" content="${ctx}"></div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/org/ccmImportArea/">重点区域列表</a></li>
		<shiro:hasPermission name="org:ccmImportArea:edit"><li><a href="${ctx}/org/ccmImportArea/form">重点区域添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmImportArea" action="${ctx}/org/ccmImportArea/" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form pull-left">
			<li class="first-line"><label class="title-text">重点区域名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="first-line"><label class="title-text">所属区域：</label>
				<sys:treeselect id="area" name="area.id" value="${ccmImportArea.area.id}" labelName="area.name" labelValue="${ccmImportArea.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="input-medium" allowClear="true" notAllowSelectParent="false"/>
			</li>
			<%--<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>--%>
			<%--<li class="clearfix"></li>--%>
		</ul>
		<div class="clearfix pull-right btn-box">
			<a href="javascript:;" id="btnSubmit" class="btn btn-primary" style="width: 49px;display:inline-block;float: right;">
				<i></i><span style="font-size: 12px">查询</span>  </a>
		</div>
	</form:form>
	<sys:message content="${message}"/>
	<table style="table-layout:fixed;width:1659px" id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>重点区域名称</th>
				<th>所属区域</th>
				<th>重点区域概述</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="org:ccmImportArea:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmImportArea">
			<tr>
				<td><a href="${ctx}/org/ccmImportArea/form?id=${ccmImportArea.id}">
					${ccmImportArea.name}
				</a></td>
				<td>
					${ccmImportArea.area.name}
				</td>
				<td>
					${ccmImportArea.areaDescription}
				</td>
				<td>
					<fmt:formatDate value="${ccmImportArea.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${ccmImportArea.remarks}
				</td>
				<shiro:hasPermission name="org:ccmImportArea:edit"><td>
					<a href="${ctx}/org/ccmImportArea/form?id=${ccmImportArea.id}"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
					<a href="${ctx}/org/ccmImportArea/delete?id=${ccmImportArea.id}" onclick="return confirmx('确认要删除该重点区域吗？', this.href)"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</div>
</body>
</html>