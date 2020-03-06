<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<style>

</style>
<section>
    <div class="box_header">
        <div class="box_header_title">
            <div class="left_bg"></div>
            <p>实有人口数据总汇</p>
            <div class="right_bg"></div>
        </div>
        <div class="box_bg_01">
            <div class="box_bg_02"></div>
        </div>
    </div>
    <div id="peopleCountContent" class="box_content">

    </div>
</section>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-auto-tooltip.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
<script>
    $(function(){
        var peopleCountChart = echarts.init(document.getElementById("peopleCountContent"));
        peopleCountOption = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
            },
            grid: {
                top: '13%',
                left: '1%',
                right: '1%',
                bottom: '1%',
                containLabel: true
            },
            legend: {
                data:['实有人口','流动人口'],
                right: 15,
                textStyle: {
                    color: "#fff"
                },
                itemWidth: 20,
                itemHeight: 10
            },
            dataZoom: {
                show: false,
                start: 0,
                end: 100
            },
            xAxis: [
                {
                    type: 'category',
                    splitLine: {
                        show: true,
                        lineStyle: {
                            type: 'dashed',
                            color: '#303f51'
                        }
                    },
                    axisLabel: {
                        textStyle: {
                            fontFamily: 'Microsoft YaHei',
                            color: 'white',
                            fontSize: 8
                        },
                        rotate: 30,
                    },
                    boundaryGap: true,
                    data: ["地方1","地方2","地方3","地方4","地方5","地方6","地方7","地方8","地方9","地方10","地方11","地方12","地方13","地方14","地方15"]
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    splitLine: {
                        show: true,
                        lineStyle: {
                            type: 'dashed',
                            color: '#303f51'
                        }
                    },
                    axisLabel: {
                        textStyle: {
                            fontFamily: 'Microsoft YaHei',
                            color: 'white',
                            fontSize: 8
                        },
                    },
                    scale: true,
                    max: 1000,
                    min: 0,
                    boundaryGap: [0.2, 0.2]
                },
                {
                    type: 'value',
                    splitLine: {
                        show: true,
                        lineStyle: {
                            type: 'dashed',
                            color: '#303f51'
                        }
                    },
                    axisLabel: {
                        textStyle: {
                            fontFamily: 'Microsoft YaHei',
                            color: 'white',
                            fontSize: 8
                        },
                    },
                    scale: true,
                    max: 1000,
                    min: 0,
                    boundaryGap: [0.2, 0.2]
                }
            ],
            series: [
                {
                    name: '实有人口',
                    type: 'bar',
                    barWidth: '45%',
                    xAxisIndex: 0,
                    yAxisIndex: 0,
                    itemStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(
                                0, 0, 0, 1, [{
                                    offset: 0,
                                    color: '#4BE0F8'
                                },
                                    {
                                        offset: 1,
                                        color: '#091C41'
                                    }
                                ]),
                        }
                    },
                    data:[310,150,450,890,345,875,245,864,269,475,876,263,486,189,489]
                },
                {
                    name: '流动人口',
                    type: 'line',
                    xAxisIndex: 0,
                    yAxisIndex: 1,
                    color: '#ffff46',
                    data:[310,150,450,890,345,875,245,864,269,475,876,263,486,189,489]
                }
            ]
        };
        var times = 0;
        var app = 14;
        function initOption(){
            if(times==0){
                times++;
                peopleCountChart.setOption(peopleCountOption);
            }else{
                var xdata = ["地方1","地方2","地方3","地方4","地方5","地方6","地方7","地方8","地方9","地方10","地方11","地方12","地方13","地方14","地方15","地方16","地方17","地方18","地方19","地方20","地方21","地方22","地方23","地方24"];
                var ydata0 = [310,150,450,890,345,875,245,864,269,475,876,263,486,189,489,369,789,749,586,259,348,879,873,481];
                var ydata1 = [310,150,450,890,345,875,245,864,269,475,876,263,486,189,489,369,789,749,586,259,348,879,873,481];
                var datalen = 24;
                var pushdata0 = 0;
                var pushdata1 = 0;
                var pushxdata0 = "";
                var xdatalen = app + 1;
                if(xdatalen<datalen){
                    pushdata0 = ydata0[xdatalen];
                    pushdata1 = ydata1[xdatalen];
                    pushxdata0 = xdata[xdatalen];
                }else{
                    pushdata0 = ydata0[xdatalen%datalen];
                    pushdata1 = ydata1[xdatalen%datalen];
                    pushxdata0 = xdata[xdatalen%datalen];
                }
                var data0 = peopleCountOption.series[0].data;
                var data1 = peopleCountOption.series[1].data;
                data0.shift();
                data0.push(pushdata0);
                data1.shift();
                data1.push(pushdata1);

                peopleCountOption.xAxis[0].data.shift();
                peopleCountOption.xAxis[0].data.push(pushxdata0);
                app++;
                peopleCountChart.setOption(peopleCountOption);
            }
            return initOption;
        }
        setInterval(initOption(), 5000);
    })
</script>


