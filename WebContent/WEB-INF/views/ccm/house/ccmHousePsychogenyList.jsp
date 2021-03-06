<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>肇事肇祸等严重精神障碍患者管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript" src="${ctxStatic}/ccm/house/js/ccmHousePsychogenyInfo.js"></script>
    <script type="text/javascript" src="${ctxStatic}/ccm/pop/js/ccmCommon.js"></script>
    <link href="${ctxStatic}/layer-v3.1.1/layer/theme/default/layer.css" rel="stylesheet"/>
    <script src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
    <script type="text/javascript" src="${ctxStatic}/common/HasSecret.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".pimg").click(function () {
                var _this = $(this);//将当前的pimg元素作为_this传入函数
                imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
            });
        });

        function imgShow(outerdiv, innerdiv, bigimg, _this) {
            var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
            $(bigimg).attr("src", src);//设置#bigimg元素的src属性
            /*获取当前点击图片的真实大小，并显示弹出层及大图*/
            $("<img/>").attr("src", src).load(function () {
                var windowW = $(window).width();//获取当前窗口宽度
                var windowH = $(window).height();//获取当前窗口高度
                var realWidth = this.width;//获取图片真实宽度
                var realHeight = this.height;//获取图片真实高度
                var imgWidth, imgHeight;
                var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放
                if (realHeight > windowH * scale) {//判断图片高度
                    imgHeight = windowH * scale;//如大于窗口高度，图片高度进行缩放
                    imgWidth = imgHeight / realHeight * realWidth;//等比例缩放宽度
                    if (imgWidth > windowW * scale) {//如宽度扔大于窗口宽度
                        imgWidth = windowW * scale;//再对宽度进行缩放
                    }
                } else if (realWidth > windowW * scale) {//如图片高度合适，判断图片宽度
                    imgWidth = windowW * scale;//如大于窗口宽度，图片宽度进行缩放
                    imgHeight = imgWidth / realWidth * realHeight;//等比例缩放高度
                } else {//如果图片真实高度和宽度都符合要求，高宽不变
                    imgWidth = realWidth;
                    imgHeight = realHeight;
                }
                $(bigimg).css("width", imgWidth);//以最终的宽度对图片缩放
                var w = (windowW - imgWidth) / 2;//计算图片与窗口左边距
                var h = (windowH - imgHeight) / 2;//计算图片与窗口上边距
                $(innerdiv).css({"top": h, "left": w});//设置#innerdiv的top和left属性
                $(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
            });
            $(outerdiv).click(function () {//再次点击淡出消失弹出层
                $(this).fadeOut("fast");
            });
        }

        var isEmpty = true;
        function saveImport() {
            if(isEmpty){
                alert("请选择文件！");
                return false;
            }else{
                loading('正在导入，请稍等...');
            }
        }
        function changeFalse(_this) {
            if(_this>0){
                isEmpty = false;
            }
        }
    </script>
</head>
<body>
<%--<img  src="${ctxStatic}/images/shouyedaohang.png"; class="nav-home">--%>
<%--<span class="nav-position">当前位置 ：</span><span class="nav-menu"><%=session.getAttribute("activeMenuName")%>></span><span class="nav-menu2">人口管理</span>--%>
<div class="back-list clearfix">
    <input type="hidden" id="hasPermission" value="${fns:getUser().hasPermission}"/>
    <div class="context" content="${ctx}"></div>
    <!-- 导入、导出模块 -->
    <div id="importBox" class="hide">
        <form id="importForm" action="${ctx}/house/ccmHousePsychogeny/import" method="post"
              enctype="multipart/form-data" class="form-search" style="padding-left: 20px; text-align: center;"
              onsubmit="return saveImport()"><br/>
            <input id="uploadFile" name="file" type="file" style="width: 330px" onchange="changeFalse(this.value.length)"/><br/> <br/>
            <input id="btnImportSubmit" class="btn btn-primary" type="submit" value="导  入 "/>
        </form>
    </div>
    <ul class="nav nav-tabs">
        <shiro:hasPermission name="report:ccmPeopleStat:view">
            <li><a style="text-align:center"
                   href="${ctx}/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatPsychogeny">数据统计</a></li>
        </shiro:hasPermission>
        <li class="active"><a class="nav-head" href="javascript:;" data-href="${ctx}/house/ccmHousePsychogeny"
                              onclick="HasSecret(this)">数据列表</a></li>
    </ul>
    <form:form id="searchForm" modelAttribute="ccmHousePsychogeny" action="${ctx}/house/ccmHousePsychogeny/"
               method="post" class="breadcrumb form-search clearfix">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <input id="permissionKey" name="permissionKey" type="hidden" value="${permissionKey}"/>
    <ul class="ul-form pull-left">
        <li class="first-line"><label>姓名：</label> <form:input path="name" htmlEscape="false" maxlength="50"
                                                              class="input-medium"/>
        </li>
        <li class="first-line"><label>性别：</label>
            <form:select path="sex" class="input-medium">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
            </form:select>
        </li>
        <li class="first-line"><label>关注程度：</label>
            <form:select path="atteType" class="input-medium">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('ccm_conc_exte')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select></li>

        <li class="first-line"><label>目前诊断类型：</label>
            <form:select path="diagType" class="input-medium">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('ccm_now_diag')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select></li>
        <li class="first-line"><label>危险性评估等级：</label>
            <form:select path="dangAsse" class="input-medium">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('ccm_nors_asle')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select></li>
        <li class="second-line"><label>有无肇事肇祸史：</label>
            <form:select path="acciHist" class="input-medium">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
    </ul>


    <div class="clearfix pull-right btn-box">

        <!-- <input id="btnSubmit" class="btn btn-primary"
            type="submit" value="查询" onclick="return page();" /> -->
        <a href="javascript:;" id="btnSubmit" class="btn btn-primary"
           style="width: 49px;display:inline-block;float: left;">
            <i></i><span style="font-size: 12px">查询</span> </a>
        <shiro:hasPermission name="house:ccmHousePsychogeny:import">
            <!-- <input id="btnExport" class="btn btn-primary" type="button"
            value="导出" />
            <input id="btnImport" class="btn btn-primary" type="button"
            value="导入" /> -->
            <a href="javascript:;" id="btnImport" style="width: 49px;display:inline-block;float: left;"
               class="btn  btn-export ">
                <i></i> <span style="font-size: 12px">导入</span>
            </a>
        </shiro:hasPermission>
        <shiro:hasPermission name="house:ccmHousePsychogeny:export">
            <a href="javascript:;" id="btnExport" class="btn btn-export"
               style="width: 49px;display:inline-block;float: left;">
                <i></i> <span style="font-size: 12px">导出</span>
            </a>
        </shiro:hasPermission>
    </div>
    </form:form>
    <sys:message content="${message}"/>
    <table id="contentTable" class="table table-striped table-bordered table-condensed table-gradient">
        <thead>
        <tr>
            <th>人员图片</th>
            <th>姓名</th>
            <th>公民身份号码</th>
            <th>性别</th>
            <th>联系方式</th>
            <th>目前诊断类型</th>
            <th>关注程度</th>
            <th>有无肇事肇祸史</th>
            <th>危险性评估等级</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="ccmHousePsychogeny">
            <tr>
                <td width="100px"><img src="${ccmHousePsychogeny.images}" style="height:50px;" class="pimg"/></td>
                <td class="tc"><a
                        onclick="parent.LayerDialog('${ctx}/house/ccmHousePsychogeny/form?id=${ccmHousePsychogeny.id}', '信息', '1200px', '900px')">${ccmHousePsychogeny.name}</a>
                </td>
                <td class="tc">${ccmHousePsychogeny.ident}</td>
                <td class="tc">${fns:getDictLabel(ccmHousePsychogeny.sex, 'sex', '')}</td>
                <td class="tc">${ccmHousePsychogeny.telephone}</td>
                <td class="tc">${fns:getDictLabel(ccmHousePsychogeny.diagType, 'ccm_now_diag', '')}</td>
                <c:if test="${ccmHousePsychogeny.atteType eq '01'}">
                    <td style='color:red'>${fns:getDictLabel(ccmHousePsychogeny.atteType, 'ccm_conc_exte', '')}&nbsp;
                        &nbsp; <img src="${ctxStatic}/images/atteType_red.png"/></td>
                </c:if>
                <c:if test="${ccmHousePsychogeny.atteType eq '02'}">
                    <td style='color:orange'>${fns:getDictLabel(ccmHousePsychogeny.atteType, 'ccm_conc_exte', '')}&nbsp;
                        &nbsp; <img src="${ctxStatic}/images/atteType_orange.png"/></td>
                </c:if>
                <c:if test="${ccmHousePsychogeny.atteType eq '03'}">
                    <td>${fns:getDictLabel(ccmHousePsychogeny.atteType, 'ccm_conc_exte', '')}&nbsp; &nbsp; <img
                            src="${ctxStatic}/images/atteType_green.png"/></td>
                </c:if>
                <c:if test="${ccmHousePsychogeny.atteType eq '04'}">
                    <td>${fns:getDictLabel(ccmHousePsychogeny.atteType, 'ccm_conc_exte', '')}</td>
                </c:if>
                <c:if test="${ccmHousePsychogeny.atteType eq '' or empty ccmHousePsychogeny.atteType}">
                    <td>${fns:getDictLabel(ccmHousePsychogeny.atteType, 'ccm_conc_exte', '')} </td>
                </c:if>
                <td class="tc">${fns:getDictLabel(ccmHousePsychogeny.acciHist, 'yes_no', '')}</td>
                <td class="tc">${fns:getDictLabel(ccmHousePsychogeny.dangAsse, 'ccm_nors_asle', '')}</td>
                <td class="tc"><shiro:hasPermission name="house:ccmHousePsychogeny:edit">
                    <a class="btnList"
                       onclick="parent.LayerDialog('${ctx}/house/ccmHousePsychogeny/form?id=${ccmHousePsychogeny.id}', '修改', '1200px', '900px')"
                       title="修改"><i class="iconfont icon-caozuotubiao-xiugai"></i></a>
                    <a class="btnList"
                       href="${ctx}/house/ccmHousePsychogeny/delete?id=${ccmHousePsychogeny.id}&permissionKey=${permissionKey}"
                       onclick="return confirmx('确认要删除该肇事肇祸等严重精神障碍患者吗？', this.href)" title="删除"><i
                            class="iconfont icon-caozuotubiao-shanchu"></i></a>
                    <a class="btnList" href="javascript:;" onclick="LocationOpen('${ccmHousePsychogeny.peopleId}')"
                       title="位置信息"><i class="iconfont icon-caozuotubiao-weizhixinxi "></i></a>
                    <a class="btnList"
                       onclick="parent.LayerDialog('${ctx}/pop/ccmPeople/getSocialConnections?id=${ccmHousePsychogeny.peopleId}', '社交关系', '1000px', '700px')"
                       title="社交关系"><i class="iconfont icon-caozuotubiao-shejiaoguanxi"></i></a>
                    <%-- <a class="btnList" onclick="parent.LayerDialog1('','${ctx}/work/ccmWorkTiming/form', '定时提醒', '700px', '500px')" title="定时提醒"><i class="iconfont icon-caozuotubiao-fasongjingqing"></i></a> --%>
                </shiro:hasPermission> <shiro:hasPermission name="log:ccmLogTail:view">
                    <a class="btnList"
                       onclick="parent.LayerDialog('${ctx}/log/ccmLogTail/list?relevance_id=${ccmHousePsychogeny.id}&relevance_table=ccm_house_psychogeny', '记录信息', '800px', '660px')"
                       title="记录信息"><i class="iconfont icon-caozuotubiao-jiluxinxi" style="color: cornflowerblue;"></i></a>
                </shiro:hasPermission> <shiro:hasPermission name="log:ccmLogTail:edit">
                    <a class="btnList"
                       onclick="parent.LayerDialog('${ctx}/log/ccmLogTail/formPro?relevance_id=${ccmHousePsychogeny.id}&relevance_table=ccm_house_psychogeny', '添加记录', '800px', '660px')"
                       title="添加记录"><i class="iconfont icon-caozuotubiao-tianjiachuli"></i> </a>
                </shiro:hasPermission></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div id="outerdiv"
         style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
        <div id="innerdiv" style="position:absolute;">
            <img id="bigimg" style="border:5px solid #fff;" src=""/>
        </div>
    </div>
    <div class="pagination" style="float: right; margin-top: 12px">${page}</div>
</body>
</html>