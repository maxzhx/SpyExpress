package com.spy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.spy.dao.Order_ReceiptDao;
import com.spy.entity.Admin;
import com.spy.entity.Order;
import com.spy.entity.Receipt;
import com.spy.entity.Scope;
import com.spy.entity.Station;
import com.spy.entity.Vehicle;
import com.spy.service.OrderService;
import com.spy.service.ReceiptService;
import com.spy.service.StationService;
import com.spy.service.UserService;
import com.spy.service.VehicleService;

@Component("receiptAction")
public class ReceiptAction extends ActionSupport {
	
	private PageBean pageBean=new PageBean();
	private PageBean orderPageBean=new PageBean();
	private int orderCurrentPage=1;
	private PageBean vehiclePageBean=new PageBean();
	private String sOrderCurrentPage="";
	private String sVehicleCurrentPage="";
	private double totalVehicleWeight=0;
	private double totalVehicleVolume=0;
	private double totalOrderWeight=0;
	private double totalOrderVolume=0;
	private int vehicleCurrentPage=1;
	private int currentPage=1;
	private String sCurrentPage="";
	private int receiptID;
	private int carrierID;
	private int recipientID;
	private int stationID=0;
	private String receiptIDString;
	private int state;
	private List<Order> orderList;
	private List<Vehicle> vehicleList;
	private List<Receipt> receiptList;
	private List<Station> sourceStationList;
	private List<Station> destStationList=new ArrayList<Station>();
	private List<Integer> selectedIDList=new ArrayList<Integer>();
	private List<Integer> selectedOrderIDList=new ArrayList<Integer>();
	private List<Integer> selectedVehicleIDList=new ArrayList<Integer>();
	private List<Station> stationList;
	private List<Admin> recipientList;
	private List<Admin> carrierList;
	private Receipt receipt;
	private int sourceStationID;
	private int destStationID;
	private Map<Integer, List<Station>> destStationMap;
	
	@Autowired
	private ReceiptService receiptService;
	@Autowired
	private StationService stationService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private VehicleService vehicleService;
	@Autowired
	private UserService userService;
	@Autowired
	private Order_ReceiptDao order_ReceiptDao;
	
	public String flashSearchCondition()
	{
		receiptIDString="";
		state=0;
		sourceStationID=0;
		destStationID=0;
		return "success";
	}
	
	public String selectSourceAndDest(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		setStationID(admin.getStation().getId());
		if (stationID==0) {
			sourceStationList=stationService.findAllStation();
		}
		else {
			sourceStationList=new ArrayList<Station>();
			sourceStationList.add(admin.getStation());
		}
		destStationMap=new HashMap<Integer, List<Station>>();
		for(Station station:sourceStationList){
			destStationList=new ArrayList<Station>();
			List<Scope> scopeList=stationService.findScopeBySourceID(station.getId());
			for (int i = 0; i < scopeList.size(); i++) {
				destStationList.add(scopeList.get(i).getStationByDestStaId());
			}
			if (destStationList.size()!=0) {
				destStationID=destStationList.get(0).getId();
			}
//			System.out.println(station.getId());
//			System.out.println(destStationList);
			destStationMap.put(station.getId(), destStationList);
		}
		sourceStationID=sourceStationList.get(0).getId();
//		System.out.println(destStationMap.get(9002).size());
		return "success";
	}
	
	public String selectOrderAndVehicle(){
		totalOrderVolume=0;
		totalOrderWeight=0;
		totalVehicleVolume=0;
		totalVehicleWeight=0;
		orderList=orderService.getNextStationID(sourceStationID, destStationID);
		orderList=orderPageBean.queryByPage(orderCurrentPage, orderList);
		System.out.println(orderPageBean.getTotalPages());
		vehicleList=vehicleService.findAvailableVehicle(sourceStationID, destStationID);
		vehicleList=vehiclePageBean.queryByPage(vehicleCurrentPage, vehicleList);
		return "success";
	}
	
	public String selectCarrierAndRecipient(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		setStationID(admin.getStation().getId());
		if (stationID==0) {
			carrierList=userService.findAdminByStation(sourceStationID);
		}
		else {
			carrierList=new ArrayList<Admin>();
			carrierList.add(admin);
		}
		recipientList=userService.findAdminByStation(destStationID);
//		System.out.println(selectedOrderIDList.size()+" "+selectedVehicleIDList);
		return "success";
	}
	
	public String arriveMultiReceipt(){
		receiptService.arriveMultiReceipt(selectedIDList);
		return "success";
	}
	
	public String arriveReceipt(){
		return null;
	}
	
	public String createReceipt(){
//		System.out.println(selectedOrderIDList);
//		System.out.println(selectedVehicleIDList);
//		System.out.println(carrierID);
//		System.out.println(recipientID);
//		System.out.println(sourceStationID);
//		System.out.println(destStationID);
		receipt=new Receipt();
		receipt.setStatus(1);
		receipt.setAdminByCarrierId(userService.findAdminByID(carrierID));
		receipt.setAdminByRecipientId(userService.findAdminByID(recipientID));
		receipt.setStationBySourceStaId(stationService.findStationByID(sourceStationID));
		receipt.setStationByDestStaId(stationService.findStationByID(destStationID));
		receiptService.createReceipt(receipt, selectedOrderIDList, selectedVehicleIDList);
		return "success";
	}
	
	public String deleteMultiReceipt(){
		if (selectedIDList.size()!=0) {
			receiptService.deleteMultiReceipt(selectedIDList);
		}
		return "success";
	}
	
	public String deleteReceipt(){
		receiptService.deleteReceipt(receiptService.findReceiptByID(receiptID));
		return "success";
	}
	
	public String showAllReceipt(){
		flashSearchCondition();
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		setStationID(admin.getStation().getId());
		if (stationID==0) {
			receiptList=receiptService.findReceipt(0,0, 0, 0);
		}
		else {
			receiptList=receiptService.findReceipt(0, 0, stationID, 0);
			receiptList.addAll(receiptService.findReceipt(0, 0, 0, stationID));
		}
		stationList=stationService.findAllStation();
		receiptList=pageBean.queryByPage(currentPage, receiptList);
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
		receiptList=pageBean.showCurrentPage(currentPage);
		return "success";
	}
	public String showOrderCurrentPage(){
		if(!sOrderCurrentPage.equals("")){
			orderCurrentPage = Integer.parseInt(sOrderCurrentPage);
			if(orderCurrentPage>orderPageBean.getTotalPages())
				orderCurrentPage = orderPageBean.getTotalPages();
			if (orderCurrentPage<1)
				orderCurrentPage=1;
			sOrderCurrentPage="";
		}
		orderList=orderPageBean.showCurrentPage(orderCurrentPage);
		return "success";
	}
	public String showVehicleCurrentPage(){
		if(!sVehicleCurrentPage.equals("")){
			vehicleCurrentPage = Integer.parseInt(sVehicleCurrentPage);
			if(vehicleCurrentPage>vehiclePageBean.getTotalPages())
				vehicleCurrentPage = vehiclePageBean.getTotalPages();
			if (vehicleCurrentPage<1)
				vehicleCurrentPage=1;
			sVehicleCurrentPage="";
		}
		vehicleList=vehiclePageBean.showCurrentPage(vehicleCurrentPage);
		return "success";
	}
	public String searchReceipt(){
		if (receiptIDString.equals("")) {
			receiptID=0;
		}
		else {
			receiptID=Integer.parseInt(receiptIDString);
		}
		
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		setStationID(admin.getStation().getId());
		if (stationID==0) {
			receiptList=receiptService.findReceipt(receiptID, state, sourceStationID, destStationID);
		}
		else {
			if (sourceStationID==0&&destStationID==0) {
				receiptList=receiptService.findReceipt(receiptID, state, stationID, destStationID);
				receiptList.addAll(receiptService.findReceipt(receiptID, state, sourceStationID, stationID));
			}else if (sourceStationID==0) {
				if (destStationID==stationID) {
					receiptList=receiptService.findReceipt(receiptID, state, sourceStationID, destStationID);
				}else {
					receiptList=receiptService.findReceipt(receiptID, state, stationID, destStationID);
					sourceStationID=stationID;
				}
			}else if (destStationID==0) {
				if (sourceStationID==stationID) {
					receiptList=receiptService.findReceipt(receiptID, state, sourceStationID, destStationID);
				}else {
					receiptList=receiptService.findReceipt(receiptID, state, sourceStationID, stationID);
					destStationID=stationID;
				}
			}else {
				receiptList=receiptService.findReceipt(receiptID, state, sourceStationID, destStationID);
			}
		}
		stationList=stationService.findAllStation();
		currentPage=1;
		receiptList=pageBean.queryByPage(currentPage, receiptList);
		return "success";
	}
	
	public String showArrivedReceipt(){
		return null;
	}
	
	public String showDeliveredReceipt(){
		return null;
	}
	
	public String showReceipt(){
		receipt=receiptService.findReceiptByID(receiptID);
		orderList=order_ReceiptDao.findOrderByReceiptIdAndStatus(receipt.getId(), receipt.getStatus());
		vehicleList=vehicleService.findVehicle(0, "", 0, 0, 0, receipt.getId());
		return "success";
	}
	
	public String showUnarrivedReceipt(){
		return null;
	}
	
	public String updateReceipt(){
		return null;
	}
	
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public List<Vehicle> getVehicleList() {
		return vehicleList;
	}
	public void setVehicleList(List<Vehicle> vehicleList) {
		this.vehicleList = vehicleList;
	}
	public List<Receipt> getReceiptList() {
		return receiptList;
	}
	public void setReceiptList(List<Receipt> receiptList) {
		this.receiptList = receiptList;
	}
	public Receipt getReceipt() {
		return receipt;
	}
	public void setReceipt(Receipt receipt) {
		this.receipt = receipt;
	}
	public ReceiptService getReceiptService() {
		return receiptService;
	}
	public void setReceiptService(ReceiptService receiptService) {
		this.receiptService = receiptService;
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

	public List<Integer> getSelectedIDList() {
		return selectedIDList;
	}

	public void setSelectedIDList(List<Integer> selectedIDList) {
		this.selectedIDList = selectedIDList;
	}

	public int getReceiptID() {
		return receiptID;
	}

	public void setReceiptID(int receiptID) {
		this.receiptID = receiptID;
	}

	public String getReceiptIDString() {
		return receiptIDString;
	}

	public void setReceiptIDString(String receiptIDString) {
		this.receiptIDString = receiptIDString;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
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

	public int getDestStationID() {
		return destStationID;
	}

	public void setDestStationID(int destStationID) {
		this.destStationID = destStationID;
	}

	public StationService getStationService() {
		return stationService;
	}

	public void setStationService(StationService stationService) {
		this.stationService = stationService;
	}
	public PageBean getOrderPageBean() {
		return orderPageBean;
	}
	public void setOrderPageBean(PageBean orderPageBean) {
		this.orderPageBean = orderPageBean;
	}
	public int getOrderCurrentPage() {
		return orderCurrentPage;
	}
	public void setOrderCurrentPage(int orderCurrentPage) {
		this.orderCurrentPage = orderCurrentPage;
	}
	public PageBean getVehiclePageBean() {
		return vehiclePageBean;
	}
	public void setVehiclePageBean(PageBean vehiclePageBean) {
		this.vehiclePageBean = vehiclePageBean;
	}
	public int getVehicleCurrentPage() {
		return vehicleCurrentPage;
	}
	public void setVehicleCurrentPage(int vehicleCurrentPage) {
		this.vehicleCurrentPage = vehicleCurrentPage;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public VehicleService getVehicleService() {
		return vehicleService;
	}
	public void setVehicleService(VehicleService vehicleService) {
		this.vehicleService = vehicleService;
	}
	public List<Integer> getSelectedOrderIDList() {
		return selectedOrderIDList;
	}
	public void setSelectedOrderIDList(List<Integer> selectedOrderIDList) {
		this.selectedOrderIDList = selectedOrderIDList;
	}
	public List<Integer> getSelectedVehicleIDList() {
		return selectedVehicleIDList;
	}
	public void setSelectedVehicleIDList(List<Integer> selectedVehicleIDList) {
		this.selectedVehicleIDList = selectedVehicleIDList;
	}
	public int getCarrierID() {
		return carrierID;
	}
	public void setCarrierID(int carrierID) {
		this.carrierID = carrierID;
	}
	public int getRecipientID() {
		return recipientID;
	}
	public void setRecipientID(int recipientID) {
		this.recipientID = recipientID;
	}

	public double getTotalVehicleWeight() {
		return totalVehicleWeight;
	}

	public void setTotalVehicleWeight(double totalVehicleWeight) {
		this.totalVehicleWeight = totalVehicleWeight;
	}

	public double getTotalVehicleVolume() {
		return totalVehicleVolume;
	}

	public void setTotalVehicleVolume(double totalVehicleVolume) {
		this.totalVehicleVolume = totalVehicleVolume;
	}

	public double getTotalOrderWeight() {
		return totalOrderWeight;
	}

	public void setTotalOrderWeight(double totalOrderWeight) {
		this.totalOrderWeight = totalOrderWeight;
	}

	public double getTotalOrderVolume() {
		return totalOrderVolume;
	}

	public void setTotalOrderVolume(int totalOrderVolume) {
		this.totalOrderVolume = totalOrderVolume;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getsOrderCurrentPage() {
		return sOrderCurrentPage;
	}
	public void setsOrderCurrentPage(String sOrderCurrentPage) {
		this.sOrderCurrentPage = sOrderCurrentPage;
	}
	public String getsVehicleCurrentPage() {
		return sVehicleCurrentPage;
	}
	public void setsVehicleCurrentPage(String sVehicleCurrentPage) {
		this.sVehicleCurrentPage = sVehicleCurrentPage;
	}

	public String getsCurrentPage() {
		return sCurrentPage;
	}

	public void setsCurrentPage(String sCurrentPage) {
		this.sCurrentPage = sCurrentPage;
	}

	public List<Station> getSourceStationList() {
		return sourceStationList;
	}

	public void setSourceStationList(List<Station> sourceStationList) {
		this.sourceStationList = sourceStationList;
	}

	public List<Station> getDestStationList() {
		return destStationList;
	}

	public void setDestStationList(List<Station> destStationList) {
		this.destStationList = destStationList;
	}

	public Map<Integer, List<Station>> getDestStationMap() {
		return destStationMap;
	}

	public void setDestStationMap(Map<Integer, List<Station>> destStationMap) {
		this.destStationMap = destStationMap;
	}

	public int getStationID() {
		return stationID;
	}

	public void setStationID(int stationID) {
		this.stationID = stationID;
	}

	public List<Admin> getRecipientList() {
		return recipientList;
	}

	public void setRecipientList(List<Admin> recipientList) {
		this.recipientList = recipientList;
	}

	public List<Admin> getCarrierList() {
		return carrierList;
	}

	public void setCarrierList(List<Admin> carrierList) {
		this.carrierList = carrierList;
	}

	public Order_ReceiptDao getOrder_ReceiptDao() {
		return order_ReceiptDao;
	}

	public void setOrder_ReceiptDao(Order_ReceiptDao order_ReceiptDao) {
		this.order_ReceiptDao = order_ReceiptDao;
	}

}
