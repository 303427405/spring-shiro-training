package com.king.mapper;

import com.king.model.CreateCubicContactUs;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CreateCubicContactUsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicContactUs record);

    int insertSelective(CreateCubicContactUs record);

    CreateCubicContactUs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicContactUs record);

    int updateByPrimaryKey(CreateCubicContactUs record);

    List<CreateCubicContactUs> select();

   int selectCountByType(Integer type);
}