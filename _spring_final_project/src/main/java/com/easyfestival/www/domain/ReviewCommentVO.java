package com.easyfestival.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ReviewCommentVO 
{
	private long rcNo;
	private String rcContent;
	private String rcRegAt;
	private long rvNo;
	private String rcWriter;
}
