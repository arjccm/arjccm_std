<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"/>
    <title>视频回放</title>
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
            <OBJECT classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" id="vlc"     width="560" height="360" id="vlc"
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
                 style="width: 613px;height: auto; position: relative;padding: 14px 0 0 0; float: left">
                <p class="pop" style="display:block">加载中</p>
                <input type="hidden" name="config" id="config" value="ReqType:PlayReal;wndcount:1"/>
                <!-- 添加预览控件（需要先在windows下注册） -->
                <object classid="CLSID:7E393848-7238-4CE3-82EE-44AF444B240A" id="PlayViewOCX" wmode="opaque" width="0"
                        height="0" name="PlayViewOCX">
                </object>
            </div>

            <div style="float: left; width: 250px;">
                <div style="float: left; width: 250px;padding-top: 15%">
                    <a href="http://localhost:8080/arjccm/exe/hikvision.exe"
                       style="margin-left: 54%;color: #0bbbee;font-size: 14px">下载视频插件</a>
                </div>
            </div>
        </c:if>
        <c:if test="${ccmDevice.typeVidicon == 3}">
        <div class="clearfix" style="overflow: hidden">
            <div class="video-position"
                 style="width: 613px;height: auto; position: relative;padding: 14px 0 0 0; float: left">
                <p class="pop" style="display:block">视频加载中</p>
                <div id="objDss">
                    <object id="DPSDK_OCX" classid="CLSID:D3E383B6-765D-448D-9476-DFD8B499926D"
                            style="width: 100%; height: 80%"
                            codebase="DpsdkOcx.cab#version=1.0.0.0">
                    </object>
                </div>
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
             style="width: 613px;height: auto; position: relative;padding: 14px 0 0 0; float: left">
            <p class="pop" style="display:block">加载中</p>
            <input type="hidden" name="config" id="config" value="ReqType:PlayReal;wndcount:1"/>
            <!-- 添加预览控件（需要先在windows下注册） -->
                <%--<object classid="clsid:02EFF2E9-3D57-461F-BDAC-7A598239E53C" id="PlayViewOCX" wmode="opaque"
                        width="0" height="0" name="PlayViewOCX">
                </object>--%>
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

    /* ***********************海康录像回放************************/
    var oWebControl = null;// 插件对象
    var bIE = (!!window.ActiveXObject || 'ActiveXObject' in window);// 是否为IE浏览器
    var pubKey = '';
    var initCount = 0;

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
                    oWebControl.JS_CreateWnd("divPlugin", 613, 360).then(function () { //JS_CreateWnd创建视频播放窗口，宽高可设定
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
                        playMode: 1, // 预览
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
                    oWebControl.JS_Resize(613, 360);  // 初始化后resize一次，规避firefox下首次显示窗口后插件窗口未与DIV窗口重合问题
                });
                /*setTimeout(function () {
                    playBack(); //视频预览
                }, 1000);*/
            })
        });

    };

    // 录像回放
    function playBack(startTimeStamp,endTimeStamp) {
        debugger
        var startTime = startTimeStamp;
        var endTime = endTimeStamp;
        var playTime = startTimeStamp;
        //var endTime = dateFormat(new Date(), "yyyy-MM-dd 23:59:59");
        //var startTime = dateFormat(new Date(), "yyyy-MM-dd 00:00:00");
        //var playTime = dateFormat(new Date(), "yyyy-MM-dd 00:00:00");

        var cameraIndexCode  =$('#ccmDeviceCode').val();
        var startTimeStamp = new Date(startTime.replace('-', '/').replace('-', '/')).getTime();
        var playTimeStamp = new Date(playTime.replace('-', '/').replace('-', '/')).getTime();
        var endTimeStamp = new Date(endTime.replace('-', '/').replace('-', '/')).getTime();
        var recordLocation = +"0"; //存储位置 0 中心存储  1 设备存储
        var transMode = +"1";  // 1 TCP
        var gpuMode = +"0";  //是否启用GPU硬解 0:不启用
        var wndId = -1;  //默认为空闲窗口预览
        var isDirectEzviz = +"0";  //是否直连萤石预览 0:不启用

        oWebControl.JS_RequestInterface({
            funcName: "startPlayback",
            argument: JSON.stringify({
                cameraIndexCode : cameraIndexCode ,
                startTimeStamp: Math.floor(startTimeStamp / 1000).toString(),
                endTimeStamp: Math.floor(endTimeStamp / 1000).toString(),
                playTimeStamp: Math.floor(playTimeStamp / 1000).toString(),
                recordLocation: recordLocation,
                transMode: transMode,
                gpuMode: gpuMode,
                wndId: wndId,
                ezvizDirect: isDirectEzviz
            })
        }).then(function (oData) {
            //showCBInfo(JSON.stringify(oData ? oData.responseMsg : ''));
        });
    };

    // 停止回放
    $("#stopPlayback").click(function () {
        oWebControl.JS_RequestInterface({
            funcName: "stopAllPlayback"
        }).then(function (oData) {
            showCBInfo(JSON.stringify(oData ? oData.responseMsg : ''));
        });
    })

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

    // 窗口resize
    $(window).resize(function () {
        if (oWebControl != null) {
            oWebControl.JS_Resize(613, 360);
            setWndCover();
        }
    });
    // 滚动条scroll
    $(window).scroll(function () {
        if (oWebControl != null) {
            oWebControl.JS_Resize(613, 360);
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

        iCoverLeft = (iCoverLeft > 613) ? 613 : iCoverLeft;
        iCoverTop = (iCoverTop > 360) ? 360 : iCoverTop;
        iCoverRight = (iCoverRight > 613) ? 613 : iCoverRight;
        iCoverBottom = (iCoverBottom > 360) ? 360 : iCoverBottom;

        oWebControl.JS_RepairPartWindow(0, 0, 613, 360);  // 多1个像素点防止还原后边界缺失一个像素条
        if (iCoverLeft != 0) {
            oWebControl.JS_CuttingPartWindow(0, 0, iCoverLeft, 360);
        }
        if (iCoverTop != 0) {
            oWebControl.JS_CuttingPartWindow(0, 0, 613, iCoverTop);  // 多剪掉一个像素条，防止出现剪掉一部分窗口后出现一个像素条
        }
        if (iCoverRight != 0) {
            oWebControl.JS_CuttingPartWindow(613 - iCoverRight, 0, iCoverRight, 360);
        }
        if (iCoverBottom != 0) {
            oWebControl.JS_CuttingPartWindow(0, 360 - iCoverBottom, 613, iCoverBottom);
        }
    }
    // 格式化时间
    function dateFormat(oDate, fmt) {
        var o = {
            "M+": oDate.getMonth() + 1, //月份
            "d+": oDate.getDate(), //日
            "h+": oDate.getHours(), //小时
            "m+": oDate.getMinutes(), //分
            "s+": oDate.getSeconds(), //秒
            "q+": Math.floor((oDate.getMonth() + 3) / 3), //季度
            "S": oDate.getMilliseconds()//毫秒
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (oDate.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    }
    $(function () {
        var ccmDeviceTypeVidicon = $('#ccmDeviceTypeVidicon').val()//摄像机类型
        if (ccmDeviceTypeVidicon == 1) {

        } else if(ccmDeviceTypeVidicon==2){
            //延迟初始化
            $(document).ready(function () {
                setTimeout(function () {
                    initPlugin();
                }, 50);
            })


        }else if (ccmDeviceTypeVidicon == 3) {

        } else if (ccmDeviceTypeVidicon == 4) {

        }

        if (ccmDeviceTypeVidicon == 2){
            $('#divPlugin').css({
                "margin-left": "81.2%",
                "margin-top": "42%",
                "width": "0px"
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
</style>

</body>
</html>