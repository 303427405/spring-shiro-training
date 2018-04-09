package com.king.mapper;

import com.king.model.CreateCubicTalentIdea;

import java.util.List;

public interface CreateCubicTalentIdeaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicTalentIdea record);

    int insertSelective(CreateCubicTalentIdea record);

    CreateCubicTalentIdea selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicTalentIdea record);

    int updateByPrimaryKey(CreateCubicTalentIdea record);

    List<CreateCubicTalentIdea> select();
}