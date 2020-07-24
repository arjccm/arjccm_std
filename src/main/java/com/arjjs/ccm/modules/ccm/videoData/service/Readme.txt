大华对接Dll
1、部署时将所有Dll文件拷贝到tomcat下的bin文件夹中
2、开发时像添加jdk一样：以eclipse为例
   Project -> properties -> Java Build Path -> Libraries -> Add Library
   -> User Library 在里面建一个lib -> 添加到Libraries后展开   点击Native library location:(None)
   -> 点击右侧Edit -> Location path 选择dll的文件夹
   
 测试类
 com.arjjs.ccm.modules.ccm.videoData.service.TestDPSDKMain  