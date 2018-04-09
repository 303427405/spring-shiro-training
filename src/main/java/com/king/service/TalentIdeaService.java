package com.king.service;

import com.king.model.CreateCubicTalentIdea;
import com.king.vo.TalentIdeaVo;

import java.util.List;


public interface TalentIdeaService {

    /**
     * 添加或修改人才理念
     * @author leige
     * @Date 2018年4月9日09:47:31
     */
    void save(TalentIdeaVo talentIdeaVo);

    /**
     * 列表数据(无分页)
     * @author leige
     * @Date 2018年4月9日09:47:31
     */
    List<CreateCubicTalentIdea> list();

}
