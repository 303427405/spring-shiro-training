package com.king.service;

import java.util.List;

import com.king.vo.chuangLiFangVo;
import com.king.vo.tdevelop;


/**
 * 首页
 * @author tangwenjie
 *
 */
public interface chuangLiFangService {
	
	List<chuangLiFangVo> list();
	
	chuangLiFangVo getById(String id);
	
	int updateChuangLiFang(chuangLiFangVo chuangLiFangVo);
}
