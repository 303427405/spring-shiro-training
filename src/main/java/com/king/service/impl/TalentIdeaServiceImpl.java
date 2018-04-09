package com.king.service.impl;

import com.king.code.Result;
import com.king.mapper.CreateCubicTalentIdeaMapper;
import com.king.model.CreateCubicTalentIdea;
import com.king.service.TalentIdeaService;
import com.king.vo.TalentIdeaVo;
import org.apache.commons.beanutils.PropertyUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
        try {
            PropertyUtils.copyProperties(idea, talentIdeaVo);
            if (talentIdeaVo.getId() == 0){
                //判断条数是否大于1 只能添加一条数据
                if (createCubicTalentIdeaMapper.select().size() > 1){
                    LOGGER.error("只能添加一条人才理念");
                    throw new RuntimeException("只能添加一条人才理念");
                }
                idea.setCreatetime(new Date());
                createCubicTalentIdeaMapper.insertSelective(idea);
            }else{
                idea.setUpdatetime(new Date());
                createCubicTalentIdeaMapper.updateByPrimaryKeySelective(idea);
            }
        } catch (Exception e) {
            LOGGER.error("编辑人才理念出错：{}", e);
            throw new RuntimeException("编辑人才理念出错：{}", e);
        }
    }

    @Override
    public List<CreateCubicTalentIdea> list() {
        return createCubicTalentIdeaMapper.select();
    }

}
