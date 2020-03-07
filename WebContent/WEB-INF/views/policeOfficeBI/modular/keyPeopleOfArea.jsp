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
        //初始化echarts对象
        var keyPeopleChart = echarts.init(document.getElementById("keyPeopleContent"));
        //请求接口并填装数据执行
        $.getJSON(ctx + "/sys/BicMap/keyPeopleOfArea", function (data) {
            initKeyPeopleOption(data);
        });
        function initKeyPeopleOption(data){
            keyPeopleOption = {
                xAxis: {
                    max: data[0],
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
                    data: data[1],
                    inverse: true,
                    axisTick: {show: false},
                    axisLine: {show: false},
                    axisLabel: {
                        textStyle: {
                            color: 'white',
                            fontSize: 12
                        }
                    }
                },
                grid: {
                    top: 'center',
                    height: 180,
                    left: 105,
                    right: 60
                },
                series: [{
                    type: 'pictorialBar',
                    color: '#B5358D',
                    symbol: 'path://M399.4 210.5a112.3 112.3 0 1 0 224.6 0a112.3 112.3 0 1 0 -224.6 0zM686.4,644.4H337c-18.1,0-33-14.9-33-33V384.3c0-18.1,14.9-33,33-33h349.4c18.2,0,33,14.9,33,33v227.1C719.4,629.5,704.5,644.4,686.4,644.4zM583.5,928.2H439.8c-13.6,0-24.7-11.1-24.7-24.7l-32.9-348.3c0-13.6,11.1-24.7,24.7-24.7h209.5c13.6,0,24.7,11.1,24.7,24.7l-32.9,348.3C608.2,917.1,597.1,928.2,583.5,928.2z',
                    symbolRepeat: 'fixed',
                    symbolClip: true,
                    symbolSize: [10,22],
                    symbolMargin: 5,
                    data: data[2],
                    z: 10
                }, {
                    type: 'pictorialBar',
                    color: '#726c66',
                    symbol: 'path://M399.4 210.5a112.3 112.3 0 1 0 224.6 0a112.3 112.3 0 1 0 -224.6 0zM686.4,644.4H337c-18.1,0-33-14.9-33-33V384.3c0-18.1,14.9-33,33-33h349.4c18.2,0,33,14.9,33,33v227.1C719.4,629.5,704.5,644.4,686.4,644.4zM583.5,928.2H439.8c-13.6,0-24.7-11.1-24.7-24.7l-32.9-348.3c0-13.6,11.1-24.7,24.7-24.7h209.5c13.6,0,24.7,11.1,24.7,24.7l-32.9,348.3C608.2,917.1,597.1,928.2,583.5,928.2z',
                    symbolRepeat: 'fixed',
                    label: {
                        normal: {
                            show: true,
                            formatter: function (params) {
                                return params.value + ' 人';
                            },
                            position: 'right',
                            textStyle: {
                                color: 'white',
                                fontSize: 12
                            }
                        }
                    },
                    animationDuration: 0,
                    symbolSize: [10,22],
                    symbolMargin: 5,
                    symbolBoundingData: data[0],
                    data: data[2],
                    z: 5
                }]
            };
            keyPeopleChart.setOption(keyPeopleOption);
        }
    })
</script>


