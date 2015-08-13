package com.spy.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */

public class Role implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer vehicle;
	private Integer station;
	private Integer scope;
	private Integer receipt;
	private Integer orders;
	private Integer report;
	private Integer users;
	private Set admins = new HashSet(0);

	// Constructors

	/** default constructor */
	public Role() {
	}

	/** minimal constructor */
	public Role(String name) {
		this.name = name;
	}

	/** full constructor */
	public Role(String name, Integer vehicle, Integer station, Integer scope,
			Integer receipt, Integer orders, Integer report, Integer users,
			Set admins) {
		this.name = name;
		this.vehicle = vehicle;
		this.station = station;
		this.scope = scope;
		this.receipt = receipt;
		this.orders = orders;
		this.report = report;
		this.users = users;
		this.admins = admins;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getVehicle() {
		return this.vehicle;
	}

	public void setVehicle(Integer vehicle) {
		this.vehicle = vehicle;
	}

	public Integer getStation() {
		return this.station;
	}

	public void setStation(Integer station) {
		this.station = station;
	}

	public Integer getScope() {
		return this.scope;
	}

	public void setScope(Integer scope) {
		this.scope = scope;
	}

	public Integer getReceipt() {
		return this.receipt;
	}

	public void setReceipt(Integer receipt) {
		this.receipt = receipt;
	}

	public Integer getOrders() {
		return this.orders;
	}

	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	public Integer getReport() {
		return this.report;
	}

	public void setReport(Integer report) {
		this.report = report;
	}

	public Integer getUsers() {
		return this.users;
	}

	public void setUsers(Integer users) {
		this.users = users;
	}

	public Set getAdmins() {
		return this.admins;
	}

	public void setAdmins(Set admins) {
		this.admins = admins;
	}

}