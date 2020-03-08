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
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
<script>
    function peopleCount() {
        

        //初始化echarts对象
        var peopleCountChart = echarts.init(document.getElementById("peopleCountContent"));
        //判断是否第一次执行来解决首次执行延迟问题
        var times = 0;
        //后续轮播添加的第一个值的下标
        var app = 14;
        var xdata;
        var ydata0;
        var ydata1;
        var datalen;
        //请求接口并填装数据执行
        $.getJSON(ctx + "/sys/BicMap/ccmPeopleCount", function (data) {
            firstTimeTodo(data);
        });
        function firstTimeTodo(data){
            // debugger;
            xdata = data[5];
            ydata0 = data[6];
            ydata1 = data[7];
            datalen = data[5].length;
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
                        data: data[2],
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
                        max: data[0],
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
                        max: data[1],
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
                                color: {
                                    type: 'linear',
                                    x: 0,
                                    y: 0,
                                    x2: 0,
                                    y2: 1,
                                    colorStops: [{
                                        offset: 0,
                                        color: 'rgba(75, 224, 248, 1)' //  0%  处的颜色
                                    },{
                                        offset: 0.4,
                                        color: 'rgba(75, 224, 248, 1)' //  30%  处的颜色
                                    },{
                                        offset: 1,
                                        color: 'rgba(75, 224, 248, .1)' //  100%  处的颜色
                                    }],
                                    global: false //  缺省为  false
                                }
                            }
                        },
                        data: data[3],
                    },
                    {
                        name: '流动人口',
                        type: 'line',
                        xAxisIndex: 0,
                        yAxisIndex: 1,
                        color: '#ffff46',
                        data: data[4],
                    }
                ]
            };

            setInterval(function initOption(data){
                if(times==0){
                    times++;
                    peopleCountChart.setOption(peopleCountOption);
                }else{
                    // debugger;
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
            }, 5000);
        }
    }
</script>


