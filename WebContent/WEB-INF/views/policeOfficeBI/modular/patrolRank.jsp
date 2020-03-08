<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<style>

</style>
<section>
    <div class="box_header">
        <div class="box_header_title">
            <div class="left_bg"></div>
            <p>巡逻队伍落实排名</p>
            <div class="right_bg"></div>
        </div>
        <div class="box_bg_01">
            <div class="box_bg_02"></div>
        </div>
    </div>
    <div style="width: 25px;height: 100%;font-size: 13px;margin-top: 20px;position: absolute;margin-right: 10%;margin-left: 90%;">
        <span id="patroldata1" style="width: 100%;color: white;margin-top: 30%;text-align: center;display:block;height: 25px;line-height: 25px;"></span>
        <span id="patroldata2" style="width: 100%;color: white;margin-top: 50%;text-align: center;display:block;height: 25px;line-height: 25px;"></span>
        <span id="patroldata3" style="width: 100%;color: white;margin-top: 50%;text-align: center;display:block;height: 25px;line-height: 25px;"></span>
        <span id="patroldata4" style="width: 100%;color: white;margin-top: 50%;text-align: center;display:block;height: 25px;line-height: 25px;"></span>
        <span id="patroldata5" style="width: 100%;color: white;margin-top: 50%;text-align: center;display:block;height: 25px;line-height: 25px;"></span>
    </div>
    <div id="patrolRankContent" class="box_content">

    </div>
</section>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
<script>
    function patrolRank() {
        

        //初始化echarts对象
        var patrolRankChart = echarts.init(document.getElementById("patrolRankContent"));
        //请求接口并填装数据执行
        $.getJSON(ctx + "/sys/BicMap/vccmTeamMember", function (data) {
            initPatrolRankOption(data);
            $('#patroldata1').text(data[1][4]);
            $('#patroldata2').text(data[1][3]);
            $('#patroldata3').text(data[1][2]);
            $('#patroldata4').text(data[1][1]);
            $('#patroldata5').text(data[1][0]);
        });
        function initPatrolRankOption(data){
            patrolRankOption = {
                grid: {
                    top: '8%',
                    left: 15,
                    right: '8%',
                    bottom: '8%',
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
                    type: 'value',
                    splitLine: {show: false},
                    axisTick: {show: false},
                    axisLine: {show: false},
                    axisLabel: {show: false}
                },
                yAxis: {
                    type: 'category',
                    data: data[0],
                    axisTick: {show: false},
                    axisLine: {show: false},
                    axisLabel: {
                        color: 'white',
                        fontSize: 13,
                        margin: 5
                    },
                    splitLine: {show:false}
                },
                series: [{
                    name: 'hill',
                    type: 'pictorialBar',
                    barCategoryGap: '-130%',
                    barWidth: '190%',
                    symbol: 'path://M109.5,456.9v265.6c19.8-85.6,86-139.2,165.1-173.1c53.9-23.1,91.7-32.5,174.7-45.5c142.4-22.3,463.9-37.2,463.9-37.2s-321.5-14.9-463.9-37.2c-83-13-120.7-22.4-174.7-45.5c-79.2-33.9-145.3-87.4-165.1-173.1v265.6z',
                    itemStyle: {
                        opacity: 0.5,
                        normal:{
                            color: function(params){
                                var colorList = ['rgba(23, 179, 209, 1)','rgba(50, 121, 238, 1)','rgba(187, 76, 195, 1)','rgba(189, 94, 121, 1)','rgba(231, 125, 37, 1)'];
                                var colorList2 = ['rgba(23, 179, 209, .5)','rgba(50, 121, 238, .5)','rgba(187, 76, 195, .5)','rgba(189, 94, 121, .5)','rgba(231, 125, 37, .5)'];
                                return new echarts.graphic.LinearGradient(
                                    1, 0, 0, 0, [{offset: 0, color: colorList[params.dataIndex]},{offset: 1, color: colorList2[params.dataIndex]}]);
                            }
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
            patrolRankChart.setOption(patrolRankOption);
        }
    }
</script>


