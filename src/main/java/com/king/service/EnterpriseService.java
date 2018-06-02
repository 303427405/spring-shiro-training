package com.king.service;

import java.util.List;

import com.king.model.CreateCubicEnterpriseService;
import com.king.model.Enterprise;
import com.king.model.EnterpriseDownload;

public interface EnterpriseService {
	int deleteByPrimaryKey(Integer id);

	int insert(CreateCubicEnterpriseService record);

	int save(CreateCubicEnterpriseService record);

	int insertSelective(CreateCubicEnterpriseService record);

	CreateCubicEnterpriseService selectByPrimaryKey(Integer id);

	Enterprise getbyid(Integer id);

	int updateByPrimaryKeySelective(CreateCubicEnterpriseService record);

	int updateByPrimaryKey(CreateCubicEnterpriseService record);

	List<CreateCubicEnterpriseService> findbyname(String name);

	List<Enterprise> finde(int eid);

	List<EnterpriseDownload> findd(Integer id);

	int save(Enterprise e);

	int del(Integer id);

	int save(EnterpriseDownload e);

	int del2(Integer id);

}
