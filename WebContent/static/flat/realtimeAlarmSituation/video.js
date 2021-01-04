/*视频播放-摄像机*/
$(function(){
	$("#popup").on("click",".videoPlay",function() {
		var id = $(this).attr('videoId');
		var typeVidicon = $(this).attr('typeVidicon');
		videoDialog(id,typeVidicon);
	})
	$("#popup").on("click",".vlcPlay",function() {
		var id = $(this).attr('vlcId');
//		vlcDialog(id);
		vlcTest();
	})
	//录像回放
	$("#popup").on("click",".hkPlayBack",function() {
		var id = $(this).attr('videoId');
		var typeVidicon = $(this).attr('typeVidicon');
		hkPlayBack(id,typeVidicon);
	})
})
function videoDialog(id,typeVidicon){
	debugger
	// 接入方式 0：综合安防  1：只能应用
	var hktype = "0";
	var noCache = Date();
	var hikvisonVideoType = "";

	var areaCamerType = "";
	var areaoffsetType = "";
	// 海康设备 为2
	if(typeVidicon==2){
		$.ajaxSettings.async = false;
		$.getJSON('/arjccm/app/rest/video/callApiGetSecurity', {"noCache": noCache}, function (data) {
			hikvisonVideoType = data.result.hikvisonVideoType;
		});
		areaCamerType =  hktype == hikvisonVideoType ? ["850px", "408px"] : ["0px", "0px"];
		areaoffsetType = hktype == hikvisonVideoType ? ['27.3%', '27.3%'] : ['27.3%', '69%'];
	}else {
		areaCamerType = ["850px", "408px"];
		areaoffsetType = ['27.3%', '27.3%'];
	}

	// 捕获页
	var html = "";
	/*html += '<div class="layer-common">'*/
	html += '<div class="layer-common"  style="width: 632px;height: auto; position: relative;padding: 14px 0 0 0; float: left">'

	html += '	<div class="layer-common-header" style="top: 1px; left: 36px;display: inline-block; padding: 5px 30px; border: 1px solid #0343a3; transform: skew(-20deg); background: #0343a3;color: #fff; font-weight: bold; position: absolute; z-index: 9999;">'
	html += '		<div style=" transform: skew(20deg); white-space: nowrap;font-size: 15px;">视频监控</div>'
	html += '	</div>'
	html += '	<div class="layer-show  layer-common-center" style="padding: 10px 10px 5px 10px; border: 1px solid #10559a;margin-left: 10px;">'
	html += '<iframe name="mainFrame" src="'+ ctx+'/ccmsys/ccmDevice/getDeviceMap?id='+ id+'" style="overflow: visible;" scrolling="yes" frameborder="no" width="870" height="360" allowfullscreen="true" allowtransparency="true"></iframe>'
	html += '	</div>'
	html += '</div>'
	layer.open({
		type : 1,
		shade : false,
		/*title : '视频监控', // 不显示标题*/
		title: false, // 不显示标题
		area: areaCamerType,
		move: '.layer-common-header',
		resize: false,
		id : "videoDialog" +id,
		content : html,
		offset: areaoffsetType,
		cancel : function() {
			// 关闭事件
		}
	});
	$('#videoDialog').attr("style", "overflow:hidden");

	/*var index = layer.getFrameIndex(window.name);//获得layer弹出层索引
	top.layer.iframeAuto(index, 30);//layer弹出层自适应，改造的代码，源代码加上自己加的高度
	var topHeight = ($(window).height() - $(window).height())/2;//计算高度
	layer.style(index,{top:topHeight+"px"});//设置弹出层位置*/
}

// 海康录像回放
function hkPlayBack(videoId, cameraType) {

	var id = videoId;
	// 海康视频接入方式 0：综合安防  1：智能应用
	var hktype = "0";
	var noCache = Date();
	var hikvisonVideoType = "";

	var areaCamerType = "";
	var areaoffsetType = "";
	// 海康设备 为2
	if(cameraType==2){
		areaCamerType = ["1000px", "415px"];
		areaoffsetType = ['27.3%', '35.3%'];
	}

	// 捕获页
	var html = "";
	html += '<div style="width: 152px;float: right;margin-top: 35px">'
	html += '<input id="startTimeStamp" name="startTimeStamp" type="text" style=" width: 142px;margin-bottom: 10px" placeholder="开始时间" value="" onclick="WdatePicker({position:{top:\'above\'},maxDate:\'#F{$dp.$D(\\\'endTimeStamp\\\')}\',dateFmt:\'yyyy-MM-dd HH:mm:ss\',isShowClear:false})">'
	html += '<input id="endTimeStamp" name="endTimeStamp" type="text" style="width: 142px;margin-bottom: 10px" placeholder="结束时间" onclick="WdatePicker({minDate:\'#F{$dp.$D(\\\'startTimeStamp\\\')}\',dateFmt:\'yyyy-MM-dd HH:mm:ss\',isShowClear:false})">'
	html += '<strong style="width:90px;padding:0;margin:0;margin-left: 25px;background-color: #51a351" id="playBack" class="click btn btn-success">回放</strong>'
	html += '</div>'
	html += '<div class="layer-common"  style="overflow: hidden;width: 632px;height: auto; position: relative;padding: 14px 0 0 0; float: left">'
	html += '<div class="layer-common-header" style="top: 1px; left: 36px;display: inline-block; padding: 5px 30px; border: 1px solid #0343a3; transform: skew(-20deg); background: #0343a3;color: #fff; font-weight: bold; position: absolute; z-index: 9999;">'
	html += '<div style=" transform: skew(20deg); white-space: nowrap;font-size: 15px;">录像回放</div>'
	html += '</div>'

	html += '<div class="layer-show  layer-common-center" style="height: 360px;margin-top: 1%;padding: 10px 10px 5px 10px; border: 1px solid #10559a;margin-left: 10px;background: url('
		+ ctxStatic
		+ '/common/index/images/showbg.png);background-size: 100% 100%;">'

	html += '<iframe id="addFrame"  name="mainFrame" src="'
		+ ctx
		+ '/ccmsys/ccmDevice/hkPlayBack?id='
		+ id
		+ '" style="overflow: visible;" scrolling="yes" frameborder="no"  width="870" height="360" allowfullscreen="true" allowtransparency="true">' +
		'</iframe>'

	html += '</div>'

	html += '</div>'


	layer.open({
		type: 1,
		shade: false,
		title: false, // 不显示标题
		area: areaCamerType,
		move: '.layer-common-header',
		resize: false,
		fixed: false,
		scrollbar: false,
		id: "videoLayer" +id,
		content: html,
		offset: areaoffsetType,
		cancel: function () {
			// 关闭事件
			// layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构',
			// {time: 5000, icon:6});
		}
	});
	$('#videoLayer').attr("style", "overflow:hidden");
	$("#playBack").on("click",function(){
		var childWindow = $("#addFrame")[0].contentWindow;
		var startTimeStamp = $("#startTimeStamp").val();
		var endTimeStamp = $("#endTimeStamp").val();
		// 录像回放
		childWindow.playBack(startTimeStamp,endTimeStamp)
	})
}
/*视频播放-警车警力视频流播放--vlc*/
function vlcDialog(userId){
	var html = "";
	html += '<object classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" codebase="./axvlc.cab" id="vlc" width="1140" height="640" events="True">'
	html += '<param name="mrl" value="rtsp://192.168.11.204:8554/200692" />'
	html += '<param name="volume" value="50" />'
	html += '<param name="autoplay" value="true" />'
	html += '<param name="toolbar" value="true" />'
	html += '<param name="loop" value="true" />'
	html += '<param name="fullscreen" value="false" />'
	html += '</object>'
	layer.open({
		type : 1,
		shade : false,
		title : '视频监控', // 不显示标题
		area : [ "600px", "425px" ],
		id : "vlcDialog",
		content : html,
		cancel : function() {
			// 关闭事件
		}
	});
}

function vlcTest(){
	var html = "";
	html += '<div class="layer-common">'
	html += '<div class="layer-show  layer-common-center" style="padding: 5px 0px 5px 0px; width: 99%;height: 100%;  border: 1px solid #10559a;">'
	html += '<iframe name="mainFrame" src="'+ ctx+'/ccmsys/ccmDevice/test" style="overflow: visible;" scrolling="yes" frameborder="no" width="570" height="360" allowfullscreen="true" allowtransparency="true"></iframe>'
	html += '</div>'
	html += '</div>'
	layer.open({
		type : 1,
		shade : false,
		title : '视频监控', // 不显示标题
		area : [ "600px", "425px" ],
		id : "videoDialog",
		content : html,
		cancel : function() {
			// 关闭事件
		}
	});
}