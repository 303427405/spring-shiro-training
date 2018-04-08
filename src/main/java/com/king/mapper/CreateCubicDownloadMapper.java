package com.king.mapper;

import com.king.model.CreateCubicDownload;

public interface CreateCubicDownloadMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicDownload record);

    int insertSelective(CreateCubicDownload record);

    CreateCubicDownload selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicDownload record);

    int updateByPrimaryKey(CreateCubicDownload record);
}