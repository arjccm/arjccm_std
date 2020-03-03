<%@ page contentType="text/html;charset=UTF-8" %>
<style>

</style>

<script src="${ctxStatic}/ol/ol.js"></script>
<script src="${ctxStatic}/d3/d3.v4.min.js"></script>
<script src="${ctxStatic}/modules/map/js/mapconfig.js"></script>
<script src="${ctxStatic}/policeOfficeBI/js/policeOffice.js"></script>
<script src="${ctxStatic}/mapv/mapv.min.js"></script>
<script src="${ctxStatic}/supermapopenlayers/iclient-openlayers.min.js"></script>

<section>
	<%--<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p>实有人口数据总汇</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>--%>
	<div class="box_content">
		123456


	</div>

	<div id="pubMap"></div>
	<div id="mapMask" class="map"></div>

</section>
<script>
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
	streetFlag = true;
	communityFlag = false;
	gridFlag = false;
	// 基础颜色表
	var color = ['#CA410B', '#12B3B6', '#A269C6', '#883CBD', '#401EC3', '#4366D9',
		'#D26320', '#06AC7D', '#b9ce96', '#a99bbc', '#92c3d4', '#ffdf5f'];
	$(function () {
		//年月日
		$('#calendarYear').html(year)
		$('#calendarMonth').html(month)
		$('#calendarDay').html(day)

		var context = $(".context").attr("content");
		var noCache = new Date();

		/********************地图***********************/
		//地图
		map();
		//街道画线
		// lightLine();
		//初始化网格
		// initorgAreaMap();

		$('#main').height($(window).height());
		$('.height100').height($('#main').height() - 70);
		windowsHeight = $(window).width();
		if (windowsHeight >= 1680 && windowsHeight < 1920) {
			_fontSize = 14;
			radiusData = ['40%', '60%'];
			echarts3X = "48%";
			echarts3y = "40%";
			zoom = 14.7;
			centerCoordinate = [117.662920, 39.035650]
			lengthECharts = 30;
			_fontSize1 = 26;
			breakData = 8;
			mapHeigth = '90%'
		} else if (windowsHeight >= 1600 && windowsHeight < 1680) {
			_fontSize = 12;
			radiusData = ['40%', '60%'];
			echarts3X = "48%";
			echarts3y = "35%";
			zoom = 14.4;
			ItemGap = 0;
			centerCoordinate = [117.662920, 39.035650]
			lengthECharts = 30;
			_fontSize1 = 26;
			breakData = 8;
			mapHeigth = '90%'
		} else if (windowsHeight >= 1440 && windowsHeight < 1660) {
			_fontSize = 12;
			radiusData = ['40%', '58%'];
			zoom = 14.4;
			centerCoordinate = [117.662920, 39.035650]
			lengthECharts = 30;
			_fontSize1 = 26;
			ItemGap = 0;
			_fontSize2 = 18,
					_fontSize3 = 16,
					breakData = 8;
			mapHeigth = '90%'
		} else if (windowsHeight < 1440) {
			_fontSize = 12;
			radiusData = ['40%', '58%'];
			zoom = 14.1;
			centerCoordinate = [117.662920, 39.035650]
			lengthECharts = 30;
			_fontSize1 = 26;
			ItemGap = -10;
			_fontSize2 = 16,
					_fontSize3 = 14,
					breakData = 8;
			mapHeigth = '90%'
		}

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

			viewSituationFun(centerCoordinateSituation, zoomPop)  //view 初始化
			Map = new ArjMap.Map(defaultPrams);
			// 加载地图
			Map.drawMapSituationKeShiHua();
			Pubmap = Map.map;
			/*	var zuobiao=[ 117.655920, 39.038050 ];
                var zuobiao1=[ 117.653920, 39.035050 ];
                var zuobiao2=[ 117.663920, 39.042050 ];
                Map.postcomposeOlIndex('紧急',zuobiao,"123",'0')
                Map.postcomposeOlIndex('紧急',zuobiao1,"1234",'0')
                Map.postcomposeOlIndex('紧急',zuobiao2,"12345",'0')*/

			// 监听地图层级变化
			Pubmap.getView().on('change:resolution', checkZoom);// checkZoom为调用的函数
			function checkZoom(map_level) {
				var zoom = Pubmap.getView().getZoom();
				if (Pubmap.getView().getZoom() <= 10) {
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
				}
			}
		}


		// EchartType 转换成 Echart所需要的类型
		$.ToConvertA = function (object) {
			var ajaxData = new Array();
			for (var one in object) {
				ajaxData.push({
					"name": object[one]["type"],
					"value": Number(object[one]["value"])
				});
			}
			return ajaxData;
		}

		Map.selectQueryInit(); //框选查询
		document.onkeydown = function (e) {
			//屏蔽F11 改为调用全屏方法
			if (e && e.keyCode == 122) {
				Map.fullScreen();
				event.returnValue = false;
			}
		}

		$('#main').height($(window).height());
		$('.height100').height($('#main').height() - 70);
		windowsHeight = $(window).width();
		if (windowsHeight >= 1680 && windowsHeight < 1920) {
			_fontSize = 14;
			radiusData = ['40%', '60%'];
			echarts3X = "48%";
			echarts3y = "40%";
			zoom = 14.7;
			centerCoordinate = [117.662920, 39.035650]
			lengthECharts = 30;
			_fontSize1 = 26;
			breakData = 8;
			mapHeigth = '90%'
		} else if (windowsHeight >= 1600 && windowsHeight < 1680) {
			_fontSize = 12;
			radiusData = ['40%', '60%'];
			echarts3X = "48%";
			echarts3y = "35%";
			zoom = 14.4;
			ItemGap = 0;
			centerCoordinate = [117.662920, 39.035650]
			lengthECharts = 30;
			_fontSize1 = 26;
			breakData = 8;
			mapHeigth = '90%'
		} else if (windowsHeight >= 1440 && windowsHeight < 1660) {
			_fontSize = 12;
			radiusData = ['40%', '58%'];
			zoom = 14.4;
			centerCoordinate = [117.662920, 39.035650]
			lengthECharts = 30;
			_fontSize1 = 26;
			ItemGap = 0;
			_fontSize2 = 18,
					_fontSize3 = 16,
					breakData = 8;
			mapHeigth = '90%'
		} else if (windowsHeight < 1440) {
			_fontSize = 12;
			radiusData = ['40%', '58%'];
			zoom = 14.1;
			centerCoordinate = [117.662920, 39.035650]
			lengthECharts = 30;
			_fontSize1 = 26;
			ItemGap = -10;
			_fontSize2 = 16,
					_fontSize3 = 14,
					breakData = 8;
			mapHeigth = '90%'
		}
	})

	//框选查询
	function boxSelectionDevice(data, type) {
		var url = "";
		if (type == "circle") {
			url = ctx + '/sys/map/showSelect?x=' + data.centerX + '&y=' + data.centerY + '&radius=' + data.radius;
		} else {
			url = ctx + '/sys/map/showSelect?points1=' + data.xyList;
		}
		$.getJSON(url, function (val) {
			var html = "";
			html += '<div class="layer-common" style="width: 100%;height: 100%; position: relative;padding: 14px 0 0 0;">'
			html += '<div class="layer-common-header" style="top: 1px; left: 36px;display: inline-block; padding: 5px 30px; border: 1px solid #0343a3; transform: skew(-20deg); background: #0343a3;color: #fff; font-weight: bold; position: absolute; z-index: 9999;">'
			html += '<div style=" transform: skew(20deg); white-space: nowrap;font-size: 15px;">框选查询</div>'
			html += '</div>'
			html += '<div class="layer-show  layer-common-center" style="padding: 15px 10px 5px 10px; width: 100%;height: 100%;  border: 1px solid #10559a;background: rgba(36,105,187, 0.6) url('
					+ ctxStatic
					+ '/common/index/images/showbg.png);background-size: 100% 100%;">'
			html += '<table style="width:100%;height:100%;">';
			html += '<tr>';
			html += '<td>框选区域总人口数：</td>';
			html += '<td>' + val.sumPeople + '</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td>重点人员数量：</td>';
			html += '<td>' + val.pNum + '</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td>学校数量：</td>';
			html += '<td>' + val.sumSchool + '</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td>警务工作站数量：</td>';
			html += '<td>' + val.sumPoliceRoom + '</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td>工作人员数量：</td>';
			html += '<td>' + val.sumPolice + '</td>';
			html += '</tr>';
			html += '</table>';
			html += '</div>'
			html += '</div>'
			layer.open({
				type: 1,
				shade: false,
				title: false, // 不显示标题
				area: ["300", "200px"],
				skin: 'myskin',
				move: '.layer-common-header',
				resize: false,
				fixed: false,
				id: "showSelect",
				content: html,
				cancel: function () {
					Map.clearShape();
					// 关闭事件

				}
			});

		})
	}


	//地图网格数据初始化
	function initorgAreaMap() {
		$.getJSON('' + ctx + '/sys/map/orgAreaMap?type=1', function (data) {
			Map.addJSON1([{
				'type': 'communitys',
				'data': data,
				'isShow': communityFlag,
			}]);
			// addconver(data); //添加遮罩层
		})

		$.getJSON('' + ctx + '/sys/map/orgAreaMap?type=2', function (data) {
			Map.addJSON1([{
				'type': 'grids',
				'data': data,
				'isShow': gridFlag
			}])
		})

		$.getJSON('' + ctx + '/sys/map/orgAreaMap?type=4', function (data) {
			Map.addJSON1([{
				'type': 'streets',
				'data': data,
				'isShow': streetFlag
			}])
		})
	}


	/********************地图End***********************/
	/********************下方菜单***********************/
	var xuexiaoFlag = true;
	var idArrxuexiao = [];

	function xuexiaoFun(_this) {

		var centpoint = [];
		if (xuexiaoFlag) {
			$.getJSON('' + ctx + '/sys/map/ccmOrgNpseMap?type=32', function (data) {
				centpoint = data.centpoint;
				var features = data.features;
				var len = features.length;
				idArrxuexiao = [];
				if (len > 0) {
					for (var i = 0; i < len; i++) {
						idArrxuexiao.push(features[i].id);
					}
				}
				Map.addJSON3([{
					'type': 'Shortcut',
					'data': data,
					'id': 'xuexiao',
					'isShow': true
				}])

			})
			$(_this).css('border', '1px solid #0e54a9')
			//Map.goTo(centpoint)
		} else {
			$(_this).css('border', '1px solid transparent');
			$.each(idArrxuexiao, function (index, val) {
				Pubmap.removeOverlay(Map['' + val + 'Overlay'])
			});
			Map.removeLayer('xuexiao');
		}
		xuexiaoFlag = !xuexiaoFlag;
	}

	//医院
	var yiyuanFlag = true;
	var publicPlaceFlag = true;
	var idArryiyuan = [];

	function yiyuanFun(_this) {
		if (yiyuanFlag) {
			// $.getJSON('' + ctx + '/sys/map/ccmOrgCommonalityMap?type=2', function (
			$.getJSON('' + ctx + '/sys/map/findMapIndustry?type=2', function (
					data) {
				var features = data.features;
				var len = features.length;
				idArryiyuan = [];
				if (len > 0) {
					for (var i = 0; i < len; i++) {
						idArryiyuan.push(features[i].id);
					}
				}
				Map.addJSON3([{
					'type': 'Shortcut',
					'data': data,
					'id': 'yiyuan',
					'isShow': true
				}])

			})
			$(_this).css('border', '1px solid #0e54a9')
			/*	Map.goTo([ "113.36105768169675", "34.54275331326893" ])*/
		} else {
			$.each(idArryiyuan, function (index, val) {
				Pubmap.removeOverlay(Map['' + val + 'Overlay'])
			});
			$(_this).css('border', '1px solid transparent');
			Map.removeLayer('yiyuan');
		}
		yiyuanFlag = !yiyuanFlag;
	}

	var jingcheFlag = true;

	function jingcheFun(_this) {
		if (jingcheFlag) {
			$.getJSON('' + ctx + '/sys/map/ccmOrgCommonalityMap?type=2', function (
					data) {
				Map.addJSON1([{
					'type': 'DanDian',
					'data': data,
					'id': 'jingche',
					'isShow': true
				}])
			})

			$(_this).css('border', '1px solid #0e54a9')
		} else {
			$(_this).css('border', '1px solid transparent')
			Map.removeLayer('jingche');
		}
		jingcheFlag = !jingcheFlag;
	}

	//警员
	var jingyuanFlag = true;

	function jingyuanFun(_this) {
		if (jingyuanFlag) {
			$.getJSON('' + ctx + '/sys/map/deviceMobileMap', function (data) {
				Map.addJSON1([{
					'type': 'PopLocation',
					'id': 'jingyuan',
					'data': data,
					'isShow': true
				}]);
			})
			Map.layersIsShow('PopLocation', true);
			$(_this).css('border', '1px solid #0e54a9');
		} else {
			$(_this).css('border', '1px solid transparent')
			Map.removeLayer('jingyuan');
		}
		jingyuanFlag = !jingyuanFlag;
	}

	var jiayouzhanFlag = true;
	var idArrjiayouzhan = [];

	function jiayouzhanFun(_this) {
		if (jiayouzhanFlag) {
			$.getJSON('' + ctx + '/sys/map/findMapIndustry?type=1', function (data) {
				if (data != null) {
					var features = data.features;
					var len = features.length;
					idArrjiayouzhan = [];
					if (len > 0) {
						for (var i = 0; i < len; i++) {
							idArrjiayouzhan.push(features[i].id);
						}
					}
				}
				Map.addJSON3([{
					'type': 'Shortcut',
					'id': 'jiayouzhan',
					'data': data,
					'isShow': true
				}])
			})

			$(_this).css('border', '1px solid #0e54a9');
			//Map.goTo([ "113.39035820960999", "34.528061628341675" ])
		} else {
			$.each(idArrjiayouzhan, function (index, val) {
				Pubmap.removeOverlay(Map['' + val + 'Overlay'])
			});
			$(_this).css('border', '1px solid transparent')
			Map.removeLayer('jiayouzhan');
		}
		jiayouzhanFlag = !jiayouzhanFlag;
	}

	//商场超市
	var shangchangFlag = true;
	var idArrshangchang = [];

	function shangchangFun(_this) {
		if (shangchangFlag) {
			$.getJSON('' + ctx + '/sys/map/findMapIndustry?type=2', function (data) {
				if (data != null) {
					var features = data.features;
					var len = features.length;
					idArrshangchang = [];
					if (len > 0) {
						for (var i = 0; i < len; i++) {
							idArrshangchang.push(features[i].id);
						}
					}
				}
				Map.addJSON3([{
					'type': 'Shortcut',
					'id': 'shangchang',
					'data': data,
					'isShow': true
				}])
			})
			$(_this).css('border', '1px solid #0e54a9');
		} else {
			$.each(idArrshangchang, function (index, val) {
				Pubmap.removeOverlay(Map['' + val + 'Overlay'])
			});
			$(_this).css('border', '1px solid transparent')
			Map.removeLayer('shangchang');
		}
		shangchangFlag = !shangchangFlag;
	}

	//娱乐场所
	var yuleFlag = true;
	var idArryule = [];

	function yuleFun(_this) {
		if (yuleFlag) {
			$.getJSON('' + ctx + '/sys/map/findMapIndustry?type=3', function (data) {
				if (data != null) {
					var features = data.features;
					var len = features.length;
					idArryule = [];
					if (len > 0) {
						for (var i = 0; i < len; i++) {
							idArryule.push(features[i].id);
						}
					}
				}
				Map.addJSON3([{
					'type': 'Shortcut',
					'id': 'yule',
					'data': data,
					'isShow': true
				}])
			})
			$(_this).css('border', '1px solid #0e54a9');
		} else {
			$.each(idArryule, function (index, val) {
				Pubmap.removeOverlay(Map['' + val + 'Overlay'])
			});
			$(_this).css('border', '1px solid transparent')
			Map.removeLayer('yule');
		}
		yuleFlag = !yuleFlag;
	}

	//酒店宾馆
	var binguanFlag = true;
	var idArrbinguan = [];

	function binguanFun(_this) {
		var id = 0;
		if (binguanFlag) {
			$.getJSON('' + ctx + '/sys/map/findMapIndustry?type=4', function (data) {
				if (data != null) {
					id = data.id;
					var features = data.features;
					var len = features.length;
					idArrbinguan = [];
					if (len > 0) {
						for (var i = 0; i < len; i++) {
							idArrbinguan.push(features[i].id);
						}
					}
				}
				Map.addJSON3([{
					'type': 'Shortcut',
					'id': 'binguan',
					'data': data,
					'isShow': true
				}])
			})
			$(_this).css('border', '1px solid #0e54a9');
		} else {
			$.each(idArrbinguan, function (index, val) {
				Pubmap.removeOverlay(Map['' + val + 'Overlay'])
			});
			$(_this).css('border', '1px solid transparent');
			Map.removeLayer('binguan');
		}

		binguanFlag = !binguanFlag;
	}

	//涉危涉爆
	var sheweishebaoFlag = true;
	var idArrsheweishebao = [];

	function sheweishebaoFun(_this) {
		if (sheweishebaoFlag) {
			$.getJSON('' + ctx + '/sys/map/findMapIndustry?type=5', function (data) {
				if (data != null) {
					var features = data.features;
					var len = features.length;
					idArrsheweishebao = [];
					if (len > 0) {
						for (var i = 0; i < len; i++) {
							idArrsheweishebao.push(features[i].id);
						}
					}
				}
				Map.addJSON3([{
					'type': 'Shortcut',
					'id': 'sheweishebao',
					'data': data,
					'isShow': true
				}])
			})
			$(_this).css('border', '1px solid #0e54a9');
		} else {
			$.each(idArrsheweishebao, function (index, val) {
				Pubmap.removeOverlay(Map['' + val + 'Overlay'])
			});
			$(_this).css('border', '1px solid transparent')
			Map.removeLayer('sheweishebao');
		}
		sheweishebaoFlag = !sheweishebaoFlag;
	}

	//警务室
	var jingwushiFlag = true;
	var idArrjingwushi = [];

	function jingwushiFun(_this) {
		if (jingwushiFlag) {
			Map.removeLayer('policeroom');
			$.getJSON('' + ctx + '/sys/map/orgCommonlityMap?type=10', function (data) {
				// var features=data.features;
				// var len=features.length;
				// idArrjingwushi=[];
				// if(len>0){
				// 	for(var i=0;i<len;i++){
				// 		idArrjingwushi.push(features[i].id);
				// 	}
				// }
				Map.addJSON1([{
					'type': 'policeroom',
					'id': 'jingwushi',
					'data': data,
					'isShow': true
				}])
			})
			$(_this).css('border', '1px solid #0e54a9');
		} else {
			// $.each(idArrjingwushi,function(index,val){
			// 	Pubmap.removeOverlay(Map[''+val+'Overlay'])
			// });
			$(_this).css('border', '1px solid transparent');
			Map.removeLayer('jingwushi');
		}
		jingwushiFlag = !jingwushiFlag;
	}

	//工作站
	var gongzuozhanFlag = true;
	var idArrgongzuozhan = [];

	function gongzuozhanFun(_this) {
		if (gongzuozhanFlag) {
			Map.removeLayer('workstation');
			$.getJSON('' + ctx + '/sys/map/orgCommonlityMap?type=11', function (data) {
				var features = data.features;
				var len = features.length;
				idArrgongzuozhan = [];
				if (len > 0) {
					for (var i = 0; i < len; i++) {
						idArrgongzuozhan.push(features[i].id);
					}
				}
				Map.addJSON1([{
					'type': 'workstation',
					'id': 'gongzuozhan',
					'data': data,
					'isShow': true
				}])
			})
			$(_this).css('border', '1px solid #0e54a9');
		} else {
			$.each(idArrgongzuozhan, function (index, val) {
				Pubmap.removeOverlay(Map['' + val + 'Overlay'])
			});
			$(_this).css('border', '1px solid transparent')
			Map.removeLayer('gongzuozhan');
		}

		gongzuozhanFlag = !gongzuozhanFlag;

	}

	//视频监控
	var shipinjiankongFlag = true;

	function shipinjiankongFun(_this) {
		if (shipinjiankongFlag) {
			$.getJSON('' + ctx + '/sys/map/deviceiveMap', function (data) {
				Map.addJSON1([{
					'type': 'videos',
					'id': 'shipinjiankong',
					'data': data,
					'isShow': true
				}])
			})
			$(_this).css('border', '1px solid #0e54a9');
			$(_this).attr('VideoFlagAttr', true);
		} else {
			$(_this).css('border', '1px solid transparent');
			$(_this).attr('VideoFlagAttr', false);
			Map.removeLayer('shipinjiankong');
		}
		shipinjiankongFlag = !shipinjiankongFlag;
	}

	//广播站
	var broadcastFlag = true;

	function guangbozhanFun(_this) {
		if (broadcastFlag) {
			$.getJSON('' + ctx + '/sys/map/deviceBroadcastMap', function (data) {
				Map.addJSON1([{
					'type': 'broadcast',
					'id': 'guangbozhan',
					'data': data,
					'isShow': true
				}])
			})
			$(_this).css('border', '1px solid #0e54a9');
		} else {
			$(_this).css('border', '1px solid transparent');
			Map.removeLayer('guangbozhan');
		}
		broadcastFlag = !broadcastFlag;
	}

	//机顶盒
	var SetTopBoxFlag = true;

	function SetTopBoxFun(_this) {
		if (SetTopBoxFlag) {
			$.getJSON('' + ctx + '/sys/map/buildBox', function (data) {
				Map.addJSON1([{
					'type': 'topBox',
					'id': 'SetTopBoxFlag',
					'data': data,
					'isShow': true
				}])
			})
			$(_this).css('border', '1px solid #0e54a9');
		} else {
			$(_this).css('border', '1px solid transparent');
			Map.removeLayer('SetTopBoxFlag');
		}
		SetTopBoxFlag = !SetTopBoxFlag;
	}

	//疫情人员信息
	var PeopleAntiepidemicFlag = true;
	function getpeopleAntiepidemic(_this) {
		if (PeopleAntiepidemicFlag) {
			$.getJSON('' + ctx + '/sys/map/getpeopleAntiepidemic', function (data) {
				// Map.addJSON1([{
				//     'type': 'antiepidemictype',
				//     'id': 'PeopleAntiepidemic',
				//     'data': data,
				//     'isShow': true
				// }])
				for (var i in data.features){
					data.features[i].properties['nameNum']=''+(Number(i)+1)+'';
					// data.features[i].properties['nameNum'] = data.features[i].properties['info']["姓名"];
				}
				Map.addGIS([{
					'type': 'antiepidemictype',
					'id': 'PeopleAntiepidemic',
					'data': data,
					'isShow': true
				}])
			})
			$(_this).css('border', '1px solid #0e54a9');
		} else {
			$(_this).css('border', '1px solid transparent');
			Map.removeLayer('PeopleAntiepidemic');
		}
		PeopleAntiepidemicFlag = !PeopleAntiepidemicFlag;
	}



	/***************************下方菜单End****************************/
	//详情弹框--不刷新父页面
	function LayerDialog(src, title, height, width) {
		layerIndex = parent.layer.open({
			type: 2,
			title: title,
			area: [height, width],
			fixed: true, //固定
			maxmin: true,
			id: 'LayerDialog',
			//btn: [ '确定',  '关闭'], //可以无限个按钮
			content: src,
			zIndex: '1992',
			skin:"mySkin"
		});

	}

	function getMapInfo() {
		var formType = $("#formType").val();
		var areaId = $("#areaId").val();
		var formName = $("#formName").val();
		if(formType == 1 || formType == 2){
			if($('#areaName').val() == null || $('#areaName').val() == "" || $('#areaName').val() == undefined){
				// parent.layer.msg("请选择辖区范围!");
				$.jBox.tip('请选择辖区范围!');
				return;
			}
		}
		//清除已有图层
		removeMapvList();

		switch (formType) {
				//renkou
			case "1":
				var methods = {
					click: function (item) {
						if (item) {
							LayerDialog(ctx + '/pop/ccmPeople/mapvForm?id=' + item.id, '人员信息', '1100px', '300px');
						}
					}
				};
				simpleColor(formType, areaId, formName, methods);
				return;
				//loudong
			case "2":
				var methods = {
					click: function (item) {
						if (item) {
							LayerDialog(ctx + '/house/ccmHouseBuildmanage/mapvForm?id=' + item.id, '楼栋信息', '1100px', '750px');
						}
					}
				};
				simpleColor(formType, areaId, formName, methods);
				return;
				//chuzuwu
			case "3":
				var methods = {
					click: function (item) {
						if (item) {
							LayerDialog(ctx + '/pop/ccmPopTenant/mapvForm?id=' + item.id, '出租屋信息', '1100px', '750px');
						}
					}
				};
				simpleColor(formType, areaId, formName, methods);
				return;
				//chengshibujian
			case "4":
				var methods = {
					click: function (item) {
						if (item) {
							LayerDialog(ctx + '/citycomponents/ccmCityComponents/mapvForm?id=' + item.id, '城市部件信息', '1100px', '600px');
						}
					}
				};
				moreColor(formType, areaId, formName, methods);
				return;
				//qiye
			case "5":
				var methods = {
					click: function (item) {
						if (item) {
							LayerDialog(ctx + '/org/ccmOrgNpse/mapvForm?id=' + item.id, '企业信息', '1100px', '700px');
						}
					}
				};
				moreColor(formType, areaId, formName, methods);
				return;
				//zhongdianrenyuan
			case "6":
				var methods = {
					click: function (item) {
						if (item) {
							var title = '重点人员信息';
							console.info("item", item);
							// 是否留守
							if (item.type == 1) {
								title = "留守人员信息";
							}
							// 是否安置帮教
							if (item.type == 2) {
								title = "安置帮教人员信息";
							}
							// 是否社区矫正
							if (item.type == 3) {
								title = "社区矫正人员信息";
							}
							// 是否艾滋病患者
							if (item.type == 4) {
								title = "艾滋病患者人员信息";
							}
							// 是否肇事肇祸等严重精神障碍患者
							if (item.type == 5) {
								title = "肇事肇祸等严重精神障碍患者信息";
							}
							// 是否重点青少年
							if (item.type == 6) {
								title = "重点青少年人员信息";
							}
							// 是否吸毒
							if (item.type == 7) {
								title = "吸毒人员信息";
							}
							//是否危害国家安全
							if (item.type == 8) {
								title = "危害国家安全人员信息";
							}
							//是否故意犯法释放
							if (item.type == 9) {
								title = "故意犯法释放人员信息";
							}
							//是否严重犯罪嫌疑
							if (item.type == 10) {
								title = "严重犯罪嫌疑人员信息";
							}
							//是否在逃
							if (item.type == 11) {
								title = "在逃人员信息";
							}
							// 是否重点上访
							if (item.type == 12) {
								title = "重点上访人员信息";
							}
							// 是否涉教
							if (item.type == 13) {
								title = "涉教人员信息";
							}
							// 是否危险品从业人员
							if (item.type == 14) {
								title = "危险品从业人员信息";
							}
							LayerDialog(ctx + '/pop/ccmPeople/mapvForm?id=' + item.id, title, '1100px', '300px');
						}
					}
				};
				moreColor(formType, areaId, formName, methods);
				return;
				//shijian
			case "7":
				var methods = {
					click: function (item) {
						if (item) {
							LayerDialog(ctx + '/event/ccmEventIncident/mapvForm?id=' + item.id, '事件信息', '1100px', '600px');
						}
					}
				};
				moreColor(formType, areaId, formName, methods);
				return;
				//shipin
			case "8":
				var methods = {
					click: function (item) {
						if (item) {
							LayerDialog(ctx + '/ccmsys/ccmDevice/mapvForm?id=' + item.id, '监控信息', '1100px', '700px');
						}
					}
				};
				simpleColor(formType, areaId, formName, methods);
				return;
		}
	}

	function simpleColor(formType, areaId, formName, methods) {
		//查询人口信息
		$.getJSON(ctx + '/sys/map/queryAreaPoint?type=' + formType + '&areaId=' + areaId + '&name=' + formName, function (data) {
			if (data == null || data == "" || data == undefined) {
				$.jBox.tip('暂无数据！');
				return;
			}
			;
			var mapData = [];
			if (data.length > 0) {
				for (var i = 0; i < data.length; i++) {
					if (data[i].id && data[i].areaPoint) {
						var areaPoint = new Array(); //定义一数组
						areaPoint = data[i].areaPoint.split(",");
						mapData.push({
							geometry: {
								type: 'Point',
								coordinates: areaPoint,
							},
							id: data[i].id,
							// count: parseInt(Math.random() * 10)
						});
					}
				}
				simplePoint(mapData, methods);
			}
		})
	}

	var mapvOptionsBlue = {
		fillStyle: 'rgba(50, 50, 255, 0.6)',
		shadowColor: 'rgba(50, 50, 255, 1)',
		shadowBlur: 30,
		globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsRed = {
		fillStyle: 'rgba(255, 50, 50, 0.6)',
		shadowColor: 'rgba(255, 50, 50, 1)',
		shadowBlur: 30,
		globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsBlueGreen = {
		fillStyle: 'rgba(0,245,222, 0.6)',
		shadowColor: 'rgba(0,245,222, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsYellow = {
		fillStyle: 'rgba(255, 255, 0, 0.6)',
		shadowColor: 'rgba(255, 255, 0, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsPink = {
		fillStyle: 'rgba(255, 146, 149, 0.6)',
		shadowColor: 'rgba(255, 146, 149, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsFlesh = {
		fillStyle: 'rgba(255, 241, 193, 0.6)',
		shadowColor: 'rgba(255, 241, 193, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsDarkBlue = {
		fillStyle: 'rgba(110, 176, 253, 0.6)',
		shadowColor: 'rgba(110, 176, 253, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor1 = {
		fillStyle: 'rgba(55, 162, 218, 0.6)',
		shadowColor: 'rgba(55, 162, 218, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor2 = {
		fillStyle: 'rgba(50, 197, 233, 0.6)',
		shadowColor: 'rgba(50, 197, 233, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor3 = {
		fillStyle: 'rgba(103, 224, 227, 0.6)',
		shadowColor: 'rgba(103, 224, 227, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor4 = {
		fillStyle: 'rgba(159, 230, 184, 0.6)',
		shadowColor: 'rgba(159, 230, 184, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor5 = {
		fillStyle: 'rgba(255, 219, 92, 0.6)',
		shadowColor: 'rgba(255, 219, 92, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor6 = {
		fillStyle: 'rgba(255, 159, 127, 0.6)',
		shadowColor: 'rgba(255, 159, 127, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor7 = {
		fillStyle: 'rgba(251, 114, 147, 0.6)',
		shadowColor: 'rgba(251, 114, 147, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor8 = {
		fillStyle: 'rgba(224, 98, 174, 0.6)',
		shadowColor: 'rgba(224, 98, 174, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor9 = {
		fillStyle: 'rgba(238, 114, 229, 0.6)',
		shadowColor: 'rgba(238, 114, 229, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor10 = {
		fillStyle: 'rgba(231, 188, 243, 0.6)',
		shadowColor: 'rgba(231, 188, 243, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor11 = {
		fillStyle: 'rgba(157, 150, 245, 0.6)',
		shadowColor: 'rgba(157, 150, 245, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor12 = {
		fillStyle: 'rgba(131, 120, 184, 0.6)',
		shadowColor: 'rgba(131, 120, 184, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsColor13 = {
		fillStyle: 'rgba(150, 190, 255, 0.6)',
		shadowColor: 'rgba(150, 190, 255, 1)',
		shadowBlur: 30,
		// globalCompositeOperation: 'lighter',
		methods: {
			click: function (item) {
				console.log(item);
			}
		},
		size: 5,
		draw: 'simple'
	}
	var mapvOptionsList = [mapvOptionsBlue, mapvOptionsRed, mapvOptionsBlueGreen, mapvOptionsYellow,
		mapvOptionsPink, mapvOptionsFlesh, mapvOptionsDarkBlue, mapvOptionsColor1, mapvOptionsColor2,
		mapvOptionsColor3, mapvOptionsColor4, mapvOptionsColor5, mapvOptionsColor6, mapvOptionsColor7,
		mapvOptionsColor8, mapvOptionsColor9, mapvOptionsColor10, mapvOptionsColor11, mapvOptionsColor12, mapvOptionsColor13];

	function moreColor(formType, areaId, formName, methods) {

		//查询人口信息
		$.getJSON(ctx + '/sys/map/queryAreaPoint?type=' + formType + '&areaId=' + areaId + '&name=' + formName, function (data) {
			if (data == null || data == "" || data == undefined) {
				$.jBox.tip('暂无数据！');
				return;
			}
			;
			var mapData = [];
			// var colorList = [];
			var colorCount = 0;//颜色列表计数器
			var layerCount = 0;//图层计数器
			var dataList = [];
			if (data.length > 0) {
				for (var i = 0; i < data.length; i++) {
					if (data[i].id && data[i].areaPoint) {
						if (data[i].type) {
							// var pushTemp = 0;//记录要插入的数组
							if (dataList.hasOwnProperty(data[i].type) == false) {
								// colorList.push(data[i].type);
								// colorList[data[i].type] = mapvOptionsList[colorCount];
								dataList[data[i].type] = [];
								// pushTemp =data[i].type;
								// colorCount++;
								// layerCount++
							} else {
								// pushTemp = data[i].type;
							}
							var areaPoint = new Array(); //定义一数组
							areaPoint = data[i].areaPoint.split(",");
							dataList[data[i].type].push({
								geometry: {
									type: 'Point',
									coordinates: areaPoint,
								},
								id: data[i].id,
								type: data[i].type,
								// count: parseInt(Math.random() * 10)
							});
						}
					}
				}
				console.info("dataList", dataList);
				// colorList.forEach(function (value, key, map) {
				//     alert("参数1="+value+",参数2="+key);
				// });
				var colorTemp = 0;
				for (var key in dataList) {
					mapvOptionsList[colorTemp].methods = methods;
					simplePointMoreColor(dataList[key], mapvOptionsList[colorTemp]);
					if (colorTemp >= mapvOptionsList.length) {
						colorTemp = 0;
					} else {
						colorTemp++;
					}

					// var map2 = {};
					// map2.value = data2[key];
					// map2.name = key;
					// data2y[i] = map2;
					// i++;
				}
				// simplePoint(mapData);
			}
		})
	}
	function areaChangeJboxStyle(h) {
		document.getElementById('jbox-iframe').contentWindow.document.body.style.backgroundColor = "transparent";
		document.getElementById('jbox-iframe').contentWindow.document.body.style.color="white";
	}
	function videoChangeJboxStyle(h) {
		document.getElementById('jbox-iframe').contentWindow.document.body.style.backgroundColor = "transparent";
		document.getElementById('jbox-iframe').contentWindow.document.body.style.color="white";
	}

	function videoTreeselectCallBack(v, h, f){
		if (v=="ok"){
			var tree = h.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
			var ids = [], names = [], nodes = [];
			if ("${checked}" == "true"){
				nodes = tree.getCheckedNodes(true);
			}else{
				nodes = tree.getSelectedNodes();
			}
			for(var i=0; i<nodes.length; i++) {
				if(nodes[i].type == "camera"){
					ids.push(nodes[i].id);
					names.push(nodes[i].name);
				}else{
					top.$.jBox.tip("不能选择非监控节点（"+nodes[i].name+"）请重新选择。");
					$("#videoId").val("");
					$("#videoName").val("");
					return false;
				}
			}
			var name = names.join(",");
			var id = ids.join(",").replace(/u_/ig,"");
			if(name == null || name == "" || name == undefined){
				$("#videoId").val("");
				$("#videoName").val("");
				return false;
			}else{
				$("#videoId").val(id);
				$("#videoName").val(names.join(","));
				$('#ccmLiveVideoVisualized').attr("src","/arjccm/a/ccmsys/ccmDevice/getDeviceMap?id=" + id);
				return true;
			}
		}
	}
</script>


