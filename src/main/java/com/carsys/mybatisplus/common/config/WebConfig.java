package com.carsys.mybatisplus.common.config;


import com.carsys.mybatisplus.interceptor.CustomInterceptor;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.servlet.MultipartConfigElement;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    //添加拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new CustomInterceptor()).addPathPatterns("/**").
                excludePathPatterns("/index").
                excludePathPatterns("/admin/login").
                excludePathPatterns("/login").
                excludePathPatterns("/static/**").
                excludePathPatterns("/error").
                excludePathPatterns("/file/upload").
                excludePathPatterns("/pro/gets").
                excludePathPatterns("/pro/get").
                excludePathPatterns("/orders/add").
                excludePathPatterns("/register").
                excludePathPatterns("/logout").
                excludePathPatterns("/");

    }

    @Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        //文件最大KB,MB
//        factory.setMaxFileSize("2MB");
        //设置总上传数据总大小
//        factory.setMaxRequestSize("10MB");
        return factory.createMultipartConfig();
    }
}
        
        