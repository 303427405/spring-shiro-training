package com.king.service.impl;

import com.king.mapper.CreateCubicContactUsMapper;
import com.king.model.CreateCubicContactUs;
import com.king.service.ContactUsService;
import com.king.vo.ContactUsVo;
import org.apache.commons.beanutils.PropertyUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ContactUsServiceImpl implements ContactUsService {

    private static Logger LOGGER = LoggerFactory.getLogger(ContactUsServiceImpl.class);

    @Autowired
    private CreateCubicContactUsMapper createCubicContactUsMapper;

    @Override
    public void save(ContactUsVo cubicContactUsVo) {
        CreateCubicContactUs idea = new CreateCubicContactUs();
        try {
            PropertyUtils.copyProperties(idea, cubicContactUsVo);
            if (cubicContactUsVo.getId() == 0){
                //判断条数是否大于1 只能添加一条数据
                idea.setCreatetime(new Date());
                createCubicContactUsMapper.insertSelective(idea);
            }else{
                idea.setUpdatetime(new Date());
                createCubicContactUsMapper.updateByPrimaryKeySelective(idea);
            }
        } catch (Exception e) {
            LOGGER.error("编辑联系我们出错：{}", e);
            throw new RuntimeException("编辑联系我们出错：{}", e);
        }
    }

    @Override
    public List<CreateCubicContactUs> list(Integer type) {
        return createCubicContactUsMapper.select(type);
    }

}
