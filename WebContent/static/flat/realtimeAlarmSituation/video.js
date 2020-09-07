/*视频播放-摄像机*/
$(function(){
	$("#popup").on("click",".videoPlay",function() {
		var id = $(this).attr('videoId');
		videoDialog(id);
	})
	$("#popup").on("click",".vlcPlay",function() {
		var id = $(this).attr('vlcId');
//		vlcDialog(id);
		vlcTest();
	})
})
function videoDialog(id){
	// 接入方式 0：综合安防  1：只能应用
	var hktype = "0";
	var noCache = Date();
	var hikvisonVideoType = "";
	$.ajaxSettings.async = false;
	$.getJSON('/arjccm/app/rest/video/callApiGetSecurity', {"noCache": noCache}, function (data) {
		console.log("------------->data.result",data.result.hikvisonVideoType)
		hikvisonVideoType = data.result.hikvisonVideoType;
	});

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
		area: hktype == hikvisonVideoType ? ["850px", "408px"] : ["0px", "0px"],
		move: '.layer-common-header',
		resize: false,
		id : "videoDialog" +id,
		content : html,
		offset: hktype == hikvisonVideoType ? ['27.3%', '27.3%'] : ['27.3%', '69%'],
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