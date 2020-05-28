package com.springboot.test;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


/**
 * @Author YQ
 * @Data 2020/5/26 15:08
 * @Description  此规则不能与properties等其他规则同时作用
 * @Version 1.0
 */
@Configuration
public class MyWebMvcConfigAdapter extends WebMvcConfigurerAdapter {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/mystatic/");
    }
}
