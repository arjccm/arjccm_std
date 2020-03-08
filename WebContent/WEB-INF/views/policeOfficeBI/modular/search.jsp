<%@ page contentType="text/html;charset=UTF-8" %>
<style>

</style>
<section>
    <div class="context" content="${ctx}" style="display: none"></div>
    <div class="box_header">
        <div class="box_header_title">
            <div class="left_bg"></div>
            <p>重点单位检查问题</p>
            <div class="right_bg"></div>
        </div>
        <div class="box_bg_01">
            <div class="box_bg_02"></div>
        </div>
    </div>
    <div class="box_content" id="pic2">

    </div>
</section>
<script>

    function search() {
        

        var context = $(".context").attr("content");
        $.post(context + "/sys/BicMap/search", {}, function (data) {

            var myChart1 = echarts.init(document.getElementById('pic2'));
            console.log(data)
            var xData1 = function () {
                var dataArray = [];
                for (var i = 0; i < data["jlData"].length; i++) {
                    dataArray.push(Number(data["jlData"][i] / data["sumData"] * 100).toFixed());
                }
                return dataArray;
            }();


            var myColor = ['#32d6ee', '#32d6ee', '#32d6ee', '#32d6ee', '#32d6ee'];
            var rightIcon =
                'image://data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAQCAYAAAArij59AAAAx0lEQVQokZ3RvUoDYRCF4We/bPAnqKCSRrHxBsTS2/DGvCexsbYIKIKNFv4UEUMkZo9FdkFibDxwihnemQMzVZKCTexiDz2M8Yz3GjX2cdJ6HXe4xr0kgyRnSS6SjJM0SW6TnCcZ1uhjiFNsWegYR9goKBi0+Z0q7KBf2qLX+qdqlLI09UtlVfPfQP4CgmYF0CAd8ImPJWCCecEX3jBainvCtGCGR1ziBnNcWfxjUiXpYRsHOLQ40Ase8Fol6S651rpqt04x+wZZQEmC4eTFRAAAAABJRU5ErkJggg==';
            option = {
                grid: {
                    top: "10%",
                    left: "10%",
                    right: "5%",
                    bottom: "10%",
                    containLabel: true
                },

                // backgroundColor: '#0e2147',
                xAxis: {
                    show: false
                },
                yAxis: [{
                    show: true,
                    data: data["name"],
                    inverse: true,
                    axisLine: {
                        show: false
                    },
                    splitLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        color: '#fff',

                        formatter: function (value, index) {
                            return [
                                '{lg|' + (index + 1) + '}' + '{title|' + value + '} '
                            ].join('\n')
                        },
                        rich: {
                            lg: {
                                backgroundColor: '#32d6ee',
                                color: '#fff',
                                borderRadius: 0,
                                // padding: 5,
                                align: 'center',
                                fontSize: 12,
                                width: 15,
                                height: 16,
                            },
                        }
                    },


                }, {
                    show: true,
                    inverse: true,
                    data: data["jlData"],
                    axisLabel: {
                        textStyle: {
                            fontSize: 12,
                            color: '#fff',
                        },
                    },
                    axisLine: {
                        show: false
                    },
                    splitLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },

                }],
                series: [{
                    name: '条',
                    type: 'bar',
                    yAxisIndex: 0,
                    data: xData1,
                    barWidth: 5,
                    itemStyle: {
                        normal: {
                            barBorderRadius: 1,
                            color: function (params) {
                                var num = myColor.length;
                                return myColor[params.dataIndex % num]
                            },
                        }
                    },
                    label: {
                        normal: {
                            show: false,
                            position: 'inside',
                            formatter: '{c}%'
                        }
                    },
                }, {
                    name: '框',
                    type: 'bar',
                    yAxisIndex: 1,
                    barGap: '-100%',
                    data: [100, 100, 100, 100, 100],
                    barWidth: 13,
                    itemStyle: {
                        normal: {
                            color: 'none',
                            borderColor: '#fff',
                            borderWidth: 1,
                            barBorderRadius: 1,
                        }
                    }
                },
                    {
                        type: 'pictorialBar',
                        symbol: rightIcon,
                        symbolPosition: 'end',
                        symbolSize: [4, 12],
                        symbolRotate: 0,
                        symbolOffset: [3, 0],
                        z: 4,
                        data: xData1,
                    },]
            };
            myChart1.setOption(option);
        })
    }
</script>


