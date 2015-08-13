package com.spy.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jms.Session;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.spy.entity.Admin;
import com.spy.entity.Scope;
import com.spy.entity.Station;
import com.spy.entity.Vehicle;
import com.spy.service.ReceiptService;
import com.spy.service.StationService;
import com.spy.service.VehicleService;

@Component("vehicleAction")
public class VehicleAction extends ActionSupport {

	private Vehicle vehicle;
	private int currentPage=1;
	private String sCurrentPage="";
	private PageBean pageBean=new PageBean();
	private String license="";
	private int vehicleID=0;
	private String vehicleIDString="";
	private int receiptID=0;
	private String receiptIDString="";
	private String receiptIDUpdateString="";
	private int stationID=0;
	private List<Vehicle> vehicleList;
	private List<Integer> selectedIDList=new ArrayList<Integer>();
	private List<Station> stationList;
	private List<Station> destStationList;
	private int state=0;
	private int sourceStationID;
	private int destStationID;
	private Map<Integer, List<Station>> destStationMap;
	
	@Autowired
	private VehicleService vehicleService;
	@Autowired
	private StationService stationService;
	@Autowired
	private ReceiptService receiptService;

	public String flashSearchCondition()
	{
		vehicleIDString="";
		sourceStationID=0;
		destStationID=0;
		state=0;
		license="";
		receiptIDString="";
		return "success";
	}
	
	public String addVehicle(){
		vehicle.setTimeBuying(vehicle.getTimeBuying());
		vehicle.setStatus(1);
//		vehicle.setStationBySourceId(stationService.findStationByID(sourceStationID));
//		vehicle.setStationByDestId(stationService.findStationByID(destStationID));
		vehicleService.addVehicle(vehicle);
		return "success";
	}
	
	public String newVehicle(){
		vehicle=new Vehicle();
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		setStationID(admin.getStation().getId());
		if (stationID==0) {
			stationList=stationService.findAllStation();
		}
		else {
			stationList=new ArrayList<Station>();
			stationList.add(admin.getStation());
		}
		destStationMap=new HashMap<Integer, List<Station>>();
		for(Station station:stationList){
			List<Station> destStationList=new ArrayList<Station>();
			List<Scope> scopeList=stationService.findScopeBySourceID(station.getId());
			for (int i = 0; i < scopeList.size(); i++) {
				destStationList.add(scopeList.get(i).getStationByDestStaId());
			}
//			System.out.println(station.getId());
//			System.out.println(destStationList);
			destStationMap.put(station.getId(), destStationList);
		}
//		stationList=stationService.findAllStation();
		return "success";
	}
	
	public String showVehicle(){
		vehicle=vehicleService.findVehicleByID(vehicleID);
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		setStationID(admin.getStation().getId());
		destStationMap=new HashMap<Integer, List<Station>>();
		if (stationID==0) {
			stationList=stationService.findAllStation();
		}
		else {
			stationList=new ArrayList<Station>();
			stationList.add(admin.getStation());
		}
		for(Station station:stationList){
			destStationList=new ArrayList<Station>();
			List<Scope> scopeList=stationService.findScopeBySourceID(station.getId());
			for (int i = 0; i < scopeList.size(); i++) {
				destStationList.add(scopeList.get(i).getStationByDestStaId());
			}
//			System.out.println(station.getId());
//			System.out.println(destStationList);
			destStationMap.put(station.getId(), destStationList);
		}
		if (vehicle.getReceipt()!=null) {
			receiptIDUpdateString=vehicle.getReceipt().getId().toString();
		}
		else {
			receiptIDUpdateString="";
		}
		return "success";
	}
	public String deleteMultiVehicle(){
		if (selectedIDList.size()!=0) {
			vehicleService.deleteMultiVehicle(selectedIDList);
		}
		return "success";
	}
	
	public String deleteVehicle(){
		vehicleService.deleteVehicle(vehicleService.findVehicleByID(vehicleID));
		return "success";
	}
	
	public String showAllVehicle(){
		flashSearchCondition();
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		setStationID(admin.getStation().getId());
//		System.out.println(stationID);
		if (stationID==0) {
			vehicleList=vehicleService.findAllVehicle();
		}
		else {
			vehicleList=vehicleService.findVehicle(0, "", 0, stationID, 0, 0);
			vehicleList.addAll(vehicleService.findVehicle(0, "", 0, 0, stationID, 0));
//			stationList=new ArrayList<Station>();
//			stationList.add(admin.getStation());
		}
		stationList=stationService.findAllStation();
		vehicleList=pageBean.queryByPage(currentPage, vehicleList);
//		Station station = vehicleList.get(0).getStationBySourceId();
//		System.out.println(station.getName());
		return "success";
	}
	
	public String searchVehicle(){
//		System.out.println("ddd");
//		System.out.println("ddd");
//		System.out.println(state);
		if (receiptIDString.equals("")) {
			receiptID=0;
		}
		else {
			receiptID=Integer.parseInt(receiptIDString);
		}
		if (vehicleIDString.equals("")) {
			vehicleID=0;
		}
		else {
			vehicleID=Integer.parseInt(vehicleIDString);
		}
		
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		setStationID(admin.getStation().getId());
		if (stationID==0) {
			vehicleList=vehicleService.findVehicle(vehicleID, license, state, sourceStationID, destStationID, receiptID);
		}
		else {
			if (sourceStationID==0&&destStationID==0) {
				vehicleList=vehicleService.findVehicle(vehicleID, license, state, stationID, destStationID, receiptID);
				vehicleList.addAll(vehicleService.findVehicle(vehicleID, license, state, sourceStationID, stationID, receiptID));
			}else if (sourceStationID==0) {
				if (destStationID==stationID) {
					vehicleList=vehicleService.findVehicle(vehicleID, license, state, sourceStationID, destStationID, receiptID);
				}else {
					vehicleList=vehicleService.findVehicle(vehicleID, license, state, stationID, destStationID, receiptID);
					sourceStationID=stationID;
				}
			}else if (destStationID==0) {
				if (sourceStationID==stationID) {
					vehicleList=vehicleService.findVehicle(vehicleID, license, state, sourceStationID, destStationID, receiptID);
				}else {
					vehicleList=vehicleService.findVehicle(vehicleID, license, state, sourceStationID, stationID, receiptID);
					destStationID=stationID;
				}
			}else {
				vehicleList=vehicleService.findVehicle(vehicleID, license, state, sourceStationID, destStationID, receiptID);
			}
		}
		stationList=stationService.findAllStation();
		currentPage=1;
//		receiptID=0;
		vehicleList=pageBean.queryByPage(currentPage, vehicleList);
		return "success"; 
	}
	
	public String showComingVehicle(){//��ʾ�������ĳ���
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin)session.getAttribute("user");
		vehicleList=vehicleService.findComingVehicle(admin.getStation().getId());
		return "success";
	}
	
	public String showAvailableVehicle(){//���Ŀ�ĵ���ʾ���ó���
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin)session.getAttribute("user");
		vehicleList=vehicleService.findAvailableVehicle(admin.getStation().getId(), destStationID);
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
		vehicleList=pageBean.showCurrentPage(currentPage);
		return "success";
	}
	
	public String dispatchMultiVehicle(){
		vehicleService.dispatchMultiVehicle(selectedIDList);
		return "success";
	}
	public String arriveMultiVehicle(){
		vehicleService.arriveMultiVehicle(selectedIDList);
		return "success";
	}

	
	public String updateVehicle(){
		if (receiptIDUpdateString.equals("")) {
			vehicle.setReceipt(null);
		}
		else {
			receiptID=Integer.parseInt(receiptIDUpdateString);
			vehicle.setReceipt(receiptService.findReceiptByID(receiptID));
			vehicleService.updateVehicle(vehicle);
		}
		vehicleService.updateVehicle(vehicle);
		return "success";
	}
	
	
	
	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public List<Vehicle> getVehicleList() {
		return vehicleList;
	}

	public void setVehicleList(List<Vehicle> vehicleList) {
		this.vehicleList = vehicleList;
	}

	public VehicleService getVehicleService() {
		return vehicleService;
	}

	public void setVehicleService(VehicleService vehicleService) {
		this.vehicleService = vehicleService;
	}

	public int getVehicleID() {
		return vehicleID;
	}

	public void setVehicleID(int vehicleID) {
		this.vehicleID = vehicleID;
	}

	public int getDestStationID() {
		return destStationID;
	}

	public void setDestStationID(int destStationID) {
		this.destStationID = destStationID;
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

	public List<Station> getStationList() {
		return stationList;
	}

	public void setStationList(List<Station> stationList) {
		this.stationList = stationList;
	}

	public int getSourceStationID() {
		return sourceStationID;
	}

	public void setSourceStationID(int sourceStationID) {
		this.sourceStationID = sourceStationID;
	}

	public List<Integer> getSelectedIDList() {
		return selectedIDList;
	}

	public void setSelectedIDList(List<Integer> selectedIDList) {
		this.selectedIDList = selectedIDList;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getVehicleIDString() {
		return vehicleIDString;
	}

	public void setVehicleIDString(String vehicleIDString) {
		this.vehicleIDString = vehicleIDString;
	}

	public String getReceiptIDString() {
		return receiptIDString;
	}

	public void setReceiptIDString(String receiptIDString) {
		this.receiptIDString = receiptIDString;
	}

	public int getReceiptID() {
		return receiptID;
	}

	public void setReceiptID(int receiptID) {
		this.receiptID = receiptID;
	}

	public String getReceiptIDUpdateString() {
		return receiptIDUpdateString;
	}

	public void setReceiptIDUpdateString(String receiptIDUpdateString) {
		this.receiptIDUpdateString = receiptIDUpdateString;
	}

	public String getsCurrentPage() {
		return sCurrentPage;
	}

	public void setsCurrentPage(String sCurrentPage) {
		this.sCurrentPage = sCurrentPage;
	}

	public StationService getStationService() {
		return stationService;
	}

	public void setStationService(StationService stationService) {
		this.stationService = stationService;
	}

	public ReceiptService getReceiptService() {
		return receiptService;
	}

	public void setReceiptService(ReceiptService receiptService) {
		this.receiptService = receiptService;
	}

	public int getStationID() {
		return stationID;
	}

	public void setStationID(int stationID) {
		this.stationID = stationID;
	}

	public Map<Integer, List<Station>> getDestStationMap() {
		return destStationMap;
	}

	public void setDestStationMap(Map<Integer, List<Station>> destStationMap) {
		this.destStationMap = destStationMap;
	}

	public List<Station> getDestStationList() {
		return destStationList;
	}

	public void setDestStationList(List<Station> destStationList) {
		this.destStationList = destStationList;
	}


}