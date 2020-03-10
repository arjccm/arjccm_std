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
<%--        <div style="width: 100%;height: 20px;font-size: 13px;margin-top: 20px;">--%>
<%--            <span id="housedata1" style="width: 15%;color: white;margin-left: 10%;text-align: center;display:inline-block;"></span>--%>
<%--            <span id="housedata2" style="width: 15%;color: white;margin-left: 1px;text-align: center;display:inline-block;"></span>--%>
<%--            <span id="housedata3" style="width: 15%;color: white;margin-left: 1px;text-align: center;display:inline-block;"></span>--%>
<%--            <span id="housedata4" style="width: 15%;color: white;margin-left: 1px;text-align: center;display:inline-block;"></span>--%>
<%--            <span id="housedata5" style="width: 15%;color: white;margin-left: 1px;text-align: center;display:inline-block;"></span>--%>
<%--        </div>--%>
    </div>
    <div id="rentalHouseContent" class="box_content">

    </div>
</section>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
<script>
    function rentalHouseOfArea() {
        

        //初始化echarts对象
        var rentalHouseChart = echarts.init(document.getElementById("rentalHouseContent"));
        //请求接口并填装数据执行
        $.getJSON(ctx + "/sys/BicMap/rentalHouseOfArea", function (data) {
            initRentalHouseOption(data);
            // $('#housedata1').text(data[2][0]);
            // $('#housedata2').text(data[2][1]);
            // $('#housedata3').text(data[2][2]);
            // $('#housedata4').text(data[2][3]);
            // $('#housedata5').text(data[2][4]);
        });
        function initRentalHouseOption(data){
            rentalHouseOption = {
                grid: {
                    left: '8%',
                    right: '8%',
                    top: '10%',
                    bottom: '10%',
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
                xAxis: [{
                    data: data[1],
                    axisTick: {show: false},
                    axisLine: {show: false},
                    axisLabel: {
                        interval:0,
                        color: 'white',
                        textStyle: {
                            fontSize: 12
                        }
                    }
                },{
                    data: data[2],
                    type:'category',
                    axisTick: {show: false},
                    axisLine: {show: false},
                    axisLabel: {
                        color: 'white',
                        textStyle: {
                            fontSize: 12
                        }
                    }
                }],
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
                    data: data[2],
                    z: 10
                }]
            };
            rentalHouseChart.setOption(rentalHouseOption);
        }
    }
</script>


