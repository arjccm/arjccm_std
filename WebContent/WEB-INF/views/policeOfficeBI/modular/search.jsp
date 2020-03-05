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
	var valdata = [683, 234, 234, 523, 345];
	var myColor = ['#32d6ee', '#32d6ee', '#32d6ee', '#32d6ee', '#32d6ee'];
    var rightIcon =
        'image://data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAQCAYAAAArij59AAAAx0lEQVQokZ3RvUoDYRCF4We/bPAnqKCSRrHxBsTS2/DGvCexsbYIKIKNFv4UEUMkZo9FdkFibDxwihnemQMzVZKCTexiDz2M8Yz3GjX2cdJ6HXe4xr0kgyRnSS6SjJM0SW6TnCcZ1uhjiFNsWegYR9goKBi0+Z0q7KBf2qLX+qdqlLI09UtlVfPfQP4CgmYF0CAd8ImPJWCCecEX3jBainvCtGCGR1ziBnNcWfxjUiXpYRsHOLQ40Ase8Fol6S651rpqt04x+wZZQEmC4eTFRAAAAABJRU5ErkJggg==';
	option = {
		grid:{
			x:"35%",
			y:"15%",
			x2:"16%",
			y2:"15%",
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
						fontSize:12,
						width: 15,
						height: 16,
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
			barWidth: 5,
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
			barWidth: 13,
			itemStyle: {
				normal: {
					color: 'none',
					borderColor: '#fff',
					borderWidth: 1,
					barBorderRadius: 1,
				}
			}
		},
            {
                type: 'pictorialBar',
                symbol: rightIcon,
                symbolPosition: 'end',
                symbolSize: [4, 12],
                symbolRotate: 0,
                symbolOffset: [3, 0],
                z: 4,
                data,
            },]
	};
	myChart1.setOption(option);
</script>


