package com.carsys.mybatisplus.api.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carsys.mybatisplus.api.entity.Pics;
import com.carsys.mybatisplus.api.mapper.PicsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;import java.util.Map;

import java.util.Map;

//广告管理
@RestController
@RequestMapping("/pics")
public class PicsController extends MyCurdController<Pics> {

	@Autowired
	private PicsMapper picsMapper;

    
    // 列表
    @GetMapping(value = {"/gets"})
    @ResponseBody
    public ModelAndView getsView(@RequestParam Map<String, Object> map) {
        return this.getList(map, "/pics/list.jsp");
    }


    //详情页
    @GetMapping(value = {"/get"})
    @ResponseBody
    public ModelAndView getView(int id) {
        Pics pics = picsMapper.selectById(id);
        ModelAndView modelAndView = new ModelAndView("/pics/detail.jsp");
        modelAndView.addObject("item", pics);
        return modelAndView;
    }


    //删除
    @GetMapping(value = {"/del"})
    @ResponseBody
    public ModelAndView delView(int id) {
        picsMapper.deleteById(id);
        return new ModelAndView("redirect:/pics/gets");
    }


    private ModelAndView getList(Map<String, Object> map, String jspPath) {
        map.putIfAbsent("size", "5");
        Page<Pics> picsPage = this.extractPageFromRequestMap(map);
        QueryWrapper<Pics> queryWrapper = this.extractWrapperFromRequestMap(map);
        IPage<Pics> res = picsMapper.selectPage(picsPage, queryWrapper);
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
        return this.getList(map, "/admin/pics/list.jsp");
    }


    @PostMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAdd(Pics pics) {
        if (pics.getId() == null) {
            //新增
            picsMapper.insert(pics);
        } else {
            //修改
            picsMapper.updateById(pics);
        }

        return new ModelAndView("redirect:/pics/admin/list");
    }


    //新增/修改页面
    @GetMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAddView(Pics pics) {
        Pics pics1 = null;
        if (pics.getId() != null) {
            pics1 = picsMapper.selectById(pics.getId());
        }
        ModelAndView modelAndView = new ModelAndView("/admin/pics/add.jsp");
        modelAndView.addObject("obj", pics1);

        return modelAndView;
    }


    //删除
    @GetMapping(value = {"/admin/del"})
    @ResponseBody
    public ModelAndView adminDelView(int id) {
        picsMapper.deleteById(id);
        return new ModelAndView("redirect:/pics/admin/list");
    }
}