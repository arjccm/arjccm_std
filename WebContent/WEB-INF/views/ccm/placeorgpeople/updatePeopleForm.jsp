<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>实有人口管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript"
	src="${ctxStatic}/ccm/pop/ccmPeopleForm.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/ccm/validator/validator.js"></script>
<script type="text/javascript" src="${ctxStatic}/ccm/validator.js"></script>
<!-- 鱼骨图 -->
<link rel="stylesheet" href="${ctxStatic}/ccm/event/css/fishBonePop.css" />
<script type="text/javascript"
	src="${ctxStatic}/ccm/event/js/fishBonePop.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/ccm/event/js/jquery.SuperSlide.2.1.1.js"></script>
<style type="text/css">
.pad {
	padding: 5px;
	padding-left: 10px;
}

#person {
	display: none;
}

#float {
	display: none;
}

#oversea {
	display: none;
}

#unsettle {
	display: none;
}

.input-xlarge {
	width: 200px;
}

.select2-container.input-xlarge {
	width: 215px;
}

.input-medium.Wdate {
	width: 200px;
}

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
#mark {
	/* display: none; */
}
.markli {
	background-color: #ece9e9c9;
	padding: 2px 10px;
	border-radius: 15px;
	margin-left: 10px;
}

.mark-add {
	padding: 2px 0px;
	margin-left: 3px;
}

li .mark-icon {
	cursor: pointer;
	font-size: 16px;
	position: relative;
	top: 1.5px;
	left: 2px;
}

li .mark-icon:HOVER {
	font-size: 18px;
}

.mark td ul {
	margin: 0px;
}

.mark td .mark-add {
	position: relative;
}

.hide1,.hide2{
	display: none
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		//关闭弹框事件
		$('#btnCancel').click(function() {
			parent.layer.close(parent.layerIndex);
		})
		//获取url中的参数
		function getUrlParam(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
			var r = window.location.search.substr(1).match(reg);  //匹配目标参数
			if (r != null) return unescape(r[2]); return null; //返回参数值
		};
		//跟踪信息
		var hide1=getUrlParam('hide1');
		var hide2=getUrlParam('hide2');
		if(hide1!=null&&hide2!=null){
			if(hide1=="true"){
				$('.hide1').show();
				$('.form-actions').hide();
				$('.help-inline').hide();
				$('.input-xlarge').attr("readonly","readonly");
				$('.displayedbuttons').attr("disabled","disabled");
			}
			if(hide2=="true"){
				$('.hide2').show();

			}
			if(hide1=="add"){
				$('.hide1').show();
			}
		}else{
			$('.hide1').show();
			$('.hide2').show();
		}
		$("td").css({
			"padding" : "10px"
		});
		$("td").css({
			"border" : "0px dashed #CCCCCC"
		});
		// $("#areaComIdId").on("change",function (){
		// 	alert();
		// })
		$("#areaComIdName").change(function (){

			alert("1");
		});
	
		//跟踪记录
		var jsonString = '${documentList}';
		data = JSON.parse(jsonString);
		$(".fishBone1").fishBone(data, '${ctx}', 'deal');
		$(".fishBone2").fishBone(data, '${ctx}', 'read');	
		var marknum=$(".ulz li .znul").length+$(".ulz li .zzul").length;
		if(marknum>0){
			$(".mark").show(); 
		}else{
			$(".mark").hide();  
		}
		popPopList();
		vehilePhoneList();
		vehileVehileList();
		vehileWebList();
	});

	/*function initAge(data) {
		// console.log("1111")
		var date=new Date(data);
		var time=new Date().getTime()-date.getTime();
		var age=time/1000/60/60/24/365;
		age=parseInt(age);
		if(time<0 || age>150 ){
			//时间不合法
			$("#tshi").show()
		}else{
			$("#tshi").hide()
		}
	}*/

	
	function saveForm(){
		var areaComIdId = $("#areaComIdId").val();
		var areaGridIdId = $("#areaGridIdId").val();
		var html1 = '<label for="" class="error">必选字段 <label>';
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
	
	/* 人际关系遍历 */
	   function popPopList() {
		   $.post("${ctx}/cpp/cppPopPop/ajaxlist",{						  										
				"idCard":'${ccmPeople.ident}'
				}, function(data) {
					var $jsonlxfs = $(".mark-rjgx");
					$jsonlxfs.empty();
					if(!jQuery.isEmptyObject(data)){
					$.each(data.object1, function(infoIndex, info) {
						if('${ccmPeople.ident}'==info.idCard1){
							var name = "";
							if(info.name2==null||info.name2==""){
								name = info.otherName;
							}else{
								name = info.name2;
							}
							$jsonlxfs.append('<li class="markli" style="background-color:#6495ED;color:#FFF;" id="li"'+info.id+'>'+info.type+'-'+name+'<i title="编辑" onclick="markPopEidt(\''+info.id+'\')" '+
								'class="iconfont icon-caozuotubiao-xiugai mark-icon"></i></li>');
						}else{
							$jsonlxfs.append('<li class="markli" style="background-color:#6495ED;color:#FFF;" id="li"'+info.id+'>'+info.type+'-'+info.name1+'<i title="编辑" onclick="markPopEidt(\''+info.id+'\')" '+
								'class="iconfont icon-caozuotubiao-xiugai mark-icon"></i></li>');
						}	
        	          });
					}
					$jsonlxfs.append('<li class="mark-add "><i class="iconfont icon-caozuotubiao-tianjiachuli mark-icon" onclick="markPopAdd()"  title="添加"></i></li>')
			   });
	   }
	   /* 人际关系添加 */
	   function markPopAdd() {
		   parent.LayerDialog2('${ctx}/cpp/cppPopPop/form?idCard=${ccmPeople.ident}', '添加人际关系', '900px', '340px');
	   }
	   /* 人际关系更新 */
	  function markPopEidt(id) {
		   parent.LayerDialog2('${ctx}/cpp/cppPopPop/form?idCard=${ccmPeople.ident}&id='+id, '编辑人际关系', '450px', '340px');
	   }
	   /* 联系方式遍历 */
	   function vehilePhoneList() {
		   $.post("${ctx}/cpp/cppPopVehile/ajaxlist",{						  										
				"idCard":'${ccmPeople.ident}',
				"type":'02'
				}, function(data) {
					var $jsonlxfs = $(".mark-lxfs");
					$jsonlxfs.empty();
					if(!jQuery.isEmptyObject(data)){
					$.each(data.object1, function(infoIndex, info) {
						$jsonlxfs.append('<li class="markli" style="background-color:#6495ED;color:#FFF;" id="li"'+info.id+'>'+info.subType+'-'+info.textName+'<i title="编辑" onclick="markPhoneEidt(\''+info.id+'\')" '+
									'class="iconfont icon-caozuotubiao-xiugai mark-icon"></i></li>');
        	          });
					}
					$jsonlxfs.append('<li class="mark-add "><i class="iconfont icon-caozuotubiao-tianjiachuli mark-icon" onclick="markPhoneAdd()"  title="添加"></i></li>')
			   });
	  }
	   /* 联系方式添加 */
	   function markPhoneAdd() {
		   parent.LayerDialog2('${ctx}/cpp/cppPopVehile/form?idCard=${ccmPeople.ident}&type=02', '添加联系方式', '450px', '250px');
	   }
	   /* 联系方式更新 */
	  function markPhoneEidt(id) {
		   parent.LayerDialog2('${ctx}/cpp/cppPopVehile/form?idCard=${ccmPeople.ident}&id='+id, '编辑联系方式', '450px', '250px');
	   }
	   
	  /* 使用车辆遍历 */
	   function vehileVehileList() {
		   $.post("${ctx}/cpp/cppPopVehile/ajaxlist",{						  										
				"idCard":'${ccmPeople.ident}',
				"type":'01'
				}, function(data) {
					var $jsonvehile = $(".mark-vehile");
					$jsonvehile.empty();
					if(!jQuery.isEmptyObject(data)){
					$.each(data.object1, function(infoIndex, info) {
						$jsonvehile.append('<li class="markli" style="background-color:#6495ED;color:#FFF;" id="li"'+info.id+'>'+info.subType+'-'+info.textName+'<i title="编辑" onclick="markVehileEidt(\''+info.id+'\')" '+
									'class="iconfont icon-caozuotubiao-xiugai mark-icon"></i></span></li>');
       	          });
					}
					$jsonvehile.append('<li class="mark-add "><i class="iconfont icon-caozuotubiao-tianjiachuli mark-icon" onclick="markVehileAdd()"  title="添加"></i></li>')
			   });
	  }
	   /* 使用车辆添加 */
	   function markVehileAdd() {
		   parent.LayerDialog2('${ctx}/cpp/cppPopVehile/form?idCard=${ccmPeople.ident}&type=01', '添加使用车辆', '450px', '250px');
	   }
	   /* 使用车辆更新 */
	  function markVehileEidt(id) {
		   parent.LayerDialog2('${ctx}/cpp/cppPopVehile/form?idCard=${ccmPeople.ident}&id='+id, '编辑使用车辆', '450px', '250px');
	   }
	   
	  /* 网络账号遍历 */
	   function vehileWebList() {
		   $.post("${ctx}/cpp/cppPopVehile/ajaxlist",{						  										
				"idCard":'${ccmPeople.ident}',
				"type":'03'
				}, function(data) {
					var $jsonweb = $(".mark-web");
					$jsonweb.empty();
					if(!jQuery.isEmptyObject(data)){
					$.each(data.object1, function(infoIndex, info) {
						$jsonweb.append('<li class="markli" style="background-color:#6495ED;color:#FFF;" id="li"'+info.id+'>'+info.subType+'-'+info.textName+'<i title="编辑" onclick="markWebEidt(\''+info.id+'\')" '+
									'class="iconfont icon-caozuotubiao-xiugai mark-icon"></i></li>');
       	          });
					}
					$jsonweb.append('<li class="mark-add "><i class="iconfont icon-caozuotubiao-tianjiachuli mark-icon" onclick="markWebAdd()"  title="添加"></i></li>')
			   });
	  }
	   /*网络账号添加 */
	   function markWebAdd() {
		   parent.LayerDialog2('${ctx}/cpp/cppPopVehile/form?idCard=${ccmPeople.ident}&type=03', '添加网络账号', '450px', '260px');
	   }
	   /* 网络账号更新 */
	  function markWebEidt(id) {
		   parent.LayerDialog2('${ctx}/cpp/cppPopVehile/form?idCard=${ccmPeople.ident}&id='+id, '编辑网络账号', '450px', '260px');
	   }
	  function isNotKym(){
		  top.$.jBox.tip("请选择年龄在13到19岁之间的青少年！");
		  return false;
	   }
</script>
	<link href="${ctxStatic}/bootstrap/2.3.1/css_input/input_Custom.css" type="text/css" rel="stylesheet">

</head>
<body>
	<div class="back"></div>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/placeorgpeople/ccmPlaceOrgPeople/list?placeOrgId=${ccmPlaceOrgPeople.placeOrgId}&type=${ccmPlaceOrgPeople.type}">现有人员列表</a></li>
		<li class="active"><a href="${ctx}/placeorgpeople/ccmPlaceOrgPeople/toUpdatePeople?peopleId=${ccmPlaceOrgPeople.peopleId}">修改从业人员列表</a></li>
	</ul>
	<form:form id="inputForm"  modelAttribute="ccmPeople"
		action="${ctx}/placeorgpeople/ccmPlaceOrgPeople/saveUpdatePeople?placeid=${ccmPlaceOrgPeople.placeOrgId}&placetype=${ccmPlaceOrgPeople.type}" method="post"
		class="form-horizontal hide1">
		<form:hidden path="id" />
		<sys:message content="${message}" />

		<table id="typeid" border="0px"
			style="border-color: #CCCCCC; border: 0px solid #CCCCCC; padding: 10px; width: 100%">
			<h4 id="basicid" class="color-bg6" >基本信息</h4>
			<tr>
				<td style="width: 33%">
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font></span>人口类型：</label>
						<div class="controls">
							<form:select path="type" class="input-xlarge required" id="sel"
								onchange="sels()">
								<form:options items="${fns:getDictList('sys_ccm_people')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td style="width: 33%">
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font></span>性别：</label>
						<div class="controls">
							<form:radiobuttons path="sex" items="${fns:getDictList('sex')}"
								itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
						</div>
					</div>
				</td>
                <td style="width: 33%">

                </td>
			</tr>

			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font></span> 姓名：</label>
						<div class="controls">
							<form:input path="name" htmlEscape="false" maxlength="50"
								class="input-xlarge required" />
							</span>
						</div>
					</div>
				</td>
                <td>
                    <div>
                        <label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>出生日期：</label>
                        <div class="controls">
                            <input name="birthday" type="text" readonly="readonly"
                                   maxlength="20"   class="input-medium Wdate required"
                                   value="<fmt:formatDate value="${ccmPeople.birthday}" pattern="yyyy-MM-dd"/>"
                                   onclick="WdatePicker({minDate:'{%y-150}-%M-%d',maxDate: '%y-%M-%d',dateFmt:'yyyy-MM-dd',isShowClear:false});" />
                        </div>
                    </div>
                </td>
				<td>
					<div>
						<label class="control-label">机顶盒SN号：</label>
						<div class="controls">
							<input name="more1" class="input-xlarge" type="text"
								maxlength="50" class="input-medium " value="${ccmPeople.more1}" />
						</div>
					</div>

				</td>
			</tr>
            <tr><td >
                <div>
                    <label class="control-label">照片：</label>
                    <div class="controls">
                        <form:hidden id="images" path="images" htmlEscape="false"
                                     maxlength="255" class="input-xlarge" />
                        <sys:ckfinder input="images" type="images"
                                      uploadPath="/photo/ShiYouRenKou" selectMultiple="false"
                                      maxWidth="240" maxHeight="360" />
                    </div>
                </div>
            </td></tr>
			<tr>
                <td>
                    <div>
                        <label class="control-label">  <span class="help-inline"><font color="red" >*</font> </span>民族：</label>
                        <div class="controls">
                            <form:select path="nation" class="input-xlarge required">
                                <form:options items="${fns:getDictList('sys_volk')}"
                                              itemLabel="label" itemValue="value" htmlEscape="false" />
                            </form:select>
                        </div>
                    </div>
                </td>
				<td>
					<div>
						<label class="control-label"><span id="ident0"></span><span class="help-inline"><font color="red" >*</font></span>公民身份号码：</label>
						<div class="controls">
							<form:input path="ident" htmlEscape="false" maxlength="18"
								class="input-xlarge required ident0 card" />
						</div>
					</div>
				</td>
                <td>
                    <div>
                        <label class="control-label"><span class="help-inline"><font
                                color="red" >*</font> </span>联系方式：</label>
                        <div class="controls">
                            <form:input path="telephone" htmlEscape="false" maxlength="18"
                                        class="input-xlarge telephone0 phone required" />
                            <span id="telephone0"></span>
                        </div>
                    </div>
                </td>
			</tr>

			<tr>

				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>籍贯：</label>
						<div class="controls">
							<form:input path="censu" htmlEscape="false" maxlength="6"
								class="input-xlarge required" />

						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>婚姻状况：</label>
						<div class="controls">
							<form:select path="marriage" class="input-xlarge required">
								<form:options items="${fns:getDictList('sys_ccm_mari_stat')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>政治面貌：</label>
						<div class="controls">
							<form:select path="politics" class="input-xlarge required">
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
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>学历：</label>
						<div class="controls">
							<form:select path="education" class="input-xlarge required">
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
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>职业类别：</label>
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
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>职业：</label>
						<div class="controls">
							<form:input path="profession" htmlEscape="false" maxlength="30"
								class="input-xlarge required" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">是否公职人员：</label>
						<div class="controls">
							<form:select path="isPublicServants" class="input-xlarge ">
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
                        <label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>户籍地：</label>
                        <div class="controls">
                            <form:input path="domicile" htmlEscape="false" maxlength="6"
                                        class="input-xlarge required" />
                        </div>
                    </div>
                </td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font></span>是否常住：</label>
						<div class="controls">
							<form:radiobuttons path="isPermanent"
								items="${fns:getDictList('yes_no')}" itemLabel="label"
								itemValue="value" htmlEscape="false" class="required"/>

						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font> </span>是否重点关注人员：</label>
						<div class="controls">
							<form:radiobuttons path="focuPers"
								items="${fns:getDictList('yes_no')}" itemLabel="label"
								itemValue="value" htmlEscape="false" class="required" />

						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>所属社区：</label>
						<div class="controls" onmouseout="onclickNet()">
							<!--
							<sys:treeselect id="areaComId" name="areaComId.id" value="${ccmPeople.areaComId.id}" labelName="areaComId.name" labelValue="${ccmPeople.areaComId.name}"
							title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="false" cssStyle="width: 150px"/>
							-->
							<sys:treeselect id="areaComId"  name="areaComId.id"
								value="${ccmPeople.areaComId.id}"  labelName="areaComId.name"
								labelValue="${ccmPeople.areaComId.name}" title="区域"
								url="/tree/ccmTree/treeDataArea?type=6" cssClass="required"
								allowClear="true" notAllowSelectParent="true"
								cssStyle="width: 270px" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red">*</font></span>所属网格：</label>
						<div class="controls">
							<div class="help-inline" id="newNet" onmouseout=""
								onmousemove="onclickNet()">
								<sys:treeselect id="areaGridId" name="areaGridId.id"
									value="${ccmPeople.areaGridId.id}" labelName="areaGridId.name"
									labelValue="${ccmPeople.areaGridId.name}" title="区域"
									url="/tree/ccmTree/treeDataArea?type=7&areaid=" cssClass=""
									allowClear="true" notAllowSelectParent="true"
									cssStyle="width:270px " />
								<span class="help-inline"><font color="red" id="showGrid">*</font></span>
							</div>

						</div>
						
					</div>
					
				</td>
				<td>
					<div>
						<label class="control-label">所属房屋：</label>
						<div class="controls" id="newHouse" onmousemove="onclickHouse()">
							<!--  
							<sys:treeselect id="roomId" name="roomId.id" value="${ccmPeople.roomId.id}" labelName="roomId.houseBuild" labelValue="${ccmPeople.roomId.houseBuild}"
							title="房屋" url="/pop/ccmPopTenant/treeData?type=7" cssClass="" allowClear="true" notAllowSelectParent="true" cssStyle="width: 150px"/>
							-->
							<sys:treeselect id="roomId" name="roomId.id"
								value="${ccmPeople.roomId.id}" labelName="roomId.houseBuild"
								labelValue="${ccmPeople.roomId.houseBuild}" title="房屋"
								url="/tree/ccmTree/treeDataArea?type=9&areaid=" cssClass=""
								allowClear="true" notAllowSelectParent="true"
								cssStyle="width: 270px" />

						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>户籍门（楼）详址：</label>
						<div class="controls">
							<form:input path="domiciledetail" htmlEscape="false"
								maxlength="80" class="input-xlarge required" />
						</div>
					</div>
				</td>

			</tr>
            <tr>
                <td colspan="3" >
                    <div>
                        <label class="control-label">特殊关注类型：</label>
                        <div class="controls" >
                            <form:checkboxes path="specialCareTypeList" cssStyle="padding-right: 10px"
                                             items="${fns:getDictList('pop_special_care_type')}"
                                             itemLabel="label" itemValue="value" htmlEscape="false" class="" />
                        </div>
                    </div>
                </td>
                <td></td>
                <td></td>
            </tr>

			<tr>
                <td>
                    <div>
                        <label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>现住地：</label>
                        <div class="controls">
                            <form:input path="residence" htmlEscape="false" maxlength="6"
                                        class="input-xlarge required" />
                        </div>
                    </div>
                </td>
				<td >
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>现住门（楼）详址：</label>
						<div class="controls">
							<form:input path="residencedetail" htmlEscape="false"
								maxlength="80" class="input-xlarge required" />

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
				<td>
					<div>
						<label class="control-label">单位类别：</label>
						<div class="controls">
							<form:select path="unitCategory" class="input-xlarge ">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('ccm_buss_cate')}" itemLabel="label"
									itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">特种行业从业类型：</label>
						<div class="controls">
							<form:select path="practitioners" class="input-xlarge">
								<form:options items="${fns:getDictList('ccm_people_special_practitioners_type')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
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
		<c:if test="${not empty ccmPeople.id}">
			<shiro:hasPermission name="pop:ccmPeople:edit">
				<ul class="nav nav-pills ulz">
					<li><h4 id="zd1">
						<i class="icon-tags"></i>特殊人群标记：
					</h4>
					<li><c:if test="${ccmPeople.isRelease==1}">
					<li><a class="znul"
						   onclick="parent.LayerDialog('${ctx}/house/ccmHouseRelease/specialform?id=${ccmPeople.id}', '安置帮教人员标记', '1200px', '700px')">安置帮教人员标记</a></li>
					</c:if> <c:if test="${ccmPeople.isRectification==1}">
					<li><a class="znul"
						   onclick="parent.LayerDialog('${ctx}/house/ccmHouseRectification/specialform?id=${ccmPeople.id}', '社区矫正人员标记', '1200px', '900px')">社区矫正人员标记</a></li>
				</c:if> <c:if test="${ccmPeople.isPsychogeny==1}">
					<li><a class="znul"
						   onclick="parent.LayerDialog('${ctx}/house/ccmHousePsychogeny/specialform?id=${ccmPeople.id}', '肇事肇祸等严重精神障碍患者', '1200px', '900px')">肇事肇祸等严重精神障碍患者</a></li>
				</c:if> <c:if test="${ccmPeople.isAids==1}">
					<li><a class="znul"
						   onclick="parent.LayerDialog('${ctx}/house/ccmHouseAids/specialform?id=${ccmPeople.id}', '艾滋病危险人员标记', '1200px', '900px')">艾滋病危险人员标记</a></li>
				</c:if> <c:if test="${ccmPeople.isDangerous==1}">
					<li><a class="znul"
						   onclick="parent.LayerDialog('${ctx}/house/ccmHouseDangerous/specialform?id=${ccmPeople.id}', '危险品从业人员标记', '1200px', '900px')">危险品从业人员标记</a></li>
				</c:if> <c:if test="${ccmPeople.isDrugs==1}">
					<li><a class="znul"
						   onclick="parent.LayerDialog('${ctx}/pop/ccmPeople/specialform?id=${ccmPeople.id}', '吸毒人员标记', '1200px', '900px')">吸毒人员标记</a></li>
				</c:if> <c:if test="${ccmPeople.isVisit==1}">
					<li><a class="znul"
						   onclick="parent.LayerDialog('${ctx}/house/ccmHousePetition/specialform?id=${ccmPeople.id}', '重点上访人员标记', '1200px', '900px')">重点上访人员标记</a></li>
				</c:if> <c:if test="${ccmPeople.isHeresy==1}">
					<li><a class="znul"
						   onclick="parent.LayerDialog('${ctx}/house/ccmHouseHeresy/specialform?id=${ccmPeople.id}', '涉教人员标记', '1200px', '900px')">涉教人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isHarmNational==1}">
					<li><a class="znul"
							onclick="parent.LayerDialog('${ctx}/house/ccmHarmNationalSecurity/specialform?id=${ccmPeople.id}', '危害国家安全活动嫌疑人员信息标记', '1200px', '900px')">危害国家安全活动嫌疑人员信息标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isCriminalOffense==1}">
					<li><a class="znul"
							onclick="parent.LayerDialog('${ctx}/house/ccmSeriousCriminalOffense/specialform?id=${ccmPeople.id}', '严重刑事犯罪活动嫌疑人员标记', '1200px', '900px')">严重刑事犯罪活动嫌疑人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isDispute==1}">
					<li><a class="znul"
							onclick="parent.LayerDialog('${ctx}/house/ccmHouseDispute/specialform?id=${ccmPeople.id}', '闹事行凶报复嫌疑人员标记', '1200px', '900px')">闹事行凶报复嫌疑人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isDeliberatelyIllegal==1}">
					<li><a class="znul"
							onclick="parent.LayerDialog('${ctx}/house/ccmHouseDeliberatelyIllegal/specialform?id=${ccmPeople.id}', '故意违法人员标记', '1200px', '900px')">故意违法人员标记</a></li>
				</c:if><c:if
						test="${ccmPeople.isRelease==0||ccmPeople.isRelease==null||ccmPeople.isRelease==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/house/ccmHouseRelease/specialform?id=${ccmPeople.id}', '安置帮教人员标记', '1200px', '900px')">安置帮教人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isRectification==0||ccmPeople.isRectification==null||ccmPeople.isRectification==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/house/ccmHouseRectification/specialform?id=${ccmPeople.id}', '社区矫正人员标记', '1200px', '900px')">社区矫正人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isPsychogeny==0||ccmPeople.isPsychogeny==null||ccmPeople.isPsychogeny==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/house/ccmHousePsychogeny/specialform?id=${ccmPeople.id}', '肇事肇祸等严重精神障碍患', '1200px', '900px')">肇事肇祸等严重精神障碍患者</a></li>
				</c:if> <c:if
						test="${ccmPeople.isAids==0||ccmPeople.isAids==null||ccmPeople.isAids==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/house/ccmHouseAids/specialform?id=${ccmPeople.id}', '艾滋病危险人员标记', '1200px', '900px')">艾滋病危险人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isDangerous==0||ccmPeople.isDangerous==null||ccmPeople.isDangerous==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/house/ccmHouseDangerous/specialform?id=${ccmPeople.id}', '危险品从业人员标记', '1200px', '900px')">危险品从业人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isDrugs==0||ccmPeople.isDrugs==null||ccmPeople.isDrugs==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/pop/ccmPeople/specialform?id=${ccmPeople.id}', '吸毒人员标记', '1200px', '900px')">吸毒人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isVisit==0||ccmPeople.isVisit==null||ccmPeople.isVisit==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/house/ccmHousePetition/specialform?id=${ccmPeople.id}', '重点上访人员标记', '1200px', '900px')">重点上访人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isHeresy==0||ccmPeople.isHeresy==null||ccmPeople.isHeresy==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/house/ccmHouseHeresy/specialform?id=${ccmPeople.id}', '涉教人员标记', '1200px', '900px')">涉教人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isHarmNational==0||ccmPeople.isHarmNational==null||ccmPeople.isHarmNational==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/house/ccmHarmNationalSecurity/specialform?id=${ccmPeople.id}', '危害国家安全活动嫌疑人员信息标记', '1200px', '900px')">危害国家安全活动嫌疑人员信息标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isCriminalOffense==0||ccmPeople.isCriminalOffense==null||ccmPeople.isCriminalOffense==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/house/ccmSeriousCriminalOffense/specialform?id=${ccmPeople.id}', '严重刑事犯罪活动嫌疑人员标记', '1200px', '900px')">严重刑事犯罪活动嫌疑人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isDispute==0||ccmPeople.isDispute==null||ccmPeople.isDispute==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/house/ccmHouseDispute/specialform?id=${ccmPeople.id}', '闹事行凶报复嫌疑人员标记', '1200px', '900px')">闹事行凶报复嫌疑人员标记</a></li>
				</c:if> <c:if
						test="${ccmPeople.isDeliberatelyIllegal==0||ccmPeople.isDeliberatelyIllegal==null||ccmPeople.isDeliberatelyIllegal==''}">
					<li><a
							onclick="parent.LayerDialog('${ctx}/house/ccmHouseDeliberatelyIllegal/specialform?id=${ccmPeople.id}', '故意违法人员标记', '1200px', '900px')">故意违法人员标记</a></li>
				</c:if>
				</ul>

				<ul class="nav nav-pills ulz">
					<li>
						<h4 id="zd3">
							<i class="icon-tags"></i>重点人群标记：
						</h4>
					<li>
					<c:if test="${ccmPeople.isKym==1}">
						<li>
							<a class="gzul" onclick="parent.LayerDialog('${ctx}/house/ccmHouseKym/specialform?id=${ccmPeople.id}', '重点青少年标记', '1200px', '700px')">重点青少年标记</a>
						</li>
					</c:if> 
					<c:if test="${ccmPeople.isKym==0||ccmPeople.isKym==null||ccmPeople.isKym==''}">
						<li>
							<a onclick="parent.LayerDialog('${ctx}/house/ccmHouseKym/specialform?id=${ccmPeople.id}', '重点青少年标记', '1200px', '700px')">重点青少年标记</a>
						</li>
					</c:if>
					<c:if test="${ccmPeople.isKym==2}">
						<li>
							<a href="javascript:void(0);" onclick="isNotKym()">重点青少年标记</a>
						</li>
					</c:if> 
					<c:if test="${ccmPeople.isBehind==1}">
						<li>
							<a class="gzul" onclick="parent.LayerDialog('${ctx}/pop/ccmPopBehind/specialform?id=${ccmPeople.id}', '留守人员标记', '1200px', '900px')">留守人员标记</a>
						</li>
					</c:if>
					<c:if test="${ccmPeople.isBehind==0||ccmPeople.isBehind==null||ccmPeople.isBehind==''}">
						<li>
							<a onclick="parent.LayerDialog('${ctx}/pop/ccmPopBehind/specialform?id=${ccmPeople.id}', '留守人员标记', '1200px', '900px')">留守人员标记</a>
						</li>
					</c:if>
				</ul>
			</shiro:hasPermission>
		</c:if>

		<%-- <c:if test="${not empty ccmPeople.id}">
		<br>
		<h4>特殊标记信息：</h4>
		<table id="mark" border="1px" style="border-color: #CCCCCC; border: 1px solid #CCCCCC;  width: 100%" >
			<tr>
				<td>
					<div>
						<label class="control-label">是否安置帮教：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isRelease, 'yes_no', '否')}
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">是否社区矫正：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isRectification, 'yes_no', '否')}
						</div>
					</div>
				</td>
			
				<td>
					<div>
						<label class="control-label">是否肇事肇祸等严重精神障碍：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isPsychogeny, 'yes_no', '否')}
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">是否吸毒：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isDrugs, 'yes_no', '否')}
						</div>
					</div>
				</td>
			</tr>
			<tr>
					<td>
					<div>
						<label class="control-label">是否艾滋病危险人员：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isAids, 'yes_no', '否')}
						</div>
					</div>
				</td>
				
				<td>
					<div>
						<label class="control-label">是否重点上访：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isVisit, 'yes_no', '否')}
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">是否涉教：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isHeresy, 'yes_no', '否')}
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">是否危险品从业：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isDangerous, 'yes_no', '否')}
						</div>
					</div>
				</td>
				</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">是否留守：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isBehind, 'yes_no', '否')}
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">是否重点青少年：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isKym, 'yes_no', '否')}
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">是否危害国家安全嫌疑：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isHarmNational, 'yes_no', '否')}
						</div>
					</div>
				</td>				
				<td>
					<div>
						<label class="control-label">是否严重刑事犯罪嫌疑：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isCriminalOffense, 'yes_no', '否')}
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">是否故意犯罪释放人员：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isDeliberatelyIllegal, 'yes_no', '否')}
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">是否存在矛盾纠纷：</label>
						<div class="controls">
							${fns:getDictLabel(ccmPeople.isDispute, 'yes_no', '否')}
						</div>
					</div>
				</td>
				<td>
					
				</td>
				<td>
					
				</td>				
			</tr>
		</table>
		
		</c:if> --%>
		


		<%--<br/>--%>
		<c:if test="${not empty ccmPeople.id}">
			<h4>实有人口人际关系信息：</h4>
			<table id="mark"  border="0px"
				style="border-color: #CCCCCC; border: 0px solid #CCCCCC; width: 100%;">
				<tr>
					<td>
						<div>
							<label class="control-label">人际关系：</label>
							<div class="controls">
								<ul class="nav nav-pills mark-rjgx">
									
								</ul>
							</div>
						</div>
					</td>

				</tr>
				<tr>
					<td>
						<div>
							<label class="control-label">联系方式：</label>
							<div class="controls">
								<ul class="nav nav-pills mark-lxfs Vehile">
									
								</ul>
							</div>
						</div>
					</td>

				</tr>
				<tr>
					<td>
						<div>
							<label class="control-label">网络身份：</label>
							<div class="controls">
								<ul class="nav nav-pills mark-web Vehile">
									
								</ul>
							</div>
						</div>
					</td>

				</tr>
				<tr>
					<td>
						<div>
							<label class="control-label">使用车辆：</label>
							<div class="controls">
								<ul class="nav nav-pills mark-vehile Vehile">

								</ul>
							</div>
						</div>
					</td>

				</tr>
			</table>
		<br />
		</c:if>
		<h4 id="otherid" class="color-bg6">户籍信息</h4>

		<table id="person" border="0px"
			style="border-color: #CCCCCC; border: 0px solid #CCCCCC; width: 100%">

			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>人户一致标识：</label>
						<div class="controls">
							<form:select path="uniformlogo" class="input-xlarge required">
								<form:options items="${fns:getDictList('ccm_huh_cst')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>户号：</label>
						<div class="controls">
							<form:input path="account" htmlEscape="false" maxlength="9"
								class="input-xlarge required" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>户主公民身份号码：</label>
						<div class="controls">
							<form:input path="accountidentity" htmlEscape="false"
								maxlength="18" class="input-xlarge required ident1 card" />
							<span id="ident1"></span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>户主姓名：</label>
						<div class="controls">
							<form:input path="accountname" htmlEscape="false" maxlength="10"
								class="input-xlarge required" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>与户主关系：</label>
						<div class="controls">
							<form:select path="accountrelation" class="input-xlarge required">
								<form:options items="${fns:getDictList('sys_ccm_fami_ties')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">户主联系方式：</label>
						<div class="controls">
							<form:input path="accounttelephone" htmlEscape="false"
								maxlength="50" class="input-xlarge telephone1 phone " />
							<span id="telephone1"></span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">户籍状态：</label>
						<div class="controls">
							<form:select path="personType" class="input-xlarge ">
								<form:option value="" label="" />
								<form:options
									items="${fns:getDictList('ccm_people_person_type')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">户籍变动时间：</label>
						<div class="controls">
							<input name="personTime" type="text" readonly="readonly"
								maxlength="20" class="input-medium Wdate "
								value="<fmt:formatDate value="${ccmPeople.personTime}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">迁入、迁出原因：</label>
						<div class="controls">
							<form:textarea path="personReason" htmlEscape="false" rows="3"
								maxlength="1000" class="input-xlarge " />
						</div>
					</div>
				</td>
			</tr>

		</table>





		<table id="float" border="0px"
			style="border-color: #CCCCCC; border: 0px solid #CCCCCC; width: 100%">

			<tr>
				<td colspan="6">流动信息：</td>
			</tr>

			<tr>
				<td>
					<div>
						<label class="control-label">流入原因：</label>
						<div class="controls">
							<form:select path="flowRea" class="input-xlarge required">
								<form:options items="${fns:getDictList('ccm_flow_res')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">办证类型：</label>
						<div class="controls">
							<form:select path="accrType" class="input-xlarge ">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('ccm_acc_type')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">证件号码（流入）：</label>
						<div class="controls">
							<form:input path="certNum" htmlEscape="false" maxlength="22"
								class="input-xlarge " />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">登记日期：</label>
						<div class="controls">
							<input name="recoDate" type="text" readonly="readonly"
								maxlength="20" class="input-medium Wdate "
								value="<fmt:formatDate value="${ccmPeople.recoDate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">证件到期日期：</label>
						<div class="controls">
							<input name="dueDate" type="text" readonly="readonly"
								maxlength="20" class="input-medium Wdate "
								value="<fmt:formatDate value="${ccmPeople.dueDate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">住所类型：</label>
						<div class="controls">
							<form:select path="domiType" class="input-xlarge required">
								<form:options items="${fns:getDictList('ccm_dom_type')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">流出时间：</label>
						<div class="controls">
							<input name="time" type="text" readonly="readonly" maxlength="20"
								class="input-medium Wdate "
								value="<fmt:formatDate value="${ccmPeople.time}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">流出原因：</label>
						<div class="controls">
							<form:input path="cause" htmlEscape="false" maxlength="18"
								class="input-xlarge " />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">说明：</label>
						<div class="controls">
							<form:input path="explainelse" htmlEscape="false"
								class="input-xlarge " />
						</div>
					</div>
				</td>
			</tr>

		</table>





		<table id="oversea" border="0px"
			style="border-color: #CCCCCC; border: 0px solid #CCCCCC; width: 100%">

			<tr>
				<td colspan="6">境外信息：</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>外文姓：</label>
						<div class="controls">
							<form:input path="esurname" htmlEscape="false" maxlength="40"
								class="input-xlarge required" />

						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>外文名：</label>
						<div class="controls">
							<form:input path="ename" htmlEscape="false" maxlength="40"
								class="input-xlarge required" />

						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>国籍（地区）：</label>
						<div class="controls">
							<form:input path="nationality" htmlEscape="false" maxlength="3"
								class="input-xlarge required" />

						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>证件类型：</label>
						<div class="controls">
							<form:select path="idenCode" class="input-xlarge required"
								items="${fns:getDictList('sys_ccm_org_papers')}"
								itemLabel="label" itemValue="value" htmlEscape="false">
							</form:select>

						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>证件号码（境外）：</label>
						<div class="controls">
							<form:input path="idenNum" htmlEscape="false" maxlength="30"
								class="input-xlarge required" />

						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>证件有效期：</label>
						<div class="controls">
							<input name="idenDate" type="text" readonly="readonly"
								maxlength="20" class="input-medium Wdate required"
								value="<fmt:formatDate value="${ccmPeople.idenDate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />

						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>来华目的：</label>
						<div class="controls">
							<form:select path="purpose" class="input-xlarge required">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('ccm_cn_aim')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>

						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>抵达日期：</label>
						<div class="controls">
							<input name="arriDate" type="text" readonly="readonly"
								maxlength="20" class="input-medium Wdate required"
								value="<fmt:formatDate value="${ccmPeople.arriDate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />

						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label"><span class="help-inline"><font color="red" >*</font> </span>预计离开日期：</label>
						<div class="controls">
							<input name="departDate" type="text" readonly="readonly"
								maxlength="20" class="input-medium Wdate required"
								value="<fmt:formatDate value="${ccmPeople.departDate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />

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

		<table id="unsettle" border="0px"
			style="border-color: #CCCCCC; border: 0px solid #CCCCCC; width: 100%">

			<tr>
				<td colspan="6">未落户信息：</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">未落户时间：</label>
						<div class="controls">
							<input name="unsettleDate" type="text" readonly="readonly"
								maxlength="20" class="input-medium Wdate "
								value="<fmt:formatDate value="${ccmPeople.unsettleDate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">持证种类名称：</label>
						<div class="controls">
							<form:input path="unsettleCardType" htmlEscape="false"
								maxlength="100" class="input-xlarge " />
						</div>
					</div>
				</td>
				<td>
					<div>
						<label class="control-label">持证编号：</label>
						<div class="controls">
							<form:input path="unsettleCardNumber" htmlEscape="false"
								maxlength="100" class="input-xlarge " />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label class="control-label">未落户原因：</label>
						<div class="controls">
							<form:textarea path="unsettleReason" htmlEscape="false" rows="3"
								maxlength="255" class="input-xlarge " />
						</div>
					</div>
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>


		<div class="form-actions" >
			<%--<shiro:hasPermission name="pop:ccmPeople:edit">--%>
				<%--<input id="btnSubmit" class="btn btn-primary"  type="submit" onclick="saveForm()"--%>
					   <%--value="保 存" />&nbsp;</shiro:hasPermission>--%>
			<input id="btnCancel"  class="btn" type="button" value="返 回"
				   onclick="history.go(-1)" />
		</div>
	</form:form>
	<br>
<c:if test="${documentNumber > 0}">
	<shiro:hasPermission name="log:ccmLogTail:edit">
		<h4 class="hide2">&nbsp;跟踪信息：</h4>
		<br>
		<div class="fishBone1 hide2" ></div>
	</shiro:hasPermission>
	<shiro:lacksPermission name="log:ccmLogTail:edit">
		<h4 class="hide2">&nbsp;查看跟踪信息：</h4>
		<br>
		<div class="fishBone2 hide2" ></div>
	</shiro:lacksPermission>
</c:if>
<c:if test="${documentNumber <= 0}">
	<shiro:hasPermission name="log:ccmLogTail:edit">
		<h2 class="hide2">&nbsp;&nbsp;暂无跟踪信息</h2>
		<br>
	</shiro:hasPermission>
</c:if>
</body>
</html>