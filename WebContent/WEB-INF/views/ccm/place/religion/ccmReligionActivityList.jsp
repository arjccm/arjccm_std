<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>宗教活动管理</title>
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
		<li class="active" style="width: 112px"><a href="${ctx}/religion/ccmReligionActivity/">数据列表</a></li>
		<shiro:hasPermission name="religion:ccmReligionActivity:edit"><li style="width: 112px"><a href="${ctx}/religion/ccmReligionActivity/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmReligionActivity" action="${ctx}/religion/ccmReligionActivity/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>活动名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>活动规模：</label>
				<form:select path="scale" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_activity_scale')}"
								  itemLabel="label" itemValue="value" htmlEscape="false"
								  class="required" />
				</form:select>
			</li>
			<li><label>活动类型：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_activity_type')}"
								  itemLabel="label" itemValue="value" htmlEscape="false"
								  class="required" />
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>活动名称</th>
				<th>活动规模</th>
				<th>活动类型</th>
				<th>活动负责人</th>
				<th>负责人联系电话</th>
				<th>开始日期</th>
				<th>结束日期</th>
				<shiro:hasPermission name="religion:ccmReligionActivity:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmReligionActivity">
			<tr>
				<td>
					<a href="${ctx}/religion/ccmReligionActivity/form?id=${ccmReligionActivity.id}">
						${ccmReligionActivity.name}
					</a>
				</td>
				<td>
						${fns:getDictLabel(ccmReligionActivity.scale, 'ccm_activity_scale', '无')}
				</td>
				<td>
						${fns:getDictLabel(ccmReligionActivity.type, 'ccm_activity_type', '无')}
				</td>
				<td>
						${ccmReligionActivity.head}
				</td>
				<td>
					${ccmReligionActivity.headPhone}
				</td>
				<td>
					<fmt:formatDate value="${ccmReligionActivity.beginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${ccmReligionActivity.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="religion:ccmReligionActivity:edit"><td>

					<a class="btnList"
					   href="${ctx}/religion/ccmReligionActivity/form?id=${ccmReligionActivity.id}"
					   title="修改"><i class="icon-pencil"></i></a> <a class="btnList"
																	 href="${ctx}/religion/ccmReligionActivity/delete?id=${ccmReligionActivity.id}"
																	 onclick="return confirmx('确认要删除该宗教活动吗？', this.href)" title="删除"><i
						class="iconfont icon-icondaohangtubiao-shujucaijifenxi"></i></a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>