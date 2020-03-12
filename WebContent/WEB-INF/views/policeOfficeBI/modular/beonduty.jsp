<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="${ctxStatic}/policeOfficeBI/css/beonduty.css">
<section>
	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p>本周值班计划</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div class="box_content">
		<div class="beonduty_box">
			<table class="by_tbl_header">
				<tr>
					<th class="tb_hd" style="width: 16%"></th>
					<th class="tb_hd" style="width: 12%" >一</th>
					<th class="tb_hd" style="width: 12%">二</th>
					<th class="tb_hd" style="width: 12%">三</th>
					<th class="tb_hd" style="width: 12%">四</th>
					<th class="tb_hd" style="width: 12%">五</th>
					<th class="tb_hd" style="width: 12%">六</th>
					<th class="tb_hd" style="width: 12%">日</th>
				</tr>
			</table>
			<div class="table_content_area">
				<table class="by_tbl_ct" id="tblArea">
<%--				<tr>--%>
<%--					<th class="name">李雷雷</th>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_01.png"></td>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_01.png"></td>--%>
<%--				</tr>--%>
<%--				<tr>--%>
<%--					<th class="name">张&#12288露</th>--%>
<%--					<td></td>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_02.png"></td>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_02.png"></td>--%>
<%--					<td></td>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_02.png"></td>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--				</tr>--%>
<%--				<tr>--%>
<%--					<th class="name">杨&#12288光</th>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_03.png"></td>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_03.png"></td>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--				</tr>--%>
<%--				<tr>--%>
<%--					<th class="name">赵小明</th>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_04.png"></td>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_04.png"></td>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_04.png"></td>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--				</tr>--%>
<%--				<tr>--%>
<%--					<th class="name">孙&#12288勇</th>--%>
<%--					<td></td>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_05.png"></td>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--					<td></td>--%>
<%--					<td><img src="${ctxStatic}/policeOfficeBI/img/icon_seal_05.png"></td>--%>
<%--					<td></td>--%>
<%--				</tr>--%>
			</table>
			</div>
		</div>
	</div>
</section>
<script>


	function beonduty(){
		$.getJSON(ctx + "/sys/BicMap/beonduty", function (data) {
			for(var i in data){
				var tbl_content_html = "<tr><th class='name'>"+ data[i].name +"</th><td>"+data[i].weekedPlan[0]+"</td><td>"+data[i].weekedPlan[1]+"</td><td>"+data[i].weekedPlan[2]+"</td><td>"+data[i].weekedPlan[3]+"</td><td>"+data[i].weekedPlan[4]+"</td><td>"+data[i].weekedPlan[5]+"</td><td>"+data[i].weekedPlan[6]+"</td></tr>"
				// console.log(data[i])
				$(".by_tbl_ct").append(tbl_content_html)
			}
			<%--for(var j=0;j<$(".by_tbl_ct td").length;j++){--%>
			<%--	if($(".by_tbl_ct td").eq(j).text()==0){--%>
			<%--		$(".by_tbl_ct td").eq(j).empty().html("<img src='${ctxStatic}/policeOfficeBI/img/icon_seal_01.png'>")--%>

			<%--	}if($(".by_tbl_ct td").eq(j).text()==1){--%>
			<%--		$(".by_tbl_ct td").eq(j).empty().html("<img src='${ctxStatic}/policeOfficeBI/img/icon_seal_02.png'>")--%>
			<%--	}--%>
			<%--}--%>
			var d = new Date();
			var weeks = d.getDay()-1
			// alert(weeks)
			$('#tblArea tr').each(function(i){
				      $(this).children('td').each(function(j){
					         // alert("第"+(i+1)+"行，第"+(j+1)+"个td的值："+$(this).text()+"。");
						  if($(this).text()==0){
							  $(this).empty().html("<img src='${ctxStatic}/policeOfficeBI/img/icon_seal_01.png'>")

						  }if($(this).text()==1){
							  $(this).empty().html("<img src='${ctxStatic}/policeOfficeBI/img/icon_seal_02.png'>")
							  $('#tblArea tr').eq(i).children('td').eq(weeks).empty().html("<img src='${ctxStatic}/policeOfficeBI/img/icon_seal_05.png'>")
						  }
					  });
			});
			var tblHeight = $(".by_tbl_ct").find("tr").outerHeight()
			$(".table_content_area").height(tblHeight*5)
			$(".table_content_area").myScroll({
				speed:120, //数值越大，速度越慢
				rowHeight:tblHeight //li的高度
			});


			// alert(tblHeight)
		})
	}
</script>


