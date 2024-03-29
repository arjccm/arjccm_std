<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>闹事行凶报复嫌疑管理</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/form/css/form.css" rel="stylesheet" />
	<!-- 鱼骨图 -->
	<link rel="stylesheet" href="${ctxStatic}/ccm/event/css/fishBonePop.css" />
	<script type="text/javascript" src="${ctxStatic}/ccm/event/js/fishBonePop.js"></script>
	<script type="text/javascript" src="${ctxStatic}/ccm/event/js/jquery.SuperSlide.2.1.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					$("#btnSubmit").attr("disabled", true);
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#btnSubmit").removeAttr('disabled');
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			$("td").css({"padding":"8px"});
			$("td").css({"border":"0px dashed #CCCCCC"});
		});
	</script>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li><a href="${ctx}/house/ccmHouseDispute/">闹事行凶报复嫌疑列表</a></li>
		<li class="active"><a href="${ctx}/house/ccmHouseDispute/form?id=${ccmHouseDispute.id}">闹事行凶报复嫌疑<shiro:hasPermission name="house:ccmHouseDispute:edit">${not empty ccmHouseDispute.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="house:ccmHouseDispute:edit">查看</shiro:lacksPermission></a></li>
	</ul> --%>
	<form:form id="inputForm" modelAttribute="ccmHouseDispute" action="${ctx}/house/ccmHouseDispute/save" method="post" class="form-horizontal">
		<form:hidden path="peopleId" value="${ccmPeople.id}" />
		<sys:message content="${message}"/>		
		<h4 class="tableName color-bg6">闹事行凶报复嫌疑人员信息</h4>
		<table border="0px"
			style="border-color: #CCCCCC; border: 0px solid #CCCCCC; padding: 10px; width: 100%;">
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>关注程度：</label>
						<div class="controls">
							<form:select path="dangerLevel" class="input-xlarge required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('ccm_conc_exte')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>

						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>发现途径 ：</label>
						<div class="controls">
							<form:select path="discoveryWay" class="input-xlarge required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('house_discovery_way')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">纠纷人：</label>
						<div class="controls">
							<form:input path="disputer" htmlEscape="false" maxlength="32" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">纠纷人住址：</label>
						<div class="controls">
							<form:input path="disputerAddr" htmlEscape="false" maxlength="128" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">纠纷人联系方式：</label>
						<div class="controls">
							<form:input path="disputerPhone" htmlEscape="false" maxlength="16" class="input-xlarge phone"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">纠纷原因：</label>
						<div class="controls">
							<form:input path="disputeCase" htmlEscape="false" maxlength="1024" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">初次时间：</label>
						<div class="controls">
							<input name="firstDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
								value="<fmt:formatDate value="${ccmHouseDispute.firstDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">经济状况：</label>
						<div class="controls">
							<form:select path="conomicState" class="input-xlarge ">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('conomic_state_dict')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">发现人：</label>
						<div class="controls">
							<form:input path="discoverer" htmlEscape="false" maxlength="32" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">发现人身份证号：</label>
						<div class="controls">
							<form:input path="discoverId" htmlEscape="false" maxlength="20" class="input-xlarge ident0 card"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">发现人联系方式：</label>
						<div class="controls">
							<form:input path="discoverPhone" htmlEscape="false" maxlength="16" class="input-xlarge phone"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">可能行为：</label>
						<div class="controls">
							<form:input path="possibleBehave" htmlEscape="false" maxlength="512" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">活动范围：</label>
						<div class="controls">
							<form:input path="activityScope" htmlEscape="false" maxlength="512" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">疏导人：</label>
						<div class="controls">
							<form:input path="helpName" htmlEscape="false" maxlength="32" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">疏导人联系方式：</label>
						<div class="controls">
							<form:input path="helpTl" htmlEscape="false" maxlength="18" class="input-xlarge phone"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">疏导情况：</label>
						<div class="controls">
							<form:input path="helpCase" htmlEscape="false" maxlength="1024" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>有无犯罪史：</label>
						<div class="controls">
							<form:radiobuttons path="isCrimeHistory"
							items="${fns:getDictList('have_no')}" itemLabel="label" itemValue="value"
							htmlEscape="false" class="required" />
						</div>
					</div>
				</td>
				<td>
				<div class="control-group">
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>监管状态 ：</label>
						<div class="controls">
							<form:radiobuttons path="superviseStatus"
								items="${fns:getDictList('house_supervise_status')}"
								itemLabel="label" itemValue="value" htmlEscape="false" class="required" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">犯罪史：</label>
						<div class="controls">
							<form:textarea path="crimeHistory" htmlEscape="false" rows="4" maxlength="1024" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">备注信息：</label>
						<div class="controls">
							<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<div class="form-actions">
			<shiro:hasPermission name="house:ccmHouseDispute:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<!-- <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/> -->
		</div>
	</form:form>
	<br>
	<c:if test="${documentNumber > 0}">
		<shiro:hasPermission name="log:ccmLogTail:edit">
			<h4>&nbsp;跟踪信息：</h4>
			<br>
			<div class="fishBone1" ></div>
		</shiro:hasPermission>
		<shiro:lacksPermission name="log:ccmLogTail:edit">
			<h4>&nbsp;查看跟踪信息：</h4>
			<br>
			<div class="fishBone2" ></div>
		</shiro:lacksPermission> 
	</c:if>
</body>
</html>