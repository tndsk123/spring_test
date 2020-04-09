package com.example.test.service.company;

import com.example.test.model.company.dto.CompanyDTO;

public interface CompanyService {

	public CompanyDTO view(String company_name);
	public void insert(CompanyDTO dto);
	public String check(String userid);
}
