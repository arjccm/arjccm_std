<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>治安管理整治</title>
<script src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'black'}/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'black'}/custom.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
    href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css">
<!--[if lte IE 7]>
    <link rel="stylesheet" href="../bootstrap/2.3.1/awesome/font-awesome-ie7.css">
    <![endif]-->
<!--[if lte IE 6]>
    <link rel="stylesheet" href="../bootstrap/bsie/css/bootstrap-ie6.min.css">
    <script src="../bootstrap/bsie/js/bootstrap-ie.min.js"></script>
    <![endif]-->

<link rel="stylesheet" href="${ctxStatic}/common/index/css/index.css">
<link rel="stylesheet"
    href="${ctxStatic}/ccm/report/css/reportPolice.css">
<script src="${ctxStatic}/common/index/Scripts/js/echarts.min.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/shine.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/scroll.js"></script>
<script src="${ctxStatic}/jquery/jquery.cookie.js" type="text/javascript"></script>
<script src="${ctxStatic}/ccm/report/js/reportCommon.js"></script>
<script src="${ctxStatic}/common/index/Scripts/js/index.js"></script>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/report/ccmIncidentBegin/police">案事件统计</a></li>
		<li><a href="${ctx}/event/ccmEventIncident/list">案事件列表</a></li>
	</ul> --%>
    <div class="reportPolice_area">
        <div class="context" content="${ctx}"></div>
        
        <div class="reportPolice_content clearfix" >
            <div class="left_box">
                <div class="left_content">
                    <div class="top-header"><div class="top_header_icon">案事件性质统计情况</div></div>
                    <div class="common-pading">
                        <div id="AlarmNatureEcharts" class="echarts"></div>
                    </div>
                </div>
                <div class="left_content" >
                    <div class="top-header"><div class="top_header_icon">案事件类型统计情况</div></div>
                    <div class="common-pading">
                        <div id="echarts3-1" class="echarts"></div>
                    </div>
                </div>
            </div>
            <div class="center_box" >
                <div class="center_content">
                    <div class="top-header"><div class="top_header_icon">案事件处理统计</div></div>
                    <div class="common-pading">
                        <div class="clearfix center_tp_bk">
                            <div class="data_area">
                                <p class="common-color" id="CameraTotal"></p>
                                <p>总数</p>
                            </div>
                            <div class="data_area">
                                <p class="common-color" id="OnLineRate"></p>
                                <p>已处理</p>
                            </div>
                            <div class="data_area">
                                <p class="common-color" id="OkRate"></p>
                                <p>待处理</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="center_content">
                    <div class="top-header"><div class="top_header_icon">本月案事件处理率TOP10</div></div>
                    <div class="common-pading">
                        <div id="AlarmInfoEcharts" class="echarts"></div>
                    </div>
                </div>
                <div class="center_content" >
                    <div class="top-header"><div class="top_header_icon">案事件报警情况</div></div>
                    <div class="common-pading">
                        <div id="AlarmInfoWeekEcharts" class="echarts"></div>
                    </div>
                </div>
            </div>
            <div class="right_box">
                <div class="right_content">
                    <div class="top-header"><div class="top_header_icon">案事件级别统计情况</div></div>
                    <div class="common-pading alarm-height" >
                        <div style="width: 100%">
                            <div class="row-fluid alarm-row-fluid1">
                                <div id="echartsAlarm"  class="echarts" style="height:250px"></div>
                            </div>
                            <div class="row-fluid alarm-row-fluid2">
                                <div class="span12">
                                    <ul class="echartsAlarm-tab clearfix shadow" >
                                        <li class="active">全部</li>
                                        <li>涉及命案</li>
                                        <li>涉及师生</li>
                                        <li>涉及路线</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="row-fluid alarm-row-fluid3" >
                                <div id="alarmTable" style="overflow:auto">
                                    <table>
                                        <thead>
                                            <tr class="l-grid-row-alt">
                                                <td>名称</td>
                                                <td>重特大</td>
                                                <td>重大</td>
                                                <td>较大</td>
                                                <td>一般</td>
                                            </tr>
                                        </thead>
                                        <tbody id="alarmTbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>