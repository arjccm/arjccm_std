<%@ page contentType="text/html;charset=UTF-8" %>
<style>

</style>
<section>


	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p class="left_p">矛盾纠纷化解</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div id="disputeDefuse" class="box_content" >


	</div>
</section>


<script>

	//矛盾纠纷化解
	showDisputeDefuse()

	function showDisputeDefuse() {
		var disputeDefuse = echarts.init(document.getElementById('disputeDefuse'));
        var option = {
            tooltip: {
                trigger: 'item',
            },
            legend: {
                data: ['数量', '化解率'],
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
                data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月','8月', '9月', '10月', '11月', '12月'],

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
                        opacity: 0.3
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
                        fontsize: '8px'
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
                data: [11, 59, 85, 48, 87, 42, 64,53, 38, 57, 13,33],

                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1, [{
                                offset: 0,
                                color: '#438AFF'
                            },
                                {
                                    offset: 1,
                                    color: '#091C41'
                                }
                            ]),
                    }

                },
            },
                {
                    name: '化解率',
                    data: [8, 21, 38, 33, 55, 41, 26,34, 16, 32, 4,55],
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
		disputeDefuse.setOption(option);

	}





</script>


