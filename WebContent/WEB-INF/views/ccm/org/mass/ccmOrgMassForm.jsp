<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>社团组织管理</title>
    <link href="${ctxStatic}/form/css/form.css" rel="stylesheet"/>
    <meta name="decorator" content="default"/>
    <!-- 鱼骨图 -->
    <link rel="stylesheet" href="${ctxStatic}/ccm/event/css/fishBonePop.css"/>
    <script type="text/javascript" src="${ctxStatic}/ccm/event/js/fishBonePop.js"></script>
    <script type="text/javascript" src="${ctxStatic}/ccm/event/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //关闭弹框事件
            $('#btnCancel').click(function () {
                parent.layer.close(parent.layerIndex);
            })
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
            $("td").css({"padding": "8px"});
            $("td").css({"border": "0px dashed #CCCCCC"});
            //跟踪信息
            var jsonString = '${documentList}';
            data = JSON.parse(jsonString);
            $(".fishBone1").fishBone(data, '${ctx}', 'deal');
            $(".fishBone2").fishBone(data, '${ctx}', 'read');
            var s = $("#sel").val();
            if (s == "01") {
                $(".selectHidden").show();
            } else {
                $(".selectHidden").hide();
            }
        });

        function sels() {
            var s = $("#sel").val();
            if (s == "01") {
                $(".selectHidden").show();
            } else {
                $(".selectHidden").hide();
            }
        }

        function saveForm() {
            var area = $("#areaId").val();
            var html1 = '<label for="" class="error">必选字段 <label>';
            //alert(officeId.length);
            if (area.length != 0) {
                $("#show1").html("");
            } else {
                $("#show1").html(html1);
            }

            if (area.length != 0) {
                $("#inputForm").submit();
            }

        }
    </script>
    <link href="${ctxStatic}/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
</head>
<body>
<%-- <ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/org/ccmOrgNpse/formData?id=${ccmOrgNpse.id}&compType=05">社团组织<shiro:hasPermission name="org:ccmOrgNpse:edit">${not empty ccmOrgNpse.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="org:ccmOrgNpse:edit">查看</shiro:lacksPermission></a></li>
</ul> --%>
<form:form id="inputForm" modelAttribute="ccmOrgNpse" action="${ctx}/org/ccmOrgNpse/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>

    <table border="0px"
           style="border-color: #CCCCCC; border: 0px solid #CCCCCC; padding: 10px; width: 100%;">

        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font></span>所属网格：</label>
                    <div class="controls">
                        <sys:treeselect id="area" name="area.id" value="${ccmOrgNpse.area.id}" labelName="area.name"
                                        labelValue="${ccmOrgNpse.area.name}"
                                        title="区域" url="/tree/ccmTree/treeDataArea?type=7&areaid=" allowClear="true"
                                        notAllowSelectParent="true" cssClass=""/>
                        <span class="help-inline"><font color="red" id="show1"></font></span>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>社团名称：</label>
                    <div class="controls">
                        <form:input path="compName" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>统一社会信用代码：</label>
                    <div class="controls">
                        <form:input path="compId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>重点企业类型：</label>
                    <div class="controls">
                        <form:select path="compImpoType" class="input-xlarge required" id="sel" onchange="sels()">
                            <form:options items="${fns:getDictList('comp_impo_type')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
                <form:input path="compType" style="display:none;"/>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>登记注册类型：</label>
                    <div class="controls">
                        <form:select path="regiType" class="input-xlarge ">
                            <form:options items="${fns:getDictList('sys_ccm_regi_type')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>社团地址：</label>
                    <div class="controls">
                        <form:input path="compAdd" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
                    </div>
                </div>
            </td>

        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font></span>面积（平方米）：</label>
                    <div class="controls">
                        <form:input path="compArea" htmlEscape="false" class="input-xlarge number required "/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">所属行业：</label>
                    <div class="controls">
                        <sys:treeselect id="industry" name="industry" value="${ccmOrgNpse.industry}"
                                        labelName="dicts.label" labelValue="${ccmOrgNpse.industry}"
                                        title="行业" url="/sys/sysDicts/treeData?type=ccm_profession"
                                        extId="${sysDicts.id}" cssClass="" allowClear="true" dicts="true"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>社团联系方式：</label>
                    <div class="controls">
                        <form:input path="compTl" htmlEscape="false" maxlength="50"
                                    class="input-xlarge required phone"/>

                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>社团员工数：</label>
                    <div class="controls">
                        <form:input path="companyNum" htmlEscape="false" maxlength="6"
                                    class="input-xlarge number digits required"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label">注册资金：</label>
                    <div class="controls">
                        <form:input path="registeredFund" htmlEscape="false" class="input-xlarge number"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">登记注册日期：</label>
                    <div class="controls">
                        <input name="registerDate" type="text" readonly="readonly" maxlength="20"
                               class="input-medium Wdate "
                               value="<fmt:formatDate value="${ccmOrgNpse.registerDate}" pattern="yyyy-MM-dd"/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font color="red">*</font> </span>法定代表人证件类型：</label>
                    <div class="controls">
                        <form:select path="legalReprCode" class="input-xlarge "
                                     items="${fns:getDictList('sys_ccm_org_papers')}"
                                     itemLabel="label" itemValue="value" htmlEscape="false">
                        </form:select>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font color="red">*</font> </span>法定代表人证件号码：</label>
                    <div class="controls">
                        <form:input path="legalReprId" htmlEscape="false" maxlength="50"
                                    class="input-xlarge ident0 card required"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>法定代表人姓名：</label>
                    <div class="controls">
                        <form:input path="legalReprName" htmlEscape="false" maxlength="80"
                                    class="input-xlarge required"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font color="red">*</font> </span>法定代表人联系方式：</label>
                    <div class="controls">
                        <form:input path="legalReprTl" htmlEscape="false" maxlength="50"
                                    class="input-xlarge required phone"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>治保负责人姓名：</label>
                    <div class="controls">
                        <form:input path="secuName" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font color="red">*</font> </span>治保负责人联系方式：</label>
                    <div class="controls">
                        <form:input path="secuPhone" htmlEscape="false" maxlength="50"
                                    class="input-xlarge required phone"/>
                    </div>
                </div>
            </td>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>社团负责人姓名：</label>
                    <div class="controls">
                        <form:input path="entePrinName" htmlEscape="false" maxlength="50"
                                    class="input-xlarge required"/>
                    </div>
                </div>
            </td>

            <td>
                <div>
                    <label class="control-label">社团负责人联系方式：</label>
                    <div class="controls">
                        <form:input path="entePrincipalTl" htmlEscape="false" maxlength="50"
                                    class="input-xlarge phone "/>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>控股情况：</label>
                    <div class="controls">
                        <form:select path="holdCase" class="input-xlarge ">
                            <form:options items="${fns:getDictList('ccm_hold_cond')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font color="red">*</font> </span>是否具备建立中共党组织条件：</label>
                    <div class="controls">
                        <form:radiobuttons path="estaOrgaCond" items="${fns:getDictList('yes_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class="required"/>
                    </div>
                </div>
            </td>

        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>中共党员数量：</label>
                    <div class="controls">
                        <form:input path="partyMem" htmlEscape="false" maxlength="6"
                                    class="input-xlarge number digits required"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>是否有中共党组织：</label>
                    <div class="controls">
                        <form:radiobuttons path="estaOrga" items="${fns:getDictList('yes_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class="required"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>工会会员数量：</label>
                    <div class="controls">
                        <form:input path="laborUnionNum" htmlEscape="false" maxlength="6"
                                    class="input-xlarge number digits required"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>是否有工会：</label>
                    <div class="controls">
                        <form:radiobuttons path="laborUnion" items="${fns:getDictList('yes_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class="required"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>共青团团员数量：</label>
                    <div class="controls">
                        <form:input path="youthLeagOrgaNum" htmlEscape="false" maxlength="6"
                                    class="input-xlarge number digits required"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>是否有共青团组织：</label>
                    <div class="controls">
                        <form:radiobuttons path="youthLeagOrga" items="${fns:getDictList('yes_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class="required"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>妇女数量：</label>
                    <div class="controls">
                        <form:input path="womenNum" htmlEscape="false" maxlength="6"
                                    class="input-xlarge number digits required"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>是否有妇联组织：</label>
                    <div class="controls">
                        <form:radiobuttons path="womenOrg" items="${fns:getDictList('yes_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class="required"/>
                    </div>
                </div>
            </td>
        </tr>


        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>安全隐患类型：</label>
                    <div class="controls">
                        <form:select path="safeHazaType" class="input-xlarge ">
                            <form:options items="${fns:getDictList('ccm_pori_type')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>是否危化企业：</label>
                    <div class="controls">
                        <form:radiobuttons path="dangComp" items="${fns:getDictList('yes_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class="required"/>
                    </div>
                </div>
            </td>

        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label">隐患情况：</label>
                    <div class="controls">
                        <form:input path="dangerCase" htmlEscape="false" maxlength="200" class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">安全整改情况：</label>
                    <div class="controls">
                        <form:input path="reformCase" htmlEscape="false" class="input-xlarge "/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>关注程度：</label>
                    <div class="controls">
                        <form:select path="concExte" class="input-xlarge ">
                            <form:options items="${fns:getDictList('ccm_conc_exte')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label"><span class="help-inline"><font
                            color="red">*</font> </span>风险级别：</label>
                    <div class="controls">
                        <form:select path="riskRank" class="input-xlarge ">
                            <form:options items="${fns:getDictList('ccm_npse_risk_rank')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </td>

        </tr>
        <tr class="selectHidden">
            <td>
                <div>
                    <label class="control-label">服务品牌：</label>
                    <div class="controls">
                        <form:input path="servBrand" htmlEscape="false" maxlength="50" class="input-xlarge "/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">监控摄像机数量：</label>
                    <div class="controls">
                        <form:input path="survCameNum" htmlEscape="false" maxlength="5"
                                    class="input-xlarge number digits"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr class="selectHidden">
            <td>
                <div>
                    <label class="control-label">X光机数量：</label>
                    <div class="controls">
                        <form:input path="xRayNum" htmlEscape="false" maxlength="4" class="input-xlarge number digits"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">是否落实100%X光机安检：</label>
                    <div class="controls">
                        <form:radiobuttons path="xRayChec" items="${fns:getDictList('yes_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class=""/>
                    </div>
                </div>
            </td>
        </tr>
        <tr class="selectHidden">
            <td>
                <div>
                    <label class="control-label">是否落实100%先验视后封箱：</label>
                    <div class="controls">
                        <form:radiobuttons path="checPack" items="${fns:getDictList('yes_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class=""/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">是否落实100%寄递实名制：</label>
                    <div class="controls">
                        <form:radiobuttons path="realName" items="${fns:getDictList('yes_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class=""/>
                    </div>
                </div>
            </td>
        </tr>
        <tr class="selectHidden">
            <td colspan="2">
                <div>
                    <label class="control-label">经营范围：</label>
                    <div class="controls">
                        <form:checkboxes path="manageScopeList" items="${fns:getDictList('ccm_busi_scope')}"
                                         itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
                    </div>
                </div>
            </td>
        </tr>
            <%-- <tr>
                <td>
                    <div>
                        <label class="control-label">中心点：</label>
                        <div class="controls">
                            <form:input path="areaPoint" htmlEscape="false" maxlength="40" class="input-xlarge " />
                        </div>
                    </div>
                </td>
                <td>
                    <div>
                        <label class="control-label">区域图：</label>
                        <div class="controls">
                            <form:input path="areaMap" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
                        </div>
                    </div>
                </td>
            </tr> --%>
        <tr>
            <td>
                <div>
                    <label class="control-label">图片：</label>
                    <div class="controls">
                        <form:hidden id="images" path="images" htmlEscape="false" maxlength="255" class="input-xlarge"/>
                        <sys:ckfinder input="images" type="images" uploadPath="/org/FeiGongYouZhiZuZhi"
                                      selectMultiple="false" maxWidth="240" maxHeight="360"/>
                    </div>
                </div>
            </td>
            <td>
                <div>
                    <label class="control-label">备注信息：</label>
                    <div class="controls">
                        <form:textarea path="remarks" htmlEscape="false" rows="2" maxlength="255"
                                       class="input-xlarge "/>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <div class="form-actions">
        <shiro:hasPermission name="org:ccmOrgNpse:edit">
            <input id="btnSubmit" class="btn btn-primary" onclick="saveForm()" type="button" value="保 存"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn btn-danger" type="button" value="关闭"/>
    </div>
</form:form>
<c:if test="${documentNumber > 0}">
    <shiro:hasPermission name="log:ccmLogTail:edit">
        <h4>&nbsp;跟踪信息：</h4>
        <br>
        <div class="fishBone1"></div>
    </shiro:hasPermission>
    <shiro:lacksPermission name="log:ccmLogTail:edit">
        <h4>&nbsp;查看跟踪信息：</h4>
        <br>
        <div class="fishBone2"></div>
    </shiro:lacksPermission>
</c:if>
</body>
</html>