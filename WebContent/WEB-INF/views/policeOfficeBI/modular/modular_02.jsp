<%@ page contentType="text/html;charset=UTF-8" %>
<style>

</style>
<section>
	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p>流动人员来源地TOP10</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div class="box_content">
        <div id="pic1" style="width: 200px;height:270px;"></div>
	</div>
</section>
<script>
    var myChart1 = echarts.init(document.getElementById('pic1'));
    option = {

        color: [new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
            offset: 0,
            color: "#00fffc"
        }, {
            offset: 0.5,
            color: "#32d6ee"
        }, {
            offset: 1,
            color: "#9d426f"
        }], false)],
        grid: {
            left: '0%',
            right: '15%',
            top: '7%',
            bottom: '18%',
            containLabel: true
        },
        tooltip: {
            show: "true",
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        yAxis: {
            data: ["住宿", "餐饮", "学生", "司机", "教师", "医生", "物流", "房地产", "加工制造", "无固定职业"],
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
            },

        },
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
            name: '违规',
            type: 'bar',
            barWidth: 12,
            label: {
                normal: {
                    show: true,
                    position: 'right',
                    textStyle: {
                        color: "#fff",
                        fontSize: 12
                    }
                }
            },
            data: [80, 90, 100, 200, 300, 400, 500, 600, 700, 800]
        }]
    };
    myChart1.setOption(option);
</script>


