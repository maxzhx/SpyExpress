package com.spy.entity;

import java.util.Date;

/**
 * Report entity. @author MyEclipse Persistence Tools
 */

public class Report implements java.io.Serializable {

	// Fields

	private String viewName;
	private Station station;
	private String rpDate;
	private Date gnDate;
	private Double totalWeight;
	private Double totalVolume;
	private Double totalIncome;
	private Integer rpType;

	// Constructors

	/** default constructor */
	public Report() {
	}

	/** minimal constructor */
	public Report(String viewName, String rpDate, Date gnDate, Integer rpType) {
		this.viewName = viewName;
		this.rpDate = rpDate;
		this.gnDate = gnDate;
		this.rpType = rpType;
	}

	/** full constructor */
	public Report(String viewName, Station station, String rpDate, Date gnDate,
			Double totalWeight, Double totalVolume, Double totalIncome,
			Integer rpType) {
		this.viewName = viewName;
		this.station = station;
		this.rpDate = rpDate;
		this.gnDate = gnDate;
		this.totalWeight = totalWeight;
		this.totalVolume = totalVolume;
		this.totalIncome = totalIncome;
		this.rpType = rpType;
	}

	// Property accessors

	public String getViewName() {
		return this.viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public Station getStation() {
		return this.station;
	}

	public void setStation(Station station) {
		this.station = station;
	}

	public String getRpDate() {
		return this.rpDate;
	}

	public void setRpDate(String rpDate) {
		this.rpDate = rpDate;
	}

	public Date getGnDate() {
		return this.gnDate;
	}

	public void setGnDate(Date gnDate) {
		this.gnDate = gnDate;
	}

	public Double getTotalWeight() {
		return this.totalWeight;
	}

	public void setTotalWeight(Double totalWeight) {
		this.totalWeight = totalWeight;
	}

	public Double getTotalVolume() {
		return this.totalVolume;
	}

	public void setTotalVolume(Double totalVolume) {
		this.totalVolume = totalVolume;
	}

	public Double getTotalIncome() {
		return this.totalIncome;
	}

	public void setTotalIncome(Double totalIncome) {
		this.totalIncome = totalIncome;
	}

	public Integer getRpType() {
		return this.rpType;
	}

	public void setRpType(Integer rpType) {
		this.rpType = rpType;
	}

	
}