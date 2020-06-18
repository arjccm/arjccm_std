var pathName=window.document.location.pathname;
var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctx="http://"+window.location.host+projectName+"/a";
$(document).ready(function() {
	findTableNameInDict();
});

function findTableNameInDict(){
	var html = '';
	$.getJSON(ctx + '/house/ccmHouseEmphasis/tableName',function(data){
		var emphasisData = data.content;
		for(var i = 0;i < emphasisData.length;i++){
			if(i == 0){
				html += '<li class="active"><a href="javascript:;" data="'+emphasisData[0].hasPermission+'" onclick="findHouseEmphasis(this,\''+emphasisData[0].type+'\')">'+emphasisData[0].label+'</a></li>';
			}else{
				html += '<li><a href="javascript:;" data="'+emphasisData[i].hasPermission+'" onclick="findHouseEmphasis(this,\''+emphasisData[i].type+'\')">'+emphasisData[i].label+'</a></li>';
			}
		}
		$('#emphasisTitle').html(html);
        findHouseEmphasis($('#emphasisTitle li.active a'),emphasisData[0].type);
	})
}

function findHouseEmphasis(_this,type){
	debugger;
    var permission=$(_this).attr('data');
    if(permission=="0"){
        layer.confirm('请输入涉密密码:<input autofocus="autofocus" id="Secret" type="password"  value="" style="margin: 0; width: 168px; margin-right: 5px;"/>', {
                btn: ['确定','取消'] //按钮
            }, function(){
                var val=$('#Secret').val();
                if(val==''){
                    top.$.jBox.tip("密码不能为空");
                    return;
                }
				$('#emphasisTitle li').removeClass("active");
				$(_this).parent().addClass("active");
				$("#mainFrameCenter").attr('src',ctx+"/house/"+type+"/list?tableType="+type+"&permissionKey="+val);
                layer.close(layer.index);
            }, function(){
                //alert('取消');
            }
        );
    }else{
        $('#emphasisTitle li').removeClass("active");
        $(_this).parent().addClass("active");
        $("#mainFrameCenter").attr('src',ctx+"/house/"+type+"/list?tableType="+type);
    }
}
function visitRecord(id,type){
	layer.open({
		  type: 1,
		  title: '走访记录',
		  area: ['800px', '400px'],
		//  fixed: true, //固定
		  //maxmin: true,
		  id:'visitRecord',
		   //btn: [ '确定',  '关闭'], //可以无限个按钮
		  content: '<table  id="visitRecordTable"></table>',
		  success: function(layero, index){
			
		  }
		});
	var table = layui.table;
	table.render({
	    elem: '#visitRecordTable'
	    ,url:ctx + '/house/ccmHouseEmphasis/visitRecord'
	    ,where:{"relevanceTable":type,"relevanceId":id}
	    ,cols: [[
             {field:'tailTime',  title: '时间'}
		    ,{field:'tailCase', title: '跟踪事项'}
		    ,{field:'tailContent',  title: '跟踪内容'}
		    ,{field:'tailPerson', title: '处理人员', }
		    ,{field:'more1', title: '处理人员联系方式'}
		    ,{field:'remarks', title: '备注信息'}
	    ]]
		,page: false
		,request : {
			pageName : 'currentPage',// 页码的参数名称，默认：page
			limitName : 'pageSize' // 每页数据量的参数名，默认：limit
		}
	    ,done: function(res, curr, count){
		}
	});
}