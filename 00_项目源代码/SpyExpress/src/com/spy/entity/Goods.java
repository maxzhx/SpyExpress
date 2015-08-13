package com.spy.entity;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */

public class Goods implements java.io.Serializable {

	// Fields

	private Integer id;
	private Order order;
	private String name;
	private Double weight;
	private Double volume;
	private Double supportValue;

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** minimal constructor */
	public Goods(String name, Double weight, Double volume, Double supportValue) {
		this.name = name;
		this.weight = weight;
		this.volume = volume;
		this.supportValue = supportValue;
	}

	/** full constructor */
	public Goods(Order order, String name, Double weight, Double volume,
			Double supportValue) {
		this.order = order;
		this.name = name;
		this.weight = weight;
		this.volume = volume;
		this.supportValue = supportValue;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Double getSupportValue() {
		return this.supportValue;
	}

	public void setSupportValue(Double supportValue) {
		this.supportValue = supportValue;
	}

}