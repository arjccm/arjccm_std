<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>设备管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript"
            src="${ctxStatic}/ccm/ccmsys/js/ccmDeviceInfo.js"></script>
    <script type="text/javascript" src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
    <!-- <script type="text/javascript">
        $(document).ready(function() {

        });
        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script> -->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnSubmit").on("click", function () {
                $("#searchForm").submit();
            })
        });

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
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">设备管理</span>--%>
<div class="back-list clearfix">
    <div id="importBox" class="hide">
        <form name="importForm" id="importForm" action="${ctx}/ccmsys/ccmDevice/import"
              method="post" enctype="multipart/form-data" class="form-search"
              style="padding-left: 20px; text-align: center;"
              onsubmit="return saveImport()">
            <br/> <input id="uploadFile" name="file" type="file"
                         style="width: 330px" onchange="changeFalse(this.value.length)"/><br/> <br/> <input id="btnImportSubmit"
                                                                  class="btn btn-primary" type="submit"
                                                                   value="导  入 "/>
        </form>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a class="nav-head" href="${ctx}/ccmsys/ccmDevice/">数据列表</a></li>
        <shiro:hasPermission name="ccmsys:ccmDevice:edit">
            <li><a style="text-align:center" href="${ctx}/ccmsys/ccmDevice/form">设备添加</a></li>
        </shiro:hasPermission>
    </ul>
    <form:form id="searchForm" modelAttribute="ccmDevice" action="${ctx}/ccmsys/ccmDevice/" method="post"
               class="breadcrumb form-search clearfix">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form pull-left">
        <li class="first-line"><label>设备名称：</label>
            <form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="first-line"><label>设备编号：</label>
            <form:input path="code" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="first-line"><label>IP地址：</label>
            <form:input path="ip" htmlEscape="false" maxlength="15" class="input-medium"/>
        </li>
        <li class="first-line"><label>设备类型：</label>
            <form:select path="typeId" class="input-medium">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('ccm_device_type_id')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="first-line"><label>所属区域：</label>
            <sys:treeselect id="area" name="area.id" value="${ccmDevice.area.id}" labelName="area.name"
                            labelValue="${ccmDevice.area.name}"
                            title="区域" url="/sys/area/treeData" cssClass="input-small" allowClear="true"
                            notAllowSelectParent="false"/>
        </li>
        <li class="second-line"><label>设备状态：</label>
            <form:select path="status" class="input-medium">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('ccm_device_status')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>

            <%--			<li class="clearfix"></li>--%>
    </ul>


    <div class="clearfix pull-right btn-box">

        <shiro:hasPermission name="ccmsys:ccmDevice:edit">
            <!--<input id="btnImport" class="btn btn-primary" type="button" value="导入" />
            <input id="btnExport" class="btn btn-primary" type="button" value="导出" /> -->

            <a id="btnGetCameraArea" class="btn btn-primary"
               style="width: 126px !important;display:inline-block;float: right;" href="javascript:;">
                <i class="icon-facetime-video">监控设备区域调整</i>
            </a>
        </shiro:hasPermission>
        <shiro:hasPermission name="ccmsys:ccmDevice:import">
            <a href="javascript:;" id="btnImport" style="width: 49px;display:inline-block;float: right;"
               class="btn  btn-export ">
                <i></i> <span style="font-size: 12px">导入</span>
            </a>
        </shiro:hasPermission>
        <shiro:hasPermission name="ccmsys:ccmDevice:export">
            <a href="javascript:;" id="btnExport" class="btn btn-export"
               style="width: 49px;display:inline-block;float: right;">
                <i></i> <span style="font-size: 12px">导出</span>
            </a>
        </shiro:hasPermission>
        <!-- 添加该input的点击方法为 return page();-->
        <!-- <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/> -->

        <a href="javascript:;" id="btnSubmit" class="btn btn-primary"
           style="width: 49px;display:inline-block;float: right;">
            <i></i><span style="font-size: 12px">查询</span> </a>

    </div>
    </form:form>
    <sys:message content="${message}"/>
    <table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
        <thead>
        <tr>
            <th>设备名称</th>
            <th>设备编号</th>
            <th>IP地址</th>
            <th>设备类型</th>
            <th>所属区域</th>
            <th>设备状态</th>
            <th>厂商</th>
            <shiro:hasPermission name="ccmsys:ccmDevice:edit">
                <th>操作</th>
            </shiro:hasPermission>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="ccmDevice">
            <tr>
                <td><a href="${ctx}/ccmsys/ccmDevice/form?id=${ccmDevice.id}">
                        ${ccmDevice.name}</a>
                </td>
                <td>${ccmDevice.code}</td>
                <td>
                        ${ccmDevice.ip}
                </td>
                <td>
                        ${fns:getDictLabel(ccmDevice.typeId, 'ccm_device_type_id', '')}
                </td>
                <td>
                        ${ccmDevice.area.name}
                </td>
                <td>
                        ${fns:getDictLabel(ccmDevice.status, 'ccm_device_status', '')}
                </td>
                <td>
                        ${ccmDevice.companyId}
                </td>
                <shiro:hasPermission name="ccmsys:ccmDevice:edit">
                    <td>
                        <a class="btnList" href="${ctx}/ccmsys/ccmDevice/form?id=${ccmDevice.id}" title="修改"><i
                                class="iconfont icon-caozuotubiao-xiugai"></i></a>
                        <a class="btnList" href="${ctx}/ccmsys/ccmDevice/delete?id=${ccmDevice.id}"
                           onclick="return confirmx('确认要删除该设备吗？', this.href)" title="删除"><i
                                class="iconfont icon-caozuotubiao-shanchu"></i></a>
                    </td>
                </shiro:hasPermission>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>