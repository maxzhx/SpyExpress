package com.spy.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	private Integer id;
	private Station station;
	private Customer customer;
	private Date sendTime;
	private Date recvTime;
	private Integer status;
	private String note;
	private String path;
	private Double weight;
	private Double volume;
	private Double price;
	private String recvName;
	private String recvPhone;
	private String recvAddress;
	private Set order_Receipts = new HashSet(0);

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(Integer status, String path, Double price, String recvName,
			String recvPhone, String recvAddress) {
		this.status = status;
		this.path = path;
		this.price = price;
		this.recvName = recvName;
		this.recvPhone = recvPhone;
		this.recvAddress = recvAddress;
	}

	/** full constructor */
	public Order(Station station, Customer customer, Date sendTime,
			Date recvTime, Integer status, String note, String path,
			Double weight, Double volume, Double price, String recvName,
			String recvPhone, String recvAddress, Set order_Receipts) {
		this.station = station;
		this.customer = customer;
		this.sendTime = sendTime;
		this.recvTime = recvTime;
		this.status = status;
		this.note = note;
		this.path = path;
		this.weight = weight;
		this.volume = volume;
		this.price = price;
		this.recvName = recvName;
		this.recvPhone = recvPhone;
		this.recvAddress = recvAddress;
		this.order_Receipts = order_Receipts;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Station getStation() {
		return this.station;
	}

	public void setStation(Station station) {
		this.station = station;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Date getRecvTime() {
		return this.recvTime;
	}

	public void setRecvTime(Date recvTime) {
		this.recvTime = recvTime;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
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

	public String getRecvName() {
		return this.recvName;
	}

	public void setRecvName(String recvName) {
		this.recvName = recvName;
	}

	public String getRecvPhone() {
		return this.recvPhone;
	}

	public void setRecvPhone(String recvPhone) {
		this.recvPhone = recvPhone;
	}

	public String getRecvAddress() {
		return this.recvAddress;
	}

	public void setRecvAddress(String recvAddress) {
		this.recvAddress = recvAddress;
	}

	public Set getOrder_Receipts() {
		return this.order_Receipts;
	}

	public void setOrder_Receipts(Set order_Receipts) {
		this.order_Receipts = order_Receipts;
	}

}