<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>土地管理</title>
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
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">社会制单</span>--%>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/citycomponents/ccmLand/">数据列表</a></li>
		<shiro:hasPermission name="citycomponents:ccmLand:edit"><li><a style="text-align:center" href="${ctx}/citycomponents/ccmLand/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmLand" action="${ctx}/citycomponents/ccmLand/" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form pull-left">
			<li class="first-line"><label>地块名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="first-line"><label>地块编码：</label>
				<form:input path="code" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="first-line"><label>所属区域：</label>
				<sys:treeselect id="area" name="area.id" value="${ccmLand.area.id}" labelName="area.name" labelValue="${ccmLand.area.name}"
					title="区域" url="/tree/ccmTree/treeDataArea?type=6" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li class="first-line"><label>用地性质：</label>
				<form:select path="landUsage" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('ccm_land_usage')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="first-line"><label>土地用途：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('ccm_land_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<!-- <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li> -->
<%--			<li class="clearfix"></li>--%>
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
				<th>地块名称</th>
				<th>地块编码</th>
				<th>所属区域</th>
				<th>地块面积（平方米）</th>
				<th>用地性质</th>
				<th>土地用途</th>
				<shiro:hasPermission name="citycomponents:ccmLand:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmLand">
			<tr>
				<td><a href="${ctx}/citycomponents/ccmLand/form?id=${ccmLand.id}">
					${ccmLand.name}
				</a></td>
				<td>
					${ccmLand.code}
				</td>
				<td>
					${ccmLand.area.name}
				</td>
				<td>
					${ccmLand.landArea}
				</td>
				<td>
					${fns:getDictLabel(ccmLand.landUsage, 'ccm_land_usage', '')}
				</td>
				<td>
					${fns:getDictLabel(ccmLand.type, 'ccm_land_type', '')}
				</td>
				<shiro:hasPermission name="citycomponents:ccmLand:edit"><td>
    				<a class="btnList" href="${ctx}/citycomponents/ccmLand/form?id=${ccmLand.id}" title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
					<a class="btnList" href="${ctx}/citycomponents/ccmLand/delete?id=${ccmLand.id}" onclick="return confirmx('确认要删除该土地吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>