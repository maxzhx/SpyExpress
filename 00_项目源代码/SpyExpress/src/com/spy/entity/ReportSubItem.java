package com.spy.entity;

import java.util.Date;

/**
 * 配送点报表内容条目
 */

public class ReportSubItem  {

	private Integer orderId;
	private Double weight;
	private Double volume;
	private Double price;
	private String sender;
	private String receiver;
	private Date time;


	public ReportSubItem() {
	}

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Double getWeight() {
		return this.weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public Double getVolume() {
		return this.volume;
	}

	public void setVolume(Double volume) {
		this.volume = volume;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getSender() {
		return this.sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return this.receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date recvTime) {
		this.time = recvTime;
	}

	public String toString() {
		return String.format("%d %.2f %.2f %.2f %s %s %s", this.orderId, this.weight,
				this.volume, this.price, this.sender, this.receiver,this.time);
	}

	

}