package com.king.mapper;

import com.king.model.CreateCubicSpacePlan;

public interface CreateCubicSpacePlanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicSpacePlan record);

    int insertSelective(CreateCubicSpacePlan record);

    CreateCubicSpacePlan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicSpacePlan record);

    int updateByPrimaryKey(CreateCubicSpacePlan record);
}