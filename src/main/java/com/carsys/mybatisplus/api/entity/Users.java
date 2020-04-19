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
public class Users implements Serializable {
private static final long serialVersionUID = 1L;

	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;

	/**
	* 账号 
	*/
	private String username;

	/**
	* 姓名 
	*/
	private String nickname;

	/**
	* 创建时间 
	*/
	private LocalDateTime createdTime;

	/**
	* 头像 
	*/
	private String image;

	/**
	* 角色 
	*/
	private Integer role;

	/**
	* 密码 
	*/
	private String password;

	private String email;

	private String phone;

	private String address;

}