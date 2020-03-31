package com.example.test.service.user;

import javax.servlet.http.HttpSession;

import com.example.test.model.user.dto.UserDTO;

public interface UserService {

	public String login(UserDTO dto, HttpSession session);
	public UserDTO user_view(String userid);
	public void update(String userid, int account);
	public void insert(UserDTO dto);
	public int id_chk(String userid);
	public void account_up(String userid, int charge);
	public void grade_up(int gno);
}
