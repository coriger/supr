package com.supr.blog.solr;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @功能：分类字段
 * @作者： ljt
 * @时间： 2014-4-28 上午10:47:33
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface CategoryField {

}
