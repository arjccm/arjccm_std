<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="shiro" uri="/WEB-INF/tlds/shiros.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${ctxStatic}/arjim/css/im.css">
<link rel="stylesheet" href="${ctxStatic}/arjim/layui/css/layui.css">
<script src="${ctxStatic}/arjim/js/util.js"></script>
<script src="${ctxStatic}/arjim/js/message.js"></script>
<script src="${ctxStatic}/arjim/js/messagebody.js"></script>
<script src="${ctxStatic}/arjim/dwr/engine.js"></script>
<script src="${ctxStatic}/arjim/dwr/interface/Imwebserver.js"></script>
<script src="${ctxStatic}/arjim/layui/layui.js"></script>
<script src="${ctxStatic}/arjim/js/websocketconfig.js?adv='+Math.random()+'"></script>
<%-- <script src="${ctxStatic}/webRtc/js/websocket.js"></script>
<script src="${ctxStatic}/webRtc/js/webrtc.js"></script> 
<script src="${ctxStatic}/webRtc/js/publicControl.js"></script> 
<script src="${ctxStatic}/webRtc/js/oneControl.js"></script> --%>
<style>
.modal{
z-index: 19920214;
top:7%;
}
.exitGrp .layui-layer-content{
    line-height: 50px;
    text-align: center;
}
body .layui-layim-min{
    border: none;
}
.layui-layim-min .layui-layer-content{
    margin: 0;
}
.layui-layer-dialog .layui-layer-content{
    width: auto;
}
</style>
<script>
//layim接口地址
//var arjimRest="http://153.0.171.153:8090/arjim-server/";
var arjimRest="http://"+window.location.host+"/arjim-server/";
//var arjWebRtc="https://192.168.1.157:9090";
//var arjWebRtc="https://47.94.247.75:9090";
/*if(window.location.hostname.startsWith("10")
    || window.location.hostname.startsWith("local")
    || window.location.hostname.startsWith("127")){
    arjimRest="http://10.224.13.146:8080/arjim-server/"
    arjWebRtc="https://10.224.13.145:9090";
}else if(window.location.hostname.startsWith("153")){
    arjimRest="http://153.0.171.153:8090/arjim-server/"
    arjWebRtc="https://153.0.171.158:9091";
}*/
var onlineUser = [];
var sendMsgParam ={};

var sendWebRtcParm = {};
var loginName="${fns:getUser().loginName}";
var loginUserName="${fns:getUser().name}";
var photo="${fns:getUser().photo}";
//当前用户姓名/用户头像
sendMsgParam.currentUserName = loginUserName;
sendMsgParam.currentUserPhoto = photo;
console.log("photo--》",photo);
$.ajax({
	type : "post",
	url : arjimRest+"login",
	async : false,
	data:{'account':loginName},
	success : function(data){
		//登录成功之后进行 点对点用户注册
		imInit()
        //userRegisterws(currentsession);
	},
	error:function(err){
	}
});
var groupMember ={};


function getMembers(groupId) {
    $.ajax({
        type : "get",
        url : arjimRest+'getGroupUser', //接口地址
        async : false,
        data:{'id':groupId},
        success : function(data){
            groupMember =  JSON.parse(data).data.list;
        },
        error:function(err){
        }
    });
}
//获取群组用户视频状态
var userRoomStatus ="";
var $url = "/arjccm/app"
function getGroupUserStatus(json) {
    $.ajax({
        type: "get",
        url: $url+'/rest/ImChat/findUserGroupRel',
        data: json,
        async : false,
        success : function(res){
            userRoomStatus = res.result;
            return userRoomStatus
        },
        error:function(err){
        }
    });
}
var currentsession="${fns:getUser().id}";
 //当前用户ID
sendMsgParam.currentUserId = currentsession;

// sendVideoOrAuidoMsg(currentUserId,currentUserName ,currentUserPhoto,firedId,callType,type,reqType,resSign,vaGroupId,vaGroupName)
var showmsg,lm;
 function imInit(){
	//一般直接写在一个js文件中
		layui.use(['layer', 'jquery'], function(){
		   var layer = layui.layer ,$ = layui.jquery;
		   //发送消息
	       var sendMsg=function(msg,receiver,group){
	    	  var message = new proto.Model(); 
	      	  var content = new proto.MessageBody();
	           message.setMsgtype(4);
	           message.setCmd(5);
	           message.setGroupid(group);//系统用户组
	           message.setToken(currentsession);  
	           message.setSender(currentsession);
	           message.setReceiver(receiver);//好友ID
	           content.setContent(msg);
	           content.setType(0)
	           message.setContent(content.serializeBinary())
	           socket.send(message.serializeBinary()); 
		  }
		   //拉取离线消息
	       var showOfflineMsg = function (layim){
	    	 $.ajax({
				  type : "post",
				  url : arjimRest+"getofflinemsg",
				  async : true,
				  data:{'userId':currentsession},
				  success : function(data){ 
					  var dataObj=eval("("+data+")");
				      if(dataObj!=null&&dataObj.length>0){
				    	  for(var i =0;i<dataObj.length;i++){
				    		  layim.getMessage({
						 	        username: dataObj[i].sendusername
						 	        ,avatar: dataObj[i].avatar+"?"+new Date().getTime()
						 	        ,id: dataObj[i].senduser
						 	        ,type: "friend"
						 	        ,content: dataObj[i].content
						 	        ,timestamp: dataObj[i].createdate
					 	       }); 
				    	  }   
					  } 
				  }
			  });
	     }
           showmsg = function(data){
	   	        var msg = eval("("+data.user+")");
		   	    var content = eval("("+data.content+")"); 
			   	var cache = layui.layim.cache();
				var local = layui.data('layim')[cache.mine.id];
				var username = "",avatar="",friend=false;
			    layui.each(cache.friend, function(index1, item1){
		        layui.each(item1.list, function(index, item){
		              if(item.id == msg.sender){ 
		                username = item.username;
		                avatar = item.avatar;
		                return friend = true;
		              }
		            });
		            if(friend) return true;
		        }); 
		   	 
		   	   if(msg.cmd==3){
		   	    	  if(msg.sender!=currentsession){
		   	    		layer.msg(username+"上线了");  
		   	    		lm.setFriendStatus(msg.getSender(), 'online');  
		   	    	  } 
		   	   }else if(msg.cmd==4){
		    	       if(msg.sender!=currentsession){
		     	    		layer.msg(username+"下线了");  
		     	    		lm.setFriendStatus(msg.getSender(), 'offline');
		     	       }    
		     	}else if(msg.cmd==5){
		   	    	   //显示非自身消息    
	      	    	   if(msg.sender!=currentsession){
	      	    		  var time = (new Date(msg.timeStamp)).getTime(); 
	      	    		   //不显示用户组消息
	      	    		   if(msg.groupId==null||msg.groupId.length<1){
	  	    				    lm.getMessage({
						 	        username: username
						 	        ,avatar: avatar+"?"+new Date().getTime()
						 	        ,id: msg.sender
						 	        ,type: "friend"
						 	        ,content: content.content
						 	        ,timestamp:time
					 	     	});   
	      	    		   }else{
	      	    			    lm.getMessage({
						 	        username: username
						 	        ,avatar: avatar+"?"+new Date().getTime()
						 	        ,id: msg.groupId
						 	        ,type: "group"
						 	        ,content: content.content
						 	        ,timestamp: time
					 	     	});  
	      	    		   } 
	      	    	  }  
		   	   } 
		   	   /* 
				以下代码只适合ie10以上浏览器  无法兼容低版本浏览器
				var  msgmodel =  proto.Model.deserializeBinary(data);  
				var  msgbody = proto.MessageBody.deserializeBinary(msgmodel.getContent()); 
				alert(msgbody.getContent())
				*/
	   	  
	     }
            parent.layui.use(['layim','layer'], function(layim){
               var $ = layui.jquery, layer = layui.layer;
		       //基础配置
		       layim.config({
			 
			    init: {
			    	url: arjimRest+'getusers?userId='+currentsession //接口地址（返回的数据格式见layim文档）
					,type: 'get' //默认get，一般可不填
					,data: {} //额外参数 
			    	
			    }, //获取主面板列表信息
			    title:"我的IM"
			    ,notice:true,
			    //获取群员接口  请自行实现获取群用户
			    members: {
			      url:  arjimRest+'getGroupUser' //接口地址
			      ,type: 'get' //默认get，一般可不填
			      ,data: {} //额外参数
			    },   
			    //上传图片接口（返回的数据格式见下文）
			     uploadImage: {
			      url: arjimRest+'imgupload?userId='+currentsession, //接口地址
			      type: 'post' //默认post
			    }, 
			    //上传文件接口（返回的数据格式见下文）
			    uploadFile: {
			      url: arjimRest+'fileupload?userId='+currentsession, //接口地址
			      type: 'post' //默认post
			    },  
			    //扩展工具栏，下文会做进一步介绍（如果无需扩展，剔除该项即可）
			    tool: [/*{
				           alias: 'codeAudio' //工具别名
					      ,title: '语音' //工具名称
					      ,icon: '&#xe6fc;' //工具图标，参考图标文档
					    },*/{
			      alias: 'codeVideo' //工具别名
			      ,title: '视频' //工具名称
			      ,icon: '&#xe6ed;' //工具图标，参考图标文档
			    }],
			   // isAudio: false, //开启聊天工具栏音频
			    isVideo: false, //开启聊天工具栏视频
			    brief:false,
				min:false,
				isgroup:true,
				voice:false,
				copyright:true
				//  ,msgbox: 'message' 消息盒子页面地址，若不开启，剔除该项即可
			    ,find: layui.cache.dir + 'css/modules/arjim/html/find.jsp' //发现页面地址，若不开启，剔除该项即可
			    ,chatLog: '${ctx}/im/historymessage' //聊天记录页面地址，若不开启，剔除该项即可
			  });
                var meid;
			   layim.on('ready', function(res){
				  lm = layui.layim;
				  //添加客服
				/* layim.addList({
					  type: 'friend' //列表类型，只支持friend和group两种*/
                  //,avatar: "${ctxStatic}/arjim/layui/images/0.jpg" //好友头像
                 /*  ,username: '琪琪IM智能客服' //好友昵称
						  ,groupid: 1 //所在的分组id
						  ,id: "0" //好友id
						  ,sign: "有什么问题尽管问我把" //好友签名
				  });  */
				  layim.msgbox(2); //模拟消息盒子有新消息，实际使用时，一般是动态获得
				  //取得离线消息
				  showOfflineMsg(layim)
				  layim.setFriendStatus(currentsession, 'online');
				  meid = res.mine.id
                   return meid
			   });
               //呼叫人消息发送标志位，发送过后就不用再发了，直接进入即可；
               var callerSendMsgFlag = true;
               //被呼叫人
               var calleeSendMsgFlag = true;
			   //监听自定义工具栏点击，以添加代码为例
			   layim.on('tool(codeVideo)', function(insert, send, obj){ //事件中的tool为固定字符，而code则为过滤器，对应的是工具别名（alias）
                   var cache = layui.layim.cache();
                   var reqType =  obj.data.type;
                   var groupId = obj.data.id;//如果群聊，则为群ID，如果单聊，则为用户ID；
			       if(reqType === 'group'){
                       sendWebRtcParm.vaGroupId = groupId;
                       sendWebRtcParm.vaGroupName = obj.data.groupname;
                       sendWebRtcParm.callType = "callee";
                       sendWebRtcParm.type = "video";
                       sendWebRtcParm.reqType = "group";
                       sendWebRtcParm.resSign = "agree";
                       var json  = {
                           groupId:groupId,
                           userId:currentsession
                       }
                       getGroupUserStatus(json);
                       console.log("userRoomStatus: " + userRoomStatus);
			           var groupName = obj.data.groupname;
                       getMembers(groupId);
                       for(var i=0;i<groupMember.length;i++){
                          //注意：此处需要排除当前用户；
                           if(groupMember[i].id != currentsession){
                               if(userRoomStatus == 0){
                                   sendVideoOrAuidoMsg(sendMsgParam.currentUserId,"","",groupMember[i].id,sendWebRtcParm.callType,sendWebRtcParm.type,sendWebRtcParm.reqType,sendWebRtcParm.resSign,groupId,groupName);
                               }
                           }
                       }
                       /*直接弹出页面，进入房间*/
                       console.log("群聊发起视频，直接进入房间……->>");
                       var webRtcUrl = encodeURI(arjWebRtc + '/room?userId='+currentsession+'&userName='+loginName+'&groupId='+groupId+'&groupName='+groupName+'&type=video')
                       setTimeout(function(){
                           windowOpen(webRtcUrl,'视频聊天','990','650');
                       }, 500);

                   }else{
                       var userStatus = obj.data.status;//cache.mine.status;//在线状态
                       if(userStatus === 'offline'){
                           userStatus =  onlineUser.indexOf(obj.data.id) != -1 ? "online" :"offline";
                       }

                           // layer.close(compileGrp)
			           if(userStatus === "online"){
                           sendWebRtcParm.callType = "callee";
                           sendMsgParam.friendId = obj.data.id;
                           sendWebRtcParm.type = "video";
                           sendWebRtcParm.reqType = "ptop";
                           sendWebRtcParm.resSign = "agree";
                           sendVideoOrAuidoMsg(sendMsgParam.currentUserId,"","",sendMsgParam.friendId,sendWebRtcParm.callType,sendWebRtcParm.type,sendWebRtcParm.reqType,sendWebRtcParm.resSign);
                          // var vgdialog = layui.layer;
            /*               layer.open({
                               type:1
                               ,title:"视频消息"
                               ,id:"vga_chart"
                               ,area:["300px","100px"]
                               ,skin:"layui-box layui-layer-border changeGrp"
                               ,content:'<ul style="text-align: center;line-height: 50px;" id="vgi_1" data-id="0"> 正在连接中，请稍等……</ul>'
                           });*/
                           $("body").append(
                               '<div class="modal chat_dialog"  tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" aria-labelledby="myModalLabel">'+
                               '<div class="modal-dialog">'+
                               '<div class="modal-content">'+
                               '<div class="modal-header">'+
                               '<button type="button" class="close" onclick="$(\'.chat_dialog\').hide()" data-dismiss="modal" aria-hidden="true">&times;</button>'+
                               '<h4 class="modal-title">消息</h4>'+
                               '</div>'+
                               '<div class="modal-body"><span id="chat_ready_id"></span>正在连接中，请稍等……</div>'+
                               '<div class="modal-footer">'+
                               '</div>'+
                               '</div>'+
                               '</div>'+
                               '</div>'
                           );
                       }else{

                           layer.msg("用户不在线，无法连接视频!");
                       }

                   }
			  });
               //监听自定义工具栏点击，以添加代码为例
			   layim.on('tool(codeAudio)', function(insert, send, obj){ //事件中的tool为固定字符，而code则为过滤器，对应的是工具别名（alias）
			      var message = new proto.Model();
		      	  var content = new proto.MessageBody();
		           message.setMsgtype(4);
		           message.setCmd(5);
		           message.setGroupid(obj.data.id);//系统用户组
                   message.setVatype('audio');
		           message.setToken(currentsession);
		           message.setSender(currentsession);
		           message.setReceiver(obj.data.id);//好友ID
		           content.setContent('audio');
		           //message.setAudioOrVideo(2);
		           content.setType(0)
		           message.setContent(content.serializeBinary())
		           socket.send(message.serializeBinary());
		           setTimeout(function(){
		        	   //windowOpen('https://192.168.1.170:8553/cat?userId='+currentsession+'&sendId='+currentsession+'&type=audio','视频聊天','600','500');
                       //windowOpen('https://192.168.1.177:8443?userId='+currentsession+'&sendId='+currentsession+'&type=audio','视频聊天','650','650');
                       windowOpen(arjWebRtc + '?userId='+currentsession+'&sendId='+obj.data.id+'&type=audio&callType=caller','音频聊天','650','650');
                      // windowOpen('https://192.168.1.7:8443?userId='+currentsession+'~caller&sendId='+obj.data.id+'~callee&type=audio','音频聊天','650','650');
		           }, 500);

			  });
			   //监听发送消息
			   layim.on('sendMessage', function(data){
			     var To = data.to;
		    	 var my = data.mine;
		    	 var message = my.content;
			     var receiver =To.id+"";
			     if($.trim(currentsession)=='' ){
			       return;
			     }
			     if($.trim(message)==''){
			       layer.msg("请输入要发送的消息!");
			       return;
			     }
			     if (!window.WebSocket) {
			    	//判断是发送好友消息还是群消息
			    	 if(To.type=="friend"){
			    		 Imwebserver.sendMsg(receiver,message);
			    	 }else{
			    		 Imwebserver.sendGroupMsg(receiver,message);
			    	 }
			    	 return;
			     }else{
			    	 if (socket.readyState == WebSocket.OPEN) {
				    	 //判断是发送好友消息还是群消息
				    	 if(To.type=="friend"){
				    		 sendMsg(message,receiver,null)
				    	 }else{
				    		 sendMsg(message,null,receiver)
				    	 }
				     }
			     }
			  });
			  //每次窗口打开或切换，即更新对方的状态
			   layim.on('chatChange', function(res){
			    var type = res.data.type;
			    // if(type === 'friend'){
			    //   layim.setChatStatus('<span style="color:#FF5722;">在线</span>'); //模拟标注好友在线状态
			    // } else if(type === 'group'){
			    //   //模拟系统消息
			    //   layim.getMessage({
			    //     system: true //系统消息
			    //     ,id: 111111111
			    //     ,type: "group"
			    //     ,content: '贤心加入群聊'
			    //   });
			    // }
                   var group_Id =  res.data.id
                    console.log(res)
                    //判断如果是群主将修改按钮显示出来
                    if(res.data.groupowner == meid ){
                        $(".layim-chat-group .setUpGroup").css({
                            "display":"block"
                        })
                     }else{
                        $(".layim-chat-group .setUpGroup").css({
                            "display":"none"
                        })
                    }
                    $(".setUpGroup").click(function(){
                        // debugger
                        compileGrp_fn()
                        $(".changeGrp").attr("data-id",group_Id)
                    })
                    function compileGrp_fn(){
                        var compileGrp = layui.layer;
                        compileGrp.open({
                            type:2
                            ,title:"编辑群聊"
                            ,id:"bjGroup_id"
                            ,maxmin:true
                            ,area:["1000px","680px"]
                            ,skin:"layui-box layui-layer-border changeGrp"
                            ,content:"${ctxStatic}/arjim/layui/css/modules/arjim/html/find.jsp"
                        });
                        // layer.close(compileGrp)
                    }
                    $(".exit-group").click(function(){
                        exit_group_fn()
                    })
                    function exit_group_fn(){
                        var exitGrp = layui.layer;
                        exitGrp.open({
                            type:1
                            ,title:"提示"
                            ,maxmin:true
                            ,area:["300px","150px"]
                            ,id:"exitGroup_id"
                            ,skin:"exitGrp"
                            ,content:"是否退出群聊"
                            ,btn: ['确定', '取消']
                            ,yes: function(index, layero){
                                var exitGrpTson = {
                                    userId:currentsession,
                                    groupId:res.data.id
                                }
                                var $url = "/arjccm/app"
                                $.ajax({
                                    type:"post",
                                    url:$url+'/rest/ImChat/leaveGroup',
                                    data:exitGrpTson,
                                    async : false,
                                    success:function(d){
                                        layim.removeList({
                                            id: res.data.id
                                            ,type: 'group'
                                        })
                                        // $(".ayui-layim-chat").hide()
                                        console.log(d.result)
                                        layer.close(index);
                                        if(res.data.groupowner == currentsession){
                                            layer.msg('您已经退出'+ res.data.groupname+",群主已经转让给"+ d.result,{
                                                time:4000
                                            })
                                        }else{
                                            layer.msg('您已经退出'+ res.data.groupname,{
                                                time:4000
                                            })
                                        }
                                    }
                                })
                            }
                        });
                    }
			  });
			   layim.on('online', function(status){
				  console.log(status); //获得online或者hide
				  //websocket发送在线或离线消息给好友
			  });
			   //编辑个性签名
			   layim.on('sign', function(data){
				 $.get(arjimRest+'/sign?userId='+currentsession+'&sign='+data,function(){

				 })
			  });
		       var initEventHandle = function () {
		          //收到消息后
		          socket.onmessage = function(event) {
		          	  if (event.data instanceof ArrayBuffer){
		          	        var msg =  proto.Model.deserializeBinary(event.data);      //如果后端发送的是二进制帧（protobuf）会收到前面定义的类型
			          	 	var msgCon =  proto.MessageBody.deserializeBinary(msg.getContent());
		  	    			var cache = layui.layim.cache();
		  	    			var local = layui.data('layim')[cache.mine.id];
		  	    			var username = "",avatar="",friend=false, vaGroupName = "";


                          //单聊：主动方监听到被动方消息时弹出页面
                          if(msg.getCalltype() =="caller" && msg.getRessign()==='agree' && msg.getReqtype() == 'ptop'){
                              var receiveUser = msg.getSender();
                              //注意此处如果被动方接收到消息后，过20S以上点击接收视频，弹层可能会弹不出来，浏览器会拦截，需要浏览器上设置一下拦截允许；
                              setTimeout(function(){
                                  windowOpen(arjWebRtc +'?userId='+currentsession+'&sendId='+receiveUser+'&type=video&callType=caller','视频聊天','861','668');
                              }, 500);
                              closeDialog();
                              return false;
                          }else if(msg.getRessign()==='refuse') {
                              var receiveMsg;
                              if( msg.getCalltype() =="caller"){
                                  if (msg.getReqtype() === "ptop") {//单聊
                                      receiveMsg = "您的呼叫请求已经被拒绝!!";
                                  } else if (msg.getReqtype() === "group") {//群聊
                                      receiveMsg = msg.getSendername() + " 已经退出房间";
                                  }
                              }else {
                                  if (msg.getReqtype() === "ptop") {//单聊
                                      receiveMsg = msg.getSendername() + "用户已经取消视频!!";
                                  } else if (msg.getReqtype() === "group") {//群聊
                                      receiveMsg = msg.getSendername() + " 已经退出房间";
                                  }
                              }
                              $("body").append(
                                  '<div class="modal chat_dialog"  tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" aria-labelledby="myModalLabel">' +
                                  '<div class="modal-dialog">' +
                                  '<div class="modal-content">' +
                                  '<div class="modal-header">' +
                                  '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' +
                                  '<h4 class="modal-title">消息</h4>' +
                                  '</div>' +
                                  '<div class="modal-body"><span id="chat_ready_id"></span>' + receiveMsg + '</div>' +
                                  '<div class="modal-footer">' +
                                  '<button type="button" class="btn btn-default" onclick="closeDialog()" >关闭</button>' +
                                  '</div>' +
                                  '</div>' +
                                  '</div>' +
                                  '</div>'
                              );
                              return false;
                          }
                            //好友ID
		  	    			sendMsgParam.friendId = msg.getSender();
		  	    			//接收主动方发起的callee 消息，被动方同时发出caller消息，提示主动方接收；
                           var callTypeReceive ;
                           if(msg.getCalltype() == "callee"){
                               sendWebRtcParm.callType = "caller";
                            }else{
                               sendWebRtcParm.callType = "callee";
                           }

                           // sendWebRtcParm.callType = msg.getCalltype();//"caller";
                            sendWebRtcParm.type = "video";
                            sendWebRtcParm.reqType = msg.getReqtype();
                            sendWebRtcParm.vaGroupId = msg.getVagroupid();
                            sendWebRtcParm.vaGroupName = msg.getVagroupname();
                            //发起人ID
                            sendMsgParam.friendId = msg.getSender();
                            layui.each(cache.friend, function(index1, item1){
					            layui.each(item1.list, function(index, item){
				            	//if(msg.getGroupid()=='video'){
				            	if(msg.getVatype()=='video'){
				            		 if(item.id == msg.getSender()){
							                username = item.username;
							                avatar = item.avatar;
							            	$("body").append(
							                	    '<div class="modal chat_dialog"  tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" aria-labelledby="myModalLabel">'+
							                	        '<div class="modal-dialog">'+
							                	            '<div class="modal-content">'+
							                	                '<div class="modal-header">'+
							                	                    '<button type="button" class="close" onclick="$(\'.chat_dialog\').hide()" data-dismiss="modal" aria-hidden="true">&times;</button>'+
							                	                    '<h4 class="modal-title">消息</h4>'+
							                	                '</div>'+
							                	                '<div class="modal-body"><span id="chat_ready_id"></span>'+username+',与你发起视频通话申请,你是否同意</div>'+
							                	                '<div class="modal-footer">'+
							                	                    /*'<button type="button" class="btn btn-default" onclick="closeDialog(\''+msg.getSender()+'\')">关闭</button>'+*/
							                	                    '<button type="button" class="btn btn-default" onclick="closeDialog(\''+msg.getSender()+'\',\''+currentsession+'\',\''+loginUserName+'\',\''+photo+'\',\'caller\',\'video\',\''+msg.getReqtype()+'\')">关闭</button>'+
							                	                    '<button type="button" class="btn btn-primary" onclick="chat_ready(' +
                                                                    '\''+ sendMsgParam.friendId+'\',' + //msg.getSender()
                                                                    '\''+ sendMsgParam.currentUserId+'\',' +      //currentsession
                                                                    '\''+ sendWebRtcParm.callType+'\',' +     // '\'caller\',\'video\',' +
                                                                    '\''+ sendWebRtcParm.type+'\',' +      // '\'caller\',\'video\',' +
                                                                    '\''+ sendWebRtcParm.reqType+'\',' +  //msg.getReqtype()
                                                                    '\''+ sendWebRtcParm.vaGroupId+'\',' + //msg.getVagroupid();
                                                                    '\''+ sendWebRtcParm.vaGroupName+'\')">' + // msg.getVagroupname();
                                                                    '确定</button>'+
							                	                '</div>'+
							                	            '</div>'+
							                	        '</div>'+
							                	    '</div>'
							                	);
							              return false;
				            		 }
				            //	}else  if(msg.getGroupid()=='audio'){
				            	}else  if(msg.getVatype()=='audio'){
				            		 if(item.id == msg.getSender()){
							                username = item.username;
							                avatar = item.avatar;
							            	$("body").append(
							                	    '<div class="modal chat_dialog"  tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" aria-labelledby="myModalLabel">'+
							                	        '<div class="modal-dialog">'+
							                	            '<div class="modal-content">'+
							                	                '<div class="modal-header">'+
							                	                    '<button type="button" class="close"  onclick="$(\'.chat_dialog\').hide()" data-dismiss="modal" aria-hidden="true">&times;</button>'+
							                	                    '<h4 class="modal-title">消息</h4>'+
							                	                '</div>'+
							                	                '<div class="modal-body"><span id="chat_ready_id"></span>'+username+',与你发起语音通话申请,你是否同意</div>'+
							                	                '<div class="modal-footer">'+
							                	                    '<button type="button" class="btn btn-default" onclick="closeDialog()">关闭</button>'+
							                	                    '<button type="button" class="btn btn-primary" onclick="chat_ready(\''+msg.getSender()+'\',\''+currentsession+'\',\'audio\')">确定</button>'+
							                	                '</div>'+
							                	            '</div>'+
							                	        '</div>'+
							                	    '</div>'
							                	);
							              return false;
				            		 }
				            	}else{
				            		if(item.id == msg.getSender()){
						                username = item.username;
						                avatar = item.avatar;
						                return friend = true;
						              }
				            	}

					            });
					            if(friend) return true;
				            });

		          	       //心跳消息
		          	       if(msg.getCmd()==2){
		          	    	   //发送心跳回应
		          	    	   var message1 = new proto.Model();
		                       message1.setCmd(2);
		                       message1.setMsgtype(4);
		                       socket.send(message1.serializeBinary());
		          	       }else if(msg.getCmd()==3){
		          	    	   //上线
		          	    	   if(msg.getSender()!=currentsession){
		          	    	     // layer.msg(username+"上线了！");
		  	          	    	  layim.setFriendStatus(msg.getSender(), 'online');
		  	          	    	  console.log(msg.getSender())
                                  onlineUser.push(msg.getSender())

                                   // var thisLi = $(".layim-friend"+ msg.getSender())
                                   // debugger
                                   // console.log(thisLi.length)
                                   //
                                   // for(var i=0;i<thisLi.length;i++){
                                   //     var groupNum =thisLi.eq(i).attr("data-index")
                                   //     console.log(thisLi.eq(i).attr("data-index"))
                                   //     var domList = $(".layim-list-friend > li").eq(groupNum).find("li").eq(0)
                                   //     thisLi.eq(i).insertBefore(domList)
                                   // }


		          	    	   }
		          	       }else if(msg.getCmd()==4){
		          	    	   //下线
		          	    	   if(msg.getSender()!=currentsession){
		          	    		   //layer.msg(username+"已下线！");
			          	    	   layim.setFriendStatus(msg.getSender(), 'offline');
			          	    	  /* console.log("删除当前用户之后的上线记录："+msg.getSender())
			          	    	   console.log("下线用户是否存在于上线记录列表中："+ onlineUser.indexOf(msg.getSender()))
			          	    	   console.log("上线记录列表中："+ onlineUser)*/
                                   if(onlineUser.indexOf(msg.getSender()) != -1){
                                       onlineUser.splice(onlineUser.indexOf(msg.getSender()),1);
                                   }
		          	    	   }
		          	       }else if(msg.getCmd()=='99'){
		          	    	   //视频了
		          	    	 if(msg.getSender()!=currentsession){
		          	    	      layer.msg(username+"视频了！");
		  	          	    	  layim.setFriendStatus(msg.getSender(), 'online');
		          	    	   }
		          	       } else{
		          	    	   //显示非自身消息
		          	    	   if(msg.getSender()!=currentsession){
		          	    		   //不显示用户组消息
		          	    		   var time = (new Date(msg.getTimestamp())).getTime();
		          	    		   if(msg.getGroupid()==null||msg.getGroupid().length<1){
	          	    				    lm.getMessage({
								 	        username: username
								 	        ,avatar: avatar+"?"+new Date().getTime()
								 	        ,id: msg.getSender()
								 	        ,type: "friend"
								 	        ,content: msgCon.getContent()
								 	        ,timestamp: time
							 	     	});
		          	    		   }else{
		          	    			 //判断是否拥有改群组，有弹出消息，否则不弹出
		          	    			 var groupCache=layim.cache().group;
		          	    			 var len=groupCache.length;
		          	    			 if(len>0){
		          	    				 for(var j =0;j<len;j++){
		          	    					 //如果用户在当前消息群组，则弹出消息提醒。
		          	    					 if(msg.getGroupid()==groupCache[j].id){
		          	    						lm.getMessage({
										 	        username: username
										 	        ,avatar: avatar+"?"+new Date().getTime()
										 	        ,id: msg.getGroupid()
										 	        ,type: "group"
										 	        ,content: msgCon.getContent()
										 	        ,timestamp: time
									 	     	});
		          	    					 }
		          	    				 }
		          	    			 }

		          	    		   }
		          	    	   }
		          	       }
		          	  }else {
		                    var data = event.data;                //后端返回的是文本帧时触发
		              }
		          };
		        //连接后
		        socket.onopen = function(event) {
		        	   var message = new proto.Model();
		        	   var browser=BrowserUtil.info();
			   	       message.setVersion("1.0");
			   	       message.setDeviceid("")
			   	       message.setCmd(1);
			   	       message.setSender(currentsession);
			   	       message.setMsgtype(1);
			   	       message.setFlag(1);
			   	       message.setPlatform(browser.name);
			   	       message.setPlatformversion(browser.version);
			   	       message.setToken(currentsession);
			   	       var bytes = message.serializeBinary();
		               socket.send(bytes);

		          };
		        //连接关闭
		        socket.onclose = function(event) {
                    reconnect(websocketurl,initEventHandle);
		        	/*layim.setFriendStatus(currentsession, 'offline');
		        	layer.confirm('您已下线，重新上线?', function(index){
		        		if(index){
		        			window.location.href=window.location.href;
		        		}
// 		        		reconnect(websocketurl,initEventHandle);
		        		layer.close(index);
		        	});*/
			    };
			    socket.onerror = function () {
			    	reconnect(websocketurl,initEventHandle);
				};
		    }
			   createWebSocket(websocketurl,initEventHandle);
		});
	});
}

//dwr推送消息方法
function showMessage(data) {
	showmsg(data);
}
    /**
     * 被动方接受之后，
     *    如果是单聊：弹出页面，同时给发起方发送消息，告知接受状态；
     *    如果是群聊：弹出页面，进入房间即可；不需要再次给发起方发消息，因为已经进入了房间；
     * 被动方拒绝之后：
     *   如果是单聊：主动方接收到回调，弹出拒绝通知；
     *   如果是群聊： 主动方接收到回调，弹出拒绝通知；
     * @param sendId  发起人
     * @param id  接收人，也就是当前用户
     * @param callType  表明身份标志：接收人/呼叫人  callee/caller
     * @param type  请求类型 video audio
     * @param reqType 请求方式：点对点/群聊 ptop/group
     * @param vaGroupId 发起视频组ID(房间号)：缺少房间号，增加房间号
     */
function chat_ready(sendId,id,callType,type,reqType,vaGroupId,vaGroupName){
	 $(".chat_dialog").hide();
     sendWebRtcParm.resSign = "agree";
     if(reqType === "ptop"){//单聊,
           // 必须保存弹出页面加载完之后在发消息，重要！重要！重要！
             setTimeout(function(){
                 windowOpen(arjWebRtc +'?userId='+sendId+'&sendId='+id+'&type='+type+'&callType=callee','视频聊天','861','668');
             }, 500);
            setTimeout(function(){
                 // 弹出页面之后，发送回调消息，告诉发起人，被呼叫人已经同意视频；
                 sendVideoOrAuidoMsg(id,"","", sendId,callType,type,reqType,sendWebRtcParm.resSign)
             }, 5000)
     }else if(reqType === "group"){//群聊
             setTimeout(function(){
                 var webRtcUrl = encodeURI(arjWebRtc +'/room?userId='+id+'&userName='+loginName+'&groupId='+vaGroupId+'&groupName='+vaGroupName+'&type='+type)
                 windowOpen(webRtcUrl,'视频聊天','990','650');
             }, 500)
     }
}
/**
 * 被动方拒绝之后：
 *   如果是单聊：主动方接收到回调，弹出拒绝通知；
 *   如果是群聊： 主动方接收到回调，弹出拒绝通知；
 *
 */
function closeDialog(sendId,currentUserId,currentUserName,currentUserPhoto,callType,type,reqType){
    sendWebRtcParm.resSign = "refuse";
	 $(".chat_dialog").hide();
	 if(sendId){
         sendVideoOrAuidoMsg(currentUserId, currentUserName,currentUserPhoto,sendId,callType,type,reqType,sendWebRtcParm.resSign)
     }
}
/**
 *
 * @param currentUserId 当前用户ID
 * @param currentUserName 当前用户名称
 * @param currentUserPhoto 当前用户头像
 * @param firedId  好友ID
 * @param type 请求类型 video audio
 * @param resSign 请求响应状态: 接受/拒绝   agree/refuse
 * @param reqType 请求方式：点对点/群聊 ptop/group
 * @param vaGroupId 发起视频组ID(房间号)：缺少房间号，增加房间号
 * @param vaGroupName 发起视频组名称(房间名称)：缺少房间名称，增加房间名称
 */
function sendVideoOrAuidoMsg(currentUserId,currentUserName ,currentUserPhoto,firedId,callType,type,reqType,resSign,vaGroupId,vaGroupName) {
    var message = new proto.Model();
    var content = new proto.MessageBody();
    message.setMsgtype(4);
    message.setCmd(5);
    if(reqType == "group"){
        message.setGroupid(vaGroupId);//系统用户组
    }
    message.setVatype(type) // 视频，音频标识 video audio
    message.setToken(currentUserId);
    message.setSender(currentUserId);
    message.setReceiver(firedId);//好友ID
    content.setContent(type);
    //message.setSign(sign),//签名
    message.setCalltype(callType); //身份证明 callee/caller  接收人/呼叫人
    message.setRessign(resSign); //接受/拒绝 状态
    message.setReqtype(reqType);//点对点/群聊 ptop/group
    message.setVagroupid(vaGroupId);
    if(vaGroupName != "" ){
        message.setVagroupname(vaGroupName);
    }
    message.setSendername(currentUserName);
    message.setSenderphoto(currentUserPhoto)
    content.setType(0);
    message.setContent(content.serializeBinary());
    socket.send(message.serializeBinary());
}

</script>
