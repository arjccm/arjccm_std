<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<style>

</style>
<section>
    <div class="box_header">
        <div class="box_header_title">
            <div class="left_bg"></div>
            <p>出租房区域分布TOP5</p>
            <div class="right_bg"></div>
        </div>
        <div class="box_bg_01">
            <div class="box_bg_02"></div>
        </div>
    </div>
    <div id="rentalHouseContent" class="box_content">

    </div>
</section>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
<script>
    $(function(){
        //初始化echarts对象
        var rentalHouseChart = echarts.init(document.getElementById("rentalHouseContent"));
        //请求接口并填装数据执行
        $.getJSON(ctx + "/sys/BicMap/rentalHouseOfArea", function (data) {
            initRentalHouseOption(data);
        });
        function initRentalHouseOption(data){
            rentalHouseOption = {
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
                    data: data[1],
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
                    max: data[0],
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
                                    color: 'rgba(214, 44, 120, .7)'
                                },{
                                    offset: 0.3,
                                    color: 'rgba(214, 44, 120, .7)'
                                },{
                                    offset: 0.7,
                                    color: 'rgba(71, 212, 235, .6)'
                                },{
                                    offset: 1,
                                    color: 'rgba(71, 212, 235, .1)'
                                }]),
                        }
                    },
                    emphasis: {
                        itemStyle: {
                            opacity: 1
                        }
                    },
                    label: {
                        show: true,
                        position: 'top',
                        top: 8,
                        color: 'white',
                        fontSize: 13,
                    },
                    data: data[2],
                    z: 10
                }]
            };
            rentalHouseChart.setOption(rentalHouseOption);
        }
    })
</script>


