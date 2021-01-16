<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>社会组织管理</title>
    <meta name="decorator" content="default"/>

    <script type="text/javascript"
            src="${ctxStatic}/ccm/org/js/ccmSocialorgInfo.js"></script>
    <script type="text/javascript">
        var isEmpty = true;
        var isEmpty = true;
        function saveImport() {
            if(isEmpty){
                alert("请选择文件！");
                return false;
            }else{
                loading('正在导入，请稍等...');
            }
        }
        function changeFalse(_this) {
            if(_this>0){
                isEmpty = false;
            }
        }
    </script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">社会治安</span>--%>
<div class="back-list clearfix">

    <!-- 导入、导出模块 -->
    <div id="importBox" class="hide">
        <form id="importForm" action="${ctx}/org/ccmOrgSocialorg/import"
              method="post" enctype="multipart/form-data" class="form-search"
              style="padding-left: 20px; text-align: center;"
              onsubmit="return saveImport()">
            <br/> <input id="uploadFile" name="file" type="file"
                         style="width: 330px" onchange="changeFalse(this.value.length)"/><br/> <br/>
            <input id="btnImportTemplate"
                   class="btn btn-primary" type="button" value="模板下载 "
                   onclick="location.href='${ctxStatic}/template/excel/kymTemplate.xlsx'"/>
            <input id="btnImportSubmit"
                   class="btn btn-primary" type="submit" value="导  入 "/>
        </form>
    </div>

    <ul class="nav nav-tabs">
        <li class="active"><a class="nav-head" href="${ctx}/org/ccmOrgSocialorg/">数据列表</a></li>
        <shiro:hasPermission name="org:ccmOrgSocialorg:edit">
            <li><a style="text-align:center" href="${ctx}/org/ccmOrgSocialorg/form">数据添加</a></li>
        </shiro:hasPermission>
    </ul>
    <form:form id="searchForm" modelAttribute="ccmOrgSocialorg" action="${ctx}/org/ccmOrgSocialorg/" method="post"
               class="breadcrumb form-search clearfix">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form pull-left">
        <li class="first-line"><label>社会组织名称：</label>
            <form:input path="orgName" htmlEscape="false" maxlength="100" class="input-medium"/>
        </li>
        <li class="first-line"><label>关注程度：</label>
            <form:select path="concernExtent" class="input-medium">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('ccm_conc_exte')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="first-line"><label>社会组织类型：</label>
            <form:select path="orgType" class="input-medium">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('ccm_sosr_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="first-line"><label>批准日期：</label>
            <input name="beginApprDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${ccmOrgSocialorg.beginApprDate}" pattern="yyyy-MM-dd"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/></li>
        <li class="first-line"><label>结束日期：</label><input name="endApprDate" type="text" readonly="readonly"
                                                          maxlength="20" class="input-medium Wdate"
                                                          value="<fmt:formatDate value="${ccmOrgSocialorg.endApprDate}" pattern="yyyy-MM-dd"/>"
                                                          onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
        </li>

    </ul>


    <div class="clearfix pull-right btn-box">

        <!-- <input id="btnSubmit" class="btn btn-primary"
            type="submit" value="查询" onclick="return page();" /> -->
        <a href="javascript:;" id="btnSubmit" class="btn btn-primary"
           style="width: 49px;display:inline-block;float: left;">
            <i></i><span style="font-size: 12px">查询</span> </a>
        <shiro:hasPermission name="org:ccmOrgSocialorg:import">
            <!-- <input id="btnExport" class="btn btn-primary" type="button"
            value="导出" />
            <input id="btnImport" class="btn btn-primary" type="button"
            value="导入" /> -->
            <a href="javascript:;" id="btnImport" style="width: 49px;display:inline-block;float: left;"
               class="btn  btn-export ">
                <i></i> <span style="font-size: 12px">导入</span>
            </a>
        </shiro:hasPermission>
        <shiro:hasPermission name="org:ccmOrgSocialorg:export">
            <a href="javascript:;" id="btnExport" class="btn btn-export"
               style="width: 49px;display:inline-block;float: left;">
                <i></i> <span style="font-size: 12px">导出</span>
            </a>
        </shiro:hasPermission>
    </div>
    </form:form>
    <sys:message content="${message}"/>
    <table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
        <thead>
        <tr>
            <th>社会组织名称</th>
            <th>法定代表人姓名</th>
            <th>社会组织类型</th>
            <th>批准日期</th>
            <th>办公地址</th>
            <th>关注程度</th>
            <th>治保负责人姓名</th>
            <th>治保负责人联系方式</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="ccmOrgSocialorg">
            <tr>
                <td><a href="${ctx}/org/ccmOrgSocialorg/form?id=${ccmOrgSocialorg.id}">
                        ${ccmOrgSocialorg.orgName}
                </a></td>
                <td>
                        ${ccmOrgSocialorg.legalReprName}
                </td>
                <td>
                        ${fns:getDictLabel(ccmOrgSocialorg.orgType, 'ccm_sosr_type', '')}
                </td>
                <td>
                    <fmt:formatDate value="${ccmOrgSocialorg.apprDate}" pattern="yyyy-MM-dd"/>
                </td>
                <td>
                        ${ccmOrgSocialorg.workAdd}
                </td>
                <c:if test="${ccmOrgSocialorg.concernExtent eq '01'}">
                    <td>${fns:getDictLabel(ccmOrgSocialorg.concernExtent, 'ccm_conc_exte', '')}&nbsp;
                        &nbsp; <img src="${ctxStatic}/images/atteType_red.png"/></td>
                </c:if>
                <c:if test="${ccmOrgSocialorg.concernExtent eq '02'}">
                    <td>${fns:getDictLabel(ccmOrgSocialorg.concernExtent, 'ccm_conc_exte', '')}&nbsp;
                        &nbsp; <img src="${ctxStatic}/images/atteType_orange.png"/></td>
                </c:if>
                <c:if test="${ccmOrgSocialorg.concernExtent eq '03'}">
                    <td>${fns:getDictLabel(ccmOrgSocialorg.concernExtent, 'ccm_conc_exte', '')}&nbsp;
                        &nbsp; <img src="${ctxStatic}/images/atteType_green.png"/></td>
                </c:if>
                <c:if test="${ccmOrgSocialorg.concernExtent eq '04'}">
                    <td>${fns:getDictLabel(ccmOrgSocialorg.concernExtent, 'ccm_conc_exte', '')}</td>
                </c:if>
                <c:if test="${ccmOrgSocialorg.concernExtent eq '' or empty ccmOrgSocialorg.concernExtent}">
                    <td>${fns:getDictLabel(ccmOrgSocialorg.concernExtent, 'ccm_conc_exte', '')} </td>
                </c:if>
                <td>
                        ${ccmOrgSocialorg.secuName}
                </td>
                <td>
                        ${ccmOrgSocialorg.secuTel}
                </td>
                <td><shiro:hasPermission name="org:ccmOrgSocialorg:edit">
                    <a class="btnList" href="${ctx}/org/ccmOrgSocialorg/form?id=${ccmOrgSocialorg.id}" title="修改"><i
                            class="iconfont icon-caozuotubiao-xiugai"></i></a>
                    <a class="btnList" href="${ctx}/org/ccmOrgSocialorg/delete?id=${ccmOrgSocialorg.id}"
                       onclick="return confirmx('确认要删除该社会组织吗？', this.href)" title="删除"><i
                            class="iconfont icon-caozuotubiao-shanchu"></i></a>
                </shiro:hasPermission> <shiro:hasPermission name="log:ccmLogTail:view">
                    <a class="btnList"
                       onclick="parent.LayerDialog('${ctx}/log/ccmLogTail/list?relevance_id=${ccmOrgSocialorg.id}&relevance_table=ccm_org_socialorg', '记录信息', '800px', '660px')"
                       title="记录信息"><i class="iconfont icon-caozuotubiao-jiluxinxi" style="color: cornflowerblue;"></i></a>
                </shiro:hasPermission> <shiro:hasPermission name="log:ccmLogTail:edit">
                    <a class="btnList"
                       onclick="parent.LayerDialog('${ctx}/log/ccmLogTail/formPro?relevance_id=${ccmOrgSocialorg.id}&relevance_table=ccm_org_socialorg', '添加记录', '800px', '660px')"
                       title="添加记录"><i class="iconfont icon-caozuotubiao-tianjiachuli"></i> </a>
                </shiro:hasPermission></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>