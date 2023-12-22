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
public class UserInfoDTO {
	
	private String id;
	private String name;
	private int age; 
	private String address;
	private String email;
	private String phoneNumber;
	private String grade;
	private long point;
}
