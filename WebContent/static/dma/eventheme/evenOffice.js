
var  areaName = [];
var  areaData = [];
$(document).ready(function () {
	countEventAreaData();
});
function countEventAreaData() {

	$.ajax({
		type: "POST",
		url: ctx+"/eventType/dmaEventTypeCount/countOfficeEvent",
		dataType: "json",
		cache: false,
		async: true,
		success: function (data) {
			showEventArea(data);
		}
	});
}
var FontColor = '#647484';
if ($.cookie('theme') == undefined) {
    FontColor = '#647484';
} else if ($.cookie('theme') == 'gradient') {
    FontColor = '#647484';
} else if ($.cookie('theme') == 'black') {
    FontColor = '#fff';
}
function showEventArea(data){
    console.info(data["eventAreaNameData"])
	// 指定图表的配置项和数据
	option = {
		// title : {
		// 	text: '各单位工作量统计',
		// 	subtext: '单位-处理类型',
        //     textStyle : {
        //         color :FontColor,
        //     }
		// },
		tooltip : {
			trigger: 'axis'
		},
		legend: {
			data:data["eventAreaTypeData"],
            textStyle : {
                color : FontColor,
            }
		},
		toolbox: {
			show : true,
			feature : {
				mark : {show: true},
				dataView : {show: true, readOnly: false},
				magicType : {show: true, type: ['line', 'bar']},
				restore : {show: true},
				saveAsImage : {show: true}
			},
			top:'5%',
			right:'5%'
		},
		calculable : true,
		xAxis : [
			{
				type : 'category',
				data : data["eventAreaNameData"],
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: FontColor,
                    }
                }
			}
		],
		yAxis : [
			{
				type : 'value',
                axisLabel : {
                    textStyle: {
                        color: FontColor,
                    }
                }
			}
		],
		series : data["eventAreaData"]
	};
	var Barchart = echarts.init(document.getElementById('eventAreaEcharts'));
	Barchart.setOption(option);
}