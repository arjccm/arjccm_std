<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>房屋管理</title>
	<link href="${ctxStatic}/form/css/form.css" rel="stylesheet" />
	<meta name="decorator" content="default"/>
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
			//鱼骨图
			var jsonString = '${documentList}';
            data = JSON.parse(jsonString);  
			$(".fishBone1").fishBone(data, '${ctx}','deal');
			$(".fishBone2").fishBone(data, '${ctx}','read');
			var s = $("#sel").val();
			if(s=="02"){
				$(".selectHidden").show();
			}else{
				$(".selectHidden").hide();
			}
		});
		function sels(){
			var s = $("#sel").val();
			if(s=="02"){
				$(".selectHidden").show();
			}else{
				$(".selectHidden").hide();
			}
		}
		function idenCodeChange() {
			if($("#idenCode").val()==111){
				$("#idenNum").addClass("card");
			}else{
				$("#idenNum").removeClass("card");
			}
		}
	</script>
	<link href="${ctxStatic}/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="back-list clearfix">
	<ul class="nav nav-tabs">
		<li><a style="text-align:center" href="${ctx}/house/ccmHouseBuildmanage/">楼栋列表</a></li>
		<li><a style="text-align:center" href="${ctx}/house/ccmHouseBuildmanage/form">楼栋添加</a></li>
		<li><a style="text-align:center" href="${ctx}/pop/ccmPopTenant/listBuild?buildingId.id=${ccmPopTenant.buildingId.id}&area.id=${ccmPopTenant.area.id}">房屋列表</a></li>
		<li class="active"><a class="nav-head" href="">房屋<shiro:hasPermission name="pop:ccmPopTenant:edit">${not empty ccmPopTenant.id?'修改':'新增'}</shiro:hasPermission><shiro:lacksPermission name="pop:ccmPopTenant:edit">查看</shiro:lacksPermission></a></li>
	<%-- <li><a
		href="${ctx}/log/ccmLogTail/formPro?relevance_id=${ccmPopTenant.id}&relevance_table=ccm_pop_tenant">房屋跟踪信息<shiro:hasPermission
				name="log:ccmLogTail:edit">${not empty ccmLogTail.id?'修改':'添加'}</shiro:hasPermission>
			<shiro:lacksPermission name="log:ccmLogTail:edit">查看</shiro:lacksPermission></a></li> --%>
	</ul>
	<form:form id="inputForm" modelAttribute="ccmPopTenant" action="${ctx}/pop/ccmPopTenant/saveBuild" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="buildingId.id"/>
		<form:hidden path="area.id"/>
		<sys:message content="${message}"/>	
		
		<table border="0px"
			style="border-color: #CCCCCC; border: 0px solid #CCCCCC; padding: 10px; width: 100%;border-top-color: white">
			<tr>
				<td width="50%">
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>房屋编号：</label>
						<div class="controls">
							<form:input path="houseBuild" htmlEscape="false" maxlength="50" class="input-xlarge required"/>

						</div>
					</div>
				</td>
				<td width="50%">
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>门牌号：</label>
						<div class="controls">
							<form:input path="doorNum" htmlEscape="false" maxlength="6" class="input-xlarge required"/>

						</div>
					</div>
					
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>楼门号：</label>
						<div class="controls">
							 <form:input path="buildDoorNum" htmlEscape="false" maxlength="4" class="input-xlarge" style="display:none"/>
							<select id="buildDoorNumSelect" class="input-xlarge required" name="buildDoorNumSelect"></select>
							<%--<form:input path="buildDoorNum" htmlEscape="false" maxlength="6" class="input-xlarge required"/>--%>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>层数：</label>
						<div class="controls">
							<form:input path="floorNum" htmlEscape="false" maxlength="3" class="input-xlarge required digits" type= "number"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">建筑用途：</label>
						<div class="controls">
							<form:select path="housePrup" class="input-xlarge ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('ccm_str_use')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						    </form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">建筑面积(平方米）：</label>
						<div class="controls">
							<form:input path="houseArea" htmlEscape="false" class="input-xlarge number positiveNumber"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">状态：</label>
						<div class="controls">
							<form:select path="houseType" class="input-xlarge"  id="sel"  onchange="sels()" >
								<form:options items="${fns:getDictList('ccm_pop_tenant_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						    </form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>房屋地址：</label>
						<div class="controls">
							<form:input path="housePlace" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>房主姓名：</label>
						<div class="controls">
							<form:input path="houseName" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>房主联系方式：</label>
						<div class="controls">
							<form:input path="houseTl" htmlEscape="false" maxlength="11" class="input-xlarge phone required"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><font color="red">*</font> </span>证件类型：</label>
						<div class="controls">
							<form:select path="idenCode" onchange="idenCodeChange()" class="input-xlarge required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('sys_ccm_org_papers')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						    </form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>证件号码：</label>
						<div class="controls">
							<form:input path="idenNum" htmlEscape="false" maxlength="18" class="input-xlarge required" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><font color="red">*</font> </span>隐患类型：</label>
						<div class="controls">
							<form:select path="hazard" class="input-xlarge required ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('ccm_hidd_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						    </form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><font color="red">*</font> </span>房主现在居住详细地址：</label>
						<div class="controls">
							<form:input path="houseCur" htmlEscape="false" maxlength="200" class="input-xlarge required "/>
						</div>
					</div>
				</td>
			</tr>
			<tr class="selectHidden">
				<td>
					<div>
						<label class="control-label"><font color="red">*</font> </span>承租人姓名：</label>
						<div class="controls">
							<form:input path="tenantName" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><font color="red">*</font> </span>承租人公民身份号码：</label>
						<div class="controls">
							<form:input path="tenantId" htmlEscape="false" maxlength="18" class="input-xlarge required"/>
						</div>
					</div>
				</td>
			</tr>
			<tr class="selectHidden">
				<td>
					<div>
						<label class="control-label"><font color="red">*</font> </span>承租人联系方式：</label>
						<div class="controls">
							<form:input path="tenantTl" htmlEscape="false" maxlength="50" class="input-xlarge phone required"/>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><font color="red">*</font> </span>出租用途：</label>
						<div class="controls">
							<form:select path="rentPur" class="input-xlarge required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('ccm_let_use')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						    </form:select>
						</div>
					</div>
				</td>
			</tr>

			<%--<c:if test="${not empty ccmPopTenant.id}">
			<shiro:hasPermission name="pop:ccmPopTenant:edit">
				<tr>
					<td>
						<div>
							<label class="control-label">中心点：</label>
							<div class="controls">
								<form:input path="areaPoint" readonly="true" htmlEscape="false" maxlength="40" class="input-xlarge "/>
							</div>
						</div>
					</td>
					<td>
						<div>
							<label class="control-label">区域图：</label>
							<div class="controls">
								<form:input path="areaMap" readonly="true" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
							</div>
						</div>
					</td>
				</tr>
			</shiro:hasPermission>
			</c:if>--%>

			<tr>
				<td>
					<div>
						<label class="control-label">所属楼栋：</label>
						<div class="controls">
							${ccmPopTenant.buildingId.buildname}
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">图标：</label>
						<div class="controls">
							<sys:iconselect id="image" name="image" value="${ccmPopTenant.image}"/>
						</div>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div>
						<label class="control-label">房屋产权类型：</label>
						<div class="controls">
							<form:select path="propertyType" class="input-xlarge ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('ccm_PopTenant_propertyType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">年限：</label>
						<div class="controls">
						<form:select path="buildingYears" class="input-xlarge ">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('ccm_PopTenant_buildingYears')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						</div>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div>
						<label class="control-label">建筑类型：</label>
						<div class="controls">
						<form:select path="buildingType" class="input-xlarge ">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('ccm_PopTenant_buildingType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">备注信息：</label>
						<div class="controls">
							<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xlarge " />
						</div>
					</div>
				</td>
			</tr>
		</table>
		
		<%-- <table border="1px"
			style="border-color: #CCCCCC; border: 1px solid #CCCCCC; padding: 10px; width: 100%;">
			
          <%@include file="/WEB-INF/views/include/ccmlog.jsp" %>
		</table> --%>
		<div class="form-actions">
			<shiro:hasPermission name="pop:ccmPopTenant:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
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
	<script type="text/javascript">
		$(function(){
			var buildDoorNumVal=$('#buildDoorNum').val();
			$.getJSON("${ctx}/house/ccmHouseBuildmanage/getBuildentrance?id=${ccmPopTenant.buildingId.id}",function(data){
				var html='<option value="" class="required">请选择</option>';
				for(var i in data){
					html+='<option value="'+data[i].entranceNum+'" class="required">'+data[i].entranceName+'</option>'
				}
				$('#buildDoorNumSelect').html(html);
				if(buildDoorNumVal != ''){
					$("#buildDoorNumSelect").val(buildDoorNumVal).select2()
				}else{
					$("#buildDoorNumSelect").val('').select2()
				}
			})
			$('#buildDoorNumSelect').change(function(){
				var buildDoorNumSelecVal= $('#buildDoorNumSelect').val();
				$('#buildDoorNum').val(buildDoorNumSelecVal);
			})
		})
	</script>
</div>
</body>
</html>