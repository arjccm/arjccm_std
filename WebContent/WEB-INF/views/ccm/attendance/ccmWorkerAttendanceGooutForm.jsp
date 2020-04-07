<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>社工考勤登记管理</title>
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
		//计算天数
		function startTime(){
			var strTim = $("#attendanceBegin").val()
			strTim =  strTim.replace(new RegExp("-","gm"),"/");
			var startHs = (new Date(strTim)).getTime();

			var endTim = $("#attendanceEnd").val()
			endTim =  endTim.replace(new RegExp("-","gm"),"/");
			var sendHs = (new Date(endTim)).getTime();
			$("#attendanceEnd").blur()
			var dayHs = sendHs -startHs
			var days = Math.floor(dayHs/1000/60/60/24);

			console.log(days)

			$("#hqdays").val(days)
			if($("#hqdays").val() == "NaN"){
				$("#hqdays").val("")
			}

		}
		function endTime(){
			var strTim = $("#attendanceBegin").val()
			strTim =  strTim.replace(new RegExp("-","gm"),"/");
			var startHs = (new Date(strTim)).getTime();

			var endTim = $("#attendanceEnd").val()
			endTim =  endTim.replace(new RegExp("-","gm"),"/");
			var sendHs = (new Date(endTim)).getTime();
			$("#attendanceEnd").blur()
			var dayHs = sendHs -startHs
			var days = Math.floor(dayHs/1000/60/60/24);

			console.log(days)

			$("#hqdays").val(days)
			if($("#hqdays").val() == "NaN"){
				$("#hqdays").val("")
			}
		}


	</script>
	<link href="/arjccm/static/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
	<style>
		#s2id_gooutType{
			width: 225px;
		}
	</style>
</head>
<body>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<%-- <li><a href="${ctx}/attendance/ccmWorkerAttendance/gooutlist">外出登记列表</a></li> --%>
		<li class="active"><a class="nav-head" href="${ctx}/attendance/ccmWorkerAttendance/gooutform?id=${ccmWorkerAttendance.id}">外出登记<shiro:hasPermission name="attendance:ccmWorkerAttendance:edit">${not empty ccmWorkerAttendance.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="attendance:ccmWorkerAttendance:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="ccmWorkerAttendance" action="${ctx}/attendance/ccmWorkerAttendance/${not empty ccmWorkerAttendance.id?'gooutupdate':'gooutsave'}" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group" style="padding-top: 8px">
			<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>外出类型：</label>
			<div class="controls">
				<form:select path="gooutType" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('ccm_worker_attendance_goout_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>开始时间：</label>
			<div class="controls">
				<input name="attendanceBegin" id="attendanceBegin"  type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${ccmWorkerAttendance.attendanceBegin}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					   onFocus="WdatePicker({onpicking:startTime(),maxDate: '#F{$dp.$D(\'attendanceEnd\')}',dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>结束时间：</label>
			<div class="controls">
				<input name="attendanceEnd" id="attendanceEnd" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${ccmWorkerAttendance.attendanceEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					   onFocus="WdatePicker({onpicking:endTime(),minDate:'#F{$dp.$D(\'attendanceBegin\')}',dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>天数：</label>
			<div class="controls">
				<form:input path="days" id="hqdays" htmlEscape="false" maxlength="5" class="input-xlarge number required positiveNumber"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>地点：</label>
			<div class="controls">
				<form:input path="address" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>事由：</label>
			<div class="controls">
				<form:input path="cause" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="250" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="attendance:ccmWorkerAttendance:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			${not empty ccmWorkerAttendance.id?'<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/> ':''}
		</div>
	</form:form>
</div>
<script type="text/javascript">
    $(document).ready(
        $(function () {
            var elementsByClassName = window.parent.document.getElementById("LayerDialog");
            if(elementsByClassName!=null&&elementsByClassName!=undefined){

                $(".back-list").css({"box-shadow":"none","background":"none"})
            }
        }))
</script>
</body>
</html>