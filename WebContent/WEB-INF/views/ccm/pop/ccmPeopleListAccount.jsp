<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>实有人口管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var pathData
		$(document).ready(function() {
			pathData = "uniformlogo=${ccmPeople.uniformlogo}&account=${ccmPeople.account}&accountidentity=${ccmPeople.accountidentity}&accountname=${ccmPeople.accountname}&accountrelation=${ccmPeople.accountrelation}&accounttelephone=${ccmPeople.accounttelephone}&personType=${ccmPeople.personType}&personTime=${ccmPeople.personTime}&personReason=${ccmPeople.personReason}"
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function show(){
			var s = $("#che").prop('checked');
			if(s){
				$("#show").css("display","block");
			}else{
				$("#show").css("display","none");
			}
		}
	</script>
	<style type="text/css">
		#show{display: none;}
		
	</style>
</head>
<body>
 
	<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/pop/ccmPeople/">实有人口列表</a></li>
		<li class="active"><a href="">户籍家庭人员列表</a></li>
		<%--<shiro:hasPermission name="pop:ccmPeople:edit">
			<li>
				<a href="${ctx}/pop/ccmPeople/formAccount?account=${ccmPeopleAccount.account}">户籍家庭人员添加</a>
			<li>
			<a onclick="parent.LayerDialog('${ctx}/pop/ccmPeople/formAccount?account=${ccmPeopleAccount.account}', '户籍家庭人员添加', '1500px', '700px')">户籍家庭人员添加</a></li>

			</li>
		</shiro:hasPermission>--%>
	</ul>
	<div class="clearfix btn-box breadcrumb">
		<shiro:hasPermission name="pop:ccmPeople:edit">
		<a class="btn btn-primary btns pull-right" style="width: 20px;display:inline-block;" onclick="parent.LayerDialog('${ctx}/pop/ccmPeople/formAccount?'+pathData, '户籍家庭人员添加', '1500px', '700px')"><i></i><span style="font-size: 12px">成员添加</span></a>
		</shiro:hasPermission>
	</div>
	<form:form id="searchForm" modelAttribute="ccmPeople" action="${ctx}/pop/ccmPeople/" method="post">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
 		<%--<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" style="float: right;margin-right: 3%"/> --%>

	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>姓名</th>
				<th>人口类型</th>
				<th>出生日期</th>
				<th>户号</th>
				<th>户主姓名</th>
				<th>与户主关系</th>
				<th>公民身份号码</th>				
				<th>更新时间</th>
				<shiro:hasPermission name="pop:ccmPeople:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmPeople">
			<tr>
				<td>
					<a href="${ctx}/pop/ccmPeople/formAccount?id=${ccmPeople.id}">${ccmPeople.name}</a>
				</td>
				<td>
					${fns:getDictLabel(ccmPeople.type, 'sys_ccm_people', '')}
				</td>
				<td>
					<fmt:formatDate value="${ccmPeople.birthday}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${ccmPeople.account}
				</td>
				<td>
					${ccmPeople.accountname}
				</td>
				<td>
					${fns:getDictLabel(ccmPeople.accountrelation, 'sys_ccm_fami_ties', '')}
				</td>
				<td>
					${ccmPeople.ident}
				</td>				
				<td>
					<fmt:formatDate value="${ccmPeople.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td><shiro:hasPermission name="pop:ccmPeople:edit">

					<a class="btnList"
					   onclick="parent.LayerDialog('${ctx}/pop/ccmPeople/formAccount?id=${ccmPeople.id}', '编辑', '1500px', '700px')"
					   title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>

					<a class="btnList" href="${ctx}/pop/ccmPeople/deleteAccount?id=${ccmPeople.id}" onclick="return confirmx('确认要删除该户籍人口吗？', this.href)"  title="删除"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
				        	    			  
	    			   <%-- <a class="btn btn-success" href="${ctx}/pop/ccmPeople/specialform?id=${ccmPeople.id}">人员标记</a>
						<a class="btn btn-danger" href="${ctx}/pop/ccmPeople/delete?id=${ccmPeople.id}" onclick="return confirmx('确认要删除该实有人口吗？', this.href)">删除</a>
				    </shiro:hasPermission> 
				    <shiro:hasPermission name="log:ccmLogTail:edit">
		  				<a	class="btn btn-success" href="${ctx}/log/ccmLogTail/formPro?relevance_id=${ccmPeople.id}&relevance_table=ccm_people">添加记录</a> --%>
				  	</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-right: 8px;">${page}</div>
    </div>
</body>
</html>