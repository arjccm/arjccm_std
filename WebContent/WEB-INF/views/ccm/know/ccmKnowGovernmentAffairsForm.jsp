<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>民政事务管理</title>
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
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li><a style="text-align:center" href="${ctx}/know/ccmKnowGovernmentAffairs/">数据列表</a></li>
		<li class="active"><a class="nav-head" href="${ctx}/know/ccmKnowGovernmentAffairs/form?id=${ccmKnowGovernmentAffairs.id}">数据<shiro:hasPermission name="know:ccmKnowGovernmentAffairs:edit">${not empty ccmKnowGovernmentAffairs.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="know:ccmKnowGovernmentAffairs:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="ccmKnowGovernmentAffairs" action="${ctx}/know/ccmKnowGovernmentAffairs/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>

		<table>
			<tr>
				<td>
					<div class="control-group" style="padding-top: 8px">
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>日期：</label>
						<div class="controls">
							<input name="datas" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
								   value="<fmt:formatDate value="${ccmKnowGovernmentAffairs.datas}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>

						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>类型：</label>
						<div class="controls">
							<form:select path="type" class="input-xlarge required">
								<form:options items="${fns:getDictList('ccm_know_government_affairs_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>

						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>简介：</label>
						<div class="controls">
							<form:textarea path="name" htmlEscape="false" rows="2" maxlength="100" class="input-xxlarge required"/>

						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">详情：</label>
						<div class="controls">
							<form:textarea path="details" htmlEscape="false" rows="3" maxlength="1000" class="input-xxlarge "/>
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
						<label class="control-label">附件：</label>
						<div class="controls">
							<form:hidden id="file" path="file" htmlEscape="false" maxlength="256" class="input-xlarge"/>
							<sys:ckfinder input="file" type="files" uploadPath="/know/ccmKnowGovernmentAffairs" selectMultiple="true"/>
						</div>
					</div>
				</td>
			</tr>

		</table>
		<div class="form-actions">
			<shiro:hasPermission name="know:ccmKnowGovernmentAffairs:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</div>
</body>
</html>