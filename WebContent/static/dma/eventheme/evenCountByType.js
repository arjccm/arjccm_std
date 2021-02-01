var  beginHappenDate = '' ;
var  endHappenDate ='';
$(document).ready(function () {
	countEventPreviewData();
	countEventData();

    //执行一个laydate实例
    laydate.render({
        elem: '#beginHappenDate' //指定元素
       // ,range: true // 开启左右面板范围选择
		,trigger: 'click' //采用click弹出
		,done: function(value, date, endDate){
			//console.log("beginHappenDate",value);//得到日期生成的值，如：2017-08-18
			beginHappenDate = value;
			// console.log(beginHappenDate);//得到日期生成的值，如：2017-08-18
			// console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
			// console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
		}
    });
    laydate.render({
        elem: '#endHappenDate' //指定元素
       // ,range: true // 开启左右面板范围选择
		,trigger: 'click' //采用click弹出
		,done: function(value, date, endDate){
			//console.log("beginHappenDate",value); //得到日期生成的值，如：2017-08-18
			endHappenDate = value;
			// console.log(endHappenDate); //得到日期生成的值，如：2017-08-18
			// console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
			// console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
		}
    });

});
var FontColor = '#647484';
var backgroundColor;
if ($.cookie('theme') == undefined) {
    FontColor = '#647484';
} else if ($.cookie('theme') == 'gradient') {
    FontColor = '#647484';
} else if ($.cookie('theme') == 'black') {
    FontColor = '#fff';
    backgroundColor = "transparent"
}
function getCookie(cname)
{
  var name = cname + "=";
  var ca = document.cookie.split(';');
  for(var i=0; i<ca.length; i++) 
  {
    var c = ca[i].trim();
    if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  }
  return "";
}
var windowsHeight, _fontSize = 14,

_fontSize1 = 26,
breakData = 8;
legendTop = '30%',
radiusData = [90, 65],
lengthECharts = 30;
//var context = "/arjccm/"
/* var	context = $(".context").attr("content"); */
/*var FontColor="#999",backgroundColor="#fff";
var theme=getCookie('theme'); 
if(theme=="black"){
	FontColor="#fff";
	backgroundColor="#0e2a4c";
}
var color;
if(theme=='gradient'){
 color = [ '#1F8BFA', '#E84442', '#FAB736', '#2CC189', '#F9A388', '#77E7F1', '#9E56E9', '#FF7453', '#16DDD3', '#FDB733'];
}
else{
 color = ['#4573a7', '#aa4644', '#89a54e', '#db843d','#4298af', '#93a9d0', '#b9ce96', '#d09392','#a99bbc', '#92c3d4', '#ffdf5f', '#71588f'];
} */
var innerCircleColor ="";
var theme = getCookie('theme');
if(theme == "black"){
	innerCircleColor = "#0e2a4c"
}
if(theme=='gradient'){
	innerCircleColor = "#ffffff"
}
function countEventPreviewData() {
    var data = [{name:'刑事案件',value:19},{name:'治安事件',value:42},{name:'交通事件',value:10},{name:'火警',value:13},{name:'群众求助',value:50},{name:'社会联动',value:49},{name:'群体事件',value:10},{name:'灾害事故',value:14},{name:'举报投诉',value:80},{name:'投诉监督',value:15},{name:'其它报警类别',value:3}];
	showEventPreview(data);
}
function showEventPreview(data){
	// 指定图表的配置项和数据
	var option = {
		// title : {
		// 	text: '事件报警量统计',
		// 	subtext: '预处理事件',
		// 	x:'center'
		// },

		tooltip : {
			trigger: 'item',
			formatter: "{a} <br/>{b} : {c} ({d}%)"
		},
		legend: {
			orient: 'vertical',
			left: 'left',
			data:['刑事案件','治安事件','交通事件','火警','群众求助','社会联动','群体事件','灾害事故','举报投诉','投诉监督','其它报警类别'],
			/*textStyle:{color: '#1F8BFA'}*/
		},
		toolbox: {
			show : true,
			feature : {
				dataView : {show: true, readOnly: false},
				restore : {show: true},
				saveAsImage : {show: true}
			}
		},
		calculable : true,
		series : [
			{
				name:"外圆",
				type:'pie',
				radius : ['0%', '60%'],
				center:['50%', "50%"],
				tooltip: {
					formatter: function (parms) {
						return "";
					}
				},
				itemStyle:{
					color:{
						type: 'radial',
						x: 0.5,
						y: 0.5,
						r: 0.5,
						colorStops: [{
							offset: 0, color: 'rgba(1,124,167,0)' // 0% 处的颜色
						}, {
							offset: 0.93, color: 'rgba(1,124,167,0)' // 0% 处的颜色
						},{
							offset: 1, color: 'rgba(1,124,167,.7)' // 100% 处的颜色
						}],
						global: false // 缺省为 false
					}

				},
				z:5,
				labelLine:{
					show:false
				},
				data: ['100']
			},
			{
				name:"内圆",
				type:'pie',
				radius : ['0%', '25%'],
				center:['50%', "50%"],
				itemStyle:{
					color: innerCircleColor,
					shadowColor:"rgba(1,124,167,1)",
					shadowBlur: 20

				},
				z:3,
				labelLine:{
					show:false
				},
				data: ['100']
			},
			{
				name: '数据',
				type: 'pie',
				radius : ['30%', '55%'],
				center: ['50%', '50%'],
				
				data:data,
				itemStyle: {
					emphasis: {
						shadowBlur: 10,
						shadowOffsetX: 0,
						shadowColor: 'rgba(0, 0, 0, 0.5)'
					}
				},
				z:10
			}],
		color:['#07cdf1','#2875ec','#09a2f1','#ff6803', '#fdde01','#ff747b','#be25c7', '#dd3f60'],
		backgroundColor:'transparent'
	};

	var Barchart = echarts.init(document.getElementById('eventPreviewEcharts'),'theme');
	Barchart.setOption(option);
}
function countEventData() {
    var name = ['中原区','二七区','管城回族区','金水区','上街区','惠济区','中牟县','郑州经济技术开发区','郑州高新技术产业开发区','郑州航空港经济综合实验区','巩义市','荥阳市','新密市','新郑市','登封市'];
    var data = [153,248,263,188,295,130,100,90,233,60,183,167,259,299,103];
	showEvent(name,data);
}
function showEvent(name,data){
    var option = {
        backgroundColor:backgroundColor,
        // title : {
        //     text: '行业类型统计',
        //     textStyle : {
        //         color :FontColor,
        //     }
        // },
        tooltip : {
            trigger: 'axis'
        },
        xAxis : [
            {
                type : 'category',
                data :  name,
                axisLabel: {
                    interval: 0,
                    rotate: 18,
                    textStyle: {    //文字样式
                        fontSize: 10,
                        // fontFamily: 'Microsoft YaHei'
                        color :FontColor,
                    }
                }
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'数据',
                type:'bar',
                data:data,
                markPoint : {
                    data : [

                    ]
                },
                itemStyle:{
                    normal: {
                        color: function(params) {
                            // build a color map as your need.
                            var colorList = [
                                '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                            ];
                            return colorList[params.dataIndex]
                        },
                        label: {
                            show: true,
                            position: 'top',
                            formatter: '{c}'
                        }
                    }
                }
            }
        ]
    };

	var Barchart = echarts.init(document.getElementById('eventEcharts'),'theme');
	Barchart.setOption(option);
}
function queryEventInfo(){

	var begin = new Date(beginHappenDate);
	var end = new Date(endHappenDate);
	if(begin.getTime() > end.getTime()){
		messageAlert("开始时间大于结束时间！", "error");
		return false;
	}
	countEventPreviewData(beginHappenDate,endHappenDate);
	countEventData(beginHappenDate,endHappenDate);
}
