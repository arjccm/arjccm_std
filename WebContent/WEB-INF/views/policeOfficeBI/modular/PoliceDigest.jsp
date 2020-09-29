<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<style>

</style>

<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>

<section>
    <div class="context" content="${ctx}" style="display: none"></div>
    <div class="box_header">
        <div class="box_header_title">
            <div class="left_bg"></div>
            <p>近30天警情摘要</p>
            <div class="right_bg"></div>
        </div>
        <div class="box_bg_01">
            <div class="box_bg_02"></div>
        </div>
    </div>
    <div id="policeDigest" class="box_content">
        123456
    </div>
</section>
<script>

    function PoliceDigest() {
        


        // project-Path
        var context = $(".context").attr("content");

        $.getJSON(context + "/sys/BicMap/policeDigest", {}, function (data) {
            var myChart = echarts.init(document.getElementById('policeDigest'));

            var colorAttr = ['#07CDF1', '#7085FB', '#A77FF8', '#DD3F60', '#BE25C7', '#FF747B', '#FDDE01', '#FF6803', '#09A2F1', '#2875EC'];

            var lineColor = '#32bcfe';

            var insideColor = '#FFFFFF';

            var total = 0;

            for (var i = 0; i < data.length; i++) {
                total += data[i].value;
            }

            var option = {
                // backgroundColor: '#031845',
                title: {
                    text: "30天警情",
                    subtext:total,
                    left: 'center',
                    top: '43%',
                    itemGap:8,
                    textStyle: {
                        color: "#FFF",
                        fontSize: 13,
                    },
                    subtextStyle:{
                        color:"#FFF",
                        fontSize: 13,
                    }
                },
                series: [
                    {
                        type: 'pie',
                        radius: ['65%', '50%'],
                        center: ['50%', '50%'],
                        hoverAnimation: false,
                        data: [100],
                        label: {
                            show: false
                        },
                        itemStyle: {
                            normal: {
                                color: '#2bb1ff',
                                opacity:0.4
                            }
                        },
                    },

                    {

                        type: 'pie',
                        radius: ['30%', '34%'],
                        center: ['50%', '50%'],
                        hoverAnimation: false,
                        data: [100],
                        label: {
                            show: false
                        },
                        itemStyle: {
                            normal: {
                                color: '#FFFFFF',
                                opacity: '0.3'
                            }

                        },
                        z:20
                    },

                    {
                        color: insideColor,
                        type: 'pie',
                        radius: ['51%', '51.5%'],
                        center: ['50%', '50%'],
                        hoverAnimation: false,
                        data: [100],
                        label: {
                            show: false
                        },
                        itemStyle: {
                            normal: {
                                color: '#FFFFFF',
                                opacity: '0.3'
                            }

                        },
                        z: 20
                    },
                    {
                        color: insideColor,
                        type: 'pie',
                        radius: ['45%', '45.5%'],
                        center: ['50%', '50%'],
                        hoverAnimation: false,
                        data: [100],
                        label: {
                            show: false
                        },
                        itemStyle: {
                            normal: {
                                color: '#FFFFFF',
                                opacity: '0.3'
                            }

                        },
                        z: 20
                    },
                    {
                        color: insideColor,
                        type: 'pie',
                        radius: ['39%', '39.5%'],
                        center: ['50%', '50%'],
                        hoverAnimation: false,
                        data: [100],
                        label: {
                            show: false
                        },
                        itemStyle: {
                            normal: {
                                color: '#FFFFFF',
                                opacity: '0.3'
                            }

                        },
                        z: 20
                    },
                    {
                        type: 'pie',
                        radius: ['30%', '56%'],
                        center: ['50%', '50%'],
                        color: colorAttr,
                        itemStyle: {
                            normal: {
                                // borderWidth: 5,
                                // borderColor: '#031845',
                            }
                        },
                        hoverAnimation: false,
                        data: data,
                        labelLine: {
                            normal: {
                                show: true,
                                length: 12,
                                length2: 50,
                                lineStyle: {
                                    color: '#CCCCCC',
                                    width: 1,
                                    opacity:0.4
                                }
                            }
                        },
                        label: {
                            normal: {
                                show: true,
                                formatter: "{b} : {c}",
                                height: 37,
                                color: '#fff',
                                padding: [0, -52],
                                fontSize: 14,
                                rich: {}
                            }
                        }
                    },
                ]
            };
            myChart.setOption(option);
        })
    }

</script>


