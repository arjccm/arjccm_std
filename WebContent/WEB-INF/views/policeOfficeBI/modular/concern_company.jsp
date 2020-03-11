<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="${ctxStatic}/policeOfficeBI/css/concern_company.css">
<section>
	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p>重点关注单位</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div class="box_content">
		<div class="concerncompany_box">
			<div class="dw_list_box clearfix">
				<div class="title">内部</br>单位</div>
				<div class="dwul two_column clearfix">
					<div class="dwli">
						<p id="zdnb">200</p>
						<p>重点内部单位</p>
					</div>
					<div class="line"></div>
					<div class="dwli">
						<p id="ybnb">200</p>
						<p>一般内部单位</p>
					</div>
				</div>
			</div>

			<div class="dw_list_box inside_dw clearfix">
				<div class="title">保安</br>单位</div>
				<div class="dwul two_column clearfix">
					<div class="dwli">
						<p id="bacy">200</p>
						<p>保安从业单位</p>
					</div>
					<div class="line"></div>
					<div class="dwli">
						<p id="bafw">200</p>
						<p>保安服务公司</p>
					</div>
				</div>
			</div>

			<div class="dw_list_box inside_dw clearfix">
				<div class="title">微爆</br>单位</div>
				<div class="dwul three_column clearfix">
					<div class="dwli">
						<p id="petrolStation">200</p>
						<p>加油站</p>
					</div>
					<div class="line"></div>
					<div class="dwli">
						<p id="hgc">200</p>
						<p>化工厂</p>
					</div>
					<div class="line"></div>
					<div class="dwli">
						<p id="powerStation">200</p>
						<p>电站</p>
					</div>
				</div>
			</div>

			<div class="dw_list_box inside_dw clearfix">
				<div class="title">场所</br>待业</div>
				<div class="dwul four_column clearfix">
					<div class="dwli">
						<p id="hotel">200</p>
						<p>宾馆</p>
					</div>
					<div class="line"></div>
					<div class="dwli">
						<p id="internetBar">200</p>
						<p>网吧</p>
					</div>
					<div class="line"></div>
					<div class="dwli">
						<p id="footBath">200</p>
						<p>足浴</p>
					</div>
					<div class="line"></div>
					<div class="dwli">
						<p id="ktv">200</p>
						<p>KTV</p>
					</div>
				</div>
			</div>




		</div>
	</div>
</section>

<script>
	function showConcernCompany() {
		$.getJSON(ctx + '/sys/BicMap/concernCompany', function(data) {


			$('#zdnb').text(data['zdnb']);
			$('#ybnb').text(data['ybnb']);
			$('#bacy').text(data['bacy']);
			$('#bafw').text(data['bafw']);
			$('#petrolStation').text(data['petrolStation']);
			$('#hgc').text(data['hgc']);
			$('#powerStation').text(data['powerStation']);
			$('#hotel').text(data['hotel']);
			$('#internetBar').text(data['internetBar']);
			$('#footBath').text(data['footBath']);
			$('#ktv').text(data['ktv']);

		});
	}

</script>


