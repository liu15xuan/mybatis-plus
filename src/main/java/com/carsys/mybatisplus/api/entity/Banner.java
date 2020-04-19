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
public class Banner implements Serializable {
private static final long serialVersionUID = 1L;

	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;

	/**
	* 轮播图 
	*/
	private String image;

	/**
	* 小标题 
	*/
	private String small;

	/**
	* 大标题 
	*/
	private String big;

	/**
	* 服务项目 
	*/
	private Integer proId;

	@TableField(exist = false)
	private Pro pro;

	public void setPro(Pro pro){
		this.pro = pro;
	}

	/**
	* 创建时间 
	*/
	private LocalDateTime createdTime;

}