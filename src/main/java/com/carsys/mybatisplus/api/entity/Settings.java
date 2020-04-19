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
public class Settings implements Serializable {
private static final long serialVersionUID = 1L;

	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;

	/**
	* 电话 
	*/
	private String tel;

	/**
	* 邮箱 
	*/
	private String email;

	/**
	* 车库数量 
	*/
	private Integer num;

	private String image;
	private String content;

}