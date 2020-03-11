<%@ page contentType="text/html;charset=UTF-8" %>
<style>
	#sbzs{
		width: 100%;
		text-align: center;
	}
	#sbzs .sp1{
	width:85px;
	height:26px;
	font-size:14px;
	font-family:Microsoft YaHei;
	font-weight:400;
	color:rgba(255,255,255,1);
	line-height:26px;
	}
	#sbzs .sp2{
		width:19px;
		height:26px;
		font-size:25px;
		font-family:Digiface;
		font-weight:400;
		color:rgba(3,248,246,1);
		line-height:26px;
		background: url("${ctxStatic}/images/numberBj.png") no-repeat;
		background-size: 100% 100%;
	}
	#sbzs .sp3{
		width:15px;
		height:26px;
		font-size:14px;
		font-family:Microsoft YaHei;
		font-weight:400;
		color:rgba(255,255,255,1);
		line-height:26px;
		opacity:0.3;
	}
</style>
<section>


	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p class="left_p">视频监控异常趋势</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div id="sbzs">
		<span id="sp0" class="sp1">监控设备总数</span>
		<%--<span class="sp2">1</span>--%>
		<span class="sp3">个</span>
	</div>
	<div id="videoSurveillance" class="box_content" >


	</div>
</section>


<script>

	//视频监控异常趋势


	function showVideoSurveillance() {

        $.getJSON(ctx + '/sys/BicMap/videoSurveillance', function(data) {
            var videoSurveillance = echarts.init(document.getElementById('videoSurveillance'));
            var data = data["sj"];
            var xdata = data["date"];
            //获取数组总和
            var  sum=0;
            data.forEach(function (value) {
                sum+=value;
            })
            var num=0;	//几位数
            var sum2=sum;
            while (sum2>=1) {
                sum2/=10;
                num++;
            }
            //alert(num)
            // var $sp2='<span class="sp2" id="sp"></span>'

            for(var i=0;i<num;i++){
                var sp1=$("#sp"+i+"")
                sp1.after('<span class="sp2" id="sp'+(i+1)+'"></span>')
            }
            xr(sum,num);
            function xr(sum,num) {
                var sum3=sum;
                for(var i=0;i<num;i++){
                    var  gw=0;
                    var sum4=sum3;
                    while (sum4>=10) {
                        gw=parseInt(sum4/10);
                        sum4/=10;
                    }
                    var sp2= $('#sp'+(i+1)+'');
                    sp2.html(gw)
                    if(sum3<10){
                        sp2.html(sum3);
                        return;
                    }

                    var sum5=String(sum3);

                    sum3=parseInt(sum5.substr(1,sum5.length));
                }
            }





            var option = {
                grid: {
                    top: '3%',
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: xdata,
                    triggerEvent: true,
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: 'rgba(255,255,255,.2)'
                        }
                    },
                    axisLine: {
                        show: true,
                        lineStyle: {
                            width: 2,
                            color: 'rgba(255,255,255,.6)'
                        }
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        color: '#fff',
                        fontSize: 8,
                        textShadowColor: '#000',
                        textShadowOffsetY: 2,
                        rotate:60,
                    }

                },
                yAxis: {

                    type: 'value',
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: 'rgba(255,255,255,.2)'
                        }
                    },
                    axisLine: {
                        show: true,
                        lineStyle: {
                            width: 2,
                            color: 'rgba(255,255,255,.6)'
                        }
                    },

                    axisLabel: {
                        color: '#fff',
                        fontSize: 8,
                        textShadowColor: '#000',
                        textShadowOffsetY: 2
                    }
                },
                series: [{
                    data: data,
                    type: 'line',
                    symbol: 'circle',
                    symbolSize: 12,
                    color: '#48D9F0',
                    lineStyle: {
                        color: "#48D9F0"
                    },

                    areaStyle: {
                        color: '#48D9F0',
                        opacity:0.6
                    }
                }]
            }
            videoSurveillance.setOption(option);

        })

	}





</script>


