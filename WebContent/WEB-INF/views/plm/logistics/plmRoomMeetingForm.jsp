<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>会议室</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/zztable.css" type="text/css"
	rel="stylesheet">
	<!-- 表格试表单css -->
	<link href="${ctxStatic}/common/zzformtable.css" type="text/css" rel="stylesheet">	
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
			$(".trtop").css({
				"width" : "20%"
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a style="width: 140px;text-align:center" href="${ctx}/logistics/plmRoom/?category=01">会议室列表</a></li>
		<li class="active" style="width: 140px"><a class="nav-head" href="${ctx}/logistics/plmRoom/form?id=${plmRoom.id}&category=01">会议室<shiro:hasPermission name="logistics:plmRoom:edit">${not empty plmRoom.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="logistics:plmRoom:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" style="margin: 30px 100px;" modelAttribute="plmRoom" action="${ctx}/logistics/plmRoom/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<input type="hidden" name="category" value="01"/>
		<sys:message content="${message}"/>	
		<%--<h2 style="margin-bottom: 30px;">会议室信息表</h2>	--%>
		<table id="table" style="border-color: #CCCCCC; border: 0px solid #CCCCCC; padding: 10px; width: 100%;border-top-color: white">
			<tr>
				<td style="padding: 10px; border: 0px dashed rgb(204, 204, 204);">
					<div>
						<label class="control-label"><font color="red">*</font>会议室名称：</label>
						<div class="controls">
							<form:input path="subject" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
						</div>
					</div>
				</td>
				<td style="padding: 10px; border: 0px dashed rgb(204, 204, 204);">
					<div>
						<label class="control-label"><font color="red">*</font>座位数：</label>
						<div class="controls">
							<form:input path="seat" htmlEscape="false" maxlength="6" class="input-xlarge required digits"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 10px; border: 0px dashed rgb(204, 204, 204);">
					<div>
						<label class="control-label"><font color="red">*</font>会议室地址：</label>
						<div class="controls">
							<form:input path="address" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="padding: 10px; border: 0px dashed rgb(204, 204, 204);">
					<div>
						<label class="control-label">会议室照片：</label>
						<div class="controls">
							<form:hidden id="picture" path="picture" htmlEscape="false" maxlength="256" class="input-xlarge"/>
							<sys:ckfinder input="picture" type="images" uploadPath="/car/plmCarRepair" selectMultiple="false"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 10px; border: 0px dashed rgb(204, 204, 204);">
					<div>
						<label class="control-label">会议室介绍：</label>
						<div class="controls">
							<form:textarea path="memo" htmlEscape="false" rows="4" maxlength="1000" class="input-xxlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 10px; border: 0px dashed rgb(204, 204, 204);">
					<div>
						<label class="control-label">备注信息：</label>
						<div class="controls">
							<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
						</div>
					</div>
				</td>
			</tr>
		</table>
		
		<div class="form-actions position:fixed">
			<shiro:hasPermission name="logistics:plmRoom:edit"><a id="btnSubmit" class="btn btn-primary" href="javascript:;"><i ></i>保 存</a>&nbsp;</shiro:hasPermission>
			<a id="btnCancel" class="btn" href="javascript:;" onclick="history.go(-1)" ><i ></i>返 回</a>
		</div>
	</form:form>
</body>
</html>