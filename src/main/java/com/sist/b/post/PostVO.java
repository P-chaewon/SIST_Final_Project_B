package com.sist.b.post;

import java.sql.Date;

import lombok.Data;

@Data
public class PostVO {
	
	private Long postNum;
	private Long userNum;
	private String contents;
	private String tag;
	private Date regDate;
	
	public Long getPostNum() {
		return postNum;
	}
	public void setPostNum(Long postNum) {
		this.postNum = postNum;
	}
	public Long getUserNum() {
		return userNum;
	}
	public void setUserNum(Long userNum) {
		this.userNum = userNum;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	

}
