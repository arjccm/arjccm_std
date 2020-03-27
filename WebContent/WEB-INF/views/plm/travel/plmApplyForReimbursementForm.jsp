<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>报销申请管理</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/zztable.css" type="text/css"
	rel="stylesheet">
	<!-- 表格试表单css -->
	<%-- <link href="${ctxStatic}/common/zzformtable.css" type="text/css"
	rel="stylesheet"> --%>
	<link href="${ctxStatic}/form/css/formTable.css" rel="stylesheet" />
		<script type="text/javascript" src="${ctxStatic}/plm/act/supervise.js"></script> 	
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$('#btnSubmit').click(function(){
				$('#inputForm').submit();
			});
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
           $("#btnCancel").on("click", function(){
				
				/* confirmx("确定要撤销申请吗？",function(){ */
					$('#flag').val('no');
					$("#inputForm").attr("action","${ctx}/travel/plmApplyForReimbursement/apply");
					$("#inputForm").submit();
				/* }); */
			});
			$("#btnSubmit").on("click", function(){
				$("#inputForm").attr("action","${ctx}/travel/plmApplyForReimbursement/save");
				$("#inputForm").submit();
			});
			$("#btnApply").on("click", function(){
				confirmx("提交申请后无法修改申请信息",function(){
					$('#flag').val('yes');
					$("#inputForm").attr("action","${ctx}/travel/plmApplyForReimbursement/apply");
					$("#inputForm").submit();
				});
			});
		});
	</script>
</head>
<body>
	<form:form target="_parent" id="inputForm" modelAttribute="plmApplyForReimbursement" action="${ctx}/travel/plmApplyForReimbursement/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="plmAct.id"/>
		<form:hidden path="plmAct.title"/>
		<form:hidden path="plmAct.tableName"/>
		<form:hidden path="plmAct.tableId"/>
		<form:hidden path="plmAct.formUrl"/>
		<form:hidden path="code"/>
		<form:hidden path="applyer.id"/>
		<form:hidden path="department.id"/>
		<form:hidden path="procInsId"/>
		<form:hidden path="act.taskId" />
		<form:hidden path="act.taskName" />
		<form:hidden path="act.taskDefKey" />
		<form:hidden path="act.procInsId" />
		<form:hidden path="act.procDefId" />
		<form:hidden id="flag" path="act.flag" />
		<sys:message content="${message}"/>		
		<h2>报销申请单</h2>
		<table id="tabletop" class="table">
			<tr>
				<td class="tabletop" colspan="2" width="33.33%">申请人<span class="help-inline"><font color="red">*</font> </span>:&nbsp;&nbsp; &nbsp;&nbsp;<span>${plmApplyForReimbursement.applyer.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class="tabletop" colspan="2" width="33.33%">所属部门<span class="help-inline"><font color="red">*</font> </span>: &nbsp;&nbsp; &nbsp;&nbsp;<span>${plmApplyForReimbursement.department.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class="tabletop" colspan="2" width="33.33%">申请编号(系统生成):&nbsp;&nbsp; &nbsp;&nbsp;<span>${plmApplyForReimbursement.code}</span>&nbsp;&nbsp; &nbsp;&nbsp;</td>
			</tr>
		</table>
		<table id="table" class="table table-condensed">
			<tr>
				<td class="trtop" colspan="1">主题<span class="help-inline"><font color="red">*</font></span></td>
				<td colspan="5"><form:input path="title" htmlEscape="false" maxlength="255" class="input-xlarge required"/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="1">报销类型<span class="help-inline"><font color="red">*</font> </span></td>
				<td colspan="1"><form:select path="type" class="input-xlarge required">
					<form:option value="" label="未选择"/>
					<form:options items="${fns:getDictList('reimburse_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select></td>
				<td class="trtop" colspan="1">报销单数<span class="help-inline"><font color="red">*</font> </span></td>
				<td colspan="1"><form:input path="piece" htmlEscape="false" maxlength="2" class="input-xlarge required digits"/></td>
				<td class="trtop" colspan="1">报销总额（元）<span class="help-inline"><font color="red">*</font> </span></td>
				<td colspan="1"><form:input path="sum" maxlength="8" htmlEscape="false" class="input-xlarge required number"/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="1">报销详情<span class="help-inline"><font color="red">*</font> </span></td>
				<td colspan="5"><form:textarea path="detail" htmlEscape="false" rows="4" maxlength="4000" class="input-xxlarge required"/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="1">报销原因<span class="help-inline"><font color="red">*</font> </span></td>
				<td colspan="5"><form:textarea path="cause" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge required"/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="1">备注信息</td>
				<td colspan="5"><form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="1" style="width: 20%">是否督办</td>
				<td id="isSubTd" colspan="6">
					<form:radiobuttons path="plmAct.isSup" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
				</td>
				<td class="trtop isSup" colspan="1" style="width: 20%">督办人</td>
				<td class="isSup" colspan="2" style="width: 30%">
					<sys:treeselect id="supExe" name="plmAct.supExe.id" value="${plmApplyForReimbursement.plmAct.supExe.id}" labelName="plmAct.supExe.name" labelValue="${plmApplyForReimbursement.plmAct.supExe.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true" isAll="true"/>
				</td>
			</tr>		
			<tr class="isSup">
				<td class="trtop" colspan="1">督办明细</td>
				<td colspan="5">
					<form:textarea path="plmAct.supDetail" htmlEscape="false" rows="4" maxlength="256" class="input-xxlarge "/>
				</td>
			</tr>			
			<c:if test="${not empty plmApplyForReimbursement.procInsId}">
				<act:histoicTable procInsId="${plmApplyForReimbursement.procInsId}"  colspan="5" titleColspan="1"/>
			</c:if>
			<c:if test="${not empty plmApplyForReimbursement.procInsId}">
				<tr>
					<td class="trtop" colspan="1">修改备注</td>
					<td colspan="5">
					   <form:textarea path="act.comment" htmlEscape="false" rows="5" maxlength="255" class="input-xxlarge "/>
					</td>				
				</tr>			
			</c:if>
			<tr>
				<td class="trtop" colspan="1">附件</td>
				<td colspan="5">
					<form:hidden id="file" path="file" htmlEscape="false" maxlength="4000" class="input-xlarge"/>
					<sys:ckfinder input="file" type="files" uploadPath="/travel/plmApplyForReimbursement" selectMultiple="false"/>
				</td>
			</tr>
		</table>
		<div class="form-actions">
			
			<a id="btnApply" class="btn btn-primary" href="javascript:;"><i class="iconfont icon-caozuotubiao-jiluxinxi"></i>提交申请</a>&nbsp;
			<c:if test="${ empty plmApplyForReimbursement.procInsId}">
			<a id="btnSubmit" class="btn btn-primary" href="javascript:;"><i class="icon-ok"></i>保存</a>&nbsp;
			</c:if>
			<c:if test="${not empty plmApplyForReimbursement.procInsId}">
				<a id="btnCancel" class="btn btn-primary" href="javascript:;"><i class="icon-minus-sign"></i>作废</a>&nbsp;
			</c:if>
		
			<c:if test="${not empty plmApplyForReimbursement.id}">
			<a id="btnCancel" class="btn" href="javascript:;" onclick="history.go(-1)" ><i class="icon-reply"></i>返回</a>
			</c:if>
			<c:if test="${empty plmApplyForReimbursement.id}">
			<a id="btnCancelf" class="btn btn-primary" href="javascript:;" onclick="parent.layer.closeAll();" ><i class="icon-remove-circle"></i>关闭</a>
			</c:if>
		</div>
	</form:form>
</body>
</html>