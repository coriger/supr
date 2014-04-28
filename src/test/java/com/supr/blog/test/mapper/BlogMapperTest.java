package com.supr.blog.test.mapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.supr.blog.mapper.BlogMapper;
import com.supr.blog.model.Blog;

/**
 * @功能：文章Mapper单元测试用例
 * @作者： ljt
 * @时间： 2014-4-21 下午2:22:59
 */
public class BlogMapperTest extends BaseTest {
	
	@Autowired
	private BlogMapper blogMapper;
	
	/**
	 * 新增文章
	 */
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
