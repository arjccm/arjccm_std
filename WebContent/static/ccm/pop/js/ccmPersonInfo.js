// 初始化 Echarts组件
var myChart1 = echarts.init(document.getElementById('ech1'), 'walden');
var myChart2 = echarts.init(document.getElementById('ech2'), 'walden');
//初始化下级区域数据,用于点击事件处理
var lowLevelNew;
var lowLevelAll;
var lowLevelLow;
var id;
// 标题
var title1 = [ "本月户籍新增人数", "本月户籍总数", "户籍未采集人数" ], title2 = [ "新增户籍人数", "户籍总人数" ];
$(function() {
	// project-Path
	var context = $(".context").attr("content");

	// 初始化页面方法
	showEchart();
	// 展示 页面的方法
	function showEchart() {
		// GetJson 获取数据
		$.post(context + "/report/ccmPeopleStat/personStat", {
			title : "户籍",
			type : 0
		}, function(data) {
            lowLevelNew = data["所有下级区域本月户籍新增人数"];
            lowLevelAll = data["所有下级区域本月户籍总数"];
            lowLevelLow = data["所有下级区域户籍未采集人数"]
			// 图表1 数据
			var ajaxDataX1 = $.getxAxisDate(data,title1),ajaxDataYALL1 =$.getyAxisDate(data,title1);
			// 图表2 数据 
			var ajaxDataX2 = $.getxAxisDate(data,title2),ajaxDataYALL2 =$.getyAxisDate(data,title2);
			// 组装图表的Y轴数据
			var seriesDate1 = $.getSeriesDateHuji(title1, ajaxDataYALL1),
				seriesDate2 = $.getSeriesDateHuji(title2, ajaxDataYALL2);
			var optionToContent = function(opt) {
				var axisData = opt.xAxis[0].data;
				var series = opt.series;
				var table = '<table class="echartfont" style="width:100%;text-align:center" cellspacing="0" cellpadding="0"><tbody><tr>'
					+ '<td>时间</td>'
					+ '<td>' + series[0].name + '</td>'
					+ '<td>' + series[1].name + '</td>'
					+ '</tr>';
				for (var i = 0, l = axisData.length; i < l; i++) {
					table += '<tr>'
						+ '<td>' + axisData[i] + '</td>'
						+ '<td>' + series[0].data[i] + '</td>'
						+ '<td>' + series[1].data[i] + '</td>'
						+ '</tr>';
				}
				table += '</tbody></table>';
				return table;
			}
			var areaToContent = function(opt) {
				var axisData = opt.xAxis[0].data;
				var series = opt.series;
				var table = '<table class="echartfont" style="width:100%;text-align:center" cellspacing="0" cellpadding="0"><tbody><tr>'
					+ '<td>区域</td>'
					+ '<td>' + series[0].name + '</td>'
					+ '<td>' + series[1].name + '</td>'
					+ '</tr>';
				for (var i = 0, l = axisData.length; i < l; i++) {
					table += '<tr>'
						+ '<td>' + axisData[i] + '</td>'
						+ '<td>' + series[0].data[i] + '</td>'
						+ '<td>' + series[1].data[i] + '</td>'
						+ '</tr>';
				}
				table += '</tbody></table>';
				return table;
			}
			// 生成图表
			$.myChartPeopleAmountHJ(title1, ajaxDataX1, seriesDate1, myChart1,"户籍人数",40,areaToContent);
			$.myChartPeople(title2, ajaxDataX2, seriesDate2, myChart2,"户籍人数变化趋势",0,optionToContent);
			// 生成 表单
			$.TableListPeople("echList1", ajaxDataYALL1, ajaxDataX1);
			$.TableListPeople("echList2", ajaxDataYALL2, ajaxDataX2);
		});
	}

	//点击事件
    myChart1.on('click', function(params) {
        var parentid;
        for (var i = 0; i < lowLevelAll.length ; i++) {
        	if(typeof(id) == "undefined"){
                if(params.value == lowLevelAll[i]["value"] && params.name == lowLevelAll[i]["type"]){
                    parentid = lowLevelAll[i]["value1"];
                    id = lowLevelAll[i]["value1"];
                }
			}else{
                if(params.value == lowLevelAll[i]["value"] && params.name == lowLevelAll[i]["type"] && lowLevelAll[i]["value2"] == id ){
                    parentid = lowLevelAll[i]["value1"];
                    id = lowLevelAll[i]["value1"];
                }
			}
        }
        var listOne = [];
        var listTwo = [];
        var listThr = [];
        var num = 0;
        for (var i = 0; i < lowLevelAll.length ; i++) {
            if(lowLevelAll[i]["value2"] == parentid){
                listOne[num] = lowLevelAll[i];
                num++;
            }
        }
        num = 0;
        for (var i = 0; i < lowLevelNew.length ; i++) {
            if(lowLevelNew[i]["value2"] == parentid){
                listTwo[num] = lowLevelNew[i];
                num++;
            }
        }
        num = 0;
        for (var i = 0; i < lowLevelLow.length ; i++) {
            if(lowLevelLow[i]["value2"] == parentid){
                listThr[num] = lowLevelLow[i];
                num++;
            }
        }
        if(num == 0){
            return;
        }
        var map = {};
        map[title1[1]] = listOne;
        map[title1[0]] = listTwo;
        map[title1[2]] = listThr;
        // 图表1 数据
        var ajaxDataX1 = $.getxAxisDate(map,title1),ajaxDataYALL1 =$.getyAxisDate(map,title1);
        // 组装图表的Y轴数据
        var seriesDate1 = $.getSeriesDateHuji(title1, ajaxDataYALL1);
        var areaToContent = function(opt) {
            var axisData = opt.xAxis[0].data;
            var series = opt.series;
            var table = '<table class="echartfont" style="width:100%;text-align:center" cellspacing="0" cellpadding="0"><tbody><tr>'
                + '<td>区域</td>'
                + '<td>' + series[0].name + '</td>'
                + '<td>' + series[1].name + '</td>'
                + '</tr>';
            for (var i = 0, l = axisData.length; i < l; i++) {
                table += '<tr>'
                    + '<td>' + axisData[i] + '</td>'
                    + '<td>' + series[0].data[i] + '</td>'
                    + '<td>' + series[1].data[i] + '</td>'
                    + '</tr>';
            }
            table += '</tbody></table>';
            return table;
        }
        // 生成图表
        $.myChartPeopleAmountHJ(title1, ajaxDataX1, seriesDate1, myChart1,"户籍人数",40,areaToContent);
        // 生成 表单
        $.TableListPeople("echList1", ajaxDataYALL1, ajaxDataX1);
    });
});