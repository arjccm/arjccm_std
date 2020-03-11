<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="${ctxStatic}/policeOfficeBI/css/key_personnel_data.css">
<section>
	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p>重点人员数据总汇</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div class="box_content" id="keypersonneldata_area">
		<div class="keypersonneldata_box clearfix">
			<div class="kpd_sl xmsf_box clearfix">
				<div class="icon"></div>
				<div class="text">
					<p>刑满释放</p>
					<p id="azbj">234<span>人</span></p>
				</div>
			</div>
			<div class="kpd_sl sqjz_box clearfix">
				<div class="icon"></div>
				<div class="text">
					<p>社区矫正</p>
					<p id="sqjz">234<span>人</span></p>
				</div>
			</div>
			<div class="kpd_sl xdry_box clearfix">
				<div class="icon"></div>
				<div class="text">
					<p>吸毒人员</p>
					<p id="drug">234<span>人</span></p>
				</div>
			</div>
			<div class="kpd_sl jsb_box clearfix">
				<div class="icon"></div>
				<div class="text">
					<p>易肇事精神病</p>
					<p id="jsza">234<span>人</span></p>
				</div>
			</div>
			<div class="kpd_sl zdsf_box clearfix">
				<div class="icon"></div>
				<div class="text">
					<p>重点上访</p>
					<p id="visit">234<span>人</span></p>
				</div>
			</div>
			<div class="kpd_sl sjry_box clearfix">
				<div class="icon"></div>
				<div class="text">
					<p>涉教人员</p>
					<p id="sjry">234<span>人</span></p>
				</div>
			</div>
		</div>
	</div>
</section>
<script>

	function showKeyPersonne() {
		$.getJSON(ctx + '/sys/BicMap/getnumPopFollowPopQL', function(data) {

			var  num=data.num;
			// console.info(data);
			$('#azbj').text(num[0]);		//安置帮教
			$('#sqjz').text(num[1]);
			$('#jsza').text(num[2]);
			$('#drug').text(num[3]);
			$('#visit').text(num[5]);
			$('#sjry').text(num[6]);

		});
	}

</script>


