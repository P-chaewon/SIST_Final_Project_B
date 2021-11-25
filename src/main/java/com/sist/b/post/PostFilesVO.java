package com.sist.b.post;

import lombok.Data;

@Data
public class PostFilesVO {

	private Long fileNum;
	private Long postNum;
	private String fileName;
	private String oriName;
	
	
	public Long getFileNum() {
		return fileNum;
	}
	public void setFileNum(Long fileNum) {
		this.fileNum = fileNum;
	}
	public Long getPostNum() {
		return postNum;
	}
	public void setPostNum(Long postNum) {
		this.postNum = postNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	
	
}
