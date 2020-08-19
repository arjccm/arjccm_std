<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>静态库检索</title>
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
		<li class="active"><a href="${ctx}/searchlist/iotSearchList">以图搜图</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="searchEntity" action="${ctx}/searchlist/iotSearchList" method="post" class="breadcrumb form-search clearfix">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form" style="height: 70px;">
            <li>
                <label>名单库:</label>
                <form:select path="listId" class="input-medium required">
                    <form:option value="" label="全部" />
                    <form:options items="${ccmlist}"
                                  itemLabel="name" itemValue="fid" htmlEscape="false"
                                  class="required" />
                </form:select>
            </li>

			<li>
                <label>模型对比阈值段:</label>
                <form:input path="minThreshold" htmlEscape="false" maxlength="64" class="input-medium"/>
                -
                <form:input path="maxThreshold" htmlEscape="false" maxlength="64" class="input-medium"/>
            </li>
            <li style="height: 70px; width: 520px;">
                <label style="float: left; line-height: 20px; margin-top: 7px">图片:</label>
                <div style="float: left;height: 70px; width: 200px;">
                    <form:hidden id="images" path="imagesUrl" htmlEscape="false"
                                 maxlength="255" class="input-xlarge"/>
                    <sys:ckfinder input="images" type="images"
                                  uploadPath="/photo/faceToSearch" selectMultiple="false"
                                  maxWidth="240" maxHeight="360"/>
                </div>
            </li>

			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="检索"/></li>
		</ul>
	</form:form>
    <sys:message content="${message}"/>
    <table id="contentTable" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th style="text-align:center;vertical-align:middle;">图片</th>
            <th style="text-align:center;vertical-align:middle;">名称</th>
            <th style="text-align:center;vertical-align:middle;">证件号</th>
            <th style="text-align:center;vertical-align:middle;">出生日期</th>
            <th style="text-align:center;vertical-align:middle;">相似度</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="SearchVO">
            <tr>
                <td style="text-align:center;vertical-align:middle;">
                        <<img src="${SearchVO.facePicUrl}" alt="">
                <td style="text-align:center;vertical-align:middle;">
                        ${SearchVO.humanName}
                </td>
                <td style="text-align:center;vertical-align:middle;">
                        ${SearchVO.credentialsNum}
                </td>
                <td style="text-align:center;vertical-align:middle;">
                        ${SearchVO.birthday}
                </td>
                <td style="text-align:center;vertical-align:middle;">
                        ${SearchVO.similarity}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
	<div class="pagination">${page}</div>
</body>
</html>