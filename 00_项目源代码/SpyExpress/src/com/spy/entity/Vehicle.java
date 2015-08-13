package com.spy.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Vehicle entity. @author MyEclipse Persistence Tools
 */

public class Vehicle implements java.io.Serializable {

	// Fields

	private Integer id;
	private Receipt receipt;
	private Station stationByDestId;
	private Station stationBySourceId;
	private Date timeBuying;
	private String manufacturer;
	private String model;
	private Double capacity;
	private Double volume;
	private Integer status;
	private String license;
	private String timeBuyingString;

	// Constructors

	/** default constructor */
	public Vehicle() {
	}

	/** minimal constructor */
	public Vehicle(Double capacity, Double volume, Integer status) {
		this.capacity = capacity;
		this.volume = volume;
		this.status = status;
	}

	/** full constructor */
	public Vehicle(Receipt receipt, Station stationByDestId,
			Station stationBySourceId, Date timeBuying, String manufacturer,
			String model, Double capacity, Double volume, Integer status,
			String license) {
		this.receipt = receipt;
		this.stationByDestId = stationByDestId;
		this.stationBySourceId = stationBySourceId;
		this.timeBuying = timeBuying;
		this.manufacturer = manufacturer;
		this.model = model;
		this.capacity = capacity;
		this.volume = volume;
		this.status = status;
		this.license = license;
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

	public Station getStationByDestId() {
		return this.stationByDestId;
	}

	public void setStationByDestId(Station stationByDestId) {
		this.stationByDestId = stationByDestId;
	}

	public Station getStationBySourceId() {
		return this.stationBySourceId;
	}

	public void setStationBySourceId(Station stationBySourceId) {
		this.stationBySourceId = stationBySourceId;
		
	}

	public Date getTimeBuying() {
		
		return this.timeBuying;
	}

	public void setTimeBuying(Date timeBuying)  {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		String dateString=sdf.format(timeBuying); 
		try {
			timeBuying=sdf.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.timeBuying =timeBuying;
	}

	public String getManufacturer() {
		return this.manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getModel() {
		return this.model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Double getCapacity() {
		return this.capacity;
	}

	public void setCapacity(Double capacity) {
		this.capacity = capacity;
	}

	public Double getVolume() {
		return this.volume;
	}

	public void setVolume(Double volume) {
		this.volume = volume;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getLicense() {
		return this.license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public void setTimeBuyingString(String timeBuyingString) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm"); 
		timeBuyingString=sdf.format(timeBuying);
		//Date date = timeBuying.SimpleDateFormat("yyyy-MM-dd")
		this.timeBuyingString = timeBuyingString;
		System.out.println(timeBuyingString);
	}

	public String getTimeBuyingString() {
		return timeBuyingString;
	}

}