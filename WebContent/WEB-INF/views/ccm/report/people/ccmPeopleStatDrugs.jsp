<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>数据统计</title>
    <meta name="decorator" content="default"/>
    <link href="${ctxStatic}/ccm/pop/css/ccmPepInfo.css" rel="stylesheet"/>
    <script type="text/javascript"
            src="${ctxStatic}/echarts/echarts.common.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/echarts/walden.js"></script>
    <script type="text/javascript"
            src="${ctxStatic}/echarts/echarsCommon.js"></script>
    <link href="${ctxStatic}/layer-v3.1.1/layer/theme/default/layer.css"
          rel="stylesheet"/>
    <script src="${ctxStatic}/layer-v3.1.1/layer/layer.js"></script>
    <script type="text/javascript"
            src="${ctxStatic}/common/HasSecret.js"></script>
    <style>
        .row-fluid {
            width: calc(100vw - 40px);
            padding-left: 20px;
            padding-right: 20px;
        }

        .back-list {
            padding-bottom: 0;
        }
    </style>
</head>
<body>
<div class="back-list">
    <input type="hidden" id="hasPermission" value="${fns:getUser().hasPermission}"/>
    <div class="context" content="${ctx}"></div>
    <ul class="nav nav-tabs">
        <li class="active" style="width: 140px"><a class="nav-head"
                                                   href="${ctx}/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatDrugs">数据统计</a>
        </li>
        <li><a style="width: 140px;text-align:center" href="javascript:;" data-href="${ctx}/house/ccmHouseDrugs"
               onclick="HasSecret(this)">数据列表</a></li>
    </ul>
    <div class="row-fluid">
        <div id="ech1" class="span9"></div>
        <div id="echList1" class="span3">
            <div class="ToAuto">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>区域</th>
                        <th title="本月吸毒新增人数">本月吸毒新增人数</th>
                        <th title="本月吸毒总数">本月吸毒总数</th>
                    </tr>
                    </thead>
                    <tbody class="body">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <br>
    <div class="row-fluid">
        <div id="ech2" class="span9"></div>
        <div id="echList2" class="span3">
            <div class="ToAuto">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>时间</th>
                        <th title="新增吸毒人数">新增吸毒人数</th>
                        <th title="吸毒总人数">吸毒总人数</th>
                    </tr>
                    </thead>
                    <tbody class="body">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"
        src="${ctxStatic}/ccm/pop/js/ccmDrugsInfo.js"></script>
</body>
</html>