<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>电子围栏管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {

	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
</script>
<script src="${ctxStatic}/ccm/event/js/ccmEventIncident.js"
	type="text/javascript"></script>
</head>
<body>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/fence/ccmElectronicFence/">数据列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmElectronicFence"
		action="${ctx}/fence/ccmElectronicFence/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>围栏名称：</label> <form:input path="fenceName"
					htmlEscape="false" maxlength="64" class="input-medium" /></li>
			<li><label>报警规则：</label>
				<form:select path="alarmRule" class="input-large">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('fence_alarm_rule')}"
						itemLabel="label" itemValue="value" htmlEscape="false" maxlength="3" class="input-medium" />
				</form:select>
					
			</li>
			<shiro:hasPermission name="fence:ccmElectronicFence:edit"><li class="btns"><a
				onclick="parent.LayerDialog('${ctx}/fence/ccmElectronicFence/form', '添加', '1100px', '700px')"
				class="btn btn-export" style="width: 49px;/*margin-top: 25px;*/display:inline-block;float: right;"><span style="font-size: 12px">添加</span></a></li></shiro:hasPermission>
<%--			<li class="btns"><a href="javascript:;" id="btnSubmit"--%>
<%--				class="btn btn-primary" style="width: 49px;margin-top: 5px;display:inline-block;float: right;"> <i > <span style="font-size: 12px">查询</span></i>--%>
<%--			</a></li>--%>
			<a href="javascript:;" id="btnSubmit" style="width: 49px;/*margin-top: 25px;*/display:inline-block;float: right;" class="btn btn-primary">
					<%--<i class="icon-search"></i> --%><span style="font-size: 12px">查询</span> </a>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>围栏名称</th>
				<th>报警规则</th>
				<th>备注信息</th>
				<th>更新时间</th>
				<shiro:hasPermission name="fence:ccmElectronicFence:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="ccmElectronicFence">
				<tr>
					<td><a class="btnList"
						onclick="parent.LayerDialog('${ctx}/fence/ccmElectronicFence/form?id=${ccmElectronicFence.id}', '编辑', '1100px', '700px')">
							${ccmElectronicFence.fenceName}</a></td>
					<td>${fns:getDictLabel(ccmElectronicFence.alarmRule, 'fence_alarm_rule', '无')}</td>
					<td class="tp">${ccmElectronicFence.remarks}</td>
					<td><fmt:formatDate value="${ccmElectronicFence.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /> </a></td>
					<shiro:hasPermission name="fence:ccmElectronicFence:edit">
						<td><a class="btnList"
							onclick="parent.LayerDialog('${ctx}/fence/ccmElectronicFence/form?id=${ccmElectronicFence.id}', '编辑', '1100px', '700px')"
							title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a> <a class="btnList"
							href="${ctx}/fence/ccmElectronicFence/delete?id=${ccmElectronicFence.id}"
							onclick="return confirmx('确认要删除该电子围栏吗？', this.href)" title="删除"><i
								class="iconfont icon-caozuotubiao-shanchu"></i></a></td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</div>
</body>
</html>