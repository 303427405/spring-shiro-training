package com.king.mapper;

import com.king.model.CreateCubicCoreTeam;

public interface CreateCubicCoreTeamMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicCoreTeam record);

    int insertSelective(CreateCubicCoreTeam record);

    CreateCubicCoreTeam selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicCoreTeam record);

    int updateByPrimaryKey(CreateCubicCoreTeam record);
}