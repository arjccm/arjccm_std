/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.ask.entity;

import com.arjjs.ccm.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 领导请示Entity
 * @author cby
 * @version 2020-09-30
 */
public class CcmAskLeader extends DataEntity<CcmAskLeader> {
	
	private static final long serialVersionUID = 1L;
	private User leader;		// 接收人
	private String title;		// 请示标题
	private String content;		// 请示内容
	private String reply;		// 领导回复
	private Date replyTime;		// 回复时间
	private String replyStatus;		// 回复状态
	
	public CcmAskLeader() {
		super();
	}

	public CcmAskLeader(String id){
		super(id);
	}

	@NotNull(message="接收人不能为空")
	public User getLeader() {
		return leader;
	}

	public void setLeader(User leader) {
		this.leader = leader;
	}
	
	@Length(min=1, max=512, message="请示标题长度必须介于 1 和 512 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=1, max=2048, message="请示内容长度必须介于 1 和 2048 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=1024, message="领导回复长度必须介于 0 和 1024 之间")
	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}
	
	@Length(min=0, max=64, message="回复状态长度必须介于 0 和 64 之间")
	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}
	
}