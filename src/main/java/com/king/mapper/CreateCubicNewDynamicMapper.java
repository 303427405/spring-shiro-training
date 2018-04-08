package com.king.mapper;

import com.king.model.CreateCubicNewDynamic;

public interface CreateCubicNewDynamicMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicNewDynamic record);

    int insertSelective(CreateCubicNewDynamic record);

    CreateCubicNewDynamic selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicNewDynamic record);

    int updateByPrimaryKey(CreateCubicNewDynamic record);
}