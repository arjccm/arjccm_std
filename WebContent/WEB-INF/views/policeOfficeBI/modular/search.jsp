<%@ page contentType="text/html;charset=UTF-8" %>
<style>

</style>
<section>
	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p>重点单位检查问题</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div class="box_content">
		<div id="pic2" style="width: 10%;height:290px;"></div>
	</div>
</section>
<script>
	var myChart1 = echarts.init(document.getElementById('pic2'));
	var data = [70, 34, 60, 78, 69]
	var titlename = ['单位1', '单位2', '单位3', '单位4', '单位5'];
	var valdata = [683, 234, 234, 523, 345]
	var myColor = ['#32d6ee', '#32d6ee', '#32d6ee', '#32d6ee', '#32d6ee'];
	option = {
		grid:{
			x:55,
			y:10,
			x2:30,
			y2:40,
			borderWidth:10
		},

		// backgroundColor: '#0e2147',
		xAxis: {
			show: false
		},
		yAxis: [{
			show: true,
			data: titlename,
			inverse: true,
			axisLine: {
				show: false
			},
			splitLine: {
				show: false
			},
			axisTick: {
				show: false
			},
			axisLabel: {
				color: '#fff',
				formatter: function(value, index) {
					return [
						'{lg|' + (index + 1) + '}' + '{title|' + value + '} '
					].join('\n')
				},
				rich: {
					lg: {
						backgroundColor: '#32d6ee',
						color: '#fff',
						borderRadius: 0,
						// padding: 5,
						align: 'center',
						width: 15,
						height: 15
					},
				}
			},


		}, {
			show: true,
			inverse: true,
			data: valdata,
			axisLabel: {
				textStyle: {
					fontSize: 12,
					color: '#fff',
				},
			},
			axisLine: {
				show: false
			},
			splitLine: {
				show: false
			},
			axisTick: {
				show: false
			},

		}],
		series: [{
			name: '条',
			type: 'bar',
			yAxisIndex: 0,
			data: data,
			barWidth: 10,
			itemStyle: {
				normal: {
					barBorderRadius: 1,
					color: function(params) {
						var num = myColor.length;
						return myColor[params.dataIndex % num]
					},
				}
			},
			label: {
				normal: {
					show: false,
					position: 'inside',
					formatter: '{c}%'
				}
			},
		}, {
			name: '框',
			type: 'bar',
			yAxisIndex: 1,
			barGap: '-100%',
			data: [100, 100, 100, 100, 100],
			barWidth: 15,
			itemStyle: {
				normal: {
					color: 'none',
					borderColor: '#fff',
					borderWidth: 1,
					barBorderRadius: 1,
				}
			}
		}, ]
	};
	myChart1.setOption(option);
</script>


