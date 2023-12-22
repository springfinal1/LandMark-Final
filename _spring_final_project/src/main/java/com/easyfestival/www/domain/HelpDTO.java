package com.easyfestival.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class HelpDTO {
	private long helpNo;
	private String id;
	private String type;
	private String title;
	private String content;
	private String answer;
	private String coment;
	private String regDate;
	private String modDate;
}
