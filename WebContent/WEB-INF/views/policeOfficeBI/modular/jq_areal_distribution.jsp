<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="${ctxStatic}/policeOfficeBI/css/jq_areal_distribution.css">
<section>
	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p>警情区域分布TOP5</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div class="box_content">
		<div class="jqqyfb_box">
			<div class="region1 region_sl">
				<div class="jq_data">
					<p id="areaNameOne"></p>
					<p id="valueOne"></p>
					<p>NO.1</p>
				</div>
			</div>
			<div class="region2 region_sl">
				<div class="jq_data">
					<p id="areaNameTwo"></p>
					<p id="valueTwo"></p>
					<p>NO.2</p>
				</div>
			</div>
			<div class="region3 region_sl">
				<div class="jq_data">
					<p id="areaNameThree"></p>
					<p id="valueThree"></p>
					<p>NO.3</p>
				</div>
			</div>
			<div class="region4 region_sl">
				<div class="jq_data">
					<p id="areaNameFour"></p>
					<p id="valueFour"></p>
					<p>NO.4</p>
				</div>
			</div>
			<div class="region5 region_sl">
				<div class="jq_data">
					<p id="areaNameFive"></p>
					<p id="valueFive"></p>
					<p>NO.5</p>
				</div>
			</div>

			<div class="region_black"></div>
		</div>
	</div>
</section>
<script>
	function setValueAndAreaName(){
		//请求接口并填装数据执行
		$.getJSON(ctx + "/sys/BicMap/alarmOfArea", function (data) {
			$('#areaNameOne').text(data['areaName'][0]);
			$('#areaNameTwo').text(data['areaName'][1]);
			$('#areaNameThree').text(data['areaName'][2]);
			$('#areaNameFour').text(data['areaName'][3]);
			$('#areaNameFive').text(data['areaName'][4]);
			$('#valueOne').text(data['value'][0]+'件');
			$('#valueTwo').text(data['value'][1]+'件');
			$('#valueThree').text(data['value'][2]+'件');
			$('#valueFour').text(data['value'][3]+'件');
			$('#valueFive').text(data['value'][4]+'件');
		});
	}
</script>


