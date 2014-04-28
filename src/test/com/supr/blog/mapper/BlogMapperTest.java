package com.supr.blog.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.supr.blog.model.Blog;

@RunWith(value=SpringJUnit4ClassRunner.class)
@ContextConfiguration(value="spring/spring-core.xml,spring/spring-mvc.xml")
public class BlogMapperTest {
	
	@Autowired
	private BlogMapper blogMapper;
	
	@Test
	public void addBlog(){
		Blog blog = new Blog();
		blog.setTitle("junit测试");
		blog.setContent("junit 是个不错的东西");
		blog.setPostFix("/junit");
		blog.setHits(0);
		blog.setCommentSum(0);
		blog.setTagIds("1");
		blog.setUserId(1);
		
		blogMapper.addBlog(blog);
	}
}
