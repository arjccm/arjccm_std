var Map, Pubmap;
var map_level;  // 地图层级
var zTreeObjLeft
var streetFlag, vccmorgFlag, communityFlag, gridFlag, buildFlag, eventFlag, partsFlag, landsFlag, videoFlag,
    broadcastFlag, policeroomFlag, workstationFlag, schoolPlaceFlag, keyPlaceFlag, keyPersonFlag, rentingPersonFlag,
    publicPlaceFlag, popLocationFlag, SetTopBoxFlag;
var checkVideoNode, checkPopNode, checkPopNodeNot, TodyAlarm, reCloseLayerFun, reCloseLayer, reOpenLayerFun;
var TodayVideo, TodayCommunity, TodayHandle, TodayHandleDialog, TodayHandleDialogLayer, TodayHandleDialogLayerClose,
    popLocationData, publicPlaceData, keyPersonHandleLayer, keyPersonHandleFun, keyPersonHandleLayerClose;
eventFlag = true;
streetFlag = true;
communityFlag = false;
gridFlag = false;
openflag = false;


$(function () {

    // 滨海新区 centerCoordinate : [ 117.655020, 39.035450 ],
    // 津南区centerCoordinate : [117.29900836944581,39.03772830963135],
    // http://localhost:6080/arcgis/rest/services/hzd1/ImageServer
    var userId = parent.$('#userid').val();
    if (userId != '1' && userId != undefined) {
        $.ajax({
            type: "get",
            url: ctx + "/org/ccmOrgArea/location?userId=" + userId,
            async: false,
            success: function (data) {
                if (data.areaPoint != '') {
                    var areaPointArr = data.areaPoint.split(',');
                    centerCoordinate = [Number(areaPointArr[0]), Number(areaPointArr[1])];

                    var AreaType = data.type;
                    if (AreaType == '5') {
                        streetFlag = true;
                        communityFlag = false;
                        gridFlag = false;
                        zoomIndex = 13;
                    } else if (AreaType == '6') {
                        streetFlag = false;
                        communityFlag = true;
                        gridFlag = false;
                        zoomIndex = 14;
                    } else if (AreaType == '7') {
                        streetFlag = false;
                        communityFlag = false;
                        gridFlag = true;
                        zoomIndex = 15.5;
                    }
                }
            },
            error: function (err) {
            }
        });
    }


    // 地图默认数据设置
    var defaultPrams = {
        id: 'map',
        centerCoordinate: centerCoordinate,
        zoom: zoomIndex,
        maxZoom: maxZoom,
        minZoom: minZoom,
        baseUrl: baseUrlT,
        zoomShowOrHide: false,// 缩小放大
        // 鹰眼图
        overviewMap: true,
        //比例尺
        scaleLinemapShow: true,
        scaleLineClass: "ol-scale-line ol-custom-scale-line",
        selectPointerFlag: true
    }
    Map = new ArjMap.Map(defaultPrams);
    // 加载地图
    Map.init();

    Pubmap = Map.map;
    // 框选查询初始化
    Map.selectQueryInit();
    window.LayUIMap = Map;// 案事件调用LayUIMap


    // 加载数据
    var PopData = {
        "type": "FeatureCollection",
        "centpoint": ["117.64277015018463", "39.03320166873932"],
        "features": [
            {
                "type": "Feature",
                "id": "4",
                "properties": {
                    "name": "pjq13",
                    "icon": "location48.png",
                    "info": {
                        "设备唯一标识码": "rrrr312351532",
                        "是否授权使用": "20",
                        "设备编号": "4",
                        "登录用户": "pjq13"
                    },
                    "coordinateCentre": ["117.63877015018463",
                        "39.03220166873932"]
                },
                "geometry": {
                    "type": "Point",
                    "coordinates": ["117.63877015018463",
                        "39.03220166873932"]
                }
            }, {
                "type": "Feature",
                "id": "8",
                "properties": {
                    "name": "系统管理员",
                    "icon": "location48.png",
                    "info": {
                        "设备唯一标识码": "aaaa312351532",
                        "是否授权使用": "30",
                        "设备编号": "8",
                        "登录用户": "系统管理员"
                    },
                    "coordinateCentre": ["117.654960", "39.029190"]
                },
                "geometry": {
                    "type": "Point",
                    "coordinates": ["117.654960", "39.029190"]
                }
            }]
    }






// 监听地图层级变化
$.getJSON('' + ctx + '/sys/sysConfig/getMapLevelData', function (
    data) {
    map_level = data;
    // checkZoom(map_level);
    var map = Map.map;// change:resolution
    map.getView().on('change:resolution', checkZoom);// checkZoom为调用的函数
    // 案事件change:resolution
    function checkZoom() {
        // console.log(map.getView().getZoom());
        var zoom = map.getView().getZoom();
        if (map.getView().getZoom() <= Number(map_level.quXian)) {
            Map.layersIsShow('communitys', false);
            Map.layersIsShow('streets', true);
            Map.layersIsShow('grids', false);
            Map.layersIsShow('builds', false);
            Map.layersIsShow('schoolPlace', false);
            Map.layersIsShow('keyPlace', false);
            Map.layersIsShow('events', false);
            Map.layersIsShow('keyPerson', false);
            Map.layersIsShow('rentingPerson', false);
            Map.layersIsShow('lands', false);
            //Map.layersIsShow('videos', false);
            // Map.layersIsShow('heatMap', true);
            // Map.layersIsShow('PopLocation',false);
            Map.layersIsShow('parts', false);
            Map.layersIsShow('publicPlace', false);
            Map.layersIsShow('jingwushi', false);
            Map.layersIsShow('gongzuozhan', false);
            communityFlag = false;
            streetFlag = true;
            gridFlag = false;
            buildFlag = false;
            vccmorgFlag = false;
            eventFlag = false;
            partsFlag = false;
            landsFlag = false;
            videoFlag = true;
            PopulationDensityFlg = false;
            schoolPlaceFlag = false;
            keyPlaceFlag = false;
            keyPersonFlag = false;
            rentingPersonFlag = false;
            publicPlaceFlag = false;

            // Map.clearOverlays();

        } else if (map.getView().getZoom() <= Number(map_level.jieDaoMax)
            && map.getView().getZoom() > Number(map_level.jieDaoMin)) {
            Map.layersIsShow('communitys', true);
            Map.layersIsShow('streets', false);
            Map.layersIsShow('grids', false);
            Map.layersIsShow('builds', false);
            Map.layersIsShow('schoolPlace', false);
            Map.layersIsShow('keyPlace', false);
            Map.layersIsShow('events', true);
            Map.layersIsShow('keyPerson', false);
            Map.layersIsShow('rentingPerson', false);
            Map.layersIsShow('lands', false);
            //Map.layersIsShow('videos', false);
            // Map.layersIsShow('heatMap', true);
            // Map.layersIsShow('PopLocation',true);
            Map.layersIsShow('parts', false);
            Map.layersIsShow('publicPlace', false);
            Map.layersIsShow('jingwushi', false);
            Map.layersIsShow('gongzuozhan', false);
/*            $.each(idArrjingwushi2, function (index, val) {
                Pubmap.removeOverlay(Map['' + val + 'Overlay'])
            });*/
            communityFlag = true;
            streetFlag = false;
            gridFlag = false;
            buildFlag = false;
            vccmorgFlag = false;
            eventFlag = true;
            partsFlag = false;
            landsFlag = false;
            videoFlag = true;
            PopulationDensityFlg = true;
            schoolPlaceFlag = false;
            keyPlaceFlag = false;
            keyPersonFlag = false;
            rentingPersonFlag = false;
            publicPlaceFlag = false;

            // Map.clearOverlays();

        } else if (map.getView().getZoom() > Number(map_level.sheQuMin)
            && map.getView().getZoom() <= Number(map_level.sheQuMax)) {
            Map.layersIsShow('communitys', false);
            Map.layersIsShow('streets', false);
            Map.layersIsShow('grids', true);
            Map.layersIsShow('builds', false);
            Map.layersIsShow('schoolPlace', false);
            Map.layersIsShow('keyPlace', false);
            Map.layersIsShow('events', true);
            Map.layersIsShow('keyPerson', true);
            Map.layersIsShow('rentingPerson', true);
            Map.layersIsShow('lands', true);
            //Map.layersIsShow('videos', true);
            // Map.layersIsShow('heatMap', true);
            // Map.layersIsShow('PopLocation',true);
            Map.layersIsShow('parts', false);
            Map.layersIsShow('publicPlace', false);
            Map.layersIsShow('jingwushi', true);
            Map.layersIsShow('gongzuozhan', true);
            communityFlag = false;
            streetFlag = false;
            gridFlag = true;
            buildFlag = false;
            vccmorgFlag = true;
            eventFlag = true;
            partsFlag = false;
            landsFlag = true;
            videoFlag = true;
            PopulationDensityFlg = true;
            schoolPlaceFlag = true;
            keyPlaceFlag = true;
            keyPersonFlag = false;
            rentingPersonFlag = true;
            publicPlaceFlag = false;
            // Map.clearOverlays();

        } else if (map.getView().getZoom() > Number(map_level.wangGe)) {
            Map.layersIsShow('communitys', false);
            Map.layersIsShow('streets', false);
            Map.layersIsShow('grids', false);
            Map.layersIsShow('builds', true);
            Map.layersIsShow('schoolPlace', true);
            Map.layersIsShow('keyPlace', true);
            Map.layersIsShow('events', true);
            Map.layersIsShow('keyPerson', true);
            Map.layersIsShow('rentingPerson', true);
            Map.layersIsShow('lands', true);
            Map.layersIsShow('videos', true);
            Map.layersIsShow('parts', true);
            Map.layersIsShow('publicPlace', true);
            Map.layersIsShow('PopLocation', true);
            Map.layersIsShow('jingwushi', true);
            Map.layersIsShow('gongzuozhan', true);
            communityFlag = false;
            streetFlag = false;
            gridFlag = false;
            buildFlag = true;
            vccmorgFlag = true;
            eventFlag = true;
            partsFlag = true;
            landsFlag = true;
            videoFlag = true;
            schoolPlaceFlag = true;
            keyPlaceFlag = true;
            keyPersonFlag = true;
            rentingPersonFlag = true;
            publicPlaceFlag = true;
            // Map.clearOverlays();

        }
    }

})

})