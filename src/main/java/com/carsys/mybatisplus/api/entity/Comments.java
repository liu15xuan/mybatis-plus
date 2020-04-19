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
public class Comments implements Serializable {
private static final long serialVersionUID = 1L;

	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;

	/**
	* 用户 
	*/
	private Integer usersId;

	@TableField(exist = false)
	private Users users;

	public void setUsers(Users users){
		this.users = users;
	}

	/**
	* 订单 
	*/
	private Integer ordersId;

	@TableField(exist = false)
	private Orders orders;

	public void setOrders(Orders orders){
		this.orders = orders;
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
	* 评语 
	*/
	private String content;

	private Integer isShow;

}