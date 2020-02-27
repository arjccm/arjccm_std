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
    /********************地图***********************/
    //地图
    map();
    //街道画线
    // lightLine();
    //初始化网格
    // initorgAreaMap();

    $('#main').height($(window).height());
    $('.height100').height($('#main').height() - 70);
    windowsHeight = $(window).width();
    if (windowsHeight >= 1680 && windowsHeight < 1920) {
        _fontSize = 14;
        radiusData = ['40%', '60%'];
        echarts3X = "48%";
        echarts3y = "40%";
        zoom = 14.7;
        centerCoordinate = [109.40, 18.53]
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
        centerCoordinate = [109.40, 18.53]
        lengthECharts = 30;
        _fontSize1 = 26;
        breakData = 8;
        mapHeigth = '90%'
    } else if (windowsHeight >= 1440 && windowsHeight < 1660) {
        _fontSize = 12;
        radiusData = ['40%', '58%'];
        zoom = 14.4;
        centerCoordinate = [109.40, 18.53]
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
        centerCoordinate = [109.40, 18.53]
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
        centerCoordinate = [109.40, 18.53]
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
        centerCoordinate = [109.40, 18.53]
        lengthECharts = 30;
        _fontSize1 = 26;
        breakData = 8;
        mapHeigth = '90%'
    } else if (windowsHeight >= 1440 && windowsHeight < 1660) {
        _fontSize = 12;
        radiusData = ['40%', '58%'];
        zoom = 14.4;
        centerCoordinate = [109.40, 18.53]
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
        centerCoordinate = [109.40, 18.53]
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