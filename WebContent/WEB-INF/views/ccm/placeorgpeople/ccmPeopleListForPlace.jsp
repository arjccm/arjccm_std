<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>实有人口管理</title>
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
	function show() {
		var s = $("#che").prop('checked');
		if (s) {
			$("#show").css("display", "block");
		} else {
			$("#show").css("display", "none");
		}
	}
	function LayerDialog(id,src, title, height, width) {
		parent.layer.open({
			type: 2,
			title: title,
			id: id || '',
			area: [height, width],
			fixed: true, //固定
			maxmin: true,
			btn: ['关闭'], //可以无限个按钮
			content: src,
			zIndex: '1',
			end: function () {
				location.reload();
			}
		});
	}

    function saveImport() {
        debugger;
        var s = $("#importForm")[0][0].files.length;
        if(s == 0){
            alert("请选择文件！");
            return;
        }else{
            $("#importForm").submit();
        }
    }
</script>
<script type="text/javascript"
	src="${ctxStatic}/ccm/pop/js/ccmPeopleInfo.js">
	
</script>
<style type="text/css">
#show {
	display: none;
}
</style>
</head>
<body>
<div class="back-list clearfix">
	<!-- 导入、导出模块 -->
	<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/pop/ccmPeople/import"
			method="post" enctype="multipart/form-data" class="form-search"
			style="padding-left: 20px; text-align: center;"
			onsubmit="loading('正在导入，请稍等...');">
			<br /> <input id="uploadFile" name="file" type="file"
				style="width: 330px" /><br /> <br /> <input id="btnImportSubmit"
				class="btn btn-primary" type="button" onclick="saveImport()" value="导  入 " />
		</form>
	</div>

	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/placeorgpeople/ccmPlaceOrgPeople/list?placeOrgId=${placeOrgId}&type=${type}">现有人员列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmPeople" action="" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns">
				<a class="btn btn-primary" href="${ctx}/placeorgpeople/ccmPlaceOrgPeople/listPopAdd?placeOrgId=${placeOrgId}&placeType=${type}">
					添加成员</a>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>人口类型</th>
				<th>姓名</th>
				<th>性别</th>
				<th>出生日期</th>
				<th>所属社区</th>
				<th>所属网格</th>
				<th>现住门（楼）详址</th>
					<shiro:hasPermission name="pop:ccmPeople:edit">
						<th>操作</th>
					</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="ccmPeople">
				<tr>
					<td>${fns:getDictLabel(ccmPeople.type, 'sys_ccm_people', '')}
					</td>
                    <td><a href="${ctx}/placeorgpeople/ccmPlaceOrgPeople/toUpdatePeople?peopleId=${ccmPeople.more4}">
                            ${ccmPeople.name}</a></td>
					<td>${fns:getDictLabel(ccmPeople.sex, 'sex', '')}</td>
					<td><fmt:formatDate value="${ccmPeople.birthday}"
							pattern="yyyy-MM-dd" /></td>
					<td>${ccmPeople.areaComId.name}</td>
					<td>${ccmPeople.areaGridId.name}</td>
					<td>${ccmPeople.residencedetail}</td>
					<td><shiro:hasPermission name="pop:ccmPeople:edit">
                        <a class="btnList" href="${ctx}/placeorgpeople/ccmPlaceOrgPeople/toUpdatePeople?peopleId=${ccmPeople.more4}"  title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
						<a class="btnList" href="${ctx}/placeorgpeople/ccmPlaceOrgPeople/deletePeople?id=${ccmPeople.more2}"
							onclick="return confirmx('确认要移除此从业人员吗？', this.href)"  title="移除成员"><i class="iconfont icon-caozuotubiao-shanchu"></i></a>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</div>
</body>
</html>