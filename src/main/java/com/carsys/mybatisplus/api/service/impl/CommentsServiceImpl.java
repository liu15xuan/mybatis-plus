package com.carsys.mybatisplus.api.service.impl;

import com.carsys.mybatisplus.api.entity.Comments;
import com.carsys.mybatisplus.api.mapper.CommentsMapper;
import com.carsys.mybatisplus.api.service.ICommentsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 评论 服务实现类
 * </p>
 */
@Service
public class CommentsServiceImpl extends ServiceImpl<CommentsMapper, 
Comments> implements ICommentsService {

}