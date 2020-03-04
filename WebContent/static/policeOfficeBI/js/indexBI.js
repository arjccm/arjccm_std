window.onload=function(){
    var box_content = $(".box_content");
    var box_header_height =10;
    var box_content_height = box_content.height();
    var gridster_li = $(".gridster li").height()
    box_content.height(gridster_li-box_header_height)

}
