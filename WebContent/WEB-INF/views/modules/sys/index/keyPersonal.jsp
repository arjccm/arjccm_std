<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
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
	<link rel="stylesheet" href="${ctxStatic}/common/index/css/awesome-bootstrap-checkbox.min.css">
	<link rel="stylesheet" href="${ctxStatic}/common/index/css/keyPersonal.css">
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
	<script src="${ctxStatic}/common/index/Scripts/js/echarts.min.js"></script>
	<script src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
	<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
	<script src="${ctxStatic}/custom/date/date.js"></script>
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/index/Scripts/js/statIndexZjkeypeople.js"></script>
	<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill.min.js"></script>

	<script>
		function showKey() {
			// 切换元素的可见状态。如果元素是可见的，切换为隐藏的；如果元素是隐藏的，则切换为可见的。
			$("#timeline").toggle()
		}
	</script>

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
						<span id="productName" class="logo_text">宗教全时空立体化防控</span>
					</div>
					<div class="header_nav">
						<ul class="nav pm-links clearfix">
							<li class="menu">
								<a id="wanggeguanli" href="${ctx}/sys/map/statIndexForZj">数据展示</a>
							</li>
							<li class="menu">
								<a class="active" href="${ctx}/sys/map/keyPersonal">重点人员专题</a>
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

        <div class="row-fluid" style="width: 100%;height: 100%;position: absolute;">
            <div class="left-area">
                <div class="title">人员分布</div>
                <div class="content">
                    <div class="search-box">
                        <div class="form-group has_dark has-feedback">
                            <input type="text" class="form-control" placeholder="支持模糊搜素" id="sinput" value="">
                            <div>
                            <span>
                                <a class="glyphicon glyphicon-search form-control-feedback" id="sousuo"
                                   aria-hidden="true" style="pointer-events: auto"></a>
                            </span>
                            </div>
                        </div>


                    </div>
                    <div class="checkbox-box">
                        <div class="tit">数据类型</div>

                        <div class="ckbx clearfix">
                            <div class="checkbox">
                                <input type="checkbox" name="pop" id="checkbox1" value="02">
                                <label for="checkbox1">
                                    车辆卡口
                                </label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" name="pop" id="checkbox2" value="01">
                                <label for="checkbox2">
                                    人脸卡口
                                </label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" name="pop" id="checkbox3" value="03">
                                <label for="checkbox3">
                                    RFID
                                </label>
                            </div>
                            <div class="checkbox mb0">
                                <input type="checkbox" name="pop" id="checkbox4" value="05">
                                <label for="checkbox4">
                                    电子围栏
                                </label>
                            </div>
                            <div class="checkbox mb0">
                                <input type="checkbox" name="pop" id="checkbox5" value="04">
                                <label for="checkbox5">
                                    wifi探针
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="checkbox-box">
                        <div class="tit">人员类型</div>

                        <div class="ckbx clearfix">
                            <div class="checkbox">
                                <input type="checkbox" name="pop" id="checkbox6" value="6">
                                <label for="checkbox6">
                                    涉教人员
                                </label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" name="pop" id="checkbox7" value="7">
                                <label for="checkbox7">
                                    重点人员
                                </label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" name="pop" id="checkbox8" value="8">
                                <label for="checkbox8">
                                    流动人员
                                </label>
                            </div>
                            <div class="checkbox mb0">
                                <input type="checkbox" name="pop" id="checkbox9" value="9">
                                <label for="checkbox9">
                                    其他人员
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="date-box clearfix">
                        <div class="tit">时间</div>
                        <div class="form-group has_dark has-feedback timebox">
                            <input name="beginHappenDate"
                                   type="text" readonly="readonly" maxlength="20"
                                   class="input-medium form-control"
                                   value=""
                                   placeholder="开始时间"
                                   id="time1"
                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback" aria-hidden="true"></span>
                        </div>
                        <div style="padding: 0 2px;">-</div>
                        <div class="form-group has_dark has-feedback timebox">
                            <input name="beginHappenDate"
                                   type="text" readonly="readonly" maxlength="20"
                                   class="input-medium form-control"
                                   value=""
                                   placeholder="结束时间"
                                   id="time2"
                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"
                                   onchange="funtime()"/>

                            <span class="glyphicon glyphicon-calendar form-control-feedback" aria-hidden="true"></span>
                        </div>
                    </div>
                    <div class="btn-box">
                        <button type="button" id="btn_One">最近1小时</button>
                        <button type="button" id="btn_Three">最近3小时</button>
                        <button type="button" id="btn_Aday">最近1天</button>
                    </div>
                    <div class="table-box">
                        <table class="table table-condensed">
                            <thead>
                            <tr>
                                <th>人员</th>
                                <th>时间</th>
                                <th>位置</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>

				</div>
			</div>

			<div id="pubMap"></div>
			<div id="mapMask" class="map"></div>
			<div id="timeline" style="display: none" class="track-rcol">
				<div class="track-list">
					<ul>
						<li>
							<i class="node-icon"></i>
							<div class="line_div">
								<span class="time">2016-03-10 18:07:15</span>
								<br />
								<br />
								<span class="txt">创新六路和一路交叉口</span>
							</div>
						</li>
						<li>
							<i class="node-icon"></i>
							<div class="line_div">
								<span class="time">2016-03-10 18:07:15</span>
								<br />
								<br />
								<span class="txt">创新六路和一路交叉口</span>
							</div>
						</li>
						<li>
							<i class="node-icon"></i>
							<div class="line_div">
								<span class="time">2016-03-10 18:07:15</span>
								<br />
								<br />
								<span class="txt">创新六路和一路交叉口</span>
							</div>
						</li>
						<li>
							<i class="node-icon"></i>
							<div class="line_div">
								<span class="time">2016-03-10 18:07:15</span>
								<br />
								<br />
								<span class="txt">创新六路和一路交叉口</span>
							</div>
						</li>
						<li>
							<i class="node-icon"></i>
							<div class="line_div">
								<span class="time">2016-03-10 18:07:15</span>
								<br />
								<br />
								<span class="txt">创新六路和一路交叉口</span>
							</div>
						</li>
						<li>
							<i class="node-icon"></i>
							<div class="line_div">
								<span class="time">2016-03-10 18:07:15</span>
								<br />
								<br />
								<span class="txt">创新六路和一路交叉口</span>
							</div>
						</li>
						<li>
							<i class="node-icon"></i>
							<div class="line_div">
								<span class="time">2016-03-10 18:07:15</span>
								<br />
								<br />
								<span class="txt">创新六路和一路交叉口</span>
							</div>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</div>
</body>
<script>
    var ArrList = [];
    $("input[name='pop']").click(function () {
        for (var i = 0; i < $("input[name='pop']").length; i++) {//遍历$("input[name='teachar']").length的个数
            //console.log($("input[name='teachar']"))
            if ($("input[name='pop']")[i].checked == true) {//判断是否选中的值
                ArrList.push($("input[name='pop']")[i].value);//输出value值
                ArrList = Array.from(new Set(ArrList))
            } else {
                ArrList = ArrList.filter(function (res) {
                    return res != ($("input[name='pop']")[i].value);
                })
            }
        }
        if (ArrList.length > 0) {
            $.ajax({
                url: ctx + "/warning/ccmEarlyWarning/FU",
                type: "POST",
                data: {
                    array: ArrList.join(",")
                },
                success: function (ref) {
                    if (ref.code == 200) {
                        var html = '';
                        $.each(ref.data, function (index, ele) {
                            html += ' <tr>' +
                                '<td>' + ele.name + '</td>' +
                                '<td>' + ele.time + '</td>' +
                                '<td>' + ele.address + '</td>' +
                                '<td class="clearfix">' +
                                '<a class="dangan">' + '</a>' +
                                '<a class="guiji"' + 'onclick="showKey()"' + '>' + '</a>' +
                                '<a class="dingwei">' + '</a>' +
                                '</td>' +
                                '        </tr>';
                        });
                        $('tbody').empty().html(html);
                    }
                }
            })
        }
    });
    var array = '';

    /*默认加载一天数据*/
    $(window).load(function () {
        fun_Aday();
    });

    /*开始时间结束时间*/
    function funtime() {
        var time1 = $('#time1').val();
        var time2 = $('#time2').val();
        if (ArrList.length > 0) {
            array = ArrList.join(",");
        }
        if (time1 != '') {
            $.ajax({
                type: "POST",
                url: ctx + "/warning/ccmEarlyWarning/KJ",
                async: false,
                data: {
                    time1: time1,
                    time2: time2,
                    array:array
                },
                success: function (ref) {
                    if (ref.code == 200) {
                        var html = '';
                        $.each(ref.data, function (index, ele) {
                            html += ' <tr>' +
                                '<td>' + ele.name + '</td>' +
                                '<td>' + ele.time + '</td>' +
                                '<td>' + ele.address + '</td>' +
                                '<td class="clearfix">' +
                                '<a class="dangan">' + '</a>' +
                                '<a class="guiji">' + '</a>' +
                                '<a class="dingwei">' + '</a>' +
                                '</td>' +
                                '        </tr>';
                        });
                        $('tbody').empty().html(html);
                    }
                }
            })
        }
    }

    /*搜索框*/
    $('#sousuo').click(function () {
        var res = document.getElementById('sinput').value;
        $.ajax({
            type: "POST",
            url: ctx + "/warning/ccmEarlyWarning/search",
            async: false,
            data: {
                name: res
            },
            success: function (ref) {
                if (ref.code == 200) {
                    var html = '';
                    $.each(ref.data, function (index, ele) {
                        html += ' <tr>' +
                            '<td>' + ele.name + '</td>' +
                            '<td>' + ele.time + '</td>' +
                            '<td>' + ele.address + '</td>' +
                            '<td class="clearfix">' +
                            '<a class="dangan">' + '</a>' +
                            '<a class="guiji">' + '</a>' +
                            '<a class="dingwei">' + '</a>' +
                            '</td>' +
                            '        </tr>';
                    });
                    $('tbody').empty().html(html);
                }
            }
        });
    });
        /*最近一小时*/
        $('#btn_One').click(function () {
            var time = new Date(new Date().getTime() - 1 * 60 * 60 * 1000);
            if (ArrList.length > 0) {
                array = ArrList.join(",");
            }
            $.ajax({
                type: "POST",
                url: ctx + "/warning/ccmEarlyWarning/recently",
                async: false,
                data: {
                    time: time,
                    array: array
                },
                success: function (ref) {
                    if (ref.code == 200) {
                        var html = '';
                        $.each(ref.data, function (index, ele) {
                            html += ' <tr>' +
                                '<td>' + ele.name + '</td>' +
                                '<td>' + ele.time + '</td>' +
                                '<td>' + ele.address + '</td>' +
                                '<td class="clearfix">' +
                                '<a class="dangan">' + '</a>' +
                                '<a class="guiji">' + '</a>' +
                                '<a class="dingwei">' + '</a>' +
                                '</td>' +
                                '        </tr>';
                        });
                        $('tbody').empty().html(html);
                    }
                }
            })
        });

        /*最近三小时*/
        $('#btn_Three').click(function () {
            var time = new Date(new Date().getTime() - 3 * 60 * 60 * 1000);
            if (ArrList.length > 0) {
                array = ArrList.join(",");
            }
            $.ajax({
                type: "POST",
                url: ctx + "/warning/ccmEarlyWarning/recently",
                async: false,
                data: {
                    time: time,
                    array: array
                },
                success: function (ref) {
                    if (ref.code == 200) {
                        var html = '';
                        $.each(ref.data, function (index, ele) {
                            html += ' <tr>' +
                                '<td>' + ele.name + '</td>' +
                                '<td>' + ele.time + '</td>' +
                                '<td>' + ele.address + '</td>' +
                                '<td class="clearfix">' +
                                '<a class="dangan">' + '</a>' +
                                '<a class="guiji">' + '</a>' +
                                '<a class="dingwei">' + '</a>' +
                                '</td>' +
                                '        </tr>';
                        });
                        $('tbody').empty().html(html);
                    }
                }
            })
        });

        /*最近一天*/
        $('#btn_Aday').click(function () {
            fun_Aday();
        });

        function fun_Aday() {
            var time = new Date(new Date().getTime() - 24 * 60 * 60 * 1000);
            if (ArrList.length > 0) {
                array = ArrList.join(",");
            }
            $.ajax({
                type: "POST",
                url: ctx + "/warning/ccmEarlyWarning/recently",
                async: false,
                data: {
                    time: time,
                    array: array
                },
                success: function (ref) {
                    if (ref.code == 200) {
                        var html = '';
                        $.each(ref.data, function (index, ele) {
                            html += ' <tr>' +
                                '<td>' + ele.name + '</td>' +
                                '<td>' + ele.time + '</td>' +
                                '<td>' + ele.address + '</td>' +
                                '<td class="clearfix">' +
                                '<a class="dangan">' + '</a>' +
                                '<a class="guiji">' + '</a>' +
                                '<a class="dingwei">' + '</a>' +
                                '</td>' +
                                '        </tr>';
                        });
                        $('tbody').empty().html(html);
                    }
                }
            })
        }
</script>

</html>