package com.king.service;

import com.king.model.SysLog;
import com.king.utils.PageInfo;

/**
 * @description：操作日志
 */
public interface LogService {

    void insertLog(SysLog sysLog);

    void findDataGrid(PageInfo pageInfo);
}
