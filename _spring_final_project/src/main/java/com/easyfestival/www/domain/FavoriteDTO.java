package com.easyfestival.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class FavoriteDTO {

   	private long pkNo;
	private String id;
	private String pkName;
	private int  pkPrice;
	private String pkContinent;
	private String pkContent;
}
