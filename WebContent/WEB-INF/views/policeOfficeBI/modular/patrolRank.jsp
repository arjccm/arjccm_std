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
    <div id="patrolRankContent" class="box_content">

    </div>
</section>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
<script>
    $(function(){
        var patrolRankChart = echarts.init(document.getElementById("patrolRankContent"));
        patrolRankOption = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'none'
                },
                formatter: function (params) {
                    return params[0].name + ': ' + params[0].value;
                },
            },
            //color: ['#17b3d1','#3279ee','#bb4cc3','#bd5e79','#e77d25'],
            xAxis: {
                type: 'value',
                splitLine: {show: false},
                axisTick: {show: false},
                axisLine: {show: false},
                axisLabel: {show: false}
            },
            yAxis: {
                type: 'category',
                data: ['区域1', '区域2', '区域3', '区域4', '区域5'],
                axisTick: {show: false},
                axisLine: {show: false},
                axisLabel: {
                    color: '#027DA8',
                    fontSize: 10
                },
                splitLine: {show:false}
            },
            //color: ['#3279ee'],
            series: [{
                name: 'hill',
                type: 'pictorialBar',
                barCategoryGap: '-130%',
                //symbol: 'path://M0,10 L10,10 L5,0 L0,10 z',
                symbol: 'path://M109.5,456.9v265.6c19.8-85.6,86-139.2,165.1-173.1c53.9-23.1,91.7-32.5,174.7-45.5c142.4-22.3,463.9-37.2,463.9-37.2s-321.5-14.9-463.9-37.2c-83-13-120.7-22.4-174.7-45.5c-79.2-33.9-145.3-87.4-165.1-173.1v265.6z',
                itemStyle: {
                    opacity: 0.5,
                    normal:{
                        color: function (params){
                            var colorList = ['#17b3d1','#3279ee','#bb4cc3','#bd5e79','#e77d25'];
                            return colorList[params.dataIndex];
                        }
                    }
                },
                emphasis: {
                    itemStyle: {
                        opacity: 1
                    }
                },
                label: {
                    show: true,
                    position: 'right',
                    padding: 10,
                    color: '#2979ff',
                    fontSize: 10,
                },
                data: [123, 60, 25, 18, 120]
            }]
        };

        patrolRankChart.setOption(patrolRankOption);
    })
</script>


