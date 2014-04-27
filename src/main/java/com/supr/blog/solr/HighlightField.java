package com.supr.blog.solr;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @功能：高亮注解  标注在需要高亮的字段上
 * @作者：ljt
 * @时间：2014-4-27 上午9:26:15
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface HighlightField {

}
