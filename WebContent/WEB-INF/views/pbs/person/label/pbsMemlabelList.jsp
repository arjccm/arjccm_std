<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>人物标签管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
  $(document).ready(function() {

  });
  function page(n, s) {
    $("#pageNo").val(n);
    $("#pageSize").val(s);
    $("#searchForm").submit();
    return false;
  }
</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/person/pbsMemlabel/">人物标签列表</a></li>
		<shiro:hasPermission name="person:pbsMemlabel:edit">
			<li><a href="${ctx}/person/pbsMemlabel/form">人物标签添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="pbsMemlabel"
		action="${ctx}/person/pbsMemlabel/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>学员：</label> <sys:treeselect id="sMemberid"
					name="sMemberid" value="${pbsMemlabel.sMemberid.id}" labelName=""
					labelValue="${pbsMemlabel.sMemberid.SName}" title="用户"
					url="/sys/pbsOffice/treeData?type=4" cssClass="input-small"
					allowClear="true" notAllowSelectParent="true" /></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>学员</th>
				<th>人物标签</th>
				<th>描述信息</th>
				<th>更新时间</th>
				<shiro:hasPermission name="person:pbsMemlabel:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="pbsMemlabel">
				<tr>
					<td><a
						href="${ctx}/person/pbsMemlabel/form?id=${pbsMemlabel.id}">
							${pbsMemlabel.sMemberid.SName} </a></td>
					<td>
						<c:if test="${not empty pbsMemlabel.SLabelids}">
							<c:set value="${fn:split(pbsMemlabel.SLabelids,',')}" var="pbsTypeList"/>
							<c:forEach items="${pbsTypeList}" var="pbsType" varStatus="index">
								<c:forEach items="${pbsLabelinfos}" var="pbsLabelList">
									<c:if test="${pbsType eq pbsLabelList.SType}">
										<c:if test ="${index.index eq 0}">
											${pbsLabelList.SName}
										</c:if>
										<c:if test ="${index.index ne 0}">
											，${pbsLabelList.SName}
										</c:if>
									</c:if>
								</c:forEach>
							</c:forEach>
						 </c:if>
					</td>
					<td>${pbsMemlabel.SDescription}</td>
					<td><fmt:formatDate value="${pbsMemlabel.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<shiro:hasPermission name="person:pbsMemlabel:edit">
						<td>
						<a href="${ctx}/person/pbsMemlabel/form?id=${pbsMemlabel.id}" title = "修改"><i class="icon iconfont icon-caozuotubiao-xiugai"></i></a>
						<a href="${ctx}/person/pbsMemlabel/delete?id=${pbsMemlabel.id}" onclick="return confirmx('确认要删除该课程信息吗？', this.href)" title = "删除"><i class="icon iconfont icon-caozuotubiao-shanchu"></i></a></td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>