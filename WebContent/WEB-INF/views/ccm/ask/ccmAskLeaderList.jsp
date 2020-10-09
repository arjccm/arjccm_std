<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>领导请示管理</title>
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
		<li class="active"><a href="${ctx}/ask/ccmAskLeader/?type=1">数据列表</a></li>
		<shiro:hasPermission name="ask:ccmAskLeader:edit"><li><a href="${ctx}/ask/ccmAskLeader/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmAskLeader" action="${ctx}/ask/ccmAskLeader/?type=1" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li>
				<label>请示标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="512" class="input-medium"/>
			</li>
			<li>
				<label>请示内容：</label>
				<form:input path="content" htmlEscape="false" maxlength="2048" class="input-medium"/>
			</li>
			<li>
				<label>回复状态：</label>
				<form:select path="replyStatus" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('ask_reply_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed" style="table-layout: fixed;">
		<thead>
			<tr>
				<th>请示标题</th>
				<th>接收人</th>
				<th>请示内容</th>
				<th>回复状态</th>
				<th>提交时间</th>
				<shiro:hasPermission name="ask:ccmAskLeader:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmAskLeader">
			<tr>
				<td>
					<a href="${ctx}/ask/ccmAskLeader/form?id=${ccmAskLeader.id}">${ccmAskLeader.title}</a>
				</td>
				<td>
					${ccmAskLeader.leader.name}
				</td>
				<td style="overflow: hidden;word-break: keep-all;text-overflow: ellipsis;">
					${ccmAskLeader.content}
				</td>
				<td>
					${fns:getDictLabel(ccmAskLeader.replyStatus, 'ask_reply_type', '')}
				</td>
				<td>
					<fmt:formatDate value="${ccmAskLeader.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="ask:ccmAskLeader:edit"><td>
    				<a class="btnList" href="${ctx}/ask/ccmAskLeader/form?id=${ccmAskLeader.id}" title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
					<a class="btnList" href="${ctx}/ask/ccmAskLeader/delete?id=${ccmAskLeader.id}" onclick="return confirmx('确认要删除该领导请示吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>