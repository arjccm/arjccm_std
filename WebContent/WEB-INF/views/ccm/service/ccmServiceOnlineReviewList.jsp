<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>在线办事管理</title>
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
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">社区事务</span>--%>
<div class="back-list">
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/service/ccmServiceOnline/jumplist?etype=${etype}">数据列表</a></li>
		<!--  
		<shiro:hasPermission name="service:ccmServiceOnline:edit"><li><a href="${ctx}/service/ccmServiceOnline/form">在线办事添加</a></li></shiro:hasPermission>
		-->
	</ul>
	<form:form id="searchForm" modelAttribute="ccmServiceOnline" action="${ctx}/service/ccmServiceOnline/jumplist?etype=${etype}" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

		<ul class="ul-form pull-left">
			<li class="first-line"><label>事项分类：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('ccm_service_online_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="first-line"><label>审核状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('ccm_service_online_handle')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="first-line"><label >申请日期：</label> <input
					name="beginTime" type="text" readonly="readonly"
					maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmServiceOnline.beginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" /></li>
			<li class="first-line"><label>结束日期：</label><input
                        name="endTime" type="text" readonly="readonly"
					   maxlength="20" class="input-medium Wdate"
                       value="<fmt:formatDate value="${ccmServiceOnline.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			</li>
			<li class="first-line"><label>申请人：</label>
				<form:input path="applicant" htmlEscape="false" maxlength="256" class="input-medium"/>
			</li>
			<li class="second-line"><label>申请人身份证号码：</label>
				<form:input path="ident" htmlEscape="false" maxlength="18" class="input-medium"/>
			</li>
			<!-- <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li> -->

<%--			<li class="clearfix"></li>--%>
		</ul>
	<div class="clearfix pull-right btn-box">
		<a href="javascript:;" id="btnSubmit" style="width: 49px;
    /*margin-top: 25px;*/display:inline-block;float: right;" class="btn btn-primary">
				<%--<i class="icon-search"></i> --%><span style="font-size: 12px">查询</span> </a>
	</div>
	</form:form>
	<sys:message content="${message}"/>

	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>事项分类</th>
				<th>申请人</th>
				<th>申请人身份证号码</th>
				<th>申请人联系方式</th>
				<th>审核状态</th>
				<th>申请时间</th>
				<th>审核时间</th>
				<th>审核人</th>
				<shiro:hasPermission name="service:ccmServiceOnline:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmServiceOnline">
			<tr>
				<td><a href="${ctx}/service/ccmServiceOnline/form?id=${ccmServiceOnline.id}&etype=${etype}">
					${fns:getDictLabel(ccmServiceOnline.type, 'ccm_service_online_type', '')}
				</a></td>
				<td>
					${ccmServiceOnline.applicant}
				</td>
				<td>
					${ccmServiceOnline.ident}
				</td>
				<td>
					${ccmServiceOnline.telephone}
				</td>
				<td>
					${fns:getDictLabel(ccmServiceOnline.status, 'ccm_service_online_handle', '')}
				</td>
				<td>
					<fmt:formatDate value="${ccmServiceOnline.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${ccmServiceOnline.reviewDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
						${ccmServiceOnline.reviewer}
				</td>
				<shiro:hasPermission name="service:ccmServiceOnline:edit"><td>
					<c:if test="${etype eq '1'}">
						<a class="btnList" href="${ctx}/service/ccmServiceOnline/form?id=${ccmServiceOnline.id}&etype=${etype}" title="修改"><i class="icon-pencil"></i></a>
						<a class="btnList" href="${ctx}/service/ccmServiceOnline/delete?id=${ccmServiceOnline.id}" onclick="return confirmx('确认要删除该在线办事吗？', this.href)" title="删除"><i class="iconfont icon-icondaohangtubiao-shujucaijifenxi"></i></a>
					</c:if>
					<c:if test="${etype eq '2'}">
						<a class="btnList" href="${ctx}/service/ccmServiceOnline/form?id=${ccmServiceOnline.id}&etype=${etype}" title="审核"><i class="icon-user"></i></a>
					</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>