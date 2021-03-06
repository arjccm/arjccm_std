<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>实时警情管理</title>
	<meta name="decorator" content="default" />
<link rel="stylesheet" href="${ctxStatic}/arjim/layui/css/layui.css" />
<link rel="stylesheet" href="${ctxStatic}/flat/bphAlarmDistribute/css/index.css" />
<script src="${ctxStatic}/common/common.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/alarm.js" type="text/javascript"></script>

<style>
	.layui-form  .layui-table-box .layui-table-header
</style>
<script>
var ctxStatic='${ctxStatic}',ctx='${ctx}';
</script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">警情管理</span>--%>
<div class="back-list clearfix" style="height: 925px">
	<div class="context" content="${ctx}"></div>
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/alarm/bphAlarmInfo/index">警情管理列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="bphAlarmInfo" action="" method="post" class="breadcrumb form-search clearfix">
		<ul class="ul-form pull-left">
			<li class="first-line"><label>接警单编号：</label>
				<form:input id="orderNum" path="orderNum" htmlEscape="false" maxlength="64" class="input-medium"/>
			</>
			<li class="first-line"><label>是否重大警情：</label>
				<form:select id="isImportant" path="isImportant" class="input-medium"  style="width: 165px;">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="first-line"><label>警情类型：</label>
				<form:select id="typeCode" path="typeCode" class="input-medium"  style="width: 165px;">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('bph_alarm_info_typecode')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="first-line"><label>开始日期：</label>
				<input id="beginAlarmTime" name="beginAlarmTime"  type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${bphAlarmInfo.beginAlarmTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> </li>
			<li class="first-line"><label>结束日期：</label>	<input id="endAlarmTime" name="endAlarmTime"  type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${bphAlarmInfo.endAlarmTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>

			<li class="second-line"><label>案发地点：</label>
				<form:input id="place" path="place"  htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="second-line"><label>警情状态：</label>
				<form:select id="state" path="state" class="input-medium" style="width: 165px;">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('bph_alarm_info_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="second-line"><label>处置状态：</label>
				<form:select path="handleStatus" class="input-medium"  style="width: 165px;">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('bph_alarm_info_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="second-line">
				<label for="querySon" style="padding-left: 42px;width: 100px;">是否查询下级</label>
				<input type="checkbox" name="incSubset" value="1" class="type-input" id="querySon">
			</li>
<%--			<li class="btns">--%>
<%--			<!-- <input id="btnSubmit" class="btn btn-primary" type="button" value="查询"/> -->--%>
<%--			</li>--%>
<%--			<li class="clearfix"></li>--%>
		</ul>
		<div class="clearfix pull-right btn-box">
			<a href="javascript:;" id="btnSubmit" style="width: 49px;
   /*margin-top: 25px;*/display:inline-block;float: right;" class="btn btn-primary">
				<%--<i class="icon-search"></i> --%><span style="font-size: 12px">查询</span> </a>
		</div>
		</form:form>
	<sys:message content="${message}"/>
	<div style="float: left; width: 98%; height: 98%;padding-left: 15px;" id="content">

		<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient"></table>
	</div>
<script type="text/javascript">
    var leftWidth = 0; // 左侧窗口大小
	var htmlObj = $("html"), mainObj = $(".common-height");
    var tableHeight=$(window).height()-120
	function wSize() {
		var strs = getWindowSize().toString().split(",");
		htmlObj.height(strs[0]);
		mainObj.height(htmlObj.height() - 60);
	}
</script>
<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/arjim/layui/layui.js" type="text/javascript"></script>
<script src="${ctxStatic}/flat/alarmCommon.js"></script>
<script src="${ctxStatic}/common/common.js" type="text/javascript"></script>
<script src="${ctxStatic}/flat/bphAlarmInfoList/bphAlarmInfoList.js" type="text/javascript"></script>
</body>
</html>