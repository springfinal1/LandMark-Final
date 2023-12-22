package com.easyfestival.www.security;

import java.util.List;

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
public class UserVO{
   
   private String id;
   private String pwd;
   private String name;
   private int age;
   private String address;
   private String email;
   private String phoneNumber;
   private List<AuthVO> authList;
   
}