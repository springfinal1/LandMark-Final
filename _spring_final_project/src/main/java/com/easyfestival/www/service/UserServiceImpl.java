package com.easyfestival.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.easyfestival.www.domain.FavoriteDTO;
import com.easyfestival.www.domain.UserInfoDTO;
import com.easyfestival.www.handler.PagingHandler;
import com.easyfestival.www.repository.UserDAO;
import com.easyfestival.www.security.AuthVO;
import com.easyfestival.www.security.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

	private final UserDAO udao;

	@Override
	public int userJoin(UserVO uvo) {
		return udao.join(uvo);
	}

	@Override
	public UserVO getId(String id) {
		return udao.selectId(id);
	}

	@Override
	public int authUser(AuthVO avo) {
		return udao.authUser(avo);
	}

	@Override
	public int modifyUser(UserVO uvo) {
		return udao.modifyUser(uvo);
	}

	@Override
	public int deleteUser(String id) {
		return udao.deleteUser(id);
	}

	@Override
	public int getUserCount() {
		return udao.getUserCount();
	}

	@Override
	public List<UserVO> getList(PagingHandler ph) {
		return udao.getList(ph);
	}

	@Override
	public List<AuthVO> selectAuths(String username) {
		return udao.selectAuths(username);
	}

	@Override
	public UserVO getId(String name, String email) {
		return udao.getId(name, email);
	}

	@Override
	public List<FavoriteDTO> getFavoriteList(String id) {
		return udao.getFavoriteList(id);
	}

	@Override
	public List<UserInfoDTO> getUserList(PagingHandler ph) {
		return udao.getUserList(ph);
	}

	
	
}
