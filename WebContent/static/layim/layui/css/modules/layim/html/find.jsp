<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>创建群组</title>

    <%--<link rel="stylesheet" href="http://local.res.layui.com/layui/src/css/layui.css">--%>
    <link rel="stylesheet" href="${ctxStatic}/layim/layui/css/layui.css">
    <link rel="stylesheet" href="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.min.css">
    <link rel="stylesheet" href="${ctxStatic}/layim/layui/css/addGroup.css">
    <style>

    </style>
</head>
<body>

<div style="margin: 15px;">
    <form class="layui-form" action="" lay-filter="example">
    <%--  <div class="layui-elem-quote"></div>--%>
    <div id="createGroup">
        <div class="layui-container">
            <div class="layui-col-md6">

                    <div class="layui-form-item search-box">
                        <input type="text" placeholder="搜素" class="layui-input">
                        <a class="searchIcon"><i class="layui-icon layui-icon-search"></i></a>
                    </div>
                    <div class="layui-form-item friend-box"  pane="">
                        <ul class="layui-nav layui-nav-tree layui-inline friend-list-box" lay-filter="demo" style="margin-right: 0;"></ul>
                    </div>

            </div>
            <div class="layui-col-md6">
                <div class="select-friend-box layui-form-item">
                    <div class="title">请勾选需要添加的群成员</div>

                        <div class="layui-form-item"  pane="">
                            <ul class="select-list-box" id="slt-lt-bx">
                            </ul>
                        </div>

                </div>
                <div class="set-group-box">
                    <div class="title">群设置</div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">群名称</label>
                            <div class="layui-input-block">
                                <input id="groupname" type="text" name="groupname" lay-verify="title" autocomplete="off" placeholder="请输入群名称" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">设置群主</label>
                                <div class="layui-input-inline">
                                    <select id="setGroupManager" name="groupOwnerId" lay-verify="required" lay-search="">
                                        <option value="">选择群主</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="layui-upload upload-group-img">
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="uploadImage">
                                <p id="demoText"></p>
                            </div>
                            <button type="button" class="layui-btn" id="uploadBtn">上传群头像</button>
                        </div>

                </div>
            </div>

            <div class="layui-col-md12 clearfix">
                <div class="submitBtn"><button type="button" class="layui-btn site-demo-layim" lay-submit lay-filter="groupSubmit" data-type="addGroup">确定</button><button type="button" class="layui-btn layui-btn-primary groupCloseBtn">取消</button></div>
            </div>
        </div>
    </div>


    </form>
</div>



<%--<script src="http://local.res.layui.com/layui/src/layui.js"></script>--%>
<script src="${ctxStatic}/jquery/jquery-1.9.1.min.js" charset="utf-8"></script>
<script src="${ctxStatic}/layim/layui/layui.js" charset="utf-8"></script>
<script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" charset="utf-8"></script>
<script>
    var arjimRest="http://"+window.location.host+"/arjim-server/";
    var currentsession="${fns:getUser().id}";

    var setGrp = parent.layui.$(".layui-layer-border")
    var group_id = parent.layui.$(".changeGrp").attr("data-id")


    $.getJSON(arjimRest+'getusers?userId='+currentsession,function(data){
        imFriend(data)
        treeFriend(data)
    });


    function imFriend(data){
        layui.use(['form', 'layim', 'tree', 'element', 'upload'], function(){
            var friendData = data.data.friend;
            var element = layui.element;
            var form = layui.form;
            var tree = layui.tree;
            var layim = layui.layim
                ,layer = layui.layer
                ,laytpl = layui.laytpl
                ,$ = layui.jquery
                ,laypage = layui.laypage
                ,upload = layui.upload;

            var ptindex = parent.layer.getFrameIndex(window.name);



            // console.log(parent.$(".compileGrp").attr("title"))

            $(".groupCloseBtn").on("click",function(){
                parent.layer.close(ptindex);       //关闭当前窗口
            })
            element.on('nav(demo)', function(elem){
                //console.log(elem)
            });

            var grpId;
            //判断是否编辑页，给表单赋值
            if(setGrp.hasClass("changeGrp")){
                $.getJSON(arjimRest+'getGroupUser?id='+group_id,function (data) {
                    console.log(data)
                    var imgdata = data.data.avatar
                    var frdlistData = data.data.list
                    var groupid = data.data.id
                    var listfdObj = {}
                    var thisData = {
                        "groupname":data.data.groupname,
                        "groupOwnerId":data.data.groupowner
                    }


                    $('#uploadImage').attr('src', imgdata)

                    for(var i=0;i<frdlistData.length;i++){
                        var selectFd = "<li class='clearfix "+frdlistData[i].id+"' value='"+frdlistData[i].id+"'><div class='friend-icon'><img src='"+frdlistData[i].avatar+"'></div><div class='friend-name'>"+frdlistData[i].username+"</div></li>"
                        var setGroupManager = "<option value='"+ frdlistData[i].id +"' class='"+ frdlistData[i].id +"'>"+ frdlistData[i].username +"</option>"
                        $(".select-list-box").append(selectFd)
                        $("#setGroupManager").append(setGroupManager)
                    }

                    frdlistData.forEach(item=> {                                //将数组转换成对象并给它赋值
                        listfdObj[item.id] = true
                    })
                    var finalData = Object.assign(thisData, listfdObj)          //将两个对象合并
                    console.log(finalData)

                    form.val('example', finalData);
                    form.render();

                    grpId = groupid
                    return grpId
                })
            }



            form.on('checkbox(friendCheckbox)', function(obj){
                var objelem = obj.elem
                var name =objelem.attributes["title"].value
                var icon =objelem.attributes["data-icon-src"].value
                var fdid =objelem.attributes["id"].value
                var fd_id = "."+ fdid
                // var LI = document.createElement("LI")
                // LI.appendChild(name)

                var selectFd = "<li class='clearfix "+ fdid +"' value='"+ fdid +"'><div class='friend-icon'><img src='"+icon+"'></div><div class='friend-name'>"+name+"</div></li>"
                var setGroupManager = "<option value='"+ fdid +"' class='"+ fdid +"'>"+ name +"</option>"

                // 判断是否选中
                if(obj.elem.checked==true){
                    $(".select-list-box").append(selectFd)          //添加群成员
                    $("#setGroupManager").append(setGroupManager)
                }else{
                    $(fd_id).remove()                               //删除群成员
                }
                form.render();
                console.log(obj)
                // console.log(obj.elem); //得到checkbox原始DOM对象
                // console.log(obj.elem.checked); //是否被选中，true或者false
                // console.log(obj.value); //复选框value值，也可以通过data.elem.value得到
                // console.log(obj.othis); //得到美化后的DOM对象


            });
            var imgSrcData;
            //图片上传
            var uploadInst = upload.render({
                elem: '#uploadBtn'
                ,url: arjimRest+'imgupload?userId='+currentsession
                ,accept:'images'
                //,auto:false            //是否选完文件后自动上传
                //,bindAction:""
                ,size:500
                ,before: function(obj){
                    layer.load();
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#uploadImage').attr('src', result); //图片链接（base64）
                    });
                }
                ,done: function(res, index, upload ){
                    layer.closeAll('loading')
                    if(res.code == 0){
                        imgSrcData = res.data.src
                        return imgSrcData
                    }
                    //如果上传失败
                    // if(res.code > 0){
                    //     return layer.msg('上传失败');
                    // }
                }
                ,error: function(index, upload){
                    layer.closeAll('loading')
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function(){
                        uploadInst.upload();
                    });
                }
            });


            // $('.site-demo-layim').on('click', function(){
            //
            // });

            form.on('submit(groupSubmit)', function(data){
                var json  = {
                    groupname:data.field.groupname,    //群名称
                    avatar:imgSrcData,                         //群头像
                    userList:[],                        //群成员列表
                    groupOwnerId:data.field.groupOwnerId,  //群主id
                    id:grpId,
                    userId:currentsession
                }
                var selectList =  $("#slt-lt-bx li")

                for(var i=0;i<selectList.length;i++){
                    var listVal = $("#slt-lt-bx li").eq(i).attr("value")
                    // console.log(listVal)
                    json.userList.push(listVal)

                }
                // layer.alert(JSON.stringify(json), {
                //     title: '提交的信息'
                // })

                var $url = "/arjccm/app"
                $.ajax({
                    type:"post",
                    url:$url+'/rest/ImChat/saveGroups',
                    dataType:"json",
                    data:JSON.stringify(json),
                    contentType: 'application/json; charset=UTF-8',
                    success:function(res){
                        var rid = res.result.id
                        if(setGrp.hasClass("changeGrp")){
                            parent.layui.layim.removeList({
                                id: rid
                                ,type: 'group'
                            });
                            $ = layui.jquery, active = {
                                addGroup: function(){
                                    layer.msg('修改成功', {
                                        icon: 1
                                    });
                                    //增加一个群组渲染到页面
                                    parent.layui.layim.addList({
                                        type: 'group'
                                        ,avatar: imgSrcData
                                        ,groupname: data.field.groupname
                                        ,id: rid
                                        ,members: 0
                                        ,groupowner:data.field.groupOwnerId
                                    });
                                }
                            }
                            //更新渲染当前聊天窗口一些信息
                            var chatChangeHtml = json.groupname+"<em class='layim-chat-members'>"+json.userList.length+"人</em><i class='layui-icon'>&#xe61a;</i>"
                            parent.$(".layim-chat-username").html(chatChangeHtml)
                            //更新渲染聊天窗口判断当前是不是群主
                            if(json.groupOwnerId == currentsession ){
                                parent.$(".layim-chat-group .setUpGroup").css({
                                    "display":"block"
                                })
                            }else {
                                parent.$(".layim-chat-group .setUpGroup").css({
                                    "display":"none"
                                })
                            }


                            var type = $('.site-demo-layim').data('type');
                            active[type] ? active[type].call($('.site-demo-layim')) : '';
                        }else {
                            $ = layui.jquery, active = {
                                addGroup: function(){
                                    layer.msg('创建成功', {
                                        icon: 1
                                    });
                                    //增加一个群组渲染到页面
                                    parent.layui.layim.addList({
                                        type: 'group'
                                        ,avatar: imgSrcData
                                        ,groupname: data.field.groupname
                                        ,id: rid
                                        ,members: 0
                                        ,groupowner:data.field.groupOwnerId
                                    });
                                }
                            }
                            var type = $('.site-demo-layim').data('type');
                            active[type] ? active[type].call($('.site-demo-layim')) : '';
                        }

                        parent.layer.close(ptindex);
                    }

                })




                //console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                //console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                //console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            });



        });
    }
    function treeFriend(data) {
        var friendData = data.data.friend

        for (var i=0;i<friendData.length;i++) {
            var friendHTML ="<li class='layui-nav-item groupList'><a href='javascript:;'>"+ friendData[i].groupname +"</a></li>";
            // console.log(friendData[i].groupname)
            $(".friend-list-box").append(friendHTML)

            for (var j=0;j<friendData[i].list.length;j++){
                // friendHTML= "<li><input type='checkbox' name='like1[write]' lay-skin='primary' title='"+friendData[i].list[j].username+"'></li>"
                var cliHtml ="<dl class='layui-nav-child'><dd><a href='javascript:;'><input type='checkbox' value='"+ friendData[i].list[j].id +"' name='"+ friendData[i].list[j].id +"' lay-filter='friendCheckbox' lay-skin='primary' id='"+ friendData[i].list[j].id +"' data-icon-src='"+friendData[i].list[j].avatar +"' title='"+friendData[i].list[j].username+"'></a></dd></dl>";
                $(".groupList").eq(i).append(cliHtml)
                // console.log(friendData[i])
            }

        }

    }
</script>
</body>
</html>
