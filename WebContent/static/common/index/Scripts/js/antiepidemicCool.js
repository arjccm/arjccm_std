/**
 * Created by oHa on 2017/12/28.
 */
/*Object.assign() 之 IE 兼容 （TypeError: 对象不支持“assign”属性或方法）*/
if (typeof Object.assign != 'function') {
    Object.assign = function(target) {
        'use strict';
        if (target == null) {
            throw new TypeError('Cannot convert undefined or null to object');
        }

        target = Object(target);
        for (var index = 1; index < arguments.length; index++) {
            var source = arguments[index];
            if (source != null) {
                for (var key in source) {
                    if (Object.prototype.hasOwnProperty.call(source, key)) {
                        target[key] = source[key];
                    }
                }
            }
        }
        return target;
    };
}

var windowsHeight, _fontSize = 14, _fontSize1 = 26, _fontSize2 = 24, _fontSize3 = 20, breakData = 8,
    legendTop = '30%', radiusData = ['40%', '65%'], lengthECharts = 30, mapHeigth = '90%', zoom = 14.75,
    centerCoordinate = [117.663920, 39.035650], echarts3X = "48%", echarts3y = "40%", ItemGap = 20;

var streetFlag, vccmorgFlag, communityFlag, gridFlag, buildFlag, eventFlag, partsFlag, landsFlag, videoFlag,
    broadcastFlag, policeroomFlag, workstationFlag, schoolPlaceFlag, keyPlaceFlag, keyPersonFlag, rentingPersonFlag,
    publicPlaceFlag, popLocationFlag, SetTopBoxFlag;
streetFlag = true;
communityFlag = false;
gridFlag = false;
// 基础颜色表
var color = ['#CA410B', '#12B3B6', '#A269C6', '#883CBD', '#401EC3', '#4366D9',
    '#D26320', '#06AC7D', '#b9ce96', '#a99bbc', '#92c3d4', '#ffdf5f'];
$(function () {
    //年月日
    $('#calendarYear').html(year)
    $('#calendarMonth').html(month)
    $('#calendarDay').html(day)

    var context = $(".context").attr("content");
    var noCache = new Date();


    //疫情人员年龄段
    showechleftContent1();

    function showechleftContent1() {
        /*var zs;
        var value;  //18岁以下
        var value1;//18-30岁青年
        var value2;//30-60中青年
        var value3;//60以上老年*!/
        //人员年龄段
        $.ajax({
            type: "get",
            url: ctx + "/pop/ccmPeopleAntiepidemic/getCountage",
            async: false,
            success: function (data) {
                zs=parseInt(data[0]['type']);
                value=parseInt(data[0]['value']); //18岁以下
                value1=parseInt(data[0]['value1']); //18-30岁青年
                value2=parseInt(data[0]['value2']); //30-60中青年
                value3=parseInt(data[0]['value3']); //60以上老年
            }

        })*/
        var leftContent1Charts = echarts.init(document.getElementById('leftContent1Body'));
        var piebg = {
            name: '',
            type: 'pie',
            labelLine: {
                normal: {
                    show: false
                }
            },
            data: [{
                value: 0
            }],
            avoidLabelOverlap: false,
            animation: false
        };
        option = {
            // title : {
            //     text: '2018 农场DCC 软件提交占比',
            //     subtext: '数据来源于 Deadline',
            //     x:'center'
            // },
            title: {
                text: '总数',
                subtext: 7789,
                // subtext: zs,
                textStyle: {
                    color: '#f2f2f2',
                    fontSize: 20,
                    //align: 'center'
                },
                textAlign:'center',
                subtextStyle: {
                    fontSize: 18,
                    color: ['#ff9d19']
                },
                x: '44%',
                y: '40%',
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                left: '7%',
                top: '90%',
                width: '100%',
                icon: 'rect',
                align: 'left',
                textStyle: {
                    color: '#fff',
                },
                // itemWidth: 10,  // 设置宽度
                // itemHeight: 10, // 设置高度
                itemGap:11,
                data: ['18岁以下', '18-30岁青年', '30-60中青年', '60以上老年']
            },
            series: [{
                name: '数据',
                type: 'pie',
                radius: ['40%', '70%'],
                center: ['45%', '49%'],
                data: [{
                    value: 12059.02,
                    // value: value,
                    name: '18岁以下',
                    itemStyle:{
                        color:'#32F7FF'
                    },
                },
                    {
                        value: 10735.45,
                        // value: value1,
                        name: '18-30岁青年',
                        itemStyle:{
                            color:'#6576FA'
                        },
                    },
                    {
                        value: 52821.32,
                        value: value2,
                        // name: '30-60中青年',
                        itemStyle:{
                            color:'#FC9A2F'
                        },
                    },
                    {
                        value: 6087.68,
                        // value: value3,
                        name: '60以上老年',
                        itemStyle:{
                            color:'#2FFF1D'
                        },
                    }
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            },
                Object.assign({}, piebg, {
                    radius: ['1%', '75%'],
                    center: ['45%', '49%'],
                    tooltip: {
                        backgroundColor: 'rgba(0,0,0,0)',
                        formatter: " "
                    },
                    itemStyle: {
                        normal: {
                            color: {
                                type: 'radial',
                                x: 0.5,
                                y: 0.5,
                                r: 0.5,
                                colorStops: [{
                                    offset: 0,
                                    color: 'rgba(16,60,94,0)' // 0% 处的颜色
                                },
                                    {
                                        offset: 0.2,
                                        color: 'rgba(16,60,94,0)' // 0% 处的颜色
                                    },
                                    {
                                        offset: 0.3,
                                        color: 'rgba(16,60,94,0)' // 0% 处的颜色
                                    },
                                    {
                                        offset: 0.4,
                                        color: 'rgba(16,60,94,0)' // 0% 处的颜色
                                    },
                                    {
                                        offset: 0.45,
                                        color: 'rgba(43,177,255,0.5)' // 0% 处的颜色
                                    },
                                    {
                                        offset: 0.55,
                                        color: 'rgba(5,5,5,0.1)' // 0% 处的颜色
                                    },
                                    {
                                        offset: 0.6,
                                        color: 'rgba(5,5,5,0.1)' // 0% 处的颜色
                                    },
                                    {
                                        offset: 0.7,
                                        color: 'rgba(5,5,5,0.1)' // 0% 处的颜色
                                    },
                                    {
                                        offset: 0.8,
                                        color: 'rgba(5,5,5,0.1)' // 0% 处的颜色
                                    },
                                    {
                                        offset: 0.9,
                                        color: 'rgba(5,5,5,0.1)' // 0% 处的颜色
                                    },
                                    {
                                        offset: 1,
                                        color: 'rgba(40,169,252,0.5)' // 100% 处的颜色
                                    },
                                ],
                                globalCoord: false // 缺省为 false
                            }
                        }
                    },
                    z: -10
                })
            ]
        };

        leftContent1Charts.setOption(option);
    }

    //疫情人员入琼趋势
    showechLeftContent2()

    function showechLeftContent2() {
        var type ;
        var zs; //总数
        var wh; //武汉
        /*$.ajax({
            type: "get",
            url: ctx + "/pop/ccmPeopleAntiepidemic/countBycomeHainanDate",
            async: false,
            success: function (data) {
                type = data[0]['type']
                zs= data[0]['value']; //总数
                wh= data[0]['value1']; //武汉*!/
            }

        })*/
        var echLeftContent2 = echarts.init(document.getElementById('leftContent2Body'));
       /*var option = {
            legend: {
                data: ['人数', '武汉籍'],
                x: '100px', // 对齐方式
                itemGap: 100, // item之间的距离
                textStyle: {
                    color: '#FFFFFF'
                },
            },

            xAxis: {
                type: 'category',
                data: ['01-14', '01-15', '01-16', '01-17', '01-18', '01-19', '01-20','01-21', '01-22', '01-23', '01-24'],
                axisLabel: {
                    color: '#FFFFFF',
                    rotate:60,
                },

            },
            yAxis: [
                {
                    type: 'value',
                    scale: true,
                    max: 1800,
                    min: 0,
                    boundaryGap: [0.2, 0.2],
                    axisLabel: {
                        color: '#FFFFFF'
                    },
                    axisTick: {
                        show: true,
                        lineStyle: {
                            color: '#FFF',
                            opacity: 0.2
                        }
                    },

                },
                {
                    type: 'value',
                    scale: true,
                    max: 1800,
                    min: 0,
                    boundaryGap: [0.2, 0.2],
                    axisLabel: {
                        color: '#FFFFFF'
                    }
                },

            ],
            series: [{
                data: [311, 359, 385, 548, 887, 1142, 1484,1553, 1488, 957, 513],
                type: 'bar',
                name: '人数',
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1, [{
                                offset: 0,
                                color: '#32F7FF'
                            },
                                {
                                    offset: 1,
                                    color: '#32F7FF'
                                }
                            ])
                    }
                }
            },
                {
                    data: [108, 121, 138, 188, 285, 381, 486,534, 546, 332, 174],
                    type: 'line',
                    name: '武汉籍',
                    symbolSize: 10, // 控制线条上 点 的大小
                    itemStyle:{
                        color:'#FC9A2F'
                    },
                }
            ]
        };*/
        var option = {
            tooltip: {
                trigger: 'item',
            },
            legend: {
                data: ['人数', '武汉籍'],
                textStyle: {
                    color: '#9DCCFF'
                },
                left:'65%'
            },
            grid: {
                top: '12%',
                left: '3%',
                right: '5%',
                bottom: '10%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                /data: ['01-14', '01-15', '01-16', '01-17', '01-18', '01-19', '01-20','01-21', '01-22', '01-23', '01-24'],
                // data:data[0]['type'],
                //data: data['日期'],
                axisLabel: {
                    show: true,
                    color: '#FFFFFF',
                    rotate:60,
                    fontsize: '12px'
                },
                axisLine: {
                    lineStyle: {
                        color: '#FFFFFF',
                        opacity: 0.2
                    }
                },
                axisTick: {
                    show: false,
                },
            }],
            yAxis: [{
                type: 'value',
                axisLabel: {
                    formatter: '{value}',
                    color: '#9DCCFF',
                    fontsize: '12px'
                },
                splitLine: {
                    show: true,
                    lineStyle: {
                        // 使用深浅的间隔色
                        color: '#2A6283 ',
                        type:'dashed',
                    },

                },
                axisLine: {
                    lineStyle: {
                        color: '#FFFFFF',
                        opacity: 0.2
                    }
                },
                axisTick: {
                    show: true,
                    lineStyle: {
                        color: '#FFF',
                        opacity: 0.2
                    }
                },
            },
                {
                    type: 'value',
                    max: 1800,
                    splitLine: {
                        show: false
                    },
                    axisLabel: {
                        formatter: '{value}',
                        color: '#9DCCFF',
                        fontsize: '12px'
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#FFFFFF',
                            opacity: 0.2
                        }
                    },
                    axisTick: {
                        show: true,
                        lineStyle: {
                            color: '#FFF',
                            opacity: 0.2
                        }
                    },
                }
            ],
            series: [{
                name: '人数',
                type: 'bar',
                barWidth: '60%',
                //data: data['人数'],
                data: [311, 359, 385, 548, 887, 1142, 1484,1553, 1488, 957, 513],
                // data: data[0]['value'],
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1, [{
                                offset: 0,
                                color: '#32F7FF'
                            },
                                {
                                    offset: 1,
                                    color: '#091C41'
                                }
                            ]),
                        barBorderRadius: 10,
                    }

                },
            },
                {
                    name: '武汉籍',
                     data: [108, 121, 138, 188, 285, 381, 486,534, 546, 332, 174],
                    // data: data[0]['value1'],
                    type: 'line',
                    symbolSize: 10, // 控制线条上 点 的大小
                    yAxisIndex: 1,
                    //data: data['新增人数'],
                    itemStyle: {
                        normal: {
                            color: '#EBBE1B'
                        }
                    },
                }
            ]
        };
        echLeftContent2.setOption(option);

    }



     //疫情人员现状
    showechRightContent2();

    function showechRightContent2(){
        var echRightContent2 = echarts.init(document.getElementById('echRightContent2'));
        var dataStyle = {
            normal: {
                label: {
                    show: false
                },
                labelLine: {
                    show: false
                },
                // shadowBlur: 15,
                // shadowColor: 'white',
            }
        };
        var placeHolderStyle = {
            normal: {
                color: 'rgba(0,0,0,0)',
                label: {
                    show: false
                },
                labelLine: {
                    show: false
                }
            },
            emphasis: {
                color: 'rgba(0,0,0,0)'
            }
        };
        var piebg = {
            name: '',
            type: 'pie',
            labelLine: {
                normal: {
                    show: false
                }
            },
            data: [{
                value: 0
            }],
            avoidLabelOverlap: false,
            animation: false,

            barBorderRadius: 10

        };
        option = {
            color: ['#32F7FF', '#4358FF', '#FC9A2F'],

            legend: {
                top: "30%",
                x: 'right',
                left: "60%",
                data: ['身体状况异常', '已满14天', '已移交卫健委'],
                // itemGap: 38,
                textStyle: {
                    color: '#fff',
                },

                selectedMode: true,
                orient: "vertical",

            },
            grid: {
                top: '3%',
                bottom: '66%',
                left: "21%",
                containLabel: false
            },
            xAxis: [{
                show: false
            }],
            yAxis: [{
                type: 'category',
                inverse: true,
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    interval: 0,
                    inside: true,
                    textStyle: {
                        color: "#fff",
                        fontSize: 10,
                    },
                    show: true
                },
                data: [1096, 12560, 3962]
            }],

            series: [{
                name: 'Line 4',
                type: 'pie',
                clockWise: true,
                hoverAnimation: false,
                radius: ['73%', '83%'],
                center: ['30%', '50%'],
                itemStyle: dataStyle,

                data: [{
                    value: 1096,
                    name: '身体状况异常',
                    tooltip: {
                        show: true
                    },
                }, {
                    value: 17618,
                    name: '总数',
                    tooltip: {
                        show: false
                    },
                    itemStyle: placeHolderStyle
                }

                ],
            }, {
                name: 'Line 3',
                type: 'pie',
                clockWise: true,
                radius: ['58%', '68%'],
                center: ['30%', '50%'],
                itemStyle: dataStyle,
                hoverAnimation: false,

                data: [{
                    value: 12560,
                    name: '已满14天'
                }, {
                    value: 17618,
                    name: '总数',
                    tooltip: {
                        show: false
                    },
                    itemStyle: placeHolderStyle
                }]
            }, {
                name: 'Line 2',
                type: 'pie',
                clockWise: true,
                hoverAnimation: false,
                radius: ['43%', '53%'],
                center: ['30%', '50%'],
                itemStyle: dataStyle,

                data: [{
                    value: 3962,
                    name: '已移交卫健委'
                }, {
                    value: 17618,
                    name: '总数',
                    tooltip: {
                        show: false
                    },
                    itemStyle: placeHolderStyle
                }]
            }, Object.assign({}, piebg, {
                radius: ['83%', '93%'],
                center: ['30%', '48%'],
                tooltip: {
                    backgroundColor: 'rgba(0,0,0,0)',
                    formatter: " "
                },
                itemStyle: {
                    normal: {
                        color: {
                            type: 'radial',
                            x: 0.5,
                            y: 0.5,
                            r: 0.5,
                            colorStops: [{
                                offset: 0,
                                color: 'rgba(16,60,94,0)' // 0% 处的颜色
                            },
                                {
                                    offset: 0.2,
                                    color: 'rgba(16,60,94,0)' // 0% 处的颜色
                                },
                                {
                                    offset: 0.3,
                                    color: 'rgba(16,60,94,0)' // 0% 处的颜色
                                },
                                {
                                    offset: 0.4,
                                    color: 'rgba(16,60,94,0)' // 0% 处的颜色
                                },
                                {
                                    offset: 0.45,
                                    color: 'rgba(43,177,255,0.5)' // 0% 处的颜色
                                },
                                {
                                    offset: 0.55,
                                    color: 'rgba(5,5,5,0.1)' // 0% 处的颜色
                                },
                                {
                                    offset: 0.6,
                                    color: 'rgba(5,5,5,0.1)' // 0% 处的颜色
                                },
                                {
                                    offset: 0.7,
                                    color: 'rgba(5,5,5,0.1)' // 0% 处的颜色
                                },
                                {
                                    offset: 0.8,
                                    color: 'rgba(5,5,5,0.1)' // 0% 处的颜色
                                },
                                {
                                    offset: 0.9,
                                    color: 'rgba(5,5,5,0.1)' // 0% 处的颜色
                                },
                                {
                                    offset: 1,
                                    color: 'rgba(40,169,252,0.5)' // 100% 处的颜色
                                },
                            ],
                            globalCoord: false // 缺省为 false
                        }
                    }
                },
                z: -10
            })
            ],
        };

        echRightContent2.setOption(option);

    }
//人员分布
    getDistribution();
    function getDistribution() {
        $.getJSON(ctx + "/pop/ccmPeopleAntiepidemic/getDistribution", {"noCache": noCache}, function (data) {
            showechRightContent1(data)
            // var option = showDistribution(dataX, bgNum, dataY);
            // rightContent3Charts.setOption(option);
        });
    }
    //疫情人员分布
    //showechRightContent1();
    function showechRightContent1(data){
       var echRightContent1 = echarts.init(document.getElementById('echRightContent1'));
       var option = {
           /* backgroundColor: '#0b214a',*/
            color: '#FF00FFFF',
            grid: {
                left: '6%',
                top: '14%',
                right: '6%',
                bottom: '7%',
                containLabel: true
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            xAxis: [{
                type: 'category',
                // data: ["崖州区", "天涯区", "吉阳区", "海棠区", "育才生态区"],
                data: data[0]['type'],
                axisTick: {
                    show: false,
                    alignWithLabel: true,

                },

                axisLine: {
                    lineStyle: {
                        color: '#FFFFFFFF',
                        opacity: 0.2
                    }
                },
                axisLabel: {
                    color: '#9DCCFF',
                    fontSize: 12,
                    interval:0
                }
            }],
            yAxis: {
                type: 'value',
                axisLine: {
                    lineStyle: {
                        color: '#FFF',
                        opacity: 0.2
                    }
                },
                axisTick: {
                    show: true,
                    lineStyle: {
                        color: '#FFF',
                        opacity: 0.2
                    }
                },
                splitLine: {
                    show: false
                },
                axisLabel: {
                    color: 'rgba(255,255,255,0.5)',
                    fontSize: 12,
                    fontFamily: 'MicrosoftYaHei'
                }
            },
            series: [{
                tooltip: {
                    show: false
                },
                name: 'bg',
                type: 'pictorialBar',
                barWidth: '60%',
                silent: true,
                symbol: 'rect',
                symbolRepeat: true,
                symbolMargin: 1,
                barMinHeight: 150,
                symbolSize: [40, 10],
                itemStyle: {
                    normal: {
                        show: true,
                        //  color: function(params) {
                        //      return colorList[params.dataIndex]
                        //  },
                        color:'#0066cc',  //剩余数据
                        barBorderRadius: 50,
                        borderWidth: 0,
                        opacity: 0.3,
                        borderColor: '#FF00FFFF',
                    }
                },
                data: [data[0]['value'], data[0]['value'], data[0]['value'], data[0]['value'], data[0]['value']]
            }, {
                type: 'pictorialBar',
                animation: true,
                animationDuration: 600,
                symbol: 'rect',
                symbolRepeat: true,
                symbolMargin: 1,
                symbolSize: [40, 10],
                barWidth: '60%',
                itemStyle: {
                    normal: {
                        //  color: function(params) {
                        //      return colorList[params.dataIndex]
                        //  },
                        color:' #00FFFF ',    //数据颜色
                        label: {
                            show: false
                        }
                    }
                },
                data: data[0]['value1']
            }]
        };

        echRightContent1.setOption(option);
    }


    //户籍统计信息
    getCountdomicile();
    function getCountdomicile() {
        $.getJSON(ctx + "/pop/ccmPeopleAntiepidemic/getCountdomicile", {"noCache": noCache}, function (data) {

            console.log("户籍统计信息")
            var value = data['type'];
            console.log(value)
            var value1 = data['value'];
            console.log(value1)
            var value2 = data['value1'];
            console.log(value2)
            var value3 = data['value2'];
            console.log(value3)
            var value4 = data['value3'];
            console.log(value4)


            // var option = showDistribution(dataX, bgNum, dataY);
            // rightContent3Charts.setOption(option);
        });
    }

    //人员隔离措施
    getCounttakeSteps();
    function getCounttakeSteps() {
        $.getJSON(ctx + "/pop/ccmPeopleAntiepidemic/getCounttakeSteps", {"noCache": noCache}, function (data) {
            console.log("人员隔离措施")
            var value1 = data['value'];
            console.log(value1)
            var value2 = data['value1'];
            console.log(value2)
            var value3 = data['value2'];
            console.log(value3)
            var value4 = data['value3'];
            console.log(value4)
            // var option = showDistribution(dataX, bgNum, dataY);
            // rightContent3Charts.setOption(option);
        });
    }

    //人员现状
    getCountstatus();
    function getCountstatus() {
        $.getJSON(ctx + "/pop/ccmPeopleAntiepidemic/getCountstatus", {"noCache": noCache}, function (data) {
            console.log("人员现状")
            var value1 = data['value'];
            console.log(value1)
            var value2 = data['value1'];
            console.log(value2)
            var value3 = data['value2'];
            console.log(value3)
            var value4 = data['value3'];
            console.log(value4)
            // var option = showDistribution(dataX, bgNum, dataY);
            // rightContent3Charts.setOption(option);
        });
    }









    /********************地图***********************/
    //地图
    map();
    //街道画线
    // lightLine();
    //初始化网格
    initorgAreaMap();

    $('#main').height($(window).height());
    $('.height100').height($('#main').height() - 70);
    windowsHeight = $(window).width();
    if (windowsHeight >= 1680 && windowsHeight < 1920) {
        _fontSize = 14;
        radiusData = ['40%', '60%'];
        echarts3X = "48%";
        echarts3y = "40%";
        zoom = 14.7;
        centerCoordinate = [117.662920, 39.035650]
        lengthECharts = 30;
        _fontSize1 = 26;
        breakData = 8;
        mapHeigth = '90%'
    } else if (windowsHeight >= 1600 && windowsHeight < 1680) {
        _fontSize = 12;
        radiusData = ['40%', '60%'];
        echarts3X = "48%";
        echarts3y = "35%";
        zoom = 14.4;
        ItemGap = 0;
        centerCoordinate = [117.662920, 39.035650]
        lengthECharts = 30;
        _fontSize1 = 26;
        breakData = 8;
        mapHeigth = '90%'
    } else if (windowsHeight >= 1440 && windowsHeight < 1660) {
        _fontSize = 12;
        radiusData = ['40%', '58%'];
        zoom = 14.4;
        centerCoordinate = [117.662920, 39.035650]
        lengthECharts = 30;
        _fontSize1 = 26;
        ItemGap = 0;
        _fontSize2 = 18,
            _fontSize3 = 16,
            breakData = 8;
        mapHeigth = '90%'
    } else if (windowsHeight < 1440) {
        _fontSize = 12;
        radiusData = ['40%', '58%'];
        zoom = 14.1;
        centerCoordinate = [117.662920, 39.035650]
        lengthECharts = 30;
        _fontSize1 = 26;
        ItemGap = -10;
        _fontSize2 = 16,
            _fontSize3 = 14,
            breakData = 8;
        mapHeigth = '90%'
    }

    // 地图
    function map() {
        // var centerCoordinate = [113.48940277,34.526999206];    //新密中心点
        //  var centerCoordinate = [109.40, 18.53];    //三亚中心点centerCoordinateSituation

        // 地图默认数据设置
        var defaultPrams = {
            id: 'mapMask',
            centerCoordinate: centerCoordinateSituation,
            zoom: zoomPop,
            maxZoom: maxZoom,
            minZoom: minZoom,
            baseUrl: baseUrlT,
            zoomShowOrHide: false,// 缩小放大
            overviewMap: false,
            selectPointerFlag: false
            // 鹰眼图
        }

        viewSituationFun(centerCoordinateSituation, zoomPop)  //view 初始化
        Map = new ArjMap.Map(defaultPrams);
        // 加载地图
        Map.drawMapSituationKeShiHua();
        Pubmap = Map.map;
        /*	var zuobiao=[ 117.655920, 39.038050 ];
            var zuobiao1=[ 117.653920, 39.035050 ];
            var zuobiao2=[ 117.663920, 39.042050 ];
            Map.postcomposeOlIndex('紧急',zuobiao,"123",'0')
            Map.postcomposeOlIndex('紧急',zuobiao1,"1234",'0')
            Map.postcomposeOlIndex('紧急',zuobiao2,"12345",'0')*/

        // 监听地图层级变化
        Pubmap.getView().on('change:resolution', checkZoom);// checkZoom为调用的函数
        function checkZoom(map_level) {
            var zoom = Pubmap.getView().getZoom();
            if (Pubmap.getView().getZoom() <= 10) {
                Map.layersIsShow('communitys', false);
                Map.layersIsShow('streets', true);
                Map.layersIsShow('grids', false);
                communityFlag = false;
                streetFlag = true;
                gridFlag = false;
            } else if (Pubmap.getView().getZoom() <= 13
                && Pubmap.getView().getZoom() > 10) {
                Map.layersIsShow('communitys', true);
                Map.layersIsShow('streets', false);
                Map.layersIsShow('grids', false);
                communityFlag = true;
                streetFlag = false;
                gridFlag = false;
            } else if (Pubmap.getView().getZoom() > 13
                && Pubmap.getView().getZoom() <= 16) {
                Map.layersIsShow('communitys', false);
                Map.layersIsShow('streets', false);
                Map.layersIsShow('grids', true);
                communityFlag = false;
                streetFlag = false;
                gridFlag = true;
            } else if (Pubmap.getView().getZoom() > 16) {
                Map.layersIsShow('communitys', false);
                Map.layersIsShow('streets', false);
                Map.layersIsShow('grids', false);
                communityFlag = false;
                streetFlag = false;
                gridFlag = false;
            }
        }
    }


    // EchartType 转换成 Echart所需要的类型
    $.ToConvertA = function (object) {
        var ajaxData = new Array();
        for (var one in object) {
            ajaxData.push({
                "name": object[one]["type"],
                "value": Number(object[one]["value"])
            });
        }
        return ajaxData;
    }

    Map.selectQueryInit(); //框选查询
    document.onkeydown = function (e) {
        //屏蔽F11 改为调用全屏方法
        if (e && e.keyCode == 122) {
            Map.fullScreen();
            event.returnValue = false;
        }
    }

    $('#main').height($(window).height());
    $('.height100').height($('#main').height() - 70);
    windowsHeight = $(window).width();
    if (windowsHeight >= 1680 && windowsHeight < 1920) {
        _fontSize = 14;
        radiusData = ['40%', '60%'];
        echarts3X = "48%";
        echarts3y = "40%";
        zoom = 14.7;
        centerCoordinate = [117.662920, 39.035650]
        lengthECharts = 30;
        _fontSize1 = 26;
        breakData = 8;
        mapHeigth = '90%'
    } else if (windowsHeight >= 1600 && windowsHeight < 1680) {
        _fontSize = 12;
        radiusData = ['40%', '60%'];
        echarts3X = "48%";
        echarts3y = "35%";
        zoom = 14.4;
        ItemGap = 0;
        centerCoordinate = [117.662920, 39.035650]
        lengthECharts = 30;
        _fontSize1 = 26;
        breakData = 8;
        mapHeigth = '90%'
    } else if (windowsHeight >= 1440 && windowsHeight < 1660) {
        _fontSize = 12;
        radiusData = ['40%', '58%'];
        zoom = 14.4;
        centerCoordinate = [117.662920, 39.035650]
        lengthECharts = 30;
        _fontSize1 = 26;
        ItemGap = 0;
        _fontSize2 = 18,
            _fontSize3 = 16,
            breakData = 8;
        mapHeigth = '90%'
    } else if (windowsHeight < 1440) {
        _fontSize = 12;
        radiusData = ['40%', '58%'];
        zoom = 14.1;
        centerCoordinate = [117.662920, 39.035650]
        lengthECharts = 30;
        _fontSize1 = 26;
        ItemGap = -10;
        _fontSize2 = 16,
            _fontSize3 = 14,
            breakData = 8;
        mapHeigth = '90%'
    }
})

//框选查询
function boxSelectionDevice(data, type) {
    var url = "";
    if (type == "circle") {
        url = ctx + '/sys/map/showSelect?x=' + data.centerX + '&y=' + data.centerY + '&radius=' + data.radius;
    } else {
        url = ctx + '/sys/map/showSelect?points1=' + data.xyList;
    }
    $.getJSON(url, function (val) {
        var html = "";
        html += '<div class="layer-common" style="width: 100%;height: 100%; position: relative;padding: 14px 0 0 0;">'
        html += '<div class="layer-common-header" style="top: 1px; left: 36px;display: inline-block; padding: 5px 30px; border: 1px solid #0343a3; transform: skew(-20deg); background: #0343a3;color: #fff; font-weight: bold; position: absolute; z-index: 9999;">'
        html += '<div style=" transform: skew(20deg); white-space: nowrap;font-size: 15px;">框选查询</div>'
        html += '</div>'
        html += '<div class="layer-show  layer-common-center" style="padding: 15px 10px 5px 10px; width: 100%;height: 100%;  border: 1px solid #10559a;background: rgba(36,105,187, 0.6) url('
            + ctxStatic
            + '/common/index/images/showbg.png);background-size: 100% 100%;">'
        html += '<table style="width:100%;height:100%;">';
        html += '<tr>';
        html += '<td>框选区域总人口数：</td>';
        html += '<td>' + val.sumPeople + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td>重点人员数量：</td>';
        html += '<td>' + val.pNum + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td>学校数量：</td>';
        html += '<td>' + val.sumSchool + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td>警务工作站数量：</td>';
        html += '<td>' + val.sumPoliceRoom + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td>工作人员数量：</td>';
        html += '<td>' + val.sumPolice + '</td>';
        html += '</tr>';
        html += '</table>';
        html += '</div>'
        html += '</div>'
        layer.open({
            type: 1,
            shade: false,
            title: false, // 不显示标题
            area: ["300", "200px"],
            skin: 'myskin',
            move: '.layer-common-header',
            resize: false,
            fixed: false,
            id: "showSelect",
            content: html,
            cancel: function () {
                Map.clearShape();
                // 关闭事件

            }
        });

    })
}


//地图网格数据初始化
function initorgAreaMap() {
    $.getJSON('' + ctx + '/sys/map/orgAreaMap?type=1', function (data) {
        Map.addJSON1([{
            'type': 'communitys',
            'data': data,
            'isShow': communityFlag,
        }]);
        // addconver(data); //添加遮罩层
    })

    $.getJSON('' + ctx + '/sys/map/orgAreaMap?type=2', function (data) {
        Map.addJSON1([{
            'type': 'grids',
            'data': data,
            'isShow': gridFlag
        }])
    })

    $.getJSON('' + ctx + '/sys/map/orgAreaMap?type=4', function (data) {
        Map.addJSON1([{
            'type': 'streets',
            'data': data,
            'isShow': streetFlag
        }])
    })
}


/********************地图End***********************/
/********************下方菜单***********************/
var xuexiaoFlag = true;
var idArrxuexiao = [];

function xuexiaoFun(_this) {

    var centpoint = [];
    if (xuexiaoFlag) {
        $.getJSON('' + ctx + '/sys/map/ccmOrgNpseMap?type=32', function (data) {
            centpoint = data.centpoint;
            var features = data.features;
            var len = features.length;
            idArrxuexiao = [];
            if (len > 0) {
                for (var i = 0; i < len; i++) {
                    idArrxuexiao.push(features[i].id);
                }
            }
            Map.addJSON3([{
                'type': 'Shortcut',
                'data': data,
                'id': 'xuexiao',
                'isShow': true
            }])

        })
        $(_this).css('border', '1px solid #0e54a9')
        //Map.goTo(centpoint)
    } else {
        $(_this).css('border', '1px solid transparent');
        $.each(idArrxuexiao, function (index, val) {
            Pubmap.removeOverlay(Map['' + val + 'Overlay'])
        });
        Map.removeLayer('xuexiao');
    }
    xuexiaoFlag = !xuexiaoFlag;
}

//医院
var yiyuanFlag = true;
var publicPlaceFlag = true;
var idArryiyuan = [];

function yiyuanFun(_this) {
    if (yiyuanFlag) {
        // $.getJSON('' + ctx + '/sys/map/ccmOrgCommonalityMap?type=2', function (
        $.getJSON('' + ctx + '/sys/map/findMapIndustry?type=2', function (
            data) {
            var features = data.features;
            var len = features.length;
            idArryiyuan = [];
            if (len > 0) {
                for (var i = 0; i < len; i++) {
                    idArryiyuan.push(features[i].id);
                }
            }
            Map.addJSON3([{
                'type': 'Shortcut',
                'data': data,
                'id': 'yiyuan',
                'isShow': true
            }])

        })
        $(_this).css('border', '1px solid #0e54a9')
        /*	Map.goTo([ "113.36105768169675", "34.54275331326893" ])*/
    } else {
        $.each(idArryiyuan, function (index, val) {
            Pubmap.removeOverlay(Map['' + val + 'Overlay'])
        });
        $(_this).css('border', '1px solid transparent');
        Map.removeLayer('yiyuan');
    }
    yiyuanFlag = !yiyuanFlag;
}

var jingcheFlag = true;

function jingcheFun(_this) {
    if (jingcheFlag) {
        $.getJSON('' + ctx + '/sys/map/ccmOrgCommonalityMap?type=2', function (
            data) {
            Map.addJSON1([{
                'type': 'DanDian',
                'data': data,
                'id': 'jingche',
                'isShow': true
            }])
        })

        $(_this).css('border', '1px solid #0e54a9')
    } else {
        $(_this).css('border', '1px solid transparent')
        Map.removeLayer('jingche');
    }
    jingcheFlag = !jingcheFlag;
}

//警员
var jingyuanFlag = true;

function jingyuanFun(_this) {
    if (jingyuanFlag) {
        $.getJSON('' + ctx + '/sys/map/deviceMobileMap', function (data) {
            Map.addJSON1([{
                'type': 'PopLocation',
                'id': 'jingyuan',
                'data': data,
                'isShow': true
            }]);
        })
        Map.layersIsShow('PopLocation', true);
        $(_this).css('border', '1px solid #0e54a9');
    } else {
        $(_this).css('border', '1px solid transparent')
        Map.removeLayer('jingyuan');
    }
    jingyuanFlag = !jingyuanFlag;
}

var jiayouzhanFlag = true;
var idArrjiayouzhan = [];

function jiayouzhanFun(_this) {
    if (jiayouzhanFlag) {
        $.getJSON('' + ctx + '/sys/map/findMapIndustry?type=1', function (data) {
            if (data != null) {
                var features = data.features;
                var len = features.length;
                idArrjiayouzhan = [];
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        idArrjiayouzhan.push(features[i].id);
                    }
                }
            }
            Map.addJSON3([{
                'type': 'Shortcut',
                'id': 'jiayouzhan',
                'data': data,
                'isShow': true
            }])
        })

        $(_this).css('border', '1px solid #0e54a9');
        //Map.goTo([ "113.39035820960999", "34.528061628341675" ])
    } else {
        $.each(idArrjiayouzhan, function (index, val) {
            Pubmap.removeOverlay(Map['' + val + 'Overlay'])
        });
        $(_this).css('border', '1px solid transparent')
        Map.removeLayer('jiayouzhan');
    }
    jiayouzhanFlag = !jiayouzhanFlag;
}

//商场超市
var shangchangFlag = true;
var idArrshangchang = [];

function shangchangFun(_this) {
    if (shangchangFlag) {
        $.getJSON('' + ctx + '/sys/map/findMapIndustry?type=2', function (data) {
            if (data != null) {
                var features = data.features;
                var len = features.length;
                idArrshangchang = [];
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        idArrshangchang.push(features[i].id);
                    }
                }
            }
            Map.addJSON3([{
                'type': 'Shortcut',
                'id': 'shangchang',
                'data': data,
                'isShow': true
            }])
        })
        $(_this).css('border', '1px solid #0e54a9');
    } else {
        $.each(idArrshangchang, function (index, val) {
            Pubmap.removeOverlay(Map['' + val + 'Overlay'])
        });
        $(_this).css('border', '1px solid transparent')
        Map.removeLayer('shangchang');
    }
    shangchangFlag = !shangchangFlag;
}

//娱乐场所
var yuleFlag = true;
var idArryule = [];

function yuleFun(_this) {
    if (yuleFlag) {
        $.getJSON('' + ctx + '/sys/map/findMapIndustry?type=3', function (data) {
            if (data != null) {
                var features = data.features;
                var len = features.length;
                idArryule = [];
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        idArryule.push(features[i].id);
                    }
                }
            }
            Map.addJSON3([{
                'type': 'Shortcut',
                'id': 'yule',
                'data': data,
                'isShow': true
            }])
        })
        $(_this).css('border', '1px solid #0e54a9');
    } else {
        $.each(idArryule, function (index, val) {
            Pubmap.removeOverlay(Map['' + val + 'Overlay'])
        });
        $(_this).css('border', '1px solid transparent')
        Map.removeLayer('yule');
    }
    yuleFlag = !yuleFlag;
}

//酒店宾馆
var binguanFlag = true;
var idArrbinguan = [];

function binguanFun(_this) {
    var id = 0;
    if (binguanFlag) {
        $.getJSON('' + ctx + '/sys/map/findMapIndustry?type=4', function (data) {
            if (data != null) {
                id = data.id;
                var features = data.features;
                var len = features.length;
                idArrbinguan = [];
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        idArrbinguan.push(features[i].id);
                    }
                }
            }
            Map.addJSON3([{
                'type': 'Shortcut',
                'id': 'binguan',
                'data': data,
                'isShow': true
            }])
        })
        $(_this).css('border', '1px solid #0e54a9');
    } else {
        $.each(idArrbinguan, function (index, val) {
            Pubmap.removeOverlay(Map['' + val + 'Overlay'])
        });
        $(_this).css('border', '1px solid transparent');
        Map.removeLayer('binguan');
    }

    binguanFlag = !binguanFlag;
}

//涉危涉爆
var sheweishebaoFlag = true;
var idArrsheweishebao = [];

function sheweishebaoFun(_this) {
    if (sheweishebaoFlag) {
        $.getJSON('' + ctx + '/sys/map/findMapIndustry?type=5', function (data) {
            if (data != null) {
                var features = data.features;
                var len = features.length;
                idArrsheweishebao = [];
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        idArrsheweishebao.push(features[i].id);
                    }
                }
            }
            Map.addJSON3([{
                'type': 'Shortcut',
                'id': 'sheweishebao',
                'data': data,
                'isShow': true
            }])
        })
        $(_this).css('border', '1px solid #0e54a9');
    } else {
        $.each(idArrsheweishebao, function (index, val) {
            Pubmap.removeOverlay(Map['' + val + 'Overlay'])
        });
        $(_this).css('border', '1px solid transparent')
        Map.removeLayer('sheweishebao');
    }
    sheweishebaoFlag = !sheweishebaoFlag;
}

//警务室
var jingwushiFlag = true;
var idArrjingwushi = [];

function jingwushiFun(_this) {
    if (jingwushiFlag) {
        Map.removeLayer('policeroom');
        $.getJSON('' + ctx + '/sys/map/orgCommonlityMap?type=10', function (data) {
            // var features=data.features;
            // var len=features.length;
            // idArrjingwushi=[];
            // if(len>0){
            // 	for(var i=0;i<len;i++){
            // 		idArrjingwushi.push(features[i].id);
            // 	}
            // }
            Map.addJSON1([{
                'type': 'policeroom',
                'id': 'jingwushi',
                'data': data,
                'isShow': true
            }])
        })
        $(_this).css('border', '1px solid #0e54a9');
    } else {
        // $.each(idArrjingwushi,function(index,val){
        // 	Pubmap.removeOverlay(Map[''+val+'Overlay'])
        // });
        $(_this).css('border', '1px solid transparent');
        Map.removeLayer('jingwushi');
    }
    jingwushiFlag = !jingwushiFlag;
}

//工作站
var gongzuozhanFlag = true;
var idArrgongzuozhan = [];

function gongzuozhanFun(_this) {
    if (gongzuozhanFlag) {
        Map.removeLayer('workstation');
        $.getJSON('' + ctx + '/sys/map/orgCommonlityMap?type=11', function (data) {
            var features = data.features;
            var len = features.length;
            idArrgongzuozhan = [];
            if (len > 0) {
                for (var i = 0; i < len; i++) {
                    idArrgongzuozhan.push(features[i].id);
                }
            }
            Map.addJSON1([{
                'type': 'workstation',
                'id': 'gongzuozhan',
                'data': data,
                'isShow': true
            }])
        })
        $(_this).css('border', '1px solid #0e54a9');
    } else {
        $.each(idArrgongzuozhan, function (index, val) {
            Pubmap.removeOverlay(Map['' + val + 'Overlay'])
        });
        $(_this).css('border', '1px solid transparent')
        Map.removeLayer('gongzuozhan');
    }

    gongzuozhanFlag = !gongzuozhanFlag;

}

//视频监控
var shipinjiankongFlag = true;

function shipinjiankongFun(_this) {
    if (shipinjiankongFlag) {
        $.getJSON('' + ctx + '/sys/map/deviceiveMap', function (data) {
            Map.addJSON1([{
                'type': 'videos',
                'id': 'shipinjiankong',
                'data': data,
                'isShow': true
            }])
        })
        $(_this).css('border', '1px solid #0e54a9');
        $(_this).attr('VideoFlagAttr', true);
    } else {
        $(_this).css('border', '1px solid transparent');
        $(_this).attr('VideoFlagAttr', false);
        Map.removeLayer('shipinjiankong');
    }
    shipinjiankongFlag = !shipinjiankongFlag;
}

//广播站
var broadcastFlag = true;

function guangbozhanFun(_this) {
    if (broadcastFlag) {
        $.getJSON('' + ctx + '/sys/map/deviceBroadcastMap', function (data) {
            Map.addJSON1([{
                'type': 'broadcast',
                'id': 'guangbozhan',
                'data': data,
                'isShow': true
            }])
        })
        $(_this).css('border', '1px solid #0e54a9');
    } else {
        $(_this).css('border', '1px solid transparent');
        Map.removeLayer('guangbozhan');
    }
    broadcastFlag = !broadcastFlag;
}

//机顶盒
var SetTopBoxFlag = true;

function SetTopBoxFun(_this) {
    if (SetTopBoxFlag) {
        $.getJSON('' + ctx + '/sys/map/buildBox', function (data) {
            Map.addJSON1([{
                'type': 'topBox',
                'id': 'SetTopBoxFlag',
                'data': data,
                'isShow': true
            }])
        })
        $(_this).css('border', '1px solid #0e54a9');
    } else {
        $(_this).css('border', '1px solid transparent');
        Map.removeLayer('SetTopBoxFlag');
    }
    SetTopBoxFlag = !SetTopBoxFlag;
}

//疫情人员信息
var PeopleAntiepidemicFlag = true;
function getpeopleAntiepidemic(_this) {
    if (PeopleAntiepidemicFlag) {
        $.getJSON('' + ctx + '/sys/map/getpeopleAntiepidemic', function (data) {
            Map.addJSON1([{
                'type': 'antiepidemictype',
                'id': 'PeopleAntiepidemic',
                'data': data,
                'isShow': true
            }])
        })
        $(_this).css('border', '1px solid #0e54a9');
    } else {
        $(_this).css('border', '1px solid transparent');
        Map.removeLayer('PeopleAntiepidemic');
    }
    PeopleAntiepidemicFlag = !PeopleAntiepidemicFlag;
}



function XiangQingFun(type) {
    $('.pubMapDialog').show()
    var XiangQingData = {
        "长乐路警务室": {
            "民警": [{
                '姓名': '慕观卿',
                '警号': '103802',
                '性别': '男',
                '电话': '17603711723',
                "src": 'muguanqing.JPG'
            }, {
                '姓名': '许小五',
                '警号': '103803',
                '性别': '男',
                '电话': '17603711728',
                "src": 'xuxiaowu.jpg'
            }, {
                '姓名': '郑首守',
                '警号': '103804',
                '性别': '男',
                '电话': '17503711759',
                "src": 'zhebgshoushou.jpg'
            }],
            "辅警": [{
                '姓名': '蒋尚涵',
                '警号': '103805',
                '性别': '男',
                '电话': '13674919298',
                "src": 'jiangshanghan.jpg'
            }, {
                '姓名': '李格',
                '警号': '103806',
                '性别': '女',
                '电话': '13509856056',
                "src": 'lige.JPG'
            }, {
                '姓名': '许伟强',
                '警号': '103807',
                '性别': '男',
                '电话': '13603986786',
                "src": 'xuweiqiang.jpg'
            }]
        },
        "于家岗警务工作站": {
            "民警": [{
                '姓名': '郭亚凯',
                '警号': '103808',
                '性别': '男',
                '电话': '15515991957',
                "src": 'guoyakai.jpg'
            }, {
                '姓名': '慕观卿',
                '警号': '103802',
                '性别': '男',
                '电话': '17603711723',
                "src": 'muguanqing.JPG'
            }, {
                '姓名': '吕一帆',
                '警号': '103809',
                '性别': '男',
                '电话': '13673992608',
                'src': 'lvyifan.jpg'
            }],
            "辅警": [{
                '姓名': '梁炎龙',
                '警号': '103810',
                '性别': '男',
                '电话': '18539436116',
                "src": 'lianyanlong.jpg'
            }, {
                '姓名': '楚褤铭',
                '警号': '103811',
                '性别': '男',
                '电话': '15803817833',
                "src": 'chuming.jpg'
            }, {
                '姓名': '申奥',
                '警号': '103812',
                '性别': '男',
                '电话': '15890009001',
                "src": 'shenao.jpg'
            }]
        },
        "嵩阳路警务工作站": {
            "民警": [{
                '姓名': '蒋尚涵',
                '警号': '103805',
                '性别': '男',
                '电话': '13674919298',
                "src": 'jiangshanghan.jpg'
            }, {
                '姓名': '马双科',
                '警号': '103813',
                '性别': '男',
                '电话': '15093337726',
                "src": 'mashuangke.JPG'
            }, {
                '姓名': '侯鹏',
                '警号': '103814',
                '性别': '男',
                '电话': '18437188688',
                "src": 'houpeng.JPG'
            }],
            "辅警": [{
                '姓名': '高志阳',
                '警号': '103815',
                '性别': '男',
                '电话': '15136205957',
                "src": 'gaozhiyang.jpg'
            }, {
                '姓名': '楚褤铭',
                '警号': '103811',
                '性别': '男',
                '电话': '15803817833',
                "src": 'chuming.jpg'
            }, {
                '姓名': '侯林山',
                '警号': '103817',
                '性别': '男',
                '电话': '15290869958',
                'src': 'houlinshan.jpg'
            }]
        },
        "广场警务工作站": {
            "民警": [{
                '姓名': '吕一帆',
                '警号': '103809',
                '性别': '男',
                '电话': '13673992608',
                'src': 'lvyifan.jpg'
            }, {
                '姓名': '慕观卿',
                '警号': '103802',
                '性别': '男',
                '电话': '17603711723',
                "src": 'muguanqing.JPG'
            }, {
                '姓名': '郭亚凯',
                '警号': '103808',
                '性别': '男',
                '电话': '15515991957',
                "src": 'guoyakai.jpg'
            }],
            "辅警": [{
                '姓名': '梁炎龙',
                '警号': '103810',
                '性别': '男',
                '电话': '18539436116',
                "src": 'lianyanlong.jpg'
            }, {
                '姓名': '高志阳',
                '警号': '103815',
                '性别': '男',
                '电话': '15136205957',
                "src": 'gaozhiyang.jpg'
            }, {
                '姓名': '侯林山',
                '警号': '103817',
                '性别': '男',
                '电话': '15290869958',
                'src': 'houlinshan.jpg'
            }]
        }
    }
    if (type == '长乐路警务室' || type == '于家岗警务工作站' || type == '嵩阳路警务工作站'
        || type == '广场警务工作站') {
        var data = XiangQingData[type];
        console.log(data)
        var data1 = data['民警'];
        var data2 = data['辅警'];
        var len1 = data1.length;
        var len2 = data2.length;
        var html = "";
        html += '<div class="pubMapDialog-center1"><div> 民警： </div>';
        for (var i = 0; i < len1; i++) {
            html += '<div class="well-item">'
            html += '<div  class="jingcha-name correct">';
            html += '<div  class="jiachatouxiang" style="width:100%;height:100%;"><img src="/arjccm/static/modules/map/images/pub/'
                + data1[i]['src'] + '" /></div>';
            html += ' <p>' + data1[i]['姓名'] + '</p>';
            html += '<p>' + data1[i]['警号'] + '</p>';
            html += ' </div>'
            html += '<div class="opposite"><div>';
            html += '<table>';
            html += '<tr>';
            html += '<td align="right" >姓名：</td><td align="left" >'
                + data1[i]['姓名'] + '</td>';
            html += '</tr>';
            html += '<tr>';
            html += '<td align="right" >性别：</td><td align="left">'
                + data1[i]['性别'] + '</td>';
            html += '</tr>';
            html += '<tr>';
            html += '<td align="right" >警号：</td><td align="left">'
                + data1[i]['警号'] + '</td>';
            html += '</tr>';
            html += '<tr>';
            html += '<td align="right" >电话：</td><td align="left">'
                + data1[i]['电话'] + '</td>';
            html += '</tr>';
            html += '</table>';
            html += '</div></div>';
            html += '</div>'
        }
        html += ' </div>'
        html += '<div  class="pubMapDialog-center2"><div>辅警： </div>';
        for (var i = 0; i < len2; i++) {
            html += '<div class="well-item">'
            html += '<div  class="jingcha-name correct">';
            html += '<div  class="jiachatouxiang"  style="width:100%;height:100%;"><img src="/arjccm/static/modules/map/images/pub/'
                + data2[i]['src'] + '" /></div>';
            html += ' <p>' + data2[i]['姓名'] + '</p>';
            html += '<p>' + data2[i]['警号'] + '</p>';
            html += ' </div>';
            html += '<div class="opposite"><div>';
            html += '<table>';
            html += '<tr>';
            html += '<td  align="right" >姓名：</td><td align="left">'
                + data2[i]['姓名'] + '</td>';
            html += '</tr>';
            html += '<tr>';
            html += '<td align="right" >性别：</td><td align="left">'
                + data2[i]['性别'] + '</td>';
            html += '</tr>';
            html += '<tr>';
            html += '<td align="right" >警号：</td><td align="left">'
                + data2[i]['警号'] + '</td>';
            html += '</tr>';
            html += '<tr>';
            html += '<td align="right" >电话：</td><td align="left">'
                + data2[i]['电话'] + '</td>';
            html += '</tr>';
            html += '</table>';
            html += '</div></div>';
            html += '</div>'
        }
        html += ' </div>'

        $('.pubMapDialog-center-center').html(html)

        $(".well-item").hover(function () {
            $(this).find(".correct").children().removeClass('test');
            $(this).find(".correct").children().removeClass('test2');
            $(this).find(".opposite").children().removeClass('test');
            $(this).find(".opposite").children().removeClass('test2');
            $(this).find(".correct").children().addClass("test");
            $(this).find(".opposite").children().addClass('test2');
        }, function () {
            $(this).find(".correct").children().removeClass('test');
            $(this).find(".opposite").children().removeClass('test');
            $(this).find(".correct").children().removeClass("test2");
            $(this).find(".opposite").children().removeClass("test2");
            $(this).find(".correct").children().addClass("test2");
            $(this).find(".opposite").children().addClass('test');
        });

    } else if (type == '骨科医院' || type == "眼科医院") {
        var data = {
            "骨科医院": {
                "级别": "一级医院",
                "经营性质": "县市区直属",
                "重点部位": "化验生化室、放射科",
                "基本情况": "新密市骨科医院是经郑州市卫生局批准执业的骨科专业机构，是以骨科、显微外科、普外为特色优势，集创伤急救、医疗、保健、功能康复为一体的专科医院。",
                'src': 'guke.jpg',
            },
            "眼科医院": {
                "级别": "一级医院",
                "经营性质": "县市区直属",
                "重点部位": "病房、治疗室",
                "基本情况": "新密市眼科医院是全省最大的一所县（市）级眼科专科医院。该医院位于新密市嵩山大道123号总建筑面积6000余平方米，医务人员100多人，其中副主任医师4人，中级职称人员30余人。 ",
                'src': 'yanke.jpg',
            },
        }
        var html = "";
        html += '<table style="height:100%">';
        html += '<tr>';
        html += '<td  class="textcenterright" style="width:135px"><img src="/arjccm/static/modules/map/images/pub/'
            + data[type]["src"] + '" /></td>';
        html += '<td  class="textcenterleft" style="font-size:20px;padding-left:24px">'
            + type + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td class="textcenterright">级别：</td>';
        html += '<td class="textcenterleft">' + data[type]["级别"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">经营性质：</td>';
        html += '<td class="textcenterleft">' + data[type]["经营性质"] + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td  class="textcenterright">重点部位：</td>';
        html += '<td class="textcenterleft">' + data[type]["重点部位"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">基本情况：</td>';
        html += '<td class="textcenterleft">' + data[type]["基本情况"] + '</td>';
        html += '</tr>';

        html += '</table>';
        $('.pubMapDialog-center-center').html(html)
    } else if (type == '金凤路小学' || type == "金凤路初中") {
        var data = {
            "金凤路小学": {
                "性质": "消防重点单位",
                "学校地址": "西大街与金凤路交叉口北150米",
                "重点部位": "教室、办公室",
                "基本情况": "新密市金凤路小学是隶属于新密市教体局的一所市直学校,占地面积近24亩,建筑面积10398平方米。学校环境优美,教学设施齐全,设有梦想教室、美术教室等",
                'src': 'xiaoxue.jpg'
            },
            "金凤路初中": {
                "性质": "消防重点单位",
                "学校地址": "金凤路与青屏大街交叉口西南150米",
                "重点部位": "教室、办公室",
                "基本情况": "金凤路初中学校建有教学综合楼、科技实验楼、综合办公楼、体育馆、运动场占地四十余亩，是一所教育教学设施一流的现代化的城市初级中学 ",
                'src': 'xuexiao2.png'
            },
        }
        var html = "";
        html += '<table style="height:100%">';
        html += '<tr>';
        html += '<td  class="textcenterright" style="width:135px"><img src="/arjccm/static/modules/map/images/pub/'
            + data[type]["src"] + '" /></td>';
        html += '<td  class="textcenterleft" style="font-size:20px;padding-left:24px">'
            + type + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td class="textcenterright">性质：</td>';
        html += '<td class="textcenterleft">' + data[type]["性质"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">重点部位：</td>';
        html += '<td class="textcenterleft">' + data[type]["重点部位"] + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td  class="textcenterright">学校地址：</td>';
        html += '<td class="textcenterleft">' + data[type]["学校地址"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">基本情况：</td>';
        html += '<td class="textcenterleft">' + data[type]["基本情况"] + '</td>';
        html += '</tr>';
        html += '</table>';
        $('.pubMapDialog-center-center').html(html)
    } else if (type == '郑交运集团加油站(新密分公司)' || type == "亚立石化加油站(开阳路)") {
        var data = {
            "郑交运集团加油站(新密分公司)": {
                "性质": "消防重点单位",
                "重点部位": "油库、加油作业区",
                "单位地址": "郑交运集团加油站(新密分公司)",
                "基本情况": "成立于1996年7月。主要经营汽油、柴油、润滑油销售等。",
                'src': 'zhengjiao.jpg'
            },
            "亚立石化加油站(开阳路)": {
                "性质": "消防重点单位",
                "重点部位": "油库、加油作业区",
                "单位地址": "河南省郑州市新密市嵩山大道669",
                "基本情况": "河南亚立石油化工有限公司，成立于2001年9月。主要经营车用乙醇汽油、柴油、煤油零售与批发，预包装食品零售，化工产品经销，仓储，燃料油、润滑油、日用百货的销售，经营进出口贸易等业务。 ",
                'src': 'yali.jpg'
            },
        }
        var html = "";
        html += '<table style="height:100%">';
        html += '<tr>';
        html += '<td  class="textcenterright" style="width:135px"><img src="/arjccm/static/modules/map/images/pub/'
            + data[type]["src"] + ' " /></td>';
        html += '<td  class="textcenterleft" style="font-size:20px;padding-left:24px">'
            + type + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td class="textcenterright">性质：</td>';
        html += '<td class="textcenterleft">' + data[type]["性质"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">重点部位：</td>';
        html += '<td class="textcenterleft">' + data[type]["重点部位"] + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td  class="textcenterright">单位地址：</td>';
        html += '<td class="textcenterleft">' + data[type]["单位地址"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">基本情况：</td>';
        html += '<td class="textcenterleft">' + data[type]["基本情况"] + '</td>';
        html += '</tr>';
        html += '</table>';
        $('.pubMapDialog-center-center').html(html)
    } else if (type == '承誉德大酒店' || type == "鑫海湾假日酒店" || type == "福海商务宾馆") {
        var data = {
            "承誉德大酒店": {
                "性质": "消防重点单位",
                "单位地址": "郑州市新密市西大街88号",
                "重点部位": "客房、餐厅",
                "基本情况": "郑州承誉德大酒店是一家集餐饮、客房、娱乐、休闲洗浴及商务会议活动为一体的多功能大型商务涉外酒店。",
                'src': 'chengyude.png',
            },
            "鑫海湾假日酒店": {
                "性质": "消防重点单位",
                "单位地址": "郑州市新密市平安路225号",
                "重点部位": "客房、餐厅",
                "基本情况": "新密鑫海湾假日酒店融顶尖豪华酒店设计理念、艺术构筑于一体，采用新型绿色环保材料、安全健康科技的人文智能控制系统，拥有各式舒适客房，并设有茶室、棋牌室、足浴等配套服务设施。",
                'src': 'xinhaiwan.jpg',
            },
            "福海商务宾馆": {
                "性质": "消防重点单位",
                "单位地址": "郑州市新密市鑫苑花园东楼",
                "重点部位": "客房、餐厅",
                "基本情况": "福海商务宾馆，于2008年正式营业，是一家住宿、休闲、餐饮为一体的经营式现代企业。",
                'src': 'fuhai.jpg',
            },
        }
        var html = "";
        html += '<table style="height:100%">';
        html += '<tr>';
        html += '<td  class="textcenterright" style="width:135px"><img src="/arjccm/static/modules/map/images/pub/'
            + data[type]["src"] + '" /></td>';
        html += '<td  class="textcenterleft" style="font-size:20px;padding-left:24px">'
            + type + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td class="textcenterright">性质：</td>';
        html += '<td class="textcenterleft">' + data[type]["性质"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">重点部位：</td>';
        html += '<td class="textcenterleft">' + data[type]["重点部位"] + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td  class="textcenterright">单位地址：</td>';
        html += '<td class="textcenterleft">' + data[type]["单位地址"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">基本情况：</td>';
        html += '<td class="textcenterleft">' + data[type]["基本情况"] + '</td>';
        html += '</tr>';
        html += '</table>';
        $('.pubMapDialog-center-center').html(html)
    } else if (type == '金博大购物中心') {
        var data = {
            "金博大购物中心": {
                "性质": "消防重点单位",
                "商场地址": "郑州市新密市西大街276号",
                "重点部位": "仓库、逃生通道",
                "基本情况": "新密金博大购物中心有限公司于2007年06月14日在新密市工商行政管理局登记成立。法定代表人楚文杰，公司经营范围包括百货、家用电器、服装、鞋帽、五金交电、皮革制品等。",
                'src': 'jingboda.jpg'
            }
        }
        var html = "";
        html += '<table style="height:100%">';
        html += '<tr>';
        html += '<td  class="textcenterright" style="width:135px"><img style="width:48px;height:48px" src="/arjccm/static/modules/map/images/pub/'
            + data[type]["src"] + '" /></td>';
        html += '<td  class="textcenterleft" style="font-size:20px;padding-left:24px">'
            + type + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td class="textcenterright">性质：</td>';
        html += '<td class="textcenterleft">' + data[type]["性质"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">重点部位：</td>';
        html += '<td class="textcenterleft">' + data[type]["重点部位"] + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td  class="textcenterright">商场地址：</td>';
        html += '<td class="textcenterleft">' + data[type]["商场地址"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">基本情况：</td>';
        html += '<td class="textcenterleft">' + data[type]["基本情况"] + '</td>';
        html += '</tr>';
        html += '</table>';
        $('.pubMapDialog-center-center').html(html)
    } else if (type == '麦克疯量贩KTV' || type == '糖果娱乐空间') {
        var data = {
            "麦克疯量贩KTV": {
                "性质": "治安消防单位",
                "单位地址": "新密市长乐路515号",
                "重点部位": "客房、配电室",
                "基本情况": "麦克疯量贩KTV新密店以人性化的布局，奢华的装饰装潢，让消费者感受贴心的服务和自由的欢唱；麦克疯量贩KTV新密店本着独特的消费方式及完善的服务理念，致力于为您打造价格低、音响好、歌曲全、服务优的健康纯K歌场所。",
                'src': 'maikefeng.jpg'
            },
            "糖果娱乐空间": {
                "性质": "治安消防单位",
                "单位地址": "新密市西大街368号",
                "重点部位": "客房、配电室",
                "基本情况": "糖果娱乐空间内部装饰时尚、典雅、舒适，消费价格低廉。是好友聚会、家人娱乐、生日庆典、商务休闲的一个极佳的文化娱乐场所。 ",
                'src': 'tanguo.jpg'
            },
        }
        var html = "";
        html += '<table style="height:100%">';
        html += '<tr>';
        html += '<td  class="textcenterright" style="width:135px"><img src="/arjccm/static/modules/map/images/pub/'
            + data[type]["src"] + '" /></td>';
        html += '<td  class="textcenterleft" style="font-size:20px;padding-left:24px">'
            + type + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td class="textcenterright">性质：</td>';
        html += '<td class="textcenterleft">' + data[type]["性质"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">重点部位：</td>';
        html += '<td class="textcenterleft">' + data[type]["重点部位"] + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td  class="textcenterright">单位地址：</td>';
        html += '<td class="textcenterleft">' + data[type]["单位地址"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">基本情况：</td>';
        html += '<td class="textcenterleft">' + data[type]["基本情况"] + '</td>';
        html += '</tr>';
        html += '</table>';

        $('.pubMapDialog-center-center').html(html)
    } else if (type == '烟花爆竹专营店(新华路三店)') {
        var data = {
            "烟花爆竹专营店(新华路三店)": {
                "性质": "涉危涉爆重点单位",
                "重点部位": "仓库",
                "单位地址": "郑州市新密市南密新路168号",
                "基本情况": "烟花爆竹专营店已取得取得《烟花爆竹经营（批发）许可证》和《烟花爆竹经营（零售）许可证》的规范专营店",
                'src': 'baozhu.jpg'
            }
        }
        var html = "";
        html += '<table style="height:100%">';
        html += '<tr>';
        html += '<td  class="textcenterright" style="width:135px"><img src="/arjccm/static/modules/map/images/pub/'
            + data[type]["src"] + '" /></td>';
        html += '<td  class="textcenterleft" style="font-size:20px;padding-left:24px">'
            + type + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td class="textcenterright">性质：</td>';
        html += '<td class="textcenterleft">' + data[type]["性质"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">重点部位：</td>';
        html += '<td class="textcenterleft">' + data[type]["重点部位"] + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td  class="textcenterright">单位地址：</td>';
        html += '<td class="textcenterleft">' + data[type]["单位地址"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">基本情况：</td>';
        html += '<td class="textcenterleft">' + data[type]["基本情况"] + '</td>';
        html += '</tr>';
        html += '</table>';
        $('.pubMapDialog-center-center').html(html)
    }

}

function shipinjiankongXiangqingFun(src, name) {
    $('.pubMapDialog').show()
    if (name == '视频监控1' || name == '视频监控2' || name == '视频监控3'
        || name == '视频监控4') {
        var html = '';
        html += '<video width="440" height="250"  controls="controls" autoplay="autoplay" loop="loop" class="videoBtn">';
        html += '<source src="/arjccm/static/modules/map/images/pub/video/'
            + src + '" type="video/mp4">';
        html += '</video>';
        $('.pubMapDialog-center-center').html(html)
    } else if (name == "豫A0S81Q" || name == "豫A0519H") {
        var data = {
            "豫A0S81Q": {
                "任务": "治安巡逻",
                "重点路线": "长乐路",
                "所属单位": "广场警务工作站",
                "目前位置": "新密市西大街西段1号"
            },
            "豫A0519H": {
                "任务": "治安巡逻",
                "重点路线": "长乐路",
                "所属单位": "长乐路警务工作站",
                "目前位置": "新密市西大街西段1号"
            }
        }
        var html = '';
        html += '<table style="height:100%">';
        html += '<tr>';
        html += '<td  class="textcenterright" style="width:135px"><img src="/arjccm/static/modules/map/images/pub/jingche2.png" /></td>';
        html += '<td  class="textcenterleft" style="font-size:20px;padding-left:24px">'
            + name + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td class="textcenterright">任务：</td>';
        html += '<td class="textcenterleft">' + data[name]["任务"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">重点路线：</td>';
        html += '<td class="textcenterleft">' + data[name]["重点路线"] + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td  class="textcenterright">所属单位：</td>';
        html += '<td class="textcenterleft">' + data[name]["所属单位"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">目前位置：</td>';
        html += '<td class="textcenterleft">' + data[name]["目前位置"] + '</td>';
        html += '</tr>';
        html += '</table>';
        $('.pubMapDialog-center-center').html(html)

    } else if (name == "吕一凡" || name == "王庆豪") {
        var data = {
            "吕一凡": {
                "任务": "治安巡逻",
                "重点路线": "长乐路",
                "所属单位": "广场警务工作站",
                "目前位置": "新密市大鸿路159号"
            },
            "王庆豪": {
                "任务": "治安巡逻",
                "重点路线": "长乐路",
                "所属单位": "长乐路警务工作站",
                "目前位置": "新密市大鸿路159号"
            }
        }
        var html = '';
        html += '<table style="height:100%">';
        html += '<tr>';
        html += '<td  class="textcenterright" style="width:135px"><img src="/arjccm/static/modules/map/images/pub/jingcha2.png" /></td>';
        html += '<td  class="textcenterleft" style="font-size:20px;padding-left:24px">'
            + name + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td class="textcenterright">任务：</td>';
        html += '<td class="textcenterleft">' + data[name]["任务"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">重点路线：</td>';
        html += '<td class="textcenterleft">' + data[name]["重点路线"] + '</td>';
        html += '</tr>';
        html += '<tr class="l-grid-row-alt">';
        html += '<td  class="textcenterright">所属单位：</td>';
        html += '<td class="textcenterleft">' + data[name]["所属单位"] + '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td  class="textcenterright">目前位置：</td>';
        html += '<td class="textcenterleft">' + data[name]["目前位置"] + '</td>';
        html += '</tr>';
        html += '</table>';
        $('.pubMapDialog-center-center').html(html)
    }
}

/***************************下方菜单End****************************/
/***************************加载echarts图End****************************/
var leftContent1Charts = null;
var leftContent2Charts = null;
var rightContent1Charts = null;
var rightContent2Charts = null;

function resizeChat() {
    if (leftContent1Charts == null) {
        leftContent1Charts = echarts.init(document.getElementById('echLeftContent1'));
    }
    leftContent1Charts.clear();
    leftContent1Charts.resize();
    if (leftContent2Charts == null) {
        leftContent2Charts = echarts.init(document.getElementById('echleftContent2'));
    }
    leftContent2Charts.clear();
    leftContent2Charts.resize();
    if (rightContent1Charts == null) {
        rightContent1Charts = echarts.init(document.getElementById('echRightContent1'));
    }
    rightContent1Charts.clear();
    rightContent1Charts.resize();
    if (rightContent2Charts == null) {
        rightContent2Charts = echarts.init(document.getElementById('echRightContent2'));
    }
    rightContent2Charts.clear();
    rightContent2Charts.resize();
}




// parent.layer.config({
//     extend: 'layer.css', //加载您的扩展样式
//     skin: 'layer-ext-yourskin'
// });
//详情弹框--不刷新父页面
function LayerDialog(src, title, height, width) {
    layerIndex = parent.layer.open({
        type: 2,
        title: title,
        area: [height, width],
        fixed: true, //固定
        maxmin: true,
        id: 'LayerDialog',
        //btn: [ '确定',  '关闭'], //可以无限个按钮
        content: src,
        zIndex: '1992',
        skin:"mySkin"
});

}

function getMapInfo() {
    var formType = $("#formType").val();
    var areaId = $("#areaId").val();
    var formName = $("#formName").val();
    if(formType == 1 || formType == 2){
        if($('#areaName').val() == null || $('#areaName').val() == "" || $('#areaName').val() == undefined){
            // parent.layer.msg("请选择辖区范围!");
            $.jBox.tip('请选择辖区范围!');
            return;
        }
    }
    //清除已有图层
    removeMapvList();

    switch (formType) {
        //renkou
        case "1":
            var methods = {
                click: function (item) {
                    if (item) {
                        LayerDialog(ctx + '/pop/ccmPeople/mapvForm?id=' + item.id, '人员信息', '1100px', '300px');
                    }
                }
            };
            simpleColor(formType, areaId, formName, methods);
            return;
        //loudong
        case "2":
            var methods = {
                click: function (item) {
                    if (item) {
                        LayerDialog(ctx + '/house/ccmHouseBuildmanage/mapvForm?id=' + item.id, '楼栋信息', '1100px', '750px');
                    }
                }
            };
            simpleColor(formType, areaId, formName, methods);
            return;
        //chuzuwu
        case "3":
            var methods = {
                click: function (item) {
                    if (item) {
                        LayerDialog(ctx + '/pop/ccmPopTenant/mapvForm?id=' + item.id, '出租屋信息', '1100px', '750px');
                    }
                }
            };
            simpleColor(formType, areaId, formName, methods);
            return;
        //chengshibujian
        case "4":
            var methods = {
                click: function (item) {
                    if (item) {
                        LayerDialog(ctx + '/citycomponents/ccmCityComponents/mapvForm?id=' + item.id, '城市部件信息', '1100px', '600px');
                    }
                }
            };
            moreColor(formType, areaId, formName, methods);
            return;
        //qiye
        case "5":
            var methods = {
                click: function (item) {
                    if (item) {
                        LayerDialog(ctx + '/org/ccmOrgNpse/mapvForm?id=' + item.id, '企业信息', '1100px', '700px');
                    }
                }
            };
            moreColor(formType, areaId, formName, methods);
            return;
        //zhongdianrenyuan
        case "6":
            var methods = {
                click: function (item) {
                    if (item) {
                        var title = '重点人员信息';
                        console.info("item", item);
                        // 是否留守
                        if (item.type == 1) {
                            title = "留守人员信息";
                        }
                        // 是否安置帮教
                        if (item.type == 2) {
                            title = "安置帮教人员信息";
                        }
                        // 是否社区矫正
                        if (item.type == 3) {
                            title = "社区矫正人员信息";
                        }
                        // 是否艾滋病患者
                        if (item.type == 4) {
                            title = "艾滋病患者人员信息";
                        }
                        // 是否肇事肇祸等严重精神障碍患者
                        if (item.type == 5) {
                            title = "肇事肇祸等严重精神障碍患者信息";
                        }
                        // 是否重点青少年
                        if (item.type == 6) {
                            title = "重点青少年人员信息";
                        }
                        // 是否吸毒
                        if (item.type == 7) {
                            title = "吸毒人员信息";
                        }
                        //是否危害国家安全
                        if (item.type == 8) {
                            title = "危害国家安全人员信息";
                        }
                        //是否故意犯法释放
                        if (item.type == 9) {
                            title = "故意犯法释放人员信息";
                        }
                        //是否严重犯罪嫌疑
                        if (item.type == 10) {
                            title = "严重犯罪嫌疑人员信息";
                        }
                        //是否在逃
                        if (item.type == 11) {
                            title = "在逃人员信息";
                        }
                        // 是否重点上访
                        if (item.type == 12) {
                            title = "重点上访人员信息";
                        }
                        // 是否涉教
                        if (item.type == 13) {
                            title = "涉教人员信息";
                        }
                        // 是否危险品从业人员
                        if (item.type == 14) {
                            title = "危险品从业人员信息";
                        }
                        LayerDialog(ctx + '/pop/ccmPeople/mapvForm?id=' + item.id, title, '1100px', '300px');
                    }
                }
            };
            moreColor(formType, areaId, formName, methods);
            return;
        //shijian
        case "7":
            var methods = {
                click: function (item) {
                    if (item) {
                        LayerDialog(ctx + '/event/ccmEventIncident/mapvForm?id=' + item.id, '事件信息', '1100px', '600px');
                    }
                }
            };
            moreColor(formType, areaId, formName, methods);
            return;
        //shipin
        case "8":
            var methods = {
                click: function (item) {
                    if (item) {
                        LayerDialog(ctx + '/ccmsys/ccmDevice/mapvForm?id=' + item.id, '监控信息', '1100px', '700px');
                    }
                }
            };
            simpleColor(formType, areaId, formName, methods);
            return;
    }
}

function simpleColor(formType, areaId, formName, methods) {
    //查询人口信息
    $.getJSON(ctx + '/sys/map/queryAreaPoint?type=' + formType + '&areaId=' + areaId + '&name=' + formName, function (data) {
        if (data == null || data == "" || data == undefined) {
            $.jBox.tip('暂无数据！');
            return;
        }
        ;
        var mapData = [];
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                if (data[i].id && data[i].areaPoint) {
                    var areaPoint = new Array(); //定义一数组
                    areaPoint = data[i].areaPoint.split(",");
                    mapData.push({
                        geometry: {
                            type: 'Point',
                            coordinates: areaPoint,
                        },
                        id: data[i].id,
                        // count: parseInt(Math.random() * 10)
                    });
                }
            }
            simplePoint(mapData, methods);
        }
    })
}

var mapvOptionsBlue = {
    fillStyle: 'rgba(50, 50, 255, 0.6)',
    shadowColor: 'rgba(50, 50, 255, 1)',
    shadowBlur: 30,
    globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsRed = {
    fillStyle: 'rgba(255, 50, 50, 0.6)',
    shadowColor: 'rgba(255, 50, 50, 1)',
    shadowBlur: 30,
    globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsBlueGreen = {
    fillStyle: 'rgba(0,245,222, 0.6)',
    shadowColor: 'rgba(0,245,222, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsYellow = {
    fillStyle: 'rgba(255, 255, 0, 0.6)',
    shadowColor: 'rgba(255, 255, 0, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsPink = {
    fillStyle: 'rgba(255, 146, 149, 0.6)',
    shadowColor: 'rgba(255, 146, 149, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsFlesh = {
    fillStyle: 'rgba(255, 241, 193, 0.6)',
    shadowColor: 'rgba(255, 241, 193, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsDarkBlue = {
    fillStyle: 'rgba(110, 176, 253, 0.6)',
    shadowColor: 'rgba(110, 176, 253, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor1 = {
    fillStyle: 'rgba(55, 162, 218, 0.6)',
    shadowColor: 'rgba(55, 162, 218, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor2 = {
    fillStyle: 'rgba(50, 197, 233, 0.6)',
    shadowColor: 'rgba(50, 197, 233, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor3 = {
    fillStyle: 'rgba(103, 224, 227, 0.6)',
    shadowColor: 'rgba(103, 224, 227, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor4 = {
    fillStyle: 'rgba(159, 230, 184, 0.6)',
    shadowColor: 'rgba(159, 230, 184, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor5 = {
    fillStyle: 'rgba(255, 219, 92, 0.6)',
    shadowColor: 'rgba(255, 219, 92, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor6 = {
    fillStyle: 'rgba(255, 159, 127, 0.6)',
    shadowColor: 'rgba(255, 159, 127, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor7 = {
    fillStyle: 'rgba(251, 114, 147, 0.6)',
    shadowColor: 'rgba(251, 114, 147, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor8 = {
    fillStyle: 'rgba(224, 98, 174, 0.6)',
    shadowColor: 'rgba(224, 98, 174, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor9 = {
    fillStyle: 'rgba(238, 114, 229, 0.6)',
    shadowColor: 'rgba(238, 114, 229, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor10 = {
    fillStyle: 'rgba(231, 188, 243, 0.6)',
    shadowColor: 'rgba(231, 188, 243, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor11 = {
    fillStyle: 'rgba(157, 150, 245, 0.6)',
    shadowColor: 'rgba(157, 150, 245, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor12 = {
    fillStyle: 'rgba(131, 120, 184, 0.6)',
    shadowColor: 'rgba(131, 120, 184, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsColor13 = {
    fillStyle: 'rgba(150, 190, 255, 0.6)',
    shadowColor: 'rgba(150, 190, 255, 1)',
    shadowBlur: 30,
    // globalCompositeOperation: 'lighter',
    methods: {
        click: function (item) {
            console.log(item);
        }
    },
    size: 5,
    draw: 'simple'
}
var mapvOptionsList = [mapvOptionsBlue, mapvOptionsRed, mapvOptionsBlueGreen, mapvOptionsYellow,
    mapvOptionsPink, mapvOptionsFlesh, mapvOptionsDarkBlue, mapvOptionsColor1, mapvOptionsColor2,
    mapvOptionsColor3, mapvOptionsColor4, mapvOptionsColor5, mapvOptionsColor6, mapvOptionsColor7,
    mapvOptionsColor8, mapvOptionsColor9, mapvOptionsColor10, mapvOptionsColor11, mapvOptionsColor12, mapvOptionsColor13];

function moreColor(formType, areaId, formName, methods) {

    //查询人口信息
    $.getJSON(ctx + '/sys/map/queryAreaPoint?type=' + formType + '&areaId=' + areaId + '&name=' + formName, function (data) {
        if (data == null || data == "" || data == undefined) {
            $.jBox.tip('暂无数据！');
            return;
        }
        ;
        var mapData = [];
        // var colorList = [];
        var colorCount = 0;//颜色列表计数器
        var layerCount = 0;//图层计数器
        var dataList = [];
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                if (data[i].id && data[i].areaPoint) {
                    if (data[i].type) {
                        // var pushTemp = 0;//记录要插入的数组
                        if (dataList.hasOwnProperty(data[i].type) == false) {
                            // colorList.push(data[i].type);
                            // colorList[data[i].type] = mapvOptionsList[colorCount];
                            dataList[data[i].type] = [];
                            // pushTemp =data[i].type;
                            // colorCount++;
                            // layerCount++
                        } else {
                            // pushTemp = data[i].type;
                        }
                        var areaPoint = new Array(); //定义一数组
                        areaPoint = data[i].areaPoint.split(",");
                        dataList[data[i].type].push({
                            geometry: {
                                type: 'Point',
                                coordinates: areaPoint,
                            },
                            id: data[i].id,
                            type: data[i].type,
                            // count: parseInt(Math.random() * 10)
                        });
                    }
                }
            }
            console.info("dataList", dataList);
            // colorList.forEach(function (value, key, map) {
            //     alert("参数1="+value+",参数2="+key);
            // });
            var colorTemp = 0;
            for (var key in dataList) {
                mapvOptionsList[colorTemp].methods = methods;
                simplePointMoreColor(dataList[key], mapvOptionsList[colorTemp]);
                if (colorTemp >= mapvOptionsList.length) {
                    colorTemp = 0;
                } else {
                    colorTemp++;
                }

                // var map2 = {};
                // map2.value = data2[key];
                // map2.name = key;
                // data2y[i] = map2;
                // i++;
            }
            // simplePoint(mapData);
        }
    })
}
function areaChangeJboxStyle(h) {
    document.getElementById('jbox-iframe').contentWindow.document.body.style.backgroundColor = "transparent";
    document.getElementById('jbox-iframe').contentWindow.document.body.style.color="white";
}
function videoChangeJboxStyle(h) {
    document.getElementById('jbox-iframe').contentWindow.document.body.style.backgroundColor = "transparent";
    document.getElementById('jbox-iframe').contentWindow.document.body.style.color="white";
}

function videoTreeselectCallBack(v, h, f){
	if (v=="ok"){
		var tree = h.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
		var ids = [], names = [], nodes = [];
		if ("${checked}" == "true"){
			nodes = tree.getCheckedNodes(true);
		}else{
			nodes = tree.getSelectedNodes();
		}
		for(var i=0; i<nodes.length; i++) {
			if(nodes[i].type == "camera"){
				ids.push(nodes[i].id);
				names.push(nodes[i].name);
			}else{
				top.$.jBox.tip("不能选择非监控节点（"+nodes[i].name+"）请重新选择。");
				$("#videoId").val("");
				$("#videoName").val("");
				return false;
			}
		}
		var name = names.join(",");
		var id = ids.join(",").replace(/u_/ig,"");
		if(name == null || name == "" || name == undefined){
			$("#videoId").val("");
			$("#videoName").val("");
			return false;
		}else{
			$("#videoId").val(id);
			$("#videoName").val(names.join(","));
			$('#ccmLiveVideoVisualized').attr("src","/arjccm/a/ccmsys/ccmDevice/getDeviceMap?id=" + id);
			return true;
		}
	}
}