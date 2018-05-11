package com.king.service.impl;

import com.king.mapper.CreateCubicDevelopmentHistoryMapper;
import com.king.model.CreateCubicDevelopmentHistory;
import com.king.service.HistoryService;
import com.king.vo.HistoryVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class HistoryServiceImpl implements HistoryService {

    @Autowired
    private CreateCubicDevelopmentHistoryMapper createCubicDevelopmentHistoryMapper;

    @Override
    public void save(HistoryVo historyVo) {
        CreateCubicDevelopmentHistory idea = new CreateCubicDevelopmentHistory();
        BeanUtils.copyProperties(historyVo,idea);
        if (historyVo.getId() == 0 || historyVo.getId() == null){
            idea.setCreatetime(new Date());
            createCubicDevelopmentHistoryMapper.insertSelective(idea);
        }else{
            idea.setUpdatetime(new Date());
            createCubicDevelopmentHistoryMapper.updateByPrimaryKeySelective(idea);
        }
    }

    @Override
    public List<CreateCubicDevelopmentHistory> list() {
        return createCubicDevelopmentHistoryMapper.select();
    }

    @Override
    public CreateCubicDevelopmentHistory findById(Integer id) {
        return createCubicDevelopmentHistoryMapper.selectByPrimaryKey(id);
    }

}
