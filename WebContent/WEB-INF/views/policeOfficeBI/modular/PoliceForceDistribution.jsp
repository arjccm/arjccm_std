<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<link rel="stylesheet" href="${ctxStatic}/policeOfficeBI/css/policeForceDistribution.css">

<style>
    <%--#sbzs .sp1 {--%>
    <%--    width: 85px;--%>
    <%--    height: 26px;--%>
    <%--    font-size: 14px;--%>
    <%--    font-family: Microsoft YaHei;--%>
    <%--    font-weight: 400;--%>
    <%--    color: rgba(255, 255, 255, 1);--%>
    <%--    line-height: 26px;--%>
    <%--}--%>

    <%--#sbzs .sp2 {--%>
    <%--    width: 19px;--%>
    <%--    height: 26px;--%>
    <%--    font-size: 25px;--%>
    <%--    font-family: Digiface;--%>
    <%--    font-weight: 400;--%>
    <%--    color: rgba(3, 248, 246, 1);--%>
    <%--    line-height: 26px;--%>
    <%--    background: url("${ctxStatic}/images/numberBj.png") no-repeat;--%>
    <%--    background-size: 100% 100%;--%>
    <%--}--%>

    <%--#sbzs .sp3 {--%>
    <%--    width: 15px;--%>
    <%--    height: 26px;--%>
    <%--    font-size: 14px;--%>
    <%--    font-family: Microsoft YaHei;--%>
    <%--    font-weight: 400;--%>
    <%--    color: rgba(255, 255, 255, 1);--%>
    <%--    line-height: 26px;--%>
    <%--    opacity: 0.3;--%>
    <%--}--%>

    .mj2 {
        width: 0.6185vw;
        height: 0.846vw;
        font-size: 0.814vw;
        font-family: Digiface;
        font-weight: 400;
        color: rgba(3, 248, 246, 1);
        line-height: 0.846vw;
        background: url("${ctxStatic}/images/numberBj.png") no-repeat;
        background-size: 100% 100%;
        margin-right: 3px;
    }

    .fj2 {
        width: 0.6185vw;
        height: 0.846vw;
        font-size: 0.814vw;
        font-family: Digiface;
        font-weight: 400;
        color: rgba(3, 248, 246, 1);
        line-height: 0.846vw;
        background: url("${ctxStatic}/images/numberBj.png") no-repeat;
        background-size: 100% 100%;
        margin-right: 3px;
    }

    .fontStyle {
        font-size: 14px;
        font-family: Microsoft YaHei;
        color: rgba(255, 255, 255, 1);
        opacity: 0.3;
    }

</style>


<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>

<section>
    <div class="context" content="${ctx}" style="display: none"></div>
    <div class="box_header">
        <div class="box_header_title">
            <div class="left_bg"></div>
            <p>警力人员分布</p>
            <div class="right_bg"></div>
        </div>
        <div class="box_bg_01">
            <div class="box_bg_02"></div>
        </div>
    </div>

    <div class="box_content">

        <div class="pf_area clearfix">
            <div style="width:100%" class="pf_tab">
                <ul class="clearfix">
                    <li class="li_bg"><a href="javascript:">派出所警力分布</a></li>
                    <li class="li_bg"><a href="javascript:">警务室警力分布</a></li>
                </ul>
            </div>

            <div class="sbzs_box">
                <div class="mj_block jc_sl clearfix">
                    <span id="mj0" class="name" style="font-size: 0.4557vw;;line-height: 16px">民警</span>
                    <%--<span class="sp2">1</span>--%>
                    <span class="fontStyle">人</span>
                </div>
                <div class="fj_block jc_sl clearfix">
                    <%--<div class="name">辅警</div>
                    <div class="num">123</div>
                    <div>人</div>--%>
                    <span id="fj0" class="name" style="font-size: 0.4557vw;;line-height: 16px">辅警</span>
                    <%--<span class="sp2">1</span>--%>
                    <span class="fontStyle">人</span>
                </div>
            </div>

            <div id="policeForceDistribution" style="height:160px;width: 70%">

            </div>
        </div>

    </div>
</section>

<script>


function PoliceForceDistribution() {
    

        // project-Path
        var context = $(".context").attr("content");
        $.post(context + "/sys/BicMap/policeForceDistribution", {}, function (data) {

            var myChart = echarts.init(document.getElementById('policeForceDistribution'));

            var sum = 0;
            mjTotal(data["data"]["民警"])   //计算民警总数
            fjTotal(data["data"]["辅警"])   //计算辅警总数

            //计算民警总数
            function mjTotal(data) {
                data.forEach(function (value) {
                    sum += value;
                })

                var num = 0;	//几位数
                var sum2 = sum;
                while (sum2 >= 1) {
                    sum2 /= 10;
                    num++;
                }
                //alert(num)
                // var $sp2='<span class="sp2" id="sp"></span>'

                for (var i = 0; i < num; i++) {
                    var sp1 = $("#mj" + i + "")
                    sp1.after('<span class="mj2" id="mj' + (i + 1) + '"></span>')
                }

                var sum3 = sum;
                for (var i = 0; i < num; i++) {
                    var gw = 0;
                    var sum4 = sum3;
                    while (sum4 >= 10) {
                        gw = parseInt(sum4 / 10);
                        sum4 /= 10;
                    }
                    var sp2 = $('#mj' + (i + 1) + '');
                    sp2.html(gw)
                    if (sum3 < 10) {
                        sp2.html(sum3);
                        return;
                    }

                    var sum5 = String(sum3);

                    sum3 = parseInt(sum5.substr(1, sum5.length));
                }
            }
            //计算辅警总数
            function fjTotal(data) {
                data.forEach(function (value) {
                    sum += value;
                })

                var num = 0;	//几位数
                var sum2 = sum;
                while (sum2 >= 1) {
                    sum2 /= 10;
                    num++;
                }
                //alert(num)
                // var $sp2='<span class="sp2" id="sp"></span>'

                for (var i = 0; i < num; i++) {
                    var sp1 = $("#fj" + i + "")
                    sp1.after('<span class="fj2" id="fj' + (i + 1) + '"></span>')
                }


                var sum3 = sum;
                for (var i = 0; i < num; i++) {
                    var gw = 0;
                    var sum4 = sum3;
                    while (sum4 >= 10) {
                        gw = parseInt(sum4 / 10);
                        sum4 /= 10;
                    }
                    var sp2 = $('#fj' + (i + 1) + '');
                    sp2.html(gw)
                    if (sum3 < 10) {
                        sp2.html(sum3);
                        return;
                    }

                    var sum5 = String(sum3);

                    sum3 = parseInt(sum5.substr(1, sum5.length));
                }
            }

            var dataName = data["name"]

            var xData1 = function () {
                var data = [];
                for (var i = 0; i < 6; i++) {
                    data.push(dataName[i]);
                }
                return data;
            }();

            var policeoption = {
                // backgroundColor:'#323a5e',
                tooltip: {
                    trigger: 'axis',
                    axisPointer: { // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    y: 30,
                    x2: 0,
                    y2: 30
                },
                legend: {
                    data: ["民警","辅警"],
                    right: 20,
                    top: 0,
                    textStyle: {
                        color: "#fff"
                    },
                    itemWidth: 20,
                    itemHeight: 10,
                    // itemGap: 35
                },
                xAxis: {
                    type: 'category',
                    data: xData1,
                    axisLine: {
                        lineStyle: {
                            color: '#778C96'

                        }
                    },
                    axisLabel: {
                        // interval: 0,
                        // rotate: 40,
                        textStyle: {
                            fontFamily: 'Microsoft YaHei',
                            color: 'white'
                        },
                        rotate: 30,
                    },
                },

                yAxis: {
                    type: 'value',
                    axisLine: {
                        lineStyle: {
                            color: '#778C96'
                        }
                    },
                    splitLine: {
                        show: true,
                        lineStyle: {
                            type: 'dashed',
                            color: '#2A6283',
                            opacity: '0.3'
                        },
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        // interval: 0,
                        // rotate: 40,
                        textStyle: {
                            fontFamily: 'Microsoft YaHei',
                            color: 'white'
                        },
                    },
                },
                series: [{
                    name: '民警',
                    type: 'bar',
                    barWidth: '15%',
                    itemStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: '#34CDFF'
                            }, {
                                offset: 0.8,
                                color: '#048AE2'
                            }]),
                            barBorderRadius: 0,
                        },
                    },
                    data: data["firstData"]["民警"]
                },
                    {
                        name: '辅警',
                        type: 'bar',
                        barWidth: '15%',
                        itemStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    offset: 0,
                                    color: '#03F8F6'
                                }, {
                                    offset: 0.8,
                                    color: '#4BA09A'
                                }]),
                                barBorderRadius: 0,
                            }

                        },
                        data: data["firstData"]["辅警"]
                    }]
            };

            myChart.setOption(policeoption);

            var app = 5;
            setInterval(function () {
                var xdata = data["name"];
                var ydata0 = data["data"]["民警"];
                var ydata1 = data["data"]["辅警"];
                var datalen = data["data"]["辅警"].length;
                var pushdata0 = 0;
                var pushdata1 = 0;
                var pushxdata0 = "";
                var xdatalen = app + 1;
                if (xdatalen < datalen) {
                    pushdata0 = ydata0[xdatalen];
                    pushdata1 = ydata1[xdatalen];
                    pushxdata0 = xdata[xdatalen];
                } else {
                    pushdata0 = ydata0[xdatalen % datalen];
                    pushdata1 = ydata1[xdatalen % datalen];
                    pushxdata0 = xdata[xdatalen % datalen];
                }
                var data0 = policeoption.series[0].data;
                var data1 = policeoption.series[1].data;
                data0.shift();
                data0.push(pushdata0);
                data1.shift();
                data1.push(pushdata1);

                policeoption.xAxis.data.shift();
                policeoption.xAxis.data.push(pushxdata0);
                app++;
                myChart.setOption(policeoption);
            }, 5000);
        })

}


</script>



