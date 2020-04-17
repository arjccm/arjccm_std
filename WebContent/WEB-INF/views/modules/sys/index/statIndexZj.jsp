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
	<title>宗教全时空防控系统</title>
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
	<link rel="stylesheet" href="${ctxStatic}/asidenav/asidenav.css">
	<link href="${ctxStatic}/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" />
	<link href="${ctxStatic}/layer-v3.1.1/layer/theme/default/layer.css" rel="stylesheet" />
	<link rel="stylesheet" href="${ctxStatic}/ol/ol.css" type="text/css">
	<link rel="stylesheet" href="${ctxStatic}/modules/map/css/map.css" type="text/css">
	<link rel="stylesheet" href="${ctxStatic}/layui/css/layui.css">
	<link rel="stylesheet" href="${ctxStatic}/supermapopenlayers/iclient-openlayers.min.css" type="text/css">
	<link rel="stylesheet" href="${ctxStatic}/common/index/css/indexCommon.css">
	<link rel="stylesheet" href="${ctxStatic}/modules/map/css/publicinstitutions.css">
	<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
	<link href="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${ctxStatic}/common/index/css/statIndexZj.css">
	<script type="text/javascript">
		var ctxStatic = '${ctxStatic}',
				ctx = '${ctx}';
	</script>

	<script src="${ctxStatic}/ol/ol.js"></script>
	<script src="${ctxStatic}/d3/d3.v4.min.js"></script>
	// 设定地图层级
	<script src="${ctxStatic}/common/index/Scripts/js/keyPersonal.js"></script>
	<script src="${ctxStatic}/modules/map/js/mapconfig.js"></script>
	<script src="${ctxStatic}/modules/map/js/commonMap.js"></script>
	<script src="${ctxStatic}/mapv/mapv.min.js"></script>
	<script src="${ctxStatic}/supermapopenlayers/iclient-openlayers.min.js"></script>
	<script src="${ctxStatic}/common/index/Scripts/js/echarts.min.js"></script>
	<script src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
	<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
	<script src="${ctxStatic}/custom/date/date.js"></script>
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/index/Scripts/js/statIndexZj.js"></script>
	<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill.min.js"></script>
	<style type="text/css">
		.table-info td {
			padding-top: 12px;
		}

		.active {
			background: url("${ctxStatic}/bootstrap/2.3.1/img/nav-xz.png") center no-repeat;
			background-size: 100% 100%;
			color: #fff !important;
			cursor: pointer;
			font-weight: bold;
		}

		.nav li a:hover {
			background: url("${ctxStatic}/bootstrap/2.3.1/img/nav-xt.png") center no-repeat;
			background-size: 100% 100%;
			color: #fff !important;
			cursor: pointer;
		}

		.nav li a:focus {
			background-color: #53CEFF;
			border-color: #53CEFF;
			color: #fff;
			background-image: linear-gradient(to right, rgba(98, 178, 250, 1), rgba(165, 213, 245, 1), rgba(98, 178, 250, 1));
			text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #228DFF, 0 0 35px #228DFF, 0 0 40px #228DFF, 0 0 50px #228DFF, 0 0 75px #228DFF;
		}

		.tubiao i {
			display: block;
			position: absolute;
		}
		{
			width: 200px;
		}

		input::-webkit-input-placeholder {
			color: white;
		}

		input::-moz-placeholder {
			/* Mozilla Firefox 19+ */
			color: white;
		}

		input:-moz-placeholder {
			/* Mozilla Firefox 4 to 18 */
			color: white;
		}

		input:-ms-input-placeholder {
			/* Internet Explorer 10-11 */
			color: white;
		}

		.pub-flag {
			color: #fff;
		}

		.pub-name {
			color: #79B1E3;
		}

		.echarts {
			width: 450px;
			height: 200px;
		}

		.common-pading {
			width: 100%;
			padding: 0.25% 5.5%;
		}

		.ol-popup:before {
			border-top-color: unset;
		}
		.ol-popup:after, .ol-popup:before{
			display:none !important;
		}
		body .mySkin .layui-layer-title {
			color: #fff;
			border: none;
		}

		body .mySkin .layui-layer-btn {
			border-top: 1px solid #E9E7E7
		}

		body .mySkin .layui-layer-btn a {
			background: #333;
		}

		body .mySkin .layui-layer-btn .layui-layer-btn1 {
			background: #999;
		}

		#echLeftContent1{
			display: inline-block!important;
		}
		.menu a{
			height: 72px !important;
			padding-top: 22px !important;
		}
		.liuG{
			width: 270px;
			height: 70px;
			display: block;
			background: url(${ctxStatic}/bootstrap/2.3.1/img/lg3.png) no-repeat left bottom;
			content: "";
			animation-name: logoLight;
			animation-duration: 4s;
			animation-iteration-count: infinite;
			position: absolute;
			left: 0;
			top: 26px;
			z-index: 9999;
		}

		@keyframes logoLight {
			0% {
				margin-left: -180px;
				opacity: 1,
			}
			40% {
				opacity: 1;
			}
			50% {
				opacity: 0.1;
			}
			100% {
				opacity: 0;
				margin-left: 240px;
			}
		}
	</style>
	<script>
		$(function() {
			$('#main').height($(window).height());

			$('.container-center').height($('#main').height() - 70);

		})
	</script>
	<script language="javascript">
		function videoSubmit() {
			document.getElementById("loginForm").action = "${dz_hangzhoudao_link_video}";
			document.getElementById("loginForm").submit();
		}

		function pbsSubmit() {
			document.getElementById("loginForm").action = "${dz_hangzhoudao_link_pbs}";
			document.getElementById("loginForm").submit();
		}
	</script>
</head>

<body>
<div id="main">
	<form id="loginForm" class="form-signin" action="" method="post">
		<input type="hidden" id="username" name="username" value="${user.loginName}">
		<input type="hidden" id="password" name="password" value="${user.newPassword}">
	</form>
	<div class="context" content="${ctx}" style="display: none"></div>
	<div id="FullBody">
		<div class="row-fluid header">
			<div>
				<!-- 菜单 -->
				<div class="header_area clearfix">

					<div class="header_logo clearfix">
						<div class="liuG"></div>
						<img class="logo" src="/arjccm/static/common/index/images/statIndexZj/xmzj_logo.png">
						<span id="productName" class="logo_text">${fns:getConfig('productName_part2')}</span>
					</div>
					<div class="header_nav">
						<ul class="nav pm-links clearfix">
							<li class="menu">
								<a  class="active" id="wanggeguanli" href="${ctx}/sys/map/statIndexForZj">数据展示</a>
							</li>
							<li class="menu">
								<a href="${ctx}/sys/map/keyPersonal">重点人员专题</a>
							</li>
							<li class="menu">
								<a href="${ctx}/sys/map/religionIndex">宗教专题</a>
							</li>
					<%--		<li class="menu">
								<a style="margin-left: 20px; " id="anquanshengchan">安全生产</a>
							</li>
							<li class="menu">
								<a style="margin-left: 20px;" id="xuelianggongcheng">雪亮工程</a>
							</li>--%>
						</ul>
					</div>
					<div class="Logout hearder_operation clearfix">
						<a  href="${ctx}/sys/map/projectIndex"><img src="/arjccm/static/common/index/images/statIndexCool/home.png"></a>
						<img src="/arjccm/static/common/index/images/statIndexCool/vertical.png">
						<a  href="${ctx}/logout"><img src="/arjccm/static/common/index/images/statIndexCool/exit.png"></a>
					</div>
				</div>

			</div>

<%--			<div>--%>
<%--				<h5 class="header-logo"></h5>--%>
<%--			</div>--%>
		</div>
		<div class="row-fluid clearfix" style="width: 100%; position: relative;">
			<div id="leftCol" class="leftCol">
				<div id="leftContent0" class="showBigContent">
					<div class="contentTitle"><span id="leftTitle0"></span></div>
					<div class="common-pading" id="leftContent0Body">
						<div id="echLeftContent0" class="echarts"></div>
					</div>
					<div class="mainVideo" id="videoCountDiv">
						<div class="zongshu">
							<h5>视频总数</h5>
							<b id="zongshu">5560</b> 个
						</div>
						<ul>
							<li class="jiguan">
								<i></i>
								<span></span>
								<div>
									<h6>党政机关</h6>
									<div style="text-align: right; top: 30px"><b id="jiguan">5560</b>个</div>
								</div>
							</li>
							<li class="zhugandao">
								<i></i>
								<span></span>
								<div>
									<h6>主干道</h6>
									<div style="text-align: right; top: 30px"><b id="zhugandao">5560</b>个</div>
								</div>
							</li>
							<li class="xuexiao">
								<i></i>
								<span></span>
								<div>
									<h6>学校</h6>
									<div style="text-align: right; top: 30px"><b id="xuexiao" style="text-align: right">5560</b>个</div>
								</div>
							</li>
							<li class="xiaoqu">
								<i></i>
								<span></span>
								<div>
									<h6>小区</h6>
									<div style="text-align: right; top: 30px"><b id="xiaoqu" style="text-align: right">5560</b>个</div>
								</div>
							</li>
							<li class="ditie">
								<i></i>
								<span></span>
								<div>
									<h6>地铁口</h6>
									<div style="text-align: right; top: 30px"><b id="ditie">5560</b>个</div>
								</div>
							</li>
							<li class="shangchang">
								<i></i>
								<span></span>
								<div>
									<h6>商场</h6>
									<div style="text-align: right; top: 30px"><b id="shangchang">5560</b>个</div>
								</div>
							</li>
							<li class="jiayouzhan">
								<i></i>
								<span></span>
								<div>
									<h6>加油站</h6>
									<div style="text-align: right; top: 30px"><b id="jiayouzhan">5560</b>个</div>
								</div>
							</li>
							<li class="qita">
								<i></i>
								<span></span>
								<div>
									<h6>其他</h6>
									<div style="text-align: right; top: 30px"><b id="qita">5560</b>个</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div id="leftContent1"  class="showContent">
					<div class="contentTitle" ><span id="leftTitle1"></span><i></i></div>
					<div class="common-pading" id="leftContent1Body">
						<div id="echLeftContent1" class="echarts" ></div>
					</div>
					<div class="security-main" id="safeKeyDiv">
						<div class="under">

						</div>
						<div class="frame frame-tl">
							<i class="npesrisktype1">
								<div  class="npesrisktypeDiv1">
									<h6>高风险单位</h6>
									<b  id="riskRank1">5560</b>
								</div>
							</i>
						</div>
						<div class="frame frame-tr">
							<i class="npesrisktype2">
								<div class="npesrisktypeDiv2">
									<h6>较大风险单位</h6>
									<b id="riskRank2">5560</b>
								</div>
							</i>
						</div>
						<div class="frame frame-bl">
							<i class="npesrisktype3">
								<div class="npesrisktypeDiv3">
									<h6>一般风险单位</h6>
									<b id="riskRank3">5560</b>
								</div>
							</i>
						</div>
						<div class="frame frame-br">
							<i class="npesrisktype4">
								<div class="npesrisktypeDiv4">
									<h6>低风险单位</h6>
									<b id="riskRank4">5560</b>
								</div>
							</i>
						</div>
					</div>
				</div>
				<div id="leftContent2" style="display: none;" class="showContent">
					<div class="contentTitle"><span id="leftTitle2"></span></div>

					<div class="common-pading" id="leftContent2Body">
						<div style="display: none" id="echleftContent2" class="echarts"></div>
						<div class="p_part">
							<div id="power1" class="power">
								<span class="p_num">6 辆</span>
							</div>
							<span class="p_text">工作车辆</span>
						</div>
						<div class="p_part">
							<div id="power2"  class="power">
								<span class="p_num">${w1} 人</span>
							</div>
							<span class="p_text">工作人员</span>
						</div>
						<div class="p_part">
							<div  id="power3" class="power">
								<span class="p_num">34 件</span>
							</div>
							<span class="p_text">执法设备</span>
						</div>
					</div>



				</div>
				<div id="leftContent3" style="display: none" class="showContent">
					<div class="contentTitle"><span id="leftTitle3"></span></div>
					<div class="common-pading" id="leftContent3Body">
						<div id="echLeftContent3" class="echarts"></div>
					</div>
				</div>
				<div id="leftContent4" class="showBigContent" style="display: none;">
					<div class="contentTitle"><span id="leftTitle4"></span></div>
					<div class="common-pading" id="leftContent4Body">
						<div id="echLeftContent4" class="echarts"></div>
					</div>
				</div>
				<div class="tubiao">
					<i class="fangwu"></i>
					<i class="renkou"></i>
					<i class="jinggai"></i>
					<i class="ludeng"></i>
					<i class="lajitong"></i>
				</div>
			</div>

			<div id="CentralPart" class="CentralPart" >
				<div class="centralPart_area clearfix">
					<div class="c_part">
						<p class="sectName">基督教</p>
						<p class="sectNum">
							<span class="lvfont">教堂：</span>
							<span class="lanfont">${z1}</span>
							<span class="lvfont">个</span>
						</p>
						<p class="sectNum">
							<span class="lvfont">信徒：</span>
							<span class="lanfont">${i1}</span>
							<span class="lvfont">人</span>
						</p>
					</div>
					<div class="c_part">
						<p class="sectName">天主教</p>
						<p class="sectNum">
							<span class="lvfont">教堂：</span>
							<span class="lanfont">${z2}</span>
							<span class="lvfont">个</span>
						</p>
						<p class="sectNum">
							<span class="lvfont">信徒：</span>
							<span class="lanfont">${i2}</span>
							<span class="lvfont">人</span>
						</p>
					</div>
					<div class="c_part">
						<p class="sectName">伊斯兰教</p>
						<p class="sectNum">
							<span class="lvfont">清真寺：</span>
							<span class="lanfont">${z3}</span>
							<span class="lvfont">个</span>
						</p>
						<p class="sectNum">
							<span class="lvfont">信徒：&#12288</span>
							<span class="lanfont">${i3}</span>
							<span class="lvfont">人</span>
						</p>
					</div>
					<div class="c_part">
						<p class="sectName">佛教</p>
						<p class="sectNum">
							<span class="lvfont">寺庵：</span>
							<span class="lanfont">${z4}</span>
							<span class="lvfont">个</span>
						</p>
						<p class="sectNum">
							<span class="lvfont">信徒：</span>
							<span class="lanfont">${i4}</span>
							<span class="lvfont">人</span>
						</p>
					</div>
					<div class="c_part">
						<p class="sectName">道教</p>
						<p class="sectNum">
							<span class="lvfont">宫观：</span>
							<span class="lanfont">${z5}</span>
							<span class="lvfont">个</span>
						</p>
						<p class="sectNum">
							<span class="lvfont">信徒：</span>
							<span class="lanfont">${i5}</span>
							<span class="lvfont">人</span>
						</p>
					</div>
				</div>


			</div>

			<div id="rightCol" class="rightCol">
				<div id="rightContent0" class="showBigContent" style="display:none;">
					<div class="contentTitle"><span id="rightTitle1"></span></div>
					<div class="common-pading" id="rightContent0Body" style="height: 90%;">
						<div id="echRightContent0" class="echarts"></div>
						<div id="echRightContent01" class="echarts"></div>
					</div>
					<div class="mainVideoPop" id="videoCountDivPop">
						<ul>
							<li class="azbj mianLeftDiv" style="margin-top: 40px" >
								<i></i>
								<span></span>
								<div>
									<h6>安置帮教人员</h6>
									<b id="azbj">5560</b>个
								</div>
							</li>
							<li class="sqjz mianCenterDiv" style="margin-top: 40px">
								<i></i>
								<span></span>
								<div>
									<h6>社区矫正人员</h6>
									<b id="sqjz">5560</b>个
								</div>
							</li>
							<li class="jsza mianRightDiv" style="margin-top: 40px">
								<i></i>
								<span></span>
								<div>
									<h6>肇事肇祸等严重精神障碍患者</h6>
									<b id="jsza">5560</b>个
								</div>
							</li>
							<li class="drug mianLeftDiv">
								<i></i>
								<span></span>
								<div>
									<h6>吸毒人员</h6>
									<b id="drug">5560</b>个
								</div>
							</li>
							<li class="aids mianCenterDiv">
								<i></i>
								<span></span>
								<div>
									<h6>艾滋病危险人员</h6>
									<b id="aids">5560</b>个
								</div>
							</li>
							<li class="visit mianRightDiv">
								<i></i>
								<span></span>
								<div>
									<h6>重点上访人员</h6>
									<b id="visit">5560</b>个
								</div>
							</li>
							<li class="sjry mianLeftDiv">
								<i></i>
								<span></span>
								<div>
									<h6>涉教人员</h6>
									<b id="sjry">5560</b>个
								</div>
							</li>
							<li class="dangures mianCenterDiv">
								<i></i>
								<span></span>
								<div>
									<h6>危险品从业人员</h6>
									<b id="dangures">5560</b>个
								</div>
							</li>
							<li class="lsry mianRightDiv">
								<i></i>
								<span></span>
								<div>
									<h6>留守人员</h6>
									<b id="lsry">5560</b>个
								</div>
							</li>
							<li class="key mianLeftDiv">
								<i></i>
								<span></span>
								<div>
									<h6>重点青少年</h6>
									<b id="key">5560</b>个
								</div>
							</li>
							<li class="care mianCenterDiv">
								<i></i>
								<span></span>
								<div>
									<h6>特殊关怀人员</h6>
									<b id="care">5560</b>个
								</div>
							</li>
							<li class="older mianRightDiv">
								<i></i>
								<span></span>
								<div>
									<h6>老年人</h6>
									<b id="older">5560</b>个
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div id="rightContent1" class="showContent">
					<div class="contentTitle"><span id="rightTitle2"></span></div>
					<div class="common-pading" id="rightContent1Body">
						<i></i>
						<div id="echRightContent1" class="echarts"></div>
					</div>
					<div class="common-pading" id="videoDiv">
						<div style="text-align: right;width: 100%;">
							<sys:treeselect id="video" name="videoId" value="" labelName="videoName" placeholder="监控点 ..." labelValue="" title="监控点" url="/tree/ccmTree/treeDataNew?type=camera&fontCss={color:'#fff'}" cssClass="inputVideoBox" allowClear="true" notAllowSelectParent="true" cssStyle="" />
						</div>
						<iframe id="ccmLiveVideoVisualized" name="ccmLiveVideo" src="${ctx}/ccmsys/ccmDevice/getDeviceMap?id=${ccmDevice.id}" style="overflow: visible;" scrolling="yes" frameborder="no" width="479" height="185" allowfullscreen="true" allowtransparency="true"></iframe>
					</div>
					<div id="eventScale" class="layui-container" style="display: none;">
						<%--								<i class="kuang1"></i>
                                                        <i class="kuang2"></i>
                                                        <i class="kuang3"></i>--%>
						<div class="layui-row">
							<div class="layui-col-xs6">
								<div class="scale">
									<div class="divClass1"><span id="eventSpan" class="span1" >1322</span><span class="span2">件</span>
									</div>
									<div class="scaleTitle">累计受理纠纷</div>
									<div class="scaleImage">
										<img src="/arjccm/static/images/eventScale2.png" />
									</div>
								</div>
							</div>
							<div class="layui-col-xs6">
								<div class="scale">
									<div class="divClass1"><span id="eventSpan1" class="span1">802</span><span class="span2">件</span>
									</div>
									<div class="scaleTitle">个体性事件</div>
									<div class="scaleImage">
										<img src="/arjccm/static/images/eventScale2.png" />
									</div>
								</div>
							</div>
						</div>
						<div class="layui-row">
							<div class="layui-col-xs6">
								<div class="scale s2">
									<div class="divClass1"><span id="eventSpan2" class="span1">405</span><span class="span2">件</span>
									</div>
									<div class="scaleTitle">一般个体性事件</div>
									<div class="scaleImage">
										<img src="/arjccm/static/images/eventScale2.png" />
									</div>
								</div>
							</div>
							<div class="layui-col-xs6">
								<div class="scale s2">
									<div class="divClass1"><span id="eventSpan3" class="span1">115</span><span class="span2">件</span>
									</div>
									<div class="scaleTitle">重大个体性事件</div>
									<div class="scaleImage">
										<img src="/arjccm/static/images/eventScale2.png" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="rightContent2" class="showContent">
					<div class="contentTitle"><span id="rightTitle3"></span></div>
					<div class="common-pading" id="rightContent2Body">
						<div style="display: none" id="echRightContent2" class="echarts"></div>
						<div class="event_row">
							<div class="e_cube1">
								<div class="e_cube2">
									<span class="e_num">${j6}</span>
								</div>
								<span class="e_title">累计受理事件</span>

							</div>
						</div>
						<div class="event_row">
							<div class="e_cube1">
								<div class="e_cube2">
									<span class="e_num">${j1}</span>
								</div>
								<span class="e_title">散播谣言</span>

							</div>
						</div>
						<div class="event_row">
							<div class="e_cube1">
								<div class="e_cube2">
									<span class="e_num">${j2}</span>
								</div>
								<span class="e_title">制造骚乱</span>

							</div>
						</div>
						<div class="event_row">
							<div class="e_cube1">
								<div class="e_cube2">
									<span class="e_num">${j3}</span>
								</div>
								<span class="e_title">反动言论</span>

							</div>
						</div>
						<div class="event_row">
							<div class="e_cube1">
								<div class="e_cube2">
									<span class="e_num">${j4}</span>
								</div>
								<span class="e_title">非法集会</span>

							</div>
						</div>
						<div class="event_row">
							<div class="e_cube1">
								<div class="e_cube2">
									<span class="e_num">${j5}</span>
								</div>
								<span class="e_title">其他</span>

							</div>
						</div>

					</div>
				</div>
				<div id="rightContent3" class="showContent">
					<div class="contentTitle"><span id="rightTitle4"></span></div>
					<div class="common-pading" id="rightContent3Body">
						<div id="echRightContent3" class="echarts"></div>
					</div>
				</div>
			</div>

			<div id="bottomCol" class="bottomCol zjlist_area">
				<div class="clearfix">
					<!-- 基督教 -->
					<div class="bottom_icon" onclick="zongjiaoFun(this,'01')">
						<span class="pub-icon icon-jidujiao"></span><span class="pub-name">基督教</span>
					</div>
                    <!-- 伊斯兰教 -->
                    <div class="bottom_icon" onclick="zongjiaoFun(this,'02')">
                        <span class="pub-icon icon-yisilanjiao"></span><span class="pub-name">伊斯兰教</span>
                    </div>
					<!-- 天主教 -->
					<div class="bottom_icon" onclick="zongjiaoFun(this,'05')">
						<span class="pub-icon icon-tianzhujiao"></span><span class="pub-name">天主教</span>
					</div>

					<!-- 佛教 -->
					<div class="bottom_icon" onclick="zongjiaoFun(this,'03')">
						<span class="pub-icon icon-fojiao"></span><span class="pub-name">佛教</span>
					</div>
					<!-- 道教 -->
					<div class="bottom_icon" onclick="zongjiaoFun(this,'04')">
						<span class="pub-icon icon-daojiao"></span><span class="pub-name">道教</span>
					</div>
					<!-- 视频监控 -->
					<div class="bottom_icon" onclick="shipinjiankongFun(this)" id="VideoFlag" VideoFlagAttr="false">
						<span class="pub-icon icon-shipins"></span><span class="pub-name">视频监控</span>
					</div>
                    <!-- 医院 -->
                    <div class="bottom_icon" onclick="yiyuanFun(this)">
                        <span class="pub-icon icon-yiyuan"></span></span><span class="pub-name">医院</span>
                    </div>
					<!-- 警务室-->
					<div class="bottom_icon" onclick="jingwushiFun(this)">
						<span class="pub-icon icon-jingwushi"></span> <span class="pub-name">警务室</span>
					</div>
				</div>
			</div>

			<div id="popup" class="ol-popup  popup-ksh">
				<div class="">
					<div class="jbox-state">
						<div id="popup-content" style="padding: 8px 15px;"></div>
					</div>
				</div>
			</div>
			<div id="pubMap"></div>
			<div id="mapMask" class="map"></div>

		</div>
	</div>
</div>
</body>

</html>