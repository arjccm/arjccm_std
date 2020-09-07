<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"/>
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
<input type="hidden" value="${ccmDevice.code}" id="ccmDeviceCode">

<div>
    <div id="divPlugin" style="">
        <c:if test="${ccmDevice.typeVidicon == 1}">
        <OBJECT classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" id="vlc"     width="560" height="340" id="vlc"
                events="True">
            <param name='mrl' value='${ccmDevice.param}'/>
            <param name='volume' value='50'/>
            <param name='autoplay' value='true'/>
            <param name="toolbar" value="true"/>
            <param name='loop' value='true'/>
            <param name='fullscreen' value='false'/>
        </object>

    </c:if>
        <c:if test="${ccmDevice.typeVidicon == 2}">
            <div class="form" style="display: none">
                <label for="PalyType">PalyType:</label>
                <br/>
                <input type="text" class="PalyType text" value="PlayReal"/>
                <br/>
                <label for="SvrIp">SvrIp:</label>
                <br/>
                <input type="text" class="SvrIp text" value=""/>
                <br/>
                <label for="SvrPort">SvrPort:</label>
                <br/>
                <input type="text" class="SvrPort text" value="443"/>
                <br/>
                <label for="appkey">appkey:</label>
                <br/>
                <input type="text" class="appkey text" value=""/>
                <br/>
                <label for="code">code:</label>
                <br/>
                <input type="text" class="code text" value=""/>
                <br/>
                <label for="appSecret">appSecret:</label>
                <br/>
                <input type="text" class="appSecret text"/>
                <br/>
                <label for="time">time:</label>
                <br/>
                <input type="text" class="time text"/>
                <br/>
                <label for="timeSecret">timeSecret:</label>
                <br/>
                <input type="text" class="timeSecret text"/>
                <br/>
                <label for="httpsflag">httpsflag:</label>
                <br/>
                <input type="text" class="httpsflag text" value="1"/>
                <br/>
                <label for="CamList">CamList:</label>
                <br/>
                <input type="text" class="CamList text" value=""/>
                <br/>
                <input type="submit" class="playBtn" value="视频预览播放"/>
            </div>
            <div class="video-position"
                 style="width: 600px;height: auto; position: relative;padding: 14px 0 0 0; float: left">
                <p class="pop" style="display:block">加载中</p>
                <input type="hidden" name="config" id="config" value="ReqType:PlayReal;wndcount:1"/>
                <!-- 添加预览控件（需要先在windows下注册） -->
                <object classid="CLSID:7E393848-7238-4CE3-82EE-44AF444B240A" id="PlayViewOCX" wmode="opaque" width="0"
                        height="0" name="PlayViewOCX">
                </object>
            </div>
            <div style="float: left; width: 250px;">
                <div id="vidioDiv">

                    <ul class="clearfix" style="width: 210px; margin: 0px auto;">
                        <li onclick="PtzControl(11,1,1,100)"
                            style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 45px;margin-top: 5px">
                            <img src="${ctxStatic}/common/index/images/white_ZoomOut_hover.png"
                                 style="width:30px;height:30px;" title="放大">
                        </li>
                        <li onclick="PtzControl(12,1,1,100)"
                            style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 18px;margin-top: 2px">
                            <img src="${ctxStatic}/common/index/images/white_ZoomIn_hover.png"
                                 style="width:30px;height:30px;" title="缩小">
                        </li>
                    </ul>

                    <ul class="clearfix" style="width: 210px; margin: 20px auto;">
                        <li onmousedown="PtzControl(25,1,1,0)" onmouseup="PtzControl(25,0,0,0)"
                            style="float: left;width: 50px;height: 50px;padding: 9px">
                            <img src="${ctxStatic}/common/index/images/left_up.png" style="width:50px;height:50px;"
                                 title="左上">
                        </li>
                        <li onmousedown="PtzControl(21,1,1,0)" onmouseup="PtzControl(21,0,0,0)"
                            style="float: left;width: 50px;height: 50px;padding: 9px">
                            <img src="${ctxStatic}/common/index/images/up.png" style="width:50px;height:50px;"
                                 title="向上">
                        </li>
                        <li onmousedown="PtzControl(26,1,1,0)" onmouseup="PtzControl(26,0,0,0)"
                            style="float: left;width: 50px;height: 50px;padding: 9px">
                            <img src="${ctxStatic}/common/index/images/right_up.png" style="width:50px;height:50px;"
                                 title="右上">
                        </li>
                        <li onmousedown="PtzControl(23,1,1,0)" onmouseup="PtzControl(23,0,0,0)"
                            style="float: left;width: 50px;height: 50px;padding: 9px">
                            <img src="${ctxStatic}/common/index/images/left.png" style="width:50px;height:50px;"
                                 title="向左">
                        </li>
                        <li onmousedown="PtzControl(29,1,1,0)" onmouseup="PtzControl(29,0,0,0)"
                            style="float: left;width: 50px;height: 50px;padding: 9px">
                            <img src="${ctxStatic}/common/index/images/auto.png" style="width:50px;height:50px;"
                                 title="自动">
                        </li>
                        <li onmousedown="PtzControl(24,1,1,0)" onmouseup="PtzControl(24,0,0,0)"
                            style="float: left;width: 50px;height: 50px;padding: 9px">
                            <img src="${ctxStatic}/common/index/images/right.png" style="width:50px;height:50px;"
                                 title="向右">
                        </li>
                        <li onmousedown="PtzControl(27,1,1,0)" onmouseup="PtzControl(27,0,0,0)"
                            style="float: left;width: 50px;height: 50px;padding: 9px">
                            <img src="${ctxStatic}/common/index/images/left_down.png" style="width:50px;height:50px;"
                                 title="左下">
                        </li>
                        <li onmousedown="PtzControl(22,1,1,0)" onmouseup="PtzControl(22,0,0,0)"
                            style="float: left;width: 50px;height: 50px;padding: 9px">
                            <img src="${ctxStatic}/common/index/images/down.png" style="width:50px;height:50px;"
                                 title="向下">
                        </li>
                        <li onmousedown="PtzControl(28,1,1,0)" onmouseup="PtzControl(28,0,0,0)"
                            style="float: left;width: 50px;height: 50px;padding: 9px">
                            <img src="${ctxStatic}/common/index/images/right_down.png" style="width:50px;height:50px;"
                                 title="右下">
                        </li>
                    </ul>
                </div>
                <div style="float: left; width: 250px;padding-top: 15%">

                    <a href="http://localhost:8080/arjccm/exe/hikvision.exe"
                       style="margin-left: 54%;color: #0bbbee;font-size: 14px">下载视频插件</a>
                </div>
            </div>
        </c:if>
        <c:if test="${ccmDevice.typeVidicon == 3}">
            <div class="clearfix" style="overflow: hidden">
                <div class="video-position"
                     style="width: 600px;height: auto; position: relative;padding: 14px 0 0 0; float: left">
                    <p class="pop" style="display:block">视频加载中</p>
                    <div id="objDss">
                        <object id="DPSDK_OCX" classid="CLSID:D3E383B6-765D-448D-9476-DFD8B499926D"
                                style="width: 100%; height: 80%"
                                codebase="DpsdkOcx.cab#version=1.0.0.0">
                        </object>
                    </div>
                </div>
                <div style="float: left; width: 250px;">
                    <div id="vidioDiv3" style="float: left; width: 250px;">

                        <ul class="clearfix" style="width: 210px; margin: 0px auto;">
                            <li onmousedown="ButtonPtzCameraOperation_onclick(0)"
                                onmouseup="ButtonPtzCameraOperation_onclickStop(1)"
                                style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 45px;margin-top: 5px">
                                <img src="${ctxStatic}/common/index/images/white_ZoomOut_hover.png"
                                     style="width:30px;height:30px;" title="放大">
                            </li>
                            <li onmousedown="ButtonPtzCameraOperation_onclick(3)"
                                onmouseup="ButtonPtzCameraOperation_onclickStop(1)"
                                style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 18px;margin-top: 2px">
                                <img src="${ctxStatic}/common/index/images/white_ZoomIn_hover.png"
                                     style="width:30px;height:30px;" title="缩小">
                            </li>
                        </ul>

                        <ul class="clearfix" style="width: 210px; margin: 20px auto;">
                            <li onmousedown="ButtonPtzDirection_onclick(5)"
                                onmouseup="ButtonPtzDirection_onclickStop(1)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/left_up.png" style="width:50px;height:50px;"
                                     title="左上">
                            </li>
                            <li onmousedown="ButtonPtzDirection_onclick(1)"
                                onmouseup="ButtonPtzDirection_onclickStop(1)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/up.png" style="width:50px;height:50px;"
                                     title="向上">
                            </li>
                            <li onmousedown="ButtonPtzDirection_onclick(7)"
                                onmouseup="ButtonPtzDirection_onclickStop(1)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/right_up.png" style="width:50px;height:50px;"
                                     title="右上">
                            </li>
                            <li onmousedown="ButtonPtzDirection_onclick(3)"
                                onmouseup="ButtonPtzDirection_onclickStop(1)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/left.png" style="width:50px;height:50px;"
                                     title="向左">
                            </li>
                            <li onclick="ButtonPtzDirection_onclickStop(1)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/auto.png" style="width:50px;height:50px;"
                                     title="停止">
                            </li>
                            <li onmousedown="ButtonPtzDirection_onclick(4)"
                                onmouseup="ButtonPtzDirection_onclickStop(1)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/right.png" style="width:50px;height:50px;"
                                     title="向右">
                            </li>
                            <li onmousedown="ButtonPtzDirection_onclick(6)"
                                onmouseup="ButtonPtzDirection_onclickStop(1)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/left_down.png"
                                     style="width:50px;height:50px;" title="左下">
                            </li>
                            <li onmousedown="ButtonPtzDirection_onclick(2)"
                                onmouseup="ButtonPtzDirection_onclickStop(1)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/down.png" style="width:50px;height:50px;"
                                     title="向下">
                            </li>
                            <li onmousedown="ButtonPtzDirection_onclick(8)"
                                onmouseup="ButtonPtzDirection_onclickStop(1)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/right_down.png"
                                     style="width:50px;height:50px;" title="右下">
                            </li>
                        </ul>
                    </div>
                    <div style="float: left; width: 250px;padding-top: 15%">
                        <a href="http://localhost:8080/arjccm/exe/DPSDK_OCX_Win32andWin64.exe"
                           style="margin-left: 54%;color: #0bbbee;font-size: 14px">下载视频插件</a>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${ccmDevice.typeVidicon == 4}">

            <div class="clearfix" style="overflow: hidden">

                <div class="video-position"
                     style="width: 600px;height: auto; position: relative;padding: 14px 0 0 0; float: left">
                    <p class="pop" style="display:block">加载中</p>
                    <input type="hidden" name="config" id="config" value="ReqType:PlayReal;wndcount:1"/>
                    <!-- 添加预览控件（需要先在windows下注册） -->
                        <%--<object classid="clsid:02EFF2E9-3D57-461F-BDAC-7A598239E53C" id="PlayViewOCX" wmode="opaque"
                                width="0" height="0" name="PlayViewOCX">
                        </object>--%>
                </div>
                <div style="float: left; width: 250px;">
                    <div id="vidioDiv4" style="float: left; width: 250px;">

                        <ul class="clearfix" style="width: 210px; margin: 0px auto;">
                            <li onclick="PtzControl(11,1,1,100)"
                                style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 45px;margin-top: 5px">
                                <img src="${ctxStatic}/common/index/images/white_ZoomOut_hover.png"
                                     style="width:30px;height:30px;" title="放大">
                            </li>
                            <li onclick="PtzControl(12,1,1,100)"
                                style="float:left ;width: 30px;height: 30px;padding: 10px;margin-left: 18px;margin-top: 2px">
                                <img src="${ctxStatic}/common/index/images/white_ZoomIn_hover.png"
                                     style="width:30px;height:30px;" title="缩小">
                            </li>
                        </ul>

                        <ul class="clearfix" style="width: 210px; margin: 20px auto;">
                            <li onmousedown="PtzControl(25,1,1,0)" onmouseup="PtzControl(25,0,0,0)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/left_up.png" style="width:50px;height:50px;"
                                     title="左上">
                            </li>
                            <li onmousedown="PtzControl(21,1,1,0)" onmouseup="PtzControl(21,0,0,0)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/up.png" style="width:50px;height:50px;"
                                     title="向上">
                            </li>
                            <li onmousedown="PtzControl(26,1,1,0)" onmouseup="PtzControl(26,0,0,0)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/right_up.png" style="width:50px;height:50px;"
                                     title="右上">
                            </li>
                            <li onmousedown="PtzControl(23,1,1,0)" onmouseup="PtzControl(23,0,0,0)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/left.png" style="width:50px;height:50px;"
                                     title="向左">
                            </li>
                            <li onmousedown="PtzControl(29,1,1,0)" onmouseup="PtzControl(29,0,0,0)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/auto.png" style="width:50px;height:50px;"
                                     title="自动">
                            </li>
                            <li onmousedown="PtzControl(24,1,1,0)" onmouseup="PtzControl(24,0,0,0)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/right.png" style="width:50px;height:50px;"
                                     title="向右">
                            </li>
                            <li onmousedown="PtzControl(27,1,1,0)" onmouseup="PtzControl(27,0,0,0)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/left_down.png"
                                     style="width:50px;height:50px;" title="左下">
                            </li>
                            <li onmousedown="PtzControl(22,1,1,0)" onmouseup="PtzControl(22,0,0,0)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/down.png" style="width:50px;height:50px;"
                                     title="向下">
                            </li>
                            <li onmousedown="PtzControl(28,1,1,0)" onmouseup="PtzControl(28,0,0,0)"
                                style="float: left;width: 50px;height: 50px;padding: 9px">
                                <img src="${ctxStatic}/common/index/images/right_down.png"
                                     style="width:50px;height:50px;" title="右下">
                            </li>
                        </ul>
                    </div>
                    <div style="float: left; width: 250px;padding-top: 15%">
                        <a href="http://localhost:8080/arjccm/exe/Tiandy.EXE"
                           style="margin-left: 54%;color: #0bbbee;font-size: 14px">下载视频插件</a>
                    </div>
                </div>
            </div>

        </c:if>
    </div>
</div>
    <script src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
    <script src="${ctxStatic}/jquery-ui-1.12.1/jquery-ui.min.js" type="text/javascript"></script>

    <script src="${ctxStatic}/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/jquery/jsencrypt.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/jquery/jsWebControl-1.0.0.min.js" type="text/javascript"></script>
    <script>

        /* ***********************海康新播放方式************************/
        var oWebControl = null;// 插件对象
        //声明公用变量
        var initCount = 0;
        var pubKey = '';
        var hikvisonVideoType=""; // 海康接入方式

        /* ***********************控制摄像头************************/
        //PTZ控制
        function PtzControl(cmd, param, start, power) {

            if (cmd == 8 || cmd == 9 || cmd == 39) {
                var paramInfo = "{\"cmd\":" + cmd + ",\"param\":" + param + ",\"start\":" + start + ",\"power\":" + power + "}";
                var ret = document.getElementById("PlayViewOCX").PtzControl(paramInfo);
                var showInfo = " 调用PtzControl    返回信息: " + ret;
                showMessage(showInfo);
                if (ret != 0) {
                    alert("PTZ控制失败！");
                    return;
                }
            } else {
                var paramInfo = "{\"cmd\":" + cmd + ",\"param\":" + param + ",\"start\":" + start + ",\"power\":" + power + "}";
                var ret = document.getElementById("PlayViewOCX").PtzControl(paramInfo);
                var showInfo = " 调用PtzControl    返回信息: " + ret;
                showMessage(showInfo);
                if (ret != 0) {
                    alert("PTZ控制失败！");
                    return;
                }
            }
        }

        /* ***********************大华控制摄像头start************************/
        function ButtonPtzDirection_onclick(nDirects) {
            var obj = document.getElementById("DPSDK_OCX");
            var szCameraId = $('#ccmDeviceParaml').val(); //通道ID
            nDirect = nDirects;
            var nStep = "1"; //步长
            var jz = obj.DPSDK_LoadDGroupInfo();
            if (jz === 0) {
                obj.DPSDK_PtzDirection(szCameraId, nDirect, nStep, 0);
            }
        }
        /* 大华控制摄像头停止*/
        function ButtonPtzDirection_onclickStop(bStop) {
            var obj = document.getElementById("DPSDK_OCX");
            var szCameraId = $('#ccmDeviceParaml').val(); //通道ID
            var nStep = "1"; //步长
            obj.DPSDK_PtzDirection(szCameraId, nDirect, nStep, bStop);
        }
        /* 大华控制摄像头变倍*/
        function ButtonPtzCameraOperation_onclick(nOpers) {
            var obj = document.getElementById("DPSDK_OCX");
            var szCameraId = $('#ccmDeviceParaml').val(); //通道ID
            nOper = nOpers;
            var nStep = "1"; //倍速
            var abc = obj.DPSDK_PtzCameraOperation(szCameraId, nOper, nStep, 0);
        }
        /* 大华控制摄像头变倍停止*/
        function ButtonPtzCameraOperation_onclickStop(bStop) {
            var obj = document.getElementById("DPSDK_OCX");
            var szCameraId = $('#ccmDeviceParaml').val(); //通道ID
            var nStep = "1"; //倍速
            obj.DPSDK_PtzCameraOperation(szCameraId, nOper, nStep, bStop);
        }
        /* ***********************大华控制摄像头end************************/

        $(function () {
            var noCache = Date();
            $.ajaxSettings.async = false;
            $.getJSON('/arjccm/app/rest/video/callApiGetSecurity', {"noCache": noCache}, function (data) {
                hikvisonVideoType = data.result.hikvisonVideoType;
            });

            var ccmDeviceTypeVidicon = $('#ccmDeviceTypeVidicon').val()//摄像机类型
            var ccmDeviceIp = $('#ccmDeviceIp').val()//ip
            var ccmDevicePort = $('#ccmDevicePort').val()//端口
            var ccmDeviceAccount = $('#ccmDeviceAccount').val()//用户名
            var ccmDevicePassword = $('#ccmDevicePassword').val()//密码
            var ccmDeviceProtocol = $('#ccmDeviceProtocol').val()//协议
            var ccmDeviceParaml = $('#ccmDeviceParaml').val()//设备参数信息
            var ccmDeviceCameraType = $('#ccmDeviceCameraType').val()//监控设备类型  0枪机  1球机  2半球机

            if (ccmDeviceTypeVidicon == 1) {
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
            } else if (ccmDeviceTypeVidicon == 2 && hikvisonVideoType == 1){
                /* ***********************海康新播放方式start************************/
                //延迟初始化
                $(document).ready(function () {
                    setTimeout(function () {
                        initPlugin();
                    }, 50);
                //初始化插件
                function initPlugin () {
                    oWebControl = new WebControl({
                        szPluginContainer: "divPlugin",                       // 指定容器id
                        iServicePortStart: 15900,
                        iServicePortEnd: 15909,
                        szClassId:"23BF3B0A-2C56-4D97-9C03-0CB103AA8F11",   // 用于IE10使用ActiveX的clsid
                        cbConnectSuccess: function () {                     // 创建WebControl实例成功
                            setCallbacks();
                            oWebControl.JS_StartService("window", {         // WebControl实例创建成功后需要启动服务
                                dllPath: "./VideoPluginConnect.dll"         // 值"./VideoPluginConnect.dll"写死
                            }).then(function () {                           // 启动插件服务成功
                                oWebControl.JS_CreateWnd("divPlugin", 800, 400).then(function () { //JS_CreateWnd创建视频播放窗口，宽高可设定
                                    setTimeout(function () {
                                        init();
                                    }, 1000);

                                });
                            }, function () { // 启动插件服务失败
                            });
                        },
                        cbConnectError: function () { // 创建WebControl实例失败
                            oWebControl = null;
                            $("#divPlugin").html("插件未启动，正在尝试启动，请稍候...");
                            WebControl.JS_WakeUp("VideoWebPlugin://"); // 程序未启动时执行error函数，采用wakeup来启动程序
                            initCount++;
                            if (initCount < 3) {
                                setTimeout(function () {
                                    initPlugin();
                                }, 3000)
                            } else {
                                $("#divPlugin").html("插件启动失败，请检查插件是否安装！");
                            }
                        },
                        cbConnectClose: function (bNormalClose) {
                            // 异常断开：bNormalClose = false
                            // JS_Disconnect正常断开：bNormalClose = true
                            console.log(bNormalClose);
                            console.log("cbConnectClose", bNormalClose);
                            oWebControl = null;
                        }
                    });
                }
                //初始化
                function init(){
                    var noCache = Date();
                    $.getJSON('/arjccm/app/rest/video/callApiGetSecurity', {"noCache": noCache}, function (data) {
                        console.log("data: " ,data.result);
                        var appkey = data.result.appKey;       //综合安防管理平台提供的appkey，必填
                        var secret = data.result.appSecret;   //综合安防管理平台提供的secret，必填
                        var ip = data.result.svrIp;
                        var SvrPort = data.result.svrPort;

                        getPubKey(function () {
                            var appkey = "24120141";
                            var secret =setEncrypt("fTpQnsTz7WvUHhkwMSZY");
                            var ip = "52.125.72.200";
                            var SvrPort =443;

                            var snapDir = "D:\\VideoDir";
                            var videoDir = "D:\\VideoDir";
                            var layout = "1x1"; //布局
                            var encryptedFields = ['secret'];  //加密字段
                            var enableHttps = "启用";  //启用HTTPS协议
                            var szShowToolbar = "1";  //显示工具栏 0:隐藏  1:显示
                            var szShowSmart = "0"; //显示智能信息 0:隐藏  1:显示
                            var btIds = "1,0,16,256,257,258,259,260,512,513,514,515,516,517,768,769"; //工具条按钮ID集
                            var rectTimes = "5";  //重连次数
                            var rectDuration = "5"; //重连间隔
                            var language = "zh_CN";
                            //var asd = setEncrypt("fTpQnsTz7WvUHhkwMSZY").replace(/(^\s*)/g, "").replace(/(\s*$)/g, "");
                            appkey.replace(/(^\s*)/g, "").replace(/(\s*$)/g, "");
                            secret.replace(/(^\s*)/g, "").replace(/(\s*$)/g, "");
                            console.info(secret)
                            oWebControl.JS_RequestInterface({
                                funcName: "init",
                                argument: JSON.stringify({
                                    appkey: appkey,
                                    secret: secret,
                                    ip:"52.125.72.200",
                                    playMode: 0, // 预览
                                    port: 443,
                                    snapDir: snapDir,
                                    videoDir: videoDir,
                                    layout: layout,
                                    enableHTTPS: 1,
                                    showToolbar: 1,
                                    showSmart: 1,
                                    buttonIDs: btIds,
                                    encryptedFields: "secret",
                                    language: language,
                                    reconnectTimes: 0,
                                    reconnectDuration: 0
                                })
                            }).then(function (oData) {
                                //UpdatePlayTypeValue();
                                oWebControl.JS_Resize(800, 400);  // 初始化后resize一次，规避firefox下首次显示窗口后插件窗口未与DIV窗口重合问题
                            });
                            setTimeout(function () {
                                prev(); //视频预览
                            }, 1000);
                        })
                    });

                };
                // 获取公钥
                function getPubKey (callback) {
                    oWebControl.JS_RequestInterface({
                        funcName: "getRSAPubKey",
                        argument: JSON.stringify({
                            keyLength: 1024
                        })
                    }).then(function (oData) {
                        console.log("oDataoData",oData)
                        if (oData.responseMsg.data) {
                            pubKey = oData.responseMsg.data;
                            callback()
                        }
                    })
                }
                // 设置窗口控制回调
                function setCallbacks() {
                    oWebControl.JS_SetWindowControlCallback({
                        cbIntegrationCallBack: cbIntegrationCallBack
                    });
                }
                // 推送消息
                function cbIntegrationCallBack(oData) {
                 // showCBInfo(JSON.stringify(oData.responseMsg));
                }
                //RSA加密
                function setEncrypt (value) {
                    var encrypt = new JSEncrypt();
                    encrypt.setPublicKey(pubKey);
                    return encrypt.encrypt(value);
                }
                //视频预览功能
                function prev() {
                    //var cameraIndexCode  = "de1426c7bac04f33a36b75835dc33e74";
                    var cameraIndexCode  =$('#ccmDeviceCode').val();
                    var streamMode = +"0"; // 0 主码流
                    var transMode = +"1";  // 1 TCP
                    var gpuMode = +"0";  //是否启用GPU硬解 0:不启用
                    var wndId = -1;  //默认为空闲窗口预览
                    var isDirectEzviz = +"0";  //是否直连萤石预览 0:不启用

                    oWebControl.JS_RequestInterface({
                        funcName: "startPreview",
                        argument: JSON.stringify({
                            cameraIndexCode : cameraIndexCode ,
                            streamMode: streamMode,
                            transMode: transMode,
                            gpuMode: gpuMode,
                            wndId: wndId,
                            ezvizDirect: isDirectEzviz
                        })
                    }).then(function (oData) {
                        //showCBInfo(JSON.stringify(oData ? oData.responseMsg : ''));

                    });
                    console.info("K");
                }
                // 窗口resize
                $(window).resize(function () {
                    if (oWebControl != null) {
                        oWebControl.JS_Resize(800, 400);
                        setWndCover();
                    }
                });
                // 滚动条scroll
                $(window).scroll(function () {
                    if (oWebControl != null) {
                        oWebControl.JS_Resize(800, 400);
                        setWndCover();
                    }
                });
                // 标签关闭
                $(window).unload(function () {
                    if (oWebControl != null){
                        oWebControl.JS_HideWnd();   // 先让窗口隐藏，规避可能的插件窗口滞后于浏览器消失问题
                        oWebControl.JS_Disconnect().then(function(){  // 断开与插件服务连接成功
                            },
                            function() {  // 断开与插件服务连接失败
                            });
                    }
                });
                // 设置窗口裁剪，当因滚动条滚动导致窗口需要被遮住的情况下需要JS_CuttingPartWindow部分窗口
                function setWndCover() {
                    var iWidth = $(window).width();
                    var iHeight = $(window).height();
                    var oDivRect = $("#divPlugin").get(0).getBoundingClientRect();
                    var iCoverLeft = (oDivRect.left < 0) ? Math.abs(oDivRect.left): 0;
                    var iCoverTop = (oDivRect.top < 0) ? Math.abs(oDivRect.top): 0;
                    var iCoverRight = (oDivRect.right - iWidth > 0) ? Math.round(oDivRect.right - iWidth) : 0;
                    var iCoverBottom = (oDivRect.bottom - iHeight > 0) ? Math.round(oDivRect.bottom - iHeight) : 0;

                    iCoverLeft = (iCoverLeft > 800) ? 800 : iCoverLeft;
                    iCoverTop = (iCoverTop > 400) ? 400 : iCoverTop;
                    iCoverRight = (iCoverRight > 800) ? 800 : iCoverRight;
                    iCoverBottom = (iCoverBottom > 400) ? 400 : iCoverBottom;

                    oWebControl.JS_RepairPartWindow(0, 0, 800, 400);  // 多1个像素点防止还原后边界缺失一个像素条
                    if (iCoverLeft != 0) {
                        oWebControl.JS_CuttingPartWindow(0, 0, iCoverLeft, 400);
                    }
                    if (iCoverTop != 0) {
                        oWebControl.JS_CuttingPartWindow(0, 0, 800, iCoverTop);  // 多剪掉一个像素条，防止出现剪掉一部分窗口后出现一个像素条
                    }
                    if (iCoverRight != 0) {
                        oWebControl.JS_CuttingPartWindow(800 - iCoverRight, 0, iCoverRight, 400);
                    }
                    if (iCoverBottom != 0) {
                        oWebControl.JS_CuttingPartWindow(0, 400 - iCoverBottom, 800, iCoverBottom);
                    }
                }
                })
                /* ************************海康新播放方式end**************************/

                /* ***********************海康OCX播放方式start************************/
            }else if(ccmDeviceTypeVidicon==2 && hikvisonVideoType == 0){
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
            }else if (ccmDeviceTypeVidicon == 3) {
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
                        $.getJSON('/arjccm/app/rest/video/getDssConfig', {"noCache": noCache}, function (data) {
                            //登录
                            var dssIP = data.result.dssIP;
                            var dssPort = data.result.dssPort;
                            var dssUserName = data.result.dssUserName;
                            var dssPassword = data.result.dssPassword;
                            var obj = document.getElementById("DPSDK_OCX");
                            var nRet = obj.DPSDK_Login(dssIP, dssPort, dssUserName, dssPassword);
                            if (nRet == 0) {
                                obj.DPSDK_LoadDGroupInfo();
                                startVideo();
                            }
                        });//这里设置延迟(数值请根据实际情况来)是防止快速刷新页面导致进程残留  具体清楚进程方式请参考<关闭进程 云台控制>demo中的代码
                    }, 500);
                    //初始化
                    function init() {
                        try {
                            var ActiveXobj = new ActiveXObject("DPSDK_OCX.DPSDK_OCXCtrl.1");
                        } catch (e) {
                            alert("控件未注册，请下载并安装视频插件，并在IE11浏览器下使用！");
                            return;
                        }
                        var obj = document.getElementById("DPSDK_OCX");
                        gWndId = obj.DPSDK_CreateSmartWnd(0, 0, 100, 100);
                        ButtonCreateWnd_onclick();
                        ButtonSetCustomizedWndCount_onclick();
                        obj.DPSDK_SetToolBtnVisible(1, false);// 1 audio 2 talk 3 localRecord 4 cappicture 5 close video
                        obj.DPSDK_SetToolBtnVisible(7, false);
                        obj.DPSDK_SetToolBtnVisible(9, false);
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
                    // 设置窗口数量
                    function ButtonCreateWnd_onclick() {
                        var obj = document.getElementById("DPSDK_OCX");
                        var nWndCount = 1;
                        obj.DPSDK_SetWndCount(gWndId, nWndCount);
                        obj.DPSDK_SetSelWnd(gWndId, 0);
                    }
                    //设置窗口比例
                    function ButtonSetCustomizedWndCount_onclick() {
                        var obj = document.getElementById("DPSDK_OCX");
                        var nWndCount = 1;
                        obj.DPSDK_SetCustomizedWndCount(gWndId, nWndCount);
                        obj.DPSDK_SetSelWnd(gWndId, 0);
                    }
                })
                //*****************大华视频 end**************//
            } else if (ccmDeviceTypeVidicon == 4) {
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
                    info.buttons = [0, 1, 2, 3, 4];//需要加载的按钮
                    info.menus = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];//需要加载的右键菜单
                    info.diskplaninfo = {};
                    info.otherinfo = {};
                    info.authority = 1;
                    var OCXobj = document.getElementById("PlayViewOCX");
                    OCXobj.init(JSON.stringify(info));
                }

                function startVideo() {
                    var ret = document.getElementById("PlayViewOCX").StartVideo(ccmDeviceParaml);
                }
            }

            if( hikvisonVideoType==0){
                $('#divPlugin').css({
                    "overflow": "hidden",
                    "width":"100%",
                    "height":"100%"
                });
            }else if (hikvisonVideoType==1){
                $('#divPlugin').css({
                    "margin-left": "60%",
                    "margin-top": "40%",
                    "width": "100px"
                });
            }
        })
    </script>
    <style>
        .clearfix:after {
            visibility: hidden;
            display: block;
            font-size: 0;
            content: " ";
            clear: both;
            height: 0;
        }
        .style0{
            overflow: hidden;
            width:100%;
            height:100%;
        }
        .style1 {
            margin-left: 60%;
            margin-top: 40%;
            width: 100px;
        }
    </style>

</body>
</html>