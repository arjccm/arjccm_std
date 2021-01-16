<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>境外人口管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/ccm/pop/ccmPeopleForm.js"></script>
	<script type="text/javascript" src="${ctxStatic}/ccm/validator/validator.js"></script>
	<script type="text/javascript" src="${ctxStatic}/ccm/validator.js"></script>

<!-- 鱼骨图 -->
<link rel="stylesheet" href="${ctxStatic}/ccm/event/css/fishBonePop.css" />
<script type="text/javascript" src="${ctxStatic}/ccm/event/js/fishBonePop.js"></script>
<script type="text/javascript" src="${ctxStatic}/ccm/event/js/jquery.SuperSlide.2.1.1.js"></script>
	<script type="text/javascript" src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
	<style type="text/css">
		.pad{padding: 5px; padding-left: 10px}
		#person{display: none;}
		#float{display: none;}
		#oversea{display: none;}
		#unsettle{display: none;}
		.input-xlarge{width: 200px;}
		.select2-container.input-xlarge{width:215px;}
		.input-medium.Wdate {width: 200px;}
		
.nav  li .znul {
	background-color: #e9493b;
	color: white;
	box-shadow: 0px 1px 3px rgba(34, 25, 25, 0.2);
	margin-right: 10px;
	float: left;
	border-radius: 2px;
}

.nav  li .znul:HOVER {
	background-color: white;
	color: #6d6666;
}

.nav  li .zzul {
	background-color: #01ad5c;
	color: white;
	box-shadow: 0px 1px 3px rgba(34, 25, 25, 0.2);
	margin-right: 10px;
	float: left;
	border-radius: 2px;
}

.nav  li .zzul:HOVER {
	background-color: white;
	color: #6d6666;
}

.nav  li .gzul {
	background-color: #3c9fd6;
	color: white;
	box-shadow: 0px 1px 3px rgba(34, 25, 25, 0.2);
	margin-right: 10px;
	float: left;
	border-radius: 2px;
}

.nav  li .gzul:HOVER {
	background-color: white;
	color: #6d6666;
}

#zd1 {
	color: #e9493b;
	line-height: 30px;
	font-size: 130%
}

#zd2 {
	color: #01ad5c;
	line-height: 30px;
	font-size: 130%
}

#zd3 {
	color: #3c9fd6;
	line-height: 30px;
	font-size: 130%
}

.ulz {
	margin-left: 50px;
}
.tip_box_style .layui-layer-content {
	background: none;
	color: red;
	font-size: 16px;
	box-shadow: 0px 0px 0px 0px #0b0b0b;
	padding: 4px 15px;
}
.tip_box_style .layui-layer-content .layui-layer-TipsR {

}
.tip_box_style i.layui-layer-TipsL, .tip_box_style i.layui-layer-TipsR {
	/*border-right-style: solid;*/
	/*border-right-color: red;*/
	top: 6px;
	border-style: solid;
	border-color: transparent #FF0000 transparent transparent;
}
.error1{
    background-position: 0 2px;
    background: url('${ctxStatic}/jquery-validation/1.11.1/images/unchecked.gif') no-repeat 0 0;
    padding-left: 18px;
    padding-bottom: 2px;
    font-weight: bold;
    color: #ea5200;
    margin-left: 10px;
}
	</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("td").css({"padding":"8px"});
				$("td").css({"border":"0px dashed #CCCCCC"});
				//追踪信息
				var jsonString = '${documentList}';
                data = JSON.parse(jsonString);  
				$(".fishBone1").fishBone(data, '${ctx}','deal');
				$(".fishBone2").fishBone(data, '${ctx}','read');
				sels();
			});

	function saveForm(){
		var areaComIdId = $("#areaComIdId").val();
		var areaGridIdId = $("#areaGridIdId").val();
		var html1 = '<label for="" class="error1">必选字段 *<label>';
		if (areaComIdId.length != 0) {
			$("#showCom").html("*");
		} else {
			$("#showCom").html(html1);
		}
		if (areaGridIdId.length != 0) {
			$("#showGrid").html("*");
		} else {
			$("#showGrid").html(html1);
		}
		
	} 

</script>
	<link href="${ctxStatic}/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="back-list clearfix">
	<%--<ul class="nav nav-tabs">
		<li><a style="text-align:center" href="${ctx}/pop/ccmWork/list/30">数据列表</a></li>
		<li class="active"><a class="nav-head" href="${ctx}/pop/ccmWork/form/overseas?id=${ccmPeople.id}">数据<shiro:hasPermission name="pop:ccmWork:edit">${not empty ccmPeople.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="pop:ccmWork:edit">查看</shiro:lacksPermission></a></li>
		&lt;%&ndash; <c:if test="${not empty ccmPeople.id}">
			<li><a href="${ctx}/log/ccmLogTail/formProPermanent?relevance_id=${ccmPeople.id}&relevance_table=ccm_people">跟踪信息<shiro:hasPermission name="log:ccmLogTail:edit">${not empty ccmLogTail.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="log:ccmLogTail:edit">查看</shiro:lacksPermission></a></li>
		</c:if> &ndash;%&gt;
	</ul>--%>
	<form:form id="inputForm" modelAttribute="ccmPeople" action="${ctx}/pop/ccmWork/save/overseas" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		
		<table border="0px"
			style="border-color: #CCCCCC; border: 0px solid #CCCCCC; padding: 10px; width: 100%">
			<h4 class="color-bg6">基本信息：</h4>
			<tr>
				<td>
					<div>
						<label class="control-label">人口类型：</label>
						<div class="controls">
							<form:select path="type" class="input-xlarge " id="sel"
								onchange="sels()">
								<form:options items="${fns:getDictList('sys_ccm_people')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td >
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>性别：</label>
						<div class="controls">
							<form:radiobuttons path="sex" items="${fns:getDictList('sex')}"
								itemLabel="label" itemValue="value" htmlEscape="false" class="required" />
						</div>
					</div>
				</td>

			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>姓名：</label>
						<div class="controls">
							<form:input path="name" htmlEscape="false" maxlength="50"
								class="input-xlarge required" />

							</span>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>出生日期：</label>
						<div class="controls">
							<input name="birthday" type="text" readonly="readonly"
								   maxlength="20" class="input-medium Wdate required"
								   value="<fmt:formatDate value="${ccmPeople.birthday}" pattern="yyyy-MM-dd"/>"
								   onclick="WdatePicker({minDate:'{%y-150}-%M-%d',maxDate: '%y-%M-%d',dateFmt:'yyyy-MM-dd',isShowClear:false});" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">曾用名：</label>
						<div class="controls">
							<form:input path="usedname" htmlEscape="false" maxlength="50"
								class="input-xlarge " />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td >
					<div>
						<label class="control-label">照片：</label>
						<div class="controls">
							<form:hidden id="images" path="images" htmlEscape="false"
										 maxlength="255" class="input-xlarge" />
							<sys:ckfinder input="images" type="images"
										  uploadPath="/photo/ShiYouRenKou" selectMultiple="false" maxWidth="240"
										  maxHeight="360" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>民族：</label>
						<div class="controls">
							<form:select path="nation" class="input-xlarge required">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('sys_volk')}"
											  itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>联系方式：</label>
						<div class="controls">
							<form:input path="telephone" htmlEscape="false" maxlength="18"
										class="input-xlarge telephone0 phone required" />
							<span id="telephone0"></span>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label labName"><span id="ident0"></span><span class="help-inline"><font color="red">*</font></span>公民身份号码：</label>
						<div class="controls">
							<form:input path="ident" id="p_id_card" onmouseout="isRepeat('${ccmPeople.id}')"
										htmlEscape="false" maxlength="18"
										class="input-xlarge ident0 card "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>

				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>籍贯：</label>
						<div class="controls">
							<form:input path="censu" htmlEscape="false" maxlength="6"
								class="input-xlarge required " />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>婚姻状况：</label>
						<div class="controls">
							<form:select path="marriage" class="input-xlarge required ">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('sys_ccm_mari_stat')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>政治面貌：</label>
						<div class="controls">
							<form:select path="politics" class="input-xlarge required ">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('sys_ccm_poli_stat')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>


				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>学历：</label>
						<div class="controls">
							<form:select path="education" class="input-xlarge required">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('sys_ccm_degree')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">宗教信仰：</label>
						<div class="controls">
							<form:select path="belief" class="input-xlarge ">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('sys_ccm_belief')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>职业类别：</label>
						<div class="controls">
							<form:input path="profType" htmlEscape="false" maxlength="5"
								class="input-xlarge required" />
						</div>
					</div>
				</td>
			</tr>
			<tr>

				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>职业：</label>
						<div class="controls">
							<form:input path="profession" htmlEscape="false" maxlength="30"
								class="input-xlarge required" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>是否公职人员：</label>
						<div class="controls">
							<form:select path="isPublicServants" class="input-xlarge required">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('yes_no')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">所在单位/学校：</label>
						<div class="controls">
							<form:input path="officeName" htmlEscape="false" maxlength="30"
								class="input-xlarge " />
						</div>
					</div>
				</td>
			</tr>

			<tr>

				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>是否常住：</label>
						<div class="controls">
							<form:radiobuttons path="isPermanent"
								items="${fns:getDictList('yes_no')}" itemLabel="label"
								itemValue="value" htmlEscape="false" class="required" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>是否重点关注人员：</label>
						<div class="controls">
							<form:radiobuttons path="focuPers"
								items="${fns:getDictList('yes_no')}" itemLabel="label"
								itemValue="value" htmlEscape="false" class="required" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>户籍地：</label>
						<div class="controls">
							<form:input path="domicile" htmlEscape="false" maxlength="6"
								class="input-xlarge required" />
						</div>
					</div>
				</td>
			</tr>
			<tr>


				<td>
					<div>
						<input type="hidden" id="isreact" value="true">
						<label class="control-label"><span class="help-inline"><font
								color="red">*</font></span>所属社区：</label>
							<%--<div class="controls" onmouseout="onclickNet()">--%>
						<div class="controls">
								<%--  <!--
                                      <sys:treeselect id="areaComId" name="areaComId.id" value="${ccmPeople.areaComId.id}" labelName="areaComId.name" labelValue="${ccmPeople.areaComId.name}"
                                      title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="false" cssStyle="width: 150px"/>
                                      -->--%>
							<sys:treeselect id="areaComId" name="areaComId.id"
											value="${ccmPeople.areaComId.id}" labelName="areaComId.name"
											labelValue="${ccmPeople.areaComId.name}" title="区域"
											url="/tree/ccmTree/treeDataArea?type=6" cssClass="required"
											allowClear="true" notAllowSelectParent="true"
											cssStyle="width: 270px"/>
							<span class="help-inline" id="showCom"></span>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font
								color="red">*</font></span>所属网格：</label>
						<div class="controls">
								<%--<div class="help-inline" id="newNet" onmouseout=""
                                     onmousemove="onclickNet()" onclick="onclickNet1()">--%>
							<div class="help-inline">
								<sys:treeselect id="areaGridId" name="areaGridId.id" disabled="disabled"
												value="${ccmPeople.areaGridId.id}" labelName="areaGridId.name"
												labelValue="${ccmPeople.areaGridId.name}" title="区域"
												url="/tree/ccmTree/treeDataArea?type=7&areaid=" cssClass="required"
												allowClear="true" notAllowSelectParent="true"
												cssStyle="width:270px "/>
								<span class="help-inline" id="showGrid"></span>
							</div>

						</div>

					</div>

				</td>

				<td>
					<div>
						<label class="control-label">所属房屋：</label>
							<%--                    <div class="controls" id="newHouse" onmousemove="onclickHouse()">--%>
						<div class="controls">
								<%--  <!--
                                      <sys:treeselect id="roomId" name="roomId.id" value="${ccmPeople.roomId.id}" labelName="roomId.houseBuild" labelValue="${ccmPeople.roomId.houseBuild}"
                                      title="房屋" url="/pop/ccmPopTenant/treeData?type=7" cssClass="" allowClear="true" notAllowSelectParent="true" cssStyle="width: 150px"/>
                                      -->--%>
							<sys:treeselect id="roomId" name="roomId.id"
											value="${ccmPeople.roomId.id}" labelName="roomId.houseBuild"
											labelValue="${ccmPeople.roomId.houseBuild}" title="房屋"
											url="/tree/ccmTree/treeDataAreaByareaGrid?type=9&areaid=" cssClass=""
											allowClear="true" notAllowSelectParent="true"
											cssStyle="width: 270px"/>

						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>户籍门（楼）详址：</label>
						<div class="controls">
							<form:input path="domiciledetail" htmlEscape="false"
								maxlength="80" class="input-xlarge required" />
						</div>
					</div>
				</td>

				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>现住地：</label>
						<div class="controls">
							<form:input path="residence" htmlEscape="false" maxlength="6"
								class="input-xlarge required" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">服务处所：</label>
						<div class="controls">
							<form:input path="servPlace" htmlEscape="false" maxlength="100"
								class="input-xlarge " />
						</div>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>现住门（楼）详址：</label>
						<div class="controls">
							<form:input path="residencedetail" htmlEscape="false"
								maxlength="80" class="input-xlarge required" />
						</div>
					</div>
				</td>


			</tr>
			<tr>
				<td colspan="3">
					<div>
						<label class="control-label">特殊关注类型：</label>
						<div class="controls">
							<form:checkboxes path="specialCareTypeList"
											 items="${fns:getDictList('pop_special_care_type')}"
											 itemLabel="label" itemValue="value" htmlEscape="false" class="" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<div>
						<label class="control-label">备注信息：</label>
						<div class="controls">
							<form:textarea path="remarks" htmlEscape="false" rows="2"
										   maxlength="255" class="input-xlarge " />
						</div>
					</div>
				</td>
			</tr>
		</table>
		<br />

		<table id="person" border="0px" style="border-color: #CCCCCC; border: 0px solid #CCCCCC; width: 100%" >
			<tr><td colspan="6">户籍信息：</td></tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>人户一致标识：</label>
						<div class="controls">
							<form:select path="uniformlogo" class="input-xlarge required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('ccm_huh_cst')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>户号：</label>
						<div class="controls">
							<form:input path="account" htmlEscape="false" maxlength="9" class="input-xlarge required"/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>户主公民身份号码：</label>
						<div class="controls">
							<form:input path="accountidentity" htmlEscape="false" maxlength="18" class="input-xlarge ident1 card required"/>
							<span id="ident1"></span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>户主姓名：</label>
						<div class="controls">
							<form:input path="accountname" htmlEscape="false" maxlength="10" class="input-xlarge required"/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>与户主关系：</label>
						<div class="controls">
							<form:select path="accountrelation" class="input-xlarge required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('sys_ccm_fami_ties')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">户主联系方式：</label>
						<div class="controls">
							<form:input path="accounttelephone" htmlEscape="false" maxlength="50" class="input-xlarge telephone1 phone"/>
							<span id="telephone1"></span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>户籍状态：</label>
						<div class="controls">
							<form:select path="personType" class="input-xlarge required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('ccm_people_person_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">户籍变动时间：</label>
						<div class="controls">
							<input name="personTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
							value="<fmt:formatDate value="${ccmPeople.personTime}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">迁入、迁出原因：</label>
						<div class="controls">
							<form:textarea path="personReason" htmlEscape="false" rows="3" maxlength="1000" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			
		</table>
		
		
		
		
		
		<table id="float" border="0px" style="border-color: #CCCCCC; border: 0px solid #CCCCCC; width: 100%" >
			
			<tr><td colspan="6">流动信息：</td></tr>
			
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>流入原因：</label>
						<div class="controls">
							<form:select path="flowRea" class="input-xlarge required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('ccm_flow_res')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">办证类型：</label>
						<div class="controls">
							<form:select path="accrType" class="input-xlarge required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('ccm_acc_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">证件号码（流入）：</label>
						<div class="controls">
							<form:input path="certNum" htmlEscape="false" maxlength="22" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">登记日期：</label>
						<div class="controls">
							<input name="recoDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
							value="<fmt:formatDate value="${ccmPeople.recoDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">证件到期日期：</label>
						<div class="controls">
							<input name="dueDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
							value="<fmt:formatDate value="${ccmPeople.dueDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>住所类型：</label>
						<div class="controls">
							<form:select path="domiType" class="input-xlarge ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('ccm_dom_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">流出时间：</label>
						<div class="controls">
							<input name="time" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
							value="<fmt:formatDate value="${ccmPeople.time}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">流出原因：</label>
						<div class="controls">
							<form:input path="cause" htmlEscape="false" maxlength="18" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">说明：</label>
						<div class="controls">
							<form:input path="explainelse" htmlEscape="false" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			
		</table>
		
		
		
		
		
		<table id="oversea" border="0px" style="border-color: #CCCCCC; border: 0px solid #CCCCCC;  width: 100%" >
			
			<tr><td colspan="6">境外信息：</td></tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>外文姓：</label>
						<div class="controls">
							<form:input path="esurname" htmlEscape="false" maxlength="40" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>外文名：</label>
						<div class="controls">
							<form:input path="ename" htmlEscape="false" maxlength="40" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>国籍（地区）：</label>
						<div class="controls">
							<form:input path="nationality" htmlEscape="false" maxlength="3" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>证件类型：</label>
						<div class="controls">
							<form:select path="idenCode" class="input-xlarge " items="${fns:getDictList('sys_ccm_org_papers')}" itemLabel="label" itemValue="value" htmlEscape="false">
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>证件号码（境外）：</label>
						<div class="controls">
							<form:input path="idenNum" htmlEscape="false" maxlength="30" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>证件有效期：</label>
						<div class="controls">
							<input name="idenDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
							value="<fmt:formatDate value="${ccmPeople.idenDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>来华目的：</label>
						<div class="controls">
							<form:select path="purpose" class="input-xlarge ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('ccm_cn_aim')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>抵达日期：</label>
						<div class="controls">
							<input name="arriDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
							value="<fmt:formatDate value="${ccmPeople.arriDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">预计离开日期：</label>
						<div class="controls">
							<input name="departDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
							value="<fmt:formatDate value="${ccmPeople.departDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</div>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"></span>接待单位名称：</label>
						<div class="controls">
							<form:input path="receptionCompanyName" htmlEscape="false" maxlength="40" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"></span>接待单位联系方式：</label>
						<div class="controls">
							<form:input path="receptionCompanyPhone" htmlEscape="false" maxlength="40" class="input-xlarge phone"/>
						</div>
					</div>
				</td>
			</tr>
		</table>
		
		
		<table id="unsettle" border="0px" style="border-color: #CCCCCC; border: 0px solid #CCCCCC;  width: 100%" >
			
			<tr><td colspan="6">未落户信息：</td></tr>
			<tr>
				<td>
					<div>
						<label class="control-label">未落户时间：</label>
						<div class="controls">
							<input name="unsettleDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
							value="<fmt:formatDate value="${ccmPeople.unsettleDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">持证种类名称：</label>
						<div class="controls">
							<form:input path="unsettleCardType" htmlEscape="false" maxlength="100" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">持证编号：</label>
						<div class="controls">
							<form:input path="unsettleCardNumber" htmlEscape="false" maxlength="100" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">未落户原因：</label>
						<div class="controls">
							<form:textarea path="unsettleReason" htmlEscape="false" rows="3" maxlength="255" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
		</table>
		
		
		<div class="form-actions">
			<shiro:hasPermission name="pop:ccmWork:edit">
			<input id="btnSubmit" class="btn btn-primary" type="submit" onclick="saveForm()" value="保 存" />&nbsp;</shiro:hasPermission>
			<%--<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>--%>
		</div>
	</form:form>
</div>
</body>
</html>