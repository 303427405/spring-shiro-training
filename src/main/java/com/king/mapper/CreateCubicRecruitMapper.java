package com.king.mapper;

import com.king.model.CreateCubicRecruit;

import java.util.List;

public interface CreateCubicRecruitMapper {
    int deleteByPrimaryKey(Integer recruitid);

    int insert(CreateCubicRecruit record);

    int insertSelective(CreateCubicRecruit record);

    CreateCubicRecruit selectByPrimaryKey(Integer recruitid);

    int updateByPrimaryKeySelective(CreateCubicRecruit record);

    int updateByPrimaryKey(CreateCubicRecruit record);

    List<CreateCubicRecruit> select();
}