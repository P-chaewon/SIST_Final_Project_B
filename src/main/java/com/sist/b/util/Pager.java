package com.sist.b.util;

import lombok.Data;

@Data
public class Pager {
	// 검색
	private String status;
	
	// 페이징
	private Integer pn; // 페이지번호
	private Integer perPage; // 한 페이지에 출력할 갯수
	private Integer startRow; // limit의 시작 번호
	
	private Long startNum;
	private Long lastNum;
	
	private boolean lastCheck; // true면 마지막블럭, false면 마지막 블럭X
	
	public void makeRow() {
		this.startRow = (this.getPn()-1)*this.getPerPage();
	}
	
	public void makeNum(Long totalCount) {
		// 2. 전체페이지 갯수 구하기
		Long totalPage = totalCount/this.getPerPage();
		if(totalCount%this.getPerPage() != 0) {
			totalPage++;
		}
		
		// 3. 총블럭의 갯수 구하기
		Long perBlock=5L;
		Long totalBlock = totalPage/perBlock;//2
		if(totalPage%perBlock != 0) {
			totalBlock++;//3
		}
		
		// 4. pn로 현재 블럭 번호 구하기
		Long curBlock = this.getPn()/perBlock;
		if(this.getPn()%perBlock !=0 ) {
			curBlock++;
		}
		
		// 5. curBlock으로 시작번호와 끝번호 구하기
		startNum = (curBlock-1)*perBlock+1;
		lastNum = curBlock*perBlock;
		
		//System.out.println("시작번호 : "+startNum);
		//System.out.println("끝번호   : "+lastNum);
		
		if(curBlock==totalBlock) {
			lastCheck=true;
			lastNum=totalPage;
		}
	}
	
	// setter, getter
	public Integer getPn() {
		if(this.pn==null || this.pn<1) {
			this.pn=1;
		}
		return pn;
	}
	
	public Integer getPerPage() {
		if(this.perPage==null || this.perPage<1) {
			this.perPage=10;
		}
		return perPage;
	}
}
