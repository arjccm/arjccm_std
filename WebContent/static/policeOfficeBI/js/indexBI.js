//布局
function layoutBi() {
    var gridster;
    var widthLi = $(".gridster").width()/8-16;
    var heightLi = $(".gridster").height()/4-16;
    // alert(heightLi)
    gridster = $(".gridster ul").gridster({
        widget_margins: [8, 8],
        widget_base_dimensions: [widthLi, heightLi],
    }).data('gridster');
    gridster.disable();

    var box_content = $(".box_content");
    var box_header_height =10;
    var box_content_height = box_content.height();
    var gridster_li = $(".gridster li").height()
    box_content.height(gridster_li-box_header_height-10)
}
//时间显示
function showTime() {
    var nowTime = new Date();
    var year = nowTime.getFullYear();
    var month =nowTime.getMonth()+1;
    var day = nowTime.getDate();
    var h = nowTime.getHours();
    var m = nowTime.getMinutes();
    var s = nowTime.getSeconds();
    var week = nowTime.getDay();
    var x;
    if(parseInt(month)<10){
        month="0"+month
    }
    if(parseInt(day)<10){
        day="0"+day
    }
    if(parseInt(h)<10){
        h="0"+ h
    }
    if(parseInt(m)<10){
        m="0"+ m
    }
    if(parseInt(s)<10){
        s="0"+ s
    }
    switch (week) {
        case 0: x="周日";
            break;
        case 1: x="周一";
            break;
        case 2: x="周二";
            break;
        case 3: x="周三";
            break;
        case 4: x="周四";
            break;
        case 5: x="周五";
            break;
        case 6: x="周六";
            break;
    }
    var html = year+"-"+month+"-"+day+"<span>&nbsp;<span>"+h+":"+m+":"+s+"<span>&nbsp;<span>"+x
    $(".header_information .time").html(html)
}

