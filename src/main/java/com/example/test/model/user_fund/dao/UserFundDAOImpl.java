package com.example.test.model.user_fund.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.test.model.user_fund.dto.UserFundDTO;

@Repository
public class UserFundDAOImpl implements UserFundDAO {

	@Inject
	SqlSession session;
	
	@Override
	public void fund_buy(UserFundDTO dto) {
		session.insert("user_fund.fund_buy", dto);	
	}

	@Override
	public UserFundDTO fund_view(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

}
