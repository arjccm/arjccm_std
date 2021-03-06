<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>评分规则定义管理</title>
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
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/question/pbsQuestionRuleitem/">评分规则定义列表</a></li>
		<li class="active"><a href="${ctx}/question/pbsQuestionRuleitem/form?id=${pbsQuestionRuleitem.id}">评分规则定义<shiro:hasPermission name="question:pbsQuestionRuleitem:edit">${not empty pbsQuestionRuleitem.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="question:pbsQuestionRuleitem:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="pbsQuestionRuleitem" action="${ctx}/question/pbsQuestionRuleitem/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label"><font color="red">*&nbsp;</font>评分规则名称：</label>
			<div class="controls">
				<form:input path="sparentid" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">试题类型：</label>
			<div class="controls">
				<form:input path="sType" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label"><font color="red">*&nbsp;</font>试题类型：</label>
			<div class="controls">
			<form:select path="stype" class="input-xlarge ">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('exambelongtype')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">对比方式：</label>
			<div class="controls">
				<form:input path="scompare" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">判断代码语言：</label>
			<div class="controls">
				<form:input path="scodetype" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">脚本内容：</label>
			<div class="controls">
				<form:input path="scodecontent" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">判断值：</label>
			<div class="controls">
				<form:input path="sjudgeval" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><font color="red">*&nbsp;</font>赋分比例：</label>
			<div class="controls">
				<form:input path="ival" htmlEscape="false" maxlength="11" class="input-xlarge number required" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">展示的图片：</label>
			<div class="controls">
				<form:hidden id="surl" path="surl" htmlEscape="false" maxlength="500" class="input-xlarge"/>
				<sys:ckfinder input="surl" type="files" uploadPath="/question/pbsQuestionRuleitem" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="question:pbsQuestionRuleitem:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>