<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<c:if test="${purposeType eq 'list' }">
    <option value="" label="">全部</option>
</c:if>
<c:forEach items="${point}" var="round">
    <option value="${round.id}" label="${round.name}">${round.name}</option>
</c:forEach>
