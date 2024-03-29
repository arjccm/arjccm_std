/**
 * V 1.0 2018-1-27 11:13:45 消防信息
 */
$(function() {
	$("#btnExport").click(
			function() {
				top.$.jBox.confirm("确认要导出数据吗？", "系统提示", function(v, h, f) {
					if (v == "ok") {
						// 借用导出action
						$("#searchForm").attr("action",
								ctx + "/ccmsys/ccmDevice/export");
						$("#searchForm").submit();
						// 还原查询action 
						$("#searchForm").attr("action",
								ctx + "/ccmsys/ccmDevice/");
					}
				}, {
					buttonsFocus : 1
				});
				top.$('.jbox-body .jbox-icon').css('top', '55px');
			});
	
	$("#btnImport").click(function() {
		$.jBox($("#importBox").html(), {
			title : "导入数据",
			buttons : {
				"关闭" : true
			},
			bottomText : "导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"
		});
	});
	$('#btnGetCameraArea').click(function() {
		// 借用导出action
		$("#searchForm").attr("action", ctx + "/ccmsys/ccmDevice/updateDeviceArea");
		$("#searchForm").submit();
		layer.msg("监控设备区域已调整！",{time:1500});
		// 还原查询action 
		$("#searchForm").attr("action", ctx + "/ccmsys/ccmDevice/");
	});
});

function page(n, s) {
	$("#pageNo").val(n);
	$("#pageSize").val(s);
	$("#searchForm").submit();
	return false;
}