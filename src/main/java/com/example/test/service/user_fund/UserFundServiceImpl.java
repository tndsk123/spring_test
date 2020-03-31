package com.example.test.service.user_fund;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.test.model.user_fund.dao.UserFundDAO;
import com.example.test.model.user_fund.dto.UserFundDTO;

@Service
public class UserFundServiceImpl implements UserFundService {

	@Inject
	UserFundDAO dao;
	
	@Override
	public void fund_buy(UserFundDTO dto) {
		dao.fund_buy(dto);
	}

	@Override
	public List<UserFundDTO> fund_view(String userid) {
		return dao.fund_view(userid);
	}

}
