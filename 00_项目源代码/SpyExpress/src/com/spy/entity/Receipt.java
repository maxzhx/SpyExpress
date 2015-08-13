package com.spy.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Receipt entity. @author MyEclipse Persistence Tools
 */

public class Receipt implements java.io.Serializable {

	// Fields

	private Integer id;
	private Station stationByDestStaId;
	private Admin adminByRecipientId;
	private Station stationBySourceStaId;
	private Admin adminByCarrierId;
	private Date sendTime;
	private Date recvTime;
	private Double weight;
	private Double volume;
	private Double income;
	private Integer status;
	private Set vehicles = new HashSet(0);
	private Set order_Receipts = new HashSet(0);

	// Constructors

	/** default constructor */
	public Receipt() {
	}

	/** minimal constructor */
	public Receipt(Double weight, Double volume, Double income, Integer status) {
		this.weight = weight;
		this.volume = volume;
		this.income = income;
		this.status = status;
	}

	/** full constructor */
	public Receipt(Station stationByDestStaId, Admin adminByRecipientId,
			Station stationBySourceStaId, Admin adminByCarrierId,
			Date sendTime, Date recvTime, Double weight, Double volume,
			Double income, Integer status, Set vehicles, Set order_Receipts) {
		this.stationByDestStaId = stationByDestStaId;
		this.adminByRecipientId = adminByRecipientId;
		this.stationBySourceStaId = stationBySourceStaId;
		this.adminByCarrierId = adminByCarrierId;
		this.sendTime = sendTime;
		this.recvTime = recvTime;
		this.weight = weight;
		this.volume = volume;
		this.income = income;
		this.status = status;
		this.vehicles = vehicles;
		this.order_Receipts = order_Receipts;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Station getStationByDestStaId() {
		return this.stationByDestStaId;
	}

	public void setStationByDestStaId(Station stationByDestStaId) {
		this.stationByDestStaId = stationByDestStaId;
	}

	public Admin getAdminByRecipientId() {
		return this.adminByRecipientId;
	}

	public void setAdminByRecipientId(Admin adminByRecipientId) {
		this.adminByRecipientId = adminByRecipientId;
	}

	public Station getStationBySourceStaId() {
		return this.stationBySourceStaId;
	}

	public void setStationBySourceStaId(Station stationBySourceStaId) {
		this.stationBySourceStaId = stationBySourceStaId;
	}

	public Admin getAdminByCarrierId() {
		return this.adminByCarrierId;
	}

	public void setAdminByCarrierId(Admin adminByCarrierId) {
		this.adminByCarrierId = adminByCarrierId;
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

	public Double getIncome() {
		return this.income;
	}

	public void setIncome(Double income) {
		this.income = income;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set getVehicles() {
		return this.vehicles;
	}

	public void setVehicles(Set vehicles) {
		this.vehicles = vehicles;
	}

	public Set getOrder_Receipts() {
		return this.order_Receipts;
	}

	public void setOrder_Receipts(Set order_Receipts) {
		this.order_Receipts = order_Receipts;
	}

}