<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用车申请管理</title>
	<meta name="decorator" content="default"/>
	
	<link type="text/css" href="${ctxStatic}/common/zztable.css" rel="stylesheet">
	<%-- <link type="text/css" href="${ctxStatic}/common/zzformtable.css" rel="stylesheet"> --%>
	<link href="${ctxStatic}/form/css/formTable.css" rel="stylesheet" />
	<script type="text/javascript" src="${ctxStatic}/plm/act/supervise.js"></script> 
 	<script type="text/javascript" src="${ctxStatic}/plm/car/plmCarUseForm.js"></script> 
	<script type="text/javascript">
		$(document).ready(function() {
			$('#btnSubmit').click(function(){
				$('#inputForm').submit();
			});
			$("#inputForm").validate({
				rules: {
					inDate:{
						required:true,
						compareDate:"#outDate"
					}
				},
				messages:{
					inDate:{
						required:"必填信息",
						compareDate:"归还时间不应小于出车时间"
					}					
				},  
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
				$('#flag').val('no');
				$("#inputForm").attr("action","${ctx}/car/apply/plmCarApplyUse/apply");
				$("#inputForm").submit();
			});
			$("#btnSubmit").on("click", function(){
				$("#inputForm").attr("action","${ctx}/car/apply/plmCarApplyUse/save");
				$("#inputForm").submit();
			});
			$("#btnApply").on("click", function(){
				confirmx("提交申请后无法修改申请信息",function(){
					$('#flag').val('yes');
					$("#inputForm").attr("action","${ctx}/car/apply/plmCarApplyUse/apply");
					$("#inputForm").submit();
				});
			});
		});
	</script>	
</head>
<body>
	<form:form  target="_parent" id="inputForm" style="margin: 30px 100px;" modelAttribute="plmCarApplyUse" action="${ctx}/car/apply/plmCarApplyUse/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="plmAct.id"/>
		<form:hidden path="plmAct.title"/>
		<form:hidden path="plmAct.tableName"/>
		<form:hidden path="plmAct.tableId"/>
		<form:hidden path="plmAct.formUrl"/>		
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden id="flag" path="act.flag"/>
		<sys:message content="${message}"/>	
		<h2>用车申请单</h2>	
	    <table id="tabletop" class="table">
			<tr>
				<td class="tabletop" colspan="2">申请人:
					<sys:treeselect id="user" name="user.id" value="${plmCarApplyUse.user.id}" labelName="user.name" labelValue="${plmCarApplyUse.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true" disabled="disabled"/>
				</td>
				<td class="tabletop" colspan="3">所属部门:
					<form:input path="user.office.name" htmlEscape="false"  class="input-xlarge " readonly="true"/>
				</td>
				<td class="tabletop" colspan="3">申请编号:
					<form:input path="title" htmlEscape="false" maxlength="64" class="input-xlarge " readonly="true" placeholder="保存后自动生成"/>
				</td>
			</tr>
		</table>	
		<table id="table" class="table table-condensed">
			<tr>
				<td class="trtop" colspan="2">用车申请事由<font color="red">*</font></td>
				<td colspan="6"><form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge required"/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="2">车辆需求描述<font color="red">*</font></td>
				<td colspan="6"><form:textarea path="carDesc" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge required"/></td>
			</tr>			
			<tr>
				<td class="trtop" colspan="2" style="width: 20%">预选车辆</td>
				<td colspan="2" style="width: 30%"><form:input type="hide" id="carIdsAll" path="car.id" htmlEscape="false" maxlength="64" class="input-xlarge "/></td>
				<td class="trtop" colspan="2" style="width: 20%">预选司机</td>
				<td colspan="2" style="width: 30%"><form:input type="hide" id="driverIdsAll" path="driver.id" htmlEscape="false" maxlength="64" class="input-xlarge "/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="2">出车时间<font color="red">*</font></td>
				<td colspan="2">
					<input id="outDate" name="outDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${plmCarApplyUse.outDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</td>
				<td class="trtop" colspan="2">归还时间<font color="red">*</font></td>
				<td colspan="2"><input id="inDate" name="inDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${plmCarApplyUse.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</td>
			</tr>
			<tr>
				<td class="trtop" colspan="2">乘车人数</td>
				<td colspan="6"><form:input path="num" htmlEscape="false" maxlength="4" class="input-xlarge  digits"/></td>
			</tr>				
			<tr>
				<td class="trtop" colspan="2">是否督办</td>
				<td id="isSubTd" colspan="6">
					<form:radiobuttons path="plmAct.isSup" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
				</td>
				<td class="trtop isSup" colspan="2">督办人</td>
				<td class="isSup" colspan="2">
					<sys:treeselect id="supExe" name="plmAct.supExe.id" value="${plmCarApplyUse.plmAct.supExe.id}" labelName="plmAct.supExe.name" labelValue="${plmCarApplyUse.plmAct.supExe.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true" isAll="true"/>
				</td>
			</tr>		
			<tr class="isSup">
				<td class="trtop" colspan="2">督办明细</td>
				<td colspan="6">
					<form:textarea path="plmAct.supDetail" htmlEscape="false" rows="4" maxlength="256" class="input-xxlarge "/>
				</td>
			</tr>			
			<act:histoicTable procInsId="${plmCarApplyUse.procInsId}" colspan="6" titleColspan="2"/>
		
			<c:if test="${not empty plmCarApplyUse.procInsId}">
				<tr>
					<td class="trtop" colspan="2">修改备注</td>
					<td colspan="6">
					   <form:textarea path="act.comment" htmlEscape="false" rows="5" maxlength="255" class="input-xxlarge "/>
					</td>				
				</tr>
			</c:if>				
		</table>			
		
		<div class="form-actions">
			<a id="btnApply" class="btn btn-primary" href="javascript:;"><i class="icon-print"></i>提交申请</a>&nbsp;
			<c:if test="${ empty plmCarApplyUse.procInsId}">
			<a id="btnSubmit" class="btn btn-primary" href="javascript:;"><i class="icon-ok"></i>保存</a>&nbsp;
			</c:if>
			<c:if test="${not empty plmCarApplyUse.procInsId}">
				<a id="btnCancel" class="btn btn-primary" href="javascript:;"><i class="icon-minus-sign"></i>作废</a>&nbsp;
			</c:if>
			<c:if test="${not empty plmCarApplyUse.id}">
			<a id="btnCancel" class="btn" href="javascript:;" onclick="history.go(-1)" ><i class="icon-reply"></i>返回</a>
			</c:if>
			<c:if test="${empty plmCarApplyUse.id}">
			<a id="btnCancelf" class="btn btn-primary" href="javascript:;" onclick="parent.layer.closeAll();" ><i class="icon-remove-circle"></i>关闭</a>
			</c:if>
		</div>		
	</form:form>
</body>
</html>