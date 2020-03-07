<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style>

</style>
<section>
	<div class="context" content="${ctx}" style="display: none"></div>
	<div class="box_header">
		<div class="box_header_title">
			<div class="left_bg"></div>
			<p>特业从业人员</p>
			<div class="right_bg"></div>
		</div>
		<div class="box_bg_01">
			<div class="box_bg_02"></div>
		</div>
	</div>
	<div class="box_content">
		<div id="pic3" style="width: 380px;height:260px;"></div>
	</div>
</section>
<script >
	$(function () {
		var context = $(".context").attr("content");
		$.post(context + "/sys/BicMap/Practitioners", {}, function (data) {

			var myChart = echarts.init(document.getElementById('pic3'));
			// var xData = ["快递", "娱乐场所", "网约车", "出租车", "其他"];
			// var data = [301, 239, 350, 432, 309,];
			var floor1Base64 = 'image://data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAXCAYAAAD+4+QTAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0Mzk1N2E3Ni1iMWVhLTRmNDEtOTkwYS0wMTQ3NmIwMjg3ZjgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MEIyQkQyODg1RENCMTFFQUE1RjJEN0JEQjRCNjA2OTciIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MEIyQkQyODc1RENCMTFFQUE1RjJEN0JEQjRCNjA2OTciIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6YWUwOTgwMWItNTc3Yy00OGNjLWFhODAtNzdhMGFhMTFkYzc5IiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6Y2MzMjI3NTItMzIwZC02YzQ4LWEzYTItMzRiZGFlZjNlMTgyIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Wmy7qQAAAk1JREFUeNqklk9IVEEcx+etL3VzUQ8FlVAXwTqUSWRttdGuJoiYBw8SBKnHgm6du3gJomOHLnnt0EEqSNEU8T8Rq6Ai6C0Pigf/FOu6j/f8/ravMi1vXzvrwIeZffOb+f5+M7+ZWauxf0UFldmWHhvVHdAJ2sEF8AMMgxExAQf5xt8a+qDsQIHE0xLlqF4KxECYXXfJK/AHjFNQmAeePs+xyGzsyTlUj0ALWAVjKpMd/J6UgkbQBOLgNigDFaCVSNkC3zXRNctbbniBxmOJDFg5wWTAHAcJM2CffWFG84DCN0GJNnYXDII+y0teLadXYtxMb0/lWcE0mMhG+VdUHHDYFwH3wQ06IzZV4IrlzlyeYFijYIpLeA8kKCwehvKI7oG34DVIad+fgy5GOmi5Y7X6JonhpLaeP+lhjKJCLfs+gy9gE0RBPXjHeWTzr7G9YLnfLnkBCbbLCEc58SIz5zQTpAO0gbOc+DrHJSkqZclW+5mgLK7kRB38/Qa8ZATxHNsKra07Xv0/kdwSYe23R3qy7Gjt86YiYW3vCi2W7aUdVURJ+3yTdH3IA93w74k3EwkH9FWDIb8OWx0YiZSx/m0yyFYZV+6aM4bL5ZiJuO6mgUikmA0MGdrb2iE1ElkvwjnXVGTVwL6yCIdSIvIp9yUrYHm3C7SXk/8sFK1ZGeFl95VP6UmL3AYDoBtcxPz92Y1EQ/4UDE+v19l8tBJ87aLa2Tg6cH4pvMGrf4C3dcr3jaeYw4dL6INoOR+wOEWPTvwvsAw+cvJkUDIcCjAAIJyc3uXQ/P8AAAAASUVORK5CYII='
			var floor1Base641 = 'image://data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAfCAYAAADupU20AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0Mzk1N2E3Ni1iMWVhLTRmNDEtOTkwYS0wMTQ3NmIwMjg3ZjgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MEIyQkQyOEM1RENCMTFFQUE1RjJEN0JEQjRCNjA2OTciIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MEIyQkQyOEI1RENCMTFFQUE1RjJEN0JEQjRCNjA2OTciIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6YWUwOTgwMWItNTc3Yy00OGNjLWFhODAtNzdhMGFhMTFkYzc5IiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6Y2MzMjI3NTItMzIwZC02YzQ4LWEzYTItMzRiZGFlZjNlMTgyIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+7ap76wAAAgpJREFUeNqklT1IHEEUx2dl1fhxpwcWitgkClZikWghJIJNCDaCNkoUxCIWilxhFeSapBAUNWlSBFIpGmNhihQ2FoJfICIqCYKFOY2IH0FExdNZfyNj2Lusu+75jt/Om6//vJ19M2dUfPkl7Da+nPuMogdeQAAs2IRvEKkv/3tmH59ir3xdyumzpLUAtRAAAQY8gW7YY0yBo8DYYnDCurLCIFzIhh3G5sUJjM4FBumo85hsJ8qcNDXXHJnJKpNCdgp/lg6f4bWx0fK7Dycs/JvazJBpXcqnIjnLgFJTxmS+SN5CSuDoAQI7pryQCziVSUw+VAmmIhjG6UhCYLitUVym8JhD5DsIH5zAu5s8UA8qrRTz8PgeK0toedNm7v7LRCr7VsyqghkQLhzAS8ZP/HcW2ttTd4nkOTTADzjU4arfEryFYsZN2cMxb50P/Wf5xNaE+6kjnDGu21LxY9pXi9XCpF3AuL0PhnpPH+n0PIVpWNV1tUgJVMNxZ3dmiWMEdJwPvD9RSRWCV5pEm01sMO0Vdda1wF22ltgQdyNx42zrW+gu1l0j4Pbb9sgB9wiwPx4J9NNLIOoisBGOBM+9BNxeYd2p0c8rrN5HIPrQCPZ0JjrZilNj3Gdkk676I8fluIWQrfuDcESfYwRG4n+jXzOdGolii6JIH6ZZVq/xJYA1Q5feo49uEVwLMACjAXJE5Jl6aQAAAABJRU5ErkJggg=='
			var floor1Base642 = 'image://data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAXCAYAAAD6FjQuAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0Mzk1N2E3Ni1iMWVhLTRmNDEtOTkwYS0wMTQ3NmIwMjg3ZjgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MDRFMzk0NUU1RENCMTFFQUE1RjJEN0JEQjRCNjA2OTciIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MDRFMzk0NUQ1RENCMTFFQUE1RjJEN0JEQjRCNjA2OTciIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6YWUwOTgwMWItNTc3Yy00OGNjLWFhODAtNzdhMGFhMTFkYzc5IiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6Y2MzMjI3NTItMzIwZC02YzQ4LWEzYTItMzRiZGFlZjNlMTgyIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+i0/EsQAAAxNJREFUeNqk1lFIU1EYB/Bz16iVlJlpKFlaaYRCQnktSHqxJIoeCqEQyoeIIKwwsiIJesmiIB+MooishyjSIKggLITUlxtRQVkhlbo0nausNC3nbv9v/mfX6zacHfhxt3PPdvad853vTtOr3yl7MwoS9+JyDJJUdO09lOkPPXdC3XSMmyg/Yb0aNqsgCVSUFsMtfEdGqMmc43qGzVK+qoXTMBThR/otfTFwFlZBCY1pmnUZjbz4ebh0Sj8sBDdvHeJ7H7yBReCCPjgDvRyXD3XQA8l6wxdf+GX0mdvAAU3gBkXDkAKLwAW54IVmmG0ZVw9dkADrIi+jzyziqxu2cdOgFRJhKnyDRtjASEY3Aa7BCpgZdjIjOzZDDflzuFS1tnF3oRly4SfUwAB/hMc29oj+4ruKnCB/RqN6CjMg1TLuF993W/pkz97CfPg0kXOhqaYOWZbzsINLFE2TTC1k5EvhB5NEon6it/R5xkY2ZFbguktNrhVzLxuYrUfhenD/jNSYm7iW6q39npHI6tolbWODiwmHWQlOQlaEiaqZSBLVdDgI+2GBbVw7rNE7Btyaut9mWm5U6T2DJUaCbIfKhudhJuqHtfCYS5nH8ylnMDnE+I2StVhGaxHgIR7pa48QlUS0iRWmkYkibTukQCbshnhmr9TYYk3VfLBG9lpCZkU4AcfDTJbPCGTJ03jepvDIxDHCc1DPTL0IS5yBk/+vZXK/vJARZiI/D/UjS98W7m8c3y+Dffqg73LgDLucUr62YjK//cvmULjmDlHAJcG+2vqyDKcjJ5ClPr+B6wFnoMBE13pDHOLlcM/WJ0u3GcrhtkzmUH4sY3Rc0AluS186XIUy6IE94IVy3i+EV7Icbfwlc/lMCqa2N0xkwU2u4CGexTP3kY8bKXenWEetn+lz6poZqIGGqckHdvJmDatDpHYBWlgbY0kq8CVIt42txDzPHOr/2kuQ/yuV0AVNjM6adVf48B2TVZ8tr7snOJmk9GrWVlmJlfAbiljYqxDRg3F/C7CMaXwQyq8q4B5MqmGCkP1/BRgA/vdYgnjYX3kAAAAASUVORK5CYII='
			var floor1Base643 = 'image://data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAWCAYAAADafVyIAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0Mzk1N2E3Ni1iMWVhLTRmNDEtOTkwYS0wMTQ3NmIwMjg3ZjgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MDRFMzk0NUE1RENCMTFFQUE1RjJEN0JEQjRCNjA2OTciIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MDRFMzk0NTk1RENCMTFFQUE1RjJEN0JEQjRCNjA2OTciIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6YWUwOTgwMWItNTc3Yy00OGNjLWFhODAtNzdhMGFhMTFkYzc5IiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6Y2MzMjI3NTItMzIwZC02YzQ4LWEzYTItMzRiZGFlZjNlMTgyIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+OhbuzAAAAf5JREFUeNq0ljlIA0EUhifrhhAUUsSDxAvBE09QFDSI2NlbBKwU7CSNViKIiNhoaSuCqBAtBAtFEOJRKIKixMImJopi1EILCZHsxH/CbLJZl2Rz+OAjM5O37595+2ZmDd1r90S2/ucaorAicAeqSGpjPh0gclL+8OdPMcWDtTy4mwdpB35gBSHQAjxghk/mUyuISNJbDzABL3gHdvAFzJyUpiVQCUZBA+9XgFIwqPL7AU7eXgSvSPEq0vSUSsAGrkAheAMBHStkPkOgGExApBMij5oCURp18Xw28XxnYmWAVcwUcMmDgtzoC1QJlNIRsAf8gGRIELiBE7HiExd7fRUst21RQi08/y6SvW2AcTCHuKwgrkUq0QM0jNyBldp+DgKngL3kad4PCzQiGQHh7ICwop8R53UvFL9bijETW8EylIZBNWBbcSDb6Xd5SwjehlxBQbAuQoXt1Ek+uEDyZ6yqDkUpItnJ/1k5W4FygK3gQ9FvBWNpgmyCS9UhOR8vU5XAkurQGtAhsA12Y8eqIxQbaD4zJwSkCFU6C6qHDTrSkOTT6DEJqJ/EWUSlpBVcgG9F36pDYAXMskb9kYjQUtIJixRR9R2Qqdk42se1agWyHWdZNQ5QoBKgWo7ZbjZWIJYkgai2QN5MxB0Q4Hes/HJuc4h3w74dFDee71eAAQD8zQjW7acoDQAAAABJRU5ErkJggg=='
			var floor1Base644 = 'image://data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0Mzk1N2E3Ni1iMWVhLTRmNDEtOTkwYS0wMTQ3NmIwMjg3ZjgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MEIyQkQyODQ1RENCMTFFQUE1RjJEN0JEQjRCNjA2OTciIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MEIyQkQyODM1RENCMTFFQUE1RjJEN0JEQjRCNjA2OTciIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6YWUwOTgwMWItNTc3Yy00OGNjLWFhODAtNzdhMGFhMTFkYzc5IiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6Y2MzMjI3NTItMzIwZC02YzQ4LWEzYTItMzRiZGFlZjNlMTgyIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+kqcChgAAAbxJREFUeNqslUtLAlEUx+/NW9n0FaKXC+sLhGQUWEgQrSJD0sJNSUg7F7VpWUGb6AktetDDija1btUDv4Fu7AFt25aVjv0PHEkmm5lg/vDjXPXP8d4559yR+VhQQBqYAxHQCkogA7bBBtDFj2pAAsRBB5DgERyCxd6+tXf5FhuihNfAJ6rrFIT5jyhBCoT+8KZBQJVk7bxJQtIYuAJHfJKQiZfyzKmiqI8Ka01y0gkb3qjSRX2zDWO7IZqpVRVlgw2fUBxdNrw6ju/OchWdUhY71bawWHUw6RZ2qq1z1cIOJDymvqZnSo09Di65yh5QZzC/GGKlPkEO7FNPj/qHS6ogGgU3dooxU4/xi7A/8LuqeKbl0YtyH7bxZ+NOKeEtaKr84fA+rfOYHhCRbl9JZqbOXTyKIyY7fOY74Qm0mPguaAJVQWqzFgn/I8qToOpPC2cVp+p7HU7qxU5tjekXx4INr1S6dD9xEcyUq4geC+8jXX3UtAsWxl2O5A1aePfo6lvCor9aY7Oo/854fQIGuaer6QYs4/i1eSwGQJLHlJq/yO+oTbDDE1eePPLcgRnQyYPywKdYSXa9fnwLMACTnG0hYbPUyAAAAABJRU5ErkJggg=='
			// var maxPlanCourseCnt = Math.max.apply(null, data);
			var option = {

				tooltip: {
					show: "true",
					trigger: "item",
					backgroundColor: "rgba(0,0,0,0.7)", // 背景
					padding: [10, 12], //内边距
					extraCssText: "box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);" //添加阴影
				},
				grid: {
					top: "10%",
					left: "-3%",
					right: "5%",
					bottom: "10%",
					containLabel: true
				},
				xAxis: [{
					type: "category",
					axisTick: {
						show: false
					},
					axisLine: {
						show: true,
						lineStyle: {
							color: "#a8e7ff"
						}
					},
					axisLabel: {
						inside: false,
						textStyle: {
							color: "#fff",
							fontWeight: "normal",
							fontSize: "12"
						}
						// formatter:function(val){
						//     return val.split("").join("\n")
						// },
					},
					data: data["name"],
				}],
				yAxis: {
					type: "value",
					show: false,
					// max: maxPlanCourseCnt,
					axisTick: {
						show: false
					},
					axisLine: {
						show: true,
						lineStyle: {
							color: "#32346c"
						}
					},
					splitLine: {
						show: true,
						lineStyle: {
							color: "#32346c "
						}
					},
					axisLabel: {
						textStyle: {
							color: "#bac0c0",
							fontWeight: "normal",
							fontSize: "12"
						},
						formatter: "{value}名"
					}
				},
				series: [{
					name: "",
					type: "bar",
					// label: {
					// 	normal: {
					// 		show: true,
					// 		color: "#9fcded",
					// 		position: "top",
					// 		fontSize: "12"
					// 	}
					// },
					markPoint: {
						formatter: function (params) {
							return '<img src="' +
									params.data.symbol.replace('image://', '') +
									'" />';
						},

						symbolSize: '25',
						data: getIcon(),
						label: {
							show: true,
							textStyle: {
								color: "#fff",
								fontSize: "12"
							},
							formatter: '{c}',
							position: 'top'
						}
					},
					itemStyle: {
						normal: {
							show: true,
							color: function (params) {
								//注意，如果颜色太少的话，后面颜色不会自动循环，最好多定义几个颜色
								var colorList = ['#ee8025', '#c435ac', '#17b7d5', '#337cf5', '#df4d66'];
								return colorList[params.dataIndex]
							},
							// barBorderRadius: 1,
							borderWidth: 0,
							shadowBlur: 15,
							// shadowColor: "rgba(105,123, 214, 0.7)"
						}
					},
					zlevel: 2,
					barWidth: "12px",
					data: data["jlData"]
				}]
			};
			//初始化echarts实例(这里的main要根据自己的div的id进行修改.)
			// var myChart = echarts.init(document.getElementById('main'));
			//使用制定的配置项和数据显示图表
			myChart.setOption(option);


			function getIcon() {
				var iconArr = [],
						icon = "";
				for (var i = 0; i < data["jlData"].length; i++) {
					if (i == 0) icon = floor1Base64;
					if (i == 1) icon = floor1Base641;
					if (i == 2) icon = floor1Base642;
					if (i == 3) icon = floor1Base643;
					if (i == 4) icon = floor1Base644;
					iconArr.push({
						value: data["jlData"][i],
						xAxis: i,
						yAxis: data["jlData"][i] + 40,
						symbol: icon
					})
				}
				return iconArr;
			}
		})
	})
</script>


