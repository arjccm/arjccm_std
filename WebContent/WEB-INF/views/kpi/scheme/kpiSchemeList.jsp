<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>绩效考评方案管理</title>
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
<style type="text/css">
.btn-bgcoler {
	background: #fff
}
</style>
<script src="${ctxStatic}/ccm/event/js/ccmEventIncident.js"
	type="text/javascript"></script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">专项考核管理</span>--%>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/scheme/kpiScheme/">数据列表</a></li>
		<!--<shiro:hasPermission name="scheme:kpiScheme:edit"><li><a href="${ctx}/scheme/kpiScheme/form">绩效考评方案添加</a></li></shiro:hasPermission>
		  -->
	</ul>
	<form:form id="searchForm" modelAttribute="kpiScheme"
		action="${ctx}/scheme/kpiScheme/" method="post"
		class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form pull-left">
			<li class="first-line"><label>方案名称：</label> <form:input path="name"
					htmlEscape="false" maxlength="64" class="input-medium" /></li>
			<li class="first-line"><label>所属部门：</label> <sys:treeselect id="office"
					name="office.id" value="${kpiScheme.office.id}"
					labelName="office.name" labelValue="${kpiScheme.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small"
					allowClear="true" notAllowSelectParent="true" /></li>
			<li class="first-line"><label>考核人员类别：</label> <form:select path="userType"
					class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('sys_user_type')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></li>
<%--			<!-- <!-- <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li> -->--%>

			<li class="first-line"><label>开始时间：</label> <input name="startTime" type="text"
				readonly="readonly" maxlength="20" class="input-medium Wdate"
				value="<fmt:formatDate value="${kpiScheme.startTime}" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
			</li>
			<li class="first-line"><label>结束时间：</label> <input name="endTime" type="text"
				readonly="readonly" maxlength="20" class="input-medium Wdate"
				value="<fmt:formatDate value="${kpiScheme.endTime}" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
			</li>
			<li class="second-line"><label>方案状态：</label> <form:select path="state"
					class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('kpi_scheme_state')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></li>
<%--			<li class="clearfix"></li>--%>
		</ul>


	<div class="clearfix pull-right btn-box">
		<a href="javascript:;" id="btnSubmit" class="btn btn-primary" style="width: 49px;display:inline-block;float: right;">
			<i></i><span style="font-size: 12px">查询</span>  </a>
	</div>
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>方案名称</th>
				<th>起止时间</th>
				<th>所属部门</th>
				<th>考核人员类别</th>
				<th>方案状态</th>
				<shiro:hasPermission name="scheme:kpiScheme:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="kpiScheme">
				<tr>
					<td>${kpiScheme.name}</td>
					<td><fmt:formatDate value="${kpiScheme.startTime}"
							pattern="yyyy-MM-dd" /> —— <fmt:formatDate
							value="${kpiScheme.endTime}" pattern="yyyy-MM-dd" /></td>
					<td>${kpiScheme.office.name}</td>
					<td>${fns:getDictLabel(kpiScheme.userType, 'sys_user_type', '')}
					</td>
					<c:if test="${kpiScheme.state eq '1'}">
						<td style='color: #D69601;height: 50px'>${fns:getDictLabel(kpiScheme.state, 'kpi_scheme_state', '')}</td>
					</c:if>
					<c:if test="${kpiScheme.state eq '2'}">
						<td style='color: red;height: 50px'>${fns:getDictLabel(kpiScheme.state, 'kpi_scheme_state', '')}</td>
					</c:if>
					<c:if
						test="${kpiScheme.state eq '' or empty kpiScheme.state or kpiScheme.state eq '0' }">
						<td>${fns:getDictLabel(kpiScheme.state, 'kpi_scheme_state', '')}</td>
					</c:if>

					<shiro:hasPermission name="scheme:kpiScheme:edit">
					<td>
						<c:if test="${kpiScheme.state eq '1'}">
							<a class="btn btn-bgcoler"
								href="${ctx}/scheme/kpiScheme/pauseList?id=${kpiScheme.id}"
								onclick="return confirmx('确认要冻结方案吗？该方案将暂停考核。', this.href)"><span
									style="color: red"><strong>冻结方案</strong></span></a>&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${kpiScheme.state eq '2'}">
							<a class="btn btn-bgcoler"
							href="${ctx}/scheme/kpiScheme/starList?id=${kpiScheme.id}"
							onclick="return confirmx('确认要启动方案吗？该方案将开启继续考核。', this.href)"><span
								style="color: #D69601"><strong>启动方案</strong></span></a>&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${kpiScheme.state eq '' or empty kpiScheme.state or kpiScheme.state eq '0' }">
							<a class="btn btn-bgcoler"
							href="${ctx}/scheme/kpiScheme/starList?id=${kpiScheme.id}"
							onclick="return confirmx('确认要启动方案吗？该方案将开启继续考核。', this.href)"><span
								style="color: #D69601"><strong>启动方案</strong></span></a>&nbsp;&nbsp;&nbsp;
							<a class="btn btn-bgcoler"
							href="${ctx}/scheme/kpiScheme/pauseList?id=${kpiScheme.id}"
							onclick="return confirmx('确认要冻结方案吗？该方案将暂停考核。', this.href)"><span
								style="color: red"><strong>冻结方案</strong></span></a>&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${kpiScheme.state != '' and not empty kpiScheme.state and kpiScheme.state != '0' }">
							<a class="btn btn-bgcoler"
								href="${ctx}/scheme/kpiScheme/calculateList?id=${kpiScheme.id}"
								onclick="return confirmx('确认要计算分值吗？此次考核将绩效汇总。', this.href)"><span
								style="color: green"><strong>计算分值</strong></span></a>&nbsp;&nbsp;&nbsp;
							<a class="btn btn-bgcoler" style="width: 100px !important;"
								href="${ctx}/scheme/kpiScheme/againList?id=${kpiScheme.id}"
								onclick="return confirmx('确认要开启新一轮考核吗？此方案将重新开始考核', this.href)"><span
								style="color: blue;"><strong>开启新一轮考核</strong></span></a>&nbsp;&nbsp;&nbsp;
						</c:if>
					</td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>