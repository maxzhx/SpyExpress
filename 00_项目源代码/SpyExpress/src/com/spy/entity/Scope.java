package com.spy.entity;

/**
 * Scope entity. @author MyEclipse Persistence Tools
 */

public class Scope implements java.io.Serializable {

	// Fields

	private Integer id;
	private Station stationByDestStaId;
	private Station stationBySourceStaId;
	private Double firstKgPrice;
	private Double kgPrice;
	private Double firstCubicPrice;
	private Double cubicPrice;
	private Integer duration;
	private String note;

	// Constructors

	/** default constructor */
	public Scope() {
	}

	/** minimal constructor */
	public Scope(Double firstKgPrice, Double kgPrice, Double firstCubicPrice,
			Double cubicPrice, Integer duration) {
		this.firstKgPrice = firstKgPrice;
		this.kgPrice = kgPrice;
		this.firstCubicPrice = firstCubicPrice;
		this.cubicPrice = cubicPrice;
		this.duration = duration;
	}

	/** full constructor */
	public Scope(Station stationByDestStaId, Station stationBySourceStaId,
			Double firstKgPrice, Double kgPrice, Double firstCubicPrice,
			Double cubicPrice, Integer duration, String note) {
		this.stationByDestStaId = stationByDestStaId;
		this.stationBySourceStaId = stationBySourceStaId;
		this.firstKgPrice = firstKgPrice;
		this.kgPrice = kgPrice;
		this.firstCubicPrice = firstCubicPrice;
		this.cubicPrice = cubicPrice;
		this.duration = duration;
		this.note = note;
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

	public Station getStationBySourceStaId() {
		return this.stationBySourceStaId;
	}

	public void setStationBySourceStaId(Station stationBySourceStaId) {
		this.stationBySourceStaId = stationBySourceStaId;
	}

	public Double getFirstKgPrice() {
		return this.firstKgPrice;
	}

	public void setFirstKgPrice(Double firstKgPrice) {
		this.firstKgPrice = firstKgPrice;
	}

	public Double getKgPrice() {
		return this.kgPrice;
	}

	public void setKgPrice(Double kgPrice) {
		this.kgPrice = kgPrice;
	}

	public Double getFirstCubicPrice() {
		return this.firstCubicPrice;
	}

	public void setFirstCubicPrice(Double firstCubicPrice) {
		this.firstCubicPrice = firstCubicPrice;
	}

	public Double getCubicPrice() {
		return this.cubicPrice;
	}

	public void setCubicPrice(Double cubicPrice) {
		this.cubicPrice = cubicPrice;
	}

	public Integer getDuration() {
		return this.duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}