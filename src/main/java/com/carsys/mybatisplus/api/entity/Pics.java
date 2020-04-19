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
public class Pics implements Serializable {
private static final long serialVersionUID = 1L;

	/**
	* 图片 
	*/
	private String image;

	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;

	/**
	* 标题 
	*/
	private String name;

	/**
	* 创建时间 
	*/
	private LocalDateTime createdTime;

}