<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')} 登录</title>
	<meta name="decorator" content="blank"/>
	<link type="text/css" rel="stylesheet" href="${ctxStatic}/layim/layui/css/layui.css" />
	<script type="text/javascript" src="${ctxStatic}/layim/layui/layui.js"></script>
	<style type="text/css">
		html, body, table {
			background-color: #f5f5f5;
			width: 100%;
			height: 100%;
			text-align: center;
			overflow: hidden !important;
			background: url('/arjccm/static/images/loginImages/login_bj.jpg') no-repeat;
			background-size: 100% 100%
		}

		.form-signin-heading {
			font-family: Helvetica, Georgia, Arial, sans-serif, 黑体;
			font-size: 36px;
			margin-bottom: 20px;
			color: #fff;
			margin-top: 10%
		}

		.form-signin {
			background: url('/arjccm/static/images/loginImages/login_kuang.png') no-repeat;
			position: relative;
			text-align: left;
			width: 540px;
			height: 383px;
			padding: 25px 29px 29px;
			top: 165px;
			left: 488px;
			margin: 0 auto 20px;
			/*background-color: rgba(255, 255, 255, 0.6);*/
			/*border: 1px solid rgba(255, 255, 255, 0.6);*/
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
			-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
			box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
		}

		.form-signin .checkbox {
			margin-bottom: 10px;
			color: #0663a2;
		}

		.form-signin .input-label {
			font-size: 16px;
			line-height: 23px;
			color: #000;
		}

		/*.form-signin .input-block-level {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px;
            *width: 283px;
            *padding-bottom: 0;
            _padding: 7px 7px 9px 7px;
        }*/

		.input-block-level {
			width: 350px;
			height: 48px !important;
			/*background: url('/arjccm/static/images/loginImages/input_user.png') no-repeat;*/
			background: #131e40!important;
			position: relative;
			top: 80px;
			left: 100px;
			color: #fff!important;
			border: 1px solid rgba(1, 196, 205, 1) !important;
		}

		.input-block-level1 {
			width: 287px !important;
			height: 39px !important;
			padding-left: 55px;
			/*background: url('/arjccm/static/images/loginImages/input_pwd.png') no-repeat;*/
			background: #131e40!important;
			position: relative;
			top: 90px;
			left: 100px;
			color: #fff!important;
			border: 1px solid rgba(1, 196, 205, 1) !important;
		}

		input:-webkit-autofill{
			-webkit-text-fill-color: #fff !important;
			transition: background-color 5000s ease-in-out 0s;
		}

		.form-signin .btn.btn-large {
			font-size: 16px;
		}

		.form-signin #themeSwitch {
			position: absolute;
			right: 15px;
			bottom: 10px;
		}

		/*.form-signin div.validateCode {
            padding-bottom: 15px;
        }*/

		.mid {
			vertical-align: middle;
		}

		.header {
			height: 80px;
			padding-top: 20px;
		}

		.alert {
			position: relative;
			width: 300px;
			margin: 0 auto;
			*padding-bottom: 0px;
		}

		label.error {
			background: none;
			width: 270px;
			font-weight: normal;
			color: inherit;
			margin: 0;
		}

		li {
			list-style: none
		}

		.loginBtn {
			background: url('/arjccm/static/images/loginImages/btn_bj.png') no-repeat;
			width: 350px !important;
			height: 48px !important;
			position: relative;
			top: 125px;
			left: 100px;
			color: #fff;
			font-size: 20px;
			border: 0px;
		}

		.loginLable {
			position: absolute;
			top: 258px;
			left: 129px;
			color: #01C4CD;
		}

		.loginLogo {
			position: relative;
			top: 100px;
			left: 100px;
		}

		.loginBig {
			position: absolute;
			top: 205px;
			left: 90px;
		}

		.loginTitle {
			display: flex;
			position: absolute;
			top: 215px;
			left: 61.5%;
			width: 540px;
		}

		.loginTip {
			position: absolute;
			top: 50px;
			left: 40%;
			width: 120px;
			height: 29px;
			font-size: 30px;
			font-family: Microsoft YaHei UI;
			font-weight: 400;
			color: rgba(1, 196, 205, 1);
		}

		.userIcon{
			position: absolute;
			top: 105px;
			left: 21.6%;
			z-index: 999;
		}

		.pwdIcon{
			position: absolute;
			top: 39.6%;
			height: 47px;
			left: 21.6%;
			z-index: 999;
		}

		.checkIcon{
			position: absolute;
			top: -20px;
			height: 46px;
			z-index: 999;
		}

		.validateCode{
			padding-bottom: 9px;
			color: rgba(1, 196, 205, 1);
			position: relative;
			top: 120px;
			left: 100px;

		}

		.loginLiuGuang{
			position: absolute;
			top: 148px;
			left: -100px;
			height: 670px;
		}
    </style>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});

		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
	</script>
</head>
<body>
	<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
	<div class="header">
		<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}">
			<button data-dismiss="alert" class="close">×</button>
			<label id="loginError" class="error">${message}</label>
		</div>
	</div>
<%--	<img class="loginLiuGuang" src='/arjccm/static/images/loginImages/guang.png'>--%>
	<img class="loginBig" src='/arjccm/static/images/loginImages/login_big_sany.png'>
	<%-- <h1 class="form-signin-heading">${fns:getConfig('showName')}系统</h1> --%>
	<div class="loginTitle">
		<img width="43px" height="45px" style="margin-left: 35px" src='/arjccm/static/images/logo.png'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span style="font-size:28px;font-family:MicrosoftYaHei;font-weight:400;color:rgba(255,255,255,1);text-shadow:0px 3px 7px rgba(0, 0, 0, 0.3);position: relative;white-space: nowrap;background: none;">${fns:getConfig('productName_part1')}${fns:getConfig('productName_part2')}</span>
	</div>
	<form id="loginForm" class="form-signin" action="${ctx}/login" method="post">
		<h2 class="loginTip">账号登录</h2>
		<img class="userIcon" src='/arjccm/static/images/loginImages/input_user_Icon.png'>
		<input type="text" id="username" name="username" placeholder="请输入用户名" class="input-block-level required" style="padding-left: 55px" value="${username}">
		<img class="pwdIcon" src='/arjccm/static/images/loginImages/input_pwd_Icon.png'>
		<input type="password" id="password" name="password" placeholder="请输入密码" class="input-block-level1 required" style="padding-left: 55px" value="${password}">


		<c:if test="${isValidateCodeLogin}">
			<div class="validateCode clearfix">
				<img class="checkIcon" src='/arjccm/static/images/loginImages/input_check.png'>
				<sys:validateCode name="validateCode" inputCssStyle="padding-left: 55px;margin-bottom:0;color: #fff;position: relative;top: -20px;width:156px;height:38px"/>
			</div>
		</c:if>
		<li class="clearfix"></li>

		<input class="loginBtn" type="submit" value="登  录"/>&nbsp;&nbsp;

	</form>


	<div class="footer" style="display: none">
		Copyright &copy; 2015-${fns:getConfig('copyrightYear')} <a href="${pageContext.request.contextPath}${fns:getFrontPath()}">${fns:getConfig('productName')}</a> - Powered By <a href="http://arjjs.com" target="_blank">ARJJS</a> ${fns:getConfig('version')} 
	</div>
	<%-- <script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script> --%>
</body>
</html>