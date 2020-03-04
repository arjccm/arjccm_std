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
            <p>警力人员分布</p>
            <div class="right_bg"></div>
        </div>
        <div class="box_bg_01">
            <div class="box_bg_02"></div>
        </div>
    </div>
    <ul>
        <li><a href="#">派出所警力分布</a></li>
        <li><a href="#">警务室警力分布</a></li>
    </ul>
    <div id="policeForceDistribution" class="box_content" style="float: right">

    </div>
</section>

<script>

    $(function () {

        var myChart = echarts.init(document.getElementById('policeForceDistribution'));

        var xData = function () {
            var data = [];
            for (var i = 1; i < 13; i++) {
                data.push(i + "警室");
            }
            return data;
        }();

        var xData1 = function () {
            var data = [];
            for (var i = 1; i < 7; i++) {
                data.push(i + "警室");
            }
            return data;
        }();

        var policeoption = {
            // backgroundColor:'#323a5e',
            tooltip: {
                trigger: 'axis',
                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                x: 180,
                y: 55,
                x2: 10,
                y2: 43
            },
            legend: {
                data: ['1', '2'],
                right: 15,
                top: 23,
                textStyle: {
                    color: "#fff"
                },
                itemWidth: 20,
                itemHeight: 10,
                // itemGap: 35
            },
            xAxis: {
                type: 'category',
                data: xData1,
                axisLine: {
                    lineStyle: {
                        color: '#778C96'

                    }
                },
                axisLabel: {
                    // interval: 0,
                    // rotate: 40,
                    textStyle: {
                        fontFamily: 'Microsoft YaHei',
                        color: 'white'
                    },
                    rotate: 30,
                },
            },

            yAxis: {
                type: 'value',
                axisLine: {
                    lineStyle: {
                        color: '#778C96'
                    }
                },
                splitLine: {
                    show: true,
                    lineStyle: {
                        type: 'dashed',
                        color: '#2A6283',
                        opacity: '0.3'
                    },
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
            },
            series: [{
                name: '1',
                type: 'bar',
                barWidth: '15%',
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: '#34CDFF'
                        }, {
                            offset: 0.8,
                            color: '#048AE2'
                        }]),
                        barBorderRadius: 0,
                    },
                },
                data: [400, 400, 300, 300, 300,400]
            },
                {
                    name: '2',
                    type: 'bar',
                    barWidth: '15%',
                    itemStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: '#03F8F6'
                            }, {
                                offset: 0.8,
                                color: '#4BA09A'
                            }]),
                            barBorderRadius: 0,
                        }

                    },
                    data: [400, 500, 500, 500, 500,400]
                }]
        };

        myChart.setOption(policeoption);

        var app = 5;
        setInterval(function () {
            var xdata = xData;
            var ydata0 = [310, 150, 450, 890, 345,310, 150, 450, 890, 345,310, 150];
            var ydata1 = [400, 500, 500, 500, 500,400, 500, 500, 500, 500,400, 500];
            var datalen = 12;
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
            var data0 = policeoption.series[0].data;
            var data1 = policeoption.series[1].data;
            data0.shift();
            data0.push(pushdata0);
            data1.shift();
            data1.push(pushdata1);

            policeoption.xAxis.data.shift();
            policeoption.xAxis.data.push(pushxdata0);
            app++;
            myChart.setOption(policeoption);
        }, 5000);

    });
</script>



