<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>重要会议管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnSubmit").on("click" ,function(){
				$("#searchForm").submit();
			})
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">事件管理</span>--%>
<ul class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/know/ccmKnowKeyMeeting/">数据列表</a></li>
		<shiro:hasPermission name="know:ccmKnowKeyMeeting:edit"><li style="width: 112px;"><a style="text-align: center" href="${ctx}/know/ccmKnowKeyMeeting/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmKnowKeyMeeting" action="${ctx}/know/ccmKnowKeyMeeting/" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form pull-left">
			<li class="first-line"><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="first-line"><label>开始日期：</label>
				<input name="beginTimeStart" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					   value="<fmt:formatDate value="${ccmKnowKeyMeeting.beginTimeStart}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> </li>
			<li class="first-line"><label>结束日期：</label>
				<input name="endTimeStart" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					   value="<fmt:formatDate value="${ccmKnowKeyMeeting.endTimeStart}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="first-line"><label>会议类型：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('ccm_know_key_meeting_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="first-line"><label>会议地点：</label>
				<form:input path="address" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="second-line"><label>参加人员：</label>
				<form:input path="attendee" htmlEscape="false" maxlength="256" class="input-medium"/>
			</li>
			<!-- <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li> -->
		</ul>
		<div class="clearfix pull-right btn-box">
			<a href="javascript:;" id="btnSubmit" class="btn btn-primary" style="width: 49px;display:inline-block;float: right;">
				<i></i><span style="font-size: 12px">查询</span>  </a>
		</div>
	</form:form>
	<sys:message content="${message}"/>

	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>标题</th>
				<th>会议类型</th>
				<th>开始时间</th>
				<th>会议地点</th>
				<th>参加人员</th>
				<shiro:hasPermission name="know:ccmKnowKeyMeeting:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmKnowKeyMeeting">
			<tr>
				<td style="white-space:normal;width:20%"><a href="${ctx}/know/ccmKnowKeyMeeting/form?id=${ccmKnowKeyMeeting.id}">
					${ccmKnowKeyMeeting.title}
				</a></td>
				<td>
					${fns:getDictLabel(ccmKnowKeyMeeting.type, 'ccm_know_key_meeting_type', '')}
				</td>
				<td>
					<fmt:formatDate value="${ccmKnowKeyMeeting.timeStart}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${ccmKnowKeyMeeting.address}
				</td>
				<td style="white-space:normal;width:20%">
					${ccmKnowKeyMeeting.attendee}
				</td>
				<shiro:hasPermission name="know:ccmKnowKeyMeeting:edit"><td>
    				<a class="btnList" href="${ctx}/know/ccmKnowKeyMeeting/form?id=${ccmKnowKeyMeeting.id}" title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
					<a class="btnList" href="${ctx}/know/ccmKnowKeyMeeting/delete?id=${ccmKnowKeyMeeting.id}" onclick="return confirmx('确认要删除该重要会议吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</ul>
</body>
</html>