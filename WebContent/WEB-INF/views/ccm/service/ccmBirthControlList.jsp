<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>计生管理管理</title>
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
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/service/ccmBirthControl/">数据列表</a></li>
		<shiro:hasPermission name="service:ccmBirthControl:edit"><li><a style="text-align:center" href="${ctx}/service/ccmBirthControl/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmBirthControl" action="${ctx}/service/ccmBirthControl/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>开始日期：</label>
				<input name="beginRelDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmBirthControl.beginRelDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> </li>
			<li><label>结束日期：</label><input name="endRelDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmBirthControl.endRelDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>类型：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('ccm_birth_control_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<!-- <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li> -->
			<li class="btns">
			<a href="javascript:;" id="btnSubmit" class="btn btn-primary" style="width: 49px;margin-top: 5px;display:inline-block;float: right;">
				<span style="font-size: 12px">查询</span> </a>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>标题</th>
				<th>日期</th>
				<th>类型</th>
				<th>更新时间</th>
				<shiro:hasPermission name="service:ccmBirthControl:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmBirthControl">
			<tr>
				<td><a href="${ctx}/service/ccmBirthControl/form?id=${ccmBirthControl.id}">
					${ccmBirthControl.title}
				</a></td>
				<td>
					<fmt:formatDate value="${ccmBirthControl.relDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(ccmBirthControl.type, 'ccm_birth_control_type', '')}
				</td>
				<td>
					<fmt:formatDate value="${ccmBirthControl.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="service:ccmBirthControl:edit"><td>
    				<a class="btnList" href="${ctx}/service/ccmBirthControl/form?id=${ccmBirthControl.id}" title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
					<a class="btnList" href="${ctx}/service/ccmBirthControl/delete?id=${ccmBirthControl.id}" onclick="return confirmx('确认要删除该计生管理吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</div>
</body>
</html>