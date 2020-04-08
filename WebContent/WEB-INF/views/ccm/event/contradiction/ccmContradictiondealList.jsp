<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<html>
<head>
    <title>事件处理管理</title>
    <meta name="decorator" content="default"/>
    <link rel="stylesheet" href="${ctxStatic}/ccm/event/css/eventCasedeal.css" type="text/css">
    <script src="${ctxStatic}/common/common.js" type="text/javascript"></script>
    <script src="${ctxStatic}/ccm/event/js/eventCasedeal.js" type="text/javascript"></script>
</head>
<body>
<div class="back-list clearfix">
    <div class="context" content="${ctx}"></div>
    <ul class="nav nav-tabs">
        <li style="float:right;"><a style="background-color:#9f3df8;color:white;"
                                    href="${ctx}/contradiction/ccmContradictionDeal/?isSupervise=1">督办事件</a></li>
        <li style="float:right;"><a style="background-color:#25cf71;color:white;"
                                    href="${ctx}/contradiction/ccmContradictionDeal/?handleStatus=03">已办事件</a></li>
        <li style="float:right;"><a style="background-color:#eea807;color:white;"
                                    href="${ctx}/contradiction/ccmContradictionDeal/?handleStatus=02">办理中事件</a></li>
        <li style="float:right;"><a style="background-color:#f83d3d;color:white;"
                                    href="${ctx}/contradiction/ccmContradictionDeal/?handleStatus=01">待办事件</a></li>
        <li style="float:right;" class="active"><a style="background-color: #3bb4f2;color: white;"
                                                   href="${ctx}/contradiction/ccmContradictionDeal">事件处理列表</a></li>
    </ul>
    <form:form id="searchForm" modelAttribute="ccmEventCasedeal"
               action="${ctx}/contradiction/ccmContradictionDeal/" method="post"
               class="breadcrumb form-search">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden"
               value="${page.pageSize}"/>
        <ul class="ul-form">
            <li><label>事件名称：</label> <form:input path="caseName"
                                                 htmlEscape="false" maxlength="64" class="input-medium"/></li>

            <li><label>事件状态：</label>
                <form:select path="status" class="input-medium">
                    <form:option value="" label="全部"/>
                    <form:options items="${fns:getDictList('ccm_event_status')}" itemLabel="label" itemValue="value"
                                  htmlEscape="false"/>
                </form:select>
            </li>
            <!--
			<li><label>处理人员：</label>
				<sys:treeselect id="handleUser" name="handleUser.id" value="${ccmEventCasedeal.handleUser.id}" labelName="handleUser.name" labelValue="${ccmEventCasedeal.handleUser.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li> -->
            <li><label>处理截至时间：</label>
                <input name="beginHandleDeadline" type="text" readonly="readonly" maxlength="20"
                       class="input-medium Wdate"
                       value="<fmt:formatDate value="${ccmEventCasedeal.beginHandleDeadline}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> -
                <input name="endHandleDeadline" type="text" readonly="readonly" maxlength="20"
                       class="input-medium Wdate"
                       value="<fmt:formatDate value="${ccmEventCasedeal.endHandleDeadline}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
            </li>
            <li class="btns">
                <a href="javascript:;" id="btnSubmit" class="btn btn-primary">
                    <i class="icon-search"></i> 查询 </a>
            </li>
            <li class="clearfix"></li>
        </ul>
    </form:form>
    <sys:message content="${message}"/>
    <table id="contentTable"
           class="table table-striped table-bordered table-condensed table-gradient">
        <thead>
        <tr>
            <th>事件名称</th>
            <th>事件状态</th>
            <th>处理人员</th>
            <th>处理截至时间</th>
            <th>是否督办</th>
            <th>任务处理状态</th>
            <shiro:hasPermission name="contradiction:ccmContradictionDeal:edit">
                <th>操作</th>
            </shiro:hasPermission>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="ccmEventCasedeal">
            <tr>
                <td>
                    <c:if test="${ccmEventCasedeal.objType eq 'ccm_event_incident'}">
                        <a onclick="parent.LayerDialog('${ctx}/contradiction/ccmContradictionDeal/detail?id=${ccmEventCasedeal.objId}', '案事件详情', '1100px', '700px')">
                                ${ccmEventCasedeal.caseName} </a>
                    </c:if>
                    <c:if test="${ccmEventCasedeal.objType eq 'ccm_event_ambi'}">
                        <a onclick="parent.LayerDialog('${ctx}/contradiction/ccmContradictionDeal/detail?id=${ccmEventCasedeal.objId}', '矛盾纠纷详情', '1100px', '700px')">
                                ${ccmEventCasedeal.caseName} </a>
                    </c:if>
                    <c:if test="${ccmEventCasedeal.objType eq 'ccm_event_request'}">
                        <a onclick="parent.LayerDialog('${ctx}/event/ccmEventRequest/detail?id=${ccmEventCasedeal.objId}', '请求详情', '1100px', '700px')">
                                ${ccmEventCasedeal.caseName} </a>
                    </c:if>
                    <c:if test="${ccmEventCasedeal.objType eq 'ccm_wechat_event'}">
                        <a onclick="parent.LayerDialog('${ctx}/event/wechat/ccmWechatEvent/detail?id=${ccmEventCasedeal.objId}', '微信上报详情', '1100px', '700px')">
                                ${fns:abbr(ccmEventCasedeal.caseName,15)}</a>
                    </c:if>
                </td>


                <td>
					<span class="eventScaleCss statusCss-${ccmEventCasedeal.status}">
                            ${fns:getDictLabel(ccmEventCasedeal.status, 'ccm_event_status', '')}
                    </span>
                </td>
                <td>
                        ${ccmEventCasedeal.handleUser.name}
                </td>


                <td>
                    <c:choose>
                        <c:when test="${ccmEventCasedeal.isExtension eq '1'}">
								<span style="color:#F00">
									<fmt:formatDate value="${ccmEventCasedeal.handleDeadline}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;超期！
								</span>
                        </c:when>
                        <c:otherwise>
                            <fmt:formatDate value="${ccmEventCasedeal.handleDeadline}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </c:otherwise>
                    </c:choose>
                </td>


                <td>
                        ${fns:getDictLabel(ccmEventCasedeal.isSupervise, 'yes_no', '')}
                </td>
                <td>
						<span class="eventScaleCss statusCss-${ccmEventCasedeal.handleStatus}">
                                ${fns:getDictLabel(ccmEventCasedeal.handleStatus, 'ccm_event_status', '')}
                        </span>
                    <c:if test="${ccmEventCasedeal.manageType != null}">
                        <img src="${ctxStatic}/images/arrows.png">
                        <span class="eventScaleCss statusCss-${ccmEventCasedeal.handleStatus}">
                                ${fns:getDictLabel(ccmEventCasedeal.manageType, 'manage_type', '')}
                        </span>
                    </c:if>
                </td>
                <shiro:hasPermission name="contradiction:ccmContradictionDeal:edit">
                    <td>

                        <a class="btnList"
                           onclick="parent.LayerDialog('${ctx}/contradiction/ccmContradictionDeal/form?id=${ccmEventCasedeal.id}','处理', '1100px', '700px')"><i
                                class="iconfont icon-caozuotubiao-xiugai"></i></a>
                        <a class="btnList"
                           href="${ctx}/contradiction/ccmContradictionDeal/delete?id=${ccmEventCasedeal.id}"
                           onclick="return confirmx('确认要删除该事件处理吗？', this.href)" title="删除"><i
                                class="iconfont icon-caozuotubiao-shanchu"></i></a>

                    </td>
                </shiro:hasPermission>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</div>
</body>
</html>