<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="${ctxStatic}/policeOfficeBI/css/alarm_data.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p>今日110警情数据</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div class="box_content">
		<div class="alarmdata_box">
			<table class="table_header">
				<tr>
					<th class="tb_hd">案件编号</th>
					<th class="tb_hd">案件名称</th>
					<th class="tb_hd">处理人</th>
					<th class="tb_hd">处理状态</th>
				</tr>
			</table>
			<div class="table_list">
				<table id="sj_Table">
                    <tr id="sj_tr" style="display: none!important;"><td>111111111111</td></tr>
<%--					<tr>--%>
<%--                        <td>NO.2</td>--%>
<%--                        <td>案件名称发案件名称发案件名称发案件名称发</td>--%>
<%--                        <td>张小明</td>--%>
<%--                        <td>已处理</td>--%>
<%--                    </tr>--%>


<%--                        <tr class="selected">--%>
<%--                            <td>NO.2</td>--%>
<%--                            <td>案件名称阿法狗案件名称阿法狗案件名称阿法狗</td>--%>
<%--                            <td>张小明</td>--%>
<%--                            <td>已处理</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>NO.3</td>--%>
<%--                            <td>案件名称案件名称阿法狗案件名称阿法狗案件名称阿法狗</td>--%>
<%--                            <td>张小明</td>--%>
<%--                            <td>已处理</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>NO.4</td>--%>
<%--                            <td>案件名称</td>--%>
<%--                            <td>张小明</td>--%>
<%--                            <td>已处理</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>NO.5</td>--%>
<%--                            <td>案件名称案件名称阿法狗</td>--%>
<%--                            <td>张小明</td>--%>
<%--                            <td>已处理</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>NO.5</td>--%>
<%--                            <td>案件名称</td>--%>
<%--                            <td>张小明</td>--%>
<%--                            <td>已处理</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>NO.5</td>--%>
<%--                            <td>案件名称案件名称阿法狗案件名称阿法狗</td>--%>
<%--                            <td>张小明</td>--%>
<%--                            <td>已处理</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>NO.5</td>--%>
<%--                            <td>案件名称</td>--%>
<%--                            <td>张小明</td>--%>
<%--                            <td>已处理</td>--%>
<%--                        </tr>--%>

			</table>
			</div>
		</div>
	</div>
</section>
<script>
	(function($){
		$.fn.myScroll = function(options){
			//默认配置
			var defaults = {
				speed:40,  //滚动速度,值越大速度越慢
				rowHeight:24 //每行的高度
			};

			var opts = $.extend({}, defaults, options),intId = [];

			function marquee(obj, step){

				obj.find("table").animate({
					marginTop: '-=1'
				},0,function(){
					var s = Math.abs(parseInt($(this).css("margin-top")));
					if(s >= step){
						$(this).find("tr").slice(0, 1).appendTo($(this));
						$(this).css("margin-top", 0);
					}
				});
			}

			this.each(function(i){
				var sh = opts["rowHeight"],speed = opts["speed"],_this = $(this);
				intId[i] = setInterval(function(){
					if(_this.find("table").height()<=_this.height()){
						clearInterval(intId[i]);
					}else{
						marquee(_this, sh);
					}
				}, speed);

				_this.hover(function(){
					clearInterval(intId[i]);
				},function(){
					intId[i] = setInterval(function(){
						if(_this.find("table").height()<=_this.height()){
							clearInterval(intId[i]);
						}else{
							marquee(_this, sh);
						}
					}, speed);
				});

			});

		}

	})(jQuery);

	$(function(){


        $.getJSON(ctx + '/sys/BicMap/alarmData', function(data) {
            var sj_tr=$("#sj_tr");
            var le2=data.length;
            for(var i=0;i<data.length;i++){
                if(data[i]["isImportant"]=="1"){
                    sj_tr.before('<tr class="selected"><td>NO.'+(i+1)+'</td><td>'+data[i]["content"]+'</td><td>'+data[i]["handleName"]+'</td><td>'+data[i]["state"]+'</td></tr>')
                }else {
					sj_tr.before('<tr><td>NO.'+(i+1)+'</td><td>'+data[i]["content"]+'</td><td>'+data[i]["handleName"]+'</td><td>'+data[i]["state"]+'</td></tr>')
				}
            }
			$(".table_list tr:even td").css({
				"backgroundColor":"#09304d",
				"opacity":0.9
			})
			var trHt =  $(".table_list").find("tr").outerHeight()
			var tblList = $(".table_list").height(trHt*6)
			$(".table_list").myScroll({
				speed:40, //数值越大，速度越慢
				rowHeight:trHt //li的高度
			});


		})








	});
</script>


