package com.spy.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */

public class Admin implements java.io.Serializable {

	// Fields

	private Integer id;
	private Station station;
	private Role role;
	private String name;
	private String pass;
	private String realName;
	private String sex;
	private String phone;
	private String occupation;
	private Set receiptsForRecipientId = new HashSet(0);
	private Set receiptsForCarrierId = new HashSet(0);

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(String name, String pass, String realName, String occupation) {
		this.name = name;
		this.pass = pass;
		this.realName = realName;
		this.occupation = occupation;
	}

	/** full constructor */
	public Admin(Station station, Role role, String name, String pass,
			String realName, String sex, String phone, String occupation,
			Set receiptsForRecipientId, Set receiptsForCarrierId) {
		this.station = station;
		this.role = role;
		this.name = name;
		this.pass = pass;
		this.realName = realName;
		this.sex = sex;
		this.phone = phone;
		this.occupation = occupation;
		this.receiptsForRecipientId = receiptsForRecipientId;
		this.receiptsForCarrierId = receiptsForCarrierId;
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

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
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

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOccupation() {
		return this.occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public Set getReceiptsForRecipientId() {
		return this.receiptsForRecipientId;
	}

	public void setReceiptsForRecipientId(Set receiptsForRecipientId) {
		this.receiptsForRecipientId = receiptsForRecipientId;
	}

	public Set getReceiptsForCarrierId() {
		return this.receiptsForCarrierId;
	}

	public void setReceiptsForCarrierId(Set receiptsForCarrierId) {
		this.receiptsForCarrierId = receiptsForCarrierId;
	}

}