<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>历史查看管理管理</title>
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
		<li class="active"><a href="${ctx}/publicity/ccmDeviceViewLog/">数据列表</a></li>
		<shiro:hasPermission name="publicity:ccmDeviceViewLog:edit"><li><a href="${ctx}/publicity/ccmDeviceViewLog/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmDeviceViewLog" action="${ctx}/publicity/ccmDeviceViewLog/" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form pull-left">
			<li><label>查看人：</label>
				<sys:treeselect id="viewer" name="viewer.id" value="${ccmDeviceViewLog.viewer.id}" labelName="" labelValue="${ccmDeviceViewLog.viewer.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
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
				<th>查看人</th>
				<th>查看内容</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>查看时长</th>
				<th>查看频次</th>
				<shiro:hasPermission name="publicity:ccmDeviceViewLog:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmDeviceViewLog">
			<tr>
				<td><a href="${ctx}/publicity/ccmDeviceViewLog/form?id=${ccmDeviceViewLog.id}">
					${ccmDeviceViewLog.viewer.name}
				</a></td>
				<td>
					${ccmDeviceViewLog.viewContent}
				</td>
				<td>
					<fmt:formatDate value="${ccmDeviceViewLog.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${ccmDeviceViewLog.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${ccmDeviceViewLog.viewTime}
				</td>
				<td>
					${ccmDeviceViewLog.viewFrequency}
				</td>
				<shiro:hasPermission name="publicity:ccmDeviceViewLog:edit"><td>
    				<a href="${ctx}/publicity/ccmDeviceViewLog/form?id=${ccmDeviceViewLog.id}">修改</a>
					<a href="${ctx}/publicity/ccmDeviceViewLog/delete?id=${ccmDeviceViewLog.id}" onclick="return confirmx('确认要删除该历史查看管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>