<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信信息上报管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/common/common.js" type="text/javascript"></script>
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
		<li class="active"><a href="${ctx}/event/wechat/ccmWechatEvent/">微信上报列表</a></li>
		<%-- <shiro:hasPermission name="event:wechat:ccmWechatEvent:edit"><li><a href="${ctx}/event/wechat/ccmWechatEvent/form">微信上报添加</a></li></shiro:hasPermission>
	 --%></ul>
	<form:form id="searchForm" modelAttribute="ccmWechatEvent" action="${ctx}/event/wechat/ccmWechatEvent/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>上报信息：</label>
				<form:input path="reportInfo" htmlEscape="false" maxlength="256" class="input-medium"/>
			</li>
			<li><label>上报时间：</label>
				<input name="beginReportTime"  id="beginReportTime"  type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmWechatEvent.beginReportTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,maxDate:'#F{$dp.$D(\'endReportTime\')||\'%y-%M-%d\'}'});"/> - 
				<input name="endReportTime" id="endReportTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmWechatEvent.endReportTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,minDate:'#F{$dp.$D(\'beginReportTime\')}' ,maxDate:'%y-%M-%d'});"/>
			</li>
			<li><label>回复情况：</label>
				<form:select path="state" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('ccm_wechat_event_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>处理状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_event_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<!-- <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li> -->
			<li class="btns">
			<a href="javascript:;" id="btnSubmit" class="btn btn-primary">
                <i class="icon-search"></i> 查询 </a>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>上报信息</th>
				<th>上报时间</th>
				<th>回复情况</th>
				<th>联系方式</th>
				<th>处理状态</th>
				<th>备注信息</th>
				<shiro:hasPermission name="event:wechat:ccmWechatEvent:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmWechatEvent">
			<tr>
				<td><a onclick="parent.LayerDialog('${ctx}/event/wechat/ccmWechatEvent/form?id=${ccmWechatEvent.id}','编辑', '1100px', '700px')">
					${fns:abbr(ccmWechatEvent.reportInfo,30)}
				</a></td>
				<td>
					<fmt:formatDate value="${ccmWechatEvent.reportTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(ccmWechatEvent.state, 'ccm_wechat_event_state', '')}
				</td>
				<td>
					${ccmWechatEvent.userTel}
				</td>
				<td><span
					class="eventScaleCss statusCss-${ccmWechatEvent.status}">
					${fns:getDictLabel(ccmWechatEvent.status, 'ccm_event_status', '')}
				</span></td>
				<td class="tp">
					${ccmWechatEvent.remarks}
				</td>
				<shiro:hasPermission name="event:wechat:ccmWechatEvent:edit"><td>
    				<a class="btnList" onclick="parent.LayerDialog('${ctx}/event/wechat/ccmWechatEvent/form?id=${ccmWechatEvent.id}','编辑', '1100px', '700px')"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
					<a class="btnList" href="${ctx}/event/wechat/ccmWechatEvent/delete?id=${ccmWechatEvent.id}" onclick="return confirmx('确认要删除该微信信息上报吗？', this.href)" title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
					<a class="btnList" onclick="parent.LayerDialog('${ctx}/event/wechat/ccmWechatEventReply/list?event.id=${ccmWechatEvent.id}&type=chatEvent','回复列表', '1100px', '700px')"><img src="${ctxStatic}/images/weixinko.png" />
					</a>
				</shiro:hasPermission>
				<!-- 事件处理 编辑权限  --> 
				<shiro:hasPermission name="event:ccmEventCasedeal:edit">
					<a class="btnList" onclick="LayerDialogWithReload('${ctx}/event/ccmEventCasedeal/dealformCommon?objType=ccm_wechat_event&objId=${ccmWechatEvent.id}', '处理', '700px', '500px')" title="添加处理"><i class="iconfont icon-caozuotubiao-tianjiachuli"></i></a>
				</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</div>
</body>
</html>