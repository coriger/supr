package com.supr.blog.redis;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring/spring-redis.xml"})
public class RedisTemplateTest {
	
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	
	private RedisSerializer<String> getRedisSerializer() {
		return redisTemplate.getStringSerializer();
	}
	
	@Test
	public void testSet(){
		redisTemplate.execute(new RedisCallback<Boolean>() {
			
			@Override
			public Boolean doInRedis(RedisConnection con) throws DataAccessException {
				con.set(getRedisSerializer().serialize("name"), getRedisSerializer().serialize("lujiangtao1"));
				return true;
			}
			
		});
	}
	
	@Test
	public void testDelete(){
		redisTemplate.execute(new RedisCallback<Boolean>() {
			
			@Override
			public Boolean doInRedis(RedisConnection con) throws DataAccessException {
				con.del(getRedisSerializer().serialize("name"));
				return true;
			}
			
		});
	}
	
	@Test
	public void testGet(){
		String message = redisTemplate.execute(new RedisCallback<String>() {
			
			@Override
			public String doInRedis(RedisConnection con) throws DataAccessException {
				return new String(con.get(getRedisSerializer().serialize("name")));
			}
			
		});
		System.out.println(message);
	}

}
