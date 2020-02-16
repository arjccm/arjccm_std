<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员疫情管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/jquery-cityselect/main.css" />
	<script type="text/javascript" src="${ctxStatic}/jquery-cityselect/jquery.cityselect.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			if($("#getdomicile").val()!="" && $("#getdomicile").val()!=null && $("#getdomicile").val()!=undefined){
				var getdomicile = $("#getdomicile").val().split(",");
				var provval,cityval;
				provval = getdomicile[0];
				if( getdomicile[1]!=""){
					cityval = getdomicile[1];
					$("#city").citySelect({
						prov: provval,
						city: cityval
					});
				} else {
					$("#city").citySelect({
						prov: provval,
						nodata:"none"
					});
				}
			} else {
				$("#city").citySelect({
					nodata:"none",
					required:false
				});
			}
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery/jquery.cookie.js" type="text/javascript"></script>
	<link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'black'}/bootstrap.min.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'black'}/custom.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="${ctxStatic}/layim/layui/css/layui.css" type="text/css" rel="stylesheet" />

	<link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/bootstrap/checkbox-radio.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/iconfont/iconfont.css" type="text/css" rel="stylesheet" />
	<!--[if lte IE 7]><link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome-ie7.min.css" type="text/css" rel="stylesheet" /><![endif]-->
	<!--[if lte IE 6]><link href="${ctxStatic}/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->
	<%-- <link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" /> --%>
	<script src="${ctxStatic}/stomp-websocket-master/stomp.js"></script>
	<%-- <script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script> --%>
	<link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.method.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.11.1/localization/messages_zh.js" type="text/javascript"></script>
	<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
	<link href="${ctxStatic}/common/jeesite.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
	<link href="${ctxStatic}/common/menu.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/common/pgwmenu.js" type="text/javascript"></script>
	<link href="${ctxStatic}/bootstrap/bootstrapTable/css/bootstrap-table.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/bootstrap/bootstrapTable/js/bootstrap-table.js" type="text/javascript"></script>
	<script src="${ctxStatic}/bootstrap/bootstrapTable/js/bootstrap-table-zh-CN.js" type="text/javascript"></script>
	<link href="${ctxStatic}/mCustomScrollbar/jquery.mCustomScrollbar.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/mCustomScrollbar/jquery.mCustomScrollbar.js" type="text/javascript"></script>
	<script src="${ctxStatic}/lightbox/js/lightbox.js" type="text/javascript"></script>
	<link href="${ctxStatic}/lightbox/css/lightbox.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/Particleground/Particleground.js" type="text/javascript"></script>
	<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
	<%-- <%@include file="/WEB-INF/views/include/layUI.jsp" %> --%>
</head>
<body>
<div class="back-list">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/pop/ccmPeopleAntiepidemic/">人员疫情列表</a></li>
		<shiro:hasPermission name="pop:ccmPeopleAntiepidemic:edit"><li><a href="${ctx}/pop/ccmPeopleAntiepidemic/form">人员疫情添加</a></li></shiro:hasPermission>
	</ul>
	<input id="getdomicile" type="hidden" value="${ccmPeopleAntiepidemic.domicile}"/>
	<form:form id="searchForm" modelAttribute="ccmPeopleAntiepidemic" action="${ctx}/pop/ccmPeopleAntiepidemic/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<%-- <li><label>电话号码：</label>
				<form:input path="telephone" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li> --%>
			<li class="first-line"><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<%-- <li><label>性别：</label>
				<form:input path="sex" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li> 
			<li><label>身份证号：</label>
				<form:input path="idNumber" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>--%>
			<li class="first-line"><label>年龄段：</label>
				<form:select path="ageType" cssStyle="width: 175px">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('sys_ccm_peopleantiepidemic_age')}"
								  itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</li>
			<li class="first-line"><label>户籍地：</label>
				<form:input path="domicile" htmlEscape="false" maxlength="128" class="input-medium"/>
				<%--<div id="city">--%>
					<%--<select class="prov" name="domicile"></select>--%>
					<%--<select class="city" disabled="disabled" name="domicile"></select>--%>
				<%--</div>--%>
			</li>
			<li class="first-line" style="margin-top: 10px"><label>采取何种措施：</label>
				<form:select path="takeSteps" cssStyle="width: 175px">
						<form:option value="" label="" />
						<form:options items="${fns:getDictList('sys_ccm_people_takeSteps')}"
							itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</li>
				<li class="first-line" style="margin-top: 10px"><label>身体状况：</label>
					<form:select path="health" cssStyle="width: 175px">
						<form:option value="" label="" />
						<form:options items="${fns:getDictList('sys_ccm_people_health')}"
									  itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select>
				</li>
			<li class="second-line"><label>来琼交通工具：</label>
				<form:input path="transportation" htmlEscape="false" maxlength="128" class="input-medium"/>
			</li>
			<%-- <li><label>离鄂时间：</label>
				<input name="leaveHubeiDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmPeopleAntiepidemic.leaveHubeiDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li> 
			<li><label>入琼时间：</label>
				<input name="comeHainanDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmPeopleAntiepidemic.comeHainanDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>离岛时间：</label>
				<input name="leftDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmPeopleAntiepidemic.leftDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>有无采取措施：</label>
				<form:input path="doesTakeSteps" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>是否移交卫健委：</label>
				<form:input path="isTransferHc" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>手机归属地：</label>
				<form:input path="telephoneHome" htmlEscape="false" maxlength="16" class="input-medium"/>
			</li>
			<li><label>下发所属市县：</label>
				<form:input path="distributeCity" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>下发数据批次：</label>
				<form:input path="distributeNo" htmlEscape="false" maxlength="16" class="input-medium"/>
			</li>
			<li><label>核查人：</label>
				<form:input path="checkName" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>核查人联系方式：</label>
				<form:input path="checkTel" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>上报时间：</label>
				<input name="reportDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmPeopleAntiepidemic.reportDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>上报状态：</label>
				<form:input path="reportStatus" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>所属市局：</label>
				<form:input path="belongBureau" htmlEscape="false" max	length="32" class="input-medium"/>
			</li>
			<li><label>所属分局：</label>
				<form:input path="belongSubBureau" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>所属派出所：</label>
				<form:input path="belongPoliceStation" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>数据类型：</label>
				<form:input path="dataType" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>数据状态：</label>
				<form:input path="dataStatus" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>--%>
			<li class="btns" style="margin-top: 10px"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>姓名</th>
				<th>性别</th>
				<th>身份证号</th>
				<th>户籍地</th>
				<th>是否14天以内</th>
				<th>采取何种措施</th>
				<th>更新时间</th>
				<shiro:hasPermission name="pop:ccmPeopleAntiepidemic:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmPeopleAntiepidemic">
			<tr>
				<td style="height: 50px"><a href="${ctx}/pop/ccmPeopleAntiepidemic/form?id=${ccmPeopleAntiepidemic.id}">
					${ccmPeopleAntiepidemic.name}
				</a></td>
				<td style="height: 50px">
					${fns:getDictLabel(ccmPeopleAntiepidemic.sex, 'sex', '')}
				</td>
				<td style="height: 50px">
					${ccmPeopleAntiepidemic.idNumber}
				</td>
				<td style="height: 50px">
					${ccmPeopleAntiepidemic.domicile}
				</td>
				<td style="height: 50px">
					${fns:getDictLabel(ccmPeopleAntiepidemic.isIn14days, 'is_key_place', '')}
				</td>
				<td style="height: 50px">
					${fns:getDictLabel(ccmPeopleAntiepidemic.takeSteps, 'sys_ccm_people_takeSteps', '')}
				</td>
				<td style="height: 50px">
					<fmt:formatDate value="${ccmPeopleAntiepidemic.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
		
				<shiro:hasPermission name="pop:ccmPeopleAntiepidemic:edit"><td style="height: 50px">
					<a class="btnList"  href="${ctx}/pop/ccmPeopleAntiepidemic/form?id=${ccmPeopleAntiepidemic.id}" title="修改"><i class="icon-pencil"></i></a>
					<a class="btnList" href="${ctx}/pop/ccmPeopleAntiepidemic/delete?id=${ccmPeopleAntiepidemic.id}" onclick="return confirmx('确认要删除该人员疫情吗？', this.href)"  title="删除"><i class="icon-remove-sign"></i></a>
					<a class="btnList" href="${ctx}/pop/ccmPeopleAntiepidemic/details?id=${ccmPeopleAntiepidemic.id}" title="详情"><i class="icon-file"></i></a>
						<%--<a href="${ctx}/pop/ccmPeopleAntiepidemic/form?id=${ccmPeopleAntiepidemic.id}">修改</a>--%>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</div>
</body>
</html>