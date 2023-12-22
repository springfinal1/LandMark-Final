package com.easyfestival.www.handler;

import com.easyfestival.www.domain.pagingVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewPagingHandler 
{
	private int startPage;
	private int endPage;
	private boolean next,prev;
	
	private int totalCount;
	private int realEndPage;
	
	private pagingVO pgvo;
	
	public ReviewPagingHandler(pagingVO pgvo,int totalCount)
	{
		this.pgvo=pgvo;
		this.totalCount=totalCount;
		
		this.endPage=(int)Math.ceil(pgvo.getPageNo()/(double)pgvo.getQty())*pgvo.getQty();
		this.startPage=endPage-9;
		this.realEndPage=(int)Math.ceil(totalCount/(double)pgvo.getQty());
		
		if(endPage>realEndPage)
			endPage=realEndPage;
		
		this.prev=startPage>1;
		this.next=endPage<realEndPage;
	}

}
