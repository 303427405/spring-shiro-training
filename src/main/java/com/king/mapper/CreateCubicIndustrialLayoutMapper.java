package com.king.mapper;

import com.king.model.CreateCubicIndustrialLayout;

public interface CreateCubicIndustrialLayoutMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicIndustrialLayout record);

    int insertSelective(CreateCubicIndustrialLayout record);

    CreateCubicIndustrialLayout selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicIndustrialLayout record);

    int updateByPrimaryKey(CreateCubicIndustrialLayout record);
}