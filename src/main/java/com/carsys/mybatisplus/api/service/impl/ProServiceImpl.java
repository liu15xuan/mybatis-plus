package com.carsys.mybatisplus.api.service.impl;

import com.carsys.mybatisplus.api.entity.Pro;
import com.carsys.mybatisplus.api.mapper.ProMapper;
import com.carsys.mybatisplus.api.service.IProService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务 服务实现类
 * </p>
 */
@Service
public class ProServiceImpl extends ServiceImpl<ProMapper, 
Pro> implements IProService {

}