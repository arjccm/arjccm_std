<%@ page contentType="text/html;charset=UTF-8" %>
<style>

</style>
<section>


	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p class="left_p">
				近7天110警情趋势</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div id="policeSentiment" class="box_content" >


	</div>
</section>


<script>
	function initPoliceSentiment(){
		//请求接口并填装数据执行
		$.getJSON(ctx + "/sys/BicMap/sevenDayOfAlarm", function (data) {
			//近7天110警情趋势
			showpPoliceSentiment(data);
		});
		function showpPoliceSentiment(dataX) {
			var policeSentiment = echarts.init(document.getElementById('policeSentiment'));
			var option = {
				tooltip: {
					trigger: 'item',
				},
				legend: {
					data: ['数量', '处理率'],
					textStyle: {
						color: '#FFFFFF'
					},
					left:'25%',
					itemGap:25
				},
				grid: {
					top: '13%',
					left: '1%',
					right: '1%',
					bottom: '1%',
					containLabel: true
				},
				xAxis: [{
					type: 'category',
					data: dataX["lable"],
					//data: data['日期'],
					axisLabel: {
						show: true,
						color: '#FFFFFF',
						rotate:60,
						fontsize: '8px'
					},
					axisLine: {
						lineStyle: {
							color: '#FFFFFF',
							opacity: 0.2
						}
					},
					axisTick: {
						show: false,
					},
				}],
				yAxis: [{
					type: 'value',
					axisLabel: {

						formatter: '{value}',
						color: '#FFFFFF',
						fontsize: '8px'
					},
					splitLine: {
						show: true,
						lineStyle: {
							// 使用深浅的间隔色
							color: '#778C96',
							type:'dashed',
							opacity: 0.2
						},

					},
					axisLine: {
						lineStyle: {
							color: '#FFFFFF',
							opacity: 0.2
						}
					},
					axisTick: {
						show: true,
						lineStyle: {
							color: '#FFF',
							opacity: 0.2
						}
					},

				},
					{
						type: 'value',
						max: 100,
						splitLine: {
							show: false
						},
						axisLabel: {
							formatter: '{value}%',
							color: '#FFFFFF',
							fontsize: '12px'
						},
						axisLine: {
							lineStyle: {
								color: '#FFFFFF',
								opacity: 0.2
							}
						},
						axisTick: {
							show: true,
							lineStyle: {
								color: '#FFF',
								opacity: 0.2
							}
						},
					}
				],
				series: [{
					name: '数量',
					type: 'bar',
					barWidth: '60%',
					//data: data['人数'],
					data: dataX["sum"],

					itemStyle: {
						normal: {
							color: new echarts.graphic.LinearGradient(
									0, 0, 0, 1, [{
										offset: 0,
										color: '#49DBF3'
									},
										{
											offset: 1,
											color: 'rgba(73,219,243,.1)'
										}
									]),
						}

					},
				},
					{
						name: '处理率',
						data: dataX["line"],
						type: 'line',
						symbolSize: 8, // 控制线条上 点 的大小
						yAxisIndex: 1,
						//data: data['新增人数'],
						itemStyle: {
							normal: {
								color: '#C5009F'
							}
						},
						areaStyle:{
							color: new echarts.graphic.LinearGradient(
									0, 0, 0, 1, [{
										offset: 0,
										color: '#C5009F'
									},
										{
											offset: 0.9,
											color: 'transparent '
										}
									]),

							opacity:0.7,
						},
					}
				]
			};
			policeSentiment.setOption(option);
		}
	}
</script>


