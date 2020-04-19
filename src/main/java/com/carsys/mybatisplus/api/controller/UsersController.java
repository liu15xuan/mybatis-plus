package com.carsys.mybatisplus.api.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carsys.mybatisplus.api.entity.Settings;
import com.carsys.mybatisplus.api.entity.Users;
import com.carsys.mybatisplus.api.mapper.SettingsMapper;
import com.carsys.mybatisplus.api.mapper.UsersMapper;
import com.carsys.mybatisplus.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.rmi.CORBA.Util;
import javax.servlet.http.HttpSession;
import java.util.List;import java.util.Map;

import java.util.Map;


@RestController
@RequestMapping("/users")
public class UsersController extends MyCurdController<Users> {

	@Autowired
	private UsersMapper usersMapper;

	@Autowired
    private SettingsMapper settingsMapper;

    
    // 列表
    @GetMapping(value = {"/gets"})
    @ResponseBody
    public ModelAndView getsView(@RequestParam Map<String, Object> map) {
        return this.getList(map, "/users/list.jsp");
    }


    //详情页
    @GetMapping(value = {"/get"})
    @ResponseBody
    public ModelAndView getView(HttpSession httpSession) {
        int uid = (int) httpSession.getAttribute("userId");
        Users users = usersMapper.selectById(uid);
        ModelAndView modelAndView = new ModelAndView("/users/detail.jsp");
        modelAndView.addObject("item", users);
        modelAndView.addObject("settings", this.getSettings());
        return modelAndView;
    }



    private Settings getSettings(){
        List<Settings> settingsList = settingsMapper.selectList(new QueryWrapper<>());
        Settings settings = new Settings();

        if (settingsList.size() > 0){
            settings = settingsList.get(0);
        }
        return settings;
    }


    //删除
    @GetMapping(value = {"/del"})
    @ResponseBody
    public ModelAndView delView(int id) {
        usersMapper.deleteById(id);
        return new ModelAndView("redirect:/users/gets");
    }


    //修改个人信息
    @PostMapping(value = {"/up"})
    @ResponseBody
    public ModelAndView upView(@RequestParam Map<String, Object> map) {
        Users users = new Users();
        users.setId(Integer.valueOf((String)map.get("id")));
        if ("".equals(map.get("password"))){
            users.setPassword(null);
        }else{
            users.setPassword(Utils.calMd5((String) map.get("password")));
        }
        users.setEmail((String)map.get("email"));
        users.setPhone((String)map.get("phone"));
        users.setNickname((String)map.get("nickname"));
        users.setImage((String)map.get("image"));
        usersMapper.updateById(users);
        return new ModelAndView("redirect:/users/get");
    }


    private ModelAndView getList(Map<String, Object> map, String jspPath) {
        map.putIfAbsent("size", "5");
        Page<Users> usersPage = this.extractPageFromRequestMap(map);
        QueryWrapper<Users> queryWrapper = this.extractWrapperFromRequestMap(map);
        IPage<Users> res = usersMapper.selectPage(usersPage, queryWrapper);
        ModelAndView modelAndView = new ModelAndView(jspPath);

        modelAndView.addObject("items", res.getRecords());
        modelAndView.addObject("page", res);
        return modelAndView;
    }


//    管理员操作

    //列表
    @GetMapping(value = {"/admin/list"})
    @ResponseBody
    public ModelAndView adminList(@RequestParam Map<String, Object> map) {
        return this.getList(map, "/admin/users/list.jsp");
    }


    @PostMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAdd(Users users) {
        if (users.getId() == null) {
            //新增
            QueryWrapper<Users> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("username", users.getUsername());
            if (usersMapper.selectCount(queryWrapper) > 0){
                ModelAndView modelAndView = new ModelAndView("/admin/users/add.jsp");
                modelAndView.addObject("obj", users);
                modelAndView.addObject("msg", "此账号已被注册");
                return modelAndView;
            }
            users.setPassword(Utils.calMd5(users.getPassword()));
            usersMapper.insert(users);
        } else {
            //修改
            if ("".equals(users.getPassword())){
                users.setPassword(null);
            }else {
                users.setPassword(Utils.calMd5(users.getPassword()));
            }
            usersMapper.updateById(users);
        }

        return new ModelAndView("redirect:/users/admin/list");
    }


    //新增/修改页面
    @GetMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAddView(Users users) {
        Users users1 = null;
        if (users.getId() != null) {
            users1 = usersMapper.selectById(users.getId());
        }
        ModelAndView modelAndView = new ModelAndView("/admin/users/add.jsp");
        modelAndView.addObject("obj", users1);

        return modelAndView;
    }


    //删除
    @GetMapping(value = {"/admin/del"})
    @ResponseBody
    public ModelAndView adminDelView(int id) {
        usersMapper.deleteById(id);
        return new ModelAndView("redirect:/users/admin/list");
    }
}