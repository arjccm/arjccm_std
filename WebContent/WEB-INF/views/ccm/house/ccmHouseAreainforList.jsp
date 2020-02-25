<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>辖区信息管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {

	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}

	$(function () {

/*        if ($('.userImg').attr('src').length < 1) {
            $('.userImg').attr('src','../../static/images/user_bg.jpg');
        }*/

        $('img').each(function(){
            if($(this).attr('src').length < 1){
                if (this.id == 'areaIcon') {
                    $(this).attr('src','../../static/images/login_bg/login_bg1.png')
                } else {
                    $(this).attr('src','../../static/images/user_bg.jpg')
                }
            }
        });

    })
	$('html').css({
		"overflow":"hidden"
	})

</script>
<style>
h4.nav {
	border-left: 3px solid #dddddd;
	background-color: #f5f5f5;
	padding: 5px;
	margin: 10px 0 5px;
}

h4.nav2 {
	border-left: 3px solid #dddddd;
	background-color: #f5f5f5;
	padding: 5px;
	margin: 10px 10px 5px 10px;
}

.span3.nav1, .span9.nav1 {
	padding-left: 15px;
}

.row-fluid.nav2 .span3 {
	margin-left: 20px;
	margin-bottom: 15px;
}

.row-fluid.nav2 .span3 .remarks {
	height: 130px;
	overflow: auto;
}

/* 新增 */
	.explain_area{
		width: 29.82vw;
		float: left;
		border-radius: 3px;
		margin-left: 1.3vw;
		margin-top: 10px;
		background: #122e59;
		height: calc(100vh - 90px);
	}
	.explain_box{
		padding: 0 1.3vw;
	}
	.explain_box .image{
		width: 100%;
		border-radius: 6px;
		background: #20447a;
		min-height: 16.5vw;
	}
	.explain_box .image a{
		display: block;
		border-radius: 6px
	}
	.explain_box .image a img{
		width: 100%;
		border-radius: 6px;
	}
	.explain_box .text{
		font-size: 0.946vw;
		color: #fefeff;
		line-height: 1.9vw;
		margin-top: 1.3vw;
	}


	.personnel_area{
		width: 66.39vw;
		height: calc(100vh - 90px);
		border-radius: 3px;
		float: right;
		margin-right: 1.3vw;
		margin-top: 10px;
		background: #122e59;
		overflow: auto;
	}
	.personnel_box{
		padding: 0 1.3vw;
	}
    .personnel_box .list_box{
		padding: 0 0.59vw;
	}
	.personnel_box ul li{
		width: 11.95vw;
		height: 16.09vw;
		background: #173563;
		border-radius: 6px;
		float: left;
		margin-right: 0.9vw;
		margin-bottom: 1vw;
	}
	.personnel_box ul li:nth-child(5n + 5){
		margin-right: 0;
	}
	.personnel_box ul li a{
		display: block;
		border-radius: 4px;
	}
	.personnel_box ul li a img{
		width: 100%;
		height: 10.94vw;
		margin-top: 0.59vw;
		border-radius: 4px;
	}
	.personnel_box ul li .name{
		font-size: 0.946vw;
		padding: 0.71vw 0 0.35vw 0;
		line-height: 100%;
	}
	.personnel_box ul li .text{
		font-size: 12px;
		color: #9bb2ce;
		line-height: 1.2;
	}
	.gt_title{
		font-size: 1.065vw;
		color: #ffffff;
		padding: 1.3vw 0;
		line-height: 100%;
	}
</style>
</head>
<body>
	<div class="back-list">
		<ul class="nav nav-tabs">
			<li class="active"><a href="javascript:window.navigate(location)">辖区信息</a></li>
		</ul>
		<div class="clearfix">
			<div class="explain_area row-fluid">
				<div class="explain_box">
					<div class="gt_title">辖区说明</div>
					<div class="nav1 image">
						<a href="${ccmOrgArea.icon}" data-lightbox="image-1" data-title="辖区信息"><img id="areaIcon" class="example-image" src="${ccmOrgArea.icon}"></a>
					</div>
					<p class="text">${ccmOrgArea.areainfor}</p>
				</div>
			</div>

			<div class="personnel_area row-fluid">
				<div class="personnel_box">
					<div class="gt_title">管理人员简介</div>
					<ul class="clearfix">
					<c:forEach items="${ListVccTeam}" var="user">
						<li class="">
							<div class="list_box">
								<a href="${user.photo}" data-lightbox="image-1" data-title="人员信息">
									<img class="example-image" src="${user.photo}">
								</a>
								<p class="name">${user.name}(${fns:getDictLabel(user.sex,'sex',"")})</p>
								<p class="text">${fns:getDictLabel(user.nation,'sys_volk',"")}
										${fns:getDictLabel(user.politics,'sys_ccm_poli_stat',"")}
										${user.remarks}</p>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>