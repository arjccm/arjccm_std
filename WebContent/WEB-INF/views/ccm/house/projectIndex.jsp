<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>${fns:getConfig('productName')}</title>
    <link rel="icon" type="image/x-icon" href="${ctxStatic}/images/logo.ico"/>
    <meta name="decorator" content="blank"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/layim/layui/css/layui.css"/>
    <script type="text/javascript" src="${ctxStatic}/layim/layui/layui.js"></script>
    <link class="zhuti" href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'black'}/projectIndex.css"
          type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        $(document).ready(
            function () {
                // 如果在框架或在对话框中，则弹出提示并跳转到首页
                if (self.frameElement
                    && self.frameElement.tagName == "IFRAME"
                    || $('#left').length > 0 || $('.jbox').length > 0) {
                    alert('未登录或登录超时。请重新登录，谢谢！');
                    top.location = "${ctx}";
                }
                if (isIE()) {
                    $('#productName').css('background', 'transparent');
                    $('.system-nav li span').css('color', '#fff');
                }
            });

        function isIE() {
            if (!!window.ActiveXObject || "ActiveXObject" in window) {
                return true;
            } else {
                return false;
            }
        }


    </script>

</head>
<body>

<div class="bodyBg">
    <div class="top">


        <img id="topImg"
             src="${ctxStatic}/images/${cookie.theme.value eq 'gradient' ? 'title_two.png' : 'login_top.png'}"
             style="height:101px; width: 1920px"/>
        <%-- <h1 class="form-signin-heading">${fns:getConfig('showName')}</h1> --%>
        <h1 class="form-signin-heading">
            <div id="header" class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="navbarname"><img src="${logoLink}" style="width: 50px;height: 50px;margin-right: 10px;margin-top: -5px">${fns:getConfig('productName')}</div>
                    <div class="brand">
                        <a href="${ctx}/sys/map/statIndexCool" target=""><img class="logo"
                                                                              src="${ctxStatic}/images/logo.png"
                                                                              style="width:${cookie.theme.value eq 'gradient' ? '59px' : '59px'};height:${cookie.theme.value eq 'gradient' ? '59px' : '59px'};margin-right:${cookie.theme.value eq 'gradient' ? '15px' : '15px'};margin-top:${cookie.theme.value eq 'gradient' ? '5px' : '5px'}; margin-left: 12px;"/></i>
                            <span id="productName"
                            >${fns:getConfig('productName')}</span></a>
                    </div>
                    <ul id="userControl" class="nav pull-right">

                        <li id="userInfo" class="dropdown"><a class="dropdown-toggle"
                                                              data-toggle="dropdown" href="#" title="个人信息">
                            <img style=" width: 40px; height: 40px; border-radius: 100%; margin-right: 37px; margin-top: 16px; ${cookie.theme.value eq 'gradient' ? 'margin-top: 16px' :  'margin-top: 0px'};"
                                 src="${fns:getUser().photo}" onerror="this.src='${ctxStatic}/images/head/headPhoto.jpg';this.onerror=null"/>
                            <%-- <c:if test="!${cookie.theme.value eq 'gradient' }">
                                    ${fns:getUser().name}&nbsp;
                            </c:if>
                                ${cookie.theme.value eq 'gradient' ? '' : '<span id="notifyNum"
           class="label label-info hide"></span><span class="caret" style="margin-top: 18px;"></span>'} --%>
                        </a>
                            <ul class="dropdown-menu">
                                <%--<li><a href="${ctx}/sys/user/info" target="mainFrame"><i
                                        class="icon-user"></i>&nbsp; 个人信息</a></li>
                                <li><a href="${ctx}/sys/user/modifyPwd" target="mainFrame"><i
                                        class="icon-lock"></i>&nbsp; 修改密码</a></li>
                                <li><a href="${ctx}/oa/oaNotify/self" target="mainFrame"><i
                                        class="iconfont icon-caozuotubiao-fasongjingqing"></i>&nbsp; 我的通知 <span id="notifyNum2"
                                                                                class="label label-info hide"></span></a>
                                </li>--%>
                                <li><a href="${ctx}/logout" title="退出登录"><i class="icon-signout"></i>&nbsp;退出登录</a></li>
                            </ul>
                        </li>

                        <li>&nbsp;</li>
                    </ul>
                </div>
            </div>
        </h1>
    </div>
    <div id="main">
        <ul class="system-nav clearfix" >
            <c:forEach items="${fns:getMenuList()}" var="menu"
                       varStatus="idxStatus">
                <c:if test="${menu.parent.id eq '1'&&menu.isShow eq '1'}">
                    <li
                            class="menu ${not empty firstMenu && firstMenu ? ' active' : ''}">
                        <c:if test="${empty menu.href}">
                            <a class="menu" href="${ctx}/index?pid=${menu.id}"
                               data-href="${ctx}/sys/menu/tree?parentId=${menu.id}" data-id="${menu.id}">
                                <i class="nav-icon iconfont  icon-${menu.icon}"
                                   style="${cookie.theme.value eq 'gradient' ? 'color: rgb(0, 67, 255)' :  'color: #f2f2f2'};"></i>
                                <span class="menu-color">${menu.name}</span></a>
                        </c:if>
                        <c:if test="${not empty menu.href}">
                            <a class="menu"
                               href="${fn:indexOf(menu.href, '://') eq -1 ? ctx : ''}${menu.href}" data-id="${menu.id}">
                                <i class="nav-icon iconfont icon-interCmn" style="color: rgb(0, 67, 255)"></i>
                                <span class="nav-name">${menu.name}</span>
                            </a>
                        </c:if>
                    </li>
                </c:if>
            </c:forEach>

        </ul>
    </div>
</div>
<script>

	$(function () {
		reload();

	});


    function reload() {

        var Li = $("#main ul li");
        <%--var flag = ${cookie.theme.value eq 'black' ? true : false}--%>
        var flag = $(".zhuti").attr("href");
        var Ul=$(".system-nav");

        if (flag=="${ctxStatic}/bootstrap/2.3.1/css_black/projectIndex.css") {
            var liLength=Li.length;
            // alert(liLength)
            // alert(Li)

            //12个菜单及以下样式
            if(liLength<=9){
                if(liLength<=8){
                    Ul.css({
                        "margin-top":"90px"
                    })
                }
            }
            //12个菜单以上样式
            if(liLength>12){
                Ul.width(1400);
                Ul.css({
                    "margin-top":"10px"
                })
            }
            //alert(Li.eq(1).find('span').html())


            //先循环添加背景图片
            for (var i = 0; i < Li.length; i++) {
                var asp1 = Li.eq(i).find('a').attr("href");
                 console.log(asp1)
                //  /arjccm/a/index?pid=70a1747ee8334e439b2b24ebe947ecdd
                var sp1=asp1.split("=")[1];
                console.log(sp1)
                var ljSrc = "${ctxStatic}/images/" + sp1 + ".png";
                //console.log(ljSrc)

                imgOnload(ljSrc, sp1, i);
            }
            //添加悬浮动图
            Li.mouseover(function () {
                var bjSrc=decodeURIComponent($(this) .css("backgroundImage"));
                //url("http://localhost:8080${ctxStatic}/images/社会信息采集平台.png")
                var str=bjSrc.split("/");
                var ljSrc=str[str.length-1].split(".")[0];
                $(this).css({
                    "background": "url(${ctxStatic}/images/" + ljSrc + ".gif)"
                })
            })
            Li.mouseout(function () {
                var bjSrc=decodeURIComponent($(this) .css("backgroundImage"));
                //url("http://localhost:8080${ctxStatic}/images/社会信息采集平台.png")
                var str=bjSrc.split("/");
                var ljSrc=str[str.length-1].split(".")[0];
                $(this).css({
                    "background": "url(${ctxStatic}/images/" + ljSrc + ".png)"
                })
            })



            $("#main ul li .nav-icon").hide()
            $(".brand").hide()
            $("#userControl li a ").css({
                "marginTop":"7px",
                "marginRight":"-13px"
            })

        }
    }

    function imgOnload(ljSrc,sp1,i) {
        var Li = $("#main ul li");
        var img=new Image();
        img.src=ljSrc;

        img.onerror = function() {
            Li.eq(i).css({
                "background": "url(${ctxStatic}/images/默认.png)"
            });
            return false;
        }
        Li.eq(i).css({
            "background": "url(${ctxStatic}/images/" + sp1 + ".png)"
        });
    }

</script>


</body>
</html>