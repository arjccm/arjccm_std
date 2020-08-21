<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>布控预警管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		$(function () {
			$(".pimg").click(
					function () {
						var _this = $(this);//将当前的pimg元素作为_this传入函数
						imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
					});
		});

		function imgShow(outerdiv, innerdiv, bigimg, _this) {
			var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
			$(bigimg).attr("src", src);//设置#bigimg元素的src属性
			/*获取当前点击图片的真实大小，并显示弹出层及大图*/
			$("<img/>").attr("src", src).load(function () {
				var windowW = $(window).width();//获取当前窗口宽度
				var windowH = $(window).height();//获取当前窗口高度
				var realWidth = this.width;//获取图片真实宽度
				var realHeight = this.height;//获取图片真实高度
				var imgWidth, imgHeight;
				var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放
				if (realHeight > windowH * scale) {//判断图片高度
					imgHeight = windowH * scale;//如大于窗口高度，图片高度进行缩放
					imgWidth = imgHeight / realHeight * realWidth;//等比例缩放宽度
					if (imgWidth > windowW * scale) {//如宽度扔大于窗口宽度
						imgWidth = windowW * scale;//再对宽度进行缩放
					}
				} else if (realWidth > windowW * scale) {//如图片高度合适，判断图片宽度
					imgWidth = windowW * scale;//如大于窗口宽度，图片宽度进行缩放
					imgHeight = imgWidth / realWidth * realHeight;//等比例缩放高度
				} else {//如果图片真实高度和宽度都符合要求，高宽不变
					imgWidth = realWidth;
					imgHeight = realHeight;
				}
				$(bigimg).css("width", imgWidth);//以最终的宽度对图片缩放
				var w = (windowW - imgWidth) / 2;//计算图片与窗口左边距
				var h = (windowH - imgHeight) / 2;//计算图片与窗口上边距
				$(innerdiv).css({"top": h, "left": w});//设置#innerdiv的top和left属性
				$(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
			});
			$(outerdiv).click(function () {//再次点击淡出消失弹出层
				$(this).fadeOut("fast");
			});
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/list/ccmListAlarm/">布控预警列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="ccmListAlarm" action="${ctx}/list/ccmListAlarm/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>预警时间：</label>
				<input name="startTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ccmListAlarm.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> -
				<input name="endTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					   value="<fmt:formatDate value="${ccmListAlarm.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
			</li>
			<li><label>布控名称：</label>
				<form:select path="controlId" class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${controls}"
								  itemLabel="name" itemValue="fid" htmlEscape="false"
								  class="required" />
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>预警图片(大)</th>
				<th>预警图片(脸)</th>
				<th>预警时间</th>
				<th>布控名称</th>
				<th>抓拍机编号</th>
				<th>相似度</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ccmListAlarm">
			<tr>
				<td width="100px">
					<img src="${ccmListAlarm.bkgPicUrl}" style="height:50px;" class="pimg"/>
				</td>
				<td width="100px">
					<img src="${ccmListAlarm.facePicUrl}" style="height:50px;" class="pimg"/>
				</td>
				<td>
					<fmt:formatDate value="${ccmListAlarm.alarmTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${ccmListAlarm.controlName}
				</td>
				<td>
					${ccmListAlarm.indexCode}
				</td>
				<td>
					${ccmListAlarm.similarity}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div id="outerdiv"
		 style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
		<div id="innerdiv" style="position:absolute;">
			<img id="bigimg" style="border:5px solid #fff;" src=""/>
		</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>