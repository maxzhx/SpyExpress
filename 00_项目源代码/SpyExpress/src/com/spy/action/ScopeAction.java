package com.spy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.mapping.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spy.entity.Admin;
import com.spy.entity.Scope;
import com.spy.entity.Station;
import com.spy.service.StationService;

@Component("scopeAction")
public class ScopeAction {

	private List<Station> stationLists;
	private int scopeID;
	private List<Integer> scopeListID;
	private List<Scope> scopeList;
	private List<Station> stationList;
	private int currentPage=1;
	private String sCurrentPage="";
	private Scope scope;
	private int sourceID;
	private int destID;
	private int searchSourceID=0;
	private int searchDestID=0;
	private Map<Integer, List<Station>> destStationMap;
	public Map<Integer, List<Station>> getDestStationMap() {
		return destStationMap;
	}
	public void setDestStationMap(Map<Integer, List<Station>> destStationMap) {
		this.destStationMap = destStationMap;
	}
	private PageBean pageBean = new PageBean();
	@Autowired 
	StationService stationService;
	
	public List<Station> getStationLists() {
		return stationLists;
	}
	public void setStationLists(List<Station> stationLists) {
		this.stationLists = stationLists;
	}
	public int getScopeID() {
		return scopeID;
	}
	public void setScopeID(int scopeID) {
		this.scopeID = scopeID;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public StationService getStationService() {
		return stationService;
	}
	public void setStationService(StationService stationService) {
		this.stationService = stationService;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public List<Scope> getScopeList() {
		return scopeList;
	}
	public void setScopeList(List<Scope> scopeList) {
		this.scopeList = scopeList;
	}
	public Scope getScope() {
		return scope;
	}
	public void setScope(Scope scope) {
		this.scope = scope;
	}
	public int getSourceID() {
		return sourceID;
	}
	public void setSourceID(int sourceID) {
		this.sourceID = sourceID;
	}
	public int getDestID() {
		return destID;
	}
	public void setDestID(int destID) {
		this.destID = destID;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	
	public void setStationList(List<Station> stationList) {
		this.stationList = stationList;
	}
	public List<Station> getStationList() {
		return stationList;
	}
	
	public String flashSearchCondition()
	{
		searchSourceID=0;
		searchDestID=0;
		return "success";
	}
	
	public String showAllScope()
	{
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		if(admin.getStation().getId()==0)
		{
			stationLists = stationService.findAllStation();
		}
		else {
			stationLists = new ArrayList<Station>();
			stationLists.add(admin.getStation());
		}
		flashSearchCondition();
		stationList = stationService.findAllStation();
		if(admin.getStation().getId()==0){
			scopeList = stationService.findAllScope();
		}
		else
		{
			scopeList = stationService.findScopeBySourceID(admin.getStation().getId());
		}
		scopeList=pageBean.queryByPage(currentPage, scopeList);
		return "success";
	}
	

	public String newScope()
	{
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		if(admin.getStation().getId()==0)
		{
			stationLists = stationService.findAllStation();
		}
		else {
			stationLists = new ArrayList<Station>();
			stationLists.add(admin.getStation());
		}
		scope  = new Scope();
		Scope flag = new Scope();
		List<Station> allStations = stationService.findAllStation();
		destStationMap=new HashMap<Integer, List<Station>>();
		for(int j=0;j<stationLists.size();j++){
			stationList=new ArrayList<Station>();
			for (int i = 0; i < allStations.size(); i++) {
				flag = stationService.findScopeBySourceAndDest(stationLists.get(j).getId(), allStations.get(i).getId());
				if(flag == null)
				{
					int x = allStations.get(i).getId();
					int y = stationLists.get(j).getId();
					if(x!=y){
						stationList.add(allStations.get(i));
					}
				}
			}
			destStationMap.put(stationLists.get(j).getId(), stationList);
		}
		return "success";
	}
	
	
	public String addScope()
	{
		scope.setStationBySourceStaId(stationService.findStationByID(sourceID));
		scope.setStationByDestStaId(stationService.findStationByID(destID));
		stationService.addScope(scope);
		return "success";
	}
	
	public String showScope()
	{
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		if(admin.getStation().getId()==0)
		{
			stationLists = stationService.findAllStation();
		}
		else {
			stationLists = new ArrayList<Station>();
			stationLists.add(admin.getStation());
		}
		scope=stationService.findScopeByID(scopeID);
		Scope flag = new Scope();
		List<Station> allStations = stationService.findAllStation();
		destStationMap=new HashMap<Integer, List<Station>>();
		for(int j=0;j<stationLists.size();j++){
			stationList=new ArrayList<Station>();
			for (int i = 0; i < allStations.size(); i++) {
				flag = stationService.findScopeBySourceAndDest(stationLists.get(j).getId(), allStations.get(i).getId());
				if(flag == null)
				{
					int x = allStations.get(i).getId();
					int y = stationLists.get(j).getId();
					int z = scope.getStationBySourceStaId().getId();
					if(x!=y){
						stationList.add(allStations.get(i));
					}
					if (x==z) {
						stationList.add(scope.getStationByDestStaId());
					}
				}
			}
//			System.out.println("dadasdasdasd");
//			System.out.println(a+" "+b);
			destStationMap.put(stationLists.get(j).getId(), stationList);
		}
		
		stationList=stationService.findAllStation();
		return "success";
	}
	
	public String updateScope()
	{
		stationService.updateScope(scope);
		return "success";
	}
	
	public String deleteScope()
	{
		scope = stationService.findScopeByID(scopeID);
		stationService.deleteScope(scope);
		return "success";
	}
	
	public String deleteMultiScope()
	{
		stationService.deleteMultiSocpe(scopeListID);
		return "success";
	}
	public void setScopeListID(List<Integer> scopeListID) {
		this.scopeListID = scopeListID;
	}
	public List<Integer> getScopeListID() {
		return scopeListID;
	}

	public String showScopeBySourceAndDest(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		if(admin.getStation().getId()!=0){
			searchSourceID = admin.getStation().getId();
		}
		int firstFlag=0;
		String hql="from Scope";
		if(searchSourceID!=0){
			hql = hql+" where stationBySourceStaId = "+searchSourceID+"";
			firstFlag=1;
		}
		if(firstFlag==0 && searchDestID!=0){
			hql=hql+" where stationByDestStaId = "+searchDestID+"";
		}
		else if(firstFlag==1 && searchDestID!=0){
			hql=hql+" and stationByDestStaId = "+searchDestID+"";
		}
		scopeList = stationService.findScopeByHQL(hql);
		currentPage=1;
		scopeList=pageBean.queryByPage(currentPage, scopeList);
		return "success";
	}
	
	public String showCurrentPage(){
//		HttpSession session=ServletActionContext.getRequest().getSession();
//		Admin admin=(Admin) session.getAttribute("admin");
//		if(admin.getStation().getId()==0)
//		{
//			stationLists = stationService.findAllStation();
//		}
//		else {
//			stationLists = new ArrayList<Station>();
//			stationLists.add(admin.getStation());
//		}
		if(!sCurrentPage.equals("")){
			currentPage = Integer.parseInt(sCurrentPage);
			System.out.println(currentPage+" "+sCurrentPage);
			if(currentPage>pageBean.getTotalPages())
				currentPage = pageBean.getTotalPages();
			if (currentPage<1)
				currentPage=1;
			sCurrentPage="";
		}
		scopeList=pageBean.showCurrentPage(currentPage);
		return "success";
	}
	public String getsCurrentPage() {
		return sCurrentPage;
	}
	public void setsCurrentPage(String sCurrentPage) {
		this.sCurrentPage = sCurrentPage;
	}
	public int getSearchSourceID() {
		return searchSourceID;
	}
	public void setSearchSourceID(int searchSourceID) {
		this.searchSourceID = searchSourceID;
	}
	public int getSearchDestID() {
		return searchDestID;
	}
	public void setSearchDestID(int searchDestID) {
		this.searchDestID = searchDestID;
	}

}
