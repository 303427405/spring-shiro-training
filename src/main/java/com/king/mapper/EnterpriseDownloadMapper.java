package com.king.mapper;

import java.util.List;

import com.king.model.EnterpriseDownload;

public interface EnterpriseDownloadMapper {
	List<EnterpriseDownload> find(Integer id);

	int del(Integer id);

	int ins(EnterpriseDownload e);
}
