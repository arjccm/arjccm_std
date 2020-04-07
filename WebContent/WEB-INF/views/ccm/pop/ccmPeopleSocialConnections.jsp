<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>社交关系</title>
	<meta name="decorator" content="default" />
	<script type="text/javascript"
			src="${ctxStatic}/ccm/house/js/ccmHouseReleaseInfo.js">
	</script>
	<script type="text/javascript"
			src="${ctxStatic}/ccm/pop/js/ccmCommon.js"></script>
	<script src="${ctxStatic}/common/index/Scripts/js/echarts.min.js"></script>
	<link rel="stylesheet" href="${ctxStatic}/modules/map/css/map.css" type="text/css">
	<link rel="stylesheet" href="${ctxStatic}/supermapopenlayers/iclient-openlayers.min.css" type="text/css">
	<link rel="stylesheet" href="${ctxStatic}/ol/ol.css" type="text/css">
	<script src="${ctxStatic}/ol/ol.js"></script>
	<script src="${ctxStatic}/d3/d3.v4.min.js"></script>
	<script src="${ctxStatic}/modules/map/js/mapconfig.js"></script>
	<script src="${ctxStatic}/modules/map/js/commonMap.js"></script>
	<script src="${ctxStatic}/mapv/mapv.min.js"></script>
	<script src="${ctxStatic}/supermapopenlayers/iclient-openlayers.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/ccm/pop/js/earlywarning.js"></script>
	<script type="text/javascript">
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
	<style>
		#traffic-div{
			margin-top: 20px;
			margin-left: 30px;
		}
		.traffic1{
			width: 300px;
			float: left;
			padding-bottom: 20px;
		}
		.traffic2{
			width: 290px;
			height: 460px;
			border-left: 1px solid  #027DA8 ;
			margin-left: 9px;
			margin-top: -5px;
			padding-top: 15px;
		}
		.traffic-plane{
			width: 240px;
			height: 100px;
			background: url(${ctxStatic}/images/plan.png) no-repeat center center;
			background-size: 100% 100%;
			margin-left: 20px;
			margin-bottom: 20px;
		}
		.traffic-train{
			width: 240px;
			height: 100px;
			background: url(${ctxStatic}/images/train.png) no-repeat center center;
			background-size: 100% 100%;
			margin-left: 20px;
			margin-bottom: 20px;
		}
		.traffic-coach{
			width: 240px;
			height: 100px;
			background: url(${ctxStatic}/images/coach.png) no-repeat center center;
			background-size: 100% 100%;
			margin-left: 20px;
			margin-bottom: 20px;
		}
		.traffic-accommodation{
			width: 240px;
			height: 100px;
			background: url(${ctxStatic}/images/accommodation.png) no-repeat center center;
			background-size: 100% 100%;
			margin-left: 20px;
			margin-bottom: 20px;
		}
		.traffic-p{
			width:108px;
			height:14px;
			font-size:18px;
			font-family:PingFang SC;
			font-weight:bold;
			color:rgba(255,255,255,1);
			line-height:28px;

			margin-left: 30px;
			margin-bottom: 10px;

		}
		.traffic-img{
			width: 300px;
			margin-bottom: 5px;
		}
		.traffic-plane .traffic3{
			width:38px ;
			height: 38px;
			float: left;
			background: url(${ctxStatic}/images/plan1.png) no-repeat center center;
			background-size: 100% 100%;
			margin: 10px 6px 15px 13px;
		}
		.traffic-train .traffic3{
			width:38px ;
			height: 38px;
			float: left;
			background: url(${ctxStatic}/images/train1.png) no-repeat center center;
			background-size: 100% 100%;
			margin: 10px 6px 15px 13px;
		}
		.traffic-coach .traffic3{
			width:38px ;
			height: 38px;
			float: left;
			background: url(${ctxStatic}/images/coach1.png) no-repeat center center;
			background-size: 100% 100%;
			margin: 10px 6px 15px 13px;
		}
		.traffic-accommodation .traffic3{
			width:38px ;
			height: 38px;
			float: left;
			background: url(${ctxStatic}/images/accommodation1.png) no-repeat center center;
			background-size: 100% 100%;
			margin: 10px 6px 15px 13px;
		}

		.traffic4{
			width: 170px;
			float: left;
			margin-top: 6px;
			margin-bottom: 15px;

		}
		.origin{
			width:35px;
			height:17px;
			font-size:18px;
			font-family:PingFang SC;
			font-weight:bold;
			color:rgba(255,255,255,1);
			line-height:28px;
			margin-left: 8px;
		}
		.destination{
			width:35px;
			height:17px;
			font-size:18px;
			font-family:PingFang SC;
			font-weight:bold;
			color:rgba(255,255,255,1);
			line-height:28px;
			margin-right: 8px;
		}
		.hx{
			width: 26px;
			height: 5px;
			background: url(${ctxStatic}/images/jt.png) no-repeat center center;
			background-size: 100% 100%;
			margin: 0 8px 10px 8px;
		}
		.traffic-time{
			width:170px;
			height:12px;
			font-size:14px;
			font-family:PingFang SC;
			font-weight:400;
			color:rgba(255,255,255,1);
			line-height:28px;
			opacity:0.8;

		}
		.information{
			height:17px;
			font-size:18px;
			font-family:PingFang SC;
			font-weight:bold;
			color:rgba(255,255,255,1);
			line-height:28px;
			clear: both;
			margin-left: 20px;
		}
		.name{
			width:143px;
			height:17px;
			font-size:18px;
			font-family:PingFang SC;
			font-weight:bold;
			color:rgba(255,255,255,1);
			line-height:28px;
		}
		.nav-tabs>li>a {
			border-right:1px solid rgba(2,125,168,1);
		}
		/*body{*/
		/*	background: #122E59!important;*/
		/*}*/

		.button-backimg{
			width: 26px;
			height: 27px;
			background: url(${ctxStatic}/images/buttonback.png) no-repeat center center;
			background-size: 100% 100%;
			margin: 0 0px 0px 0px;
		}
        .lab1{
            width: 69px;
            height: 14px;
            font-size: 14px;
            font-family: PingFang SC;
            font-weight: bold;
            color: rgba(255,255,255,1);
            line-height: 28px;
            margin-right: 120px;
        }
		.lab2{
			width: 69px;
			height: 14px;
			font-size: 14px;
			font-family: PingFang SC;
			font-weight: bold;
			color: rgba(255,255,255,1);
			line-height: 28px;
			margin-right: 72px;
		}
        .button-ss,.button-bf,.button-zt{
            width:86px!important;
            height:27px;
            background:rgba(2,125,168,1);
            border-radius:4px;
            margin: 0 15px;
            background: url(${ctxStatic}/images/ssbj.png) no-repeat center center;
            background-size: 100% 100%;
        }
		.site-w{
			width:310px;
			height: 80px;
			margin-top: 20px;
			margin-left: 30px;
		}
		.site-x2{
			width: 2px;
			height: 68px;
			background:rgba(2,125,168,1);
			margin-left: 5px;
			margin-top: -3px;
		}
		.site-x1{
			float: left;
		}
		.site-n{
			float: left;
			width:274px;
			height:80px;
			background:#083960;
			margin-top: 8px;
			margin-left: 20px;
		}
		.site-p1{
			width:146px;
			height:11px;
			font-size:14px;
			font-family:PingFang SC;
			font-weight:bold;
			color:rgba(255,255,255,1);
			line-height:28px;
			opacity:0.5;
			margin: 15px;
		}
		.site-p2{
			width:111px;
			height:16px;
			font-size:16px;
			font-family:PingFang SC;
			font-weight:bold;
			color:#FFFFFF;
			line-height:28px;
			margin: 15px;
		}
	</style>
</head>
<body>
<input type="hidden" id="ident" name="ident" value="${ident}">
<ul id="myTab" class="nav nav-tabs nav_tabs_sl">
	<li ><a href="#SocialRelations" data-toggle="tab" onclick="showmap(2)">社会关系图谱</a></li>
	<li ><a href="#roomPop" data-toggle="tab" onclick="showmap(2)">同住人员信息</a></li>
	<li ><a href="#homePop" data-toggle="tab" onclick="showmap(2)">家庭成员信息</a></li>
	<li ><a href="#trafficAccommodation" data-toggle="tab" onclick="showmap(2)">交通住宿信息</a></li>
	<li ><a href="#mapMask" data-toggle="tab" onclick="showmap(1)">布控结果信息</a></li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="SocialRelations" style="align-content:center;width:100%;height:800px;">
		<div id="SocialRelationsEcharts" style="width:90%;height:300px;margin-left:5%;">
		</div>
		<div style="width:100%;height:490px;margin-top:10px;">
			<c:if test="${not empty listSocial}">
				<table class="table table-striped table-bordered table-condensed table-gradient">
					<tr>
						<td>姓名</td>
						<td>公民身份号码</td>
						<td>关系</td>
					</tr>
					<c:forEach items="${listSocial}" var="cpp">
						<tr>
							<td>${cpp.name}</td>
							<td>${cpp.ident}</td>
							<td>${fns:getDictLabel(cpp.cpptype, 'cpp_pop_pop_type', '')}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${empty listSocial}">
				<div style="text-align:center;width:100%;height:100%;"><h3>暂无数据</h3></div>
			</c:if>
		</div>
	</div>
	<div class="tab-pane fade" id="roomPop">
		<c:if test="${not empty listRoomPeople}">
			<table class="table table-striped table-bordered table-condensed table-gradient">
				<tr>
					<td>人员图片</td>
					<td>姓名</td>
					<td>性别</td>
					<td>出生日期</td>
					<td>公民身份号码</td>
					<td>联系方式</td>
				</tr>
				<c:forEach items="${listRoomPeople}" var="ccmpop">
					<tr>
						<td width="100px">
							<img src="${ccmpop.images}" style="height:80px;"/>
						</td>
						<td>${ccmpop.name}</td>
						<td>${fns:getDictLabel(ccmpop.sex, 'sex', '')}</td>
						<td><fmt:formatDate value="${ccmpop.birthday}" pattern="yyyy-MM-dd"/></td>
						<td>${ccmpop.ident}</td>
						<td>${ccmpop.telephone}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${empty listRoomPeople}">
			<div style="text-align:center;width:100%;height:100%;"><h3>暂无数据</h3></div>
		</c:if>
	</div>
	<div class="tab-pane fade" id="homePop">
		<c:if test="${not empty listAccount}">
			<table class="table table-striped table-bordered table-condensed table-gradient">
				<tr>
					<td>人员图片</td>
					<td>姓名</td>
					<td>性别</td>
					<td>出生日期</td>
					<td>公民身份号码</td>
					<td>联系方式</td>
					<td>与户主关系</td>
				</tr>
				<c:forEach items="${listAccount}" var="ccmpop">
					<tr>
						<td width="100px">
							<img src="${ccmpop.images}" style="height:80px;"/>
						</td>
						<td>${ccmpop.name}</td>
						<td>${fns:getDictLabel(ccmpop.sex, 'sex', '')}</td>
						<td><fmt:formatDate value="${ccmpop.birthday}" pattern="yyyy-MM-dd"/></td>
						<td>${ccmpop.ident}</td>
						<td>${ccmpop.telephone}</td>
						<td>${fns:getDictLabel(ccmpop.accountrelation,'sys_ccm_fami_ties',"")}
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${empty listAccount}">
			<div style="text-align:center;width:100%;height:100%;"><h3>暂无数据</h3></div>
		</c:if>
	</div>
	<div class="tab-pane fade" id="trafficAccommodation" style="overflow: auto">
		<div id="traffic-div" class="clearfix">
			<%--<div class="traffic1">
                <p class="traffic-p">2019-02-18</p>
                <img src="${ctxStatic}/images/zdry-top2.png" class="traffic-img">
                <div class="traffic2">
                    <div class="traffic-plane">
                        <div class="traffic3">
                        </div>
                        <div class="traffic4">
                            <span class="origin">天津</span><img class="hx" src="${ctxStatic}/images/jt.png"><span
                                class="destination">北京</span>
                            <p class="traffic-time">2020-02-18 08:30-10:15</p>
                        </div>
                        <p class="information">天津航空GS7581</p>
                    </div>
                </div>
                <div class="traffic2">
                    <div class="traffic-train">
                        <div class="traffic3">
                        </div>
                        <div class="traffic4">
                            <span class="origin">天津</span><img class="hx" src="${ctxStatic}/images/jt.png"><span
                                class="destination">北京</span>
                            <p class="traffic-time">2020-02-18 08:30-10:15</p>
                        </div>
                        <p class="information">天津航空GS7581</p>
                    </div>
                </div>
            </div>--%>
		</div>
		<%--<c:if test="${not empty listAccount}">
            <div id="traffic-div">

                <c:forEach items="${listAccount}" var="ccmpop">


                </c:forEach>
            </div>
        </c:if>--%>
		<%--<c:if test="${empty listAccount}">
            <div style="text-align:center;width:100%;height:100%;"><h3>暂无数据</h3></div>
        </c:if>--%>
	</div>

	<%--<div class="tab-pane fade" id="earlywarning">
		&lt;%&ndash;	<div id="earlywarningEcharts" style="width:90%;height:300px;margin-left:5%;">
				<span>显示地图</span>
				<div id="pubMap"></div>
				<div id="mapMask" class="map"></div>
			</div>&ndash;%&gt;
	</div>--%>

	<div id="pubMap"></div>
	<div id="mapMask" class="map" style="float:left;width: 600px;height: 500px;"></div>
	<div id="tablemap" >
		<%--<table class="table">
                <li>
                    <span>姓名:</span>
                </li>
                <li class=""><label >开始日期：</label>
                    <input name="beginBirthday" type="text" maxlength="20" class="input-medium Wdate"
                           value="<fmt:formatDate value="${ccmPeople.beginBirthday}" pattern="yyyy-MM-dd"/>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> </li>
                <li class=""><label >结束日期：</label>
                    <input name="endBirthday" type="text" maxlength="20" class="input-medium Wdate"
                           value="<fmt:formatDate value="${ccmPeople.endBirthday}" pattern="yyyy-MM-dd"/>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
                </li>
        </table>--%>


		<table class="table " style="width: 423px;height: 610px;position:absolute;background: none;top: 37px;right: 5px;" >
			<tr>
				<td style="position:absolute;width: 422px;height: 610px;margin-top: 5px;background: #ffffff;">
					<label class="lab1" style="margin-top:12px"><span > 姓名:</span ><span id="warpeoplename"></span></label>
					<label  class="lab2"><span >车牌号:</span> <span id="warcarid"></span></label>
					<br>
					<li style="margin-top:12px"><label >开始日期：</label>
						<input name="beginBirthday" id="beginBirthday" type="text" maxlength="20" class="input-medium Wdate"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> </li>
					<li class=""><label >结束日期：</label>
						<input name="endBirthday" id="endBirthday" type="text" maxlength="20" class="input-medium Wdate"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
					</li>
					<li>
						<a class="btn btn-primary" onclick="getdata()">搜索</a>
						<a class="btn btn-export" >播放</a>
						<a class="btn btn-export" >暂停</a>
					</li>
                    <li>
                        <div class="site-w">
                            <div class="site-x1" >
                                <img src="${ctxStatic}/images/dian.png"/>
                                <div class="site-x2"></div>
                            </div>
                            <div class="site-n">
								<p class="site-p1"><span>2020-01-05 07:27:09</span></p>
								<p class="site-p2">青岛路与郑州路</p>
                            </div>
                        </div>
                    </li>
					<li>
						<div class="site-w">
							<div class="site-x1" >
								<img src="${ctxStatic}/images/dian.png"/>
								<div class="site-x2"></div>
							</div>
							<div class="site-n">
								<p class="site-p1"><span>2020-01-05 07:23:37</span></p>
								<p class="site-p2">厦门路与大营路</p>
							</div>
						</div>
					</li>
					<li>
						<div class="site-w">
							<div class="site-x1" >
								<img src="${ctxStatic}/images/dian.png"/>
								<div class="site-x2"></div>
							</div>
							<div class="site-n">
								<p class="site-p1"><span>2020-01-05 07:22:44</span></p>
								<p class="site-p2">厦门路与苏州路</p>
							</div>
						</div>
					</li>
					<li>
						<div class="site-w">
							<div class="site-x1" >
								<img src="${ctxStatic}/images/dian.png"/>
								<div class="site-x2"></div>
							</div>
							<div class="site-n">
								<p class="site-p1"><span>2020-01-05 07:21:19</span></p>
								<p class="site-p2">R厦门路与苏州路路口</p>
							</div>
						</div>
					</li>
					<li>
						<div class="site-w">
							<div class="site-x1" >
								<img src="${ctxStatic}/images/dian.png"/>
								<div class="site-x2"></div>
							</div>
							<div class="site-n">
								<p class="site-p1"><span>2020-01-05 07:21:19</span></p>
								<p class="site-p2">R厦门路与苏州路路口</p>
							</div>
						</div>
					</li>
				</td>
			</tr>
		</table>
	</div>


</div>
<script>
	$(function(){
		$("#mapMask").attr("style","display:none;");
		$("#tablemap").attr("style","display:none;");

		var trafficJson=[
			{
				"date":"2019-02-18",
				"traffic":{
					"plan":{"origin":"天津","destination":"北京","time":"2020-02-18 08:30-10:15","information":"天津航空GS7581"},
					"train":{"origin":"天津","destination":"北京","time":"2020-02-18 08:30-10:15","information":"G81次"},
					"coach":{"origin":"天津","destination":"北京","time":"2020-02-18 08:30-10:15","information":"津A1234"},
				},
				"accommodation":{
					"name":"新密盛世商务酒店", "addredd":"新密市西大街长乐路38号","information":"2020-02-18退房(4晚)",
				},
			},
			{
				"date":"2019-02-17",
				"traffic":{
					"train":{"origin":"天津","destination":"北京","time":"2020-02-18 08:30-10:15","information":"G81次"},
					"coach":{"origin":"天津","destination":"北京","time":"2020-02-18 08:30-10:15","information":"津A1234"},
				}
			},
			{
				"date":"2019-02-16",
				"traffic":{
					"plan":{"origin":"天津","destination":"北京","time":"2020-02-18 08:30-10:15","information":"天津航空GS7581"},
					"train":{"origin":"天津","destination":"北京","time":"2020-02-18 08:30-10:15","information":"G81次"},
					"plan":{"origin":"天津","destination":"北京","time":"2020-02-18 08:30-10:15","information":"天津航空GS7581"},
				},
			},
			{
				"date":"2019-02-15",
				"traffic":{
					"plan":{"origin":"天津","destination":"北京","time":"2020-02-18 08:30-10:15","information":"天津航空GS7581"},
					"train":{"origin":"天津","destination":"北京","time":"2020-02-18 08:30-10:15","information":"G81次"},
					"coach":{"origin":"天津","destination":"北京","time":"2020-02-18 08:30-10:15","information":"津A1234"},
				},
				"accommodation":{
					"name":"新密盛世商务酒店", "addredd":"新密市西大街长乐路38号","information":"2020-02-15入住(4晚)",
				},
			},
		];


		if(trafficJson.length>3){
			$("#traffic-div").width(300*trafficJson.length)
		}
		for(var i=0;i<trafficJson.length;i++){
			var traffic1 = '<div class="traffic1" id="traffic'+i+'"><p class="traffic-p">'+trafficJson[i].date+'</p><img src="${ctxStatic}/images/zdry-top2.png" class="traffic-img"><div class="traffic2"></div></div>';
			$("#traffic-div").append(traffic1);
		}
		for(var i=0;i<trafficJson.length;i++){
			//alert("trafficJson")
			if(trafficJson[i].hasOwnProperty("traffic")&&trafficJson[i].traffic!=null&&trafficJson[i].traffic!=""){
				if(trafficJson[i].traffic.hasOwnProperty("plan")&&trafficJson[i].traffic.plan!=null&&trafficJson[i].traffic.plan!=""){
					//alert("plan")
					var plan = '<div class="traffic-plane"><div class="traffic3"></div><div class="traffic4"><span class="origin">'+trafficJson[i].traffic.plan.origin+'</span><img class="hx" src="${ctxStatic}/images/jt.png">' +
							'<span class="destination">'+trafficJson[i].traffic.plan.destination+'</span><p class="traffic-time">'+trafficJson[i].traffic.plan.time+'</p></div><p class="information">'+trafficJson[i].traffic.plan.information+'</p></div>';
					$("#traffic"+i+" .traffic2").append(plan);
				}
				if(trafficJson[i].traffic.hasOwnProperty("train")&&trafficJson[i].traffic.train!=null&&trafficJson[i].traffic.train!=""){
					//alert("train")
					var train = '<div class="traffic-train"><div class="traffic3"></div><div class="traffic4"><span class="origin">'+trafficJson[i].traffic.train.origin+'</span><img class="hx" src="${ctxStatic}/images/jt.png">' +
							'<span class="destination">'+trafficJson[i].traffic.train.destination+'</span><p class="traffic-time">'+trafficJson[i].traffic.train.time+'</p></div><p class="information">'+trafficJson[i].traffic.train.information+'</p></div>';
					$("#traffic"+i+" .traffic2").append(train);
				}
				if(trafficJson[i].traffic.hasOwnProperty("coach")&&trafficJson[i].traffic.coach!=null&&trafficJson[i].traffic.coach!=""){
					//alert("coach")
					var coach = '<div class="traffic-coach"><div class="traffic3"></div><div class="traffic4"><span class="origin">'+trafficJson[i].traffic.coach.origin+'</span><img class="hx" src="${ctxStatic}/images/jt.png">' +
							'<span class="destination">'+trafficJson[i].traffic.coach.destination+'</span><p class="traffic-time">'+trafficJson[i].traffic.coach.time+'</p></div><p class="information">'+trafficJson[i].traffic.coach.information+'</p></div>';
					$("#traffic"+i+" .traffic2").append(coach);
				}
			}
			if(trafficJson[i].hasOwnProperty("accommodation")&&trafficJson[i].accommodation!=null&&trafficJson[i].accommodation!=""){
				//alert("accommodation")
				var accommodation = '<div class="traffic-accommodation"><div class="traffic3"></div><div class="traffic4"><span class="name">'+trafficJson[i].accommodation.name+'</span>' +
						'<p class="traffic-time">'+trafficJson[i].accommodation.addredd+'</p></div><p class="information">'+trafficJson[i].accommodation.information+'</p></div>';
				$("#traffic"+i+" .traffic2").append(accommodation);
			}
		}
		if(trafficJson.length==0){
			var zw='<div style="text-align:center;width:100%;height:100%;"><h3>暂无数据</h3></div>';
			$("#traffic-div").append(zw);
		}




		var cppPopPopType={};
		var cppWebType={};
		var cppVehileType={};
		var cppPhoneType={};
		$.ajax({
			type : "post",
			url : "${ctx}/sys/dict/listData?type=cpp_pop_pop_type",
			async : false,
			success : function(data){
				for(var i in data){
					cppPopPopType[data[i].value]=data[i].label;
				}
			}
		});
		$.ajax({
			type : "post",
			url : "${ctx}/sys/dict/listData?type=cpp_vehile_type",
			async : false,
			success : function(data){
				for(var i in data){
					cppVehileType[data[i].value]=data[i].label;
				}
			}
		});
		$.ajax({
			type : "post",
			url : "${ctx}/sys/dict/listData?type=cpp_web_type",
			async : false,
			success : function(data){
				for(var i in data){
					cppWebType[data[i].value]=data[i].label;
				}
			}
		});
		$.ajax({
			type : "post",
			url : "${ctx}/sys/dict/listData?type=cpp_phone_type",
			async : false,
			success : function(data){
				for(var i in data){
					cppPhoneType[data[i].value]=data[i].label;
				}
			}
		});
		$.getJSON('${ctx}/pop/ccmPeople/relation?id=${ccmPeople.id}',function(data){
			var cppPopPop=data.cppPopPop;
			var cppPopVehile=data.cppPopVehile;
			var name="${ccmPeople.name}";
			var myChartData=[{
				name: name,
				draggable: true,
			}];
			for(var i in cppPopPop){
				myChartData.push({
					name: cppPopPop[i].otherName,
					type:cppPopPopType[cppPopPop[i].type],
					category: 1,
					draggable: true,
				})
			}
			for(var i in cppPopVehile){
				if(cppPopVehile[i].type=='01'){
					myChartData.push({
						name:cppPopVehile[i].textName,
						type:cppVehileType[cppPopVehile[i].subType],
						category: 1,
						draggable: true,
					})
				}else if(cppPopVehile[i].type=='02'){
					myChartData.push({
						name:cppPopVehile[i].textName,
						type:cppPhoneType[cppPopVehile[i].subType],
						category: 1,
						draggable: true,
					})
				}else if(cppPopVehile[i].type=='03'){
					myChartData.push({
						name:cppPopVehile[i].textName,
						type:cppWebType[cppPopVehile[i].subType],
						category: 1,
						draggable: true,
					})
				}else if(cppPopVehile[i].type=='04'){
					myChartData.push({
						name:cppPopVehile[i].textName,
						type:cppPopVehile[i].otherTypeName,
						category: 1,
						draggable: true,
					})
				}

			}

			console.log(myChartData)
			var linksData=[];
			var len=myChartData.length;
			var j=1;
			if(len>0){
				for(var j=1;j<len;j++){
					linksData.push({
						source: 0,
						target: Number(j),
						value: myChartData[j].type
					})
				}
			}
			console.log(linksData)
			var myChart = echarts.init(document.getElementById("SocialRelationsEcharts"));
			var option = {
				title: {
					text: ''
				},
				tooltip: {},
				animationDurationUpdate: 1500,
				animationEasingUpdate: 'quinticInOut',
				label: {
					normal: {
						show: true,
						textStyle: {
							fontSize: 12
						},
					}
				},
				series: [

					{
						type: 'graph',
						layout: 'force',
						symbolSize: 45,
						focusNodeAdjacency: true,
						roam: true,
						categories: [{
							name: '夫妻',
							itemStyle: {
								normal: {
									color: "#009800",
								}
							}
						}, {
							name: '战友',
							itemStyle: {
								normal: {
									color: "#4592FF",
								}
							}
						}, {
							name: '亲戚',
							itemStyle: {
								normal: {
									color: "#3592F",
								}
							}
						}],
						label: {
							normal: {
								show: true,
								textStyle: {
									fontSize: 12
								},
							}
						},
						force: {
							repulsion: 1000
						},
						edgeSymbolSize: [4, 50],
						edgeLabel: {
							normal: {
								show: true,
								textStyle: {
									fontSize: 10
								},
								formatter: "{c}"
							}
						},
						data:myChartData,
						links:linksData,
						lineStyle: {
							normal: {
								opacity: 0.9,
								width: 1,
								curveness: 0
							}
						}
					}
				]
			};
			myChart.setOption(option);

		})
	})

	function showmap(num) {
		if(num == 2){
			$("#mapMask").attr("style","display:none;");
			$("#tablemap").attr("style","display:none;");
		} else {
			$("#mapMask").attr("style","display:block;");
			$("#tablemap").attr("style","display:block;");
			getdata();
		}
	}

	function getdata() {
		var ident = $("#ident").val();
		var beginBirthday = $("#beginBirthday").val();
		var endBirthday = $("#endBirthday").val();
		beginDateNew = Date.parse(new Date(beginBirthday.replace(/-/g, "/")));
		endDateNew = Date.parse(new Date(endBirthday.replace(/-/g, "/")));
		var time = endDateNew - beginDateNew;
		if (time < 0) {
			$.jBox.tip('开始时间必须小于结束时间!');
			return;
		}

		$.ajax({
			type: "POST",
			url: ctx + "/warning/ccmEarlyWarning/findListbyalarmDate",
			data: {
				idCard: ident,
				beginDate: beginBirthday,
				endDate: endBirthday,
			},
			dataType: "json",
			cache: false,
			async: true,
			success: function (data) {
				if (data.code == "200") {
					if(data.data.length>0){
						if(data.data[0].name!="" && data.data[0].name!=undefined){
							$("#warpeoplename").text(data.data[0].name);
						}
						if(data.data[0].carid!="" && data.data[0].carid!=undefined){
							$("#warcarid").text(data.data[0].carid);
						}
					}


				}
			}, error: function () {

			}
		})
	}

</script>
<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
	<div id="innerdiv" style="position:absolute;">
		<img id="bigimg" style="border:5px solid #fff;" src="" />
	</div>
</div>
</body>
</html>