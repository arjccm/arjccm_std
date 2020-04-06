<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>绩效总成绩管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript" src="${ctxStatic}/ccm/kpi/js/kpiFinalScore.js"></script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">绩效考核</span>--%>
<div class="back-list clearfix">
    <ul class="nav nav-tabs">
        <li class="active"><a class="nav-head" href="${ctx}/score/kpiFinalScore/">数据列表</a></li>
    </ul>
    <form:form id="searchForm" modelAttribute="kpiFinalScore" action="${ctx}/score/kpiFinalScore/" method="post"
               class="breadcrumb form-search clearfix">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form pull-left">
        <li class="first-line"><label>方案：</label>
            <form:select path="schemeId" class="required input-medium">
                <form:option value="" label="请选择"/>
                <form:options items="${schemeOptionList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
            </form:select>
        </li>
        <!--
			<li><label>部门：</label>
				<sys:treeselect id="office" name="office.id" value="${kpiFinalScore.office.id}" labelName="office.name" labelValue="${kpiFinalScore.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="false"/>
			</li>
			<li><label>用户类型</label>
				<form:select path="user.userType" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('sys_user_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>-->
        <li class="first-line"><label>被考核人姓名：</label>
            <form:input path="user.name" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <!-- <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li -->

            <%--			<li class="clearfix"></li>--%>
    </ul>
    <div class="clearfix pull-right btn-box">
            <%--		<a href="javascript:;" id="btnExport" class="btn btn-primary" style="width: 49px;display:inline-block;float: right;">--%>
            <%--			<i></i><span style="font-size: 12px">导出</span>  </a>--%>
        <shiro:hasPermission name="score:kpiFinalScore:export">
            <a href="javascript:;" id="btnExport" class="btn btn-export"
               style="width: 49px;display:inline-block;float: right;">
                <i></i> <span style="font-size: 12px">导出</span>
            </a>
        </shiro:hasPermission>
        <a href="javascript:;" id="btnSubmit" class="btn btn-primary"
           style="width: 49px;display:inline-block;float: left;">
            <i></i><span style="font-size: 12px">查询</span> </a>

    </div>
    </form:form>
    <sys:message content="${message}"/>


    <table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
        <thead>
        <tr>
            <th>工号</th>
            <th>姓名</th>
            <th>用户类型</th>
            <th>部门</th>
            <th>绩效总成绩</th>
            <th>特殊考核项得分</th>
            <c:forEach items="${kpiList}" var="kpi">
                <th>${kpi.name}&nbsp;&#40;${kpi.score}&#41;</th>
            </c:forEach>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="kpiFinalScore">
            <tr>
                <td style="height: 50px">
                        ${kpiFinalScore.user.no}
                </td>
                <td style="height: 50px">
                        ${kpiFinalScore.user.name}
                </td>
                <td style="height: 50px">
                        ${fns:getDictLabel(kpiFinalScore.user.userType, 'sys_user_type', '')}
                </td>
                <td style="height: 50px">
                        ${kpiFinalScore.office.name}
                </td>
                <td style="height: 50px">
                        ${kpiFinalScore.finalScore}
                </td>
                <td style="height: 50px">
                        ${kpiFinalScore.journalScore}
                </td>

                <c:forEach items="${kpiFinalScore.scoreList}" var="score">
                    <td style="height: 50px">${score}</td>
                </c:forEach>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>