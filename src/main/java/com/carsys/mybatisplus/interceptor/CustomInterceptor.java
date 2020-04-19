package com.carsys.mybatisplus.interceptor;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carsys.mybatisplus.api.entity.Settings;
import com.carsys.mybatisplus.api.entity.Users;
import com.carsys.mybatisplus.api.mapper.SettingsMapper;
import com.carsys.mybatisplus.api.service.ISettingsService;
import com.carsys.mybatisplus.api.service.impl.SettingsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class CustomInterceptor implements HandlerInterceptor {


    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse
            httpServletResponse, Object o)
            throws Exception {

        String url = httpServletRequest.getRequestURI();
        if (url.contains("admin")) {
            HttpSession httpSession = httpServletRequest.getSession();
            Users admin = (Users) httpSession.getAttribute("admin");
            if (admin == null){
                httpServletResponse.sendRedirect("/admin/login");
                return false;
            }
        }else{
            HttpSession httpSession = httpServletRequest.getSession();
            Users user = (Users) httpSession.getAttribute("user");
            if(user == null){
                httpServletResponse.sendRedirect("/index");
                return false;
            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse
            httpServletResponse, Object o, ModelAndView modelAndView)
            throws Exception {
    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse
            httpServletResponse, Object o, Exception e)
            throws Exception {
    }
}
        