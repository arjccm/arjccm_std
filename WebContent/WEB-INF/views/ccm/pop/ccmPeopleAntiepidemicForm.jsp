<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>人员疫情管理</title>
    <meta name="decorator" content="default"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/jquery-cityselect/main.css" />


    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/jquery/jquery.cookie.js" type="text/javascript"></script>
    <link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'black'}/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'black'}/custom.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/arjim/layui/css/layui.css" type="text/css" rel="stylesheet" />

    <link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link href="${ctxStatic}/bootstrap/checkbox-radio.css" type="text/css" rel="stylesheet" />
    <link href="${ctxStatic}/iconfont/iconfont.css" type="text/css" rel="stylesheet" />
    <!--[if lte IE 7]><link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome-ie7.min.css" type="text/css" rel="stylesheet" /><![endif]-->
    <!--[if lte IE 6]><link href="${ctxStatic}/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->
    <%-- <link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" /> --%>
    <script src="${ctxStatic}/stomp-websocket-master/stomp.js"></script>
    <%-- <script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script> --%>
    <link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.method.js" type="text/javascript"></script>
    <script src="${ctxStatic}/jquery-validation/1.11.1/localization/messages_zh.js" type="text/javascript"></script>
    <link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
    <script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/common/jeesite.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
    <link href="${ctxStatic}/common/menu.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/common/pgwmenu.js" type="text/javascript"></script>
    <link href="${ctxStatic}/bootstrap/bootstrapTable/css/bootstrap-table.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/bootstrap/bootstrapTable/js/bootstrap-table.js" type="text/javascript"></script>
    <script src="${ctxStatic}/bootstrap/bootstrapTable/js/bootstrap-table-zh-CN.js" type="text/javascript"></script>
    <link href="${ctxStatic}/mCustomScrollbar/jquery.mCustomScrollbar.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/mCustomScrollbar/jquery.mCustomScrollbar.js" type="text/javascript"></script>
    <script src="${ctxStatic}/lightbox/js/lightbox.js" type="text/javascript"></script>
    <link href="${ctxStatic}/lightbox/css/lightbox.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/Particleground/Particleground.js" type="text/javascript"></script>
    <script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
    <%-- <%@include file="/WEB-INF/views/include/layUI.jsp" %> --%>

    <%-- <script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.js"></script> --%>
    <script type="text/javascript" src="${ctxStatic}/jquery-cityselect/jquery.cityselect.js"></script>
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

            if($("#getdomicile").val()!="" && $("#getdomicile").val()!=null && $("#getdomicile").val()!=undefined){
                var getdomicile = $("#getdomicile").val().split(",");
                var provval,cityval;
                provval = getdomicile[0];
                if( getdomicile[1]!=""){
                    cityval = getdomicile[1];
                    $("#city").citySelect({
                        prov: provval,
                        city: cityval
                    });
                } else {
                    $("#city").citySelect({
                        prov: provval,
                        nodata:"none"
                    });
                }
            } else {
                $("#city").citySelect({
                    nodata:"none",
                    required:false
                });
            }
        });
    </script>
    <link href="${ctxStatic}/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
    <%--<link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" />--%>
    <%--<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>--%>

</head>
<body>
<div class="back-list clearfix">
<ul class="nav nav-tabs">
    <li><a href="${ctx}/pop/ccmPeopleAntiepidemic/">人员疫情列表</a></li>
    <li class="active"><a href="${ctx}/pop/ccmPeopleAntiepidemic/form?id=${ccmPeopleAntiepidemic.id}">人员疫情<shiro:hasPermission name="pop:ccmPeopleAntiepidemic:edit">${not empty ccmPeopleAntiepidemic.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="pop:ccmPeopleAntiepidemic:edit">查看</shiro:lacksPermission></a></li>
</ul>
<input id="getdomicile" type="hidden" value="${ccmPeopleAntiepidemic.domicile}"/>
<form:form id="inputForm" modelAttribute="ccmPeopleAntiepidemic" action="${ctx}/pop/ccmPeopleAntiepidemic/save" method="post" class="form-horizontal ">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <%-- <div class="control-group">
        <label class="control-label">基站位置：</label>
        <div class="controls">
            <form:input path="telPosion" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div> --%>
    <table id="typeid" border="0px"
           style="border-color: #CCCCCC; border: 0px solid #CCCCCC; padding: 10px; width: 100%">
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">姓名：</label>
                    <div class="controls">
                        <form:input path="name" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <!-- <font color="red" >*</font> -->
                <div class="control-group">
                    <label class="control-label">性别：</label>
                    <div class="controls">
                        <form:radiobuttons path="sex" items="${fns:getDictList('sex')}"
                                           itemLabel="label" itemValue="value" htmlEscape="false" />
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">身份证号：</label>
                    <div class="controls">
                        <form:input path="idNumber" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">户籍地：&nbsp;</label>
                    <div id="city">
                        <select class="prov" name="domicile" style="width: 142px"></select>
                        <select class="city" disabled="disabled" name="domicile" style="width: 142px"></select>
                        <!-- <select class="dist" disabled="disabled"></select>  -->
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">年龄：</label>
                    <div class="controls">
                        <form:input path="age" htmlEscape="false" maxlength="3" class="input-xlarge " />
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">入琼时间：</label>
                    <div class="controls">
                        <input name="comeHainanDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                               value="<fmt:formatDate value="${ccmPeopleAntiepidemic.comeHainanDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">电话号码：</label>
                    <div class="controls">
                        <form:input path="telephone" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">在三亚居住地：</label>
                    <div class="controls">
                        <form:input path="habitation" htmlEscape="false" maxlength="128" class="input-xlarge " placeholder="详情到区、社区、小区、楼栋、单元、房号"/>
                    </div>
                </div>
            </td>
        </tr>



            <%-- <div class="control-group">
                <label class="control-label">离鄂时间：</label>
                <div class="controls">
                    <input name="leaveHubeiDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                        value="<fmt:formatDate value="${ccmPeopleAntiepidemic.leaveHubeiDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                </div>
            </div> --%>
        <tr>

            <%--<td>--%>
                <%--<div class="control-group">--%>
                    <%--<label class="control-label">是否14天以内：</label>--%>
                    <%--<div class="controls">--%>
                        <%--<form:select path="isIn14days" cssStyle="width: 285px">--%>
                            <%--<form:option value="" label="" />--%>
                            <%--<form:options items="${fns:getDictList('is_key_place')}"--%>
                                          <%--itemLabel="label" itemValue="value" htmlEscape="false" />--%>
                        <%--</form:select>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</td>--%>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">来琼乘坐交通工具：</label>
                    <div class="controls">
                        <form:input path="transportation" htmlEscape="false" maxlength="128" class="input-xlarge " placeholder="请输入详细的航班号、车次、车牌号等信息"/>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">同居住人员：</label>
                    <div class="controls">
                        <form:input path="cohabitant" htmlEscape="false" maxlength="128" class="input-xlarge "/>
                    </div>
                </div>
            </td>
        </tr>



            <%--</div>--%>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">是否离岛：</label>
                    <div class="controls">
                        <form:select path="isLeftHainan"  cssStyle="width: 285px">
                            <form:option value="" label="" />
                            <form:options items="${fns:getDictList('is_key_place')}"
                                          itemLabel="label" itemValue="value" htmlEscape="false" />
                        </form:select>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">离岛时间：</label>
                    <div class="controls">
                        <input name="leftDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                               value="<fmt:formatDate value="${ccmPeopleAntiepidemic.leftDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">身体状况：</label>
                    <div class="controls">
                        <form:select path="health" cssStyle="width: 285px">
                            <form:option value="" label="" />
                            <form:options items="${fns:getDictList('sys_ccm_people_health')}"
                                          itemLabel="label" itemValue="value" htmlEscape="false" />
                        </form:select>
                    </div>
                </div>
            </td>
            <td>
                    <%-- <div class="control-group">
                <label class="control-label">有无采取措施：</label>
                <div class="controls">
                    <form:input path="doesTakeSteps" htmlEscape="false" maxlength="2" class="input-xlarge "/>
                </div>
            </div> --%>
                <div class="control-group">
                    <label class="control-label">采取何种措施：</label>
                    <div class="controls">
                        <form:select path="takeSteps" cssStyle="width: 285px">
                            <form:option value="" label="" />
                            <form:options items="${fns:getDictList('sys_ccm_people_takeSteps')}"
                                          itemLabel="label" itemValue="value" htmlEscape="false" />
                        </form:select>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">住院或集中观察地址：</label>
                    <div class="controls">
                        <form:input path="address" htmlEscape="false" maxlength="128" class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">开展网格化服务管理情况：</label>
                    <div class="controls">
                        <form:textarea path="info" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge " placeholder="如xx年xx月xx日登门测量体温“正常”或送口罩或宣传防疫知识。"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">是否移交卫健委：</label>
                    <div class="controls">
                        <%--<form:input path="isTransferHc" htmlEscape="false" maxlength="2" class="input-xlarge "/>--%>
                        <form:select path="isTransferHc"  cssStyle="width: 285px">
                            <form:option value="" label="" />
                            <form:options items="${fns:getDictList('is_key_place')}"
                                          itemLabel="label" itemValue="value" htmlEscape="false" />
                        </form:select>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">手机归属地：</label>
                    <div class="controls">
                        <form:input path="telephoneHome" htmlEscape="false" maxlength="16" class="input-xlarge "/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">下发所属市县：</label>
                    <div class="controls">
                        <form:input path="distributeCity" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">下发数据批次：</label>
                    <div class="controls">
                        <form:input path="distributeNo" htmlEscape="false" maxlength="16" class="input-xlarge "/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">核查人：</label>
                    <div class="controls">
                        <form:input path="checkName" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">核查人联系方式：</label>
                    <div class="controls">
                        <form:input path="checkTel" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">核查时间：</label>
                    <div class="controls">
                        <input name="checkDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                               value="<fmt:formatDate value="${ccmPeopleAntiepidemic.checkDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">上报人：</label>
                    <div class="controls">
                        <form:input path="reportName" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">上报人所属单位：</label>
                    <div class="controls">
                        <form:input path="reportDepartment" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">上报时间：</label>
                    <div class="controls">
                        <input name="reportDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                               value="<fmt:formatDate value="${ccmPeopleAntiepidemic.reportDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">上报状态：</label>
                    <div class="controls">
                        <%--<form:input path="reportStatus" htmlEscape="false" maxlength="2" class="input-xlarge "/>--%>
                            <form:select path="reportStatus" cssStyle="width: 285px">
                                <form:option value="" label="" />
                                <form:options items="${fns:getDictList('sys_ccm_peopleantiepidemic_upload')}"
                                              itemLabel="label" itemValue="value" htmlEscape="false" />
                            </form:select>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">所属市局：</label>
                    <div class="controls">
                        <form:input path="belongBureau" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">所属分局：</label>
                    <div class="controls">
                        <form:input path="belongSubBureau" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <div class="control-group">
                    <label class="control-label">所属派出所：</label>
                    <div class="controls">
                        <form:input path="belongPoliceStation" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </td>
        </tr>









            <%-- <div class="control-group">
                <label class="control-label">数据类型：</label>
                <div class="controls">
                    <form:input path="dataType" htmlEscape="false" maxlength="2" class="input-xlarge "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">数据状态：</label>
                <div class="controls">
                    <form:input path="dataStatus" htmlEscape="false" maxlength="2" class="input-xlarge "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">网格id：</label>
                <div class="controls">
                    <form:input path="areaGridId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">坐标：</label>
                <div class="controls">
                    <form:input path="areaPoint" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                </div>
            </div> --%>
        <tr>
            <td>
                <div class="control-group">
                    <label class="control-label">备注信息：</label>
                    <div class="controls">
                        <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
                    </div>
                </div>
            </td>
        </tr>

    </table>
    <div class="form-actions">
        <shiro:hasPermission name="pop:ccmPeopleAntiepidemic:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</div>
</body>
</html>