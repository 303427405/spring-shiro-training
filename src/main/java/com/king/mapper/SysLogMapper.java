package com.king.mapper;

import com.king.model.SysLog;
import com.king.utils.PageInfo;

import java.util.List;

public interface SysLogMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SysLog record);

    int insertSelective(SysLog record);

    SysLog selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysLog record);

    int updateByPrimaryKey(SysLog record);

    List findDataGrid(PageInfo pageInfo);

    int findDataGridCount(PageInfo pageInfo);
}