package com.supr.blog.model;

/**
 * @功能：相册
 * @作者： ljt
 * @时间： 2014-4-18 下午5:04:17
 */
public class Album {
	
	private String albumId;
	
	private String albumName;
	
	// 相册缩略图
	private String albumUrl;

	// 相册说明
	private String albumInfo;
	
	public String getAlbumUrl() {
		return albumUrl;
	}

	public void setAlbumUrl(String albumUrl) {
		this.albumUrl = albumUrl;
	}

	public String getAlbumInfo() {
		return albumInfo;
	}

	public void setAlbumInfo(String albumInfo) {
		this.albumInfo = albumInfo;
	}

	public String getAlbumId() {
		return albumId;
	}

	public void setAlbumId(String albumId) {
		this.albumId = albumId;
	}

	public String getAlbumName() {
		return albumName;
	}

	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
}
