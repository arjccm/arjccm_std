<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<style>

</style>
<section>
    <div class="box_header">
        <div class="box_header_title">
            <div class="left_bg"></div>
            <p>重点人员区域分布TOP5</p>
            <div class="right_bg"></div>
        </div>
        <div class="box_bg_01">
            <div class="box_bg_02"></div>
        </div>
    </div>
    <div id="keyPeopleContent" class="box_content">

    </div>
</section>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>
<script>
    $(function(){
        var keyPeopleChart = echarts.init(document.getElementById("keyPeopleContent"));
        var maxData = 100;
        keyPeopleOption = {
            tooltip: {
            },
            xAxis: {
                max: maxData,
                // splitLine: {show: false},
                // axisTick: {show: false},
                offset: 10,
                axisLine: {
                    lineStyle: {
                        color: '#999'
                    },
                    show: false
                },
                axisLabel: {
                    margin: 10
                },
                show : false,
            },
            yAxis: {
                data: ['区域1', '区域2', '区域3', '区域4',"区域5"],
                inverse: true,
                axisTick: {show: false},
                axisLine: {show: false},
                axisLabel: {
                    margin: 10,
                    textStyle: {
                        color: '#999',
                        fontSize: 10
                    }
                }
            },
            grid: {
                top: 'center',
                height: 200,
                left: 70,
                right: 100
            },
            series: [{
                // current data
                type: 'pictorialBar',
                color: '#B5358D',
                symbol: 'path://M399.4 210.5a112.3 112.3 0 1 0 224.6 0a112.3 112.3 0 1 0 -224.6 0zM686.4,644.4H337c-18.1,0-33-14.9-33-33V384.3c0-18.1,14.9-33,33-33h349.4c18.2,0,33,14.9,33,33v227.1C719.4,629.5,704.5,644.4,686.4,644.4zM583.5,928.2H439.8c-13.6,0-24.7-11.1-24.7-24.7l-32.9-348.3c0-13.6,11.1-24.7,24.7-24.7h209.5c13.6,0,24.7,11.1,24.7,24.7l-32.9,348.3C608.2,917.1,597.1,928.2,583.5,928.2z',
                symbolRepeat: 'fixed',
                symbolClip: true,
                symbolSize: 15,
                // symbolBoundingData: maxData,
                data: [80, 50, 40, 60, 24],
                z: 10
            }, {
                // full data
                type: 'pictorialBar',
                itemStyle: {
                    normal: {
                        opacity: 0.2
                    }
                },
                label: {
                    normal: {
                        show: true,
                        formatter: function (params) {
                            return params.value + ' 人';
                        },
                        position: 'right',
                        offset: [10, 0],
                        textStyle: {
                            color: 'green',
                            fontSize: 10
                        }
                    }
                },
                animationDuration: 0,
                symbolRepeat: 'fixed',
                symbol: 'path://M399.4 210.5a112.3 112.3 0 1 0 224.6 0a112.3 112.3 0 1 0 -224.6 0zM686.4,644.4H337c-18.1,0-33-14.9-33-33V384.3c0-18.1,14.9-33,33-33h349.4c18.2,0,33,14.9,33,33v227.1C719.4,629.5,704.5,644.4,686.4,644.4zM583.5,928.2H439.8c-13.6,0-24.7-11.1-24.7-24.7l-32.9-348.3c0-13.6,11.1-24.7,24.7-24.7h209.5c13.6,0,24.7,11.1,24.7,24.7l-32.9,348.3C608.2,917.1,597.1,928.2,583.5,928.2z',
                symbolSize: 15,
                color: '#726c66',
                symbolBoundingData: maxData,
                data: [80, 50, 40, 60, 24],
                z: 5
            }]
        };
        keyPeopleChart.setOption(keyPeopleOption);
    })
</script>


