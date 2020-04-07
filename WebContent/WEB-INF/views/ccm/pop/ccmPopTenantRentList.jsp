<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>房屋管理</title>
<meta name="decorator" content="default" />

<script type="text/javascript"
	src="${ctxStatic}/ccm/pop/js/ccmTenantInfo.js"></script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">出租房管理</span>--%>
<div class="back-list clearfix">
	<!-- 导入、导出模块 -->
	<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/pop/ccmPopTenant/import"
			method="post" enctype="multipart/form-data" class="form-search"
			style="padding-left: 20px; text-align: center;"
			onsubmit="loading('正在导入，请稍等...');">
			<br /> <input id="uploadFile" name="file" type="file"
				style="width: 330px" /><br /> <br /> <input id="btnImportSubmit"
				class="btn btn-primary" type="submit" value="导  入 " />
		</form>
	</div>

	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/pop/ccmPopTenant/list/rent" >数据列表</a></li>
		<%-- 去掉添加功能 		<shiro:hasPermission name="pop:ccmPopTenant:edit"><li><a href="${ctx}/pop/ccmPopTenant/form">房屋添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmPopTenant"
		action="${ctx}/pop/ccmPopTenant/list/rent" method="post"
		class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form pull-left">
			<li class="first-line"><label class="title-text">房屋编号：</label> <form:input path="houseBuild"
					htmlEscape="false" maxlength="50" class="input-medium" /></li>
			<li class="first-line"><label class="title-text">所属网格：</label> <sys:treeselect id="area"
					name="area.id" value="${ccmPopTenant.area.id}"
					labelName="area.name" labelValue="${ccmPopTenant.area.name}"
					title="网格" url="/tree/ccmTree/treeDataArea?type=7&areaid="
					cssClass="input-medium" allowClear="true"
					notAllowSelectParent="true" /></li>
			<li class="first-line"><label class="title-text">出租用途：：</label>
				<form:select path="rentPur" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_let_use')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></li>

			<li class="first-line"><label class="title-text">房主姓名：</label> <form:input path="houseName"
					htmlEscape="false" maxlength="50" class="input-medium" /></li>
			<li class="first-line"><label class="title-text">房屋地址：</label> <form:input path="housePlace"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>

			<!-- <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li> -->
		</ul>


	<div class="clearfix pull-right btn-box">
		<shiro:hasPermission
				name="tenant:ccmTenantRecord:export">
			<a href="javascript:;" id="btnExport" class="btn btn-export" style="width: 49px;display:inline-block;float: right;"> <i
					></i> 导出
			</a>
		</shiro:hasPermission> <!-- 添加该input的点击方法为 return page();--> <!-- <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();" /> -->
			<a href="javascript:;" id="btnSubmit" class="btn btn-primary" style="width: 49px;display:inline-block;float: right;"> <i
					></i> 查询
			</a>
	</div>
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>楼门号</th>
				<th>门牌号</th>
				<th>房屋编号</th>
				<th>状态</th>
				<th>所属网格</th>
				<th>所属楼栋</th>
				<th>房主姓名</th>
				<th>房屋地址</th>
				<th>建筑面积(平方米）</th>
                <th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="ccmPopTenant">
				<tr>
					<td>${ccmPopTenant.buildDoorNum}</td>
					<td><a
						href="${ctx}/pop/ccmPopTenant/form/?id=${ccmPopTenant.id}">
							${ccmPopTenant.doorNum} </a></td>
					<td>${ccmPopTenant.houseBuild}</td>
					<td>${fns:getDictLabel(ccmPopTenant.houseType, 'ccm_pop_tenant_type', '')}</td>
					<td>${ccmPopTenant.area.name}</td>
					<td>${ccmPopTenant.buildingId.buildname}</td>
					<td>${ccmPopTenant.houseName}</td>
					<td class="" style="height: 50px">${ccmPopTenant.housePlace}</td>
					<td>${ccmPopTenant.houseArea}</td>
					<td><shiro:hasPermission name="pop:ccmPopTenant:edit">
							<a class="btnList"
								href="${ctx}/pop/ccmPopTenant/form/?id=${ccmPopTenant.id}"
								title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
							<a class="btnList"
								href="${ctx}/pop/ccmPopTenant/delete/?id=${ccmPopTenant.id}"
								onclick="return confirmx('确认要删除该房屋吗？', this.href)" title="删除"><i
								class="iconfont icon-caozuotubiao-shanchu"></i></a>
							<a class="btnList"
								href="${ctx}/pop/ccmPeople/getPeoListByHouse?houseId=${ccmPopTenant.id}&type=hire"
								title="住户管理"><i class="iconfont icon-caozuotubiao-shejiaoguanxi"></i></a>
							<a class="btnList" onclick="parent.LayerDialog('${ctx}/log/ccmLogTail/list?relevance_id=${ccmPopTenant.id}&relevance_table=ccm_pop_tenant', '记录信息', '800px', '660px')" 
								  title="记录信息"><i class="iconfont icon-caozuotubiao-jiluxinxi" style="color: cornflowerblue;"></i></a>
							<a class="btnList"
								onclick="parent.LayerDialog('${ctx}/log/ccmLogTail/formPro?relevance_id=${ccmPopTenant.id}&relevance_table=ccm_pop_tenant', '添加记录', '800px', '660px')"
								title="添加记录"><i class="iconfont icon-caozuotubiao-tianjiachuli"></i></a>
						</shiro:hasPermission> 
						<shiro:hasPermission name="tenant:ccmTenantRecord:view">
							<a class="btnList"
								onclick="parent.LayerDialog('${ctx}/tenant/ccmTenantRecord/${ccmPopTenant.id}', '历史租客记录列表', '800px', '660px')"
								title="历史租客记录列表"><i class="iconfont icon-caozuotubiao-lishizukejiluliebiao"></i></a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>