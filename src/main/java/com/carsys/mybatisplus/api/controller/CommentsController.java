package com.carsys.mybatisplus.api.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carsys.mybatisplus.api.mapper.ProMapper;
import com.carsys.mybatisplus.api.entity.Pro;
import com.carsys.mybatisplus.api.mapper.OrdersMapper;
import com.carsys.mybatisplus.api.entity.Orders;
import com.carsys.mybatisplus.api.mapper.UsersMapper;
import com.carsys.mybatisplus.api.entity.Users;
import com.carsys.mybatisplus.api.entity.Comments;
import com.carsys.mybatisplus.api.mapper.CommentsMapper;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;import java.util.Map;

import java.util.Map;

//评论
@RestController
@RequestMapping("/comments")
public class CommentsController extends MyCurdController<Comments> {

	@Autowired
	private CommentsMapper commentsMapper;

	@Autowired
	private UsersMapper usersMapper;

	@Autowired
	private OrdersMapper ordersMapper;

	@Autowired
	private ProMapper proMapper;

    
    // 列表
    @GetMapping(value = {"/gets"})
    @ResponseBody
    public ModelAndView getsView(@RequestParam Map<String, Object> map) {
        return this.getList(map, "/comments/list.jsp");
    }


    //详情页
    @GetMapping(value = {"/get"})
    @ResponseBody
    public ModelAndView getView(int id) {
        Comments comments = commentsMapper.selectById(id);
        ModelAndView modelAndView = new ModelAndView("/comments/detail.jsp");
        modelAndView.addObject("item", comments);
        return modelAndView;
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
        return modelAndView;
    }

    //评价
    @PostMapping(value = {"/add"})
    @ResponseBody
    public ModelAndView add(@RequestParam Map<String, Object> map, HttpSession httpSession) {
        System.out.println(map);
        Comments comments = new Comments();
        comments.setUsersId(Integer.valueOf((String) map.get("usersId")));
        comments.setProId(Integer.valueOf((String)map.get("proId")));
        comments.setOrdersId(Integer.valueOf((String)map.get("orderId")));
        comments.setContent((String)map.get("content"));
        comments.setUsersId((int)httpSession.getAttribute("userId"));
        QueryWrapper<Comments> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("users_id", comments.getUsersId());
        queryWrapper.eq("orders_id", comments.getOrdersId());
        List<Comments> commentsList= commentsMapper.selectList(queryWrapper);
        if (commentsList.size() >=1){
            comments.setId(commentsList.get(0).getId());
            commentsMapper.updateById(comments);
        }else{
            commentsMapper.insert(comments);
        }
        Orders orders = new Orders();
        orders.setId(comments.getOrdersId());
        orders.setStatus(3);
        ordersMapper.updateById(orders);

        return this.detail(comments.getOrdersId(), comments.getUsersId());
    }


    //删除
    @GetMapping(value = {"/del"})
    @ResponseBody
    public ModelAndView delView(int id) {
        commentsMapper.deleteById(id);
        return new ModelAndView("redirect:/comments/gets");
    }


    //删除
    @GetMapping(value = {"/add"})
    @ResponseBody
    public ModelAndView addView(int id) {
        commentsMapper.deleteById(id);
        return new ModelAndView("redirect:/comments/gets");
    }


    private ModelAndView getList(Map<String, Object> map, String jspPath) {
        map.putIfAbsent("size", "5");
        Page<Comments> commentsPage = this.extractPageFromRequestMap(map);
        QueryWrapper<Comments> queryWrapper = this.extractWrapperFromRequestMap(map);
        IPage<Comments> res = commentsMapper.selectPage(commentsPage, queryWrapper);
        ModelAndView modelAndView = new ModelAndView(jspPath);
		for (int i=0; i<res.getRecords().size(); i++){
			Comments comments = res.getRecords().get(i);
			comments.setUsers(usersMapper.selectById(comments.getUsersId()));
		}
		for (int i=0; i<res.getRecords().size(); i++){
			Comments comments = res.getRecords().get(i);
			comments.setOrders(ordersMapper.selectById(comments.getOrdersId()));
		}
		for (int i=0; i<res.getRecords().size(); i++){
			Comments comments = res.getRecords().get(i);
			comments.setPro(proMapper.selectById(comments.getProId()));
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
        return this.getList(map, "/admin/comments/list.jsp");
    }


    @PostMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAdd(Comments comments) {
        if(comments.getIsShow() == null){
            comments.setIsShow(0);
        }
        if (comments.getId() == null) {
            //新增
            commentsMapper.insert(comments);
        } else {
            //修改
            commentsMapper.updateById(comments);
        }

        return new ModelAndView("redirect:/comments/admin/list");
    }


    //新增/修改页面
    @GetMapping(value = {"/admin/add"})
    @ResponseBody
    public ModelAndView adminAddView(Comments comments) {
        Comments comments1 = null;
        if (comments.getId() != null) {
            comments1 = commentsMapper.selectById(comments.getId());
        }
        ModelAndView modelAndView = new ModelAndView("/admin/comments/add.jsp");
        modelAndView.addObject("obj", comments1);
		List<Users> usersList = usersMapper.selectList(new QueryWrapper<>());
		modelAndView.addObject("usersList", usersList);
		List<Orders> ordersList = ordersMapper.selectList(new QueryWrapper<>());
		modelAndView.addObject("ordersList", ordersList);
		List<Pro> proList = proMapper.selectList(new QueryWrapper<>());
		modelAndView.addObject("proList", proList);
        return modelAndView;
    }


    //删除
    @GetMapping(value = {"/admin/del"})
    @ResponseBody
    public ModelAndView adminDelView(int id) {
        commentsMapper.deleteById(id);
        return new ModelAndView("redirect:/comments/admin/list");
    }
}