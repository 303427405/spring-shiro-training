package com.king.mapper;

import com.king.model.CreateCubicEnterpriseService;

public interface CreateCubicEnterpriseServiceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicEnterpriseService record);

    int insertSelective(CreateCubicEnterpriseService record);

    CreateCubicEnterpriseService selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicEnterpriseService record);

    int updateByPrimaryKey(CreateCubicEnterpriseService record);
}