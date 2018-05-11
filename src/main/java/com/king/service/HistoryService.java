package com.king.service;

import com.king.model.CreateCubicDevelopmentHistory;
import com.king.vo.HistoryVo;

import java.util.List;


public interface HistoryService {

    void save(HistoryVo historyVo);

    List<CreateCubicDevelopmentHistory> list();

    CreateCubicDevelopmentHistory findById(Integer id);

}
