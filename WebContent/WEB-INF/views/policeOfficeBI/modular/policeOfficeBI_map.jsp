<%@ page contentType="text/html;charset=UTF-8" %>
	<link rel="stylesheet" href="${ctxStatic}/policeOfficeBI/css/font-awesome.min.css">

<style>
	.sizemap{
		box-shadow: inset 0px 0px 10px 2px #057fae;
	}
	.playButton{
		position: absolute;
		left: 30px;
		top: 20px;
        border-radius: 50%;
        overflow: hidden;
        box-shadow: 0px 0px 8px 2px #057fae;
		border: 1px solid #03cecf;
		opacity: 0.9;
		background: #122847;
		z-index: 9999;
	}
    .playButton i{
        color: #07eefc;
		font-size: 20px;
		text-align: center;
		line-height: 58px;
		width: 58px;
		cursor: pointer;

    }
	.topmapbutton{
		width: 531px;
		height: 58px;
		top: 20px;
		z-index: 10;
		position: absolute;
		left: 118px;
		background: #040D1E;
		border-radius:4px;
		border:1px solid #02d0d1;
		opacity:0.9;
		box-shadow: 0px 0px 8px 0px #3bc9e3;
	}


	.btninp{
		width: 106px;
		height: 56px;
		background: #040D1E;
		padding: 0!important;
		border: 0!important;
		margin-right: -4px!important;
		font-size: 12px;
		font-family: "MicrosoftYaHei";
		color: #FFFFFF;
	}

	.sxtback{
		width: 50px;
		height: 150px;
		margin-top: 76px;
		z-index: 10;
		position: fixed;
		right: 39%;
		background: #040D1E;
		border-radius:4px;
		border:1px solid rgba(0,255,252,1);
		opacity:0.8;
		box-shadow: 0px 0px 8px 0px #3bc9e3;
	}
    .btninp .selectBg{
        display: none;
    }
    .topmapbutton .selected{
        box-shadow: inset 0px 0px 11px 6px #4cb3d0;
        position: relative;
    }
    .topmapbutton .selected .selectBg{
        position:absolute;
        width: 0;
        height: 0;
        border-width: 13px;
        border-style: solid;
        border-color: #07eefc #07eefc transparent transparent ;
        top: 0;
        right: 0;
        display: block;
    }
    .topmapbutton .selected .selectBg i{
        font-size: 14px;
        color: #12658e;
        position: absolute;
        top: -11px;
        left: -2px;
    }
	.sxtlizx{
		height: 70px;
		color: #44e0f0;
		padding: 11px 0px 0px 8px;
		background:url(${ctxStatic}/policeOfficeBI/img/map_sxt-zxquan.png) no-repeat 7px 34px;
	}

	.sxtlilx{
		height: 70px;
		color: #f93f76;
		padding: 8px 0px 0px 8px;
		background:url(${ctxStatic}/policeOfficeBI/img/map_sxt-lxquan.png) no-repeat 7px 34px;
	}

	.sctyback{
		width: 50px;
		height: 290px;
		top:380px;
		z-index: 10;
		position: absolute;
		right: 1vw;
		background: #040D1E;
		border-radius:4px;
		border:1px solid rgba(0,255,252,1);
		opacity:0.8;
		box-shadow: 0px 0px 8px 0px #3bc9e3;
	}

	.ktv{
		height: 70px;
		color: #d757de;
		padding: 11px 0px 0px 8px;
		background:url(${ctxStatic}/policeOfficeBI/img/map_ktvquan.png) no-repeat 7px 34px;
	}
	.bg{
		height: 70px;
		color: #1dd3b3;
		padding: 11px 0px 0px 8px;
		background:url(${ctxStatic}/policeOfficeBI/img/map_bgquan.png) no-repeat 7px 34px;
	}
	.zy{
		height: 70px;
		color: #9399fe;
		padding: 11px 0px 0px 8px;
		background:url(${ctxStatic}/policeOfficeBI/img/map_zyquan.png) no-repeat 7px 34px;
	}
	.wb{
		height: 70px;
		color: #248db0;
		padding: 11px 0px 0px 8px;
		background:url(${ctxStatic}/policeOfficeBI/img/map_wbquan.png) no-repeat 7px 34px;
	}



</style>

<script src="${ctxStatic}/ol/ol.js"></script>
<script src="${ctxStatic}/d3/d3.v4.min.js"></script>
<script src="${ctxStatic}/modules/map/js/mapconfig.js"></script>
<script src="${ctxStatic}/policeOfficeBI/js/policeOffice.js"></script>
<script src="${ctxStatic}/mapv/mapv.min.js"></script>
<script src="${ctxStatic}/supermapopenlayers/iclient-openlayers.min.js"></script>

<section>
	<div class="playButton">
		<i class="fa fa-pause" aria-hidden="false"></i>
<%--		<i class="fa fa-pause" aria-hidden="true"></i>--%>
	</div>
	<div class="topmapbutton">
		<button type="button" value="重点人员" class="btninp" style="background:url(${ctxStatic}/policeOfficeBI/img/map_ry.png) no-repeat 11px 13px;" onclick="getKeyPeopleNum(this)" id="keypeople">重点人员<div class="selectBg"><i class="fa fa-check" aria-hidden="true"></i></div></button>
        <button type="button" value="视频监控"  class="btninp"  style="background:url(${ctxStatic}/policeOfficeBI/img/map_sxt-zx.png) no-repeat 4px 16px;" onclick="shipinjiankongFun(this)" id="shipinjiankong">视频监控<div class="selectBg"><i class="fa fa-check" aria-hidden="true"></i></div></button>
		<button type="button" value="出租屋"  class="btninp" style="background:url(${ctxStatic}/policeOfficeBI/img/map_czw.png) no-repeat 4px 16px;" onclick="getLetNum(this)" id="getLet">出租屋<div class="selectBg"><i class="fa fa-check" aria-hidden="true"></i></div></button>
		<button type="button" value="场所特业" class="btninp" style="background:url(${ctxStatic}/policeOfficeBI/img/map_cs.png) no-repeat 4px 16px;" onclick="getBasePlaceMap(this)" id="baseplace">场所特业<div class="selectBg"><i class="fa fa-check" aria-hidden="true"></i></div></button>
		<button type="button" value="警情事件" class="btninp"  style="background:url(${ctxStatic}/policeOfficeBI/img/map_jq.png) no-repeat 4px 16px;" onclick= "getAlarm(this)" id="alarm">警情事件<div class="selectBg"><i class="fa fa-check" aria-hidden="true"></i></div></button>
	</div>

	<div class="sxtback" id="sxtshow" style="display: none">
		<ui>
			<li class="sxtlizx"><span>在线</span><li>
			<li class="sxtlilx"><span>离线</span><li>
		</ui>
	</div>

	<div class="sctyback" id="sctyshow"  style="display: none">
		<ui>
			<li class="ktv"><span>KTV</span><li>
			<li class="bg"><span>宾馆</span><li>
			<li class="zy"><span>足浴</span><li>
			<li class="wb"><span>网吧</span><li>
		</ui>
	</div>

	<div id="pubMap"></div>
	<div id="mapMask" class="map"></div>

</section>
<script>
	$(document).ready(function(){
		var mapWidth = $(".sizemap").width();
		var mapHeight = $(".sizemap").height();
		$(".map").css({
			"width":mapWidth,
			"height":mapHeight
		})



	})

	/**
	 * Created by oHa on 2017/12/28.
	 */
	/*Object.assign() 之 IE 兼容 （TypeError: 对象不支持“assign”属性或方法）*/
	if (typeof Object.assign != 'function') {
		Object.assign = function(target) {
			'use strict';
			if (target == null) {
				throw new TypeError('Cannot convert undefined or null to object');
			}

			target = Object(target);
			for (var index = 1; index < arguments.length; index++) {
				var source = arguments[index];
				if (source != null) {
					for (var key in source) {
						if (Object.prototype.hasOwnProperty.call(source, key)) {
							target[key] = source[key];
						}
					}
				}
			}
			return target;
		};
	}

	var windowsHeight, _fontSize = 14, _fontSize1 = 26, _fontSize2 = 24, _fontSize3 = 20, breakData = 8,
			legendTop = '30%', radiusData = ['40%', '65%'], lengthECharts = 30, mapHeigth = '90%', zoom = 14.75,
			centerCoordinate = [117.663920, 39.035650], echarts3X = "48%", echarts3y = "40%", ItemGap = 20;

	var streetFlag, vccmorgFlag, communityFlag, gridFlag, buildFlag, eventFlag, partsFlag, landsFlag, videoFlag,
			broadcastFlag, policeroomFlag, workstationFlag, schoolPlaceFlag, keyPlaceFlag, keyPersonFlag, rentingPersonFlag,
			publicPlaceFlag, popLocationFlag, SetTopBoxFlag;
	streetFlag = false;
	communityFlag = false;
	gridFlag = true;
	// 基础颜色表
	var color = ['#CA410B', '#12B3B6', '#A269C6', '#883CBD', '#401EC3', '#4366D9',
		'#D26320', '#06AC7D', '#b9ce96', '#a99bbc', '#92c3d4', '#ffdf5f'];
	$(function () {
		/********************地图***********************/
		//地图
		map();
		//街道画线
		// lightLine();
		//初始化网格
		initorgAreaMap();
		//自动调用方法
        initmapdo(true);
		$("#keypeople").addClass("selected");
		getKeyPeopleNum(this);

		// 地图
		function map() {
			// var centerCoordinate = [113.48940277,34.526999206];    //新密中心点
			//  var centerCoordinate = [109.40, 18.53];    //三亚中心点centerCoordinateSituation

			// 地图默认数据设置
			var defaultPrams = {
				id: 'mapMask',
				centerCoordinate: centerCoordinateSituation,
				zoom: zoomPop,
				maxZoom: maxZoom,
				minZoom: minZoom,
				baseUrl: baseUrlT,
				zoomShowOrHide: false,// 缩小放大
				overviewMap: false,
				selectPointerFlag: false
				// 鹰眼图
			}

			viewSituationFun(centerCoordinateSituation, zoomPop)  //view 初始化    定位中心点缩放比例
			Map = new ArjMap.Map(defaultPrams);
			// 加载地图
			Map.drawMapSituationKeShiHua();
			Pubmap = Map.map;
			// 监听地图层级变化
			Pubmap.getView().on('change:resolution', checkZoom);// checkZoom为调用的函数
			function checkZoom(map_level) {
				var zoom = Pubmap.getView().getZoom();
				// console.info(zoom);
				/*if (Pubmap.getView().getZoom() <= 10) {
					Map.layersIsShow('communitys', false);
					Map.layersIsShow('streets', true);
					Map.layersIsShow('grids', false);
					communityFlag = false;
					streetFlag = true;
					gridFlag = false;
				} else if (Pubmap.getView().getZoom() <= 13
						&& Pubmap.getView().getZoom() > 10) {
					Map.layersIsShow('communitys', true);
					Map.layersIsShow('streets', false);
					Map.layersIsShow('grids', false);
					communityFlag = true;
					streetFlag = false;
					gridFlag = false;
				} else if (Pubmap.getView().getZoom() > 13
						&& Pubmap.getView().getZoom() <= 16) {
					Map.layersIsShow('communitys', false);
					Map.layersIsShow('streets', false);
					Map.layersIsShow('grids', true);
					communityFlag = false;
					streetFlag = false;
					gridFlag = true;
				} else if (Pubmap.getView().getZoom() > 16) {
					Map.layersIsShow('communitys', false);
					Map.layersIsShow('streets', false);
					Map.layersIsShow('grids', false);
					communityFlag = false;
					streetFlag = false;
					gridFlag = false;
				}*/
			}
		}


	})

	/********************地图End***********************/
	//地图网格数据初始化
	function initorgAreaMap() {
	/*	$.getJSON('' + ctx + '/sys/map/orgAreaMap?type=1', function (data) {
			Map.addJSON1([{
				'type': 'communitys',
				'data': data,
				'isShow': communityFlag,
			}]);
			// addconver(data); //添加遮罩层
		})*/

		$.getJSON('' + ctx + '/sys/map/orgAreaMap?type=2', function (data) {
			Map.addJSON([{
				'type': 'grids',
				'data': data,
				'isShow': gridFlag,
			}])
		})

	/*	$.getJSON('' + ctx + '/sys/map/orgAreaMap?type=4', function (data) {
			Map.addJSON1([{
				'type': 'streets',
				'data': data,
				'isShow': streetFlag
			}])
		})*/
	}



	/********************下方菜单***********************/
	//重点人员数量
	var keyPeopleNumFlag = true;
	function getKeyPeopleNum(_this) {
		// Map.layersIsShow('communitys', false);
		// Map.layersIsShow('streets', false);
		// Map.layersIsShow('grids', true);
		if (keyPeopleNumFlag) {
			_this.className +=" selected";
			$.getJSON('' + ctx + '/sys/policemap/getKeyPeopleNum', function (data) {
				Map.addJSON1([{
					'type': 'keypeopleBox',
					'id': 'SetTopBoxFlag',
					'data': data,
					'isShow': true
				}])
				// var map = Map.map;
				// map.getView().setZoom(12);
				// Map.goTo(["113.600011373", "34.50186483919"])
			})
		} else {
			_this.className ="btninp";
			Map.removeLayer('SetTopBoxFlag');
		}
		keyPeopleNumFlag = !keyPeopleNumFlag;
	}


	//视频监控
	var shipinjiankongFlag = true;
	function shipinjiankongFun(_this) {
        // Map.layersIsShow('communitys', false);
        // Map.layersIsShow('streets', false);
        // Map.layersIsShow('grids', false);
		if (shipinjiankongFlag) {
			_this.className +=" selected";
			$('#sxtshow').attr("style","display:block");
			$.getJSON('' + ctx + '/sys/policemap/deviceiveMap', function (data) {
				Map.addPoliceOffice([{
					'type': 'videos',
					'id': 'shipinjiankong',
					'data': data,
					'isShow': true
				}])
			})
		} else {
			_this.className ="btninp";
			$('#sxtshow').attr("style","display:none");
			Map.removeLayer('shipinjiankong');
		}
		shipinjiankongFlag = !shipinjiankongFlag;
	}

	//出租屋
	var LetNumFlag = true;
	function getLetNum(_this) {
		// Map.layersIsShow('communitys', false);
		// Map.layersIsShow('streets', false);
		// Map.layersIsShow('grids', true);
		if (LetNumFlag) {
			_this.className +=" selected";
			$.getJSON('' + ctx + '/sys/policemap/getLetNum', function (data) {
				Map.addJSON1([{
					'type': 'letnumBox',
					'id': 'letnum',
					'data': data,
					'isShow': true
				}])
			})
		} else {
			_this.className ="btninp";
			Map.removeLayer('letnum');
		}
		LetNumFlag = !LetNumFlag;
	}

	//场所特业
	var broadcastFlag = true;
	function getBasePlaceMap(_this) {
        // Map.layersIsShow('communitys', false);
        // Map.layersIsShow('streets', false);
        // Map.layersIsShow('grids', false);
		if (broadcastFlag) {
			_this.className +=" selected";
			$('#sctyshow').attr("style","display:block");
			$.getJSON('' + ctx + '/sys/policemap/getBasePlaceMap', function (data) {
				Map.addPoliceOffice([{
					'type': 'broadcast',
					'id': 'baseplace',
					'data': data,
					'isShow': true
				}])
				// var map = Map.map;
				// map.getView().setZoom(11);
				// Map.goTo(["113.3586326175677", "34.53555866426642"])
			})
		} else {
			_this.className ="btninp";
			$('#sctyshow').attr("style","display:none");
			Map.removeLayer('baseplace');
		}
		broadcastFlag = !broadcastFlag;
	}

	//警情事件
	var AlarmFlag = true;
	function getAlarm(_this) {
		// Map.layersIsShow('communitys', false);
		// Map.layersIsShow('streets', false);
		// Map.layersIsShow('grids', true);
		if (AlarmFlag) {
			_this.className +=" selected";
			$.getJSON('' + ctx + '/sys/policemap/getAlarm', function (data) {
				Map.addJSON1([{
					'type': 'alarmnumBox',
					'id': 'alarmnum',
					'data': data,
					'isShow': true
				}])
			})
		} else {
			_this.className ="btninp";
			Map.removeLayer('alarmnum');
		}
		AlarmFlag = !AlarmFlag;
	}

	//添加选中样式记录播放id
	var maptoworknum = [];
	function addMapworknum(_this,num) {
		$(".playButton i").removeClass("fa-pause").addClass("fa-play")
		$(".playButton i").attr('aria-hidden',true);
		initmapdo(false);
		if(maptoworknum.indexOf(num)==-1){
			maptoworknum.push(num);
			_this.className +=" selected";
		} else {
			maptoworknum.splice(maptoworknum.indexOf(num),1)
			_this.className ="btninp";
			// $(".playButton i").removeClass("fa-pause").addClass("fa-play")
			// $(".playButton i").attr('aria-hidden',true);
			// initmapdo(false);
		}
	}

	//启动定时播放
	$(".playButton i").click(function(){
		$("#keypeople").removeClass("selected");
		$("#shipinjiankong").removeClass("selected");
		$("#getLet").removeClass("selected");
		$("#baseplace").removeClass("selected");
		$("#alarm").removeClass("selected");
		keyPeopleNumFlag = true;
		shipinjiankongFlag = true;
		LetNumFlag = true;
		broadcastFlag = true;
		AlarmFlag = true;
		if($(this).attr('aria-hidden')== 'true'){
			/*if(maptoworknum.length>0){
				$(this).removeClass("fa-play").addClass("fa-pause")
				$(this).attr('aria-hidden',false)
				initmapdo(true);
			} else {
				layer.tips('选中后才能播放', $(".playButton i"), {
					tips : [ 1, '#20c694' ],
					time : 2000,
				});
			}*/
			$(this).removeClass("fa-play").addClass("fa-pause")
			$(this).attr('aria-hidden',false)
			initmapdo(true);
		}else{
			$(this).removeClass("fa-pause").addClass("fa-play")
			$(this).attr('aria-hidden',true);
			initmapdo(false);
		}
	});

	//定时执行方法
    var mapnum = 0;
	var firstFlag = true;
    function mapdonum(){
        mapnum++;
        if(mapnum == 6){
			mapnum = 1;
		}
        if(firstFlag){
			mapnum += 1;
			firstFlag = false;
		}
		mapdowork(mapnum)
        // if(mapnum == maptoworknum.length+1){
        //     mapnum = 1
        // }
		// mapdowork(maptoworknum[mapnum-1]);
    }

    var mapworking = null;
    function initmapdo(flag){
    	if(flag){
    		// if(maptoworknum.length > 0){
    		// 	if(maptoworknum.length == 1){
			// 		mapdowork(maptoworknum[mapnum]);
			// 	} else {
			// 		maptoworknum.sort(function(a, b){return a - b});
			// 		mapworking = setInterval(mapdonum,3000);
			// 	}
			//
			// }
			$(this).removeClass("fa-play").addClass("fa-pause")
			$(this).attr('aria-hidden',false)
			mapworking = setInterval(mapdonum,6000);
		} else {
			clearInterval(mapworking);
			Map.removeLayer('SetTopBoxFlag');
			$('#sxtshow').attr("style","display:none");
			Map.removeLayer('shipinjiankong');
			Map.removeLayer('letnum');
			Map.removeLayer('baseplace');
			$('#sctyshow').attr("style","display:none");
			Map.removeLayer('baseplace');
			Map.removeLayer('alarmnum');
			mapnum = 0;
		}

    }

    function mapdowork(num) {
		Map.removeLayer('SetTopBoxFlag');
		$('#sxtshow').attr("style","display:none");
		Map.removeLayer('shipinjiankong');
		Map.removeLayer('letnum');
		Map.removeLayer('baseplace');
		$('#sctyshow').attr("style","display:none");
		Map.removeLayer('baseplace');
		Map.removeLayer('alarmnum');
        switch (num) {
            case 1:   //重点人员
				$("#alarm").removeClass("selected");
				$("#keypeople").addClass("selected");
				$.getJSON('' + ctx + '/sys/policemap/getKeyPeopleNum', function (data) {
					Map.addJSON1([{
						'type': 'keypeopleBox',
						'id': 'SetTopBoxFlag',
						'data': data,
						'isShow': true
					}])
					// var map = Map.map;
					// map.getView().setZoom(12);
					// Map.goTo(["113.600011373", "34.50186483919"])
				})
                break;
            case 2:  //视频监控
				$("#keypeople").removeClass("selected");
				$("#shipinjiankong").addClass("selected");
				$('#sxtshow').attr("style","display:block");
                $.getJSON('' + ctx + '/sys/policemap/deviceiveMap', function (data) {
                    Map.addPoliceOffice([{
                        'type': 'videos',
                        'id': 'SetTopBoxFlag',
                        'data': data,
                        'isShow': true
                    }])
                })
                break;
            case 3:  //出租屋
				$("#shipinjiankong").removeClass("selected");
				$("#getLet").addClass("selected");
				$.getJSON('' + ctx + '/sys/policemap/getLetNum', function (data) {
					Map.addJSON1([{
						'type': 'letnumBox',
						'id': 'letnum',
						'data': data,
						'isShow': true
					}])
				})
                break;
            case 4:  //场所特业
				$("#getLet").removeClass("selected");
				$("#baseplace").addClass("selected");
				$('#sctyshow').attr("style","display:block");
				$.getJSON('' + ctx + '/sys/policemap/getBasePlaceMap', function (data) {
					Map.addPoliceOffice([{
						'type': 'broadcast',
						'id': 'baseplace',
						'data': data,
						'isShow': true
					}])
					// var map = Map.map;
					// map.getView().setZoom(11);
					// Map.goTo(["113.3586326175677", "34.53555866426642"])
				})
                break;
            case 5:  //警情事件
				$("#baseplace").removeClass("selected");
				$("#alarm").addClass("selected");
				$.getJSON('' + ctx + '/sys/policemap/getAlarm', function (data) {
					Map.addJSON1([{
						'type': 'alarmnumBox',
						'id': 'alarmnum',
						'data': data,
						'isShow': true
					}])
				})
				// var map = Map.map;
				// map.getView().setZoom(12);
				// Map.goTo(["113.600011373", "34.50186483919"])
                break;
        }
    }





</script>


