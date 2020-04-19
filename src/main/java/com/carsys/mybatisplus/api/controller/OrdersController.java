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
import java.util.List;import java.util.Map;

import java.util.Map;

//订单
@RestController
@RequestMapping("/orders")
public class OrdersController extends MyCurdController<Orders> {

	@Autowired
	private OrdersMapper ordersMapper;

	@Autowired
	private UsersMapper usersMapper;

	@Autowired
	private ProMapper proMapper;

	@Autowired
    private CommentsMapper commentsMapper;


	@Autowired
    private SettingsMapper settingsMapper;

    
    // 列表
    @GetMapping(value = {"/gets"})
    @ResponseBody
    public ModelAndView getsView(@RequestParam Map<String, Object> map, HttpSession httpSession) {
        int userId = (int) httpSession.getAttribute("userId");
        map.put("users_id", userId);
        ModelAndView modelAndView = this.getList(map, "/orders/list.jsp");
        Page<Orders> ordersPage = new Page<>(1, 10);
        QueryWrapper<Orders> queryWrapper = this.extractWrapperFromRequestMap(map);
        queryWrapper.eq("status", 2);
        queryWrapper.orderByDesc("created_time");
        List<Orders> cOrders = ordersMapper.selectPage(ordersPage, queryWrapper).getRecords();
        for (int i=0; i<cOrders.size(); i++){
            Orders orders = cOrders.get(i);
            orders.setPro(proMapper.selectById(orders.getProId()));
        }
        modelAndView.addObject("cOrders", cOrders);
        modelAndView.addObject("settings", this.getSettings());
        return modelAndView;
    }


    //详情页
    @GetMapping(value = {"/get"})
    @ResponseBody
    public ModelAndView getView(int id, HttpSession httpSession) {
        int uid = (int)httpSession.getAttribute("userId");
        return this.detail(id, uid);
    }


    public ModelAndView detail(int id, int uid){
        Orders orders = ordersMapper.selectById(id);
        QueryWrapper<Comments> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("users_id", uid);
        queryWrapper.eq("orders_id", id);
        List<Comments> comments = commentsMapper.selectList(queryWrapper);
        ModelAndView modelAndView = new ModelAndView("/orders/detail.jsp");
        modelAndView.addObject("item", orders);
        if (comments.size() > 0){
            modelAndView.addObject("comment", comments.get(0));
        }
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


    @PostMapping(value = {"/add"})
    @ResponseBody
    public int addView(@RequestBody Orders orders, HttpSession httpSession) {
        if (httpSession.getAttribute("userId") == null){
            return  -2;
        }
        Pro pro = proMapper.selectById(orders.getProId());
        if (pro == null){
            return -1;
        }
        int uid = (int)httpSession.getAttribute("userId");
        QueryWrapper<Orders> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("users_id", uid);
        queryWrapper.eq("pro_id", orders.getProId());
        queryWrapper.eq("status", 0);
        int flag = -1;
        if (ordersMapper.selectCount(queryWrapper) > 0){
            ordersMapper.delete(queryWrapper);
            pro.setOrdersCount(pro.getOrdersCount()-1);
        }else {
            orders.setStatus(0);
            orders.setUsersId(uid);
            flag = ordersMapper.insert(orders);
            pro.setOrdersCount(pro.getOrdersCount()+1);
        }
        proMapper.updateById(pro);
        return flag;
    }

    //删除
    @GetMapping(value = {"/del"})
    @ResponseBody
    public ModelAndView delView(int id) {
        ordersMapper.deleteById(id);
        return new ModelAndView("redirect:/orders/gets");
    }


    private ModelAndView getList(Map<String, Object> map, String jspPath) {
        ModelAndView modelAndView = new ModelAndView(jspPath);

        map.putIfAbsent("size", "5");
        Page<Orders> ordersPage = this.extractPageFromRequestMap(map);
        QueryWrapper<Orders> queryWrapper = this.extractWrapperFromRequestMap(map);
        queryWrapper.orderByDesc("created_time");
        if(map.get("status") != null){
            queryWrapper.eq("status", map.get("status"));
            modelAndView.addObject("status", map.get("status"));
        }
//        if(map.get("userId") !=null){
//            queryWrapper.eq("users_id", map.get("userId"));
//        }
        IPage<Orders> res = ordersMapper.selectPage(ordersPage, queryWrapper);


		for (int i=0; i<res.getRecords().size(); i++){
			Orders orders = res.getRecords().get(i);
			orders.setUsers(usersMapper.selectById(orders.getUsersId()));
		}
		for (int i=0; i<res.getRecords().size(); i++){
			Orders orders = res.getRecords().get(i);
			orders.setPro(proMapper.selectById(orders.getProId()));
		}
        modelAndView.addObject("items", res.getRecords());
        modelAndView.addObject("page", res);
        return modelAndView;
    }


//    管理员操作

    //列表
    @GetMapping(value = {"/admin/list"})
    @ResponseBody
    public ModelAndView adminList(@RequestParam Map<String, Object> map) {
        return this.getList(map, "/admin/orders/list.jsp");
    }


    @PostMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAdd(Orders orders) {
        if (orders.getId() == null) {
            //新增
            ordersMapper.insert(orders);
        } else {
            //修改
            ordersMapper.updateById(orders);
        }

        return new ModelAndView("redirect:/orders/admin/list");
    }


    //新增/修改页面
    @GetMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAddView(Orders orders) {
        Orders orders1 = null;
        if (orders.getId() != null) {
            orders1 = ordersMapper.selectById(orders.getId());
        }
        ModelAndView modelAndView = new ModelAndView("/admin/orders/add.jsp");
        modelAndView.addObject("obj", orders1);
		List<Users> usersList = usersMapper.selectList(new QueryWrapper<>());
		modelAndView.addObject("usersList", usersList);
		List<Pro> proList = proMapper.selectList(new QueryWrapper<>());
		modelAndView.addObject("proList", proList);
        return modelAndView;
    }


    //删除
    @GetMapping(value = {"/admin/del"})
    @ResponseBody
    public ModelAndView adminDelView(int id) {
        ordersMapper.deleteById(id);
        return new ModelAndView("redirect:/orders/admin/list");
    }
}