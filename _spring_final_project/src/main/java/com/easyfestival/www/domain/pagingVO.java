package com.easyfestival.www.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class pagingVO 
{
	private int pageNo;
	private int qty;
	private String type,keyword; //검색처리용
	
	public pagingVO() {
		this(1,10);
	}
		
	
	public pagingVO(int pageNO,int qty)
	{
		this.pageNo=pageNO;
		this.qty=qty;
	}
	
	//limit 시작,qty : 시작페이지 번호 구하기
	//pageNo 1 2 3 4
	//0,10/10,10/20,10 ...
	public int getPageStart()
	{
		return (this.pageNo-1)*qty;
	}
	
	//타입의 형태를 여러가지 형태로 복합적인 검색을 하기 위해서
	//타입의 키워드 t,c,w,tc,tw,cw,tcw
	public String[] getTypeToArray()
	{
		return this.type==null ? new String[] {}:this.type.split("");
	}

}
