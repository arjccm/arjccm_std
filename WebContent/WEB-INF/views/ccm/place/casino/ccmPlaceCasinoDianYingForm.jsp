<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>电影院场所管理</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/form/css/form.css" rel="stylesheet" />
<link href="${ctxStatic}/form/css/formTable.css" rel="stylesheet" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						//关闭弹框事件
						$('#btnCancel').click(function() {
							parent.layer.close(parent.layerIndex);
						})
						$('#ccmBasePlaceCommon')
								.attr(
										'href',
										'${ctx}/place/ccmBasePlace/form/common?id=${ccmPlaceCasino.basePlaceId}&name='
												+ encodeURI('电影院场所信息')
												+ '&url=${ctx}/casino/ccmPlaceCasino/form?id=${ccmPlaceCasino.id}')

						//$("#name").focus();
						$("#inputForm").validate(
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
	
	function saveForm() {
		var area = $("#areaId").val();
		var html1 = '<label for="" class="error">必选字段 <label>';
		//alert(officeId.length);
		if (area.length != 0) {
			$("#show1").html("");
		} else {
			$("#show1").html(html1);
		}

		if (area.length != 0) {
			$("#inputForm").submit();
		}

	}

	function ThisLayerDialog(src, title, height, width) {
		debugger
		parent.drawForm = parent.layer.open({
			type: 2,
			title: title,
			area: [height, width],
			fixed: true, //固定
			maxmin: false,
			/*   btn: ['关闭'], //可以无限个按钮 */
			content: src,
			zIndex: '1992',
			cancel: function () {
				//防止取消和删除效果一样
				window.isCancel = true;
			},
			end: function () {
				debugger
				if (!window.isCancel) {
					$("#areaPoint")[0].value = parent.areaPoint;
					parent.areaPoint = null;
					$("#areaMap")[0].value = parent.areaMap;
					parent.areaMap = null;
				}
				window.isCancel = null;
			}
		});
	}
</script>
	<link href="/arjccm/static/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
</head>
<body>
	<ul class="nav nav-tabs">
		<%-- 		<li class="active"><a
			href="${ctx}/casino/ccmPlaceCasino/form?id=${ccmPlaceCasino.id}">娱乐场所<shiro:hasPermission
					name="casino:ccmPlaceCasino:edit">${not empty ccmPlaceCasino.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="casino:ccmPlaceCasino:edit">查看</shiro:lacksPermission></a></li> --%>
	</ul>
	<br />


	<form:form id="inputForm" modelAttribute="ccmPlaceCasino"
		action="${ctx}/casino/ccmPlaceCasino/save/04" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<h4 class="tableNamefirst">基本信息</h4>
		<table>
			<tr>
				<td style="width: 50%;"><label class="control-label"><span class="help-inline"><font color="red">*</font></span>场所名称：</label>
					<div class="controls">
						<form:input path="ccmBasePlace.placeName" htmlEscape="false"
							maxlength="255" class="input-xlarge required" />

					</div></td>
				<td><label class="control-label">场所用途：</label>
					<div class="controls">
						<form:input path="ccmBasePlace.placeUse" htmlEscape="false"
							maxlength="255" class="input-xlarge " />
					</div></td>
			</tr>
			<tr>
				<td><label class="control-label">主管单位名称：</label>
					<div class="controls">
						<form:input path="ccmBasePlace.governingBodyName"
							htmlEscape="false" maxlength="255" class="input-xlarge " />
					</div></td>
				<td><label class="control-label">场所面积（平方米）：</label>
					<div class="controls">
						<form:input path="ccmBasePlace.placeArea" htmlEscape="false"
							maxlength="255" class="input-xlarge number positiveNumber"/>
					</div></td>
			</tr>
			<tr>
				<td><label class="control-label"><span class="help-inline"><font color="red">*</font></span>关联组织机构：</label>
					<div class="controls">
						<form:select path="ccmBasePlace.relevanceOrg" class="input-xlarge">
							<form:option value="" label="无关联" />
							<form:options items="${fns:getDictList('ccm_buss_cate')}"
								itemLabel="label" itemValue="value" htmlEscape="false"
								class="required" />
						</form:select>

					</div></td>
				<td><label class="control-label">工作人员数量（人）：</label>
					<div class="controls">
						<form:input path="ccmBasePlace.workerNumber" htmlEscape="false"
							maxlength="255" class="input-xlarge number digits"/>
					</div></td>
			</tr>
			<tr>
				<td><label class="control-label"><span class="help-inline"><font color="red">*</font></span>负责人姓名：</label>
					<div class="controls">
						<form:input path="ccmBasePlace.leaderName" htmlEscape="false"
							maxlength="255" class="input-xlarge required" />
					</div></td>
				<td><label class="control-label"><span class="help-inline"><font color="red">*</font></span>负责人身份证号码：</label>
					<div class="controls">
						<form:input path="ccmBasePlace.leaderIdCard" htmlEscape="false"
							maxlength="18" class="input-xlarge ident1 card required" />

					</div></td>
			</tr>
			<tr>
				<td><label class="control-label"><span class="help-inline"><font color="red">*</font></span>负责人联系方式：</label>
					<div class="controls">
						<form:input path="ccmBasePlace.leaderContact" htmlEscape="false"
							maxlength="11" class="input-xlarge telephone0 phone required" />

					</div></td>
				<td><label class="control-label">地址：</label>
					<div class="controls">
						<form:input path="ccmBasePlace.address" htmlEscape="false"
							maxlength="255" class="input-xlarge " />
					</div></td>
			</tr>
			<tr>
				<td><label class="control-label" style="display: none">场所类型：</label>
					<div class="controls" style="display: none">
						<form:input path="ccmBasePlace.placeType" style="display: none"
							htmlEscape="false" maxlength="255" class="input-xlarge " />
					</div> <label class="control-label"><span class="help-inline"><font color="red ">*</font></span>所属网格：</label>
					<div class="controls">
						<sys:treeselect id="area"
							name="ccmBasePlace.administrativeDivision"
							value="${ccmPlaceCasino.ccmBasePlace.administrativeDivision}"
							labelName=""
							labelValue="${ccmPlaceCasino.ccmBasePlace.area.name}" title="网格"
							url="/tree/ccmTree/treeDataArea?type=7&areaid=" allowClear="true"
							notAllowSelectParent="true" cssClass=""/>
						<span class="help-inline"><font color="red "id="show1"></font></span>
					</div></td>
				<td><label class="control-label"><span class="help-inline"><font color="red">*</font></span>成立时间：</label>
					<div class="controls">
						<input name="ccmBasePlace.createTime" type="text"
							readonly="readonly" maxlength="20"
							class="input-medium Wdate required"
							value="<fmt:formatDate value="${ccmPlaceCasino.ccmBasePlace.createTime}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />

					</div></td>
			</tr>
			<tr>
				<td style="padding: 8px;border: 0px dashed #CCCCCC">
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>中心点：</label>
						<div class="controls">
							<form:input path="areaPoint" readonly="true" htmlEscape="false"
										maxlength="40" class="input-xlarge disabled1 required"/>
						</div>
					</div>
				</td>
				<td style="padding: 8px;border: 0px dashed #CCCCCC">
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>区域图：</label>
						<div class="controls">
							<form:input path="areaMap" readonly="true" htmlEscape="false"
										class="input-xlarge disabled1 required"/>
							<a onclick="ThisLayerDialog('${ctx}/event/ccmEventIncident/drawForm?areaMap='+$('#areaMap').val()+'&areaPoint='+$('#areaPoint').val(), '标注', '1100px', '700px');"
							   class="btn hide1 btn-primary">标 注</a>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><label class="control-label">重点场所：</label>
					<div class="controls">
						<form:checkboxes path="keyPointList"
							items="${fns:getDictList('ccm_place_important')}"
							itemLabel="label" itemValue="value" htmlEscape="false"
							class="required" />

					</div></td>
			</tr>
			<tr>
				<td colspan="2" rowspan="2"><label class="control-label">场所图片：</label>
					<div class="controls">
						<form:hidden id="images" path="ccmBasePlace.placePicture"
							htmlEscape="false" maxlength="255" class="input-xlarge" />
						<sys:ckfinder input="images" type="images" uploadPath="/photo"
							selectMultiple="false" maxWidth="240" maxHeight="360" />
					</div></td>
			</tr>
		</table>
		<h4 class="tableName">电影院场所信息</h4>
		<table>
			<tr>
				<td><label class="control-label"><span class="help-inline"><font color="red">*</font></span>是否安装了监控设备：</label>
					<div class="controls">
						<form:select path="isMonitor" class="input-xlarge required"
									 items="${fns:getDictList('yes_no')}" itemLabel="label"
									 itemValue="value" htmlEscape="false">
						</form:select>
					</div></td>
				<td><label class="control-label"><span class="help-inline"><font color="red">*</font></span>安全通道是否畅通：</label>
					<div class="controls">
						<form:select path="isPass" class="input-xlarge required"
									 items="${fns:getDictList('yes_no')}" itemLabel="label"
									 itemValue="value" htmlEscape="false">
						</form:select>

					</div></td>
			</tr>
			<tr>
				<td><label class="control-label"><span class="help-inline"><font color="red">*</font></span>是否有灭火器材：</label>
					<div class="controls">
						<form:select path="isAnnihilator" class="input-xlarge required"
									 items="${fns:getDictList('yes_no')}" itemLabel="label"
									 itemValue="value" htmlEscape="false">
						</form:select>

					</div></td>
				<td><label class="control-label"><span class="help-inline"><font color="red">*</font></span>是否有疏散指示标志：</label>
					<div class="controls">
						<form:select path="isSign" class="input-xlarge required"
									 items="${fns:getDictList('yes_no')}" itemLabel="label"
									 itemValue="value" htmlEscape="false">
						</form:select>
					</div></td>
			</tr>
			<tr>
				<td><label class="control-label"><span class="help-inline"><font color="red">*</font></span>是否有应急照明灯：</label>
					<div class="controls">
						<form:select path="isLighting" class="input-xlarge required"
									 items="${fns:getDictList('yes_no')}" itemLabel="label"
									 itemValue="value" htmlEscape="false">
						</form:select>
					</div></td>
				<td><label class="control-label"><span class="help-inline"><font color="red">*</font></span>是否有经营许可证：</label>
					<div class="controls">
						<form:select path="isLicense" class="input-xlarge required"
									 items="${fns:getDictList('yes_no')}" itemLabel="label"
									 itemValue="value" htmlEscape="false">
						</form:select>
					</div></td>
			</tr>
			<tr>
				<td colspan="2"><label class="control-label">备注信息：</label>
					<div class="controls">
						<form:textarea path="remarks" htmlEscape="false" rows="2"
									   maxlength="255" class="input-xxlarge" />
					</div></td>
			</tr>

		</table>

		<div class="form-actions">
			<shiro:hasPermission name="casino:ccmPlaceCasino:edit">
				<input id="btnSubmit" class="btn btn-primary" onclick="saveForm()"
					type="button" value="保存" />
				<input id="btnCancel" class="btn btn-danger" type="button"
					value="关闭" />&nbsp;</shiro:hasPermission>
		</div>

	</form:form>
</body>
</html>