<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>闹事行凶报复嫌疑管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/ccm/house/js/ccmHouseDisputeInfo.js"></script>
	<script type="text/javascript" src="${ctxStatic}/ccm/pop/js/ccmCommon.js"></script>
	<link href="${ctxStatic}/layer-v3.1.1/layer/theme/default/layer.css" rel="stylesheet" />
	<script src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
    <script type="text/javascript" src="${ctxStatic}/common/HasSecret.js"></script>
<script type="text/javascript">
    $(function(){
		$(".pimg").click(function(){
			var _this = $(this);//将当前的pimg元素作为_this传入函数
			imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
		});
	});
	function imgShow(outerdiv, innerdiv, bigimg, _this){
		var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
		$(bigimg).attr("src", src);//设置#bigimg元素的src属性
		/*获取当前点击图片的真实大小，并显示弹出层及大图*/
		$("<img/>").attr("src", src).load(function(){
			var windowW = $(window).width();//获取当前窗口宽度
			var windowH = $(window).height();//获取当前窗口高度
			var realWidth = this.width;//获取图片真实宽度
			var realHeight = this.height;//获取图片真实高度
			var imgWidth, imgHeight;
			var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放
			if(realHeight>windowH*scale) {//判断图片高度
				imgHeight = windowH*scale;//如大于窗口高度，图片高度进行缩放
				imgWidth = imgHeight/realHeight*realWidth;//等比例缩放宽度
				if(imgWidth>windowW*scale) {//如宽度扔大于窗口宽度
					imgWidth = windowW*scale;//再对宽度进行缩放
				}
			} else if(realWidth>windowW*scale) {//如图片高度合适，判断图片宽度
				imgWidth = windowW*scale;//如大于窗口宽度，图片宽度进行缩放
				imgHeight = imgWidth/realWidth*realHeight;//等比例缩放高度
			} else {//如果图片真实高度和宽度都符合要求，高宽不变
				imgWidth = realWidth;
				imgHeight = realHeight;
			}
			$(bigimg).css("width",imgWidth);//以最终的宽度对图片缩放
			var w = (windowW-imgWidth)/2;//计算图片与窗口左边距
			var h = (windowH-imgHeight)/2;//计算图片与窗口上边距
			$(innerdiv).css({"top":h, "left":w});//设置#innerdiv的top和left属性
			$(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
		});
		$(outerdiv).click(function(){//再次点击淡出消失弹出层
			$(this).fadeOut("fast");
		});
	}
</script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">重点人员</span>--%>
<div class="back-list clearfix">
	<input type="hidden" id="hasPermission" value="${fns:getUser().hasPermission}"/>
	<div class="context" content="${ctx}"></div>
	
	<form:form id="searchForm" modelAttribute="ccmHouseDispute" action="${ctx}/house/ccmHouseDispute/?tableType='ccmHouseDispute'" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input id="permissionKey" name="permissionKey" type="hidden" value="${permissionKey}" />
		<ul class="ul-form pull-left">
			<li class="first-line"><label>姓名：</label> <form:input path="name" htmlEscape="false" maxlength="50" class="input-medium" />
			</li>
			<li class="first-line"><label>性别：</label>
				<form:select path="sex" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</li>
			<li class="first-line"><label>有无犯罪史：</label>
				<form:select path="isCrimeHistory" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('have_no')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</li>
		</ul>

	<sys:message content="${message}"/>
	<div class="clearfix pull-right btn-box">


			<a href="javascript:;" onclick="parent.parent.LayerDialog('${ctx}/house/ccmHouseEmphasis/listSet?type=ccmHouseDispute', '通知信息设置', '550px', '250px')" id="btnSetting" style="width: 70px!important;display:inline-block;float: right;" class="btn btn-export">
				<i></i><span style="font-size: 12px">通知信息设置</span></a>
			<a href="javascript:;" id="btnSubmit" class="btn btn-primary" style="width: 49px;display:inline-block;float: right;">
				<i></i><span style="font-size: 12px">查询</span>  </a>

	</div>
	</form:form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>人员图片</th>
				<th>姓名</th>
				<th>公民身份号码</th>
				<th>性别</th>
				<th>联系方式</th>
				<th>是否有违法犯罪史</th>
				<th>关注程度</th>
				<th>初次时间</th>
				<th>发现人联系方式</th>
				<c:if test="${isShow eq 'YES'}">
					<th>最近走访日期</th>
					<th>下次走访日期</th>
				</c:if>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmHouseDispute">
			<tr>
				<td width="100px"><img src="${ccmHouseDispute.images}" style="height:50px;" class="pimg"/></td>
				<td><a onclick="parent.parent.LayerDialog('${ctx}/house/ccmHouseDispute/form?id=${ccmHouseDispute.id}', '信息', '1200px', '900px')">${ccmHouseDispute.name}</a></td>
				<td>${ccmHouseDispute.ident}</td>
				<td>${fns:getDictLabel(ccmHouseDispute.sex, 'sex', '')}</td>
				<td>${ccmHouseDispute.telephone}</td>
				<td>${fns:getDictLabel(ccmHouseDispute.isCrimeHistory, 'yes_no', '')}</td>
				<c:if test="${ccmHouseDispute.dangerLevel eq '01'}">
					<td style='color:red'>${fns:getDictLabel(ccmHouseDispute.dangerLevel, 'ccm_conc_exte', '')}&nbsp; &nbsp; <img src="${ctxStatic}/images/atteType_red.png" /> </td>
				</c:if>
				<c:if test="${ccmHouseDispute.dangerLevel eq '02'}">
					<td style='color:orange'>${fns:getDictLabel(ccmHouseDispute.dangerLevel, 'ccm_conc_exte', '')}&nbsp; &nbsp; <img src="${ctxStatic}/images/atteType_orange.png" /> </td>
				</c:if>
				<c:if test="${ccmHouseDispute.dangerLevel eq '03'}">
					<td>${fns:getDictLabel(ccmHouseDispute.dangerLevel, 'ccm_conc_exte', '')}&nbsp; &nbsp; <img src="${ctxStatic}/images/atteType_green.png" /> </td>
				</c:if>
				<c:if test="${ccmHouseDispute.dangerLevel eq '' or empty ccmHouseDispute.dangerLevel}">
					<td>${fns:getDictLabel(ccmHouseDispute.dangerLevel, 'ccm_conc_exte', '')} </td>
				</c:if>
				<td><fmt:formatDate value="${ccmHouseDispute.firstDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${ccmHouseDispute.discoverPhone}</td>
				<c:if test="${isShow eq 'YES'}">
					<td><fmt:formatDate value="${ccmHouseDispute.intervalDate}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${ccmHouseDispute.nextvalDate}" pattern="yyyy-MM-dd"/></td>
				</c:if>
				<td><shiro:hasPermission name="house:ccmHarmNationalSecurity:edit">
						<a class="btnList" onclick="parent.parent.LayerDialog('${ctx}/house/ccmHouseDispute/form?id=${ccmHouseDispute.id}&hide1=true&hide2=false', '详情', '1200px', '800px')" title="详情"><i class="iconfont icon-caozuotubiao-xiangqing"></i></a>
					</shiro:hasPermission>
					<shiro:hasPermission name="log:ccmLogTail:view">
						<a class="btnList" onclick="parent.parent.LayerDialog('${ctx}/log/ccmLogTail/list?relevance_id=${ccmHouseDispute.id}&relevance_table=ccm_house_dispute', '走访记录', '1200px', '500px')" title="走访记录"><i class="iconfont icon-caozuotubiao-zoufangjilu"></i></a>
						<%-- <a class="btnList" onclick="parent.parent.LayerDialog('${ctx}/log/ccmLogTail/list?relevance_id=${ccmHouseDispute.id}&relevance_table=ccm_house_dispute', '记录信息', '800px', '660px')" title="记录信息"><i class="iconfont icon-caozuotubiao-jiluxinxi" style="color: cornflowerblue;"></i></a> --%>
					</shiro:hasPermission>
					<shiro:hasPermission name="log:ccmLogTail:edit">
						<a class="btnList" onclick="parent.parent.LayerDialog('${ctx}/log/ccmLogTail/formPro?relevance_id=${ccmHouseDispute.id}&relevance_table=ccm_house_dispute', '添加记录', '800px', '660px')" title="添加记录"><i class="iconfont icon-caozuotubiao-tianjiachuli"></i> </a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
		<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
			<div id="innerdiv" style="position:absolute;">
				<img id="bigimg" style="border:5px solid #fff;" src="" />
			</div>
		</div>
	<div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>