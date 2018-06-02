package com.king.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.king.mapper.CreateChuangLiFangMapper;
import com.king.service.chuangLiFangService;
import com.king.vo.chuangLiFangVo;

/**
 * 首页
 * @author tangwenjie
 *
 */
@Service
@SuppressWarnings("all")
public class chuangLiFangServiceImpl implements chuangLiFangService{
	
	@Autowired
	private CreateChuangLiFangMapper CreateChuangLiFangMapper;
	
	
	@Override
	public List<chuangLiFangVo> list() {
		List<chuangLiFangVo> list = new ArrayList<>();
		chuangLiFangVo  tlo = new chuangLiFangVo();
		return CreateChuangLiFangMapper.select();
	}
	
	@Override
	public chuangLiFangVo getById(String id){
		List<chuangLiFangVo> list= CreateChuangLiFangMapper.getById(Integer.valueOf(id));
		chuangLiFangVo vo = list.get(0);
		return vo;
	}
	
	@Override
	public int updateChuangLiFang(chuangLiFangVo chuangLiFangVo){
		return CreateChuangLiFangMapper.updateChuangLiFang(chuangLiFangVo);
	}
}
