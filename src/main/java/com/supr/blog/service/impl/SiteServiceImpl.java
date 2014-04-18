package com.supr.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supr.blog.mapper.SiteMapper;
import com.supr.blog.model.SiteInfo;
import com.supr.blog.service.SiteService;

@Service
public class SiteServiceImpl implements SiteService {
	
	@Autowired
	private SiteMapper siteMapper;
	
	@Override
	public SiteInfo getSiteInfo() {
		return siteMapper.getSiteInfo();
	}
}
