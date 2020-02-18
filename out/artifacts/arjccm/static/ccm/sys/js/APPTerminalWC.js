var Map,currPage=1,pageSize =10; //每页出现数量;
var pTypeObj={},placeTypeObj={},placeImportantObj={},userType = "01";
var key,keyControl,keyNormal,lastValue = "",nodeList = [];//搜索相关变量
var checkStatus = "";
//管控人员树
var controlTree, settingontrolPeople;
//工作人员树
var tree, settingPolice;
var treeSearch = null;
$(function(){
	//加载地图
	initMap();
    layui.use('element', function(){
		  var element = layui.element; //Tab的切换功能，
		  element.on('tab(allTab)', function(data){
			  console.log(data);
			  if(data.index == 0){
				  userType = "01";
				  refreshPoliceTree();
			  }else if(data.index == 1){
				  userType = "02";
				  refreshControPeopleTree();
			  }
		  });
		});
    $('.ClearSubmit').click(function(){
    	$('.input-medium').val('');
    	$('#primaryPersonName').val('');
    	$('#primaryPersonId').val('');
    	$('#controlPeopleName').val('');
    	$('#controlPeopleId').val('');
    	HideDiv();
    })
    
    $(":radio").click(function(){
	   checkStatus = $(this).val();
	   if(checkStatus == "primaryRadio"){//工作人员
		   $("#liPrimary").show();
		   $("#liControl").hide();
	   }else if(checkStatus == "controlRadio"){
		   $("#liPrimary").hide();
		   $("#liControl").show();
	   }else {
		   $("#liPrimary").show();
		   $("#liControl").hide();
	   }
	});
    
    keyNormal = $("#key");
    keyNormal.bind("focus", focusKey).bind("blur", blurKey).bind("change cut input propertychange", searchNode);
    keyNormal.bind('keydown', function (e){if(e.which == 13){searchNode();}});
    
	keyControl = $("#keyControl");
	keyControl.bind("focus", focusKey).bind("blur", blurKey).bind("change cut input propertychange", searchNode);
	keyControl.bind('keydown', function (e){if(e.which == 13){searchNode();}});
    //初始化树形
	refreshPoliceTree();
})


/**
 * 加載管控人員樹形
 * @returns
 */

function refreshControPeopleTree(){
	controlTree;
	settingontrolPeople = {
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: '0'
            }
        },
		async: {
			enable:true,
			url: ctx + "/pop/ccmPeople/getUserByType",
			autoParam: ["describe=type"]
		},
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: {
                "Y": "s",
                "N": "s"
            }
        },
        callback: {
            onAsyncSuccess: function(event, treeId, treeNode, msg) {
                var nodes = controlTree.getNodesByParam("pId", treeNode.id, null);
                for (var i = 0,
                l = nodes.length; i < l; i++) {
                    try {
                    	controlTree.checkNode(nodes[i], treeNode.checked, true);
                    } catch(e) {}
                }
            },
            onCheck: function(e, treeId, treeNode) {
            	Map.removeLayer('tralayer1');//轨迹回放
                Map.removeLayer('tralayer2');//轨迹回放
            	Map.removeAppLayer();
            	Map.map.getOverlays().clear();
                var nodes = controlTree.getCheckedNodes(true);
                var items = [];
                for (var i = 0, l = nodes.length; i < l; i++) {
                	controlTree.expandNode(nodes[i], true, false, false);
                    if(!nodes[i].isParent){//用户节点
                    	var item = {};
                    	item.id = nodes[i].id;
                    	item.useType = "02";
                    	items.push(item);
                    }
                }
                GetPopLocation(items);
            }
        },

    };
    $.getJSON(ctx + "/sys/map/treeControlPeopleData?t=" + new Date().getTime(),
    function(data) {
		controlTree = $.fn.zTree.init($("#ztreeControlPeople"), settingontrolPeople, data);
		// 默认展开一级节点
        var nodes = controlTree.getNodesByParam("level", 0);
        for (var i = 0; i < nodes.length; i++) {
        	controlTree.expandNode(nodes[i], true, false, false);
        }
        // 异步加载子节点（加载用户）
        var nodesOne = controlTree.getNodesByParam("isParent", true);
        for (var j = 0; j < nodesOne.length; j++) {
        	controlTree.reAsyncChildNodes(nodesOne[j], "!refresh", true);
        }
        treeSearch = controlTree;
        key = keyControl;
    });
}

/**
 * 加载工作人员树形（此处需要与手机终端用户做关联）
 */
function refreshPoliceTree(){
	tree,
    settingPolice = {
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: '0'
            }
        },
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: {
                "Y": "s",
                "N": "s"
            }
        },
        async: {
            enable:true,
            url: ctx + "/org/ccmOrgTeam/treeUserData?userType="+userType,
            autoParam: ["id=officeId"],
            dataFilter: function(treeId, parentNode, responseData) {
                if (responseData) {
                    for (var i = 0; i < responseData.length; i++) {

						responseData[i].name += responseData[i].userState;

                    }
                }
                return responseData;
            }
        },
        callback: {
            onCheck: function(e, treeId, treeNode) {
	        	Map.removeAppLayer();
	        	Map.map.getOverlays().clear();
                var nodes = tree.getCheckedNodes(true);
                var items = [];
                for (var i = 0, l = nodes.length; i < l; i++) {
                    tree.expandNode(nodes[i], true, false, false);
                    var item = {};
                	item.id = nodes[i].deviceId;
                	item.useType = "01";
                	items.push(item);
                }
                GetPopLocation(items);
            },
            onAsyncSuccess: function(event, treeId, treeNode, msg) {
                var nodes = tree.getNodesByParam("pId", treeNode.id, null);
                for (var i = 0,
                l = nodes.length; i < l; i++) {
                    try {
                        tree.checkNode(nodes[i], treeNode.checked, true);
                    } catch(e) {}
                }
            }
        },

    };

    $.getJSON(ctx + "/sys/office/treeData?type=3&&extId=&isAll=&module=&t=" + new Date().getTime(),
    function(data) {
        tree = $.fn.zTree.init($("#ztreePolice"), settingPolice, data);
        // 默认展开一级节点
        var nodes = tree.getNodesByParam("level", 0);
        for (var i = 0; i < nodes.length; i++) {
            tree.expandNode(nodes[i], true, false, false);
        }
        // 异步加载子节点（加载用户）
        var nodesOne = tree.getNodesByParam("isParent", true);
        for (var j = 0; j < nodesOne.length; j++) {
            tree.reAsyncChildNodes(nodesOne[j], "!refresh", true);
        }
        treeSearch = tree;
        key = keyNormal;
    });
}

function focusKey(e) {
	if (key.hasClass("empty")) {
		key.removeClass("empty");
	}
}
function blurKey(e) {
	if (key.get(0).value === "") {
		key.addClass("empty");
	}
	searchNode(e);
}
//搜索节点
function searchNode() {
	// 取得输入的关键字的值
	var value = $.trim(key.get(0).value);
	
	// 按名字查询
	var keyType = "name";
//	if (key.hasClass("empty")) {
//		value = "";
//	}
	
	// 如果和上次一次，就退出不查了。
	if (lastValue === value) {
		return;
	}
	
	// 保存最后一次
	lastValue = value;
	
	var nodes = treeSearch.getNodes();
	// 如果要查空字串，就退出不查了。
	if (value == "") {
		showAllNode(nodes);
		return;
	}
	hideAllNode(nodes);
	nodeList = treeSearch.getNodesByParamFuzzy(keyType, value);
	updateNodes(nodeList);
}
//隐藏所有节点
function hideAllNode(nodes){			
	nodes = tree.transformToArray(nodes);
	for(var i=nodes.length-1; i>=0; i--) {
		tree.hideNode(nodes[i]);
	}
}

//显示所有节点
function showAllNode(nodes){			
	nodes = tree.transformToArray(nodes);
	for(var i=nodes.length-1; i>=0; i--) {
		/* if(!nodes[i].isParent){
			tree.showNode(nodes[i]);
		}else{ */
			if(nodes[i].getParentNode()!=null){
				tree.expandNode(nodes[i],false,false,false,false);
			}else{
				tree.expandNode(nodes[i],true,true,false,false);
			}
			tree.showNode(nodes[i]);
			showAllNode(nodes[i].children);
		/* } */
	}
}

//更新节点状态
function updateNodes(nodeList) {
	tree.showNodes(nodeList);
	for(var i=0, l=nodeList.length; i<l; i++) {
		
		//展开当前节点的父节点
		tree.showNode(nodeList[i].getParentNode()); 
		//tree.expandNode(nodeList[i].getParentNode(), true, false, false);
		//显示展开符合条件节点的父节点
		while(nodeList[i].getParentNode()!=null){
			tree.expandNode(nodeList[i].getParentNode(), true, false, false);
			nodeList[i] = nodeList[i].getParentNode();
			tree.showNode(nodeList[i].getParentNode());
		}
		//显示根节点
		tree.showNode(nodeList[i].getParentNode());
		//展开根节点
		tree.expandNode(nodeList[i].getParentNode(), true, false, false);
	}
}

function initMap(){
	// 地图默认数据设置
	var defaultPrams = {
		id : 'map',
		centerCoordinate : centerCoordinate,
		zoom : zoomIndex,
		maxZoom : maxZoom,
		minZoom : minZoom,
		baseUrl : baseUrlT,
		zoomShowOrHide : false,// 缩小放大
		overviewMap : false,
		selectPointerFlag : true
	// 鹰眼图
	}
	Map = new ArjMap.Map(defaultPrams);
	// 加载地图
	Map.init();
	map=Map.map;
}
//历史轨迹
function HisTrackFun(_this) {
	var id = $(_this).attr('id')
	var _deviceId = $(_this).attr('deviceId')
    $('#detailsDialog').hide();
	$.getJSON(ctx+'/sys/map/deviceMobileTrace?deviceId=' + _deviceId + '',
			function(data) {
		if (data.returnFlag) {
			TableInit(data);
			$('#popup-closer').click();
		} else {
			top.$.jBox.tip('暂无轨迹信息');
			HideDiv();
		}
  })
}
//历史轨迹查询
function HisTrackFun1() {
	 $('#detailsDialog').hide();
   var beginCreateDate=$('#beginCreateDate').val();
   var endCreateDate=$('#endCreateDate').val();
   var uesrId=$('#primaryPersonId').val();
   if(checkStatus == "controlRadio"){//管控
	   uesrId = $('#controlPeopleId').val();
   }
   if(uesrId==""){
	   top.$.jBox.tip("请选择人员");
	   return;
   }
   if(beginCreateDate==""){
	   top.$.jBox.tip("请选择开始时间");
	   return;
   }
   if(endCreateDate==""){
	   top.$.jBox.tip("请选择结束时间");
	   return;
   }
	$.getJSON(ctx+'/sys/map/deviceMobileTrace?beginCurDate=' + beginCreateDate + '&endCurDate='+endCreateDate+'&user.id='+uesrId,
			function(data) {
		debugger
				if (data.returnFlag) {
					TableInit(data)
				} else {
					top.$.jBox.tip('暂无轨迹信息');
					HideDiv();
				}

			})

}
var routeCoords = [];
var trackReplayLen;
function TableInit(data) {
	debugger
	var Data = data.result
	trackReplayLen = Data.length;
	var tableData = [];
	Map.removeLayer('tralayer1');//轨迹回放
    Map.removeLayer('tralayer2');//轨迹回放
    Map.removeAppLayer();
	if (trackReplayLen == 0) {
		HideDiv();
		top.$.jBox.tip("暂无轨迹信息");
		dataTableInit(tableData)
		return;
	}
	if (trackReplayLen > 0) {
		var html = '';
		routeCoords=[];
		for (var i = 0; i < trackReplayLen; i++) {
			var areaPoint = Data[i].areaPoint;
			var value = [];
			value[0] = Number(areaPoint.split(',')[0]);
			value[1] = Number(areaPoint.split(',')[1]);
			if(checkStatus == "controlRadio"){//管控
				tableData.push([ Data[i].ccmPeople.name, value[0],value[1],Data[i].updateDate ])
			}else{
				tableData.push([ Data[i].user.name, value[0],value[1],Data[i].updateDate ])
			}
			routeCoords.push(value)
		}
		dataTableInit(tableData)
		//轨迹回放
		Map.map.getView().setZoom(18);
		Map.trackCheckStatus = checkStatus;//人员性质
        Map.trackReplayLine(routeCoords);
		
		ShowDiv();
		//页面下方table双击定位到地图设备
  		$('#contentTable tbody').on('dblclick','tr',function(){
  			  var trTdX=Number($(this).children('td').eq(1).text());
  			  var trTdY=Number($(this).children('td').eq(2).text());
  			Map.map.getView().setZoom(18);
  			  Map.goTo([trTdX,trTdY]);//定位
  			 Map.startLocation([trTdX,trTdY]);//轨迹起始位置
  		});
	}
}
function dataTableInit(tableData) {
	$('#TableCon').html('<table cellpadding="0" cellspacing="0" border="0" class="display table table-striped table-bordered table-condensed" id="contentTable"></table>');
	$('#contentTable').dataTable({
		"data" : tableData,
		"searching" : false,
		"bLengthChange" : false,
		"ordering" : false,// 排序
		"paging" : false, // 禁止分页
		"scrollY" : '156px',
		"scrollCollapse" : true,
		"columns" : [{
			"title" : "人员"
		}, {
			"title" : "经度"
		}, {
			"title" : "纬度"
		}, {
			"title" : "时间"
		} ]
	});
}

function ShowDiv() {
	$("#hideOrShowDiv").height(200);
	$("#showDiv").css({
		'bottom' : -30
	});
	$("#hideDiv").css({
		'bottom' : 200
	});
	$("#playBack").css({
		'bottom' : 200
	});
}
function HideDiv() {
	$("#hideOrShowDiv").height(0);
	$("#hideDiv").css({
		'bottom' : -30
	});
	$("#playBack").css({
		'bottom' : -30
	});
	$("#showDiv").css({
		'bottom' : 0
	});
	tableData = [];
	Map.removeLayer('tralayer1');//轨迹回放
    Map.removeLayer('tralayer2');//轨迹回放
	dataTableInit(tableData);
}




function GetPopLocation(items/*userId*/) {
	debugger
	if(null == items || items.length < 0){
		console.error("null == items");
		return;
	}
	for(var i = 0;i<items.length;i++){
		var item = items[i];
		if(null == item){
			console.error("null == item");
			continue;
		}
		var url = "";
		if(item.useType == "01"){//工作人员
			url = '/sys/map/deviceMobileMap?id='+item.id+"&useType="+item.useType;
		}else if(item.useType == "02"){//管控人员
			url = '/sys/map/deviceMobileMap?vSpecialPeople.id='+item.id+"&useType="+item.useType;
		}
		$.getJSON('' + ctx + url,
		function(data) {
			debugger
			Map.addJSONElec([ {
				'type' : 'PopLocation',
				'data' : data,
				'isShow' : true 
			} ]);
			Map.goTo(data.centpoint);
		})
//		Map.layersIsShow('PopLocation', true);
	}
}