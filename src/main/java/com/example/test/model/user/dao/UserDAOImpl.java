package com.example.test.model.user.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.test.model.user.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	SqlSession session;
	
	@Override
	public String login(UserDTO dto) {
		return session.selectOne("user.login", dto);
	}

	@Override
	public UserDTO user_view(String userid) {
		return session.selectOne("user.view", userid);
	}
	
	@Override
	public void update(String userid, int account) {
		Map<String, Object> map=new HashMap<>();
		map.put("userid", userid);
		map.put("account",account);
		session.update("user.update", map);
	}
	
	@Override
	public int id_chk(String userid) {
		return session.selectOne("user.id_chk", userid);
	}
	
	@Override
	public void insert(UserDTO dto) {
		session.insert("user.insert", dto);		
	}
}
