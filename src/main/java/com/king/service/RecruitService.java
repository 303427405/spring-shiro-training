package com.king.service;

import com.king.code.Result;
import com.king.model.CreateCubicRecruit;
import com.king.model.CreateCubicTalentIdea;
import com.king.vo.TalentIdeaVo;

import java.util.List;


public interface RecruitService {

    /**
     * 添加或修改招聘信息
     * @author leige
     * @Date 2018年4月9日10:50:15
     */
    void save(CreateCubicRecruit createCubicRecruit);

    /**
     * 列表数据(无分页)
     * @author leige
     * @Date 2018年4月9日10:50:50
     */
    List<CreateCubicRecruit> list();

    /**
     * 删除操作
     * @author leige
     * @Date 2018年4月9日10:58:48
     */
    Result delete(Integer id);


}
