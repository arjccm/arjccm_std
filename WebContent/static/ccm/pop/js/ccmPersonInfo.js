$(function() {
	// project-Path
	var context = $(".context").attr("content");
	// 初始化 Echarts组件
	var myChart1 = echarts.init(document.getElementById('ech1'), 'walden');
	var myChart2 = echarts.init(document.getElementById('ech2'), 'walden');
	// 标题
	var title1 = [ "本月户籍新增人数", "本月户籍总数" ], title2 = [ "新增户籍人数", "户籍总人数" ];
	// 初始化页面方法
	showEchart();
	// 展示 页面的方法
	function showEchart() {
		// GetJson 获取数据
		$.post(context + "/report/ccmPeopleStat/personStat", {
			title : "户籍",
			type : 0
		}, function(data) {
			// 图表1 数据
			var ajaxDataX1 = $.getxAxisDate(data,title1),ajaxDataYALL1 =$.getyAxisDate(data,title1);
			// 图表2 数据 
			var ajaxDataX2 = $.getxAxisDate(data,title2),ajaxDataYALL2 =$.getyAxisDate(data,title2);
			// 组装图表的Y轴数据
			var seriesDate1 = $.getSeriesDateHuji(title1, ajaxDataYALL1),seriesDate2 = $.getSeriesDateHuji(title2, ajaxDataYALL2);
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
			$.myChartPeople(title1, ajaxDataX1, seriesDate1, myChart1,"户籍人数",40,areaToContent);
			$.myChartPeople(title2, ajaxDataX2, seriesDate2, myChart2,"户籍人数",0,optionToContent);
			// 生成 表单
			$.TableListPeople("echList1", ajaxDataYALL1, ajaxDataX1);
			$.TableListPeople("echList2", ajaxDataYALL2, ajaxDataX2);
		});
	}
});