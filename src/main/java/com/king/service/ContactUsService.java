package com.king.service;

import com.king.model.CreateCubicContactUs;
import com.king.vo.ContactUsVo;

import java.util.List;


public interface ContactUsService {

    /**
     * 联系我们
     * @author leige
     * @Date 2018年4月11日10:16:46
     */
    void save(ContactUsVo cubicContactUsVo);

    /**
     * 列表数据(无分页)
     * @author leige
     * @Date 2018年4月11日10:16:50
     */
    List<CreateCubicContactUs> list(Integer type);

    CreateCubicContactUs findById(Integer id);

}
