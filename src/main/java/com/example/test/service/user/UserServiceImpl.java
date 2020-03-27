package com.example.test.service.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.test.model.user.dao.UserDAO;
import com.example.test.model.user.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO dao;
	
	@Override
	public String login(UserDTO dto, HttpSession session) {
		String result=dao.login(dto);
		if(result != null) {//로그인 성공
			session.setAttribute("userid", dto.getUserid());
		}
		return result;
	}

	@Override
	public UserDTO user_view(String userid) {
		return dao.user_view(userid);
	}
	
	@Override
	public void update(String userid, int account) {
		dao.update(userid, account);
	}
	
	@Override
	public int id_chk(String userid) {
		return dao.id_chk(userid);
	}
	
	@Override
	public void insert(UserDTO dto) {
		dao.insert(dto);
	}

}
