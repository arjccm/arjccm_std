<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>社区服务管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript"
    src="${ctxStatic}/ccm/service/js/ccmCommunityWorkinfo.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    //$("#name").focus();
    $("#inputForm").validate({
        submitHandler: function(form) {
            loading('正在提交，请稍等...');
            form.submit();
        },
        errorContainer: "#messageBox",
        errorPlacement: function(error, element) {
            $("#messageBox").text("输入有误，请先更正。");
            if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                error.appendTo(element.parent().parent());
            } else {
                error.insertAfter(element);
            }
        }
    });
});
</script>
	<link href="/arjccm/static/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a style="width: 140px;text-align:center" href="${ctx}/service/ccmCommunityWork/">数据列表</a></li>
		<li class="active"  style="width: 140px"><a class="nav-head"
			href="${ctx}/service/ccmCommunityWork/form?id=${ccmCommunityWork.id}">数据<shiro:hasPermission
					name="service:ccmCommunityWork:edit">${not empty ccmCommunityWork.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="service:ccmCommunityWork:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<div class="ccmCommunityWorkType" style="display: none;"
		attrType1="${ccmCommunityWork.type1}"
        attrType2="${ccmCommunityWork.type2}" attrPurpose="form"></div>
	<form:form id="inputForm" modelAttribute="ccmCommunityWork"
		action="${ctx}/service/ccmCommunityWork/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
	<table>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label"> <span class="help-inline"><font color="red">*</font> </span>一级分类：</label>
					<div class="controls">
						<form:select path="type1" class="input-xlarge ">
							<form:options items="${fns:getDictList('ccm_service_type')}"
										  itemLabel="label" itemValue="value" htmlEscape="false" />
						</form:select>

					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">二级分类：</label>
					<div class="controls">
						<form:select path="type2" class="input-xlarge ">

						</form:select>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label"> <span class="help-inline"><font color="red">*</font> </span>标题：</label>
					<div class="controls">
						<form:input path="title" htmlEscape="false" maxlength="100"
									class="input-xlarge required" />

					</div>
				</div>
			</td>
			<td>
				<shiro:hasPermission name="service:ccmCommunityWork:edit">
					<div class="control-group">
						<label class="control-label"> <span class="help-inline"><font color="red">*</font> </span>审核类型：</label>
						<div class="controls">

							<c:if test="${not empty ccmCommunityWork.id}">

								<form:select path="status" class="input-xlarge ">
									<%-- <form:options items="${fns:getDictList('ccm_service_handle')}"
                                        itemLabel="label" itemValue="value" htmlEscape="false" /> --%>
									<%-- <form:option value="" label=""/> --%>
									<form:options items="${fns:getDictList('ccm_service_handle')}" itemLabel="label"
												  itemValue="value" htmlEscape="false"/>
								</form:select>
							</c:if>
							<c:if test="${empty ccmCommunityWork.id}">
								<%-- <form:select path="status" class="input-xlarge " disabled="true">
                                    <form:option value="02" label="待审核" />
                                </form:select> --%>
								<form:select path="status" class="input-xlarge ">
									<form:options items="${fns:getDictList('ccm_service_handle')}"
												  itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</c:if>


						</div>
					</div>
				</shiro:hasPermission>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">内容：</label>
					<div class="controls">
						<form:textarea path="content" htmlEscape="false" rows="4"
									   maxlength="1000" class="input-xxlarge " />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">备注信息：</label>
					<div class="controls">
						<form:textarea path="remarks" htmlEscape="false" rows="4"
									   maxlength="255" class="input-xxlarge " />
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">附件：</label>
					<div class="controls">
						<form:hidden id="files" path="files" htmlEscape="false"
									 maxlength="1000" class="input-xlarge" />
						<sys:ckfinder input="files" type="files"
									  uploadPath="/sys/ccmWorkReport" selectMultiple="true" />
					</div>
				</div>
			</td>

		</tr>
	</table>







		<!-- cms_del_flag  -->


		<div class="form-actions">

			<c:if test="${ ccmCommunityWork.status ne '0' }">
				<shiro:hasPermission name="service:ccmCommunityWork:edit">
					<input id="btnSubmit" class="btn btn-primary" type="submit"
						value="保 存" />&nbsp;</shiro:hasPermission>
			</c:if>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
		</div>
	</form:form>
</body>
</html>