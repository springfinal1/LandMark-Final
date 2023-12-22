package com.easyfestival.www.handler;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class PagingHandler {

	private int pageNo; // 현재 페이지 번호
	private int listQty; // 화면에 보여질 리스트 개수
	private int pageQty; // 화면에 보여질 페이징 번호 개수(여러 사람이 쓸 수 있게 고정값x)
	private int pageStart; // 화면에 보여질 첫번째 페이징 번호
	private int pageEnd; // 화면에 보여질 마지막 페이징 번호
	private int totalCount; // 전체 리스트 개수
	private int limitStart; // DB에서 조회할 페이지 limit start => limit(limitPage, listQty)
	private boolean next, prev; // 이전버튼, 다음버튼 활성화 변수
	private String keyword,type;
	
	
	
	// 페이징 선택용 생성자
	public PagingHandler(int pageNo, int listQty, int pageQty, int totalCount) {
		this.pageNo = pageNo;
		this.listQty = listQty;
		this.pageQty = pageQty;
		this.totalCount = totalCount;
		
		this.pageEnd = (int)Math.ceil(this.pageNo / (double)this.pageQty) * this.pageQty;
		this.pageStart = pageEnd - (this.pageQty - 1);
		
		int realEnd = (int)Math.ceil(totalCount / (double)listQty);
		prev = this.pageStart == 1 ? false : true;
		next = this.pageEnd > realEnd ? false : true;
		if(this.pageEnd > realEnd)this.pageEnd = realEnd; // 실제 마지막 페이지번호보다 pageEnd가 크면 바꿔줌
		
		this.limitStart = (pageNo - 1) * listQty;
	}
	public PagingHandler(int pageNo, int listQty, int pageQty, int totalCount, String keyword, String type)
	{
		this (pageNo, listQty, pageQty,totalCount);
		this.type=type;
		this.keyword=keyword;
	}
	
	public String[] typeToArray()
	{
		return this.type !=null ? type.split(""):new String[] {};
	}

	
}
