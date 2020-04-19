package com.carsys.mybatisplus.api.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carsys.mybatisplus.api.mapper.ProMapper;
import com.carsys.mybatisplus.api.entity.Pro;
import com.carsys.mybatisplus.api.entity.Banner;
import com.carsys.mybatisplus.api.mapper.BannerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;import java.util.Map;

import java.util.Map;


@RestController
@RequestMapping("/banner")
public class BannerController extends MyCurdController<Banner> {

	@Autowired
	private BannerMapper bannerMapper;

	@Autowired
	private ProMapper proMapper;

    
    // 列表
    @GetMapping(value = {"/gets"})
    @ResponseBody
    public ModelAndView getsView(@RequestParam Map<String, Object> map) {
        return this.getList(map, "/banner/list.jsp");
    }


    //详情页
    @GetMapping(value = {"/get"})
    @ResponseBody
    public ModelAndView getView(int id) {
        Banner banner = bannerMapper.selectById(id);
        ModelAndView modelAndView = new ModelAndView("/banner/detail.jsp");
        modelAndView.addObject("item", banner);
        return modelAndView;
    }


    //删除
    @GetMapping(value = {"/del"})
    @ResponseBody
    public ModelAndView delView(int id) {
        bannerMapper.deleteById(id);
        return new ModelAndView("redirect:/banner/gets");
    }

//轮播图显示
    private ModelAndView getList(Map<String, Object> map, String jspPath) {
        map.putIfAbsent("size", "5");
        Page<Banner> bannerPage = this.extractPageFromRequestMap(map);
        QueryWrapper<Banner> queryWrapper = this.extractWrapperFromRequestMap(map);
        IPage<Banner> res = bannerMapper.selectPage(bannerPage, queryWrapper);
        ModelAndView modelAndView = new ModelAndView(jspPath);
		for (int i=0; i<res.getRecords().size(); i++){
			Banner banner = res.getRecords().get(i);
			banner.setPro(proMapper.selectById(banner.getProId()));
		}
        modelAndView.addObject("items", res.getRecords());
        modelAndView.addObject("page", res);
        return modelAndView;
    }


//    管理员操作

    //轮播图列表
    @GetMapping(value = {"/admin/list"})
    @ResponseBody
    public ModelAndView adminList(@RequestParam Map<String, Object> map) {
        return this.getList(map, "/admin/banner/list.jsp");
    }


    @PostMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAdd(Banner banner) {
        if (banner.getId() == null) {
            //新增
            bannerMapper.insert(banner);
        } else {
            //修改
            bannerMapper.updateById(banner);
        }

        return new ModelAndView("redirect:/banner/admin/list");
    }


    //新增/修改页面
    @GetMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAddView(Banner banner) {
        Banner banner1 = null;
        if (banner.getId() != null) {
            banner1 = bannerMapper.selectById(banner.getId());
        }
        ModelAndView modelAndView = new ModelAndView("/admin/banner/add.jsp");
        modelAndView.addObject("obj", banner1);
		List<Pro> proList = proMapper.selectList(new QueryWrapper<>());
		modelAndView.addObject("proList", proList);
        return modelAndView;
    }


    //删除
    @GetMapping(value = {"/admin/del"})
    @ResponseBody
    public ModelAndView adminDelView(int id) {
        bannerMapper.deleteById(id);
        return new ModelAndView("redirect:/banner/admin/list");
    }
}