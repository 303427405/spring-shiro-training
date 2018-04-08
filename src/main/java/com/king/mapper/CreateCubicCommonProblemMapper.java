package com.king.mapper;

import com.king.model.CreateCubicCommonProblem;

public interface CreateCubicCommonProblemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicCommonProblem record);

    int insertSelective(CreateCubicCommonProblem record);

    CreateCubicCommonProblem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicCommonProblem record);

    int updateByPrimaryKey(CreateCubicCommonProblem record);
}