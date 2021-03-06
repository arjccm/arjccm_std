/**
 * Echarts Reuse components, expand yourself, but don't change the original
 * method. Thx. -v1.0.0 2018年1月22日 14:45:58
 */
$(function () {
    /**
     * @see 多表视图数据填充
     * @param datatitle 控制显示选项
     * @param dataX x轴数据
     * @param dataY y轴数据
     * @param model 模型对象
     * @param mainContent 图表标题
     * @param rotate 角度
     */
    var FontColor = "#999", backgroundColor = "#fff";
    var theme = $.cookie('theme');
    var lineStyleColor = "#f1f1f1"
    var lineStyleColor1 = "#c1c1c1"
    var FontColor1 = "#62c9cb"
    if (theme == "black") {
        FontColor = "#fff";
        backgroundColor = "#0e2a4c";
        lineStyleColor = '#397ba1';
        lineStyleColor1 = "#397ba1"
    }
    $.myChartPeople = function (datatitle, dataX, dataY, model, mainContent,
                                rotate, optionToContent) {
        // 指定图表的配置项和数据
        var option = {

            backgroundColor: backgroundColor,
            grid: {
                right: "3%",
                left: "5%"
            },
            title: {
                text: mainContent,
                textStyle: {
                    color: FontColor,
                }
            },
            tooltip: {},
            color : [ '#FC9A2F','#32F7FF' ],
            legend: {
                data: datatitle,
                textStyle: {
                    color: FontColor,
                }
            },
            toolbox: {
                show: true,
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                    restore: {},
                    saveAsImage: {},
                },
                iconStyle: {
                    color: FontColor1,//设置颜色
                }
            },
            xAxis: {
                axisLabel: {
                    /*interval: 0,
                    rotate: rotate,*/
                    textStyle: {
                        color: FontColor,
                    }
                },
                axisTick: {
                    show: true,
                    lineStyle : {
                        color : '#397BA1',
                    },
                    inside: true
                },
                splitLine: {
                    show:false
                },
                axisLine : {
                    lineStyle : {
                        color : '#397BA1',
                    }
                },
                z:999,
                data: dataX
            },
            yAxis: [{
                axisLabel: {
                    textStyle: {
                        color: FontColor,
                    }
                },
                splitLine: {
                    show: true,
                    lineStyle: {
                        type: 'dashed',
                        color: '#2A6283',
                        opacity : '0.3'
                    },
                },
                axisTick: {
                    show: false
                },
                axisLine : {
                    lineStyle : {
                        color : '#397BA1',
                    }
                },
            },
                {
                    splitLine: {
                        show:false
                    },
                    axisLabel: {
                        textStyle: {
                            color: FontColor
                        }
                    },
                    axisLine: {
                        lineStyle : {
                            color : '#397BA1',
                        }
                    },
                    axisTick: {
                        show: false,
                    },
                }],
            series: dataY,
            optionToContent: optionToContent
        };
        model.setOption(option);
    }

    $.myChartPeopleAmountHJ = function (datatitle, dataX, dataY, model, mainContent,
                                rotate, optionToContent) {
        // 指定图表的配置项和数据
        var option = {

            backgroundColor: backgroundColor,
            grid: {
                right: "3%",
                left: "5%"
            },
            title: {
                text: mainContent,
                textStyle: {
                    color: FontColor,
                }
            },
            tooltip: {},
            color : [ '#FC9A2F','#32F7FF' ],
            legend: {
                data: datatitle,
                textStyle: {
                    color: FontColor,
                }
            },
            toolbox: {
                show: true,
                feature: {
                    myToolBack:{
                        show: true,
                        title: '返回上一级',
                        icon: '<svg t="1586253289392" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7245" width="200" height="200"><path d="M588.468659 257.265591H123.316451L371.227243 58.55359a31.947267 31.947267 0 1 0-39.614611-49.837737l-319.472671 255.578137v11.501016a30.669376 30.669376 0 0 0 0 4.472617v3.194727a30.669376 30.669376 0 0 0 0 4.472617v11.501016l319.472671 255.578137a31.947267 31.947267 0 1 0 40.253556-49.837737L123.316451 321.160125h465.152208C792.292223 321.160125 958.418011 464.283881 958.418011 640.632795s-166.125789 319.47267-369.949352 319.472671H95.841801a31.947267 31.947267 0 0 0 0 63.894534h492.626858C830.628943 1024 1022.312545 852.123703 1022.312545 640.632795s-191.683602-383.367205-433.843886-383.367204z" fill="#939495" p-id="7246"></path></svg>',
                        onclick: function(){
                            if(typeof(id) == "undefined"){
                                return;
                            }else{
                                for (var i = 0; i < lowLevelAll.length ; i++) {
                                    if(id == lowLevelAll[i]["value1"]){
                                        id = lowLevelAll[i]["value2"];
                                        break;
                                    }
                                }
                                var listOne = [];
                                var listTwo = [];
                                var listThr = [];
                                var num = 0;
                                for (var i = 0; i < lowLevelAll.length ; i++) {
                                    if(lowLevelAll[i]["value2"] == id){
                                        listOne[num] = lowLevelAll[i];
                                        num++;
                                    }
                                }
                                num = 0;
                                for (var i = 0; i < lowLevelNew.length ; i++) {
                                    if(lowLevelNew[i]["value2"] == id){
                                        listTwo[num] = lowLevelNew[i];
                                        num++;
                                    }
                                }
                                num = 0;
                                for (var i = 0; i < lowLevelLow.length ; i++) {
                                    if(lowLevelLow[i]["value2"] == id){
                                        listThr[num] = lowLevelLow[i];
                                        num++;
                                    }
                                }
                                if(num == 0){
                                    return;
                                }
                                var map = {};
                                map[title1[1]] = listOne;
                                map[title1[0]] = listTwo;
                                map[title1[2]] = listThr;
                                // 图表1 数据
                                var ajaxDataX1 = $.getxAxisDate(map,title1),ajaxDataYALL1 =$.getyAxisDate(map,title1);
                                // 组装图表的Y轴数据
                                var seriesDate1 = $.getSeriesDateHuji(title1, ajaxDataYALL1);
                                var areaToContent = function(opt) {
                                    var axisData = opt.xAxis[0].data;
                                    var series = opt.series;
                                    var table = '<table class="echartfont" style="width:100%;text-align:center" cellspacing="0" cellpadding="0"><tbody><tr>'
                                        + '<td>区域</td>'
                                        + '<td>' + series[0].name + '</td>'
                                        + '<td>' + series[1].name + '</td>'
                                        + '</tr>';
                                    for (var i = 0, l = axisData.length; i < l; i++) {
                                        table += '<tr>'
                                            + '<td>' + axisData[i] + '</td>'
                                            + '<td>' + series[0].data[i] + '</td>'
                                            + '<td>' + series[1].data[i] + '</td>'
                                            + '</tr>';
                                    }
                                    table += '</tbody></table>';
                                    return table;
                                }
                                // 生成图表
                                $.myChartPeopleAmountHJ(title1, ajaxDataX1, seriesDate1, myChart1,"户籍人数",40,areaToContent);
                                // 生成 表单
                                $.TableListPeople("echList1", ajaxDataYALL1, ajaxDataX1);
                            }
                        }
                    },
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                    restore: {},
                    saveAsImage: {},
                },
                iconStyle: {
                    color: FontColor1,//设置颜色
                }
            },
            xAxis: {
                axisLabel: {
                    /*interval: 0,
                    rotate: rotate,*/
                    textStyle: {
                        color: FontColor,
                    }
                },
                axisTick: {
                    show: true,
                    lineStyle : {
                        color : '#397BA1',
                    },
                    inside: true
                },
                splitLine: {
                    show:false
                },
                axisLine : {
                    lineStyle : {
                        color : '#397BA1',
                    }
                },
                z:999,
                data: dataX
            },
            yAxis: [{
                axisLabel: {
                    textStyle: {
                        color: FontColor,
                    }
                },
                splitLine: {
                    show: true,
                    lineStyle: {
                        type: 'dashed',
                        color: '#2A6283',
                        opacity : '0.3'
                    },
                },
                axisTick: {
                    show: false
                },
                axisLine : {
                    lineStyle : {
                        color : '#397BA1',
                    }
                },
            },
                {
                    splitLine: {
                        show:false
                    },
                    axisLabel: {
                        textStyle: {
                            color: FontColor
                        }
                    },
                    axisLine: {
                        lineStyle : {
                            color : '#397BA1',
                        }
                    },
                    axisTick: {
                        show: false,
                    },
                }],
            series: dataY,
            optionToContent: optionToContent
        };
        model.setOption(option);
    }

    $.myChartPeopleAmountElse = function (datatitle, dataX, dataY, model, mainContent,
                                        rotate, optionToContent) {
        // 指定图表的配置项和数据
        var option = {

            backgroundColor: backgroundColor,
            grid: {
                right: "3%",
                left: "5%"
            },
            title: {
                text: mainContent,
                textStyle: {
                    color: FontColor,
                }
            },
            tooltip: {},
            color : [ '#FC9A2F','#32F7FF' ],
            legend: {
                data: datatitle,
                textStyle: {
                    color: FontColor,
                }
            },
            toolbox: {
                show: true,
                feature: {
                    myToolBack:{
                        show: true,
                        title: '返回上一级',
                        icon: '<svg t="1586253289392" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7245" width="200" height="200"><path d="M588.468659 257.265591H123.316451L371.227243 58.55359a31.947267 31.947267 0 1 0-39.614611-49.837737l-319.472671 255.578137v11.501016a30.669376 30.669376 0 0 0 0 4.472617v3.194727a30.669376 30.669376 0 0 0 0 4.472617v11.501016l319.472671 255.578137a31.947267 31.947267 0 1 0 40.253556-49.837737L123.316451 321.160125h465.152208C792.292223 321.160125 958.418011 464.283881 958.418011 640.632795s-166.125789 319.47267-369.949352 319.472671H95.841801a31.947267 31.947267 0 0 0 0 63.894534h492.626858C830.628943 1024 1022.312545 852.123703 1022.312545 640.632795s-191.683602-383.367205-433.843886-383.367204z" fill="#939495" p-id="7246"></path></svg>',
                        onclick: function(){
                            if(typeof(id) == "undefined"){
                                return;
                            }else{
                                for (var i = 0; i < lowLevelAll.length ; i++) {
                                    if(id == lowLevelAll[i]["value1"]){
                                        id = lowLevelAll[i]["value2"];
                                        break;
                                    }
                                }
                                var listOne = [];
                                var listTwo = [];
                                var num = 0;
                                for (var i = 0; i < lowLevelAll.length ; i++) {
                                    if(lowLevelAll[i]["value2"] == id){
                                        listOne[num] = lowLevelAll[i];
                                        num++;
                                    }
                                }
                                num = 0;
                                for (var i = 0; i < lowLevelNew.length ; i++) {
                                    if(lowLevelNew[i]["value2"] == id){
                                        listTwo[num] = lowLevelNew[i];
                                        num++;
                                    }
                                }
                                if(num == 0){
                                    return;
                                }
                                var map = {};
                                map[title1[1]] = listOne;
                                map[title1[0]] = listTwo;
                                // 图表1 数据
                                var ajaxDataX1 = $.getxAxisDate(map,title1),ajaxDataYALL1 =$.getyAxisDate(map,title1);
                                // 组装图表的Y轴数据
                                var seriesDate1 = $.getSeriesDateHuji(title1, ajaxDataYALL1);
                                var areaToContent = function(opt) {
                                    var axisData = opt.xAxis[0].data;
                                    var series = opt.series;
                                    var table = '<table class="echartfont" style="width:100%;text-align:center" cellspacing="0" cellpadding="0"><tbody><tr>'
                                        + '<td>区域</td>'
                                        + '<td>' + series[0].name + '</td>'
                                        + '<td>' + series[1].name + '</td>'
                                        + '</tr>';
                                    for (var i = 0, l = axisData.length; i < l; i++) {
                                        table += '<tr>'
                                            + '<td>' + axisData[i] + '</td>'
                                            + '<td>' + series[0].data[i] + '</td>'
                                            + '<td>' + series[1].data[i] + '</td>'
                                            + '</tr>';
                                    }
                                    table += '</tbody></table>';
                                    return table;
                                }
                                // 生成图表
                                $.myChartPeopleAmountElse(title1, ajaxDataX1, seriesDate1, myChart1,titleOne,40,areaToContent);
                                // 生成 表单
                                $.TableListPeople("echList1", ajaxDataYALL1, ajaxDataX1);
                            }
                        }
                    },
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                    restore: {},
                    saveAsImage: {},
                },
                iconStyle: {
                    color: FontColor1,//设置颜色
                }
            },
            xAxis: {
                axisLabel: {
                    /*interval: 0,
                    rotate: rotate,*/
                    textStyle: {
                        color: FontColor,
                    }
                },
                axisTick: {
                    show: true,
                    lineStyle : {
                        color : '#397BA1',
                    },
                    inside: true
                },
                splitLine: {
                    show:false
                },
                axisLine : {
                    lineStyle : {
                        color : '#397BA1',
                    }
                },
                z:999,
                data: dataX
            },
            yAxis: [{
                axisLabel: {
                    textStyle: {
                        color: FontColor,
                    }
                },
                splitLine: {
                    show: true,
                    lineStyle: {
                        type: 'dashed',
                        color: '#2A6283',
                        opacity : '0.3'
                    },
                },
                axisTick: {
                    show: false
                },
                axisLine : {
                    lineStyle : {
                        color : '#397BA1',
                    }
                },
            },
                {
                    splitLine: {
                        show:false
                    },
                    axisLabel: {
                        textStyle: {
                            color: FontColor
                        }
                    },
                    axisLine: {
                        lineStyle : {
                            color : '#397BA1',
                        }
                    },
                    axisTick: {
                        show: false,
                    },
                }],
            series: dataY,
            optionToContent: optionToContent
        };
        model.setOption(option);
    }

    // 补充Table数据-单表
    $.TableListPeople = function (echList, data, Ylength) {
        // 拼接 table内容
        var tableContent = "";
        // 获取 按月类型值
        for (var i = 0; i < Ylength.length; i++) {
            // 获取每一个值
            tableContent += "<tr><td>" + IsNull(Ylength[i]) + "</td><td>"
                + IsNull(data[0][i]) + "</td><td>" + IsNull(data[1][i])
                + "</td></tr>";
        }
        // 添加内容 到页面
        $("#" + echList + " .body").html(tableContent);

        // 添加BootstrapTable应用
//		$('.table.table-striped').bootstrapTable({
//			height : 250
//		});
    }

    // 判断是否为空
    function IsNull(variable1) {
        if (variable1 !== null && variable1 != undefined && variable1 != '') {
            return variable1;
        } else {
            return "0";
        }
    }

    /**
     * @Param titleS
     * @Param ajaxDataYALLS
     */
    $.getSeriesDate = function (titleS, ajaxDataYALLS) {
        // 返回数据
        var seriesDate1 = new Array();
        // for 循环生成数据
        for (var titleNumer = 0; titleNumer < titleS.length; titleNumer++) {
            seriesDate1.push({
                "name": titleS[titleNumer],
                "type": 'bar',
                "data": ajaxDataYALLS[titleNumer]
            })
        }
        // 返回数据
        return seriesDate1;
    }

    //户籍人口类型图形生成
    $.getSeriesDateHuji = function (titleS, ajaxDataYALLS) {

        var color1 = [ '#3fb1e3', '#3fb1e3' ]
        var barWidth = '30%';
        if ($.cookie('theme') == undefined) {
            color1 = [ '#3fb1e3', '#3fb1e3' ]
            var barWidth = '30%';
        } else if ($.cookie('theme') == 'gradient') {
            color1 = [ '#3fb1e3', '#3fb1e3' ]
            var barWidth = '30%';
        } else if ($.cookie('theme') == 'black') {
            color1 = [ '#32F7FF','#0E2A4C' ]
            var barWidth = '62%';
        }

        // 返回数据
        var seriesDate1 = new Array();
        // // for 循环生成数据
        // for (var titleNumer = 0; titleNumer < titleS.length; titleNumer++) {
        if(titleS.length == 3){
            seriesDate1.push({
                "name": titleS[1],
                "type": 'bar',
                "barWidth": barWidth,
                "stack": 'one',
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: color1[0] // 0% 处的颜色
                        }, {
                            offset: 1,
                            color: color1[1] // 100% 处的颜色
                        }], false),
                    }
                },
                "data": ajaxDataYALLS[1]
            }, {
                "name": titleS[0],
                "type": 'line',
                "yAxisIndex": '1',
                symbolSize: 6,
                z:1000,
                "data": ajaxDataYALLS[0]
            },{
                "name": titleS[2],
                "type": 'bar',
                "barWidth": barWidth,
                "stack": 'one',
                itemStyle: {
                    normal: {
                        color: 'red',
                    }
                },
                "data": ajaxDataYALLS[2]
            } )
        }else{
            seriesDate1.push({
                "name": titleS[1],
                "type": 'bar',
                "barWidth": barWidth,
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: color1[0] // 0% 处的颜色
                        }, {
                            offset: 1,
                            color: color1[1] // 100% 处的颜色
                        }], false),
                        barBorderRadius: [6, 6, 0, 0],
                    }
                },
                "data": ajaxDataYALLS[1]
            }, {
                "name": titleS[0],
                "type": 'line',
                "yAxisIndex": '1',
                symbolSize: 8,
                z:1000,
                "data": ajaxDataYALLS[0]
            })
        }
        // }
        // 返回数据
        return seriesDate1;
    }

    //其他人口类型图形生成
    $.getSeriesDateOther = function (titleS, ajaxDataYALLS) {

        var color = [['#32F7FF','#0E2A4C'],['#3289FF','#0E2A4C']];

        // 返回数据
        var seriesDate1 = new Array();
        // for 循环生成数据
        for (var titleNumer = 0; titleNumer < titleS.length; titleNumer++) {
            seriesDate1.push({
                "name": titleS[titleNumer],
                "type": 'bar',
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: color[titleNumer][0] // 0% 处的颜色
                        }, {
                            offset: 1,
                            color: color[titleNumer][1] // 100% 处的颜色
                        }], false),
                        barBorderRadius: [6, 6, 0, 0],
                    }
                },
                "data": ajaxDataYALLS[titleNumer]
            })
        }
        // 返回数据
        return seriesDate1;
    }

    /**
     * @Param data 返回数据
     * @Param titleS 本月户籍新增人数
     * @Param XYtype type_value
     *
     */
    $.getyAxisDate = function (data, titleS, XYtype) {
        // 表1数据-本月户籍新增人数 group area
        var ajaxDataYALL1 = new Array();
        for (var number = 0; number < titleS.length; number++) {
            var dataA = data[titleS[number]];
            var ajaxDataY1 = new Array();
            for (var one in dataA) {
                var item = dataA[one];
                ajaxDataY1.push(item["value"]);
            }
            ajaxDataYALL1.push(ajaxDataY1);
        }
        return ajaxDataYALL1;
    }

    /**
     * @Param data 数据
     * @Param titleS 标题
     */
    $.getxAxisDate = function (data, titleS) {
        // 表1数据-本月户籍新增人数 group area
        var ajaxDataY1 = new Array();
        var dataA = data[titleS[0]];
        for (var one in dataA) {
            var item = dataA[one];
            ajaxDataY1.push(item["type"]);
        }
        return ajaxDataY1;
    }

});