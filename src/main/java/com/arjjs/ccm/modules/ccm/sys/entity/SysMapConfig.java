package com.arjjs.ccm.modules.ccm.sys.entity;

/**
 * 系统地图配置信息实体类
 * @author dongqikai
 * 2018-09-05
 */
public class SysMapConfig {
	
	private String imgType; //影像图map类型
	private String elcType; //电子图map类型
	private String projection = "0";  //地图投影（0: EPSG:4326和1: EPSG:3857两种，默认为EPSG:4326）
	private String imageMapUrl;  //影像地图url
	private String electronicMapUrl;   //电子地图url
	private String showType = "0";  //显示类型 0：影像图 1：电子地图
	private String imgResolutions;  //影像图分辨率
	private String elcResolutions;  //电子图分辨率
	private String imgOrigin; //影像图原点
	private String elcOrigin; //电子图原点
	private String imgTileSize; //瓦片尺寸
	private String elcTileSize; //瓦片尺寸
	private String center; //中心坐标
	private String zoom; //当前层级
	private String min; //最小层级
	private String max; //最大层级
	private String keshihuaMapUrl; //可视化地图url
	private String appMapUrl; //APP地图url
	private String name;  //地图服务名
	private String format;  //format格式
	private String tileSize;    //地图大小
	private String tileMatrixSet;  //投影坐标系设置矩阵
	private String resolutions;
	private String sliceNum;
	private String origin;
	private String matrixIds;
	private String resolution;
	private String extent;


	public String getProjection() {
		return projection;
	}
	public void setProjection(String projection) {
		this.projection = projection;
	}
	public String getImageMapUrl() {
		return imageMapUrl;
	}
	public void setImageMapUrl(String imageMapUrl) {
		this.imageMapUrl = imageMapUrl;
	}
	public String getElectronicMapUrl() {
		return electronicMapUrl;
	}
	public void setElectronicMapUrl(String electronicMapUrl) {
		this.electronicMapUrl = electronicMapUrl;
	}
	public String getShowType() {
		return showType;
	}
	public void setShowType(String showType) {
		this.showType = showType;
	}
	public String getCenter() {
		return center;
	}
	public void setCenter(String center) {
		this.center = center;
	}
	public String getZoom() {
		return zoom;
	}
	public void setZoom(String zoom) {
		this.zoom = zoom;
	}
	public String getMin() {
		return min;
	}
	public void setMin(String min) {
		this.min = min;
	}
	public String getMax() {
		return max;
	}
	public void setMax(String max) {
		this.max = max;
	}
	public String getImgType() {
		return imgType;
	}
	public void setImgType(String imgType) {
		this.imgType = imgType;
	}
	public String getElcType() {
		return elcType;
	}
	public void setElcType(String elcType) {
		this.elcType = elcType;
	}
	public String getImgResolutions() {
		return imgResolutions;
	}
	public void setImgResolutions(String imgResolutions) {
		this.imgResolutions = imgResolutions;
	}
	public String getElcResolutions() {
		return elcResolutions;
	}
	public void setElcResolutions(String elcResolutions) {
		this.elcResolutions = elcResolutions;
	}
	public String getImgOrigin() {
		return imgOrigin;
	}
	public void setImgOrigin(String imgOrigin) {
		this.imgOrigin = imgOrigin;
	}
	public String getElcOrigin() {
		return elcOrigin;
	}
	public void setElcOrigin(String elcOrigin) {
		this.elcOrigin = elcOrigin;
	}
	public String getImgTileSize() {
		return imgTileSize;
	}
	public void setImgTileSize(String imgTileSize) {
		this.imgTileSize = imgTileSize;
	}
	public String getElcTileSize() {
		return elcTileSize;
	}
	public void setElcTileSize(String elcTileSize) {
		this.elcTileSize = elcTileSize;
	}

	public String getKeshihuaMapUrl() {
		return keshihuaMapUrl;
	}

	public void setKeshihuaMapUrl(String keshihuaMapUrl) {
		this.keshihuaMapUrl = keshihuaMapUrl;
	}

	public String getAppMapUrl() {
		return appMapUrl;
	}

	public void setAppMapUrl(String appMapUrl) {
		this.appMapUrl = appMapUrl;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getTileSize() {
		return tileSize;
	}

	public void setTileSize(String tileSize) {
		this.tileSize = tileSize;
	}

	public String getTileMatrixSet() {
		return tileMatrixSet;
	}

	public void setTileMatrixSet(String tileMatrixSet) {
		this.tileMatrixSet = tileMatrixSet;
	}

	public String getResolutions() {
		return resolutions;
	}

	public void setResolutions(String resolutions) {
		this.resolutions = resolutions;
	}

	public String getSliceNum() {
		return sliceNum;
	}

	public void setSliceNum(String sliceNum) {
		this.sliceNum = sliceNum;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getMatrixIds() {
		return matrixIds;
	}

	public void setMatrixIds(String matrixIds) {
		this.matrixIds = matrixIds;
	}

	public String getResolution() {
		return resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}

	public String getExtent() {
		return extent;
	}

	public void setExtent(String extent) {
		this.extent = extent;
	}
}
