package com.easyfestival.www.domain;

import java.util.List;

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
public class eventDTO 
{
	private eventVO evo;
	private List<String> prizes;
	private attendanceVO atvo;
}
