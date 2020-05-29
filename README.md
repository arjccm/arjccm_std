# arjcm_std
平台配置

layim.jsp 配置  文件位置：arjccm_std\WebContent\WEB-INF\views\layim\page\layim.jsp

//layim接口地址   153为外网映射地址  10为内网地址 47为阿里云测试地址
 var arjimRest="http://153.0.171.153:8090/arjim-server/";
// var arjimRest="http://"+window.location.host+"/arjim-server/";
 var arjWebRtc="https://47.94.247.75:9090";
 if(window.location.hostname.startsWith("10") 
 	 || window.location.hostname.startsWith("local")
 	 || window.location.hostname.startsWith("127")){
 	 arjimRest="http://10.224.13.146:8080/arjim-server/"
     arjWebRtc="https://10.224.13.146:9090";
 }else if(window.location.hostname.startsWith("153")){
 	 arjimRest="http://153.0.171.153:8090/arjim-server/"
     arjWebRtc="https://153.0.171.158:9091";
 }
 
websocketconfig.js    配置 文件位置 arjccm_std\WebContent\static\layim\js\websocketconfig.js 
var websocketurl="ws://153.0.171.158:2048/ws";   //ws://{ip}:{端口}/{java后端websocket配置的上下文}

 if(window.location.hostname.startsWith("10") 
	 || window.location.hostname.startsWith("local")
	 || window.location.hostname.startsWith("127")
	 ){
     websocketurl="ws://10.224.13.146:2048/ws";   
 }else if(window.location.hostname.startsWith("153")){
 	websocketurl="ws://153.0.171.158:2048/ws"; 
 }
 
 find.jsp  配置 文件位置 arjccm_std\WebContent\static\layim\layui\css\modules\layim\html\find.jsp
 var arjimRest="http://153.0.171.153:8090/arjim-server/";
 //var arjimRest="http://"+window.location.host+"/arjim-server/";
 if(window.location.hostname.startsWith("10")
 || window.location.hostname.startsWith("local")
 || window.location.hostname.startsWith("127")){
	 arjimRest="http://10.224.13.146:8080/arjim-server/"
 }else if(window.location.hostname.startsWith("153")){
	 arjimRest="http://153.0.171.153:8090/arjim-server/"
 }
 
arjwebrtc 信令服务配置
  配置文件
      主要配置KMS 服务器地址

点对点配置
index.js
//var ws =  new WebSocket('wss://' + location.host + '/call');
var ws ;//=  new WebSocket('wss://' + location.host + '/call');
 if(location.host.startsWith("local")
 	|| location.host.startsWith("127")
  	|| location.host.startsWith("10")){
 	ws = new WebSocket('wss://' + location.host + '/call')
 }else if(location.host.startsWith("153")){
 	ws = new WebSocket('wss://153.0.171.158:9091/call')
 }
var iceservers={
	"iceServers":[
		{
			//urls:"stun:47.94.247.75:3478"
			urls:"stun:153.0.171.158:3478"
		},
		{
			//urls:["turn:47.94.247.75:3478"],
			urls:["turn:153.0.171.158:3478"],
			username:"mytest",
			credential: "123456"
		}
	]
}
群聊配置

//var ws = new WebSocket('wss://' + location.host + '/groupcall');
 var ws ;//=  new WebSocket('wss://' + location.host + '/call');
 if(location.host.startsWith("local")
 	|| location.host.startsWith("127")
 	|| location.host.startsWith("10")){
 	ws = new WebSocket('wss://' + location.host + '/groupcall')
 }else if(location.host.startsWith("153")){
 	ws = new WebSocket('wss://153.0.171.158:9091/groupcall')
 }
var participants = {};
var iceservers={c
	"iceServers":[
		{
			urls:"stun:153.0.171.158:3478"
			//urls:"stun:47.94.247.75:3478"
		},
		{
			urls:["turn:153.0.171.158:3478"],
			//urls:["turn:47.94.247.75:3478"],
			username:"mytest",
			credential: "123456"
		}
	]
}

KMS 配置turn/stun 服务地址
配置文件位置： /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini

turnURL=mytest:123456@153.0.171.158:3478?transport=udp

Coturn 配置
配置文件位置：/my/turnserver.conf

listening-port=3478
external-ip=153.0.171.158
realm=mytest

min-port=49152
max-port=65535
#用户名:密码
user=mytest:123456
cli-password=123456

注意：配置完coturn 之后，需要在服务端打开 出入的TCP/UDP 3478 端口，如果不打开，视频是通讯不了的
