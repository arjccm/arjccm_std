<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>跟踪信息管理</title>
<meta name="decorator" content="default" />
<script charset="utf-8" type="text/javascript"
    src="${ctxStatic}/ccm/validator/validatorBaseForm.js"></script>
	<link href="${ctxStatic}/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
</head>
<body>
	<ul class="nav nav-tabs">
		<%-- <li><a href="${ctx}/pop/ccmPermanent/">常住人口列表</a></li>
		<li><a href="${ctx}/pop/ccmPermanent/form?id=${ccmLogTail.relevanceId}">常住人口信息</a></li> --%>
		 <li class="active"><a
			href="">跟踪信息<shiro:hasPermission
					name="log:ccmLogTail:edit">${not empty ccmLogTail.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="log:ccmLogTail:edit">查看</shiro:lacksPermission></a></li>
	</ul>

	<form:form id="inputForm" modelAttribute="ccmLogTail"
		action="${ctx}/log/ccmLogTail/saveProPermanent" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<form:hidden path="relevanceId" />
		<form:hidden path="relevanceTable" />
		
		<sys:message content="${message}" />
		<div style="display: none" class="control-group" >
			<label class="control-label">跟踪对象：</label>
			<div class="controls">
				<input class="input-xlarge " readonly="readonly" type="text"
                    value="${fns:getDictLabels(ccmLogTail.relevanceTable, 'ccm_log_tail_table', '')}" />
			</div>
		</div>
		<div class="control-group" style="padding-top: 8px">
			<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>类型：</label>
			<div class="controls">
				<form:select path="type" class="input-xlarge required">
					<form:options items="${fns:getDictList('ccm_log_tail_type')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">跟踪事项：</label>
			<div class="controls">
				<form:input path="tailCase" htmlEscape="false" maxlength="100"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">跟踪内容：</label>
			<div class="controls">
				<form:textarea path="tailContent" htmlEscape="false"
							rows="3" class="input-xxlarge" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>处理人员：</label>
			<div class="controls">
				<form:input path="tailPerson" htmlEscape="false" maxlength="100"
							value="${ccmLogTail.currentUser.name}"
					class="input-xlarge required" />

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="tailTime" type="text" readonly="readonly"
					maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${ccmLogTail.tailTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">处理人联系方式：</label>
			<div class="controls">
				<form:input path="more1" htmlEscape="false" maxlength="100"
							value="${ccmLogTail.currentUser.mobile}"
					class="input-xlarge phone" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4"
					maxlength="255" class="input-xxlarge " />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="log:ccmLogTail:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" />&nbsp;</shiro:hasPermission>
			<!-- <input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" /> -->
		</div>
	</form:form>
</body>
</html>