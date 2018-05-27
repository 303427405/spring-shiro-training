package com.king.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.king.mapper.CreateCubicEnterpriseServiceMapper;
import com.king.mapper.EnterPriseMapper;
import com.king.model.CreateCubicEnterpriseService;
import com.king.model.Enterprise;
import com.king.model.EnterpriseDownload;
import com.king.mapper.EnterpriseDownloadMapper;
import com.king.service.EnterpriseService;

@Service
public class EnterpriseServiceImpl implements EnterpriseService{
	@Autowired
	private CreateCubicEnterpriseServiceMapper enterpriseDao;
	@Autowired
	private EnterPriseMapper EPMDao;
	@Autowired
	private EnterpriseDownloadMapper EDMDao;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return enterpriseDao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(CreateCubicEnterpriseService record) {
		return enterpriseDao.insert(record);
	}

	@Override
	public int insertSelective(CreateCubicEnterpriseService record) {
		return enterpriseDao.insertSelective(record);
	}

	@Override
	public CreateCubicEnterpriseService selectByPrimaryKey(Integer id) {
		return enterpriseDao.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(CreateCubicEnterpriseService record) {
		return enterpriseDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(CreateCubicEnterpriseService record) {
		return enterpriseDao.updateByPrimaryKey(record);
	}
	
	@Override
	public List<CreateCubicEnterpriseService> findbyname(String name) {
		List<CreateCubicEnterpriseService> list = enterpriseDao.find(name);
		for (int i = 0; i < list.size(); i++) {
			 List<Enterprise> elist= EPMDao.getbyeid(list.get(i).getId());
			 list.get(i).setEnterprise(elist);
		}
		return list;
	}
	
	@Override
	public List<EnterpriseDownload> findd(Integer id) {
		
		return EDMDao.find(id);
	}

	@Override
	public List<Enterprise> finde(int eid) {
		// TODO Auto-generated method stub
		return EPMDao.getbyeid(eid);
	}

	@Override
	public int save(CreateCubicEnterpriseService e) {
		e.setUpdatetime(new Date());
		if (e.getId() == null || e.getId() == 0) {
			e.setCreatetime(new Date());

			return enterpriseDao.insertSelective(e);
		}
		return enterpriseDao.updateByPrimaryKeySelective(e);
	}

	
	
	//
	@Override
	public Enterprise getbyid(Integer id) {
		// TODO Auto-generated method stub
		return EPMDao.getbyid(id);
	}

	@Override
	public int save(Enterprise e) {
		if (e.getId() == null || e.getId() == 0) {
			

			return EPMDao.ins(e);
		}
		return EPMDao.upd(e);
		
	}

	@Override
	public int del(Integer id) {
		// TODO Auto-generated method stub
		return EPMDao.del(id);
	}

	@Override
	public int save(EnterpriseDownload e) {
		

			return EDMDao.ins(e);
		
	}

	@Override
	public int del2(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
