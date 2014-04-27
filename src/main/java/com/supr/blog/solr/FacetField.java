package com.supr.blog.solr;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @功能：分片
 * @作者：ljt
 * @时间：2014-4-27 上午10:08:37
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface FacetField {

}
