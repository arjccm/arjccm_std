<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>邮件阅读状态查看</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
</script>
</head>
<body>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed" >
		<thead>
			<tr>
				<th>姓名</th>
				<th style="display:none;">发送类型</th>
				<th>所在部门</th>
				<th>查阅状态</th>
				<th>阅读时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${plmWorkEmail.plmWorkEmailSReadList}" var="plmWorkEmailSRead">
				<tr>
					<td>${plmWorkEmailSRead.user.name}</td>
					<td style="display:none;">${fns:getDictLabel(plmWorkEmailSRead.type, 'plm_email_read_type', '')}</td>
					<td>${plmWorkEmailSRead.user.office.name}</td>
					<td>${fns:getDictLabel(plmWorkEmailSRead.readFlag, 'oa_notify_read', '')}
					</td>
					<td><fmt:formatDate value="${plmWorkEmailSRead.readTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</c:forEach>
			<c:forEach items="${plmWorkEmail.plmWorkEmailCReadList}" var="plmWorkEmailCRead">
				<tr>
					<td>${plmWorkEmailCRead.user.name}</td>
					<td style="display:none;">${fns:getDictLabel(plmWorkEmailCRead.type, 'plm_email_read_type', '')}</td>
					<td>${plmWorkEmailCRead.user.office.name}</td>
					<td>${fns:getDictLabel(plmWorkEmailCRead.readFlag, 'oa_notify_read', '')}
					</td>
					<td><fmt:formatDate value="${plmWorkEmailCRead.readTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</c:forEach>
			<c:forEach items="${plmWorkEmail.plmWorkEmailMReadList}" var="plmWorkEmailMRead">
				<tr>
					<td>${plmWorkEmailMRead.user.name}</td>
					<td style="display:none;">${fns:getDictLabel(plmWorkEmailMRead.type, 'plm_email_read_type', '')}</td>
					<td>${plmWorkEmailMRead.user.office.name}</td>
					<td>${fns:getDictLabel(plmWorkEmailMRead.readFlag, 'oa_notify_read', '')}
					</td>
					<td><fmt:formatDate value="${plmWorkEmailMRead.readTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</c:forEach>			
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>