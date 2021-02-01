<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>查看权限审批管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
            $('#btnSubmit').click(function(){
                $('#searchForm').submit();
            });
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
<ul class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/publicity/ccmDeviceViewApproval/">查看权限审批列表</a></li>
		<shiro:hasPermission name="publicity:ccmDeviceViewApproval:edit"><li><a href="${ctx}/publicity/ccmDeviceViewApproval/form">查看权限审批添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmDeviceViewApproval" action="${ctx}/publicity/ccmDeviceViewApproval/" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>申请人：</label>
				<sys:treeselect id="user" name="user.id" value="${ccmDeviceViewApproval.user.id}" labelName="user.name" labelValue="${ccmDeviceViewApproval.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>申请原因：</label>
				<form:input path="reason" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
		</ul>
	<div class="clearfix pull-right btn-box">
		<a href="javascript:;" id="btnSubmit" class="btn btn-primary" style="width: 49px;display:inline-block;float: right;">
			<i></i><span style="font-size: 12px">查询</span>  </a>
	</div>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>申请人</th>
				<th>申请原因</th>
				<th>审批人</th>
				<th>审批结果</th>
				<th>审批时间</th>
				<shiro:hasPermission name="publicity:ccmDeviceViewApproval:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmDeviceViewApproval">
			<tr>
				<td><a href="${ctx}/publicity/ccmDeviceViewApproval/form?id=${ccmDeviceViewApproval.id}">
					${ccmDeviceViewApproval.user.name}
				</a></td>
				<td>
					${ccmDeviceViewApproval.reason}
				</td>
				<td>
					${ccmDeviceViewApproval.approvalId.name}
				</td>
				<td>
					${fns:getDictLabel(ccmDeviceViewApproval.approvalResult, 'memreg_type', '')}
				</td>
				<td>
					<fmt:formatDate value="${ccmDeviceViewApproval.approvalTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="publicity:ccmDeviceViewApproval:edit"><td>
    				<a href="${ctx}/publicity/ccmDeviceViewApproval/form?id=${ccmDeviceViewApproval.id}">修改</a>
					<a href="${ctx}/publicity/ccmDeviceViewApproval/delete?id=${ccmDeviceViewApproval.id}" onclick="return confirmx('确认要删除该查看权限审批吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>