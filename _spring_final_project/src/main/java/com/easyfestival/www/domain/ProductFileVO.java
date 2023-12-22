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
public class ProductFileVO {
	
	private String pfUuid;
	private long pkNo;
	private String pfName;
	private long pfSize;
	private String pfRegAt;
	private String pfSaveDir;
}
