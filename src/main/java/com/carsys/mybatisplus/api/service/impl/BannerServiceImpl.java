package com.carsys.mybatisplus.api.service.impl;

import com.carsys.mybatisplus.api.entity.Banner;
import com.carsys.mybatisplus.api.mapper.BannerMapper;
import com.carsys.mybatisplus.api.service.IBannerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 轮播图 服务实现类
 * </p>
 */
@Service
public class BannerServiceImpl extends ServiceImpl<BannerMapper, 
Banner> implements IBannerService {

}