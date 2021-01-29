<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>重点区域管理</title>
	<link rel="stylesheet" href="${ctxStatic}/ccm/event/css/fishBonePop.css" />
	<script type="text/javascript" src="${ctxStatic}/ccm/event/js/fishBonePop.js"></script>
	<script type="text/javascript" src="${ctxStatic}/ccm/event/js/jquery.SuperSlide.2.1.1.js"></script>
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
        function saveForm() {
            var area = $("#area");
            var html1 = '<label for="area" class="error">必选字段<label>';
            if (area.length != 0) {
                $("#showArea").html("*");
            } else {
                $("#showArea").html(html1);
            }
        }
        function ThisLayerDialog(src, title, height, width) {
            parent.drawForm = parent.layer.open({
                type: 2,
                title: title,
                area: [height, width],
                fixed: true, //固定
                maxmin: false,
                /*   btn: ['关闭'], //可以无限个按钮 */
                content: src,
                zIndex:'10',
                cancel: function () {
                    //防止取消和删除效果一样
                    window.isCancel = true;
                },
                end: function () {
                    if (!window.isCancel) {
                        $("#areaPoint")[0].value = parent.areaPoint;
                        parent.areaPoint = null;
                        $("#areaMap")[0].value = parent.areaMap;
                        parent.areaMap = null;
                    }
                    window.isCancel = null;
                }
            });
        }
	</script>
	<link href="${ctxStatic}/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="back-list clearfix">
	<ul class="nav nav-tabs hide1">
		<li><a href="${ctx}/org/ccmImportArea/">重点区域列表</a></li>
		<li class="active"><a href="${ctx}/org/ccmImportArea/form?id=${ccmImportArea.id}">重点区域<shiro:hasPermission name="org:ccmImportArea:edit">${not empty ccmImportArea.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="org:ccmImportArea:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="ccmImportArea" action="${ctx}/org/ccmImportArea/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">重点区域名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属区域：</label>
			<div class="controls">
				<sys:treeselect id="area" name="area.id" value="${ccmImportArea.area.id}" labelName="area.name" labelValue="${ccmImportArea.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="required" allowClear="true" notAllowSelectParent="false"/>
				<span class="help-inline" id="showArea"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">重点区域概述：</label>
			<div class="controls">
				<form:textarea path="areaDescription" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">区域图：</label>
			<div class="controls">
				<form:input path="areaMap" readonly="true" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">中心点：</label>
			<div class="controls">
				<form:input path="areaPoint" readonly="true" htmlEscape="false" maxlength="40" class="input-xlarge required"/>
				<a onclick="ThisLayerDialog('${ctx}/event/ccmEventIncident/drawForm?areaMap='+$('#areaMap').val()+'&areaPoint='+$('#areaPoint').val(), '标注', '1100px', '700px');"
				   class="btn hide1 btn-primary">标 注</a>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="org:ccmImportArea:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" onclick="saveForm()" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</div>
</body>
</html>