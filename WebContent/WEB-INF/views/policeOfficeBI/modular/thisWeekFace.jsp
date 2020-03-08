<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<style>

</style>
<section>
    <div class="box_header">
        <div class="box_header_title">
            <div class="left_bg"></div>
            <p>本周人脸抓拍告警TOP5</p>
            <div class="right_bg"></div>
        </div>
        <div class="box_bg_01">
            <div class="box_bg_02"></div>
        </div>
        <div style="width: 100%;height: 20px;font-size: 13px;margin-top: 20px;">
            <span id="facedata1" style="width: 15%;color: white;margin-left: 10%;text-align: center;display:inline-block;"></span>
            <span id="facedata2" style="width: 15%;color: white;margin-left: 1px;text-align: center;display:inline-block;"></span>
            <span id="facedata3" style="width: 15%;color: white;margin-left: 1px;text-align: center;display:inline-block;"></span>
            <span id="facedata4" style="width: 15%;color: white;margin-left: 1px;text-align: center;display:inline-block;"></span>
            <span id="facedata5" style="width: 15%;color: white;margin-left: 1px;text-align: center;display:inline-block;"></span>
        </div>
    </div>
    <div id="thisWeekContent" class="box_content">

    </div>
</section>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
<script>
    function thisWeekFace() {
        

        //初始化echarts对象
        var thisWeekChart = echarts.init(document.getElementById("thisWeekContent"));
        //请求接口并填装数据执行
        $.getJSON(ctx + "/sys/BicMap/thisWeekFace", function (data) {
            initThisWeekOption(data);
            $('#facedata1').text(data[1][0]);
            $('#facedata2').text(data[1][1]);
            $('#facedata3').text(data[1][2]);
            $('#facedata4').text(data[1][3]);
            $('#facedata5').text(data[1][4]);
        });
        function initThisWeekOption(data){
            thisWeekOption = {
                grid: {
                    top: '13%',
                    left: '8%',
                    right: '8%',
                    bottom: '1%',
                    containLabel: true
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'none'
                    },
                    formatter: function (params) {
                        return params[0].name + ': ' + params[0].value;
                    },
                },
                xAxis: {
                    data: data[0],
                    axisTick: {show: false},
                    axisLine: {show: false},
                    axisLabel: {
                        color: 'white',
                        textStyle: {
                            fontSize: 10
                        }
                    }
                },
                yAxis: {
                    splitLine: {show: false},
                    axisTick: {show: false},
                    axisLine: {show: false},
                    axisLabel: {show: false}
                },
                series: [{
                    name: 'hill',
                    type: 'pictorialBar',
                    barCategoryGap: '-130%',
                    barWidth: '200%',
                    symbol: 'path://M0,10 L10,10 C5.5,10 5.5,5 5,0 C4.5,5 4.5,10 0,10 z',
                    itemStyle: {
                        opacity: 0.5,
                        normal: {
                            color: new echarts.graphic.LinearGradient(
                                0, 0, 0, 1, [{
                                    offset: 0,
                                    color: 'rgba(52, 205, 255, 1)'
                                },{
                                    offset: 1,
                                    color: 'rgba(4, 138, 226, .5)'
                                }]),
                        }
                    },
                    emphasis: {
                        itemStyle: {
                            opacity: 1
                        }
                    },
                    data: data[1],
                    z: 10
                }]
            };
            thisWeekChart.setOption(thisWeekOption);
        }
    }
</script>


