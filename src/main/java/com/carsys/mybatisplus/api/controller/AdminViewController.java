package com.carsys.mybatisplus.api.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carsys.mybatisplus.api.entity.Orders;
import com.carsys.mybatisplus.api.entity.Pro;
import com.carsys.mybatisplus.api.entity.Users;
import com.carsys.mybatisplus.api.mapper.CommentsMapper;
import com.carsys.mybatisplus.api.mapper.OrdersMapper;
import com.carsys.mybatisplus.api.mapper.ProMapper;
import com.carsys.mybatisplus.api.mapper.UsersMapper;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;



/**
 * <p>
 * 后台登录权限验证
 * </p>
 */
@RestController
@RequestMapping("/admin")
public class AdminViewController {


    @Autowired
    private OrdersMapper ordersMapper;

    @Autowired
    private UsersMapper usersMapper;

    @Autowired
    private CommentsMapper commentsMapper;

    @Autowired
    private ProMapper proMapper;
    
    //首页 
    @GetMapping(value = {"/"})
    @ResponseBody
    public ModelAndView indexView() {
        QueryWrapper<Orders> ordersQueryWrapper = new QueryWrapper<>();
        Page<Orders> ordersPage =  new Page<>();
        ordersPage.setCurrent(1);
        ordersPage.setSize(5);
        ordersQueryWrapper.eq("status", 0);
        List<Orders> res = ordersMapper.selectPage(ordersPage, ordersQueryWrapper).getRecords();
        for (int i=0; i<res.size(); i++){
            Orders orders = res.get(i);
            Pro pro = proMapper.selectById(orders.getProId());
            orders.setPro(pro);
        }


        ModelAndView modelAndView = new ModelAndView("/admin/index.jsp");
        modelAndView.addObject("items", res);

        int usersCount =  usersMapper.selectCount(new QueryWrapper<>());
        modelAndView.addObject("usersCount", usersCount);

        int commentsCount = commentsMapper.selectCount(new QueryWrapper<>());
        modelAndView.addObject("commentsCount", commentsCount);

        int ordersCount = commentsMapper.selectCount(new QueryWrapper<>());
        modelAndView.addObject("ordersCount", ordersCount);

        QueryWrapper<Orders> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("status", 0);

        int waitOrdersCount = ordersMapper.selectCount(queryWrapper);
        modelAndView.addObject("waitOrdersCount", waitOrdersCount);

        return modelAndView;

    }

    //后台登录确认
    @GetMapping(value = {"/index"})
    @ResponseBody
    public ModelAndView index2View() {
        return new ModelAndView("redirect:/admin/");
    }

    
    //后台登录页
    @GetMapping(value = {"/login"})
    @ResponseBody
    public ModelAndView loginView() {
        return new ModelAndView("admin/login.jsp");
    }
    
    
    //退出
    @GetMapping(value = {"/logout"})
    @ResponseBody
    public ModelAndView logoutView(HttpSession httpSession) {
        httpSession.removeAttribute("admin");
        httpSession.removeAttribute("adminId");
        httpSession.removeAttribute("adminRole");
        return new ModelAndView("redirect:/admin/login");
    }
    
}

    