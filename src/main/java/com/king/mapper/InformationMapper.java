package com.king.mapper;

import java.util.List;
import java.util.Map;


public interface InformationMapper {
	List<Map<String, Object>> findAll();
	List<Map<String, Object>> getGsdt();
	List<Map<String, Object>> getPphd();
	List<Map<String, Object>> getHydt();
	List<Map<String, Object>> getXpkx();
	 void save(Map<String, Object> map);
	 void edit(Map<String, Object> map);
}
