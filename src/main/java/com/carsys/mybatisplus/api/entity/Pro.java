package com.carsys.mybatisplus.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import java.time.LocalDateTime;


@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Pro implements Serializable {
private static final long serialVersionUID = 1L;

	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;

	/**
	* 标题 
	*/
	private String name;

	/**
	* 图片 
	*/
	private String image;

	/**
	* 价格 
	*/
	private String price;

	/**
	* 详情 
	*/
	private String content;

	/**
	* 评论数 
	*/
	private Integer commentsReadCount;

	/**
	* 创建时间 
	*/
	private LocalDateTime createdTime;

	/**
	* 订单数 
	*/
	private Integer ordersCount;

	/**
	* 0 
	*/
	private Integer isOrdersExist;

	@TableField(exist = false)
	private Integer commentsCount;

//	@TableField(exist = false)
//	private Integer ordersCount;
}