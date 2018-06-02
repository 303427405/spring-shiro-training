package com.king.information.service;

import java.util.List;
import java.util.Map;
public interface InformationService{
	public List<Map<String, Object>> findAll();
	public List<Map<String, Object>> getGsdt();
	public List<Map<String, Object>> getPphd();
	public List<Map<String, Object>> getHydt();
	public List<Map<String, Object>> getXpkx();
	public void save(Map<String, Object> map);
	public void edit(Map<String, Object> map);

}
