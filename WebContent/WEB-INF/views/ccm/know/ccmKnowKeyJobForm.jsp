<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>专项工作管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					$("#btnSubmit").attr("disabled", true);
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#btnSubmit").removeAttr('disabled');
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
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li><a style="text-align:center" href="${ctx}/know/ccmKnowKeyJob/">数据列表</a></li>
		<li class="active"><a class="nav-head" href="${ctx}/know/ccmKnowKeyJob/form?id=${ccmKnowKeyJob.id}">数据<shiro:hasPermission name="know:ccmKnowKeyJob:edit">${not empty ccmKnowKeyJob.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="know:ccmKnowKeyJob:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="ccmKnowKeyJob" action="${ctx}/know/ccmKnowKeyJob/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table>
			<tr>
				<td>
					<div class="control-group" style="padding-top: 8px">
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>专项名称：</label>
						<div class="controls">
							<form:input path="name" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>地点：</label>
						<div class="controls">
							<form:input path="address" htmlEscape="false" maxlength="256" class="input-xlarge required"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>开始时间：</label>
						<div class="controls">
							<input name="timeStart" id="timeStart" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
								   value="<fmt:formatDate value="${ccmKnowKeyJob.timeStart}" pattern="yyyy-MM-dd"/>"
								   onclick="WdatePicker({maxDate: '#F{$dp.$D(\'timeEnd\')}',dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">结束时间：</label>
						<div class="controls">
							<input name="timeEnd" id="timeEnd" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
								   value="<fmt:formatDate value="${ccmKnowKeyJob.timeEnd}" pattern="yyyy-MM-dd"/>"
								   onclick="WdatePicker({minDate:'#F{$dp.$D(\'timeStart\')}',dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">专项工作计划：</label>
						<div class="controls">
							<form:textarea path="plan" htmlEscape="false" rows="4" maxlength="512" class="input-xxlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">专项工作简介：</label>
						<div class="controls">
							<form:textarea path="abstracts" htmlEscape="false" rows="4" maxlength="256" class="input-xxlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>

					<div class="control-group">
						<label class="control-label">备注信息：</label>
						<div class="controls">
							<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">总结：</label>
						<div class="controls">
							<form:textarea path="summarize" htmlEscape="false" rows="4" maxlength="512" class="input-xxlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">附件：</label>
						<div class="controls">
							<form:hidden id="file" path="file" htmlEscape="false" maxlength="256" class="input-xlarge"/>
							<sys:ckfinder input="file" type="files" uploadPath="/know/ccmKnowKeyJob" selectMultiple="true"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
					<label class="control-label">发起部门：</label>
					<div class="controls">
						<sys:treeselect id="office" name="office.id" value="${ccmKnowKeyJob.office.id}" labelName="office.name" labelValue="${ccmKnowKeyJob.office.name}"
										title="部门" url="/sys/office/treeData?type=2" cssClass="" allowClear="true" notAllowSelectParent="fasle"/>
					</div>
				</div>

				</td>

			</tr>
		</table>
		<div class="control-group">
			<label class="control-label">专项工作成果：</label>
			<div class="controls">
				<form:textarea path="achievement" htmlEscape="false" rows="30" maxlength="1024" class="input-xxlarge "/>
				<sys:ckeditor uploadPath="/know/ccmKnowKeyJob" replace="achievement" height="200"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="know:ccmKnowKeyJob:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</div>
</body>
</html>