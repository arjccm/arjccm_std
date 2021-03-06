<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>值班表管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    $("#btnSubmit").attr("disabled", true);
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#btnSubmit").removeAttr('disabled');
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });

        function saveForm() {
            var start = $("#startDay").val();
            console.info(start);
            var end = $("#endDay").val();
            console.info(end);
            var principalId = $("#principalId").val();
            var html1 = '<label for="" class="error">必填信息 <label>';
            if (principalId.length != 0) {
                $("#show1").html("");
            } else {
                $("#show1").html(html1);
            }
            if (principalId.length != 0) {
                if(!!start && !!end){
                    var startDay = new Date(Date.parse(start.replace(/-/g,  "/")));
                    var endDay = new Date(Date.parse(end.replace(/-/g,  "/")));
                    if(endDay >= startDay){
                        var startYear = startDay.getFullYear();
                        var startMonth = startDay.getMonth()+1;
                        var endYear = endDay.getFullYear();
                        var endMonth = endDay.getMonth()+1;
                        if(startYear==endYear && startMonth==endMonth){
                            $("#inputForm").submit();
                        }else{
                            alert("截止日期与起始日期需在同一个月内！");
                        }
                    }else{
                        alert("截止日期需大于等于起始日期！");
                    }
                }else{
                    $("#inputForm").submit();
                }
            }

        }

        /* var t1 = document.getElementById("beginDatas").value;
        var t2 = document.getElementById("endDatas").value;
        var tm = t1 + '-' + t2;
           $.ajax({
              url:basePath+"/ParamFormatController/getStringParam.shtml",
              data: tm,
              type : 'POST',
              dataType : 'json',
              success:function(data){

              },

           })
        }, */
        /* function time(){
            var t1 = document.getElementById("beginDatas").value;
            var t2 = document.getElementById("endDatas").value;
            var tm = t1 + '-' + t2;
            return tm;
        } */

    </script>
    <link href="${ctxStatic}/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="back-list clearfix">
    <ul class="nav nav-tabs">
        <li><a style="text-align:center" href="${ctx}/work/ccmWorkBeonduty/">数据列表</a></li>
        <li class="active"><a class="nav-head"
                              href="${ctx}/work/ccmWorkBeonduty/form?id=${ccmWorkBeonduty.id}">数据<shiro:hasPermission
                name="work:ccmWorkBeonduty:edit">${not empty ccmWorkBeonduty.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
                name="work:ccmWorkBeonduty:edit">查看</shiro:lacksPermission></a></li>
    </ul>
    <form:form id="inputForm" modelAttribute="ccmWorkBeonduty" action="${ctx}/work/ccmWorkBeonduty/save" method="post"
               class="form-horizontal">
        <form:hidden path="id"/>
        <sys:message content="${message}"/>

        <table>
            <tr>
                <td>
                    <div class="control-group" style="padding-top: 8px">
                        <label class="control-label"><span class="help-inline"><font
                                color="red">*</font> </span>起始日期：</label>
                        <div class="controls">
                            <input name="startDay" id="startDay" type="text" readonly="readonly" maxlength="20"
                                   class="input-medium Wdate required"
                                   value="<fmt:formatDate value="${ccmWorkBeonduty.startDay}" pattern="yyyy-MM-dd"/>"
                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group" style="padding-top: 8px">
                        <label class="control-label"><span class="help-inline"><font
                                color="red">*</font> </span>截止日期：</label>
                        <div class="controls">
                            <input name="endDay" id="endDay" type="text" readonly="readonly" maxlength="20"
                                   class="input-medium Wdate required"
                                   value="<fmt:formatDate value="${ccmWorkBeonduty.endDay}" pattern="yyyy-MM-dd"/>"
                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label"><span class="help-inline"><font color="red">*</font> </span>值班负责人：</label>
                        <div class="controls">
                            <sys:treeselect id="principal" name="principal" value="${ccmWorkBeonduty.principal.id}"
                                            labelName="" labelValue="${ccmWorkBeonduty.principal.name}"
                                            title="用户" url="/sys/office/treeData?type=3" cssClass="required"
                                            allowClear="true" notAllowSelectParent="true"/>
                            <span class="help-inline"><font color="red" id="show1"></font> </span>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">归属部门:</label>
                        <div class="controls">
                            <sys:treeselect id="office" name="office.id"
                                            value="${ccmWorkBeonduty.office.id}" labelName="office.name"
                                            labelValue="${ccmWorkBeonduty.office.name}" title="部门"
                                            url="/sys/office/treeData?type=2" cssClass="required"
                                            notAllowSelectParent="false"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label"><span class="help-inline"><font color="red">*</font> </span>开始时间段：</label>
                        <div class="controls">
                            <input name="beginDatas" id="beginDatas" type="text" readonly="readonly" maxlength="20"
                                   class="input-medium Wdate required"
                                   value="<fmt:formatDate value="${beginDatas}" pattern="HH:mm"/>"
                                   onclick="WdatePicker({dateFmt:'HH:mm',isShowClear:false});"/>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label"><span class="help-inline"><font color="red">*</font> </span>结束时间段：</label>
                        <div class="controls">
                            <input name="endDatas" id="endDatas" type="text" readonly="readonly" maxlength="20"
                                   class="input-medium Wdate required"
                                   value="<fmt:formatDate value="${endDatas}" pattern="HH:mm"/>"
                                   onclick="WdatePicker({dateFmt:'HH:mm',isShowClear:false});"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>

                <td>
                    <div class="control-group">
                        <label class="control-label">值班队伍：</label>
                        <div class="controls">
                            <form:textarea path="principalMans" htmlEscape="false" rows="4" maxlength="1000"
                                           class="input-xxlarge "/>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">备注信息：</label>
                        <div class="controls">
                            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255"
                                           class="input-xxlarge "/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label"><span class="help-inline"><font
                                color="red">*</font> </span>值班地点：</label>
                        <div class="controls">
                            <form:textarea path="adds" htmlEscape="false" rows="4" maxlength="100"
                                           class="input-xxlarge required"/>

                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">工作重点：</label>
                        <div class="controls">
                            <form:textarea path="details" htmlEscape="false" rows="4" maxlength="1000"
                                           class="input-xxlarge "/>
                        </div>
                    </div>
                </td>
            </tr>
        </table>

        <div class="form-actions">
            <shiro:hasPermission name="work:ccmWorkBeonduty:edit">
                <input id="btnSubmit" class="btn btn-primary" onclick="saveForm()" type="button" value="保 存"/>&nbsp;
            </shiro:hasPermission>
            <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
        </div>
    </form:form>
</div>
</body>
</html>