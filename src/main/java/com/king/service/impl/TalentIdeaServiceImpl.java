package com.king.service.impl;

import com.king.code.Result;
import com.king.enums.RespCode;
import com.king.exception.ServiceException;
import com.king.mapper.CreateCubicTalentIdeaMapper;
import com.king.model.CreateCubicTalentIdea;
import com.king.service.TalentIdeaService;
import com.king.vo.TalentIdeaVo;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TalentIdeaServiceImpl implements TalentIdeaService {

    private static Logger LOGGER = LoggerFactory.getLogger(TalentIdeaServiceImpl.class);

    @Autowired
    private CreateCubicTalentIdeaMapper createCubicTalentIdeaMapper;

    @Override
    public void save(TalentIdeaVo talentIdeaVo) {
        CreateCubicTalentIdea idea = new CreateCubicTalentIdea();
        BeanUtils.copyProperties(talentIdeaVo,idea);
        if (talentIdeaVo.getId() == 0 || talentIdeaVo.getId() == null){
            //判断条数是否大于1 只能添加一条数据
            if (!CollectionUtils.isEmpty(createCubicTalentIdeaMapper.select())){
                LOGGER.error("只能添加一条人才理念");
                throw new ServiceException(RespCode.ONE_COUNT_ERROR,RespCode.ONE_COUNT_ERROR.getDesc());
            }
            idea.setCreatetime(new Date());
            createCubicTalentIdeaMapper.insertSelective(idea);
        }else{
            idea.setUpdatetime(new Date());
            createCubicTalentIdeaMapper.updateByPrimaryKeySelective(idea);
        }
    }

    @Override
    public List<CreateCubicTalentIdea> list() {
        return createCubicTalentIdeaMapper.select();
    }

    @Override
    public CreateCubicTalentIdea findById(Integer id) {
        return createCubicTalentIdeaMapper.selectByPrimaryKey(id);
    }

}
