package com.king.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.king.mapper.CreateCubicSpacePlanMapper;
import com.king.model.CreateCubicSpacePlan;
import com.king.service.SpacePlanService;

@Service
public class SpacePlanServiceImpl implements SpacePlanService {
	@Autowired
	private CreateCubicSpacePlanMapper spacePlanMapper;

	@Override
	public List<CreateCubicSpacePlan> find(CreateCubicSpacePlan SpacePlan) {
		// TODO Auto-generated method stub
		return spacePlanMapper.find(SpacePlan);
	}

	@Override
	public CreateCubicSpacePlan findById(int id) {
		// TODO Auto-generated method stub
		return spacePlanMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return spacePlanMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int save(CreateCubicSpacePlan sp) {
		sp.setUpdatetime(new Date());
		if (sp.getId() == null || sp.getId() == 0) {
			sp.setCreatetime(new Date());

			return spacePlanMapper.insert(sp);
		}
		return spacePlanMapper.updateByPrimaryKeySelective(sp);

	}

}
