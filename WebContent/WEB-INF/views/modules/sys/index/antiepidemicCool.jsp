<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit|ie-comp|ie-stand" />
		<title>社会网格化管理信息系统</title>
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
		<link rel="stylesheet" href="${ctxStatic}/common/index/css/antiepidemicCool.css">
		<script type="text/javascript">
			var ctxStatic = '${ctxStatic}',
				ctx = '${ctx}';
		</script>

		<script src="${ctxStatic}/ol/ol.js"></script>
		<script src="${ctxStatic}/d3/d3.v4.min.js"></script>
		<script src="${ctxStatic}/modules/map/js/mapconfig.js"></script>
		<script src="${ctxStatic}/modules/map/js/commonMap.js"></script>
		<script src="${ctxStatic}/mapv/mapv.min.js"></script>
		<script src="${ctxStatic}/supermapopenlayers/iclient-openlayers.min.js"></script>
		<%--<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.min.js"></script>--%>
		<script src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
		<%--<script src="${ctxStatic}/common/index/Scripts/js/echarts.min.js"></script>--%>

		<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
		<script src="${ctxStatic}/custom/date/date.js"></script>
		<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
		<script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
		<script src="${ctxStatic}/common/index/Scripts/js/antiepidemicCool.js"></script>
		<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
		<style type="text/css">
			.table-info td {
				padding-top: 12px;
			}
			.input-medium.Wdate {
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

			.jbox-button-panel {
				height: unset !important;
			}

			.jbox-title-panel {
				height: 35px !important;
			}

			.echarts {
				width: 450px;
				height: 200px;
			}

			.common-pading {
				width: 100%;
				padding: 0.25% 5.5%;
			}

			.icon-search {
				color: #fff !important;
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

			.form-signin-heading {
				font-family: 微软雅黑;
				font-size: 28px;
				color: #ffffff;
				width: 50%;
				text-align: left;
				position: absolute;
				top: 17px;
				left: 80px;
			}
			#echLeftContent1{
				display: inline-block!important;
			}
            #echLeftContent1>div{
                position: absolute!important;
            }

            /*Z-Tree位置*/
            #jbox{
                top: 130px !important;
                left: 790px !important;
            }
            .btn{
                background:url("${ctxStatic}/bootstrap/2.3.1/img/cyan-cz.png") no-repeat;
                background-size: 100% 100%;
            }
            .btn:hover{
                color: #fff;
                background:url("${ctxStatic}/bootstrap/2.3.1/img/cyan-jh.png") no-repeat;
                background-size: 100% 100%;
            }

#leftContent1{
	height: 45%;
	margin-top: 15px;
	margin-bottom: 35px;
}
#leftContent2{
	height: 45%;
}
#rightContent1,#rightContent2,#rightContent3{
	height: 30%;
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
				<div class="row-fluid header" style="position: absolute;z-index:2;top: -2px;">
					<div>
						<!-- 菜单 -->
						<div style="z-index: 9999;position: absolute;width:100%; top: 0px;left: 26px;">
							<div style="float: right; padding-top: 13px;"  class="Logout">
								<a style="font-size:unset;color: unset;display: inline;" href="${ctx}/sys/map/projectIndex"><img src="/arjccm/static/common/index/images/statIndexCool/home.png"></a>
								<img style="display: inline;" src="/arjccm/static/common/index/images/statIndexCool/vertical.png">
								<a style="font-size:unset;color: unset;display: inline;" href="${ctx}/logout"><img src="/arjccm/static/common/index/images/statIndexCool/exit.png"></a>
								<%--							<span> <a href="${ctx}/logout"> <i--%>
								<%--									class="icon-off align-top bigger-125"></i> 退出--%>
								<%--							</a>--%>
								<%--							</span>--%>
							</div>

						</div>

					</div>

					<div>
						<h5 class="header-logo"></h5>
					</div>
				</div>
				<div class="row-fluid" style="width: 100%;height: 100%;position: absolute;padding-top: 90px;">
					<div id="leftCol" class="leftCol">
						<div id="leftContent1"  class="showContent">
							<div class="contentTitle"><span id="leftTitle1"></span></div>
							<div class="common-pading" id="leftContent1Body">
								<div id="echleftContent1" class="echarts"></div>
							</div>
						</div>
						<div id="leftContent2"  class="showContent">
							<div class="contentTitle"><span id="leftTitle2"></span></div>
							<div class="common-pading" id="leftContent2Body">
								<div id="echLeftContent2" class="echarts"></div>
							</div>
						</div>

					</div>
					<div id="rightCol" class="rightCol">


						<div id="rightContent1" class="showContent">
							<div class="contentTitle"><span id="rightTitle1"></span></div>
							<div class="common-pading" id="rightContent1Body">
								<div id="echRightContent1" class="echarts"></div>
							</div>
						</div>
						<div id="rightContent2" class="showContent">
							<div class="contentTitle"><span id="rightTitle2"></span></div>
							<div class="common-pading" id="rightContent2Body">
								<div id="echRightContent2" class="echarts"></div>
							</div>
						</div>
						<div id="rightContent3" class="showContent" >
							<div class="contentTitle"><span id="rightTitle3"></span></div>
							<div class="common-pading" id="rightContent3Body" style="height: 90%;">
								<div id="echRightContent3" class="echarts"></div>
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

								</ul>
							</div>
						</div>

					</div>
					<div id="topCol" class="topCol">

					</div>
					<div id="bottomCol" class="bottomCol">
						<div style="padding-left: 50px;padding-top: 20px;">
							<!--学校  -->
							<div class="pub-flag" onclick="xuexiaoFun(this)">
								<span class="pub-icon icon-xuexiao"></span> <span class="pub-name">学校</span>
							</div>
							<!-- 医院 -->
							<div class="pub-flag" onclick="yiyuanFun(this)">
								<span class="pub-icon icon-yiyuan"></span> <span class="pub-name">医院</span>
							</div>
							<!-- 加油站 -->
							<div class="pub-flag" onclick="jiayouzhanFun(this)">
								<span class="pub-icon icon-jiayouzhans"></span> <span class="pub-name">加油站</span>
							</div>
							<!-- 商场超市 -->
							<div class="pub-flag" onclick="shangchangFun(this)">
								<span class="pub-icon icon-shangchang"></span> <span class="pub-name">商场超市</span>
							</div>
							<!-- 娱乐场所 -->
							<div class="pub-flag" onclick="yuleFun(this)">
								<span class="pub-icon icon-yule"></span> <span class="pub-name">娱乐场所</span>
							</div>
							<!-- 宾馆 -->
							<div class="pub-flag" onclick="binguanFun(this)">
								<span class="pub-icon icon-bingguan"></span> <span class="pub-name">酒店宾馆</span>
							</div>
							<!-- 涉危涉爆单位 -->
							<div class="pub-flag" onclick="sheweishebaoFun(this)">
								<span class="pub-icon icon-sheweishebao"></span> <span class="pub-name">涉危涉爆</span>
							</div>

							<!-- 视频监控 -->
							<div class="pub-flag" onclick="shipinjiankongFun(this)" id="VideoFlag" VideoFlagAttr="false">
								<span class="pub-icon icon-shipins"></span> <span class="pub-name">视频监控</span>
							</div>
							<!-- 警员-->
							<div class="pub-flag" onclick="jingyuanFun(this)">
								<span class="pub-icon icon-jingyuan"></span> <span class="pub-name">工作人员</span>
							</div>
							<%--<c:if test="${sysConfig.objId eq 'xinmishi'}">--%>
							<!-- 警务室-->
							<div class="pub-flag" onclick="jingwushiFun(this)">
								<span class="pub-icon icon-jingwushi"></span> <span class="pub-name">警务室</span>
							</div>
							<!-- 工作站-->
							<div class="pub-flag" onclick="gongzuozhanFun(this)">
								<span class="pub-icon icon-gongzuozhan"></span> <span class="pub-name">工作站</span>
							</div>
							<!-- 广播站-->
							<div class="pub-flag" onclick="guangbozhanFun(this)">
								<span class="pub-icon icon-guangbozhan"></span> <span class="pub-name">广播站</span>
							</div>
							<!-- 警车-->
							<!-- <div class="pub-flag" onclick="jingcheFun(this)">
							   <span class="pub-icon icon-jingche"></span> <span
								   class="pub-name">警车</span>
						    </div>  -->
							<%--</c:if>--%>
							<!--机顶盒  -->
							<div class="pub-flag" onclick="SetTopBoxFun(this)">
								<span class="pub-icon icon-Settopbox"></span> <span class="pub-name">机顶盒</span>
							</div>

							<!--疫情人员  -->
							<div class="pub-flag">
								<span class="pub-icon icon-yqry"></span> <span class="pub-name">疫情人员</span>
							</div>
						</div>
					</div>
					<%--<div id="toolCol" class="toolCol">
						<div style="height: 40%;text-align: center;margin-top: 30%;" onclick="Map.selectQuery('Polygon')">
							<img src="/arjccm/static/common/index/images/statIndexCool/draw.png">
							<p>标绘</p>
						</div>
						<div style="height: 40%;text-align: center;" onclick="Map.fullScreen()">
							<img src="/arjccm/static/common/index/images/statIndexCool/allScreen.png">
							<p>全屏</p>
						</div>
					</div>--%>
					<div id="popup" class="ol-popup  popup-ksh">
										<div class="popup-content" id="popup-content"></div>--%>
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