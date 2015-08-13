package com.spy.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Customer entity. @author MyEclipse Persistence Tools
 */

public class Customer implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String pass;
	private String realName;
	private String mobilephone;
	private String unitphone;
	private String address;
	private String sex;
	private Set orders = new HashSet(0);

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** minimal constructor */
	public Customer(String name, String pass, String realName,
			String mobilephone, String address) {
		this.name = name;
		this.pass = pass;
		this.realName = realName;
		this.mobilephone = mobilephone;
		this.address = address;
	}

	/** full constructor */
	public Customer(String name, String pass, String realName,
			String mobilephone, String unitphone, String address, String sex,
			Set orders) {
		this.name = name;
		this.pass = pass;
		this.realName = realName;
		this.mobilephone = mobilephone;
		this.unitphone = unitphone;
		this.address = address;
		this.sex = sex;
		this.orders = orders;
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

	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getMobilephone() {
		return this.mobilephone;
	}

	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone;
	}

	public String getUnitphone() {
		return this.unitphone;
	}

	public void setUnitphone(String unitphone) {
		this.unitphone = unitphone;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

}