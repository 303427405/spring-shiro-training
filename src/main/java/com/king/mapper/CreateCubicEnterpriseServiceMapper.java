package com.king.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.king.model.CreateCubicEnterpriseService;

public interface CreateCubicEnterpriseServiceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicEnterpriseService record);

    int insertSelective(CreateCubicEnterpriseService record);

    CreateCubicEnterpriseService selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicEnterpriseService record);

    int updateByPrimaryKey(CreateCubicEnterpriseService record);
    
    List<CreateCubicEnterpriseService> find(@Param("title")String title);
    
}