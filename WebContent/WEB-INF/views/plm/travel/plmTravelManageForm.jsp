<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>出差申请表单管理</title>
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
				jQuery.validator.methods.compareDate = function(value, element, param) {
							     var startDate = $(param).val();//补全yyyy-MM-dd HH:mm:ss格式
							     				    									    
							     var date1 = new Date(Date.parse(startDate.replace(/\-/g,"/")));
							     var date2 = new Date(Date.parse(value.replace(/\-/g,"/")));
							     return date1 < date2;
							 };
			 $('#btnSubmit').click(function(){
					$('#inputForm').submit();
				});
			$("#inputForm").validate({
				 rules:{
		                "fldBdt":{
		                    required: true
		                },
		                "fldEdt": {
		                    required: true,
		                    compareDate: "#fldBdt"
		                   
		                }
		            },
		            messages:{
		                "fldBdt":{
		                    required: "出发时间不能为空"
		                },
		                "fldEdt":{
		                    required: "返回时间不能为空",
		                    compareDate: "返回时间必须大于出发时间!"
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
					
					/* confirmx("确定要撤销申请吗？",function(){ */
						$('#flag').val('no');
						$("#inputForm").attr("action","${ctx}/travel/plmTravelManage/apply");
						$("#inputForm").submit();
					/* }); */
				});
			$("#btnSubmit").on("click", function(){
				$("#inputForm").attr("action","${ctx}/travel/plmTravelManage/save");
				$("#inputForm").submit();
			});
			$("#btnApply").on("click", function(){
				confirmx("提交申请后无法修改申请信息",function(){
					$('#flag').val('yes');
					$("#inputForm").attr("action","${ctx}/travel/plmTravelManage/apply");
					$("#inputForm").submit();
				});
			});
		});
	</script>
</head>
<body>
	<form:form target="_parent" id="inputForm" modelAttribute="plmTravelManage" action="" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="plmAct.id"/>
		<form:hidden path="plmAct.title"/>
		<form:hidden path="plmAct.tableName"/>
		<form:hidden path="plmAct.tableId"/>
		<form:hidden path="plmAct.formUrl"/>	
		
		<form:hidden path="fldApplicant.id"/>
		<form:hidden path="fldDept.id"/>
		<form:hidden path="procInsId"/>
		<form:hidden path="act.taskId" />
		<form:hidden path="act.taskName" />
		<form:hidden path="act.taskDefKey" />
		<form:hidden path="act.procInsId" />
		<form:hidden path="act.procDefId" />
		<form:hidden id="flag" path="act.flag" />
		<sys:message content="${message}"/>		
		<h2>出差申请单</h2>
		<table id="tabletop" class="table">
			<tr>
				<td class="tabletop" colspan="2">申请编号(系统生成):&nbsp;&nbsp; &nbsp;&nbsp;<span>${plmTravelManage.code}</span>&nbsp;&nbsp; &nbsp;&nbsp;</td>
				<td class="tabletop" colspan="2">申请人:&nbsp;&nbsp; &nbsp;&nbsp;<span>${plmTravelManage.fldApplicant.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class="tabletop" colspan="2">所属部门: &nbsp;&nbsp; &nbsp;&nbsp;<span>${plmTravelManage.fldDept.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class="tabletop" colspan="2">申请日期<span class="help-inline"><font color="red">*</font> </span>：<input name="fldDt" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${plmTravelManage.fldDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/></td>
			</tr>
		</table>
		<table id="table" class="table table-condensed">
			<tr>
				<td class="trtop" colspan="2">主题<span class="help-inline"><font color="red">*</font></span></td>
				<td colspan="6"><form:input path="fldSubject" htmlEscape="false" maxlength="256" class="input-xlarge required"/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="2">目的地<span class="help-inline"><font color="red">*</font> </span></td>
				<td colspan="2"><form:input path="fldDest" htmlEscape="false" maxlength="256" class="input-xlarge required"/></td>
				<td class="trtop" colspan="2">交通工具</td>
				<td colspan="2"><form:input path="fldTransport" htmlEscape="false" maxlength="64" class="input-xlarge "/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="2">出发时间<span class="help-inline"><font color="red">*</font> </span></td>
				<td colspan="2"><input name="fldBdt" id="fldBdt" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${plmTravelManage.fldBdt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/></td>
				<td class="trtop" colspan="2">返回时间<span class="help-inline"><font color="red">*</font> </span></td>
				<td colspan="2"><input name="fldEdt" id="fldEdt" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${plmTravelManage.fldEdt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="2">出差天数(天)</td>
				<td colspan="2"><form:input path="fldDays" htmlEscape="false" maxlength="3" class="input-xlarge  digits"/></td>
				<td class="trtop" colspan="2">借款总额(元)</td>
				<td colspan="2"><form:input path="fldLoan" htmlEscape="false" maxlength="6" class="input-xlarge  number"/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="2">出差路线</td>
				<td colspan="6"><form:input path="fldRoute" htmlEscape="false" maxlength="256" class="input-xlarge "/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="2">出差事由</td>
				<td colspan="6"><form:textarea path="fldReason" htmlEscape="false" rows="4" maxlength="512" class="input-xxlarge "/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="2">备注信息</td>
				<td colspan="6"><form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/></td>
			</tr>
			<tr>
				<td class="trtop" colspan="2" style="width: 20%">是否督办</td>
				<td id="isSubTd" colspan="6">
					<form:radiobuttons path="plmAct.isSup" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
				</td>
				<td class="trtop isSup" colspan="2" style="width: 20%">督办人</td>
				<td class="isSup" colspan="2" style="width: 30%">
					<sys:treeselect id="supExe" name="plmAct.supExe.id" value="${plmTravelManage.plmAct.supExe.id}" labelName="plmAct.supExe.name" labelValue="${plmTravelManage.plmAct.supExe.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true" isAll="true"/>
				</td>
			</tr>		
			<tr class="isSup">
				<td class="trtop" colspan="2">督办明细</td>
				<td colspan="6">
					<form:textarea path="plmAct.supDetail" htmlEscape="false" rows="4" maxlength="256" class="input-xxlarge "/>
				</td>
			</tr>			
			<c:if test="${not empty plmTravelManage.procInsId}">
				<act:histoicTable procInsId="${plmTravelManage.procInsId}" colspan="6" titleColspan="2"/>
			</c:if>
			<c:if test="${not empty plmTravelManage.procInsId}">
				<tr>
					<td class="trtop" colspan="2">修改备注</td>
					<td colspan="6">
					   <form:textarea path="act.comment" htmlEscape="false" rows="5" maxlength="255" class="input-xxlarge "/>
					</td>				
				</tr>			
			</c:if>
			<tr>
				<td class="trtop" colspan="2">附件</td>
				<td colspan="6">
					<form:hidden id="fldAccessory" path="fldAccessory" htmlEscape="false" maxlength="256" class="input-xlarge"/>
					<sys:ckfinder input="fldAccessory" type="files" uploadPath="/travel/plmTravelManage" selectMultiple="false"/>
				</td>
			</tr>
		</table>
		<div class="form-actions">
			
			<a id="btnApply" class="btn btn-primary" href="javascript:;"><i class="iconfont icon-caozuotubiao-jiluxinxi"></i>提交申请</a>&nbsp;
			<c:if test="${ empty plmTravelManage.procInsId}">
			<a id="btnSubmit" class="btn btn-primary" href="javascript:;"><i class="icon-ok"></i>保存</a>&nbsp;
			</c:if>
			<c:if test="${not empty plmTravelManage.procInsId}">
				<a id="btnCancel" class="btn btn-primary" href="javascript:;"><i class="icon-minus-sign"></i>作废</a>&nbsp;
			</c:if>
		
			<c:if test="${not empty plmTravelManage.id}">
			<a id="btnCancel" class="btn" href="javascript:;" onclick="history.go(-1)" ><i class="icon-reply"></i>返回</a>
			</c:if>
			<c:if test="${empty plmTravelManage.id}">
			<a id="btnCancelf" class="btn btn-primary" href="javascript:;" onclick="parent.layer.closeAll();" ><i class="icon-remove-circle"></i>关闭</a>
			</c:if>
		</div>
	</form:form>
</body>
</html>