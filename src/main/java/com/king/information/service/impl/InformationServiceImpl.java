package com.king.information.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.king.information.service.InformationService;
import com.king.mapper.InformationMapper;
import com.king.service.impl.ContactUsServiceImpl;
@Service
public class InformationServiceImpl implements InformationService{
	
    private static Logger LOGGER = LoggerFactory.getLogger(ContactUsServiceImpl.class);
	 
	@Autowired
	InformationMapper informationMapper;

	 @Override
	public List<Map<String, Object>> getGsdt(){

		return this.informationMapper.getGsdt();
	}

	@Override
	public List<Map<String, Object>> getPphd() {
		// TODO Auto-generated method stub
		return this.informationMapper.getPphd();
	}

	@Override
	public List<Map<String, Object>> getHydt() {
		// TODO Auto-generated method stub
		return this.informationMapper.getHydt();
	}

	@Override
	public List<Map<String, Object>> getXpkx() {
		// TODO Auto-generated method stub
		return this.informationMapper.getXpkx();
	}


	@Override
	public void save(Map<String, Object> map) {
		// TODO Auto-generated method stub
		this.informationMapper.save(map);
	}

	@Override
	public void edit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		this.informationMapper.edit(map);
	}

	@Override
	public List<Map<String, Object>> findAll() {
		// TODO Auto-generated method stub
		return this.informationMapper.findAll();
	}


}
