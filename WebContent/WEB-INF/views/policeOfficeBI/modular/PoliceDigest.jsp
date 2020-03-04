<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<style>

</style>

<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts-liquidfill.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/echarts-liquidfill/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-4.2.1/echarts.min.js"></script>

<section>
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

    $(function () {

        var myChart = echarts.init(document.getElementById('policeDigest'));

        PoliceForceDistribution();

        function PoliceForceDistribution() {


            option = {
                // backgroundColor: '#031845',
                // title:{
                //     text:"123",
                //     left:'center',
                //     top:'45%',
                //     textStyle:{
                //         color:"#FFF",
                //         fontSize:"80px",

                //     }
                // },
                tooltip: {
                    trigger: 'item',
                    formatter: "{b} : {d}% <br/> {c}"
                },
                //  graphic: {
                //  elements: [
                //         {
                //          type: 'text',
                //          left: 'center', // 相对父元素居中
                //          top: 'center',  // 相对父元素上下的位置
                //          style: {
                //              fill: '#FFF',
                //               text: ['357'],
                //               zlevel:"100",
                //               font: '80px Arial Normal',
                //                  }
                //         }]
                //       },
                //  title: {
                //     text:'总考生数',
                //     left:'center',
                //     top:'center',
                //     padding:[24,0],
                //     textStyle:{
                //         color:'#fff',
                //         fontSize:18*scale,
                //         align:'center'
                //     }
                // },
                title: {
                    text: '3246',
                    subtext: '重点人员(人)',
                    // x: 'center',
                    // y: '43%',
                    textStyle: {
                        // fontSize: 80,
                        fontWeight: 'normal',
                        color: '#00FFFF',
                    },
                    subtextStyle: {
                        // fontSize: 28,
                        fontWeight: 'normal',
                        align:"center",
                        color:'#CCCCCC'
                    },
                },
                series: [{
                    type: 'pie',
                    radius: ['40', '60'],
                    center: ['50%', '50%'],
                    color: ['#80C269', '#00FFFF', '#0090F1', '#FFA800','#4658F6'],
                    itemStyle:{
                        normal: {
                            borderWidth: 5,
                            borderColor: '#031845',
                        }
                    },
                    data: [{
                        value: 27,
                        name: '严重不满人员'
                    },
                        {
                            value: 30,
                            name: '关注群体'
                        },
                        {
                            value: 24,
                            name: '散居外国人'
                        },
                        {
                            value: 27,
                            name: '上访重点人'
                        },
                        {
                            value: 27,
                            name: '重点精神病'
                        }

                    ],
                    labelLine: {
                        normal: {
                            show: true,
                            // length: 50,
                            // length2: 50,
                            lineStyle: {
                                color: '#CCCCCC',
                                width: 2
                            }
                        }
                    },
                    label: {
                        normal: {
                            formatter: '{b|{b}}\n{hr|}\n{c|{c}%}',
                            rich: {
                                b: {
                                    // fontSize: 32,
                                    color: '#FFF',
                                    align: 'left',
                                    // padding: 4
                                },
                                hr: {
                                    borderColor: '#CCCCCC',
                                    width: '100%',
                                    borderWidth: 2,
                                    height: 0
                                },
                                c: {
                                    // fontSize: 32,
                                    align: 'center',
                                    // padding: 4,
                                    color:'#00EDED'
                                }
                            }
                        }
                    }
                }

                ]
            };

            myChart.setOption(option);
        }
    });

</script>


