<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>实有单位统计</title>
	<meta name="decorator" content="default"/>
	<%--<script src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>--%>
	<link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'black'}/bootstrap.min.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'black'}/custom.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
		  href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css">
	<!--[if lte IE 7]>
	<link rel="stylesheet" href="../bootstrap/2.3.1/awesome/font-awesome-ie7.css">
	<![endif]-->
	<!--[if lte IE 6]>
	<link rel="stylesheet" href="../bootstrap/bsie/css/bootstrap-ie6.min.css">
	<script src="../bootstrap/bsie/js/bootstrap-ie.min.js"></script>
	<![endif]-->
	<script src="${ctxStatic}/common/index/Scripts/js/echarts2.2.7/echarts-all.js"></script>
	<%--<script src="${ctxStatic}/common/index/Scripts/js/echarts.min.js"></script>--%>
	<script src="${ctxStatic}/dma/statistics/statistics.js"></script>
	<%-- <script src="${ctxStatic}/echarts/theme/${not empty cookie.theme.value ? cookie.theme.value : 'cerulean'}.js"></script> --%>
	<style>
		.common-pading{
			width:100%;
			height:750px;
			padding-top:50px;
		}
		.echarts{
			width:100%;
			height:100%;
		}
		.sp6{
			width: 50%;
			float: left;
		}
		.mb20{
			margin-bottom: 20px;
		}

	</style>
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
</head>
<body>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li class="active"><a class="nav-head" href="">实有单位统计</a></li>
	</ul>
	<div class="container-fluid" style="height: 100%; overflow: hidden"   id="main">
		<div class="context" content="${ctx}"></div>

			<div class="row-fluid height100	">

				<div class="span12 small_bg mb20" >
					<h4>行业类型统计</h4>
					<div class="common-pading sp6">
						<div id="orgnpsEcharts" class="echarts" style="width: 100%;height: 100%;"></div>
					</div>

					<div class="common-pading sp6">
						<div id="statisticsEcharts" class="echarts" style="width: 100%;height: 100%;"></div>
					</div>
				</div>

				<div class="span6 small_bg mb20"  style="margin: 0;">
					<h4>各区域企业分布统计</h4>
					<div class="common-pading">
						<div id="areaEcharts" class="echarts" style="width: 100%;height: 100%;"></div>
					</div>
				</div>
				<div class="span6 small_bg mb20" >
					<h4>企业注册资本情况统计</h4>
					<div class="common-pading">
						<div id="registeredEcharts" class="echarts" style="width: 100%;height: 100%;"></div>
					</div>
				</div>
			</div>
	</div>
</div>
</body>
</html>