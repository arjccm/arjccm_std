<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>移动设备管理</title>
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
		<li class="active"><a href="${ctx}/ccmsys/ccmMobileDevice/list2">数据列表</a></li>
		<%--<shiro:hasPermission name="ccmsys:ccmMobileDevice:edit"><li><a href="${ctx}/ccmsys/ccmMobileDevice/form2">数据添加</a></li></shiro:hasPermission>--%>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmMobileDevice" action="${ctx}/ccmsys/ccmMobileDevice/list2" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>设备唯一标识码：</label>
				<form:input path="deviceId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>授权状态：</label>
				<form:select path="isVariable" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('ccm_mobile_device_var')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>名字：</label>
				<sys:treeselect id="vCcmTeam" name="vCcmTeam.id" value="${ccmMobileDevice.vCcmTeam.id}" labelName="vCcmTeam.name" labelValue="${ccmMobileDevice.vCcmTeam.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>投入使用时间：</label>
				<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmMobileDevice.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmMobileDevice.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<input name="useType" type="hidden" value="02"/>
			<%--<li><label>应用类型：</label>--%>
				<%--<form:select path="useType" class="input-medium">--%>
					<%--<form:option value="" label="全部"/>--%>
					<%--<form:options items="${fns:getDictList('mobile_user_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
				<%--</form:select>--%>
			<%--</li>--%>
			<li><label>
			<li class="btns">
		<!-- 	<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/> -->
	      	<a href="javascript:;" id="btnSubmit" class="btn btn-primary">
				<span style="font-size: 12px">查询</span> </a>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>设备唯一标识码</th>
				<th>授权状态</th>
				<th>设备状态</th>
				<th>名字</th>
				<th>所属部门</th>
				<th>联系方式</th>
				<th>位置更新时间</th>
				<th>投入使用时间</th>
				<shiro:hasPermission name="ccmsys:ccmMobileDevice:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmMobileDevice">
			<tr>
				<td><a href="${ctx}/ccmsys/ccmMobileDevice/form2?id=${ccmMobileDevice.id}">
					${ccmMobileDevice.deviceId}
				</a></td>
				<td>
					<c:choose>
						<c:when test="${ccmMobileDevice.isVariable eq '01'}">
							<span style="color:#F00">
								${fns:getDictLabel(ccmMobileDevice.isVariable, 'ccm_mobile_device_var', '')}
							</span>
						</c:when>
						<c:otherwise>
							${fns:getDictLabel(ccmMobileDevice.isVariable, 'ccm_mobile_device_var', '')}
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					${fns:getDictLabel(ccmMobileDevice.vCcmTeam.status, 'ccm_mobile_device_status', '')} 
				</td> 
				<td>
					${ccmMobileDevice.vCcmTeam.name}
				</td>
				<td>
					${ccmMobileDevice.officeName}
				</td>
				<td>
					${ccmMobileDevice.vCcmTeam.mobile}
				</td>
				<td>
					<fmt:formatDate value="${ccmMobileDevice.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${ccmMobileDevice.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="ccmsys:ccmMobileDevice:edit"><td>
    				<a class="btnList" href="${ctx}/ccmsys/ccmMobileDevice/form2?id=${ccmMobileDevice.id}" title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
					<a class="btnList" href="${ctx}/ccmsys/ccmMobileDevice/delete?id=${ccmMobileDevice.id}" onclick="return confirmx('确认要删除该移动设备吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</div>
</body>
</html>