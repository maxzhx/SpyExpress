package com.spy.entity;
/**
 * 总公司报表内容条目
 */
public class ReportHeadItem{

	private Integer stationId;
	private String stationName;
	private Double totalWeight;
	private Double totalVolume;
	private Double totalIncome;
	public Integer getStationId() {
		return stationId;
	}
	public void setStationId(Integer stationId) {
		this.stationId = stationId;
	}
	public String getStationName() {
		return stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	public Double getTotalWeight() {
		return totalWeight;
	}
	public void setTotalWeight(Double totalWeight) {
		this.totalWeight = totalWeight;
	}
	public Double getTotalVolume() {
		return totalVolume;
	}
	public void setTotalVolume(Double totalVolume) {
		this.totalVolume = totalVolume;
	}
	public Double getTotalIncome() {
		return totalIncome;
	}
	public void setTotalIncome(Double totalIncome) {
		this.totalIncome = totalIncome;
	}
	public String toString(){
		return String.format("%d %s %.2f %.2f %.2f", this.stationId,this.stationName,this.totalWeight,this.totalVolume,this.totalIncome);
	}
	
}
