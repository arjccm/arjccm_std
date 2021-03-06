<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>预处理事件管理-热线</title>
    <meta name="decorator" content="default"/>
    <link href="${ctxStatic}/layer-v3.1.1/layer/theme/default/layer.css"
          rel="stylesheet"/>
    <script src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
    <script type="text/javascript"
            src="${ctxStatic}/plm/storage/ajaxMessageAlert.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btnSubmit").on("click", function () {
                var begin = new Date($("[name='beginHappenDate']").val());
                var end = new Date($("[name='endHappenDate']").val());
                if (begin.getTime() > end.getTime()) {
                    messageAlert("开始时间大于结束时间！", "error");
                    return false;
                }
                $("#searchForm").submit();
            });
            //右上角选项卡选中状态
            if ($("#statusClass").val() == '') {
                $("#qb").parent().addClass('active');
            } else if ($("#statusClass").val() == '01') {
                $("#wcl").parent().addClass('active');
            } else if ($("#statusClass").val() == '02') {
                $("#ytg").parent().addClass('active');
            } else if ($("#statusClass").val() == '03') {
                $("#yjj").parent().addClass('active');
            }
        });

        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        function HandleTips(_this, id) {
            var html = '';
            html += '<div style="padding:10px;" >';
            html += '<p style="margin-botom:20px;">请做出选择</p >';
            html += '<div>';
            html += '<input id="btnSuccess" onclick="Pass('
                + "&quot;"
                + id
                + "&quot;"
                + ')" class="btn btn-primary " type="button" value="通过" style="background: #73a839">';
            html += '<input id="btnPass"  onclick="NoPass('
                + "&quot;"
                + id
                + "&quot;"
                + ')" class="btn btn-primary" type="button" value="拒绝" style="background: #c71c22">';
            html += '</div>';
            html += '</div>';
            tip_index = layer.tips(html, _this, {
                tips: [1, '#20c694'],
                time: 3000,
            });
        }

        function Pass(id) {
            $.post('${ctx}/preview/ccmEventIncidentPreview/pass?status=02&id=' + id, function (data) {
                if (data.code == '200') {
                    $.jBox.tip('操作成功！');
                    window.location.reload()
                }
            })
        }

        function NoPass(id) {
            $.post('${ctx}/preview/ccmEventIncidentPreview/pass?status=03&id=' + id, function (data) {
                if (data.code == '200') {
                    $.jBox.tip('操作成功！');
                    window.location.reload()
                }
            })
        }
    </script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">预处理系统</span>--%>
<ul class="back-list clearfix">
    <ul class="nav nav-tabs">
        <li style="float: right;"><a id="yjj" class="nav-head"
                                     href="${ctx}/preview/ccmEventIncidentPreview/3?status=03" style="color: #ff3a47">已拒绝</a>
        </li>
        <li style="float: right;"><a id="ycl" class="nav-head"
                                     href="${ctx}/preview/ccmEventIncidentPreview/3?status=02" style="color: #5dbabd">已处理</a>
        </li>
        <li style="float: right;"><a id="wcl" class="nav-head"
                                     href="${ctx}/preview/ccmEventIncidentPreview/3?status=01" style="color: #dc9166">未处理</a>
        </li>
        <li class="fstCli" style="float: right;"><a id="qb" class="nav-head"
                                                    href="${ctx}/preview/ccmEventIncidentPreview/3">全部</a></li>

    </ul>
    <form:form id="searchForm" modelAttribute="ccmEventIncidentPreview"
               action="${ctx}/preview/ccmEventIncidentPreview/3" method="post"
               class="breadcrumb form-search clearfix">
        <input id="statusClass" name="statusClass" type="hidden" value="${status}"/>
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden"
               value="${page.pageSize}"/>
        <ul class="ul-form pull-left">
            <li class="first-line"><label>开始时间：</label> <input name="beginHappenDate"
                                                               type="text" readonly="readonly" maxlength="20"
                                                               class="input-medium Wdate"
                                                               value="<fmt:formatDate value="${ccmEventIncidentPreview.beginHappenDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                                                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
            </li>
            <li class="first-line"><label>结束时间：</label> <input name="endHappenDate" type="text"
                                                               readonly="readonly" maxlength="20"
                                                               class="input-medium Wdate"
                                                               value="<fmt:formatDate value="${ccmEventIncidentPreview.endHappenDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                                                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
            </li>
            <li class="first-line"><label>事件名称：</label> <form:input path="caseName"
                                                                    htmlEscape="false" maxlength="100"
                                                                    class="input-medium"/></li>
            <li class="first-line"><label>上报人：</label> <form:input path="reportPerson"
                                                                   htmlEscape="false" maxlength="15"
                                                                   class="input-medium"/></li>
            <li class="first-line"><label>状态：</label> <form:select path="status"
                                                                   class="input-medium">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('ccm_event_status')}"
                              itemLabel="label" itemValue="value" htmlEscape="false"/>
            </form:select></li>
            <li class="second-line"><label>事件规模：</label> <form:select path="caseScope"
                                                                      class="input-medium">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('ccm_event_scope')}"
                              itemLabel="label" itemValue="value" htmlEscape="false"/>
            </form:select></li>

                <%--			<li class="clearfix"></li>--%>
        </ul>

        <sys:message content="${message}"/>
        <div class="clearfix pull-right btn-box">
            <shiro:hasPermission name="preview:ccmEventIncidentPreview:edit">
                <a onclick="parent.LayerDialog('${ctx}/preview/ccmEventIncidentPreview/form/3', '添加', '1100px', '600px')"
                   class="btn btn-export" style="width: 49px;display:inline-block;float: right;"> <i></i><span
                        style="font-size: 12px">添加</span> </a>
            </shiro:hasPermission>
            <a href="javascript:;" id="btnSubmit"
               class="btn btn-primary" style="width: 49px;display:inline-block;float: right;"> <i></i><span
                    style="font-size: 12px">查询</span>
            </a>
        </div>
    </form:form>
    <table id="contentTable"
           class="table table-striped table-bordered table-condensed table-gradient">
        <thead>
        <tr>
            <th>事件名称</th>
            <th>上报人</th>
            <th>发生地详址</th>
            <th>事件规模</th>
            <th>发生日期</th>
            <th>处理状态</th>
            <shiro:hasPermission name="preview:ccmEventIncidentPreview:edit">
                <th>操作</th>
            </shiro:hasPermission>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="ccmEventIncidentPreview">
            <tr>
                <td><a
                        onclick="parent.LayerDialog('${ctx}/preview/ccmEventIncidentPreview/form/1?id=${ccmEventIncidentPreview.id}', '详情', '1100px', '600px')">${ccmEventIncidentPreview.caseName}</a>
                </td>
                <td>${ccmEventIncidentPreview.reportPerson}</td>
                <td>${ccmEventIncidentPreview.happenPlace}</td>
                <td>${fns:getDictLabel(ccmEventIncidentPreview.caseScope,'ccm_event_scope','')}</td>
                <td><fmt:formatDate
                        value="${ccmEventIncidentPreview.happenDate}"
                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><span
                        class="eventScaleCss previewStatusCss-${ccmEventIncidentPreview.status}">
                        ${fns:getDictLabel(ccmEventIncidentPreview.status, 'ccm_event_preview_status', '')}
                </span></td>
                <shiro:hasPermission name="preview:ccmEventIncidentPreview:edit">
                    <td><a class="btnList"
                                                onclick="parent.LayerDialog('${ctx}/preview/ccmEventIncidentPreview/form/3?id=${ccmEventIncidentPreview.id}', '编辑', '1100px', '600px')"
                                                title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a> <a
                            class="btnList"
                            href="${ctx}/preview/ccmEventIncidentPreview/delete?id=${ccmEventIncidentPreview.id}"
                            onclick="return confirmx('确认要删除该app信息上报吗？', this.href)"
                            title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
                        <c:if test="${ccmEventIncidentPreview.status eq '03' || ccmEventIncidentPreview.status eq '02'}">
                            <a class="btnList" title="已处理"><i class="iconfont icon-caozuotubiao-chuliyichuli"
                                                              style="color:  #656565;"></i></a>
                        </c:if>
                        <c:if test="${ccmEventIncidentPreview.status eq '01'}">
                            <a class="btnList" onclick="HandleTips(this,'${ccmEventIncidentPreview.id}')" title="处理"> <i
                                    class="iconfont icon-caozuotubiao-chuliyichuli"></i> </a>
                        </c:if>
                            <%--<a class="btnList"
                            onclick="HandleTips(this,'${ccmEventIncidentPreview.id}')"
                            title="处理"><i class="iconfont icon-caozuotubiao-chuliyichuli"></i></a></td>--%>
                    </td>
                </shiro:hasPermission>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</ul>
</body>
</html>