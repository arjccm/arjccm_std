<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="JeeSite ${site.description}" />
	<meta name="keywords" content="JeeSite ${site.keywords}" />
	<link rel="stylesheet" href="${ctxStatic}/dist/css/layui.css" type="text/css"/>
	<script type="text/javascript" src="${ctxStatic}/dist/layui.js"></script>
<script>
	layui.use(['carousel', 'form'], function(){
	    var carousel = layui.carousel
	    ,form = layui.form;
	    //图片轮播
	    carousel.render({
		    elem: '#test10'
		    ,width: '940px'
		    ,height: '440px'
		    ,interval: 5000
	    });
	  
	    var $ = layui.$, active = {
	      set: function(othis){
		      var THIS = 'layui-bg-normal'
		      ,key = othis.data('key')
		      ,options = {};
		      
		      othis.css('background-color', '#5FB878').siblings().removeAttr('style'); 
		      options[key] = othis.data('value');
		      ins3.reload(options);
	      }
	    };
	  
	    //监听开关
	    form.on('switch(autoplay)', function(){
		    ins3.reload({
		        autoplay: this.checked
		    });
	    });
	  
	    $('.demoSet').on('keyup', function(){
	        var value = this.value
		    ,options = {};
		    if(!/^\d+$/.test(value)) return;
		    
		    options[this.name] = value;
		    ins3.reload(options);
	    });
	  
	    //其它示例
	    $('.demoTest .layui-btn').on('click', function(){
		    var othis = $(this), type = othis.data('type');
		    active[type] ? active[type].call(this, othis) : '';
	    });
	});
</script>
</head>
<body>
    <div class="hero-unit" style="padding:0px;margin: 0;">
      <%-- <c:set var="article" value="${fnc:getArticle('2')}"/> --%>
      <%-- <h1>${fns:abbr(article.title,28)}</h1><p></p> --%>
      <%-- <p>${fns:abbr(fns:replaceHtml(article.articleData.content),260)}</p>
      <p><a href="${article.url}" class="btn btn-primary btn-large">&nbsp;&nbsp;&nbsp;查看详情 &raquo;&nbsp;&nbsp;&nbsp;</a></p> --%>
	      <div class="layui-carousel" id="test10" >
			  <div carousel-item="">
			    <div><img src="${ctxStatic}/images/as1.png" style="width: 100%;height: 100%;"/></div>
			    <div><img src="${ctxStatic}/images/as2.png" style="width: 100%;height: 100%;"/></div>
			    <div><img src="${ctxStatic}/images/as3.png" style="width: 100%;height: 100%;"/></div>
			    <div><img src="${ctxStatic}/images/as4.png" style="width: 100%;height: 100%;"/></div>
			    <div><img src="${ctxStatic}/images/as5.png" style="width: 100%;height: 100%;"/></div>
			  </div>
		</div>
    </div>
    <div class="row">
      <div class="span4">
        <h4><small><a href="${ctx}/list-2d0e0775f95a4b4895b588521de9bc13${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small>社区建设</h4>
		<ul><c:forEach items="${fnc:getArticleList(site.id, '2d0e0775f95a4b4895b588521de9bc13', 8, '')}" var="article">
			<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,28)}</a></li>
		</c:forEach></ul>
      </div>
      <div class="span4">
        <h4> <small><a href="${ctx}/list-3ad52d7404bf479d8e963d3277599e73${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small>新闻资讯</h4>
		<ul><c:forEach items="${fnc:getArticleList(site.id, '3ad52d7404bf479d8e963d3277599e73', 8, '')}" var="article">
			<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,28)}</a></li>
		</c:forEach></ul>
      </div>
      <div class="span4">
        <h4><small><a href="${ctx}/list-3fb231e8cff54770bbcfcd4cb3c2921e${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small>政策通告</h4>
		<ul><c:forEach items="${fnc:getArticleList(site.id, '3fb231e8cff54770bbcfcd4cb3c2921e', 8, '')}" var="article">
			<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,28)}</a></li>
		</c:forEach></ul>
      </div>
    </div>
</body>
</html>