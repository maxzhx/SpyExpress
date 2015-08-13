package com.spy.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Station entity. @author MyEclipse Persistence Tools
 */

public class Station implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String address;
	private String note;
	private String phone;
	private Set receiptsForSourceStaId = new HashSet(0);
	private Set vehiclesForSourceId = new HashSet(0);
	private Set receiptsForDestStaId = new HashSet(0);
	private Set orders = new HashSet(0);
	private Set vehiclesForDestId = new HashSet(0);
	private Set scopesForSourceStaId = new HashSet(0);
	private Set scopesForDestStaId = new HashSet(0);
	private Set reports = new HashSet(0);
	private Set admins = new HashSet(0);

	// Constructors

	/** default constructor */
	public Station() {
	}

	/** minimal constructor */
	public Station(String name, String address) {
		this.name = name;
		this.address = address;
	}

	/** full constructor */
	public Station(String name, String address, String note, String phone,
			Set receiptsForSourceStaId, Set vehiclesForSourceId,
			Set receiptsForDestStaId, Set orders, Set vehiclesForDestId,
			Set scopesForSourceStaId, Set scopesForDestStaId, Set reports,
			Set admins) {
		this.name = name;
		this.address = address;
		this.note = note;
		this.phone = phone;
		this.receiptsForSourceStaId = receiptsForSourceStaId;
		this.vehiclesForSourceId = vehiclesForSourceId;
		this.receiptsForDestStaId = receiptsForDestStaId;
		this.orders = orders;
		this.vehiclesForDestId = vehiclesForDestId;
		this.scopesForSourceStaId = scopesForSourceStaId;
		this.scopesForDestStaId = scopesForDestStaId;
		this.reports = reports;
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

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Set getReceiptsForSourceStaId() {
		return this.receiptsForSourceStaId;
	}

	public void setReceiptsForSourceStaId(Set receiptsForSourceStaId) {
		this.receiptsForSourceStaId = receiptsForSourceStaId;
	}

	public Set getVehiclesForSourceId() {
		return this.vehiclesForSourceId;
	}

	public void setVehiclesForSourceId(Set vehiclesForSourceId) {
		this.vehiclesForSourceId = vehiclesForSourceId;
	}

	public Set getReceiptsForDestStaId() {
		return this.receiptsForDestStaId;
	}

	public void setReceiptsForDestStaId(Set receiptsForDestStaId) {
		this.receiptsForDestStaId = receiptsForDestStaId;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

	public Set getVehiclesForDestId() {
		return this.vehiclesForDestId;
	}

	public void setVehiclesForDestId(Set vehiclesForDestId) {
		this.vehiclesForDestId = vehiclesForDestId;
	}

	public Set getScopesForSourceStaId() {
		return this.scopesForSourceStaId;
	}

	public void setScopesForSourceStaId(Set scopesForSourceStaId) {
		this.scopesForSourceStaId = scopesForSourceStaId;
	}

	public Set getScopesForDestStaId() {
		return this.scopesForDestStaId;
	}

	public void setScopesForDestStaId(Set scopesForDestStaId) {
		this.scopesForDestStaId = scopesForDestStaId;
	}

	public Set getReports() {
		return this.reports;
	}

	public void setReports(Set reports) {
		this.reports = reports;
	}

	public Set getAdmins() {
		return this.admins;
	}

	public void setAdmins(Set admins) {
		this.admins = admins;
	}

	
}