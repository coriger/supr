package com.supr.blog.exception;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * @功能： 异常配置  对具体异常进行拦截处理
 * @作者： ljt
 * @时间： 2014-4-21 上午11:16:16
 */
public class ExceptionHandler implements HandlerExceptionResolver{
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		Map<String, Object> model = new HashMap<String, Object>();  
        model.put("ex", ex);  
          
        // 根据不同错误转向不同页面  
        if(ex instanceof Throwable) {  
            return new ModelAndView("/admin/error/error", model);  
        }else if(ex instanceof Exception) {  
            return new ModelAndView("/admin/error/exception", model);  
        } else {  
            return new ModelAndView("/admin/error/404", model);  
        }  
	}
}	
