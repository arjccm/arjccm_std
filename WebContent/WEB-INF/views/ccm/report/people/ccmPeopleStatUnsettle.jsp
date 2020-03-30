<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>未落户人口统计</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/ccm/pop/css/ccmPepInfo.css" rel="stylesheet" />
<script type="text/javascript"
	src="${ctxStatic}/echarts/echarts.common.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/walden.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/echarts/echarsCommon.js"></script>
	<style>
		.row-fluid{
			width: calc(100vw - 40px);
			padding-left: 20px;
			padding-right: 20px;
		}
		.back-list{
			padding-bottom: 0;
		}
	</style>
</head>
<body>
<div class="back-list">
	<div class="context" content="${ctx}"></div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatPerson">数据统计</a></li>
		<li><a href="${ctx}/pop/ccmPeople/">数据列表</a></li>
	</ul>
	<ul class="nav nav-tabs">
			<li><a href="${ctx}/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatPerson">户籍人口统计</a></li>
			<li><a href="${ctx}/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatFloat">流动人口统计</a></li>
			<li><a href="${ctx}/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatOverSea">境外人口统计</a></li>
			<li class="active"><a href="${ctx}/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatUnsettle">未落户人口统计</a></li>
		</ul>
	<div class="row-fluid">
		
		<div id="ech1" class="span9"></div>
		<div id="echList1" class="span3">
			<div class="ToAuto">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>区域</th>
							<th title="本月未落户新增人数">本月未落户新增人数</th>
							<th title="本月未落户总数">本月未落户总数</th>
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
							<th title="新增未落户人数">新增未落户人数</th>
							<th title="未落户总人数">未落户总人数</th>
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
		src="${ctxStatic}/ccm/pop/js/ccmUnsettleInfo.js"></script>
</body>
</html>