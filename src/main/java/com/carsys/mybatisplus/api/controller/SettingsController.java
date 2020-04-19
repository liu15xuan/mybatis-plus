package com.carsys.mybatisplus.api.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carsys.mybatisplus.api.entity.Settings;
import com.carsys.mybatisplus.api.mapper.SettingsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

import java.util.Map;


@RestController
@RequestMapping("/settings")
public class SettingsController extends MyCurdController<Settings> {

    @Autowired
    private SettingsMapper settingsMapper;


    // 列表
    @GetMapping(value = {"/gets"})
    @ResponseBody
    public ModelAndView getsView(@RequestParam Map<String, Object> map) {
        return this.getList(map, "/settings/list.jsp");
    }


    //详情页
    @GetMapping(value = {"/get"})
    @ResponseBody
    public ModelAndView getView(int id) {
        Settings settings = settingsMapper.selectById(id);
        ModelAndView modelAndView = new ModelAndView("/settings/detail.jsp");
        modelAndView.addObject("item", settings);
        return modelAndView;
    }


    //删除
    @GetMapping(value = {"/del"})
    @ResponseBody
    public ModelAndView delView(int id) {
        settingsMapper.deleteById(id);
        return new ModelAndView("redirect:/settings/gets");
    }


    private ModelAndView getList(Map<String, Object> map, String jspPath) {
        map.putIfAbsent("size", "5");
        Page<Settings> settingsPage = this.extractPageFromRequestMap(map);
        QueryWrapper<Settings> queryWrapper = this.extractWrapperFromRequestMap(map);
        IPage<Settings> res = settingsMapper.selectPage(settingsPage, queryWrapper);
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
        return this.getList(map, "/admin/settings/list.jsp");
    }


    @PostMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAdd(Settings settings) {
        if (settings.getId() == null) {
            //新增
            settingsMapper.insert(settings);
        } else {
            //修改
            settingsMapper.updateById(settings);
        }

        return new ModelAndView("redirect:/settings/admin/add");
    }


    //新增/修改页面
    @GetMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAddView() {
        List<Settings> settingsList = settingsMapper.selectList(new QueryWrapper<>());
        Settings settings1 = null;
        if (settingsList.size() > 0) {
            settings1 = settingsMapper.selectById(settingsList.get(0));
        }
        ModelAndView modelAndView = new ModelAndView("/admin/settings/add.jsp");
        modelAndView.addObject("obj", settings1);

        return modelAndView;
    }


    //删除
    @GetMapping(value = {"/admin/del"})
    @ResponseBody
    public ModelAndView adminDelView(int id) {
        settingsMapper.deleteById(id);
        return new ModelAndView("redirect:/settings/admin/list");
    }
}