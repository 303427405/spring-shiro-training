package com.king.mapper;

import com.king.model.CreateCubicHonor;

public interface CreateCubicHonorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicHonor record);

    int insertSelective(CreateCubicHonor record);

    CreateCubicHonor selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicHonor record);

    int updateByPrimaryKey(CreateCubicHonor record);
}