<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>跟踪信息管理</title>
	<meta name="decorator" content="default" />
	<script type="text/javascript">
        $(document).ready(
            function() {
                //$("#name").focus();
                $("#inputForm")
                    .validate(
                        {
                            submitHandler : function(form) {
                                $("#btnSubmit").attr("disabled", true);
                                loading('正在提交，请稍等...');
                                form.submit();
                            },
                            errorContainer : "#messageBox",
                            errorPlacement : function(error, element) {
                                $("#btnSubmit").removeAttr('disabled');
                                $("#messageBox").text("输入有误，请先更正。");
                                if (element.is(":checkbox")
                                    || element.is(":radio")
                                    || element.parent().is(
                                        ".input-append")) {
                                    error.appendTo(element.parent()
                                        .parent());
                                } else {
                                    error.insertAfter(element);
                                }
                            }
                        });
            });
	</script>
</head>
<body>
<ul class="nav nav-tabs">
</ul>
<br />
<form:form id="inputForm" modelAttribute="ccmHouseSchoolrim"
		   action="${ctx}/house/ccmHouseSchoolrim/delAttention" method="post"
		   class="form-horizontal">
	<form:hidden path="id" />
	<div class="control-group">
		<label class="control-label">取消原因：</label>
		<div class="controls">
			<form:textarea path="unAttentionReason" htmlEscape="false" rows="4"
						   maxlength="255" class="input-xxlarge required" />
			<span class="help-inline"><font color="red">*</font></span>
		</div>
	</div>
	<div class="form-actions">
		<shiro:hasPermission name="house:ccmHouseSchoolrim:edit">
			<input id="btnSubmit" class="btn btn-primary" type="submit"
				   value="保 存" />
		</shiro:hasPermission>
	</div>
</form:form>
</body>
</html>