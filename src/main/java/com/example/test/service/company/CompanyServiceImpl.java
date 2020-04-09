package com.example.test.service.company;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.test.model.company.dao.CompanyDAO;
import com.example.test.model.company.dto.CompanyDTO;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Inject
	CompanyDAO dao;
	
	@Override
	public CompanyDTO view(String company_name) {
		return dao.view(company_name);
	}

	@Override
	public void insert(CompanyDTO dto) {
		dao.insert(dto);
	}

	@Override
	public String check(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

}
