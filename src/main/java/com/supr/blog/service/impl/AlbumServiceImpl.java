package com.supr.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supr.blog.mapper.AlbumMapper;
import com.supr.blog.model.Album;
import com.supr.blog.service.AlbumService;

@Service
public class AlbumServiceImpl implements AlbumService {
	
	@Autowired
	private AlbumMapper albumMapper;
	
	@Override
	public List<Album> getAllAlbum() {
		return albumMapper.getAllAlbum();
	}
}
