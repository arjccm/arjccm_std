<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>名单库管理</title>
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
		function gatlists() {
			$.getJSON("/arjccm/a/list/ccmList/getCcmList",function(data){
				if(data.code == 0){
					alert("获取名单库中");
				}else{
					alert("配置信息有误");
				}
			})
		};
	</script>
	<script src="${ctxStatic}/ccm/event/js/ccmEventIncident.js" type="text/javascript"></script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/list/ccmList/">数据列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmList" action="${ctx}/list/ccmList/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>类型：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_list_type')}"
						itemLabel="label" itemValue="value" htmlEscape="false"
						class="required" />
				</form:select>
			</li>

			<li class="btns">
				<a onclick="gatlists()" class="btn btn-primary" style="width: 120px !important;">
					<i class="icon-refresh"></i> 获取名单库数据
				</a>
			</li>
			<li class="btns">
				<a onclick="parent.LayerDialog('${ctx}/list/ccmList/form', '添加', '600px', '500px')" class="btn btn-primary">
					<i class="iconfont icon-caozuotubiao-tianjiachuli"></i> 添加
				</a>
			</li>
			<li class="btns">
				<a href="javascript:;" id="btnSubmit" class="btn btn-primary"> 
					<i class="icon-search"></i> 查询
				</a>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>描述</th>
				<th>类别</th>
				<th>备注信息</th>
				<th>更新时间</th>
				<shiro:hasPermission name="list:ccmList:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmList">
			<tr>
				<td><a class="btnList" onclick="parent.LayerDialog('${ctx}/list/ccmList/form?id=${ccmList.id}', '编辑', '600px', '500px')" title="修改">
					${ccmList.name}
				</a></td>
				<td>
					${ccmList.description}
				</td>
				<td>
					${fns:getDictLabel(ccmList.type, 'ccm_list_type', '无')}
				</td>
				<td class="tp">
					${ccmList.remarks}
				</td>
				<td>
					<fmt:formatDate value="${ccmList.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="list:ccmList:edit">
				<td>
					<a class="btnList" onclick="parent.LayerDialog('${ctx}/list/ccmList/form?id=${ccmList.id}', '编辑', '600px', '500px')" title="修改">
						<i class="iconfont icon-caozuotubiao-xiugai"></i>
					</a> 
					<a class="btnList" href="${ctx}/list/ccmList/delete?id=${ccmList.id}"
							onclick="return confirmx('确认要删除该名单库吗？', this.href)" title="删除">
						<i class="iconfont icon-caozuotubiao-shanchu"></i>
					</a>
				</td>
				</shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>