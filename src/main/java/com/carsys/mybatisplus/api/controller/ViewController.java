
    package com.carsys.mybatisplus.api.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carsys.mybatisplus.api.entity.*;
import com.carsys.mybatisplus.api.mapper.*;
import com.carsys.mybatisplus.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 * 页面 控制器
 * </p>
 */
@RestController
@RequestMapping("")
public class ViewController {

    @Autowired
    private UsersMapper usersMapper;

    @Autowired
    private BannerMapper bannerMapper;


    @Autowired
    private PicsMapper picsMapper;


    @Autowired
    private SettingsMapper settingsMapper;

    @Autowired
    private CommentsMapper commentsMapper;

    //首页 
    @GetMapping(value = {"/"})
    @ResponseBody
    public ModelAndView indexView() {
        return new ModelAndView("redirect:/index");
    }

    @GetMapping(value = {"/index"})
    @ResponseBody
    public ModelAndView index2View() {
        List<Banner> bannerList = bannerMapper.selectList(new QueryWrapper<>());
        List<Pics> picsList  = picsMapper.selectList(new QueryWrapper<>());
        List<Settings> settingsList = settingsMapper.selectList(new QueryWrapper<>());
        QueryWrapper<Comments> commentsQueryWrapper = new QueryWrapper<>();
        commentsQueryWrapper.eq("is_show", 1);
        List<Comments> commentsList = commentsMapper.selectList(commentsQueryWrapper);
        Settings settings = new Settings();

        if (settingsList.size() > 0){
            settings = settingsList.get(0);
        }

        ModelAndView modelAndView =  new ModelAndView("/index.jsp");
        modelAndView.addObject("bannerList", bannerList);
        modelAndView.addObject("picsList", picsList);
        modelAndView.addObject("settings", settings);
        modelAndView.addObject("commentsList", commentsList);

        return modelAndView;
    }


    //登录页
    @GetMapping(value = {"/login"})
    @ResponseBody
    public ModelAndView loginView() {
        return new ModelAndView("/login.jsp");
    }


    //登录
    private ModelAndView login(Users users, HttpSession httpSession, String uri) {
        System.out.println(users);
        QueryWrapper<Users> usersQueryWrapper = new QueryWrapper<>();
        usersQueryWrapper.eq("username", users.getUsername());
        usersQueryWrapper.eq("password", Utils.calMd5(users.getPassword()));
        usersQueryWrapper.eq("role", users.getRole());
        List<Users> usersList = usersMapper.selectList(usersQueryWrapper);
        ModelAndView modelAndView = new ModelAndView();
        if (usersList.size() == 0) {
            modelAndView.addObject("msg", "用户名或密码错误");
            modelAndView.setViewName(uri + "/login.jsp");
        } else {
            Users users1 = usersList.get(0);
            modelAndView.setViewName("redirect:" + uri + "/index/");
            if (users1.getRole() == 0) {
                httpSession.setAttribute("user", users1);
                httpSession.setAttribute("userId", users1.getId());
                httpSession.setAttribute("role", users1.getRole());
            }else{
                httpSession.setAttribute("admin", users1);
                httpSession.setAttribute("adminId", users1.getId());
                httpSession.setAttribute("adminRole", users1.getRole());
            }
        }
        return modelAndView;
    }


    //普通用户登录
    @PostMapping(value = {"/login"})
    @ResponseBody
    public ModelAndView login(Users users, HttpSession httpSession) {
        return this.login(users, httpSession, "");
    }

    //管理员登录
    @PostMapping(value = {"/admin/login"})
    @ResponseBody
    public ModelAndView adminLogin(Users users, HttpSession httpSession) {
        return this.login(users, httpSession, "/admin");
    }


    //退出
    @GetMapping(value = {"/logout"})
    @ResponseBody
    public ModelAndView logoutView(HttpSession httpSession) {
        httpSession.removeAttribute("user");
        httpSession.removeAttribute("userId");
        httpSession.removeAttribute("role");
        return new ModelAndView("redirect:/login");
    }

    //注册页面
    @GetMapping(value = {"/register"})
    @ResponseBody
    public ModelAndView registerView(){
        return new ModelAndView("register.jsp");
    }

    //注册
    @PostMapping(value = {"/register"})
    @ResponseBody
    public ModelAndView register(Users users, HttpSession httpSession) {
        QueryWrapper<Users>  queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", users.getUsername());
        ModelAndView modelAndView = new ModelAndView();
        if (usersMapper.selectList(queryWrapper).size() > 0){
            modelAndView.setViewName("register.jsp");
            modelAndView.addObject("msg", "此账号已被注册");
        } else {
            users.setPassword(Utils.calMd5(users.getPassword()));
            users.setImage("/static/upload/2e87eb45fba6474296b729a0867e6b87.jpg");
            users.setRole(0);
            usersMapper.insert(users);
            Users users1 = usersMapper.selectOne(queryWrapper);
            httpSession.setAttribute("user", users1);
            httpSession.setAttribute("role", 0);
            httpSession.setAttribute("userId", users1.getId());
            modelAndView.setViewName("redirect:/index");
        }
        return modelAndView;
    }

}

    