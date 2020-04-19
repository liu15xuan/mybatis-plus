package com.carsys.mybatisplus.api.service.impl;

import com.carsys.mybatisplus.api.entity.Orders;
import com.carsys.mybatisplus.api.mapper.OrdersMapper;
import com.carsys.mybatisplus.api.service.IOrdersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单 服务实现类
 * </p>
 */
@Service
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, 
Orders> implements IOrdersService {

}