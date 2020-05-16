<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>抓拍库检索</title>
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
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/searchsnap/iotSearchSnap">以图搜图</a></li>
		<%-- <shiro:hasPermission name="carpass:ccmCarPass:edit"><li><a href="${ctx}/carpass/ccmCarPass/form">过车信息添加</a></li></shiro:hasPermission> --%>
	</ul>
    <form:form id="searchForm" modelAttribute="searchEntity" action="${ctx}/searchsnap/iotSearchSnap" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        <ul class="ul-form">
            <li>
                <label>名单库:</label>
                <form:select path="listId" class="input-medium required">
                    <form:option value="" label="全部" />
                    <form:options items="${grabber}"
                                  itemLabel="grabberName" itemValue="grabberNum" htmlEscape="false"
                                  class="required" />
                </form:select>
            </li>

            <li>
                <label>模型对比阈值段:</label>
                <form:input path="minThreshold" htmlEscape="false" maxlength="64" class="input-medium"/>
                -
                <form:input path="maxThreshold" htmlEscape="false" maxlength="64" class="input-medium"/>
            </li>
            <li>
                <label>抓拍起始时间:</label>
                <input name="startTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                       value="<fmt:formatDate value="${ccmPeople.beginBirthday}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> </li>
            </li>
            <li>
                <label>抓拍结束时间:</label>
                <input name="endTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                       value="<fmt:formatDate value="${ccmPeople.endBirthday}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
            </li>
            <li>
                <label>图片:</label>
                <form:hidden id="images" path="imagesUrl" htmlEscape="false"
                             maxlength="255" class="input-xlarge"/>
                <sys:ckfinder input="images" type="images"
                              uploadPath="/photo/grabberToSearch" selectMultiple="false"
                              maxWidth="240" maxHeight="360"/>
            </li>

            <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="检索"/></li>
        </ul>
    </form:form>
    <sys:message content="${message}"/>
    <table id="contentTable" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th style="text-align:center;vertical-align:middle;">抓拍时间</th>
            <th style="text-align:center;vertical-align:middle;">人脸图</th>
            <th style="text-align:center;vertical-align:middle;">相似度</th>
            <th style="text-align:center;vertical-align:middle;">抓拍机编号</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="SearchGrabberVO">
            <tr>
                <td style="text-align:center;vertical-align:middle;">
                        ${SearchGrabberVO.faceTime}
                </td>
                <td style="text-align:center;vertical-align:middle;">
                    <<img src="${SearchGrabberVO.faceUrl}" alt="">
                </td>
                <td style="text-align:center;vertical-align:middle;">
                        ${SearchGrabberVO.similarity}
                </td>
                <td style="text-align:center;vertical-align:middle;">
                        ${SearchGrabberVO.deviceId}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
	<div class="pagination">${page}</div>
</body>
</html>