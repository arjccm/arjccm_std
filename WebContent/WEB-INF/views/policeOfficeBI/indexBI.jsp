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
	<title>${fns:getConfig('productName_part1')}${fns:getConfig('productName_part2')}</title>
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


<%--	<script src="${ctxStatic}/d3/d3.v4.min.js"></script>
	<script src="${ctxStatic}/modules/map/js/mapconfig.js"></script>
	<script src="${ctxStatic}/modules/map/js/commonMap.js"></script>
	<script src="${ctxStatic}/mapv/mapv.min.js"></script>
	<script src="${ctxStatic}/supermapopenlayers/iclient-openlayers.min.js"></script>--%>
	<script src="${ctxStatic}/common/index/Scripts/js/echarts.min.js"></script>
	<script src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
	<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>

	<script src="${ctxStatic}/custom/date/date.js"></script>
	<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill.min.js"></script>
	<script src="${ctxStatic}/policeOfficeBI/js/jquery.gridster.min.js"></script>
	<script src="${ctxStatic}/policeOfficeBI/js/indexBI.js"></script>

	<style type="text/css">

	</style>

</head>
<script>
	$(function() {
		layoutBi()
	});
	window.onresize =function(){
		layoutBi()
	}
</script>
<body>
<header class="header">
	<div class="header_area">
		<div class="streamer"><div class="lg_animate"></div></div>
		<div class="header_title">${fns:getConfig('productName_part1')}${fns:getConfig('productName_part2')}</div>
		<div class="header_information clearfix">
			<div class="time">0000-00-00 00:00:00 周？</div>
			<div class="dividing_Line"></div>
			<div class="personnel">今日值班民警：杨小北，马景涛</div>
		</div>
	</div>
</header>
<div class="navBasic_data">
	<div class="navBasic_data_area clearfix">
		<ul class="clearfix left_box">
			<%--<li class="clearfix">
				<p>实有人口</p>
				<p>345601</p>
			</li>
			<li class="clearfix">
				<p>重点人员</p>
				<p class="red_text">3456</p>
			</li>
			<li class="clearfix">
				<p>实有房屋</p>
				<p>34569</p>
			</li>
			<li class="clearfix">
				<p>出租房</p>
				<p>3456</p>
			</li>
			<li class="clearfix">
				<p>实有单位</p>
				<p>745</p>
			</li>--%>
			<li id="sj_lil" style="display: none"> </li>
		</ul>


		<ul class="clearfix right_box">
			<%--<li class="clearfix">
				<p>警力人员</p>
				<p>3456</p>
			</li>
			<li class="clearfix">
				<p>警力设备</p>
				<p>3456</p>
			</li>
			<li class="clearfix">
				<p>视频监控</p>
				<p class="red_text">340</p>
			</li>
			<li class="clearfix">
				<p>本月警情</p>
				<p class="red_text">888</p>
			</li>
			<li class="ts_01 clearfix">
				<p>本月矛盾纠纷</p>
				<p>981</p>
			</li>
			<li class="ts_02 clearfix">
				<p>今日人脸抓拍</p>
				<p>378210</p>
			</li>--%>
			<li id="sj_lir" style="display: none"> </li>
		</ul>
	</div>

</div>
<section>
	<div class="container">
		<div class="gridster container_area">
			<ul>
				<li class="box sizex_1" data-row="1" data-col="1" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/population_confluence.jsp" %>
				</li>
				<li class="box sizex_1" data-row="1" data-col="2" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/modular_02.jsp" %>
				</li>
				<li class="box sizemap" data-row="1" data-col="3" data-sizex="3" data-sizey="3">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/policeOfficeBI_map.jsp" %>
				</li>
				<li class="box sizex_1" data-row="1" data-col="4" data-sizex="2" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/PoliceForceDistribution.jsp" %>
				</li>
				<li class="box sizex_2" data-row="1" data-col="6" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/beonduty.jsp" %>
				</li>


				<li class="box sizex_2" data-row="2" data-col="1" data-sizex="2" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/peopleCount.jsp" %>
				</li>
				<li class="box sizex_1" data-row="2" data-col="2" data-sizex="2" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/PoliceEquipmentMonitorsDistribution.jsp" %>
				</li>
				<li class="box sizex_2" data-row="2" data-col="3" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/patrolRank.jsp" %>
				</li>


				<li class="box sizex_1" data-row="3" data-col="1" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/keyPeopleOfArea.jsp" %>
				</li>
				<li class="box sizex_1" data-row="3" data-col="2" data-sizex="1" data-sizey="1">
                    <%@ include file="/WEB-INF/views/policeOfficeBI/modular/key_personnel_data.jsp" %>
                </li>
				<li class="box sizex_1" data-row="3" data-col="3" data-sizex="1" data-sizey="1">

					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/disputeDefuse.jsp" %>
				</li>
				<li class="box sizex_1" data-row="3" data-col="4" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/thisWeekFace.jsp" %>
				</li>
				<li class="box sizex_1" data-row="3" data-col="5" data-sizex="1" data-sizey="1">
                    <%@ include file="/WEB-INF/views/policeOfficeBI/modular/videoSurveillance.jsp" %>
                </li>


				<li class="box sizex_1" data-row="4" data-col="1" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/concern_company.jsp" %>
				</li>
				<li class="box sizex_1" data-row="4" data-col="2" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/search.jsp" %>
				</li>
				<li class="box sizex_1" data-row="4" data-col="3" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/Practitioners.jsp" %>
				</li>
				<li class="box sizex_1" data-row="4" data-col="4" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/rentalHouseOfArea.jsp" %>
				</li>
                <li class="box sizex_1" data-row="4" data-col="5" data-sizex="1" data-sizey="1">
                    <%@ include file="/WEB-INF/views/policeOfficeBI/modular/alarm_data.jsp" %>
                </li>
				<li class="box sizex_1" data-row="4" data-col="6" data-sizex="1" data-sizey="1">
                    <%@ include file="/WEB-INF/views/policeOfficeBI/modular/policeSentiment.jsp" %>
                </li>
				<li class="box sizex_1" data-row="4" data-col="7" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/PoliceDigest.jsp" %>
				</li>
				<li class="box sizex_1" data-row="4" data-col="8" data-sizex="1" data-sizey="1">
					<%@ include file="/WEB-INF/views/policeOfficeBI/modular/jq_areal_distribution.jsp" %>
				</li>
			</ul>
		</div>
	</div>
</section>


<script>
	setInterval(showTime,500);
	setTimeout(function () {
		showPopulationConfluence();
		modular_02();
		PoliceForceDistribution();
		peopleCount();
		PoliceEquipmentMonitorsDistribution();
		patrolRank();
		keyPeopleOfArea();
		showDisputeDefuse();
		thisWeekFace();
		initabnormalOfVideo();
		search();
		Practitioners();
		rentalHouseOfArea();
		initPoliceSentiment();
		PoliceDigest();
		showKeyPersonne();
		showConcernCompany();
		beonduty()

		setValueAndAreaName();
		showSjHz();
	},1000)

	function showSjHz() {
		$.getJSON(ctx + '/sys/BicMap/countHZ', function(data) {

			console.log("============================")
			$.each(data, function (key, value) {
				$("#sj_lil").before('<li class="clearfix"><p>'+key+'</p><p class="red_text">'+value+'</p></li>')
			});
		})
		$.getJSON(ctx + '/sys/BicMap/countHZ2', function(data) {
			console.log("============================")
			$.each(data, function (key, value) {
				$("#sj_lir").before('<li class="clearfix"><p>'+key+'</p><p class="red_text">'+value+'</p></li>')
			});
		})


	}
</script>
</body>

</html>