package com.carsys.mybatisplus.api.service.impl;

import com.carsys.mybatisplus.api.entity.Users;
import com.carsys.mybatisplus.api.mapper.UsersMapper;
import com.carsys.mybatisplus.api.service.IUsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户 服务实现类
 * </p>
 */
@Service
public class UsersServiceImpl extends ServiceImpl<UsersMapper, 
Users> implements IUsersService {

}