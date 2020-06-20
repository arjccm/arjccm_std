var websocketurl="ws://"+window.location.hostname+":2048/ws";   //ws://{ip}:{端口}/{java后端websocket配置的上下文}

// var websocketurl="ws://153.0.171.158:2048/ws";   //ws://{ip}:{端口}/{java后端websocket配置的上下文}
/*

if(window.location.hostname.startsWith("10")
    || window.location.hostname.startsWith("local")
    || window.location.hostname.startsWith("127")
){
    websocketurl="ws://10.224.13.146:2048/ws";
}else if(window.location.hostname.startsWith("153")){
    websocketurl="ws://153.0.171.158:2048/ws";
}
*/
var reconnectflag = false;//避免重复连接
var socket; 
//var userRegisterwsurl = "wss://192.168.1.177:9090/call";
//var userRegisterSocket;
function createWebSocket(url,callbak) {
   try { 
      if (!window.WebSocket) {
  	      window.WebSocket = window.MozWebSocket; 
  	  }  
  	  if (window.WebSocket) {
  		socket = new WebSocket(url);
        socket.binaryType = "arraybuffer"; 
        callbak();
  	  } else {
         // layer.msg("你的浏览器不支持websocket！");
  	     //当浏览器不支持websocket时 降级为http模式	  
  	    var isClose =false;
  		window.onbeforeunload =function() {
  			if(!isClose){
  				return "确定要离开当前聊天吗?";
  			}else{
  				return "";
  			}
  		}
  		window.onunload =function() {
  			if(!isClose){
  				Imwebserver.closeconnect(); 
  			}
  		} 
  	    dwr.engine.setActiveReverseAjax(true);
  	    dwr.engine.setNotifyServerOnPageUnload(true);
  	    dwr.engine.setErrorHandler(function(){  
  	    });
  	    dwr.engine._errorHandler = function(message, ex) {
  	       //alert("服务器出现错误");
  	       //dwr.engine._debug("Error: " + ex.name + ", " + ex.message, true);
  	    };
  	    Imwebserver.serverconnect(callbak)
  		  
      }  
    } catch (e) { 
       reconnect(url,callbak);
    }     
}
/*function userRegisterws(currentsession){
	userRegisterSocket= new WebSocket(userRegisterwsurl);
	userRegisterSocket.onopen = function () {
		console.log(">>>>>>>>>>>>>>>>>>  user Register kurento onopen …… ");
		var response = {
			id : 'register',
            //userId: currentsession,
			name : currentsession
		};
		var jsonMessage = JSON.stringify(response);
		console.log('Sending message: ' + jsonMessage);
		userRegisterSocket.send(jsonMessage);
	}
}*/

function reconnect(url,callbak) {
    if(reconnectflag) return;
    reconnectflag = true;
    //没连接上会一直重连，设置延迟避免请求过多
    setTimeout(function () {
        createWebSocket(url,callbak);
        reconnectflag = false;
    }, 2000);
}

 
 

