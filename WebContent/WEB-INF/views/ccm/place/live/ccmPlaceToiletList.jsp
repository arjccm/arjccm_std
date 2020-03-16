<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>公共厕所管理</title>
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
	$(function(){
		$(".pimg").click(function(){
			var _this = $(this);//将当前的pimg元素作为_this传入函数
			imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
		});
	});
	function imgShow(outerdiv, innerdiv, bigimg, _this){
		var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
		$(bigimg).attr("src", src);//设置#bigimg元素的src属性
		/*获取当前点击图片的真实大小，并显示弹出层及大图*/
		$("<img/>").attr("src", src).load(function(){
			var windowW = $(window).width();//获取当前窗口宽度
			var windowH = $(window).height();//获取当前窗口高度
			var realWidth = this.width;//获取图片真实宽度
			var realHeight = this.height;//获取图片真实高度
			var imgWidth, imgHeight;
			var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放
			if(realHeight>windowH*scale) {//判断图片高度
				imgHeight = windowH*scale;//如大于窗口高度，图片高度进行缩放
				imgWidth = imgHeight/realHeight*realWidth;//等比例缩放宽度
				if(imgWidth>windowW*scale) {//如宽度扔大于窗口宽度
					imgWidth = windowW*scale;//再对宽度进行缩放
				}
			} else if(realWidth>windowW*scale) {//如图片高度合适，判断图片宽度
				imgWidth = windowW*scale;//如大于窗口宽度，图片宽度进行缩放
				imgHeight = imgWidth/realWidth*realHeight;//等比例缩放高度
			} else {//如果图片真实高度和宽度都符合要求，高宽不变
				imgWidth = realWidth;
				imgHeight = realHeight;
			}
			$(bigimg).css("width",imgWidth);//以最终的宽度对图片缩放
			var w = (windowW-imgWidth)/2;//计算图片与窗口左边距
			var h = (windowH-imgHeight)/2;//计算图片与窗口上边距
			$(innerdiv).css({"top":h, "left":w});//设置#innerdiv的top和left属性
			$(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
		});
		$(outerdiv).click(function(){//再次点击淡出消失弹出层
			$(this).fadeOut("fast");
		});
	}
</script>
<script src="${ctxStatic}/ccm/event/js/ccmEventIncident.js"
	type="text/javascript"></script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">场所管理</span>--%>
<ul class="back-list">
	<ul class="nav nav-tabs">
		<li class="active" style="width: 112px"><a class="nav-head" href="${ctx}/live/ccmPlaceLive/2">数据列表</a></li>
		<%-- 		<shiro:hasPermission name="live:ccmPlaceLive:edit">
			<li><a href="${ctx}/live/ccmPlaceLive/form">公共厕所添加</a></li>
		</shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmPlaceLive"
		action="${ctx}/live/ccmPlaceLive/2" method="post"
		class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form pull-left">
			<li class="first-line"><label>场所名称：</label> <form:input path="placeName"
					htmlEscape="false" maxlength="255" class="input-medium" /></li>
			<li class="first-line"><label>负责人姓名：</label> <form:input path="leaderName"
					htmlEscape="false" maxlength="255" class="input-medium" /></li>

<%--			<li class="clearfix"></li>--%>
		</ul>

<%--	<sys:message content="${message}" />--%>
	<div class="clearfix pull-right btn-box">
		<a
				onclick="parent.LayerDialog('${ctx}/live/ccmPlaceLive/form/toilet', '添加', '1100px', '700px')"
				class="btn btn-export" style="width: 49px;display:inline-block;float: right;"><i></i><span style="font-size: 12px">添加</span> </a>
		<a href="javascript:;" id="btnSubmit"
							class="btn btn-primary" style="width: 49px;display:inline-block;float: right;"> <i></i><span style="font-size: 12px">查询</span>
		</a>
	</div>
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>图片</th>
				<th>场所名称</th>
				<th>负责人姓名</th>
				<th>负责人联系电话</th>
				<th>关联组织机构</th>
				<th>属性</th>
				<th>是否收费</th>
				<th>入库时间</th>
				<shiro:hasPermission name="live:ccmPlaceLive:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="ccmPlaceLive">
				<tr>
					<td width="200px"><img
						src="${ccmPlaceLive.ccmBasePlace.placePicture}"
						style="height: 50px;" class="pimg"/></td>
					<td><a class="btnList"
						onclick="parent.LayerDialog('${ctx}/live/ccmPlaceLive/form?id=${ccmPlaceLive.id}', '编辑', '1100px', '700px')">
							${ccmPlaceLive.placeName}</a></td>
					<td>${ccmPlaceLive.leaderName}</td>
					<td>${ccmPlaceLive.leaderContact}</td>
					<td>${fns:getDictLabel(ccmPlaceLive.relevanceOrg, 'ccm_buss_cate', '无')}</td>
					<td>${fns:getDictLabel(ccmPlaceLive.openProperty, 'ccm_toilet_property', '')}</td>

					<td>${fns:getDictLabel(ccmPlaceLive.isFree, 'ccm_place_free', '')}</td>
					<td><fmt:formatDate value="${ccmPlaceLive.createDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<shiro:hasPermission name="live:ccmPlaceLive:edit">
						<td>
							<a class="btnList"
								onclick="parent.LayerDialog('${ctx}/event/ccmEventIncident/listCheck?placeId=${ccmPlaceLive.basePlaceId}', '事件关联', '1100px', '700px')"
								title="事件关联"><i class="icon-random"></i></a>
							<a class="btnList"
								onclick="parent.LayerDialog('${ctx}/live/ccmPlaceLive/form?id=${ccmPlaceLive.id}', '编辑', '1100px', '700px')"
								title="修改"><i class="icon-pencil"></i></a> <a class="btnList"
								href="${ctx}/live/ccmPlaceLive/delete?id=${ccmPlaceLive.id}"
								onclick="return confirmx('确认要删除该公共厕所吗？', this.href)" title="删除"><i
									class="icon-trash"></i></a>
							<a class="btnList"
							   onclick="parent.LayerDialog('${ctx}/placeorgpeople/ccmPlaceOrgPeople/toaddPeople?placeOrgId=${ccmPlaceLive.id}&type=1', '从业人员添加', '1550px', '800px')"
							   title="从业人员添加"><i class="icon-plus"></i></a>
							<a class="btnList"
							   onclick="parent.LayerDialog('${ctx}/placeorgpeople/ccmPlaceOrgPeople/list?placeOrgId=${ccmPlaceLive.id}&type=1', '从业人员信息', '1550px', '800px')"
							   title="从业人员信息"><i class="icon-group"></i></a>
						</td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
			<div id="innerdiv" style="position:absolute;">
				<img id="bigimg" style="border:5px solid #fff;" src="" />
			</div>
		</div>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</ul>
</body>
</html>