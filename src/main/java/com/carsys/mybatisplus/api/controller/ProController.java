package com.carsys.mybatisplus.api.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carsys.mybatisplus.api.entity.*;
import com.carsys.mybatisplus.api.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;import java.util.Map;

import java.util.Map;

//服务管理
@RestController
@RequestMapping("/pro")
public class ProController extends MyCurdController<Pro> {

	@Autowired
	private ProMapper proMapper;

	@Autowired
    private OrdersMapper ordersMapper;


	@Autowired
    private CommentsMapper commentsMapper;

	@Autowired
    private UsersMapper usersMapper;

	@Autowired
    private SettingsMapper settingsMapper;
    
    // 列表
    @GetMapping(value = {"/gets"})
    @ResponseBody
    public ModelAndView getsView(@RequestParam Map<String, Object> map) {
        ModelAndView modelAndView = this.getList(map, "/pro/list.jsp");
        QueryWrapper<Pro> proQueryWrapper = new QueryWrapper<>();
        IPage<Pro> iPage = new Page<>();
        iPage.setSize(10);
        iPage.setCurrent(1);
        proQueryWrapper.orderByDesc("orders_count");
        List<Pro> proList = proMapper.selectList(proQueryWrapper);
        modelAndView.addObject("hotPro", proList);
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

    //详情页
    @GetMapping(value = {"/get"})
    @ResponseBody
    public ModelAndView getView(int id, HttpSession httpSession) {
        Pro pro = proMapper.selectById(id);
        ModelAndView modelAndView = new ModelAndView("/pro/detail.jsp");
        modelAndView.addObject("item", pro);
        if (pro != null){
            QueryWrapper<Comments> commentsQueryWrapper1 = new QueryWrapper<>();
            commentsQueryWrapper1.eq("pro_id", pro.getId());
            pro.setCommentsCount(commentsMapper.selectCount(commentsQueryWrapper1));

            QueryWrapper<Orders> ordersQueryWrapper = new QueryWrapper<>();
            ordersQueryWrapper.eq("pro_id", pro.getId());
            pro.setOrdersCount(ordersMapper.selectCount(ordersQueryWrapper));

            QueryWrapper<Orders> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("users_id", httpSession.getAttribute("userId"));
            queryWrapper.eq("pro_id", id);
//            queryWrapper.eq("pro_id", id);
            queryWrapper.eq("status", 0);
            modelAndView.addObject("isOrder",  ordersMapper.selectCount(queryWrapper));


            QueryWrapper<Comments> commentsQueryWrapper = new QueryWrapper<>();
            commentsQueryWrapper.eq("pro_id", id);
            List<Comments> newCommentsList = new ArrayList<>();
            List<Comments> commentsList = commentsMapper.selectList(commentsQueryWrapper);
            for(int i=0; i< commentsList.size(); i++){
                Comments comments = commentsList.get(i);
                Users users = usersMapper.selectById(comments.getUsersId());
                System.out.println(users);
                if(users != null){
                    comments.setUsers(users);
                    newCommentsList.add(comments);
                }
            }
            modelAndView.addObject("comments", newCommentsList);
        }

        QueryWrapper<Pro> proQueryWrapper = new QueryWrapper<>();
        IPage<Pro> iPage = new Page<>();
        iPage.setSize(5);
        iPage.setCurrent(1);
        proQueryWrapper.orderByDesc("created_time");
        List<Pro> proList = proMapper.selectList(proQueryWrapper);
        modelAndView.addObject("hotPro", proList);
        modelAndView.addObject("settings", this.getSettings());
        return modelAndView;
    }


    //删除
    @GetMapping(value = {"/del"})
    @ResponseBody
    public ModelAndView delView(int id) {
        proMapper.deleteById(id);
        return new ModelAndView("redirect:/pro/gets");
    }


    private ModelAndView getList(Map<String, Object> map, String jspPath) {
        map.putIfAbsent("size", "5");
        Page<Pro> proPage = this.extractPageFromRequestMap(map);
        QueryWrapper<Pro> queryWrapper = this.extractWrapperFromRequestMap(map);
        IPage<Pro> res = proMapper.selectPage(proPage, queryWrapper);
        ModelAndView modelAndView = new ModelAndView(jspPath);
        List<Pro> proList = res.getRecords();
        for (int i=0; i< proList.size(); i++){
            Pro pro = proList.get(i);
            QueryWrapper<Comments> commentsQueryWrapper = new QueryWrapper<>();
            commentsQueryWrapper.eq("pro_id", pro.getId());
            pro.setCommentsCount(commentsMapper.selectCount(commentsQueryWrapper));

            QueryWrapper<Orders> ordersQueryWrapper = new QueryWrapper<>();
            ordersQueryWrapper.eq("pro_id", pro.getId());
            pro.setOrdersCount(ordersMapper.selectCount(ordersQueryWrapper));
        }
        modelAndView.addObject("items", proList);
        modelAndView.addObject("page", res);
        return modelAndView;
    }


//    管理员操作

    //列表
    @GetMapping(value = {"/admin/list"})
    @ResponseBody
    public ModelAndView adminList(@RequestParam Map<String, Object> map) {
        return this.getList(map, "/admin/pro/list.jsp");
    }


    @PostMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAdd(Pro pro) {
        if (pro.getId() == null) {
            //新增
            proMapper.insert(pro);
        } else {
            //修改
            proMapper.updateById(pro);
        }

        return new ModelAndView("redirect:/pro/admin/list");
    }


    //新增/修改页面
    @GetMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAddView(Pro pro) {
        Pro pro1 = null;
        if (pro.getId() != null) {
            pro1 = proMapper.selectById(pro.getId());
        }
        ModelAndView modelAndView = new ModelAndView("/admin/pro/add.jsp");
        modelAndView.addObject("obj", pro1);

        return modelAndView;
    }


    //删除
    @GetMapping(value = {"/admin/del"})
    @ResponseBody
    public ModelAndView adminDelView(int id) {
        proMapper.deleteById(id);
        return new ModelAndView("redirect:/pro/admin/list");
    }
}