<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>巡检考评管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
            $('#btnSubmit').click(function(){
                $('#searchForm').submit();
            });
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
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">巡检考评</span>--%>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="${ctx}/patrollog/ccmPatrolCheck/">巡检考评列表</a></li>
		<shiro:hasPermission name="patrollog:ccmPatrolCheck:edit"><li style="display:none;"><a style="text-align:center" href="${ctx}/patrollog/ccmPatrolCheck/form">巡检考评添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmPatrolCheck" action="${ctx}/patrollog/ccmPatrolCheck/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="first-line"><label>巡检内容：</label>
				<form:input path="patrolContent" htmlEscape="false" maxlength="2000" class="input-small"/>
			</li>
			<li class="first-line"><label>登记开始日期：</label>
				<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmPatrolCheck.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> </li>
			<li class="first-line"><label>登记结束日期：</label>	<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmPatrolCheck.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="first-line"><label>考评人：</label>
				<form:input path="checkPerson" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li class="first-line" style="display:none;"><label>分数：</label>
				<form:input path="score" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="second-line"><label>登记人：</label>
				<form:input path="createBy.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<ul>
		<a href="javascript:;" id="btnSubmit" style="width: 49px;margin-right: 14px;
    margin-bottom: 20px;/*margin-top: 25px;*/display:inline-block;float: right;margin-left: 20px" class="btn btn-primary">
			<%--<i class="icon-search"></i> --%><span style="font-size: 12px">查询</span> </a>
	</ul>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>照片</th>
				<th>巡检内容</th>
				<th>登记时间</th>
				<th>登记人</th>
				<th>考评人</th>
				<th>分数</th>
				<shiro:hasPermission name="patrollog:ccmPatrolCheck:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmPatrolCheck">
			<tr>
				<td width="100px">
					<img src="${ccmPatrolCheck.image}" style="height:50px;"/>
				</td>
				<td><a href="${ctx}/patrollog/ccmPatrolCheck/form?id=${ccmPatrolCheck.id}">
						${ccmPatrolCheck.patrolContent}
				</a>
				</td>
				<td>
					<fmt:formatDate value="${ccmPatrolCheck.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${ccmPatrolCheck.createBy.name}
				</td>
				<td>
					${ccmPatrolCheck.checkPerson}
				</td>
				<td>
					${ccmPatrolCheck.score}
				</td>
				<shiro:hasPermission name="patrollog:ccmPatrolCheck:edit"><td>
					<a class="btnList" href="${ctx}/patrollog/ccmPatrolCheck/form?id=${ccmPatrolCheck.id}" title="评分"><i class="iconfont icon-caozuotubiao-pingfen"></i></a>
					<%-- <a class="btnList" href="${ctx}/patrollog/ccmPatrolCheck/delete?id=${ccmPatrolCheck.id}" onclick="return confirmx('确认要删除该巡检考评吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a> --%>
    <%-- 				<a href="${ctx}/patrollog/ccmPatrolCheck/form?id=${ccmPatrolCheck.id}">修改</a>
					<a href="${ctx}/patrollog/ccmPatrolCheck/delete?id=${ccmPatrolCheck.id}" onclick="return confirmx('确认要删除该巡检考评吗？', this.href)">删除</a> --%>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>