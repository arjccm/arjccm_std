<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>护路护线管理</title>
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
		<li class="active"><a class="nav-head" href="${ctx}/line/ccmLineProtect/">数据列表</a></li>
		<shiro:hasPermission name="line:ccmLineProtect:edit"><li><a href="${ctx}/line/ccmLineProtect/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmLineProtect" action="${ctx}/line/ccmLineProtect/" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form pull-left">
			<li class="first-line"><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="first-line"><label>线路类型：</label>
				<form:select path="lineType" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_line_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="first-line"><label>治安隐患等级：</label>
				<form:select path="dangGrade" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_secu_grade')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<!-- <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li> -->

<%--			<li class="clearfix"></li>--%>
		</ul>


	<div id="searchFormbtn-box2" class="clearfix pull-right ">

			<a href="javascript:;" id="btnSubmit" class="btn btn-primary" style="width: 49px;display:inline-block;float: left">
				<i></i><span style="font-size: 12px">查询</span> </a>

	</div>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>名称</th>
				<th>线路类型</th>
				<th>治安隐患等级</th>
				<th>隶属单位名称</th>
				<th>隶属单位负责人</th>
				<th>隶属单位负责人联系方式</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmLineProtect">
			<tr>
				<td><a href="${ctx}/line/ccmLineProtect/form?id=${ccmLineProtect.id}">
					${ccmLineProtect.name}
				</a></td>
				<td>
					${fns:getDictLabel(ccmLineProtect.lineType, 'ccm_line_type', '')}
				</td>
				<td>
					${fns:getDictLabel(ccmLineProtect.dangGrade, 'ccm_secu_grade', '')}
				</td>
				<td>
					${ccmLineProtect.compName}
				</td>
				<td>
					${ccmLineProtect.compPrinName}
				</td>
				<td>
					${ccmLineProtect.compPrinTel}
				</td>
				<td>
				<shiro:hasPermission name="line:ccmLineProtect:edit">
    				<a class="btnList" href="${ctx}/line/ccmLineProtect/form?id=${ccmLineProtect.id}" title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
					<a class="btnList" href="${ctx}/line/ccmLineProtect/delete?id=${ccmLineProtect.id}" onclick="return confirmx('确认要删除该护路护线吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				</shiro:hasPermission>
				<!-- 事件 编辑权限  --> 
				<shiro:hasPermission name="event:ccmEventIncident:edit">
					<a class="btnList" href="${ctx}/event/ccmEventIncident/formIncident?otherId=${ccmLineProtect.id}" title="添加案事件信息"><i class="iconfont icon-caozuotubiao-tianjiachuli"></i></a>
				</shiro:hasPermission>
				
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</ul>
</body>
</html>