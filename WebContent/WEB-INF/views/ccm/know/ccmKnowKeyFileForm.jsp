<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>重要文件管理</title>
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
		<li><a style="text-align:center" href="${ctx}/know/ccmKnowKeyFile/">数据列表</a></li>
		<li class="active"><a  class="nav-head"href="${ctx}/know/ccmKnowKeyFile/form?id=${ccmKnowKeyFile.id}">数据<shiro:hasPermission name="know:ccmKnowKeyFile:edit">${not empty ccmKnowKeyFile.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="know:ccmKnowKeyFile:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="ccmKnowKeyFile" action="${ctx}/know/ccmKnowKeyFile/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table>
			<tr>
				<td><div class="control-group" style="padding-top: 8px">
					<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>文件名称：</label>
					<div class="controls">
						<form:input path="name" htmlEscape="false" maxlength="64" class="input-xlarge required"/>

					</div>
				</div>	</td>
				<td><div class="control-group">
					<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>文件类型：</label>
					<div class="controls">
						<form:select path="type" class="input-xlarge ">
							<form:options items="${fns:getDictList('ccm_know_key_file_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>

					</div>
				</div></td>
			</tr>
			<tr>
				<td><div class="control-group">
					<label class="control-label">摘要：</label>
					<div class="controls">
						<form:textarea path="abstracts" htmlEscape="false" rows="4" maxlength="256" class="input-xxlarge "/>
					</div>
				</div></td>
				<td><div class="control-group">
					<label class="control-label">备注信息：</label>
					<div class="controls">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
					</div>
				</div></td>
			</tr>
			<tr>
				<td><div class="control-group">
					<label class="control-label">附件：</label>
					<div class="controls">
						<form:hidden id="file" path="file" htmlEscape="false" maxlength="256" class="input-xlarge"/>
						<sys:ckfinder input="file" type="files" uploadPath="/know/ccmKnowKeyFile" selectMultiple="true"/>
					</div>
				</div></td>
			</tr>



		</table>
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="30" maxlength="2000" class="input-xxlarge "/>
				<sys:ckeditor uploadPath="/know/ccmKnowKeyFile" replace="content" height="200"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="know:ccmKnowKeyFile:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</div>
</body>
</html>