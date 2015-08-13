package com.spy.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.spy.entity.Scope;
import com.spy.entity.Station;
import com.spy.entity.Vehicle;
import com.spy.service.StationService;

@Component("stationAction")
public class StationAction extends ActionSupport {
	private Station station;
	private PageBean pageBean=new PageBean();
	private int stationID;
	private String sCurrentPage="";
	private String idString="";
	private int currentPage=1;
	private List<Station> stationList;
	private List<Integer> stationIDList;
	@Autowired
	private StationService stationService;
	
	public String flashSearchCondition()
	{
		idString="";
		return "success";
	}
	
	public String newStation()
	{
		station = new Station();
		return "success";
	}
	public String addStation(){
		System.out.println(station.getName());
		stationService.addStation(station);
		return "success";
	}
	
	public String deleteMultiStation(){
		for(int i=0;i<stationIDList.size();i++){
			List<Scope> sourceScopes = stationService.findScopeBySourceID(stationIDList.get(i));
			List<Scope> destScopes = stationService.findScopeByDestID(stationIDList.get(i));
			for(int j =0;j<sourceScopes.size();j++){
				stationService.deleteScope(sourceScopes.get(j));
			}
			for(int j =0;j<destScopes.size();j++){
				stationService.deleteScope(destScopes.get(j));
			}
		}
		stationService.deleteMultiStation(stationIDList);
		return "success";
	}
	public String deleteStation(){
		stationService.deleteStation(stationService.findStationByID(stationID));
		return "success";
	}
	
	public String showAllStation(){
		
		flashSearchCondition();
		stationList=stationService.findAllStation();
		stationList=pageBean.queryByPage(currentPage, stationList);
		return "success";
	}
	
	public String showStation(){
		station = stationService.findStationByID(stationID);
		return "success";
	}
	
	public String showStationByID()
	{
		if(idString.equals(""))
		{
			showAllStation();
			return "success";
		}
		int id = Integer.parseInt(idString);
		station = stationService.findStationByID(id);
		currentPage = 1;
		stationList = new ArrayList<Station>();
		stationList.add(0,station);
		stationList=pageBean.queryByPage(currentPage, stationList);
		return "success";
	}
	public String updateStation(){
		stationService.updateStation(station);
		return "success";
	}
	
	public String showCurrentPage(){
		if(!sCurrentPage.equals("")){
			currentPage = Integer.parseInt(sCurrentPage);
			System.out.println(currentPage+" "+sCurrentPage);
			if(currentPage>pageBean.getTotalPages())
				currentPage = pageBean.getTotalPages();
			if (currentPage<1)
				currentPage=1;
			sCurrentPage="";
		}
		stationList=pageBean.showCurrentPage(currentPage);
		return "success";
	}
	
	public Station getStation() {
		return station;
	}
	
	
	public void setStation(Station station) {
		this.station = station;
	}
	public List<Station> getStationList() {
		return stationList;
	}
	public void setStationList(List<Station> stationList) {
		this.stationList = stationList;
	}
	public StationService getStationService() {
		return stationService;
	}
	public void setStationService(StationService stationService) {
		this.stationService = stationService;
	}
	
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStationID() {
		return stationID;
	}

	public void setStationID(int stationID) {
		this.stationID = stationID;
	}
	public void setStationIDList(List<Integer> stationIDList) {
		this.stationIDList = stationIDList;
	}
	public List<Integer> getStationIDList() {
		return stationIDList;
	}
	public void setIdString(String idString) {
		this.idString = idString;
	}
	public String getIdString() {
		return idString;
	}

	public String getsCurrentPage() {
		return sCurrentPage;
	}

	public void setsCurrentPage(String sCurrentPage) {
		this.sCurrentPage = sCurrentPage;
	}
	
}
