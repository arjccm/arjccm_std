<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>严重刑事犯罪活动嫌疑管理</title>
    <meta name="decorator" content="default"/>
    <link href="${ctxStatic}/form/css/form.css" rel="stylesheet"/>
    <!-- 鱼骨图 -->
    <link rel="stylesheet" href="${ctxStatic}/ccm/event/css/fishBonePop.css"/>
    <script type="text/javascript" src="${ctxStatic}/ccm/event/js/fishBonePop.js"></script>
    <script type="text/javascript" src="${ctxStatic}/ccm/event/js/jquery.SuperSlide.2.1.1.js"></script>

    <script type="text/javascript">
        $(document).ready(
            function () {

                $("#inputForm")
                    .validate(
                        {
                            submitHandler: function (form) {
                                $("#btnSubmit").attr("disabled", true);
                                loading('正在提交，请稍等...');
                                form.submit();
                            },
                            errorContainer: "#messageBox",
                            errorPlacement: function (error, element) {
                                $("#btnSubmit").removeAttr('disabled');
                                $("#messageBox").text("输入有误，请先更正。");
                                if (element.is(":checkbox")
                                    || element.is(":radio")
                                    || element.parent().is(
                                        ".input-append")) {
                                    error.appendTo(element.parent()
                                        .parent());
                                } else {
                                    error.insertAfter(element);
                                }
                            }
                        });
                $("td").css({
                    "padding": "8px"
                });
                $("td").css({
                    "border": "0px dashed #CCCCCC"
                });
                //跟踪信息
                var jsonString = '${documentList}';
                data = JSON.parse(jsonString);
                $(".fishBone1").fishBone(data, '${ctx}', 'deal');
                $(".fishBone2").fishBone(data, '${ctx}', 'read');
                if ('${ccmSeriousCriminalOffense.isCrimeHistory}' == "0") {
                    $("#crimeHistory").attr("readonly", "readonly");
                    $("#crimeHistory").val("无犯罪史，不可填写")
                }
                $("input[name='isCrimeHistory']").click(function () {
                    if ($(this).val() == "0") {
                        $("#crimeHistory").attr("readonly", "readonly");
                        $("#crimeHistory").val("无犯罪史，不可填写")
                    } else {
                        $("#crimeHistory").removeAttr("readonly");
                        $("#crimeHistory").val("")
                    }
                });
                //关闭弹框事件
                $('#btnCancel').click(function () {
                    parent.layer.close(parent.layerIndex);
                })
            });
    </script>
    <link href="/arjccm/static/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">

</head>
<body>
<form:form id="inputForm" modelAttribute="ccmSeriousCriminalOffense"
           action="${ctx}/house/ccmSeriousCriminalOffense/save" method="post" class="form-horizontal hide1">
    <h4 class="tableNamefirst color-bg6">人员基本信息</h4>
    <form:hidden path="id"/>
    <form:hidden path="peopleId" value="${ccmPeople.id}"/>
    <sys:message content="${message}"/>
    <table class="first_table" border="0px"
           style="border-color: #CCCCCC; border: 0px solid #CCCCCC; padding: 10px; width: 100%;">
        <tr>
            <td>
                <div>
                    <label class="control-label">人口类型：</label>
                    <div class="controls">
                            ${fns:getDictLabel(ccmSeriousCriminalOffense.type, 'sys_ccm_people', "")}
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">姓名：</label>
                    <div class="controls">${ccmSeriousCriminalOffense.name}</div>
                </div>
            </td>
            <td rowspan="4" width="30%" align="left">
                <div>
                    <label class="control-label">照片：</label>
                    <div class="controls">
                        <form:hidden id="images" path="images" htmlEscape="false" maxlength="255" class="input-xlarge"/>
                        <sys:ckfinder input="images" readonly="true" type="images" uploadPath="/photo/ShiYouRenKou"
                                      selectMultiple="false" maxWidth="120" maxHeight="180"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label">公民身份号码：</label>
                    <div class="controls">${ccmSeriousCriminalOffense.ident}</div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">籍贯：</label>
                    <div class="controls">${ccmSeriousCriminalOffense.censu}</div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label">性别：</label>
                    <div class="controls">
                            ${fns:getDictLabel(ccmSeriousCriminalOffense.sex, 'sex', '')}</div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">联系方式：</label>
                    <div class="controls">${ccmSeriousCriminalOffense.telephone}</div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label">户籍详细地址：</label>
                    <div class="controls">
                            ${ccmSeriousCriminalOffense.domiciledetail}</div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">现住详细地址：</label>
                    <div class="controls">
                            ${ccmSeriousCriminalOffense.residencedetail}</div>
                </div>
            </td>
        </tr>
    </table>

    <h4 class="tableName color-bg6">严重刑事犯罪活动嫌疑人员信息</h4>
    <table border="0px"
           style="border-color: #CCCCCC; border: 0px solid #CCCCCC; padding: 10px; width: 100%;">
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>刑事类型：</label>
                    <div class="controls">
                        <form:select path="suspicionType" class="input-xlarge required">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('criminal_type')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>

                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>危险程度：</label>
                    <div class="controls">
                        <form:select path="dangerLevel" class="input-xlarge required">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('danger_level_dict')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>

                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>监管状态：</label>
                    <div class="controls">
                            <%-- <form:select path="superviseStatus" class="input-xlarge required">
                                <form:option value="" label="" />
                                <form:options items="${fns:getDictList('house_supervise_status')}"
                                    itemLabel="label" itemValue="value" htmlEscape="false" />
                            </form:select> --%>
                        <form:radiobuttons path="superviseStatus" items="${fns:getDictList('house_supervise_status')}"
                                           itemLabel="label" itemValue="value" htmlEscape="false"
                                           class="radiobuttons required"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>发现途径：</label>
                    <div class="controls">
                        <form:select path="discoveryWay" class="input-xlarge required">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('house_discovery_way')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>

                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label">发现人（告发人）：</label>
                    <div class="controls">
                        <form:input path="discoverer" htmlEscape="false" maxlength="128" class="input-xlarge "/>
                    </div>

                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">发现人身份证号：</label>
                    <div class="controls">
                        <form:input path="discoverIdCards" htmlEscape="false" maxlength="20"
                                    class="input-xlarge ident0 card"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label">发现人联系方式：</label>
                    <div class="controls">
                        <form:input path="discoverPhone" htmlEscape="false" maxlength="15" class="input-xlarge phone"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>参与嫌疑活动描述：</label>
                    <div class="controls">
                        <form:textarea path="activityDescription" htmlEscape="false" rows="4" maxlength="2048"
                                       class="input-xlarge required"/>
                    </div>

                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label">嫌疑人经济状况：</label>
                    <div class="controls">
                        <form:select path="conomicState" class="input-xlarge ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('conomic_state_dict')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">嫌疑人活动范围：</label>
                    <div class="controls">
                        <form:input path="activityScope" htmlEscape="false" maxlength="512" class="input-xlarge "/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td rowspan="1">
                <div>
                    <label class="control-label">监管情况：</label>
                    <div class="controls">
                        <form:textarea path="superviseSituation" htmlEscape="false" rows="4" maxlength="2084"
                                       class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>有无犯罪史：</label>
                    <div class="controls">
                        <form:radiobuttons path="isCrimeHistory" items="${fns:getDictList('have_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class="radiobuttons required"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label">犯罪史详情：</label>
                    <div class="controls">
                        <form:textarea path="crimeHistory" htmlEscape="false" rows="4" maxlength="1024"
                                       class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">备注信息：</label>
                    <div class="controls">
                        <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255"
                                       class="input-xlarge "/>
                    </div>
                </div>
    </table>
    <div class="form-actions">
        <shiro:hasPermission name="house:ccmSeriousCriminalOffense:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
        </shiro:hasPermission>
        <!-- <input id="btnCancel" class="btn" type="button" value="返 回"
            onclick="history.go(-1)" /> -->
        <input id="btnCancel" class="btn btn-danger" type="button" value="关闭"/>
    </div>
</form:form>
<br>
<c:if test="${documentNumber > 0}">
    <shiro:hasPermission name="log:ccmLogTail:edit">
        <h4 class="hide2">&nbsp;跟踪信息：</h4>
        <br>
        <div class="fishBone1 hide2"></div>
    </shiro:hasPermission>
    <shiro:lacksPermission name="log:ccmLogTail:edit">
        <h4 class="hide2">&nbsp;查看跟踪信息：</h4>
        <br>
        <div class="fishBone2 hide2"></div>
    </shiro:lacksPermission>
</c:if>
<c:if test="${documentNumber <= 0}">
    <shiro:hasPermission name="log:ccmLogTail:edit">
        <h2 class="hide2">&nbsp;&nbsp;暂无跟踪信息</h2>
        <br>
    </shiro:hasPermission>
</c:if>
</body>
</html>