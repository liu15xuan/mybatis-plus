package com.carsys.mybatisplus.api.service.impl;

import com.carsys.mybatisplus.api.entity.Settings;
import com.carsys.mybatisplus.api.mapper.SettingsMapper;
import com.carsys.mybatisplus.api.service.ISettingsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 设置 服务实现类
 * </p>
 */
@Service
public class SettingsServiceImpl extends ServiceImpl<SettingsMapper, 
Settings> implements ISettingsService {

}