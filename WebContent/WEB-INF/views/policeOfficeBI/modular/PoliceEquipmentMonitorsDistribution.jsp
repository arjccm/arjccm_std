<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<style>

</style>

<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>

<section>
    <div class="box_header">
        <div class="box_header_title">
            <div class="left_bg"></div>
            <p>警力设备/监控分布</p>
            <div class="right_bg"></div>
        </div>
        <div class="box_bg_01">
            <div class="box_bg_02"></div>
        </div>
    </div>
    <div id="policeEquipmentMonitorsDistribution" class="box_content">

    </div>
</section>
<script>

    $(function () {

        var myChart = echarts.init(document.getElementById('policeEquipmentMonitorsDistribution'));

        var xData = function () {
            var data = [];
            for (var i = 1; i < 19; i++) {
                data.push(i + "警室");
            }
            return data;
        }();

        var xData1 = function () {
            var data = [];
            for (var i = 1; i < 13; i++) {
                data.push(i + "警室");
            }
            return data;
        }();

        var policeoption1 = {
            // backgroundColor: "#344b58",
            title: {
                // text :  警力设备监控设备分布 ,
                textStyle: {
                    color: '#fff',
                    fontSize: '22'
                },
                subtextStyle: {
                    color: '#90979c',
                    fontSize: '16',

                },
            },
            tooltip: {
                trigger: "axis",
                axisPointer: {
                    type: "shadow",
                    textStyle: {
                        color: "#fff"
                    }

                },
            },
            grid: {
                x: 42,
                y: 26,
                x2: 6,
                y2: 38,
            },
            legend: {
                textStyle: {
                    color: "#fff"
                },
                right: 20,
                // top:23,
                itemWidth: 20,
                itemHeight: 10,
                data: ['警力设备', '监控设备']
            },
            calculable: true,
            xAxis: [{
                type: "category",
                data: xData1,
                axisLine: {
                    lineStyle: {
                        color: '#778C96'
                    }
                },
                splitLine: {
                    show: false
                },
                splitArea: {
                    show: false
                },
                axisLabel: {
                    interval: 0,
                    textStyle: {
                        fontFamily: 'Microsoft YaHei',
                        color: 'white'
                    },
                    rotate: 30,
                },
            }],
            yAxis: [{
                type: "value",
                splitLine: {
                    show: true,
                    lineStyle: {
                        type: 'dashed',
                        color: '#2A6283',
                        opacity: '0.3'
                    },
                },
                axisLine: {
                    lineStyle: {
                        color: '#778C96'
                    }
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    // interval: 0,
                    // rotate: 40,
                    textStyle: {
                        fontFamily: 'Microsoft YaHei',
                        color: 'white'
                    },
                },
                splitArea: {
                    show: false
                },

            }],

            series: [{
                name: "警力设备",
                type: "bar",
                stack: "总量",
                barMaxWidth: 15,
                barGap: "10%",
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: '#48D9F0'
                        },
                            {
                                offset: 1,
                                color: '#1d546a'
                            }]),

                    }
                },
                data: [400, 500, 500, 500, 500, 400, 500, 500, 500, 500, 400, 500]
            },

                {
                    name: "监控设备",
                    type: "bar",
                    barMaxWidth: 15,
                    stack: "总量",
                    itemStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: '#D27DC7'
                            }, {
                                offset: 1,
                                color: '#C5009F'
                            }]),
                        }
                    },
                    data: [310, 150, 450, 890, 345, 310, 150, 450, 890, 345, 310, 150]
                }
            ]
        };

        myChart.setOption(policeoption1);

        /*var app = 11;
        setInterval(function () {
            var xdata = xData;
            var ydata0 = [310, 150, 450, 890, 345, 310, 150, 450, 890, 345, 310, 150, 150, 450, 890, 345, 310, 150];
            var ydata1 = [400, 500, 500, 500, 500, 400, 500, 500, 500, 500, 400, 500, 310, 150, 450, 890, 345, 180];
            var datalen = 18;
            var pushdata0 = 0;
            var pushdata1 = 0;
            var pushxdata0 = "";
            var xdatalen = app + 1;
            if (xdatalen < datalen) {
                pushdata0 = ydata0[xdatalen];
                pushdata1 = ydata1[xdatalen];
                pushxdata0 = xdata[xdatalen];
            } else {
                pushdata0 = ydata0[xdatalen % datalen];
                pushdata1 = ydata1[xdatalen % datalen];
                pushxdata0 = xdata[xdatalen % datalen];
            }
            var data0 = policeoption1.series[0].data;
            var data1 = policeoption1.series[1].data;
            data0.shift();
            data0.push(pushdata0);
            data1.shift();
            data1.push(pushdata1);

            policeoption1.xAxis.data.shift();
            policeoption1.xAxis.data.push(pushxdata0);

            app++;
            myChart.setOption(policeoption1);

        }, 5000);*/

    });
</script>


