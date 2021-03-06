<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>公告管理</title>
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
	<link href="${ctxStatic}/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
</head>
<body>
<%--	<ul class="nav nav-tabs">--%>
<%--		<li><a style="text-align:center" href="${ctx}/work/ccmWorkNotice/">数据列表</a></li>--%>
<%--		<li class="active"><a class="nav-head" href="${ctx}/work/ccmWorkNotice/form?id=${ccmWorkNotice.id}">数据<shiro:hasPermission name="work:ccmWorkNotice:edit">${not empty ccmWorkNotice.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="work:ccmWorkNotice:edit">查看</shiro:lacksPermission></a></li>--%>
<%--	</ul>--%>
	<form:form id="inputForm" modelAttribute="ccmWorkNotice" action="${ctx}/work/ccmWorkNotice/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group" style="padding-top: 8px">
			<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-xlarge required disabled " disabled="true"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>时间：</label>
			<div class="controls">
				<input name="datas" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required" disabled="true"
					value="<fmt:formatDate value="${ccmWorkNotice.datas}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="30" maxlength="1000"  class="input-xxlarge " disabled="true"/>
				<sys:ckeditor uploadPath="/work/ccmWorkNotice" replace="content" height="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge " disabled="true"/>
			</div>
		</div>
		<div class="form-actions">
<%--			<c:if test="${userSelfId eq ccmWorkNotice.createBy.id or userSelfId eq '1'}">--%>
<%--				<shiro:hasPermission name="work:ccmWorkNotice:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>--%>
<%--			</c:if>--%>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>