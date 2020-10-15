<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>领导请示管理</title>
	<meta name="decorator" content="default"/>
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
	<link href="${ctxStatic}/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/ask/ccmAskLeader/?type=2">数据列表</a></li>
		<li class="active"><a href="${ctx}/ask/ccmAskLeader/reply?id=${ccmAskLeader.id}">数据回复</a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="ccmAskLeader" action="${ctx}/ask/ccmAskLeader/save?type=2" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">
				<span class="help-inline"><font color="red">*</font> </span>提交人：
			</label>
			<div class="controls">
				<form:input path="createBy.name" htmlEscape="false" maxlength="512" class="input-xlarge required" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">
				<span class="help-inline"><font color="red">*</font> </span>请示标题：
			</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="512" class="input-xlarge required" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">请示内容：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="30" maxlength="2048" class="input-xxlarge " readonly="true"/>
				<sys:ckeditor uploadPath="/ask/ccmAskLeader" replace="content" height="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">
				<span class="help-inline"><font color="red">*</font> </span>回复：
			</label>
			<div class="controls">
				<form:textarea path="reply" htmlEscape="false" rows="4" maxlength="1024" class="input-xxlarge required"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="ask:ccmAskLeader:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>