package com.spy.entity;

/**
 * Order_Receipt entity. @author MyEclipse Persistence Tools
 */

public class Order_Receipt implements java.io.Serializable {

	// Fields

	private Integer id;
	private Receipt receipt;
	private Order order;
	private Integer status;

	// Constructors

	/** default constructor */
	public Order_Receipt() {
	}

	/** full constructor */
	public Order_Receipt(Receipt receipt, Order order, Integer status) {
		this.receipt = receipt;
		this.order = order;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Receipt getReceipt() {
		return this.receipt;
	}

	public void setReceipt(Receipt receipt) {
		this.receipt = receipt;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}