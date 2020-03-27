<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>物流安全重点管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnSubmit").on("click" ,function(){
				$("#searchForm").submit();
			})
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
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
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">事件管理</span>--%>
<ul class="back-list">
	<ul class="nav nav-tabs">
		<li class="active" style="width: 112px"><a class="nav-head" href="${ctx}/org/ccmOrgNpseLog/">数据列表</a></li>
		<%-- <shiro:hasPermission name="org:ccmOrgNpseLog:edit"><li><a href="${ctx}/org/ccmOrgNpseLog/form">物流安全重点添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmOrgNpse" action="${ctx}/org/ccmOrgNpseLog/" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input type="hidden" name="compImpoType" value="01">
		<ul class="ul-form pull-left">
			<li class="first-line"><label>名称：</label>
				<form:input path="compName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="first-line"> <label>关注程度：</label>
				<form:select path="concExte" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_conc_exte')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="first-line"><label>所属网格：</label>
				<sys:treeselect id="area" name="area.id" value="${ccmOrgNpse.area.id}" labelName="area.name" labelValue="${ccmOrgNpse.area.name}"
					title="区域" url="/tree/ccmTree/treeDataArea?type=7&areaid=" cssClass="input-medium" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li class="first-line"><label>类别：</label>
				<form:select path="compType" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_buss_cate')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<!--  	
			<li><label>工商执照注册号：</label>
				<form:input path="compId" htmlEscape="false" maxlength="18" class="input-medium"/>
			</li>-->

			<li class="first-line"><label>风险级别：</label>
				<form:select path="riskRank" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('ccm_npse_risk_rank')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>	
			<li class="second-line"><label>登记注册开始日期：</label>
				<input name="beginRegisterDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmOrgNpse.beginRegisterDate}" pattern="yyyy-MM-dd"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> </li>
				<li class="second-line"><label>登记注册结束日期：</label><input name="endRegisterDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmOrgNpse.endRegisterDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" style="margin-left: 4px"/>
			</li>

<%--			<li class="clearfix"></li>--%>
		</ul>

	<sys:message content="${message}"/>
	<div class="clearfix pull-right btn-box">
		<a
				onclick="parent.LayerDialog('${ctx}/org/ccmOrgNpseLog/form', '添加', '1100px', '800px')"
				class="btn btn-export" style="width: 49px;display:inline-block;float: right;"><i></i> <span style="font-size: 12px">添加</span></a></li>

			<a href="javascript:;" id="btnSubmit" class="btn btn-primary" style="width: 49px;display:inline-block;float: right;">
				<i></i> <span style="font-size: 12px">查询</span> </a>

	</div>
	</form:form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
		<thead>
			<tr>
				<th>图片</th>
				<th>名称</th>
				<th>工商执照注册号</th>
				<th>登记注册日期</th>
				<th>类别</th>
				<th>所属网格</th>
				<th>关注程度</th>
				<th>风险级别</th>	
				<th>法定代表人</th>
				<th>法定代表人联系方式</th>
				<shiro:hasPermission name="org:ccmOrgNpseLog:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmOrgNpse">
			<tr>
				<td width="200px">
					<img src="${ccmOrgNpse.images}" class="pic-size pimg"/>
				</td>
				<td>
					<a onclick="parent.LayerDialog('${ctx}/org/ccmOrgNpseLog/form?id=${ccmOrgNpse.id}', '编辑', '1100px', '800px')">${ccmOrgNpse.compName}</a>
<%--					<a href="${ctx}/org/ccmOrgNpseLog/form?id=${ccmOrgNpse.id}">--%>
<%--					${ccmOrgNpse.compName}</a>--%>
				</td>
				<td>${ccmOrgNpse.compId}</td>
				<td>
					<fmt:formatDate value="${ccmOrgNpse.registerDate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${fns:getDictLabel(ccmOrgNpse.compType, 'ccm_buss_cate', '')}
				</td>
				<td>
					${ccmOrgNpse.area.name}
				</td>
				<c:if test="${ccmOrgNpse.concExte eq '01'}">
					<td style='color: red'>${fns:getDictLabel(ccmOrgNpse.concExte, 'ccm_conc_exte', '')}&nbsp;
						&nbsp; <img src="${ctxStatic}/images/atteType_red.png" />
					</td>
				</c:if>
				<c:if test="${ccmOrgNpse.concExte eq '02'}">
					<td style='color: orange'>${fns:getDictLabel(ccmOrgNpse.concExte, 'ccm_conc_exte', '')}&nbsp;
						&nbsp; <img src="${ctxStatic}/images/atteType_orange.png" />
					</td>
				</c:if>
				<c:if test="${ccmOrgNpse.concExte eq '03'}">
					<td>${fns:getDictLabel(ccmOrgNpse.concExte, 'ccm_conc_exte', '')}&nbsp;
						&nbsp; <img src="${ctxStatic}/images/atteType_green.png" />
					</td>
				</c:if>
				<c:if
					test="${ccmOrgNpse.concExte eq '' or empty ccmOrgNpse.concExte}">
					<td>${fns:getDictLabel(ccmOrgNpse.concExte, 'ccm_conc_exte', '')}
					</td>
				</c:if>
				<c:if test="${ccmOrgNpse.riskRank eq '01' or ccmOrgNpse.riskRank eq '' or empty ccmOrgNpse.riskRank}">
					<td>${fns:getDictLabel(ccmOrgNpse.riskRank, 'ccm_npse_risk_rank', '')}</td>
				</c:if>
				<c:if test="${ccmOrgNpse.riskRank eq '02'}">
					<td style='color:red'>${fns:getDictLabel(ccmOrgNpse.riskRank, 'ccm_npse_risk_rank', '')}</td>
				</c:if>
				<c:if test="${ccmOrgNpse.riskRank eq '03'}">
					<td style='color:orange'>${fns:getDictLabel(ccmOrgNpse.riskRank, 'ccm_npse_risk_rank', '')}</td>
				</c:if>
				<c:if test="${ccmOrgNpse.riskRank eq '04'}">
					<td style='color:#02F2F2'>${fns:getDictLabel(ccmOrgNpse.riskRank, 'ccm_npse_risk_rank', '')}</td>
				</c:if>
				<c:if test="${ccmOrgNpse.riskRank eq '05'}">
					<td style='color:#06D101'>${fns:getDictLabel(ccmOrgNpse.riskRank, 'ccm_npse_risk_rank', '')}</td>
				</c:if>
				<td>
					${ccmOrgNpse.legalReprName}
				</td>
				<td>
					${ccmOrgNpse.legalReprTl}
				</td>
				<td>
					<shiro:hasPermission name="org:ccmOrgNpseLog:edit">
						<a class="btnList" onclick="parent.LayerDialog('${ctx}/org/ccmOrgNpseLog/form?id=${ccmOrgNpse.id}', '编辑', '1100px', '800px')"title="修改"><i class="icon-pencil"></i></a>
						<a class="btnList" href="${ctx}/org/ccmOrgNpseLog/delete?id=${ccmOrgNpse.id}" onclick="return confirmx('确认要删除该物流安全重点吗？', this.href)"  title="删除"><i class="iconfont icon-icondaohangtubiao-shujucaijifenxi"></i></a>
					</shiro:hasPermission>
					<shiro:hasPermission name="log:ccmLogTail:edit">
						<a class="btnList" onclick="parent.LayerDialog('${ctx}/log/ccmLogTail/list?relevance_id=${ccmOrgNpse.id}&relevance_table=ccm_org_npse', '记录信息', '800px', '660px')"
									  title="记录信息"><i class="icon-print" style="color: cornflowerblue;"></i></a>
						<a class="btnList" onclick="parent.LayerDialog('${ctx}/log/ccmLogTail/formPro?relevance_id=${ccmOrgNpse.id}&relevance_table=ccm_org_npse', '添加记录', '800px', '660px')"
						   title="添加记录"><i class="icon-plus"></i></a>
					</shiro:hasPermission>
					<a class="btnList"
					   onclick="parent.LayerDialog('${ctx}/placeorgpeople/ccmPlaceOrgPeople/toaddPeople?placeOrgId=${ccmOrgNpse.id}&type=2', '从业人员添加', '1550px', '800px')"
					   title="从业人员添加"><i class="icon-group"></i></a>
					<a class="btnList"
					   onclick="parent.LayerDialog('${ctx}/placeorgpeople/ccmPlaceOrgPeople/list?placeOrgId=${ccmOrgNpse.id}&type=2', '从业人员信息', '1550px', '800px')"
					   title="从业人员信息"><i class="icon-align-justify"></i></a>
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
</ul>
</body>
</html>