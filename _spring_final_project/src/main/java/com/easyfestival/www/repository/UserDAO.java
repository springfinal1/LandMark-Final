package com.easyfestival.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfestival.www.domain.FavoriteDTO;
import com.easyfestival.www.domain.UserInfoDTO;
import com.easyfestival.www.handler.PagingHandler;
import com.easyfestival.www.security.AuthVO;
import com.easyfestival.www.security.UserVO;

public interface UserDAO {

	UserVO selectId(String username);

	List<AuthVO> selectAuths(String username);

	int join(UserVO uvo);

	int authUser(AuthVO avo);

	int modifyUser(UserVO uvo);

	int deleteUser(String id);

	int getUserCount();

	List<UserInfoDTO> getUserList(PagingHandler ph);

	UserVO getId(@Param("name")String name, @Param("email")String email);

	List<FavoriteDTO> getFavoriteList(String id);

	List<UserVO> getList(PagingHandler ph);


}