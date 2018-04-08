package com.king.mapper;

import com.king.model.CreateCubicCustomerWitness;

public interface CreateCubicCustomerWitnessMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CreateCubicCustomerWitness record);

    int insertSelective(CreateCubicCustomerWitness record);

    CreateCubicCustomerWitness selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CreateCubicCustomerWitness record);

    int updateByPrimaryKey(CreateCubicCustomerWitness record);
}