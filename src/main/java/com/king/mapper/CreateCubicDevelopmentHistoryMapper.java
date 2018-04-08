package com.king.mapper;

import com.king.model.CreateCubicDevelopmentHistory;

public interface CreateCubicDevelopmentHistoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicDevelopmentHistory record);

    int insertSelective(CreateCubicDevelopmentHistory record);

    CreateCubicDevelopmentHistory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicDevelopmentHistory record);

    int updateByPrimaryKey(CreateCubicDevelopmentHistory record);
}