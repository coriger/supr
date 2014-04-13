package com.supr.blog.mapper;

import com.supr.blog.model.Admin;

public interface AdminMapper {
	
	void addAdmin(Admin admin);

	Admin getAdminByEmail(String email);

	Admin getAdminByName(String username);

	Admin adminExists(Admin admin);
	
}