package com.example.test.service.user_fund;

import com.example.test.model.user_fund.dto.UserFundDTO;

public interface UserFundService {

	public void fund_buy(UserFundDTO dto);
	public UserFundDTO fund_view(String userid);
}
