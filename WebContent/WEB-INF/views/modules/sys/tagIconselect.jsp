<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>图标选择</title>
	<meta name="decorator" content="blank"/>
    <style type="text/css">
    	.page-header {clear:both;margin:0 20px;padding-top:20px;}
		.the-icons {padding:25px 10px 15px;list-style:none;}
		.the-icons li {float:left;width:22%;line-height:25px;margin:2px 5px;cursor:pointer;}
		.the-icons i {margin:1px 5px;font-size:16px;}
        .the-icons li.active {background-color:#0088CC;color:#ffffff;}
        .the-icons li:hover i{font-size:18px;}
    </style>
    <script type="text/javascript">
	    $(document).ready(function(){
	    	$("#icons li").click(function(){
	    		$("#icons li").removeClass("active");
	    		$("#icons li i").removeClass("icon-white");
	    		$(this).addClass("active");
	    		$(this).children("i").addClass("icon-white");
	    		$("#icon").val($(this).text());
	    	});
	    	$("#icons li").each(function(){
	    		if ($(this).text()=="${value}"){
	    			$(this).click();
	    		}
	    	});
	    	$("#icons li").dblclick(function(){
	    		top.$.jBox.getBox().find("button[value='ok']").trigger("click");
	    	});
	    });
    </script>
</head>
<body>
<input type="hidden" id="icon" value="${value}" />
<div id="icons">

		<h2 class="page-header">新增图标库</h2>
		<ul class="the-icons">
			<li><i class="iconfont icon-dashujuzhanshi"></i> icon-dashujuzhanshi</li>
		</ul>

		<h2 class="page-header">操作图标</h2>
		<ul class="the-icons">
			<li><i class="iconfont icon-caozuotubiao-chuliyichuli"></i> icon-caozuotubiao-chuliyichuli</li>
			<li><i class="iconfont icon-caozuotubiao-fujianliebiao"></i> icon-caozuotubiao-fujianliebiao</li>
			<li><i class="iconfont icon-caozuotubiao-fasongjingqing"></i> icon-caozuotubiao-fasongjingqing</li>
			<li><i class="iconfont icon-caozuotubiao-hujijiating"></i> icon-caozuotubiao-hujijiating</li>
			<li><i class="iconfont icon-caozuotubiao-fanganmingxi"></i> icon-caozuotubiao-fanganmingxi</li>
			<li><i class="iconfont icon-caozuotubiao-qianshou"></i> icon-caozuotubiao-qianshou</li>
			<li><i class="iconfont icon-caozuotubiao-paiqijilu"></i> icon-caozuotubiao-paiqijilu</li>
			<li><i class="iconfont icon-caozuotubiao-tianjiaxingbiao"></i> icon-caozuotubiao-tianjiaxingbiao</li>
			<li><i class="iconfont icon-caozuotubiao-shenhe"></i> icon-caozuotubiao-shenhe</li>
			<li><i class="iconfont icon-caozuotubiao-guidang"></i> icon-caozuotubiao-guidang</li>
			<li><i class="iconfont icon-caozuotubiao-pingfen"></i> icon-caozuotubiao-pingfen</li>
			<li><i class="iconfont icon-caozuotubiao-bukong"></i> icon-caozuotubiao-bukong</li>
			<li><i class="iconfont icon-caozuotubiao-xiugai"></i> icon-caozuotubiao-xiugai</li>
			<li><i class="iconfont icon-caozuotubiao-lishizukejiluliebiao"></i> icon-caozuotubiao-lishizukejiluliebiao</li>
			<li><i class="iconfont icon-caozuotubiao-tianjiachuli"></i> icon-caozuotubiao-tianjiachuli</li>
			<li><i class="iconfont icon-caozuotubiao-jiluxinxi"></i> icon-caozuotubiao-jiluxinxi</li>
			<li><i class="iconfont icon-caozuotubiao-ganxiren"></i> icon-caozuotubiao-ganxiren</li>
			<li><i class="iconfont icon-caozuotubiao-shijianguanlian"></i> icon-caozuotubiao-shijianguanlian</li>
			<li><i class="iconfont icon-caozuotubiao-shejiaoguanxi"></i> icon-caozuotubiao-shejiaoguanxi</li>
			<li><i class="iconfont icon-caozuotubiao-shanchu"></i> icon-caozuotubiao-shanchu</li>
			<li><i class="iconfont icon-caozuotubiao-zoufangjilu"></i> icon-caozuotubiao-zoufangjilu</li>
			<li><i class="iconfont icon-caozuotubiao-pandian"></i> icon-caozuotubiao-pandian</li>
			<li><i class="iconfont icon-caozuotubiao-weizhixinxi"></i> icon-caozuotubiao-weizhixinxi</li>
			<li><i class="iconfont icon-caozuotubiao-chekong"></i> icon-caozuotubiao-chekong</li>
			<li><i class="iconfont icon-caozuotubiao-xiangqing"></i> icon-caozuotubiao-xiangqing</li>
			<li><i class="iconfont icon-fuzhi"></i> icon-fuzhi</li>
			<li><i class="iconfont icon-niantie"></i> icon-niantie</li>
			<li><i class="iconfont icon-congyerenyuanxinxi"></i> icon-congyerenyuanxinxi</li>
			<li><i class="iconfont icon-fangjian"></i> icon-fangjian</li>
			<li><i class="iconfont icon-shijianxiangqingjichuzhi"></i> icon-shijianxiangqingjichuzhi</li>
			<li><i class="iconfont icon-zhufangguanli"></i> icon-zhufangguanli</li>
			<li><i class="iconfont icon-fenpei"></i> icon-fenpei</li>
			<li><i class="iconfont icon-zhuhuguanli"></i> icon-zhuhuguanli</li>
			<li><i class="iconfont icon-congyerenyuantianjia"></i> icon-congyerenyuantianjia</li>
			<li><i class="iconfont icon-renwukuaisupaiqian"></i> icon-renwukuaisupaiqian</li>
			<li><i class="iconfont icon-shipinliebiao"></i> icon-shipinliebiao</li>
			<li><i class="iconfont icon-duibi"></i> icon-duibi</li>

		</ul>
		<h2 class="page-header">Header导航图标</h2>
		<ul class="the-icons">
			<li><i class="iconfont icon-daohangtubiao-APPbanbenguanli"></i> icon-daohangtubiao-APPbanbenguanli</li>
			<li><i class="iconfont icon-daohangtubiao-bumenguanli"></i> icon-daohangtubiao-bumenguanli</li>
            <li><i class="iconfont icon-daohangtubiao-dizhikuguanli"></i> icon-daohangtubiao-dizhikuguanli</li>
            <li><i class="iconfont icon-daohangtubiao-GISshuju"></i> icon-daohangtubiao-GISshuju</li>
            <li><i class="iconfont icon-daohangtubiao-changsuoguanli"></i> icon-daohangtubiao-changsuoguanli</li>
            <li><i class="iconfont icon-daohangtubiao-ditubiaozhu"></i> icon-daohangtubiao-ditubiaozhu</li>
            <li><i class="iconfont icon-daohangtubiao-gerenbangong"></i> icon-daohangtubiao-gerenbangong</li>
            <li><i class="iconfont icon-daohangtubiao-huluhuxian"></i> icon-daohangtubiao-huluhuxian</li>
            <li><i class="iconfont icon-daohangtubiao-fangwuguanli"></i> icon-daohangtubiao-fangwuguanli</li>
            <li><i class="iconfont icon-daohangtubiao-renkouguanli"></i> icon-daohangtubiao-renkouguanli</li>
            <li><i class="iconfont icon-daohangtubiao-gongzuozhushou"></i> icon-daohangtubiao-gongzuozhushou</li>
            <li><i class="iconfont icon-daohangtubiao-jixiaokaohe"></i> icon-daohangtubiao-jixiaokaohe</li>
            <li><i class="iconfont icon-daohangtubiao-maodunjiufenpaicha"></i> icon-daohangtubiao-maodunjiufenpaicha</li>
            <li><i class="iconfont icon-daohangtubiao-wenjianguanli"></i> icon-daohangtubiao-wenjianguanli</li>
            <li><i class="iconfont icon-daohangtubiao-shujucaijifenxi"></i> icon-daohangtubiao-shujucaijifenxi</li>
            <li><i class="iconfont icon-daohangtubiao-jingqingguanli"></i> icon-daohangtubiao-jingqingguanli</li>
            <li><i class="iconfont icon-daohangtubiao-yingjizhihuichuzhi"></i> icon-daohangtubiao-yingjizhihuichuzhi</li>
            <li><i class="iconfont icon-daohangtubiao-yingjiwuzibaozhang"></i> icon-daohangtubiao-yingjiwuzibaozhang</li>
            <li><i class="iconfont icon-daohangtubiao-APPzhongduan"></i> icon-daohangtubiao-APPzhongduan</li>
            <li><i class="iconfont icon-daohangtubiao-xuanchuanxinxi"></i> icon-daohangtubiao-xuanchuanxinxi</li>
            <li><i class="iconfont icon-daohangtubiao-richangzhishou"></i> icon-daohangtubiao-richangzhishou</li>
            <li><i class="iconfont icon-daohangtubiao-zhuanxiangkaoheguanli"></i> icon-daohangtubiao-zhuanxiangkaoheguanli</li>
            <li><i class="iconfont icon-daohangtubiao-rizhiguanli"></i> icon-daohangtubiao-rizhiguanli</li>
            <li><i class="iconfont icon-daohangtubiao-zhibanguanli"></i> icon-daohangtubiao-zhibanguanli</li>
            <li><i class="iconfont icon-daohangtubiao-xiaoyuananquan"></i> icon-daohangtubiao-xiaoyuananquan</li>
            <li><i class="iconfont icon-daohangtubiao-youxiangguanli"></i> icon-daohangtubiao-youxiangguanli</li>
            <li><i class="iconfont icon-daohangtubiao-zuzhijigou"></i> icon-daohangtubiao-zuzhijigou</li>
            <li><i class="iconfont icon-daohangtubiao-tongzhigonggao"></i> icon-daohangtubiao-tongzhigonggao</li>
            <li><i class="iconfont icon-daohangtubiao-shijianguanli"></i> icon-daohangtubiao-shijianguanli</li>
            <li><i class="iconfont icon-daohangtubiao-shijiantongjifenxi"></i> icon-daohangtubiao-shijiantongjifenxi</li>
            <li><i class="iconfont icon-daohangtubiao-shequshiwu"></i> icon-daohangtubiao-shequshiwu</li>
            <li><i class="iconfont icon-daohangtubiao-shebeiguanli"></i> icon-daohangtubiao-shebeiguanli</li>
            <li><i class="iconfont icon-daohangtubiao-zhuye"></i> icon-daohangtubiao-zhuye</li>
            <li><i class="iconfont icon-daohangtubiao-shishitaishi"></i> icon-daohangtubiao-shishitaishi</li>
            <li><i class="iconfont icon-daohangtubiao-wanggeyuanguanli"></i> icon-daohangtubiao-wanggeyuanguanli</li>
            <li><i class="iconfont icon-daohangtubiao-yuanguanli"></i> icon-daohangtubiao-yuanguanli</li>
            <li><i class="iconfont icon-daohangtubiao-zhongdianqingshaonian"></i> icon-daohangtubiao-zhongdianqingshaonian</li>
            <li><i class="iconfont icon-daohangtubiao-keshihuazhihui"></i> icon-daohangtubiao-keshihuazhihui</li>
            <li><i class="iconfont icon-daohangtubiao-shehuizhian"></i> icon-daohangtubiao-shehuizhian</li>
            <li><i class="iconfont icon-daohangtubiao-xitongshezhi"></i> icon-daohangtubiao-xitongshezhi</li>
            <li><i class="iconfont icon-daohangtubiao-yonghuguanli"></i> icon-daohangtubiao-yonghuguanli</li>
            <li><i class="iconfont icon-daohangtubiao-yewukaohe"></i> icon-daohangtubiao-yewukaohe</li>
            <li><i class="iconfont icon-daohangtubiao-zhongdianrenyuan"></i> icon-daohangtubiao-zhongdianrenyuan</li>
            <li><i class="iconfont icon-daohangtubiao-yuchulixitong"></i> icon-daohangtubiao-yuchulixitong</li>
            <li><i class="iconfont icon-daohangtubiao-zongzhizuzhi"></i> icon-daohangtubiao-zongzhizuzhi</li>

			<li><i class="hdrIcon2 icon-jingweirenwuguanli"></i> icon-jingweirenwuguanli</li>
			<li><i class="hdrIcon2 icon-liuchengshenpi"></i> icon-liuchengshenpi</li>
			<li><i class="hdrIcon2 icon-anshijianbaobiao"></i> icon-anshijianbaobiao</li>
			<li><i class="hdrIcon2 icon-shijianzhutitongji"></i> icon-shijianzhutitongji</li>
			<li><i class="hdrIcon2 icon-liuchengguanli"></i> icon-liuchengguanli</li>
			<li><i class="hdrIcon2 icon-jingqingxinxichaxun"></i> icon-jingqingxinxichaxun</li>
			<li><i class="hdrIcon2 icon-xunluoguanli"></i> icon-xunluoguanli</li>
			<li><i class="hdrIcon2 icon-beiqinrenwuguanli"></i> icon-beiqinrenwuguanli</li>
			<li><i class="hdrIcon2 icon-richanggongzuoshujubaobiao"></i> icon-richanggongzuoshujubaobiao</li>
			<li><i class="hdrIcon2 icon-sanshitizhutitongji"></i> icon-sanshitizhutitongji</li>
			<li><i class="hdrIcon2 icon-zhianluandianzhengzhibaobiao"></i> icon-zhianluandianzhengzhibaobiao</li>
			<li><i class="hdrIcon2 icon-qushiyanpanfenxi"></i> icon-qushiyanpanfenxi</li>
			<li><i class="hdrIcon2 icon-wanggeshujufenxi"></i> icon-wanggeshujufenxi</li>
			<li><i class="hdrIcon2 icon-zongjiaoguanli"></i> icon-zongjiaoguanli</li>
		</ul>

		<h2 class="page-header">一级菜单图标</h2>
		<ul class="the-icons">
			<li><i class="iconfont-firstmenu icon-APPyuchuli"></i> icon-APPyuchuli</li>
			<li><i class="iconfont-firstmenu icon-beiqindanwei"></i> icon-beiqindanwei</li>
			<li><i class="iconfont-firstmenu icon-benyuezhiban"></i> icon-benyuezhiban</li>
			<li><i class="iconfont-firstmenu icon-anquankeshihuachengxian"></i> icon-anquankeshihuachengxian</li>
			<li><i class="iconfont-firstmenu icon-beiqinrenwu"></i> icon-beiqinrenwu</li>
			<li><i class="iconfont-firstmenu icon-caidanguanli"></i> icon-caidanguanli</li>
			<li><i class="iconfont-firstmenu icon-banshizhinan"></i> icon-banshizhinan</li>
			<li><i class="iconfont-firstmenu icon-bumenniandumubiaoguanli"></i> icon-bumenniandumubiaoguanli</li>
			<li><i class="iconfont-firstmenu icon-chengshijiedaojianshe"></i> icon-chengshijiedaojianshe</li>
			<li><i class="iconfont-firstmenu icon-chuhangjiaotong"></i> icon-chuhangjiaotong</li>
			<li><i class="iconfont-firstmenu icon-chazhongguolv"></i> icon-chazhongguolv</li>
			<li><i class="iconfont-firstmenu icon-chengxiangshequjianshe"></i> icon-chengxiangshequjianshe</li>
			<li><i class="iconfont-firstmenu icon-changsuoguanli"></i> icon-changsuoguanli</li>
			<li><i class="iconfont-firstmenu icon-duanxinyuchuli"></i> icon-duanxinyuchuli</li>
			<li><i class="iconfont-firstmenu icon-ditubiaozhu"></i> icon-ditubiaozhu</li>
			<li><i class="iconfont-firstmenu icon-canyindanwei"></i> icon-canyindanwei</li>
			<li><i class="iconfont-firstmenu icon-dianziweilan"></i> icon-dianziweilan</li>
			<li><i class="iconfont-firstmenu icon-farenqiye"></i> icon-farenqiye</li>
			<li><i class="iconfont-firstmenu icon-daibanshiyi"></i> icon-daibanshiyi</li>
			<li><i class="iconfont-firstmenu icon-chuzufangguanli"></i> icon-chuzufangguanli</li>
			<li><i class="iconfont-firstmenu icon-ditupeizhi"></i> icon-ditupeizhi</li>
			<li><i class="iconfont-firstmenu icon-fangwuguanli"></i> icon-fangwuguanli</li>
			<li><i class="iconfont-firstmenu icon-fangankaoheguanli"></i> icon-fangankaoheguanli</li>
			<li><i class="iconfont-firstmenu icon-getigongshanghu"></i> icon-getigongshanghu</li>
			<li><i class="iconfont-firstmenu icon-genzongjiluguanli"></i> icon-genzongjiluguanli</li>
			<li><i class="iconfont-firstmenu icon-gongzuotaizhang"></i> icon-gongzuotaizhang</li>
			<li><i class="iconfont-firstmenu icon-gongzuozhize"></i> icon-gongzuozhize</li>
			<li><i class="iconfont-firstmenu icon-gonggao"></i> icon-gonggao</li>
			<li><i class="iconfont-firstmenu icon-huodongguanli"></i> icon-huodongguanli</li>
			<li><i class="iconfont-firstmenu icon-jidingheyuchuli"></i> icon-jidingheyuchuli</li>
			<li><i class="iconfont-firstmenu icon-jigouguanli"></i> icon-jigouguanli</li>
			<li><i class="iconfont-firstmenu icon-jichuxinxipeizhi"></i> icon-jichuxinxipeizhi</li>
			<li><i class="iconfont-firstmenu icon-jiguandanwei"></i> icon-jiguandanwei</li>
			<li><i class="iconfont-firstmenu icon-huiyiguanli"></i> icon-huiyiguanli</li>
			<li><i class="iconfont-firstmenu icon-jishengguanli"></i> icon-jishengguanli</li>
			<li><i class="iconfont-firstmenu icon-jishiben"></i> icon-jishiben</li>
			<li><i class="iconfont-firstmenu icon-jixiaochengjihuizong"></i> icon-jixiaochengjihuizong</li>
			<li><i class="iconfont-firstmenu icon-jiankongshebeiguanli"></i> icon-jiankongshebeiguanli</li>
			<li><i class="iconfont-firstmenu icon-jianzhuwu"></i> icon-jianzhuwu</li>
			<li><i class="iconfont-firstmenu icon-jiaoseguanli"></i> icon-jiaoseguanli</li>
			<li><i class="iconfont-firstmenu icon-jieluxiang"></i> icon-jieluxiang</li>
			<li><i class="iconfont-firstmenu icon-jingqingtongzhi"></i> icon-jingqingtongzhi</li>
			<li><i class="iconfont-firstmenu icon-jingqingfenfa"></i> icon-jingqingfenfa</li>
			<li><i class="iconfont-firstmenu icon-jiankongshipin"></i> icon-jiankongshipin</li>
			<li><i class="iconfont-firstmenu icon-jingweiguanli"></i> icon-jingweiguanli</li>
			<li><i class="iconfont-firstmenu icon-jinrongjigou"></i> icon-jinrongjigou</li>
			<li><i class="iconfont-firstmenu icon-jiudianzhusu"></i> icon-jiudianzhusu</li>
			<li><i class="iconfont-firstmenu icon-jingweidanwei"></i> icon-jingweidanwei</li>
			<li><i class="iconfont-firstmenu icon-kaohexize"></i> icon-kaohexize</li>
			<li><i class="iconfont-firstmenu icon-keguanshujuluru"></i> icon-keguanshujuluru</li>
			<li><i class="iconfont-firstmenu icon-lianjiechijianshi"></i> icon-lianjiechijianshi</li>
			<li><i class="iconfont-firstmenu icon-lishiyiliu"></i> icon-lishiyiliu</li>
			<li><i class="iconfont-firstmenu icon-liuchengguanli"></i> icon-liuchengguanli</li>
			<li><i class="iconfont-firstmenu icon-lvyoujingdian"></i> icon-lvyoujingdian</li>
			<li><i class="iconfont-firstmenu icon-liuchengguidang"></i> icon-liuchengguidang</li>
			<li><i class="iconfont-firstmenu icon-jingqingguanli"></i> icon-jingqingguanli</li>
			<li><i class="iconfont-firstmenu icon-paihangbang"></i> icon-paihangbang</li>
			<li><i class="iconfont-firstmenu icon-kaoqinqiandao"></i> icon-kaoqinqiandao</li>
			<li><i class="iconfont-firstmenu icon-pingfenkaohe"></i> icon-pingfenkaohe</li>
			<li><i class="iconfont-firstmenu icon-quxianshixiaqushezhi"></i> icon-quxianshixiaqushezhi</li>
			<li><i class="iconfont-firstmenu icon-liuchengduban"></i> icon-liuchengduban</li>
			<li><i class="iconfont-firstmenu icon-qita"></i> icon-qita</li>
			<li><i class="iconfont-firstmenu icon-quyuguanli"></i> icon-quyuguanli</li>
			<li><i class="iconfont-firstmenu icon-minganxinxi"></i> icon-minganxinxi</li>
			<li><i class="iconfont-firstmenu icon-minzhenggongzuoguanli"></i> icon-minzhenggongzuoguanli</li>
			<li><i class="iconfont-firstmenu icon-renwuchuli"></i> icon-renwuchuli</li>
			<li><i class="iconfont-firstmenu icon-richengjihua"></i> icon-richengjihua</li>
			<li><i class="iconfont-firstmenu icon-minganfangkongguanli"></i> icon-minganfangkongguanli</li>
			<li><i class="iconfont-firstmenu icon-renwupaiqian"></i> icon-renwupaiqian</li>
			<li><i class="iconfont-firstmenu icon-rexianyuchuli"></i> icon-rexianyuchuli</li>
			<li><i class="iconfont-firstmenu icon-rizhichaxun"></i> icon-rizhichaxun</li>
			<li><i class="iconfont-firstmenu icon-rizhiguanli"></i> icon-rizhiguanli</li>
			<li><i class="iconfont-firstmenu icon-shangchuanshangjiyushujuguanli"></i> icon-shangchuanshangjiyushujuguanli</li>
			<li><i class="iconfont-firstmenu icon-shequshiwu"></i> icon-shequshiwu</li>
			<li><i class="iconfont-firstmenu icon-shehuizuzhijigou"></i> icon-shehuizuzhijigou</li>
			<li><i class="iconfont-firstmenu icon-qunfangqunzhiduiwu"></i> icon-qunfangqunzhiduiwu</li>
			<li><i class="iconfont-firstmenu icon-shejishishenganquandeanjian"></i> icon-shejishishenganquandeanjian</li>
			<li><i class="iconfont-firstmenu icon-shiyourenkou"></i> icon-shiyourenkou</li>
			<li><i class="iconfont-firstmenu icon-shiyedanwei"></i> icon-shiyedanwei</li>
			<li><i class="iconfont-firstmenu icon-shenghuopeitao"></i> icon-shenghuopeitao</li>
			<li><i class="iconfont-firstmenu icon-shijianguanli"></i> icon-shijianguanli</li>
			<li><i class="iconfont-firstmenu icon-shouyemenhupeizhi"></i> icon-shouyemenhupeizhi</li>
			<li><i class="iconfont-firstmenu icon-shejixianluanjian"></i> icon-shejixianluanjian</li>
			<li><i class="iconfont-firstmenu icon-shetuanzuzhi"></i> icon-shetuanzuzhi</li>
			<li><i class="iconfont-firstmenu icon-teshukaohexiangtianbao"></i> icon-teshukaohexiangtianbao</li>
			<li><i class="iconfont-firstmenu icon-shijianguidang"></i> icon-shijianguidang</li>
			<li><i class="iconfont-firstmenu icon-teshuxinxi"></i> icon-teshuxinxi</li>
			<li><i class="iconfont-firstmenu icon-shuzichengguan"></i> icon-shuzichengguan</li>
			<li><i class="iconfont-firstmenu icon-shouhairenxinxi"></i> icon-shouhairenxinxi</li>
			<li><i class="iconfont-firstmenu icon-tongyichaxun"></i> icon-tongyichaxun</li>
			<li><i class="iconfont-firstmenu icon-tongxunlu"></i> icon-tongxunlu</li>
			<li><i class="iconfont-firstmenu icon-weilanbaojingrizhiguanli"></i> icon-weilanbaojingrizhiguanli</li>
			<li><i class="iconfont-firstmenu icon-qunfangqunzhizuzhi"></i> icon-qunfangqunzhizuzhi</li>
			<li><i class="iconfont-firstmenu icon-wodeqingqiu"></i> icon-wodeqingqiu</li>
			<li><i class="iconfont-firstmenu icon-wenhuajiaoyu"></i> icon-wenhuajiaoyu</li>
			<li><i class="iconfont-firstmenu icon-wanggeyuanguanli"></i> icon-wanggeyuanguanli</li>
			<li><i class="iconfont-firstmenu icon-wodexiaoxi"></i> icon-wodexiaoxi</li>
			<li><i class="iconfont-firstmenu icon-xiaquxinxi"></i> icon-xiaquxinxi</li>
			<li><i class="iconfont-firstmenu icon-wodetongzhi"></i> icon-wodetongzhi</li>
			<li><i class="iconfont-firstmenu icon-wuziguanli"></i> icon-wuziguanli</li>
			<li><i class="iconfont-firstmenu icon-xianyirenxinxi"></i> icon-xianyirenxinxi</li>
			<li><i class="iconfont-firstmenu icon-wanggehuajianshe"></i> icon-wanggehuajianshe</li>
			<li><i class="iconfont-firstmenu icon-xianluxinxiweihu"></i> icon-xianluxinxiweihu</li>
			<li><i class="iconfont-firstmenu icon-tonggaoguanli"></i> icon-tonggaoguanli</li>
			<li><i class="iconfont-firstmenu icon-xinjianliucheng"></i> icon-xinjianliucheng</li>
			<li><i class="iconfont-firstmenu icon-xinxichayue"></i> icon-xinxichayue</li>
			<li><i class="iconfont-firstmenu icon-xiaoyuanzhoubianzhongdianrenwu"></i> icon-xiaoyuanzhoubianzhongdianrenwu</li>
			<li><i class="iconfont-firstmenu icon-wanggeyuandengji"></i> icon-wanggeyuandengji</li>
			<li><i class="iconfont-firstmenu icon-xunluodanwei"></i> icon-xunluodanwei</li>
			<li><i class="iconfont-firstmenu icon-xunluorenwu"></i> icon-xunluorenwu</li>
			<li><i class="iconfont-firstmenu icon-xunluobaogao"></i> icon-xunluobaogao</li>
			<li><i class="iconfont-firstmenu icon-xiajiyufuwuqiguanli"></i> icon-xiajiyufuwuqiguanli</li>
			<li><i class="iconfont-firstmenu icon-xunjianrizhi"></i> icon-xunjianrizhi</li>
			<li><i class="iconfont-firstmenu icon-xitongzidingyishezhi"></i> icon-xitongzidingyishezhi</li>
			<li><i class="iconfont-firstmenu icon-yewuxuexi"></i> icon-yewuxuexi</li>
			<li><i class="iconfont-firstmenu icon-yidongshebeiguanli"></i> icon-yidongshebeiguanli</li>
			<li><i class="iconfont-firstmenu icon-yibanliucheng"></i> icon-yibanliucheng</li>
			<li><i class="iconfont-firstmenu icon-yijianjianyi"></i> icon-yijianjianyi</li>
			<li><i class="iconfont-firstmenu icon-youjian"></i> icon-youjian</li>
			<li><i class="iconfont-firstmenu icon-xuexiaoxinxiguanli"></i> icon-xuexiaoxinxiguanli</li>
			<li><i class="iconfont-firstmenu icon-yuanguanli"></i> icon-yuanguanli</li>
			<li><i class="iconfont-firstmenu icon-zaixianbanshishenhe"></i> icon-zaixianbanshishenhe</li>
			<li><i class="iconfont-firstmenu icon-yulechangsuo"></i> icon-yulechangsuo</li>
			<li><i class="iconfont-firstmenu icon-zhibanrizhi"></i> icon-zhibanrizhi</li>
			<li><i class="iconfont-firstmenu icon-zhongdiandiqupaichazhengzhi"></i> icon-zhongdiandiqupaichazhengzhi</li>
			<li><i class="iconfont-firstmenu icon-zhongdianqingshaonian"></i> icon-zhongdianqingshaonian</li>
			<li><i class="iconfont-firstmenu icon-yiliaozhongxin"></i> icon-yiliaozhongxin</li>
			<li><i class="iconfont-firstmenu icon-zaixianbanshi"></i> icon-zaixianbanshi</li>
			<li><i class="iconfont-firstmenu icon-zhibanguanli"></i> icon-zhibanguanli</li>
			<li><i class="iconfont-firstmenu icon-yonghuguanli"></i> icon-yonghuguanli</li>
			<li><i class="iconfont-firstmenu icon-ziliaoku"></i> icon-ziliaoku</li>
			<li><i class="iconfont-firstmenu icon-zhongdianqiyeleixing"></i> icon-zhongdianqiyeleixing</li>
			<li><i class="iconfont-firstmenu icon-zhongdianchangsuo"></i> icon-zhongdianchangsuo</li>
			<li><i class="iconfont-firstmenu icon-yingjiguangbo"></i> icon-yingjiguangbo</li>
			<li><i class="iconfont-firstmenu icon-yidongshebeiguanliguankong"></i> icon-yidongshebeiguanliguankong</li>
			<li><i class="iconfont-firstmenu icon-zongjiaozuzhi"></i> icon-zongjiaozuzhi</li>
			<li><i class="iconfont-firstmenu icon-zidianguanli"></i> icon-zidianguanli</li>
			<li><i class="iconfont-firstmenu icon-zongzhilingdaozerenzhi"></i> icon-zongzhilingdaozerenzhi</li>
			<li><i class="iconfont-firstmenu icon-zongzhijigou"></i> icon-zongzhijigou</li>
			<li><i class="iconfont-firstmenu icon-zhuguanpingjiayulan"></i> icon-zhuguanpingjiayulan</li>
			<li><i class="iconfont-firstmenu icon-zongzhizhongxin"></i> icon-zongzhizhongxin</li>
			<li><i class="iconfont-firstmenu icon-zongzhishilianwangxinxizhongxin"></i> icon-zongzhishilianwangxinxizhongxin</li>
			<li><i class="iconfont-firstmenu icon-zongzhiduiwu"></i> icon-zongzhiduiwu</li>
			<li><i class="iconfont-firstmenu icon-zuzhijigoujichuxinxi"></i> icon-zuzhijigoujichuxinxi</li>
			<li><i class="iconfont-firstmenu icon-fanganKPIguanli"></i> icon-fanganKPIguanli</li>
		</ul>
		<h2 class="page-header">二级菜单图标</h2>
		<ul class="the-icons">
			<li><i class="iconfont-secondmenu icon-cangkuguanli"></i> icon-cangkuguanli</li>
			<li><i class="iconfont-secondmenu icon-caogaoxiang"></i> icon-caogaoxiang</li>
			<li><i class="iconfont-secondmenu icon-chengshibujianguanli"></i> icon-chengshibujianguanli</li>
			<li><i class="iconfont-secondmenu icon-canguan"></i> icon-canguan</li>
			<li><i class="iconfont-secondmenu icon-chezhan"></i> icon-chezhan</li>
			<li><i class="iconfont-secondmenu icon-aizibingweixianrenyuanguanli"></i> icon-aizibingweixianrenyuanguanli</li>
			<li><i class="iconfont-secondmenu icon-anquanshengchanzhongdian"></i> icon-anquanshengchanzhongdian</li>
			<li><i class="iconfont-secondmenu icon-changzhurenkouguanli"></i> icon-changzhurenkouguanli</li>
			<li><i class="iconfont-secondmenu icon-gewuting"></i> icon-gewuting</li>
			<li><i class="iconfont-secondmenu icon-anquanshengchanzhongdianqiye"></i> icon-anquanshengchanzhongdianqiye</li>
			<li><i class="iconfont-secondmenu icon-changsuoteyefuwuzhongdian"></i> icon-changsuoteyefuwuzhongdian</li>
			<li><i class="iconfont-secondmenu icon-gongyuanhetiyuchang"></i> icon-gongyuanhetiyuchang</li>
			<li><i class="iconfont-secondmenu icon-litang"></i> icon-litang</li>
			<li><i class="iconfont-secondmenu icon-anzhibangjiaorenyuanguanli"></i> icon-anzhibangjiaorenyuanguanli</li>
			<li><i class="iconfont-secondmenu icon-guochengpeizhi"></i> icon-guochengpeizhi</li>
			<li><i class="iconfont-secondmenu icon-dianyingyuan"></i> icon-dianyingyuan</li>
			<li><i class="iconfont-secondmenu icon-jiayouzhanqizhan"></i> icon-jiayouzhanqizhan</li>
			<li><i class="iconfont-secondmenu icon-fengjingmingsheng"></i> icon-fengjingmingsheng</li>
			<li><i class="iconfont-secondmenu icon-chuku"></i> icon-chuku</li>
			<li><i class="iconfont-secondmenu icon-gongyingshangguanli"></i> icon-gongyingshangguanli</li>
			<li><i class="iconfont-secondmenu icon-wuzitongji"></i> icon-wuzitongji</li>
			<li><i class="iconfont-secondmenu icon-qitalianxiren"></i> icon-qitalianxiren</li>
			<li><i class="iconfont-secondmenu icon-huiyishianpai"></i> icon-huiyishianpai</li>
			<li><i class="iconfont-secondmenu icon-gongce"></i> icon-gongce</li>
			<li><i class="iconfont-secondmenu icon-xiaofanganquanzhongdianqiye"></i> icon-xiaofanganquanzhongdianqiye</li>
			<li><i class="iconfont-secondmenu icon-gonggongjigouguanli"></i> icon-gonggongjigouguanli</li>
			<li><i class="iconfont-secondmenu icon-weihuapinjingyingdian"></i> icon-weihuapinjingyingdian</li>
			<li><i class="iconfont-secondmenu icon-chengguanhangzhengchufa"></i> icon-chengguanhangzhengchufa</li>
			<li><i class="iconfont-secondmenu icon-guyiweifaxingshibuzuwunian"></i> icon-guyiweifaxingshibuzuwunian</li>
			<li><i class="iconfont-secondmenu icon-jianchajilu"></i> icon-jianchajilu</li>
			<li><i class="iconfont-secondmenu icon-shehuizuzhiguanli"></i> icon-shehuizuzhiguanli</li>
			<li><i class="iconfont-secondmenu icon-jingjiyunhangshuju"></i> icon-jingjiyunhangshuju</li>
			<li><i class="iconfont-secondmenu icon-meishuguanbowuguan"></i> icon-meishuguanbowuguan</li>
			<li><i class="iconfont-secondmenu icon-gonggongjigourenyuanxinxi"></i> icon-gonggongjigourenyuanxinxi</li>
			<li><i class="iconfont-secondmenu icon-moxingguanli"></i> icon-moxingguanli</li>
			<li><i class="iconfont-secondmenu icon-jiabandengji"></i> icon-jiabandengji</li>
			<li><i class="iconfont-secondmenu icon-kaoqintongji"></i> icon-kaoqintongji</li>
			<li><i class="iconfont-secondmenu icon-qitazhongdian"></i> icon-qitazhongdian</li>
			<li><i class="iconfont-secondmenu icon-shequjiaozhengrenyuanguanli"></i> icon-shequjiaozhengrenyuanguanli</li>
			<li><i class="iconfont-secondmenu icon-fenzuhaoyouguanli"></i> icon-fenzuhaoyouguanli</li>
			<li><i class="iconfont-secondmenu icon-weilahurenkou"></i> icon-weilahurenkou</li>
			<li><i class="iconfont-secondmenu icon-wanggeyuanxinxi"></i> icon-wanggeyuanxinxi</li>
			<li><i class="iconfont-secondmenu icon-laonianrenguanli"></i> icon-laonianrenguanli</li>
			<li><i class="iconfont-secondmenu icon-liudongrenkou"></i> icon-liudongrenkou</li>
			<li><i class="iconfont-secondmenu icon-weixianpincongyerenyuanguanli"></i> icon-weixianpincongyerenyuanguanli</li>
			<li><i class="iconfont-secondmenu icon-shiyourenkouguanli"></i> icon-shiyourenkouguanli</li>
			<li><i class="iconfont-secondmenu icon-liuchengguanli"></i> icon-liuchengguanli</li>
			<li><i class="iconfont-secondmenu icon-menhuzidianguanli"></i> icon-menhuzidianguanli</li>
			<li><i class="iconfont-secondmenu icon-wupinguihuan"></i> icon-wupinguihuan</li>
			<li><i class="iconfont-secondmenu icon-tudiguanli"></i> icon-tudiguanli</li>
			<li><i class="iconfont-secondmenu icon-wanggeyuanzhize"></i> icon-wanggeyuanzhize</li>
			<li><i class="iconfont-secondmenu icon-jiudian"></i> icon-jiudian</li>
			<li><i class="iconfont-secondmenu icon-minzhengshiwu"></i> icon-minzhengshiwu</li>
			<li><i class="iconfont-secondmenu icon-shijianchuli"></i> icon-shijianchuli</li>
			<li><i class="iconfont-secondmenu icon-xunjianrizhi"></i> icon-xunjianrizhi</li>
			<li><i class="iconfont-secondmenu icon-difangzhengce"></i> icon-difangzhengce</li>
			<li><i class="iconfont-secondmenu icon-huiyishiguanli"></i> icon-huiyishiguanli</li>
			<li><i class="iconfont-secondmenu icon-yanjiusuo"></i> icon-yanjiusuo</li>
			<li><i class="iconfont-secondmenu icon-jiatinglvguan"></i> icon-jiatinglvguan</li>
			<li><i class="iconfont-secondmenu icon-yishanchu"></i> icon-yishanchu</li>
			<li><i class="iconfont-secondmenu icon-yuanpeizhi"></i> icon-yuanpeizhi</li>
			<li><i class="iconfont-secondmenu icon-renyuanmijizhongdian"></i> icon-renyuanmijizhongdian</li>
			<li><i class="iconfont-secondmenu icon-yiyuan"></i> icon-yiyuan</li>
			<li><i class="iconfont-secondmenu icon-zhengcefagui"></i> icon-zhengcefagui</li>
			<li><i class="iconfont-secondmenu icon-yinhang"></i> icon-yinhang</li>
			<li><i class="iconfont-secondmenu icon-jiabanshenqingkaohe"></i> icon-jiabanshenqingkaohe</li>
			<li><i class="iconfont-secondmenu icon-qingjiashenqingshenhe"></i> icon-qingjiashenqingshenhe</li>
			<li><i class="iconfont-secondmenu icon-tongxunlufenzuguanli"></i> icon-tongxunlufenzuguanli</li>
			<li><i class="iconfont-secondmenu icon-weihaiguojiaanquanhuodongxianyi"></i> icon-weihaiguojiaanquanhuodongxianyi</li>
			<li><i class="iconfont-secondmenu icon-richangzoufang"></i> icon-richangzoufang</li>
			<li><i class="iconfont-secondmenu icon-qingjiadengji"></i> icon-qingjiadengji</li>
			<li><i class="iconfont-secondmenu icon-xiexin"></i> icon-xiexin</li>
			<li><i class="iconfont-secondmenu icon-wuliuanquanzhongdianqiye"></i> icon-wuliuanquanzhongdianqiye</li>
			<li><i class="iconfont-secondmenu icon-zhiananquanzhongdianqiye"></i> icon-zhiananquanzhongdianqiye</li>
			<li><i class="iconfont-secondmenu icon-rizhishoujianxiang"></i> icon-rizhishoujianxiang</li>
			<li><i class="iconfont-secondmenu icon-yuzu"></i> icon-yuzu</li>
			<li><i class="iconfont-secondmenu icon-jingwairenkou"></i> icon-jingwairenkou</li>
			<li><i class="iconfont-secondmenu icon-zhongdianshangfangrenyuanguanli"></i> icon-zhongdianshangfangrenyuanguanli</li>
			<li><i class="iconfont-secondmenu icon-yingyeting"></i> icon-yingyeting</li>
			<li><i class="iconfont-secondmenu icon-wodegongzuorizhi"></i> icon-wodegongzuorizhi</li>
			<li><i class="iconfont-secondmenu icon-zuzhijigoujichuxinxi"></i> icon-zuzhijigoujichuxinxi</li>
			<li><i class="iconfont-secondmenu icon-xidurenyuanguanli"></i> icon-xidurenyuanguanli</li>
			<li><i class="iconfont-secondmenu icon-zhuanxianghuodong"></i> icon-zhuanxianghuodong</li>
			<li><i class="iconfont-secondmenu icon-zongjiaojigou"></i> icon-zongjiaojigou</li>
			<li><i class="iconfont-secondmenu icon-zhongyaohuodong"></i> icon-zhongyaohuodong</li>
			<li><i class="iconfont-secondmenu icon-rizhitongji"></i> icon-rizhitongji</li>
			<li><i class="iconfont-secondmenu icon-shoujianxiang"></i> icon-shoujianxiang</li>
			<li><i class="iconfont-secondmenu icon-yanzhongxingshifanzuihuodongxianyi"></i> icon-yanzhongxingshifanzuihuodongxianyi</li>
			<li><i class="iconfont-secondmenu icon-wuzixinxiliebiao"></i> icon-wuzixinxiliebiao</li>
			<li><i class="iconfont-secondmenu icon-zhaoshizhaohuodengyanzhongjingshenzhangaihuanzheguanli"></i> icon-zhaoshizhaohuodengyanzhongjingshenzhangaihuanzheguanli</li>
			<li><i class="iconfont-secondmenu icon-yifasong"></i> icon-yifasong</li>
			<li><i class="iconfont-secondmenu icon-wuzipandian"></i> icon-wuzipandian</li>
			<li><i class="iconfont-secondmenu icon-zhianzhongdian"></i> icon-zhianzhongdian</li>
			<li><i class="iconfont-secondmenu icon-xingbiaoyoujian"></i> icon-xingbiaoyoujian</li>
			<li><i class="iconfont-secondmenu icon-zhongdiandanweifenxi"></i> icon-zhongdiandanweifenxi</li>
			<li><i class="iconfont-secondmenu icon-gerenmenhubianji"></i> icon-gerenmenhubianji</li>
			<li><i class="iconfont-secondmenu icon-yiqingrenkouguanli"></i> icon-yiqingrenkouguanli</li>
			<li><i class="iconfont-secondmenu icon-zhongyaohuiyi"></i> icon-zhongyaohuiyi</li>
			<li><i class="iconfont-secondmenu icon-yuanliuchengpeizhi"></i> icon-yuanliuchengpeizhi</li>
			<li><i class="iconfont-secondmenu icon-sangna"></i> icon-sangna</li>
			<li><i class="iconfont-secondmenu icon-wangba"></i> icon-wangba</li>
			<li><i class="iconfont-secondmenu icon-teshuguanhuairenyuanguanli"></i> icon-teshuguanhuairenyuanguanli</li>
			<li><i class="iconfont-secondmenu icon-xunjiankaoping"></i> icon-xunjiankaoping</li>
			<li><i class="iconfont-secondmenu icon-xiaofanganquanzhongdian"></i> icon-xiaofanganquanzhongdian</li>
			<li><i class="iconfont-secondmenu icon-wuliuanquanzhongdian"></i> icon-wuliuanquanzhongdian</li>
			<li><i class="iconfont-secondmenu icon-zhihangdongzuopeizhi"></i> icon-zhihangdongzuopeizhi</li>
			<li><i class="iconfont-secondmenu icon-zhongdiandiqubiaozhun"></i> icon-zhongdiandiqubiaozhun</li>
			<li><i class="iconfont-secondmenu icon-yaodian"></i> icon-yaodian</li>
			<li><i class="iconfont-secondmenu icon-zhongyaowenjian"></i> icon-zhongyaowenjian</li>
			<li><i class="iconfont-secondmenu icon-hujirenkou"></i> icon-hujirenkou</li>
			<li><i class="iconfont-secondmenu icon-jiejiariguanli"></i> icon-jiejiariguanli</li>
			<li><i class="iconfont-secondmenu icon-richanggongzuo"></i> icon-richanggongzuo</li>
			<li><i class="iconfont-secondmenu icon-ruku"></i> icon-ruku</li>
			<li><i class="iconfont-secondmenu icon-juyuan"></i> icon-juyuan</li>
			<li><i class="iconfont-secondmenu icon-shejiaorenyuanguanli"></i> icon-shejiaorenyuanguanli</li>
			<li><i class="iconfont-secondmenu icon-menhufangandingzhi"></i> icon-menhufangandingzhi</li>
			<li><i class="iconfont-secondmenu icon-liushourenyuanguanli"></i> icon-liushourenyuanguanli</li>
			<li><i class="iconfont-secondmenu icon-naoshihangxiongbaofuxianyi"></i> icon-naoshihangxiongbaofuxianyi</li>
			<li><i class="iconfont-secondmenu icon-qitazhongdianqiye"></i> icon-qitazhongdianqiye</li>
			<li><i class="iconfont-secondmenu icon-waichudengji"></i> icon-waichudengji</li>
			<li><i class="iconfont-secondmenu icon-sirenzhensuo"></i> icon-sirenzhensuo</li>
			<li><i class="iconfont-secondmenu icon-nongmaoshichang"></i> icon-nongmaoshichang</li>
		</ul>
	<br/><br/>
</div>
</body>