<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<title>xx市公安局xx镇派出所数据可视化展现</title>
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="${ctxStatic}/bootstrap/bootstrap3.0/css/bootstrap.min.css">
	<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css">
	<link rel="stylesheet" href="${ctxStatic}/bootstrap/animate.min.css">
	<!--[if lte IE 7]>
	<link rel="stylesheet" href="../bootstrap/2.3.1/awesome/font-awesome-ie7.css">
	<![endif]-->
	<!--[if lte IE 6]>
	<link rel="stylesheet" href="../bootstrap/bsie/css/bootstrap-ie6.min.css">
	<script src="../bootstrap/bsie/js/bootstrap-ie.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" href="${ctxStatic}/policeOfficeBI/css/jquery.gridster.min.css">
	<link rel="stylesheet" href="${ctxStatic}/policeOfficeBI/css/commonBI.css">
	<link rel="stylesheet" href="${ctxStatic}/policeOfficeBI/css/indexBI.css">



	<script type="text/javascript">
		var ctxStatic = '${ctxStatic}',
				ctx = '${ctx}';
	</script>


	<script src="${ctxStatic}/d3/d3.v4.min.js"></script>
	<script src="${ctxStatic}/modules/map/js/mapconfig.js"></script>
	<script src="${ctxStatic}/modules/map/js/commonMap.js"></script>
	<script src="${ctxStatic}/mapv/mapv.min.js"></script>
	<script src="${ctxStatic}/supermapopenlayers/iclient-openlayers.min.js"></script>
	<script src="${ctxStatic}/common/index/Scripts/js/echarts.min.js"></script>
	<script src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
	<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
	<script src="${ctxStatic}/custom/date/date.js"></script>
	<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill.min.js"></script>
	<script src="${ctxStatic}/policeOfficeBI/js/jquery.gridster.min.js"></script>

	<style type="text/css">

	</style>

</head>

<body>
<header class="header">
	<div class="header_area">

	</div>
</header>
<div class="navBasic_data">
	<ul class="navBasic_data_area">
		<li></li>
	</ul>

</div>
<section>
	<div class="container">
		<div class="gridster container_area">
			<ul>
				<li class="box sizex_1" data-row="1" data-col="1" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/modular_01.jsp" %>
				</li>
				<li class="box sizex_1" data-row="1" data-col="2" data-sizex="1" data-sizey="1"></li>
				<li class="box sizemap" data-row="1" data-col="3" data-sizex="3" data-sizey="3"></li>
				<li class="box sizex_1" data-row="1" data-col="4" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_2" data-row="1" data-col="6" data-sizex="2" data-sizey="1"></li>

				<li class="box sizex_2" data-row="2" data-col="1" data-sizex="2" data-sizey="1"></li>
				<li class="box sizex_1" data-row="2" data-col="2" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_2" data-row="2" data-col="3" data-sizex="2" data-sizey="1"></li>

				<li class="box sizex_1" data-row="3" data-col="1" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_1" data-row="3" data-col="2" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_1" data-row="3" data-col="3" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_1" data-row="3" data-col="4" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_1" data-row="3" data-col="5" data-sizex="1" data-sizey="1"></li>

				<li class="box sizex_1" data-row="4" data-col="1" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_1" data-row="4" data-col="2" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_1" data-row="4" data-col="3" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_1" data-row="4" data-col="4" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_1" data-row="4" data-col="5" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_1" data-row="4" data-col="6" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_1" data-row="4" data-col="7" data-sizex="1" data-sizey="1"></li>
				<li class="box sizex_1" data-row="4" data-col="8" data-sizex="1" data-sizey="1"></li>
			</ul>
		</div>
	</div>
</section>


<script>
	$(function() {
		var widthLi = $(".gridster").width()/8-16;
		var heightLi = $(".gridster").height()/4-16;
		// alert(heightLi)
		$(".gridster ul").gridster({
			widget_margins: [8, 8],
			widget_base_dimensions: [widthLi, heightLi]
		});
	});
</script>
</body>

</html>