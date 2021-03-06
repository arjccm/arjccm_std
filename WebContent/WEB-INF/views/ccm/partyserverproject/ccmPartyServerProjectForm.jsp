<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>服务项目管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			//关闭弹框事件
			$('#btnCancel').click(function() {
				parent.layer.close(parent.layerIndex);
			})
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
		<%--<li><a href="${ctx}/partyserverproject/ccmPartyServerProject/">服务项目管理列表</a></li>
		<li class="active"><a href="${ctx}/partyserverproject/ccmPartyServerProject/form?id=${ccmPartyServerProject.id}">服务项目管理<shiro:hasPermission name="partyserverproject:ccmPartyServerProject:edit">${not empty ccmPartyServerProject.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="partyserverproject:ccmPartyServerProject:edit">查看</shiro:lacksPermission></a></li>--%>
	</ul>
	<form:form id="inputForm" modelAttribute="ccmPartyServerProject" action="${ctx}/partyserverproject/ccmPartyServerProject/save" method="post" class="form-horizontal">
	<div>
			<form:hidden path="id"/>
			<sys:message content="${message}"/>
		<table id="PartyPersonDetailTable" border="1px" style="border-color: #CCCCCC; border: 1px solid #CCCCCC; padding: 10px; width: 100%;">
			<tr>
				<td style="padding: 8px;border: 1px dashed #CCCCCC"  colspan="2">
					<div>
						<label class="control-label">项目名称：</label>
						<div class="controls">
							<form:input path="name" htmlEscape="false" maxlength="100" class="input-xlarge required" style="    width: 650px;"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="padding: 8px;border: 1px dashed #CCCCCC" >
					<div>
						<label class="control-label">项目创建时间：</label>
						<div class="controls">
							<input name="projectCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
								   value="<fmt:formatDate value="${ccmPartyServerProject.projectCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</td>
				<td style="padding: 8px;border: 1px dashed #CCCCCC" >
					<div>
						<label class="control-label">认领数：</label>
						<div class="controls">
							<form:input path="clailNum" htmlEscape="false" maxlength="10" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</td>
			</tr>
			<tr>

				<td style="padding: 8px;border: 1px dashed #CCCCCC" >
					<div>
						<label class="control-label">负责人：</label>
						<div class="controls">
							<form:input path="userId" htmlEscape="false" maxlength="150" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</td>
				<td style="padding: 8px;border: 1px dashed #CCCCCC" >
					<div>
						<label class="control-label">负责人联系电话：</label>
						<div class="controls">
							<form:input path="telphone" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</td>
			</tr><tr>

				<td style="padding: 8px;border: 1px dashed #CCCCCC" >
					<div>
						<label class="control-label">联系人：</label>
						<div class="controls">
							<form:input path="relaName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</td>
			<td style="padding: 8px;border: 1px dashed #CCCCCC" >
				<div>
					<label class="control-label">联系人电话：</label>
					<div class="controls">
						<form:input path="relaTelphone" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
			</td>
			</tr>
			<tr>
				<td style="padding: 8px;border: 1px dashed #CCCCCC" colspan="2" style="    width: 650px;">
					<div>
						<label class="control-label">所属社区：</label>
						<div class="controls">
							<sys:treeselect id="community" name="community.id" value="${ccmPartyServerProject.community.id}" labelName="community.name" labelValue="${ccmPartyServerProject.community.name}"
											title="区域" url="/sys/area/treeData" cssClass="required" allowClear="true" notAllowSelectParent="true"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="padding: 8px;border: 1px dashed #CCCCCC"  colspan="2" style="    width: 650px;">
					<div>
						<label class="control-label">内容：</label>
						<div class="controls">
							<form:textarea path="content" htmlEscape="false" rows="4" class="input-xxlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="padding: 8px;border: 1px dashed #CCCCCC" colspan="2" style="    width: 650px;" >
					<div>
						<label class="control-label">备注：</label>
						<div class="controls">
							<form:textarea path="remarks" htmlEscape="false" rows="4" class="input-xxlarge "/>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>







		<div class="form-actions">
			<shiro:hasPermission name="partyserverproject:ccmPartyServerProject:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn btn-danger" type="button" value="关 闭"/>
		</div>
	</form:form>
</body>
</html>