<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
	<title>视频监控</title>
	<link rel="stylesheet"
		  href="${ctxStatic}/ccm/liveVideo/css/livedemo.css">
	<link rel="stylesheet"
		  href="${ctxStatic}/ccm/liveVideo/css/video-js.css">

</head>
<body>
<input type="hidden" value="${ccmDevice.ip}" id="ccmDeviceIp"/>
<input type="hidden" value="${ccmDevice.port}" id="ccmDevicePort"/>
<input type="hidden" value="${ccmDevice.account}" id="ccmDeviceAccount"/>
<input type="hidden" value="${ccmDevice.password}" id="ccmDevicePassword"/>
<!--摄像机类型  -->
<input type="hidden" value="${ccmDevice.typeVidicon}" id="ccmDeviceTypeVidicon"/>
<!-- 协议 -->
<input type="hidden" value="${ccmDevice.protocol}" id="ccmDeviceProtocol"/>
<!-- 设备参数信息-->
<input type="hidden" value='${ccmDevice.param}' id="ccmDeviceParaml"/>
<!-- 监控设备类型 -->
<input type="hidden" value="${ccmDevice.type}" id="ccmDeviceCameraType">


<div>
	<div id="divPlugin"  style="overflow: hidden;width:100%;height:100%;">
		<c:if test="${ccmDevice.typeVidicon == 1}">
			<OBJECT classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" id="vlc"     width="560" height="340" id="vlc" events="True">
				<param name='mrl' value='${ccmDevice.param}' />
				<param name='volume' value='50' />
				<param name='autoplay' value='true' />
				<param name="toolbar" value="true" />
				<param name='loop' value='true' />
				<param name='fullscreen' value='false' />
			</object>

		</c:if>
		<c:if test="${ccmDevice.typeVidicon == 2}">
			<div class="form" style="display: none">
				<label for="PalyType">PalyType:</label>
				<br />
				<input type="text" class="PalyType text" value="PlayReal" />
				<br />
				<label for="SvrIp">SvrIp:</label>
				<br />
				<input type="text" class="SvrIp text" value="" />
				<br />
				<label for="SvrPort">SvrPort:</label>
				<br />
				<input type="text" class="SvrPort text" value="443" />
				<br />
				<label for="appkey">appkey:</label>
				<br />
				<input type="text" class="appkey text" value="" />
				<br />
				<label for="appSecret">appSecret:</label>
				<br />
				<input type="text" class="appSecret text" />
				<br />
				<label for="time">time:</label>
				<br />
				<input type="text" class="time text" />
				<br />
				<label for="timeSecret">timeSecret:</label>
				<br />
				<input type="text" class="timeSecret text" />
				<br />
				<label for="httpsflag">httpsflag:</label>
				<br />
				<input type="text" class="httpsflag text" value="1" />
				<br />
				<label for="CamList">CamList:</label>
				<br />
				<input type="text" class="CamList text" value="" />
				<br />
				<input type="submit" class="playBtn" value="视频预览播放" />
			</div>
			<div class="video-position" style="width: 600px;height: auto; position: relative;padding: 14px 0 0 0; float: left">
				<p class="pop" style="display:block">加载中</p>
				<input type="hidden" name="config" id="config" value="ReqType:PlayReal;wndcount:1" />
				<!-- 添加预览控件（需要先在windows下注册） -->
				<object classid="CLSID:7E393848-7238-4CE3-82EE-44AF444B240A" id="PlayViewOCX" wmode="opaque" width="0" height="0" name="PlayViewOCX">
				</object>
			</div>
			<div id="vidioDiv" style="float: left; width: 250px;">

				<ul class="clearfix" style="width: 210px; margin: 0px auto;">
					<li onclick="PtzControl(11,1,1,100)" style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 45px;margin-top: 5px">
						<img src="${ctxStatic}/common/index/images/white_ZoomOut_hover.png" style="width:30px;height:30px;" title="放大">
					</li>
					<li onclick="PtzControl(12,1,1,100)" style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 18px;margin-top: 2px">
						<img src="${ctxStatic}/common/index/images/white_ZoomIn_hover.png" style="width:30px;height:30px;" title="缩小">
					</li>
				</ul>

				<ul class="clearfix" style="width: 210px; margin: 90px auto;">
					<li onmousedown="PtzControl(25,1,1,0)" onmouseup="PtzControl(25,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
						<img src="${ctxStatic}/common/index/images/left_up.png" style="width:50px;height:50px;" title="左上">
					</li>
					<li onmousedown="PtzControl(21,1,1,0)" onmouseup="PtzControl(21,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
						<img src="${ctxStatic}/common/index/images/up.png" style="width:50px;height:50px;" title="向上">
					</li>
					<li onmousedown="PtzControl(26,1,1,0)" onmouseup="PtzControl(26,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
						<img src="${ctxStatic}/common/index/images/right_up.png" style="width:50px;height:50px;" title="右上">
					</li>
					<li onmousedown="PtzControl(23,1,1,0)" onmouseup="PtzControl(23,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
						<img src="${ctxStatic}/common/index/images/left.png" style="width:50px;height:50px;" title="向左">
					</li>
					<li onmousedown="PtzControl(29,1,1,0)" onmouseup="PtzControl(29,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
						<img src="${ctxStatic}/common/index/images/auto.png" style="width:50px;height:50px;" title="自动">
					</li>
					<li onmousedown="PtzControl(24,1,1,0)" onmouseup="PtzControl(24,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
						<img src="${ctxStatic}/common/index/images/right.png" style="width:50px;height:50px;" title="向右">
					</li>
					<li onmousedown="PtzControl(27,1,1,0)" onmouseup="PtzControl(27,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
						<img src="${ctxStatic}/common/index/images/left_down.png" style="width:50px;height:50px;" title="左下">
					</li>
					<li onmousedown="PtzControl(22,1,1,0)" onmouseup="PtzControl(22,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
						<img src="${ctxStatic}/common/index/images/down.png" style="width:50px;height:50px;" title="向下">
					</li>
					<li onmousedown="PtzControl(28,1,1,0)" onmouseup="PtzControl(28,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
						<img src="${ctxStatic}/common/index/images/right_down.png" style="width:50px;height:50px;" title="右下">
					</li>
				</ul>
			</div>
			<div style="float: left; width: 250px;padding-top: 5%">
				<a href="http://localhost:8080/arjccm/exe/hikvision.exe" style="margin-left: 54%;color: #0bbbee;font-size: 14px">下载视频插件</a>
			</div>
		</c:if>
		<c:if test="${ccmDevice.typeVidicon == 3}">
			<div class="clearfix" style="overflow: hidden">
				<div class="video-position" style="width: 600px;height: auto; position: relative;padding: 14px 0 0 0; float: left">
					<p class="pop" style="display:block">视频加载中</p>
					<div id="objDss">
						<object id="DPSDK_OCX" classid="CLSID:D3E383B6-765D-448D-9476-DFD8B499926D"
								style="width: 100%; height: 80%"
								codebase="DpsdkOcx.cab#version=1.0.0.0">
						</object>
					</div>
				</div>
				<div id="vidioDiv3" style="float: left; width: 250px;">

					<ul class="clearfix" style="width: 210px; margin: 0px auto;">
						<li onmousedown="ButtonPtzCameraOperation_onclick(0)"onmouseup="ButtonPtzCameraOperation_onclickStop(1)" style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 45px;margin-top: 5px">
							<img src="${ctxStatic}/common/index/images/white_ZoomOut_hover.png" style="width:30px;height:30px;" title="放大">
						</li>
						<li onmousedown="ButtonPtzCameraOperation_onclick(3)"onmouseup="ButtonPtzCameraOperation_onclickStop(1)" style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 18px;margin-top: 2px">
							<img src="${ctxStatic}/common/index/images/white_ZoomIn_hover.png" style="width:30px;height:30px;" title="缩小">
						</li>
					</ul>

					<ul class="clearfix" style="width: 210px; margin: 90px auto;">
						<li onmousedown="ButtonPtzDirection_onclick(5)" onmouseup="ButtonPtzDirection_onclickStop(1)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/left_up.png" style="width:50px;height:50px;" title="左上">
						</li>
						<li onmousedown="ButtonPtzDirection_onclick(1)" onmouseup="ButtonPtzDirection_onclickStop(1)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/up.png" style="width:50px;height:50px;" title="向上">
						</li>
						<li onmousedown="ButtonPtzDirection_onclick(7)" onmouseup="ButtonPtzDirection_onclickStop(1)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/right_up.png" style="width:50px;height:50px;" title="右上">
						</li>
						<li onmousedown="ButtonPtzDirection_onclick(3)" onmouseup="ButtonPtzDirection_onclickStop(1)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/left.png" style="width:50px;height:50px;" title="向左">
						</li>
						<li onclick="ButtonPtzDirection_onclickStop(1)"  style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/auto.png" style="width:50px;height:50px;" title="停止">
						</li>
						<li onmousedown="ButtonPtzDirection_onclick(4)" onmouseup="ButtonPtzDirection_onclickStop(1)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/right.png" style="width:50px;height:50px;" title="向右">
						</li>
						<li onmousedown="ButtonPtzDirection_onclick(6)" onmouseup="ButtonPtzDirection_onclickStop(1)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/left_down.png" style="width:50px;height:50px;" title="左下">
						</li>
						<li onmousedown="ButtonPtzDirection_onclick(2)" onmouseup="ButtonPtzDirection_onclickStop(1)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/down.png" style="width:50px;height:50px;" title="向下">
						</li>
						<li onmousedown="ButtonPtzDirection_onclick(8)" onmouseup="ButtonPtzDirection_onclickStop(1)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/right_down.png" style="width:50px;height:50px;" title="右下">
						</li>
					</ul>
				</div>
				<div style="float: left; width: 250px;padding-top: 5%">
					<a href="http://localhost:8080/arjccm/exe/DPSDK_OCX_Win32andWin64.exe" style="margin-left: 54%;color: #0bbbee;font-size: 14px">下载视频插件</a>
				</div>
			</div>
		</c:if>
		<c:if test="${ccmDevice.typeVidicon == 4}">

			<div class="clearfix" style="overflow: hidden">

				<div class="video-position" style="width: 600px;height: auto; position: relative;padding: 14px 0 0 0; float: left">
					<p class="pop" style="display:block">加载中</p>
					<input type="hidden" name="config" id="config" value="ReqType:PlayReal;wndcount:1" />
					<!-- 添加预览控件（需要先在windows下注册） -->
					<object classid="clsid:02EFF2E9-3D57-461F-BDAC-7A598239E53C" id="PlayViewOCX" wmode="opaque" width="0" height="0" name="PlayViewOCX">
					</object>
				</div>


				<div id="vidioDiv" style="float: left; width: 250px;">

					<ul class="clearfix" style="width: 210px; margin: 0px auto;">
						<li onclick="PtzControl(11,1,1,100)" style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 45px;margin-top: 5px">
							<img src="${ctxStatic}/common/index/images/white_ZoomOut_hover.png" style="width:30px;height:30px;" title="放大">
						</li>
						<li onclick="PtzControl(12,1,1,100)" style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 18px;margin-top: 2px">
							<img src="${ctxStatic}/common/index/images/white_ZoomIn_hover.png" style="width:30px;height:30px;" title="缩小">
						</li>
					</ul>

					<ul class="clearfix" style="width: 210px; margin: 90px auto;">
						<li onmousedown="PtzControl(25,1,1,0)" onmouseup="PtzControl(25,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/left_up.png" style="width:50px;height:50px;" title="左上">
						</li>
						<li onmousedown="PtzControl(21,1,1,0)" onmouseup="PtzControl(21,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/up.png" style="width:50px;height:50px;" title="向上">
						</li>
						<li onmousedown="PtzControl(26,1,1,0)" onmouseup="PtzControl(26,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/right_up.png" style="width:50px;height:50px;" title="右上">
						</li>
						<li onmousedown="PtzControl(23,1,1,0)" onmouseup="PtzControl(23,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/left.png" style="width:50px;height:50px;" title="向左">
						</li>
						<li onmousedown="PtzControl(29,1,1,0)" onmouseup="PtzControl(29,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/auto.png" style="width:50px;height:50px;" title="自动">
						</li>
						<li onmousedown="PtzControl(24,1,1,0)" onmouseup="PtzControl(24,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/right.png" style="width:50px;height:50px;" title="向右">
						</li>
						<li onmousedown="PtzControl(27,1,1,0)" onmouseup="PtzControl(27,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/left_down.png" style="width:50px;height:50px;" title="左下">
						</li>
						<li onmousedown="PtzControl(22,1,1,0)" onmouseup="PtzControl(22,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/down.png" style="width:50px;height:50px;" title="向下">
						</li>
						<li onmousedown="PtzControl(28,1,1,0)" onmouseup="PtzControl(28,0,0,0)" style="float: left;width: 50px;height: 50px;padding: 9px">
							<img src="${ctxStatic}/common/index/images/right_down.png" style="width:50px;height:50px;" title="右下">
						</li>
					</ul>
				</div>
				<div style="float: left; width: 250px;padding-top: 5%">
					<a href="http://localhost:8080/arjccm/exe/Tiandy.EXE" style="margin-left: 54%;color: #0bbbee;font-size: 14px">下载视频插件</a>
				</div>
			</div>

		</c:if>

	</div>
</div>
<script src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<script src="${ctxStatic}/jquery-ui-1.12.1/jquery-ui.min.js"  type="text/javascript"></script>
<script>

	/* ***********************控制摄像头************************/

	//PTZ控制
	function PtzControl(cmd,param, start, power){

		if(cmd == 8 || cmd == 9 || cmd == 39){
			var paramInfo = "{\"cmd\":"+cmd+",\"param\":"+param+",\"start\":"+start+",\"power\":"+power+"}";
			var ret = document.getElementById("PlayViewOCX").PtzControl(paramInfo);
			var showInfo = " 调用PtzControl    返回信息: " + ret;
			showMessage(showInfo);
			if (ret != 0) {
				alert("PTZ控制失败！");
				return;
			}
		}
		else{
			var paramInfo = "{\"cmd\":"+cmd+",\"param\":"+param+",\"start\":"+start+",\"power\":"+power+"}";
			var ret = document.getElementById("PlayViewOCX").PtzControl(paramInfo);
			var showInfo = " 调用PtzControl    返回信息: " + ret;
			showMessage(showInfo);
			if (ret != 0) {
				alert("PTZ控制失败！");
				return;
			}
		}
	}

	/* ***********************大华控制摄像头************************/
	function ButtonPtzDirection_onclick(nDirects){
		var obj = document.getElementById("DPSDK_OCX");
		var szCameraId = $('#ccmDeviceParaml').val(); //通道ID
		nDirect = nDirects;
		var nStep = "1"; //步长
		var jz = obj.DPSDK_LoadDGroupInfo();
		if(jz===0){
			obj.DPSDK_PtzDirection(szCameraId, nDirect, nStep, 0);
		}
	}
	/* 大华控制摄像头停止*/
	function ButtonPtzDirection_onclickStop(bStop){
		var obj = document.getElementById("DPSDK_OCX");
		var szCameraId = $('#ccmDeviceParaml').val(); //通道ID
		var nStep = "1"; //步长
		obj.DPSDK_PtzDirection(szCameraId, nDirect, nStep, bStop);
	}
	/* 大华控制摄像头变倍*/
	function ButtonPtzCameraOperation_onclick(nOpers){
		debugger
		var obj = document.getElementById("DPSDK_OCX");
		var szCameraId = $('#ccmDeviceParaml').val(); //通道ID
		nOper = nOpers;
		var nStep = "1"; //倍速
		var abc=obj.DPSDK_PtzCameraOperation(szCameraId, nOper, nStep, 0);
	}
	/* 大华控制摄像头变倍停止*/
	function ButtonPtzCameraOperation_onclickStop(bStop)
	{
		var obj = document.getElementById("DPSDK_OCX");
		var szCameraId =  $('#ccmDeviceParaml').val(); //通道ID
		var nStep = "1"; //倍速
		obj.DPSDK_PtzCameraOperation(szCameraId, nOper, nStep, bStop);
	}

	$(function(){

		/*var layerSize = ['860px','400px']

        super.layerSize = layerSize;*/

		var ccmDeviceTypeVidicon=$('#ccmDeviceTypeVidicon').val()//摄像机类型
		var ccmDeviceIp=$('#ccmDeviceIp').val()//ip
		var ccmDevicePort=$('#ccmDevicePort').val()//端口
		var ccmDeviceAccount=$('#ccmDeviceAccount').val()//用户名
		var ccmDevicePassword=$('#ccmDevicePassword').val()//密码
		var ccmDeviceProtocol=$('#ccmDeviceProtocol').val()//协议
		var ccmDeviceParaml=$('#ccmDeviceParaml').val()//设备参数信息
		var ccmDeviceCameraType=$('#ccmDeviceCameraType').val()//监控设备类型  0枪机  1球机  2半球机


		if(ccmDeviceTypeVidicon==1){
			/* 	    var  mainOcxHtml = '	<video id="videoElement" class="video-js vjs-default-skin vjs-big-play-centered" controlspreload="auto" width="570" height="340"> </video>';
                    document.getElementById('divPlugin').innerHTML = mainOcxHtml;
                    LivePlayerInit();//初始化
                    videoPlay(ccmDeviceProtocol, ccmDeviceParaml) */
			/*var  mainOcxHtml='';
                    mainOcxHtml+='<OBJECT classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" id="vlc"   codebase="./axvlc.cab"    width="1140" height="640" id="vlc" events="True">';
                    mainOcxHtml+='<param name="mrl" value="'+ccmDeviceParaml+'" />';
                    mainOcxHtml+='<param name="volume" value="50" />'
                    mainOcxHtml+='<param name="autoplay" value="true" />'
                    mainOcxHtml+='<param name="toolbar" value="true" />'
                    mainOcxHtml+='<param name="loop" value="true" />'
                    mainOcxHtml+='<param name="fullscreen" value="false" />';
                    mainOcxHtml+='</object>';
                    document.getElementById('divPlugin').innerHTML = mainOcxHtml;*/
		}else if(ccmDeviceTypeVidicon==2){
			//*****************海康视频OCX播放方式**************//
			//延迟初始化
			$(document).ready(function () {
				setTimeout(function () {
					init();
				}, 50); //这里设置延迟是为了正确加载OCX(取决于电脑性能,具体数值请根据实际情况设定,通常不需要修改 直接调用init()是可行的)
				setTimeout(function () {
					$('#PlayViewOCX').css({
						'width': '100%',
						'height': '100%'
					});
					$('.pop').hide();
					var noCache = Date();
					$.getJSON('/arjccm/app/rest/video/callApiGetSecurity',{"noCache": noCache},function(data){
						var appKey=data.result.appKey;
						var SvrIp=data.result.svrIp;
						var SvrPort=data.result.svrPort;
						var appKeyEncrypt=JSON.parse(data.result.appKeyEncrypt);
						var appSecret=appKeyEncrypt.data.appSecret;
						var time=appKeyEncrypt.data.time;
						var timeSecret=appKeyEncrypt.data.timeSecret;

						$('.SvrIp').val(SvrIp);
						$('.SvrPort').val(SvrPort);
						$('.appkey').val(appKey);
						$('.appSecret').val(appSecret);
						$('.time').val(time);
						$('.timeSecret').val(timeSecret);
						$('.CamList').val("${ccmDevice.code}");
						setTimeout(function () {
							$('.playBtn').click();
						}, 1000);


					})
				}, 500);//这里设置延迟(数值请根据实际情况来)是防止快速刷新页面导致进程残留  具体清楚进程方式请参考<关闭进程 云台控制>demo中的代码
			});
			//初始化
			function init() {
				debugger
				var OCXobj = document.getElementById("PlayViewOCX");
				var txtInit = $("#config").val();
				OCXobj.ContainOCX_Init(txtInit);
			}
			//提交按钮
			$('.playBtn').on('click', function () {
				var PalyType = $('.PalyType').val();
				var SvrIp = $('.SvrIp').val();
				var SvrPort = $('.SvrPort').val();
				var appkey = $('.appkey').val();
				var appSecret = $('.appSecret').val();
				var time = $('.time').val();
				var timeSecret = $('.timeSecret').val();
				var httpsflag = $('.httpsflag').val();
				var CamList = $('.CamList').val();
				var param = 'ReqType:' + PalyType + ';' + 'SvrIp:' + SvrIp + ';'+'WndCount: 1'+';' + 'SvrPort:' + SvrPort + ';' + 'Appkey:' + appkey + ';' + 'AppSecret:' + appSecret + ';' + 'time:' + time + ';' + 'timesecret:' + timeSecret + ';' + 'httpsflag:' + httpsflag + ';' + 'CamList:' + CamList + ';';
				//如果初始化传了WndCount值 这里也需要传 如demo中设置了WndCount:1  这里也要传WndCount:1  如果使用默认四窗口则可以不传

				play_ocx_do(param);

			});

			////OCX控件视频处理函数
			function play_ocx_do(param) {
				if ("null" == param || "" == param || null == param || "undefined" == typeof param) {
					return;
				} else {
					var OCXobj = document.getElementById("PlayViewOCX");
					OCXobj.ContainOCX_Do(param);
				}
			}

			// 关闭浏览器
			$(window).unload(function () {

				var param = 'hikvideoclient://VersionTag:artemis;Exit:1;';
				play_ocx_do(param);
			});

		}else if(ccmDeviceTypeVidicon==3){
			//*****************大华视频 start**************//
			var gWndId = 0;
			var bIVS = 1;
			//延迟初始化
			$(document).ready(function () {
				setTimeout(function () {
					init();
				}, 50); //这里设置延迟是为了正确加载OCX(取决于电脑性能,具体数值请根据实际情况设定,通常不需要修改 直接调用init()是可行的)
				setTimeout(function () {
					$('#DPSDK_OCX').css({
						'width': '100%',
						'height': '100%'
					});
					$('.pop').hide();
					var noCache = Date();
					$.getJSON('/arjccm/app/rest/video/getDssConfig',{"noCache": noCache},function(data){
						//登录
						var dssIP = data.result.dssIP;
						var dssPort = data.result.dssPort;
						var dssUserName = data.result.dssUserName;
						var dssPassword = data.result.dssPassword;
						var obj = document.getElementById("DPSDK_OCX");
						var nRet = obj.DPSDK_Login(dssIP, dssPort, dssUserName, dssPassword);
						if (nRet==0){
							obj.DPSDK_LoadDGroupInfo();
							startVideo();
						}
					});//这里设置延迟(数值请根据实际情况来)是防止快速刷新页面导致进程残留  具体清楚进程方式请参考<关闭进程 云台控制>demo中的代码
				},500);
				//初始化
				function init(){
					try
					{
						var ActiveXobj = new ActiveXObject("DPSDK_OCX.DPSDK_OCXCtrl.1");
					}
					catch(e)
					{
						alert("控件未注册，请下载并安装视频插件，并在IE11浏览器下使用！");
						return;
					}
					var obj = document.getElementById("DPSDK_OCX");
					gWndId = obj.DPSDK_CreateSmartWnd(0, 0, 100, 100);
					ButtonCreateWnd_onclick();
					ButtonSetCustomizedWndCount_onclick();
					obj.DPSDK_SetToolBtnVisible(1,false);// 1 audio 2 talk 3 localRecord 4 cappicture 5 close video
					obj.DPSDK_SetToolBtnVisible(7,false);
					obj.DPSDK_SetToolBtnVisible(9,false);
					obj.DPSDK_SetControlButtonShowMode(1, 0);
					obj.DPSDK_SetControlButtonShowMode(2, 0);
					obj.DPSDK_SetSelWnd(gWndId, 0);
				}
				//播放视频
				function startVideo() {
					var obj = document.getElementById("DPSDK_OCX");
					var szCameraId = ccmDeviceParaml; //通道ID
					var nStreamType = "1"; //主码流
					var nMediaType = "1"; //value="1">视频  value="2">音频  value="3">视频+音频s
					var nTransType = "1"; // value="1">TCP  value="0">UDP
					var nWndNo = obj.DPSDK_GetSelWnd(gWndId);
					obj.DPSDK_StartRealplayByWndNo(gWndId, nWndNo, szCameraId, nStreamType, nMediaType, nTransType);
				}
				function ButtonCreateWnd_onclick() {
					var obj = document.getElementById("DPSDK_OCX");
					var nWndCount = 1;
					obj.DPSDK_SetWndCount(gWndId, nWndCount);
					obj.DPSDK_SetSelWnd(gWndId, 0);
				}
				function ButtonSetCustomizedWndCount_onclick() {
					var obj = document.getElementById("DPSDK_OCX");
					var nWndCount = 1;
					obj.DPSDK_SetCustomizedWndCount(gWndId, nWndCount);
					obj.DPSDK_SetSelWnd(gWndId, 0);
				}
				//*****************大华视频 end**************//
			})}

		else if(ccmDeviceTypeVidicon==4){
			$(document).ready(function () {
				setTimeout(function () {
					init();
				}, 50);
				setTimeout(function () {
					$('#PlayViewOCX').css({
						'width': '100%',
						'height': '100%'
					});
					$('.pop').hide();
					startVideo();
				}, 500);
			});
			function init() {
				var info = {};
				info.OcxType = 0;
				info.buttons =  [0, 1, 2, 3, 4];//需要加载的按钮
				info.menus = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];//需要加载的右键菜单
				info.diskplaninfo = {};
				info.otherinfo = {};
				info.authority = 1;
				var OCXobj = document.getElementById("PlayViewOCX");
				OCXobj.init(JSON.stringify(info));
			}
			function startVideo(){
				var ret = document.getElementById("PlayViewOCX").StartVideo(ccmDeviceParaml);
			}
		}
	})

</script>
</body>
</html>