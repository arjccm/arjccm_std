<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>移动设备管理管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
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
<div class="back-list clearfix">
    <ul class="nav nav-tabs">
        <li><a href="${ctx}/ccmsys/ccmMobileDevice/list2">数据列表</a></li>
        <li class="active"><a href="${ctx}/ccmsys/ccmMobileDevice/form2?id=${ccmMobileDevice.id}">数据<shiro:hasPermission
                name="ccmsys:ccmMobileDevice:edit">${not empty ccmMobileDevice.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
                name="ccmsys:ccmMobileDevice:edit">查看</shiro:lacksPermission></a></li>
    </ul>
    <form:form id="inputForm" modelAttribute="ccmMobileDevice" action="${ctx}/ccmsys/ccmMobileDevice/save2"
               method="post" class="form-horizontal">
        <form:hidden path="id"/>
        <sys:message content="${message}"/>
        <div class="control-group">
            <label class="control-label">设备唯一标识码：</label>
            <div class="controls">
                <form:input path="deviceId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
                <span class="help-inline"><font color="red">*</font> </span>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">授权状态：</label>
            <div class="controls">
                <form:select path="isVariable" class="input-xlarge ">
                    <form:option value="" label=""/>
                    <form:options items="${fns:getDictList('ccm_mobile_device_var')}" itemLabel="label"
                                  itemValue="value" htmlEscape="false"/>
                </form:select>
            </div>
        </div>
        <%--<div class="control-group">--%>
        <%--<label class="control-label">姓名：</label>--%>
        <%--<div class="controls">--%>
        <%--<sys:treeselect id="vCcmTeam" name="vCcmTeam.id" value="${ccmMobileDevice.vCcmTeam.id}" labelName="vCcmTeam.name" labelValue="${ccmMobileDevice.vCcmTeam.name}"--%>
        <%--title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>--%>
        <%--</div>--%>
        <%--</div>--%>

        <div class="control-group">
            <label class="control-label">重点人员：</label>
            <div class="controls">
                <sys:treeselect id="vSpecialPeople" name="vSpecialPeople.id"
                                value="${ccmMobileDevice.vSpecialPeople.id}" labelName="vSpecialPeople.name"
                                labelValue="${ccmMobileDevice.vSpecialPeople.name}"
                                title="用户" url="/pop/ccmPeople/special" cssClass="" allowClear="true"
                                notAllowSelectParent="true"/>
            </div>
        </div>

        <%--<div class="control-group">--%>
        <%--<label class="control-label">应用类型：</label>--%>
        <%--<div class="controls">--%>
        <%--<form:select path="useType" class="input-xlarge ">--%>
        <%--<form:option value="" label=""/>--%>
        <%--<form:options items="${fns:getDictList('mobile_user_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
        <%--</form:select>--%>
        <%--</div>--%>
        <%--</div>--%>
        <div class="control-group">
            <label class="control-label">电子围栏：</label>
            <div class="controls">
                <sys:treeselect id="elecFenceInfo" name="elecFenceInfo.id" value="${ccmMobileDevice.elecFenceInfo.id}"
                                labelName="elecFenceInfo.fenceName"
                                labelValue="${ccmMobileDevice.elecFenceInfo.fenceName}"
                                title="电子围栏" url="/fence/ccmElectronicFence/treeElecFence" cssClass="" allowClear="true"
                                notAllowSelectParent="true"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">最后一次使用位置：</label>
            <div class="controls">
                <form:input path="areaPoint" htmlEscape="false" class="input-xlarge " readonly="true"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">图标：</label>
            <div class="controls">
                <form:input path="icon" htmlEscape="false" maxlength="255" class="input-xlarge "/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">备注信息：</label>
            <div class="controls">
                <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
            </div>
        </div>
        <div class="form-actions">
            <shiro:hasPermission name="ccmsys:ccmMobileDevice:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                           type="submit"
                                                                           value="保 存"/>&nbsp;</shiro:hasPermission>
            <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
        </div>
    </form:form>
</div>
</body>
</html>