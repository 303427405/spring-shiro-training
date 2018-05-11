package com.king.service.impl;

import com.king.enums.RespCode;
import com.king.exception.ServiceException;
import com.king.mapper.CreateCubicContactUsMapper;
import com.king.model.CreateCubicContactUs;
import com.king.service.ContactUsService;
import com.king.vo.ContactUsVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ContactUsServiceImpl implements ContactUsService {

    @Autowired
    private CreateCubicContactUsMapper createCubicContactUsMapper;

    @Override
    public void save(ContactUsVo cubicContactUsVo) {
        //判断条数是否大于1 只能添加一条数据
        if(cubicContactUsVo.getId() ==0 && createCubicContactUsMapper.selectCountByType(cubicContactUsVo.getType()) >= 1){
            throw new ServiceException(RespCode.ONE_COUNT_TYPE_ERROR, RespCode.ONE_COUNT_TYPE_ERROR.getDesc());
        }
        CreateCubicContactUs idea = new CreateCubicContactUs();
        BeanUtils.copyProperties(cubicContactUsVo,idea);
        if (cubicContactUsVo.getId() == 0 || cubicContactUsVo.getId() == null){
            idea.setCreatetime(new Date());
            createCubicContactUsMapper.insertSelective(idea);
        }else{
            idea.setUpdatetime(new Date());
            createCubicContactUsMapper.updateByPrimaryKeySelective(idea);
        }
    }

    @Override
    public List<CreateCubicContactUs> list() {
        return createCubicContactUsMapper.select();
    }

    @Override
    public CreateCubicContactUs findById(Integer id) {
        return createCubicContactUsMapper.selectByPrimaryKey(id);
    }

}
