package com.king.mapper;

import java.util.List;

import com.king.model.Enterprise;

public interface EnterPriseMapper {
	List<Enterprise> getbyeid(Integer eid);
	Enterprise getbyid(Integer id);
	int ins(Enterprise e);
	int del(Integer id);
	int upd(Enterprise e);
}
