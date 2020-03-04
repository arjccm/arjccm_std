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
    </div>
    <div id="thisWeekContent" class="box_content">

    </div>
</section>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
<script>
    $(function(){
        var thisWeekChart = echarts.init(document.getElementById("thisWeekContent"));
        thisWeekOption = {
            title:{

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
                data: ['区域1', '区域2', '区域3', '区域4', '区域5'],
                axisTick: {show: false},
                axisLine: {show: false},
                axisLabel: {
                    color: '#027DA8'
                }
            },
            yAxis: {
                splitLine: {show: false},
                axisTick: {show: false},
                axisLine: {show: false},
                axisLabel: {show: false}
            },
            color: ['#027DA8'],
            series: [{
                name: 'hill',
                type: 'pictorialBar',
                barCategoryGap: '-130%',
                // symbol: 'path://M0,10 L10,10 L5,0 L0,10 z',
                symbol: 'path://M0,10 L10,10 C5.5,10 5.5,5 5,0 C4.5,5 4.5,10 0,10 z',
                itemStyle: {
                    opacity: 0.5
                },
                emphasis: {
                    itemStyle: {
                        opacity: 1
                    }
                },
                label: {
                    show: true,
                    position: 'top',
                    padding: 10,
                    color: '#2979ff',
                    fontSize: 14,
                },

                data: [123, 60, 25, 18, 120],
                z: 10
            }, {
                name: 'glyph',
                type: 'pictorialBar',
                barGap: '-100%',
                symbolPosition: 'end',
                symbolSize: 50,
                symbolOffset: [0, '-120%'],
                data: [{
                    // value: 123,
                    // symbol: pathSymbols.reindeer,
                    symbolSize: [60, 60]
                }, {
                    // value: 60,
                    // symbol: pathSymbols.rocket,
                    symbolSize: [50, 60]
                }, {
                    // value: 25,
                    // symbol: pathSymbols.plane,
                    symbolSize: [65, 35]
                }, {
                    // value: 18,
                    // symbol: pathSymbols.train,
                    symbolSize: [50, 30]
                }, {
                    // value: 12,
                    // symbol: pathSymbols.ship,
                    symbolSize: [50, 35]
                }, {
                    // value: 9,
                    // symbol: pathSymbols.car,
                    symbolSize: [40, 30]
                }, {
                    // value: 2,
                    // symbol: pathSymbols.run,
                    symbolSize: [40, 50]
                }, {
                    // value: 1,
                    // symbol: pathSymbols.walk,
                    symbolSize: [40, 50]
                }]
            }]
        };

        thisWeekChart.setOption(thisWeekOption);
    })
</script>


