package com.king.service.impl;

import com.king.code.Result;
import com.king.mapper.CreateCubicRecruitMapper;
import com.king.model.CreateCubicRecruit;
import com.king.service.RecruitService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class RecruitServiceImpl implements RecruitService {

    private static Logger LOGGER = LoggerFactory.getLogger(RecruitServiceImpl.class);

    @Autowired
    private CreateCubicRecruitMapper createCubicRecruitMapper;

    @Override
    public void save(CreateCubicRecruit createCubicRecruit) {
        try {
            if (createCubicRecruit.getRecruitid() == 0 || createCubicRecruit.getRecruitid() == null){
                createCubicRecruit.setCreatetime(new Date());
                createCubicRecruitMapper.insertSelective(createCubicRecruit);
            }else{
                createCubicRecruit.setUpdatetime(new Date());
                createCubicRecruitMapper.updateByPrimaryKeySelective(createCubicRecruit);
            }
        } catch (Exception e) {
            LOGGER.error("编辑招聘信息出错：{}", e);
            throw new RuntimeException("编辑招聘信息出错：{}", e);
        }
    }

    @Override
    public List<CreateCubicRecruit> list() {
        return createCubicRecruitMapper.select();
    }

    @Override
    public Result delete(Integer id) {
        createCubicRecruitMapper.deleteByPrimaryKey(id);
        Result result = new Result();
        result.setSuccess(true);
        result.setMsg("删除成功");
        return result;
    }

    @Override
    public CreateCubicRecruit findById(Integer id) {
        return createCubicRecruitMapper.selectByPrimaryKey(id);
    }

}
