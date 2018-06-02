package com.king.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.king.vo.chuangLiFangVo;

public interface CreateChuangLiFangMapper {
	
	List<chuangLiFangVo> select();
	
	List<chuangLiFangVo> getById(@Param("id") Integer id);
	
	int updateChuangLiFang(chuangLiFangVo chuangLiFangVo);
	
}
