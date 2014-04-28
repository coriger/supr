package com.supr.blog.test.mapper;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(value=SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:/spring/spring-core.xml","classpath:/spring/spring-mvc.xml"})
public class BaseTest {
	
}
