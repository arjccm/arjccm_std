<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>围栏报警管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
		$(document).ready(function() {
			$("#btnSubmit").on("click" ,function(){
				$("#searchForm").submit();
			})
		});
	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="ccmElecfenceAlarm"
		action="${ctx}/fenceAlarm/ccmElecfenceAlarm" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li>
				<label>人员姓名：</label> 
				<form:input path="ccmPeople.name"
					htmlEscape="false" maxlength="64" class="input-medium" />
			</li>
			<li>
				<label>设备标识：</label>
				<form:input path="ccmDevice.deviceId" htmlEscape="false" maxlength="64" class="input-medium" />
			</li>
			<li><label>报警规则：</label>
				<form:select path="alarmType" class="input-large">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('fence_alarm_rule')}"
						itemLabel="label" itemValue="value" htmlEscape="false" maxlength="3" class="input-medium" />
				</form:select>
			</li>
			<li>
				<label>日期范围：</label>
				<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmElecfenceAlarm.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmElecfenceAlarm.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><a href="javascript:;" id="btnSubmit"
				class="btn btn-primary"> <i class="icon-search"></i> 查询
			</a></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>人员姓名</th>
				<th>设备标识码</th>
				<th>使用者</th>
				<th>报警时间</th>
				<th>报警类型</th>
				<th>是否核实</th>
				<th>警情描述</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmElecfenceAlarm">
			<tr>
				<td>
					${ccmElecfenceAlarm.ccmPeople.name}
				</td>
				<td>
					${ccmElecfenceAlarm.ccmDevice.deviceId}
				</td>
				<td>
					${ccmElecfenceAlarm.userName}
				</td>
				<td>
					<fmt:formatDate value="${ccmElecfenceAlarm.alarmTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(ccmElecfenceAlarm.alarmType, 'fence_alarm_rule', '')} 
				</td> 
				<td>
					<span style="color:#F00">
						已核实
					</span>
				</td> 
				<td>
					${ccmElecfenceAlarm.remarks}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>