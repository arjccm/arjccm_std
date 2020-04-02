<%@ page contentType="text/html;charset=UTF-8" %>
<style>

</style>
<section>
	<div class="context" content="${ctx}" style="display: none"></div>
	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p>流动人员流入原因</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div class="box_content" id="modular_02">
	</div>
</section>
<script>
function modular_02(){
		var context = $(".context").attr("content");
		$.post(context + "/sys/BicMap/modular_02", {}, function (data) {
			var myChart1 = echarts.init(document.getElementById('modular_02'));
			var wz = 270;
			var policeoption = {

				color: [new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
					offset: 0,
					color: "#0d2a3a"
				}, {
					offset: 0.3,
					color: "#32d6ee"
				}, {
					offset: 0.5,
					color: "#32d6ee"
				}, {
					offset: 1,
					color: "#9d426f"
				}], false)],
				grid: {
					left: '0%',
					right: '7%',
					top: '5%',
					bottom: '5%',
					containLabel: true
				},
				tooltip: {
					show: "true",
					trigger: 'axis',
					axisPointer: {
						type: 'shadow'
					}
				},
				yAxis: [{
					data: data["name"],
					axisTick: {
						show: false
					},
					axisLine: {
						show: false
					},
					axisLabel: {
						show: true,
						color: "#fff",
						fontSize: 12
					}

				},{
					data:data["num"],
					axisTick: {
						show: false
					},
					axisLine: {
						show: false
					},
					axisLabel: {
						show: true,
						color: "#fff",
						fontSize: 12
					}

				}],
				xAxis: [{
					axisTick: {
						show: false
					},
					type: 'value',
					axisLine: {
						show: false
					},
					axisLabel: {
						show: false
					},
					splitLine: {
						show: false
					}
				}],
				series: [{
					name: '',
					type: 'bar',
					barWidth: 12,
					barCategoryGap: '10%',
					label: {
						normal: {
							show: false,
							position: 'right',
							textStyle: {
								color: "#fff",
								fontSize: 12
							}
						}
					},
					data:data["num"]
				}]
			};
			myChart1.setOption(policeoption);
		})
	}
</script>


