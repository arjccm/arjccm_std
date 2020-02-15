<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员疫情管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
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
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/pop/ccmPeopleAntiepidemic/">人员疫情列表</a></li>
		<shiro:hasPermission name="pop:ccmPeopleAntiepidemic:edit"><li><a href="${ctx}/pop/ccmPeopleAntiepidemic/form">人员疫情添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmPeopleAntiepidemic" action="${ctx}/pop/ccmPeopleAntiepidemic/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<%-- <li><label>电话号码：</label>
				<form:input path="telephone" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li> --%>
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<%-- <li><label>性别：</label>
				<form:input path="sex" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li> 
			<li><label>身份证号：</label>
				<form:input path="idNumber" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>--%>
			<li><label>年龄段：</label>
				<form:input path="age" htmlEscape="false" maxlength="128" class="input-medium"/>
			</li>
			<li><label>户籍地：</label>
				<form:input path="domicile" htmlEscape="false" maxlength="128" class="input-medium"/>
			</li>
			<li><label>采取何种措施：</label>
				<form:select path="takeSteps">
						<form:option value="" label="" />
						<form:options items="${fns:getDictList('sys_ccm_people_takeSteps')}"
							itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</li>
			<li><label>来琼乘坐交通工具：</label>
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
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>性别</th>
				<th>身份证号</th>
				<th>户籍地</th>
				<th>在琼居住地</th>
				<th>采取何种措施</th>
				<th>更新时间</th>
				<shiro:hasPermission name="pop:ccmPeopleAntiepidemic:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmPeopleAntiepidemic">
			<tr>
				<td><a href="${ctx}/pop/ccmPeopleAntiepidemic/form?id=${ccmPeopleAntiepidemic.id}">
					${ccmPeopleAntiepidemic.name}
				</a></td>
				<td>
					${fns:getDictLabel(ccmPeopleAntiepidemic.sex, 'sex', '')}
				</td>
				<td>
					${ccmPeopleAntiepidemic.idNumber}
				</td>
				<td>
					${ccmPeopleAntiepidemic.domicile}
				</td>
				<td>
					${ccmPeopleAntiepidemic.habitation}
				</td>
				<td>
					${ccmPeopleAntiepidemic.takeSteps}
				</td>
				<td>
					<fmt:formatDate value="${ccmPeopleAntiepidemic.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
		
				<shiro:hasPermission name="pop:ccmPeopleAntiepidemic:edit"><td>
    				<a href="${ctx}/pop/ccmPeopleAntiepidemic/form?id=${ccmPeopleAntiepidemic.id}">修改</a>
					<a href="${ctx}/pop/ccmPeopleAntiepidemic/delete?id=${ccmPeopleAntiepidemic.id}" onclick="return confirmx('确认要删除该人员疫情吗？', this.href)">删除</a>
					<a href="${ctx}/pop/ccmPeopleAntiepidemic/details?id=${ccmPeopleAntiepidemic.id}">详情</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>