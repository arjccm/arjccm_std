/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.oa.entity;

import com.arjjs.ccm.common.persistence.DataEntity;
import com.arjjs.ccm.common.utils.Collections3;
import com.arjjs.ccm.common.utils.IdGen;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.sys.entity.User;
import com.google.common.collect.Lists;
import org.hibernate.validator.constraints.Length;

import java.util.Date;
import java.util.List;

/**
 * 通知通告Entity
 * @author admin001
 * @version 2014-05-16
 */
public class OaNotify extends DataEntity<OaNotify> {

	private static final long serialVersionUID = 1L;
	private String type;		// 类型
	private String title;		// 标题
	private String content;		// 类型
	private String files;		// 附件
	private String status;		// 状态
	private String taskUrl; // 任务路径

	private String reliefId; // 备勤任务id

	public String getReliefId() {
		return reliefId;
	}

	public void setReliefId(String reliefId) {
		this.reliefId = reliefId;
	}

	private String readNum; // 已读
	private String unReadNum; // 未读

	private boolean isSelf;		// 是否只查询自己的通知

	private String readFlag;	// 本人阅读状态
	private String sender;
	private Date sendTime;
	private String count;
	private String value0;
	private String value1;
	private String userId;


	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getValue0() {
		return value0;
	}

	public void setValue0(String value0) {
		this.value0 = value0;
	}

	public String getValue1() {
		return value1;
	}

	public void setValue1(String value1) {
		this.value1 = value1;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	private List<OaNotifyRecord> oaNotifyRecordList = Lists.newArrayList();

	public OaNotify() {
		super();
	}

	public OaNotify(String id){
		super(id);
	}

	public String getTaskUrl() {
		return taskUrl;
	}

	public void setTaskUrl(String taskUrl) {
		this.taskUrl = taskUrl;
	}

	@Length(min=0, max=200, message="标题长度必须介于 0 和 200 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Length(min=0, max=1, message="类型长度必须介于 0 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Length(min=0, max=1, message="状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Length(min=0, max=2000, message="附件长度必须介于 0 和 2000 之间")
	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReadNum() {
		return readNum;
	}

	public void setReadNum(String readNum) {
		this.readNum = readNum;
	}

	public String getUnReadNum() {
		return unReadNum;
	}

	public void setUnReadNum(String unReadNum) {
		this.unReadNum = unReadNum;
	}

	public List<OaNotifyRecord> getOaNotifyRecordList() {
		return oaNotifyRecordList;
	}

	public void setOaNotifyRecordList(List<OaNotifyRecord> oaNotifyRecordList) {
		this.oaNotifyRecordList = oaNotifyRecordList;
	}

	/**
	 * 获取通知发送记录用户ID
	 * @return
	 */
	public String getOaNotifyRecordIds() {
		return Collections3.extractToString(oaNotifyRecordList, "user.id", ",") ;
	}

	/**
	 * 设置通知发送记录用户ID
	 * @return
	 */
	public void setOaNotifyRecordIds(String oaNotifyRecord) {
		this.oaNotifyRecordList = Lists.newArrayList();
		for (String id : StringUtils.split(oaNotifyRecord, ",")){
			OaNotifyRecord entity = new OaNotifyRecord();
			entity.setId(IdGen.uuid());
			entity.setOaNotify(this);
			entity.setUser(new User(id));
			entity.setReadFlag("0");
			this.oaNotifyRecordList.add(entity);
		}
	}

	/**
	 * 获取通知发送记录用户Name
	 * @return
	 */
	public String getOaNotifyRecordNames() {
		return Collections3.extractToString(oaNotifyRecordList, "user.name", ",") ;
	}

	/**
	 * 设置通知发送记录用户Name
	 * @return
	 */
	public void setOaNotifyRecordNames(String oaNotifyRecord) {
		// 什么也不做
	}

	public boolean isSelf() {
		return isSelf;
	}

	public void setSelf(boolean isSelf) {
		this.isSelf = isSelf;
	}

	public String getReadFlag() {
		return readFlag;
	}

	public void setReadFlag(String readFlag) {
		this.readFlag = readFlag;
	}

	@Override
	public String toString() {
		return "OaNotify{" +
				"type='" + type + '\'' +
				", title='" + title + '\'' +
				", content='" + content + '\'' +
				", files='" + files + '\'' +
				", status='" + status + '\'' +
				", reliefId='" + reliefId + '\'' +
				", readNum='" + readNum + '\'' +
				", unReadNum='" + unReadNum + '\'' +
				", isSelf=" + isSelf +
				", readFlag='" + readFlag + '\'' +
				", sender='" + sender + '\'' +
				", sendTime=" + sendTime +
				", count='" + count + '\'' +
				", value0='" + value0 + '\'' +
				", value1='" + value1 + '\'' +
				", userId='" + userId + '\'' +
				", oaNotifyRecordList=" + oaNotifyRecordList +
				'}';
	}
}