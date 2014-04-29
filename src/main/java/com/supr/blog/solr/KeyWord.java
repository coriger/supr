package com.supr.blog.solr;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @功能：标记关键字搜索字段
 * @作者： ljt
 * @时间： 2014-4-29 下午4:23:19
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface KeyWord {

}
