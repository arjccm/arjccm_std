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
					<th class="tb_hd" width="16%"></th>
					<th class="tb_hd" width="12%">一</th>
					<th class="tb_hd" width="12%">二</th>
					<th class="tb_hd" width="12%">三</th>
					<th class="tb_hd" width="12%">四</th>
					<th class="tb_hd" width="12%">五</th>
					<th class="tb_hd" width="12%">六</th>
					<th class="tb_hd" width="12%">日</th>
				</tr>
			</table>
			<table class="by_tbl_ct">
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
</section>
<script>
	var arr = [];
	function beonduty(){
		$.getJSON(ctx + "/sys/BicMap/beonduty", function (data) {
			for(var i in data){
				var tbl_content_html = "<tr><th class='name'>"+ data[i].name +"</th></tr>"
				// console.log(data[i].weekedPlan)
				// var weekedPlan = data[i].weekedPlan
				// arr.push(weekedPlan)

				// for(var j in data[i].weekedPlan){
				// 	console.log(j)
					// var td = "<td>"+data[i][j]+"</td>"
					// $(".by_tbl_ct .name").after(td)

				// }
					// console.log(data[i].weekedPlan)

				$(".by_tbl_ct").append(tbl_content_html)
			}
			// var week1 = [];
			// var week2 = [];
			// var week3 = [];
			// var week4 = [];
			// var week5 = [];
			// var week6 = [];
			// var week7 = [];
			// for(var j = 0;j<arr.length;j++){
			// 	console.log(arr[j])
				// var day1 = arr[j].day1;
				// var day2 = arr[j].day2;
				// var day3 = arr[j].day3;
				// var day4 = arr[j].day4;
				// var day5 = arr[j].day5;
				// var day6 = arr[j].day6;
				// var day7 = arr[j].day7;
				// week1.push(day1)
				// week2.push(day2)
				// week3.push(day3)
				// week4.push(day4)
				// week5.push(day5)
				// week6.push(day6)
				// week7.push(day7)

				// alert(j)

			// }
			// console.log(week1)
			// console.log(arr)
			// var td = "<td>"+week1+"</td>" +
			// 		"<td>"+week2+"</td>" +
			// 		"<td>"+week3+"</td>" +
			// 		"<td>"+week4+"</td>" +
			// 		"<td>"+week5+"</td>" +
			// 		"<td>"+week6+"</td>" +
			// 		"<td>"+week7+"</td>"
			// $(".by_tbl_ct .name").after(td)


		})
	}
</script>


