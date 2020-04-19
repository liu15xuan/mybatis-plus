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
public class Orders implements Serializable {
private static final long serialVersionUID = 1L;

	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;

	/**
	* 用户id 
	*/
	private Integer usersId;

	@TableField(exist = false)
	private Users users;

	public void setUsers(Users users){
		this.users = users;
	}

	/**
	* 项目 
	*/
	private Integer proId;

	@TableField(exist = false)
	private Pro pro;

	public void setPro(Pro pro){
		this.pro = pro;
	}

	/**
	* URRENT_TIMESTAM 
	*/
	private LocalDateTime createdTime;

	/**
	* 状态 
	*/
	private Integer status;

	/**
	* 进度 
	*/
	private String mark;

}