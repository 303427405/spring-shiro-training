package com.king.service;

import java.util.List;

import com.king.model.CreateCubicSpacePlan;

public interface SpacePlanService {
    
    List<CreateCubicSpacePlan> find(CreateCubicSpacePlan SpacePlan);
    CreateCubicSpacePlan findById(int id);
    int deleteByPrimaryKey(Integer id);
    int save(CreateCubicSpacePlan sp);
}
