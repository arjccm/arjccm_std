<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>预处理事件管理</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/layer-v3.1.1/layer/theme/default/layer.css"
	rel="stylesheet" />
<script src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
	<script type="text/javascript"
			src="${ctxStatic}/plm/storage/ajaxMessageAlert.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#btnSubmit").on("click", function() {
				var begin = new Date($("[name='beginHappenDate']").val());
				var end = new Date($("[name='endHappenDate']").val());
				if(begin.getTime() > end.getTime()){
					messageAlert("开始时间大于结束时间！", "error");
					return false;
				}
				$("#searchForm").submit();
			});
		});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	function HandleTips(_this, id) {
		var html = '';
		html += '<div style="padding:10px;" >';
		html += '<p style="margin-botom:20px;">请做出选择</p >';
		html += '<div>';
		html += '<input id="btnSuccess" onclick="Pass('
				+ "&quot;"
				+ id
				+ "&quot;"
				+ ')" class="btn btn-primary " type="button" value="通过" style="background: #73a839">';
		html += '<input id="btnPass"  onclick="NoPass('
				+ "&quot;"
				+ id
				+ "&quot;"
				+ ')" class="btn btn-primary" type="button" value="拒绝" style="background: #c71c22">';
		html += '</div>';
		html += '</div>';
		tip_index = layer.tips(html, _this, {
			tips : [ 1, '#20c694' ],
			time : 3000,
		});
	}
	function Pass(id) {
		$.post('${ctx}/preview/ccmEventIncidentPreview/pass?status=02&id='+ id,function(data){
			if(data.code == '200'){
				$.jBox.tip('操作成功！');
				window.location.reload()
			}
		})
	}
	function NoPass(id) {
		$.post('${ctx}/preview/ccmEventIncidentPreview/pass?status=03&id='+ id,function(data){
			if(data.code == '200'){
				$.jBox.tip('操作成功！');
				window.location.reload()
			}
		})
	}
</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li style="float: right;"><a class="btn btn-danger"
			href="${ctx}/preview/ccmEventIncidentPreview/4?status=03">已拒绝</a></li>
		<li style="float: right;"><a class="btn btn-success"
			href="${ctx}/preview/ccmEventIncidentPreview/4?status=02">已通过</a></li>
		<li style="float: right;"><a class="btn btn-warning"
			href="${ctx}/preview/ccmEventIncidentPreview/4?status=01">未处理</a></li>
		<li style="float: right;"><a class="btn btn-primary"
			href="${ctx}/preview/ccmEventIncidentPreview/4">全部</a></li>

	</ul>
	<form:form id="searchForm" modelAttribute="ccmEventIncidentPreview"
		action="${ctx}/preview/ccmEventIncidentPreview/4" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>事件名称：</label> <form:input path="caseName"
					htmlEscape="false" maxlength="100" class="input-medium" /></li>
			<li><label>上报人：</label> <form:input path="reportPerson"
					htmlEscape="false" maxlength="15" class="input-medium" /></li>
			<li><label>状态：</label> <form:select path="status"
					class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_event_status')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></li>
			<li><label>事件规模：</label> <form:select path="caseScope"
					class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_event_scope')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></li>
			<li><label>开始日期：</label> <input name="beginHappenDate"
				type="text" readonly="readonly" maxlength="20"
				class="input-medium Wdate"
				value="<fmt:formatDate value="${ccmEventIncidentPreview.beginHappenDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
				<label>结束日期：</label> <input name="endHappenDate" type="text"
				readonly="readonly" maxlength="20" class="input-medium Wdate"
				value="<fmt:formatDate value="${ccmEventIncidentPreview.endHappenDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			</li>
			<li class="btns"><a
				onclick="parent.LayerDialog('${ctx}/preview/ccmEventIncidentPreview/form/4', '添加', '1100px', '600px')"
				class="btn btn-export"><i class="icon-plus"></i> 添加</a></li>
			<!-- <li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li> -->
			<li class="btns"><a href="javascript:;" id="btnSubmit"
				class="btn btn-primary"> <i class="icon-search"></i> 查询
			</a></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>事件名称</th>
				<th>上报人</th>
				<th>发生地详址</th>
				<th>事件规模</th>
				<th>发生日期</th>
				<th>处理状态</th>
				<shiro:hasPermission name="preview:ccmEventIncidentPreview:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="ccmEventIncidentPreview">
				<tr>
					<td><a
						onclick="parent.LayerDialog('${ctx}/preview/ccmEventIncidentPreview/form/1?id=${ccmEventIncidentPreview.id}', '编辑', '1100px', '600px')">${ccmEventIncidentPreview.caseName}</a></td>
					<td>${ccmEventIncidentPreview.reportPerson}</td>
					<td>${ccmEventIncidentPreview.happenPlace}</td>
					<td>${fns:getDictLabel(ccmEventIncidentPreview.caseScope,'ccm_event_scope','')}</td>
					<td><fmt:formatDate
							value="${ccmEventIncidentPreview.happenDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><span
						class="eventScaleCss previewStatusCss-${ccmEventIncidentPreview.status}">
							${fns:getDictLabel(ccmEventIncidentPreview.status, 'ccm_event_preview_status', '')}
					</span></td>
					<shiro:hasPermission name="preview:ccmEventIncidentPreview:edit">
						<td><a class="btnList"
							onclick="parent.LayerDialog('${ctx}/preview/ccmEventIncidentPreview/form/4?id=${ccmEventIncidentPreview.id}', '编辑', '1100px', '600px')"
							title="修改"><i class="icon-pencil"></i></a> <a class="btnList"
							href="${ctx}/preview/ccmEventIncidentPreview/delete?id=${ccmEventIncidentPreview.id}"
							onclick="return confirmx('确认要删除该app信息上报吗？', this.href)"
							title="删除"><i class="icon-remove-sign"></i></a>
							<c:if test="${ccmEventIncidentPreview.status eq '03' || ccmEventIncidentPreview.status eq '02'}">
							<a  class="btnList" title="已处理"><i class="icon-legal" style="color: #656565;"></i></a>
							</c:if>
							<c:if test="${ccmEventIncidentPreview.status eq '01'}">
							<a class="btnList" onclick="HandleTips(this,'${ccmEventIncidentPreview.id}')"	title="处理">	<i class="icon-legal"></i>	</a>
							</c:if>
							<%--<a class="btnList"
							onclick="HandleTips(this,'${ccmEventIncidentPreview.id}')"
							title="处理"><i class="icon-legal"></i></a></td>--%>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>