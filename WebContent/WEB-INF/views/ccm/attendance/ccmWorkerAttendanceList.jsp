<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>社工考勤登记管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });

        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        $(function () {
            $("#btnExport").click(
                function () {
                    top.$.jBox.confirm("确认要导出数据吗？", "系统提示", function (v, h, f) {
                        if (v == "ok") {
                            $("#searchForm").attr("action",
                                ctx + "/attendance/ccmWorkerAttendance/export");
                            $("#searchForm").submit();
                            $("#searchForm").attr("action",
                                ctx + "/attendance/ccmWorkerAttendance/getcount");
                        }
                    }, {
                        buttonsFocus: 1
                    });
                    top.$('.jbox-body .jbox-icon').css('top', '55px');
                });
        });
    </script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">事件管理</span>--%>
<ul class="back-list clearfix">
    <ul class="nav nav-tabs">
        <li class="active"><a class="nav-head" href="${ctx}/attendance/ccmWorkerAttendance/getcount">社工考勤统计</a></li>
    </ul>
    <form:form id="searchForm" modelAttribute="ccmWorkerAttendance"
               action="${ctx}/attendance/ccmWorkerAttendance/getcount" method="post"
               class="breadcrumb form-search clearfix">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        <ul class="ul-form pull-left">
            <li class="first-line"><label>开始日期：</label>
                <input name="attendanceBegin" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                       value="<fmt:formatDate value="${ccmWorkerAttendance.attendanceBegin}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
            </li>
            <li class="first-line"><label>结束日期：</label>
                <input name="attendanceEnd" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                       value="<fmt:formatDate value="${ccmWorkerAttendance.attendanceEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
            </li>

                <%--			<li class="clearfix"></li>--%>
        </ul>
        <sys:message content="${message}"/>
        <div class="clearfix pull-right btn-box">
            <shiro:hasPermission name="attendance:ccmWorkerAttendanceCount:export"><a href="javascript:;" id="btnExport" class="btn btn-export"
               style="width: 49px;display:inline-block;float: right;">
                <i></i> 导出 </a></shiro:hasPermission>
            <input id="btnSubmit" class="btn btn-primary"
                   style="width: 75px;display:inline-block;float: right;margin-right: 15px" type="submit"
                   value="查询"/></li>
        </div>
    </form:form>
    <table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
        <thead>
        <tr>
            <th>登记人</th>
            <th>部门</th>
            <th>出差(天)</th>
            <th>外出(天)</th>
            <th>病假(天)</th>
            <th>事假(天)</th>
            <th>年休(天)</th>
            <th>调休(天)</th>
            <th>加班(天)</th>
            <th>加班次数</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="ccmWorkerAttendance">
            <tr>
                <td>
                        ${ccmWorkerAttendance.createBy.name}
                </td>
                <td>
                        ${ccmWorkerAttendance.createBy.office.name}
                </td>
                <td>
                        ${ccmWorkerAttendance.chuchai}
                </td>
                <td>
                        ${ccmWorkerAttendance.waichu}
                </td>
                <td>
                        ${ccmWorkerAttendance.bingjia}
                </td>
                <td>
                        ${ccmWorkerAttendance.shijia}
                </td>
                <td>
                        ${ccmWorkerAttendance.nianxiu}
                </td>
                <td>
                        ${ccmWorkerAttendance.tiaoxiu}
                </td>
                <td>
                        ${ccmWorkerAttendance.jiaban}
                </td>
                <td>
                        ${ccmWorkerAttendance.jiabanCount}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</ul>
</body>
</html>