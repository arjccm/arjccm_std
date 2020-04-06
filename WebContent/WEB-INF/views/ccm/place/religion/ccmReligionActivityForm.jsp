<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>宗教活动管理</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/form/css/form.css" rel="stylesheet" />
	<link href="${ctxStatic}/form/css/formTable.css" rel="stylesheet" />
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
	<link href="/arjccm/static/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a style="text-align:center" href="${ctx}/religion/ccmReligionActivity/">数据列表</a></li>
		<li class="active"><a class="nav-head" href="${ctx}/religion/ccmReligionActivity/form?id=${ccmReligionActivity.id}">数据<shiro:hasPermission name="religion:ccmReligionActivity:edit">${not empty ccmReligionActivity.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="religion:ccmReligionActivity:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="ccmReligionActivity" action="${ctx}/religion/ccmReligionActivity/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		

		<table>
			<tr>
				<td>
					<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>活动名称：</label>
					<div class="controls">
						<form:input path="name" htmlEscape="false" maxlength="64" class="input-xlarge required"/>

					</div>
				</td>
				<td>
					<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>活动主办方：</label>
					<div class="controls">
						<form:input path="host" htmlEscape="false" maxlength="64" class="input-xlarge required"/>

					</div>
				</td>
			</tr>

			<tr>
				<td>
					<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>活动开始日期：</label>
					<div class="controls">
						<input name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
							   value="<fmt:formatDate value="${ccmReligionActivity.beginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>

					</div>
				</td>
				<td>
					<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>活动结束日期：</label>
					<div class="controls">
						<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
							   value="<fmt:formatDate value="${ccmReligionActivity.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>

					</div>
				</td>
			</tr>

			<tr>
				<td>
					<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>活动负责人：</label>
					<div class="controls">
						<form:input path="head" htmlEscape="false" maxlength="16" class="input-xlarge required"/>

					</div>
				</td>
				<td>
					<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>负责人身份证号码：</label>
					<div class="controls">
						<form:input path="headCard" htmlEscape="false" maxlength="32" class="input-xlarge ident1 card required"/>

					</div>
				</td>
			</tr>

			<tr>
				<td>
					<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>负责人联系方式：</label>
					<div class="controls">
						<form:input path="headPhone" htmlEscape="false" maxlength="16" class="input-xlarge telephone0 phone required"/>

					</div>
				</td>
				<td>
					<label class="control-label">活动参加人数：</label>
					<div class="controls">
						<form:input path="number" htmlEscape="false" maxlength="5" class="input-xlarge number digits"/>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<label class="control-label">活动规模：</label>
					<div class="controls">
						<form:select path="scale" class="input-xlarge">
							<form:option value="" label="无" />
							<form:options items="${fns:getDictList('ccm_activity_scale')}"
										  itemLabel="label" itemValue="value" htmlEscape="false"
										  class="required" />
						</form:select>
					</div>
				</td>
				<td>
					<label class="control-label">活动类型：</label>
					<div class="controls">
						<form:select path="type" class="input-xlarge">
							<form:option value="" label="无" />
							<form:options items="${fns:getDictList('ccm_activity_type')}"
										  itemLabel="label" itemValue="value" htmlEscape="false"
										  class="required" />
						</form:select>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>活动地点：</label>
					<div class="controls">
						<form:input path="address" htmlEscape="false" maxlength="64" class="input-xlarge required"/>

					</div>
				</td>
			</tr>

			<tr>
				<td><label class="control-label">备注：</label>
					<div class="controls">
						<form:textarea path="remarks"
									   htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge " />
					</div></td>
			</tr>

		</table>

		<div class="form-actions">
			<shiro:hasPermission name="religion:ccmReligionActivity:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>