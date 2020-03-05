<%@ page contentType="text/html;charset=UTF-8" %>
<style>

</style>
<section>
	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p>特业从业人员</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div class="box_content">
		<div id="pic3" style="width: 230px;height:270px;"></div>
	</div>
</section>
<script>

	var myChart1 = echarts.init(document.getElementById('pic3'));
	var xData = ["快递", "娱乐场所", "网约车", "出租车", "其他"];
	var data = [301, 239, 350, 432, 309, ];
	var maxPlanCourseCnt = Math.max.apply(null, data);

	var option = {

		tooltip: {
			show: "true",
			trigger: "item",
			backgroundColor: "rgba(0,0,0,0.7)", // 背景
			padding: [10, 12], //内边距
			extraCssText: "box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);" //添加阴影
		},
		grid: {
			left: "3%",
			right: "3%",
			top: 30,
			bottom: "20%"
		},
		xAxis: [{
			type: "category",
			axisTick: {
				show: false
			},
			axisLine: {
				show: true,
				lineStyle: {
					color: "#a8e7ff"
				}
			},
			axisLabel: {
				inside: false,
				textStyle: {
					color: "#fff",
					fontWeight: "normal",
					fontSize: "8"
				}
				// formatter:function(val){
				//     return val.split("").join("\n")
				// },
			},
			data: xData
		}],
		yAxis: {
			type: "value",
			show: false,
			max: maxPlanCourseCnt,
			axisTick: {
				show: false
			},
			axisLine: {
				show: true,
				lineStyle: {
					color: "#32346c"
				}
			},
			splitLine: {
				show: true,
				lineStyle: {
					color: "#32346c "
				}
			},
			axisLabel: {
				textStyle: {
					color: "#bac0c0",
					fontWeight: "normal",
					fontSize: "12"
				},
				formatter: "{value}名"
			}
		},
		series: [{
			name: "",
			type: "bar",
			label: {
				normal: {
					show: true,
					color: "#9fcded",
					position: "top",
					fontSize: "12"
				}
			},
			itemStyle: {
				normal: {
					show: true,
					color: function(params) {
						//注意，如果颜色太少的话，后面颜色不会自动循环，最好多定义几个颜色
						var colorList = ['#ee8025','#c435ac', '#17b7d5', '#337cf5', '#df4d66'];
						return colorList[params.dataIndex]
					},
					// barBorderRadius: 1,
					borderWidth: 0,
					shadowBlur: 15,
					// shadowColor: "rgba(105,123, 214, 0.7)"
				}
			},
			zlevel: 2,
			barWidth: "12px",
			data: data
		}]
	};
	myChart1.setOption(option);
</script>


