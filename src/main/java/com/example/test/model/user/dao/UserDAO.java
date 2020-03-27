package com.example.test.model.user.dao;

import com.example.test.model.user.dto.UserDTO;

public interface UserDAO {

	public String login(UserDTO dto);
	public UserDTO user_view(String userid);
	public void update(String userid, int account);
	public void insert(UserDTO dto);
	public int id_chk(String userid);
}
