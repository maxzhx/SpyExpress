package com.spy.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.x500.X500Principal;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.aspectj.apache.bcel.generic.NEW;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.dialect.IngresDialect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.spy.dao.Order_ReceiptDao;
import com.spy.entity.Admin;
import com.spy.entity.Customer;
import com.spy.entity.Goods;
import com.spy.entity.Order;
import com.spy.entity.Order_Receipt;
import com.spy.entity.Receipt;
import com.spy.entity.Scope;
import com.spy.entity.Station;
import com.spy.service.OrderService;
import com.spy.service.ReceiptService;
import com.spy.service.StationService;
import com.spy.service.UserService;

/**
 * ���������action
 * @author ֣����
 *
 */

@Component("orderAction")
public class OrderAction extends ActionSupport{
	private Map<Integer, List<Station>> destStationMap;
	public Map<Integer, List<Station>> getDestStationMap() {
		return destStationMap;
	}
	public void setDestStationMap(Map<Integer, List<Station>> destStationMap) {
		this.destStationMap = destStationMap;
	}
	private String receiptID;
	private String status = "0";
	private List<Station> stationList;
	private List<Station> stationLists;
	private String scurrentPage="";
	private List<Order> orderList;
	private List<Integer> idList;
	private String orderId="";
	private PageBean pageBean = new PageBean();
	private Order order;
	private int adminRole;
	private int currentPage = 1;
	@Autowired
	private OrderService orderService;
	@Autowired
	private StationService stationService;
	@Autowired
	private UserService userService;
	@Autowired
	private Order_ReceiptDao orderReceiptDao;
	@Autowired
	private ReceiptService receiptService;
	private Customer receiver;
	private Customer sender;
	private int stationID=0;
	private int stateID=0;
	private int orderID;
	private String sourceStation;
	private String destStation;
	private int stationmap[][]; 
	private int idmap[];
	private String recvtime;
	private String sendtime;
	private int sourceStationID;
	private List<Customer> customers;
	private int suctomerID;
	private String pathMessage;
	public List<Station> getStationList() {
		return stationList;
	}
	public void setStationList(List<Station> stationList) {
		this.stationList = stationList;
	}
	private int destStationID;
	
	
	
	public String getRecvtime() {
		return recvtime;
	}
	public void setRecvtime(String recvtime) {
		this.recvtime = recvtime;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getSourceStation() {
		return sourceStation;
	}
	public void setSourceStation(String sourceStation) {
		this.sourceStation = sourceStation;
	}

	public String getDestStation() {
		return destStation;
	}
	public void setDestStation(String destStation) {
		this.destStation = destStation;
	}
	public String backaddOrder(){
		System.out.println("0000000000");
		GetStationMap();
		List<Integer> path = Dijkstra.DijkstraPath(stationList.size(), sourceStationID, destStationID, stationmap, idmap);
		order.setStatus(1);
		Customer customer = new Customer();
		customer = userService.findCustomerByID(suctomerID);
		order.setCustomer(customer);
		Station station = new Station();
		station = stationService.findStationByID(sourceStationID);
		order.setStation(station);
	//	order.setSendTime(new Date("13-7-1 0:00:00.000"));
	//	order.setRecvTime(new Date("13-7-1 0:00:00.000"));
		String newpath="";
		for (int i = 0; i < path.size()-1; i++) {
			newpath+=path.get(i)+"-";
		}
		newpath+=path.get(path.size()-1);
		order.setPath(newpath);
		order.setPrice(GetPrice(path));
		orderService.addOrder(order);
		return "success";
	}
	
	public String frontaddOrder()
	{
		GetStationMap();
		List<Integer> path = Dijkstra.DijkstraPath(stationList.size(), sourceStationID, destStationID, stationmap, idmap);
		order.setStatus(1);
		Station station = new Station();
		station = stationService.findStationByID(sourceStationID);
		order.setStation(station);
	//	order.setSendTime(new Date("13-7-1 0:00:00.000"));
	//	order.setRecvTime(new Date("13-7-1 0:00:00.000"));
		String newpath="";
		for (int i = 0; i < path.size()-1; i++) {
			newpath+=path.get(i)+"-";
		}
		newpath+=path.get(path.size()-1);
		order.setPath(newpath);
		order.setPrice(GetPrice(path));
		orderService.addOrder(order);
		orderID = order.getId();
		System.out.println("aaaaa");
		return "success";
	}
	
	public String findOrderByCustomer()
	{
		status="0";
		HttpSession session=ServletActionContext.getRequest().getSession();
		Customer customer = new Customer();
		customer = (Customer) session.getAttribute("customer");
		orderList = orderService.findOrderByHQL("from Order where customer = "+customer.getId()+"");
		stationList = stationService.findAllStation();
		orderList = pageBean.queryByPage(currentPage, orderList);
		return "success";
	}
	
	public String deleteFrontOrder()
	{
		order = orderService.findOrderByID(orderID);
		if(order.getStatus()==1)
		{
			orderService.deleteOrder(orderID);
			setStatus("1");
		}
		else {
			setStatus("2");
		}
		return "success";
	}
	public String findOrderByID()
	{
		orderList = new ArrayList<Order>();
		order = orderService.findOrderByID(orderID);
		if(order!=null)
		orderList.add(order);
		orderID=0;
		return "success";
	}
	public String showOrderWhenAddOrder()
	{
		System.out.println(orderID);
		order = orderService.findOrderByID(orderID);
		order.setPath(changePathFromID());
		return "success";
	}
	public double GetPrice(List<Integer> path)
	{
		double wprice = 0.0;
		double vprice = 0.0;
		for (int i = 0; i < path.size()-1; i++) {
			Scope scope = stationService.findScopeBySourceAndDest(path.get(i), path.get(i+1));
			if(order.getWeight() > 1){
				wprice += scope.getFirstKgPrice();
				wprice += scope.getKgPrice()*(order.getWeight()-1);
			}
			else {
				wprice += scope.getFirstKgPrice();
			}
			if(order.getVolume()> 1){
				vprice += scope.getFirstCubicPrice();
				vprice += scope.getCubicPrice()*(order.getVolume()-1);
			}
			else {
				vprice += scope.getFirstCubicPrice()*order.getVolume();
			}
			
		}
		if(wprice > vprice)
			return wprice;
		else {
			return vprice;
		}
	}
	public String arriveMultiOrder(){
		return null;
	}
	public String  arriveOrder (){
		return null;
	}
	public String comfirmMultiOrder(){
		if(stateID == 1)
			orderService.confirmMultiOrder(idList);
		else if(stateID == 4){
			orderService.receiveMultiOrder(idList);
		}
		return "success";
	}
	public String comfirmOrder(){
		order = orderService.findOrderByID(orderID);
		if(order.getStatus()==1){
			orderService.confirmOrder(orderID);
		}
		else if(order.getStatus()==4){
			orderService.receiveOrder(order.getId());
		}
		return "success";
	}
	public String deleteMultiOrder(){
		if(idList.size() > 0){
			orderService.deleteMultiOder(idList);
		}
		return "success";
	}
	
	public String deleteOrder()
	{
		System.out.println(orderID);
		orderService.deleteOrder(orderID);
		return "success";
	}
	public String deliverMultiOrder (){
		return null;
	}
	public String deliverOrder(){
		return null;
	}
	public String receiveMultiOrder(){
		orderService.receiveMultiOrder(idList);
		return "success";
	}
	public String receiveOrder (){
		orderService.receiveOrder(order.getId());
		return "success";
	}
	public String showArrivedOrder(){
		orderList = orderService.findOrder(stateID, stationID);
		return null;
	}
	
	
	public String showOrder()
	{
		
		order = orderService.findOrderByID(orderID);
		GetPathMessage();
		order.setPath(changePathFromID());
		if(order.getStatus()==3)
		{
				List<Receipt> receipts = orderReceiptDao.findReceiptByOrderIdAndStatus(order.getId(), 1);
				if(receipts.size()!=0){
					receiptID = receipts.get(0).getId().toString();
				}
				else {
					receiptID ="";
				}
		}
		else {
			receiptID = "";
		}
		//Date date = order.getRecvTime();
		//recvtime = date.getYear()+"-"+date.getMonth()+date.getDay()+" "+date.getHours()+":"+date.getMinutes();
		return "success";
	}
	
	public void GetPathMessage()
	{
		pathMessage = "";
		List<Order_Receipt> orderReceipts = orderReceiptDao.findOrder_ReceiptByHQL("from Order_Receipt where order = "+orderID+"order by id");
		for (int i = 0; i < orderReceipts.size(); i++) {
			Receipt receipt = receiptService.findReceiptByID(orderReceipts.get(i).getReceipt().getId());
			if(receipt.getStatus()==2)
				pathMessage+=receipt.getSendTime().toString()+"从"+receipt.getStationBySourceStaId().getName()+"出发，"+receipt.getRecvTime()+"到达"+receipt.getStationByDestStaId().getName()+"。<br/>承运人："+receipt.getAdminByCarrierId().getRealName()+",接收人:"+receipt.getAdminByRecipientId().getRealName()+"<br/>";
			else {
				pathMessage+=receipt.getSendTime().toString()+"从"+receipt.getStationBySourceStaId().getName()+"出发。<br/>承运人："+receipt.getAdminByCarrierId().getRealName()+"。<br/>";
			}
		}
		orderID=0;
	}
	public String changePathFromID()
	{
		String path[] = order.getPath().split("-");
		for (int i = 0; i < path.length; i++) {
			path[i] = stationService.findStationByID(Integer.parseInt(path[i])).getName();
		}
		sourceStation = path[0];
		destStation = path[path.length-1];
		String newpath = "";
		for (int i = 0; i < path.length-1; i++) {
			newpath+=path[i]+"-";
		}
		newpath+=path[path.length-1];
		return newpath;
	}
	
	public String backnewOrder()
	{
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		customers = userService.findAllCustomer();
		stationLists = new ArrayList<Station>();
		if(admin.getStation().getId()==0){
			stationLists = stationService.findAllStation();
		}
		else {
			stationLists.add(admin.getStation());
		}
		List<Station> allStations = new ArrayList<Station>();
		allStations = stationService.findAllStation();
		destStationMap=new HashMap<Integer, List<Station>>();
		for(int j=0;j<stationLists.size();j++){
			stationList=new ArrayList<Station>();
			for (int i = 0; i < allStations.size(); i++) {
				int x = allStations.get(i).getId();
				int y = stationLists.get(j).getId();
				if(x!=y){
					stationList.add(allStations.get(i));
				}
			}
			destStationMap.put(stationLists.get(j).getId(), stationList);
		}
		order = new Order();
		return "success";
	}
	
	public List<Station> getStationLists() {
		return stationLists;
	}
	public void setStationLists(List<Station> stationLists) {
		this.stationLists = stationLists;
	}
	public String frontnewOrder()
	{
		order = new Order();
		customers = userService.findAllCustomer();
		HttpSession session=ServletActionContext.getRequest().getSession();
		Customer customer = new Customer();
		customer = (Customer) session.getAttribute("customer");
		order.setCustomer(customer);
		stationList=stationService.findAllStation();
		return "success";
	}
	public String showCompletedOrder(){
		return null;
	}
	public String showDeliveredOrder(){
		return null;
	}
	public String showOrderByID(){
		return null;
	}
	public String showOrderBySender(){
		return null;
	}
//	public String showUncomfirmedOrder(){
//		HttpSession session=ServletActionContext.getRequest().getSession();
//		Admin admin=(Admin) session.getAttribute("user");
//		stationID = admin.getStation().getId();
//		orderList = orderService.findOrder(1, stationID);
//		return "success";
//	}
//	public String showUndeliveredOrder(){
//		HttpSession session=ServletActionContext.getRequest().getSession();
//		Admin admin=(Admin) session.getAttribute("user");
//		stationID = admin.getStation().getId();
//		orderList = orderService.findOrder(2, stationID);
//		orderList.addAll(orderService.findOrder(3, stationID));
//		return "success";
//	}
	public String updateOrder(){
		return null;
	}
	
	public String sendFromStation(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("user");
		stationID = admin.getStation().getId();
		orderList = orderService.getOrderFromSendStation(stationID);
		return "success";
	}
	
	public String showAllOrder(){
		flashSearchCondition();
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		int stationid = admin.getStation().getId();
		if(stationid==0)
		{
		stationList = stationService.findAllStation();
		orderList = orderService.findOrder(0, 0);
		orderList = pageBean.queryByPage(currentPage, orderList);
		}
		else {
			stationList = stationService.findAllStation();
			orderList = orderService.findOrderByHQL("from Order where station = "+stationid+" or path like '"+stationid+"%'");
			orderList = pageBean.queryByPage(currentPage, orderList);
		}
		return "success";
	}
	
	public String showCurrentPage(){
		status="0";
		if(!scurrentPage.equals("")){
			currentPage = Integer.parseInt(scurrentPage);
			if(currentPage>pageBean.getTotalPages())
				currentPage = pageBean.getTotalPages();
			if (currentPage<1)
				currentPage=1;
			scurrentPage="";
		}
		orderList =pageBean.showCurrentPage(currentPage);
		return "success";
	}
	
	public void GetStationMap(){
		int maxnum = 1000000;
		List<Station> stations = stationService.findAllStation();
		int length = stations.size();
		stationmap = new int[length+1][length+1];
		idmap = new int[length+1];
		for(int i = 1; i <= length ; i++){
			idmap[i] = stations.get(i-1).getId();
		}
		List<Scope> scopes;
		for (int i = 1; i <= stations.size(); i++) {
			scopes = stationService.findScopeBySourceID(idmap[i]);
			System.out.println(scopes.size());
			for (int j = 0; j < scopes.size(); j++) {
				int id = scopes.get(j).getStationByDestStaId().getId();
				for (int j2 = 1; j2 <= stations.size(); j2++) {
					if(id==idmap[j2]){
						stationmap[i][j2]=scopes.get(j).getDuration();
						System.out.println(idmap[i]+":"+id);
					}
				}
			}
			for (int j = 1; j <= stations.size(); j++) {
				if (stationmap[i][j]==0) {
					stationmap[i][j]=maxnum;
				}
			}
		}
	}
	
	public String searchOrder()
	{
		int flag=0;
		String hql="from Order";
		if(!orderId.equals("")){
			hql+=" where id = "+orderId;
			flag = 1;
		}
		if(stateID != 0){
			if(flag == 0){
				hql+=" where status = "+stateID;
				flag = 1;
			}
			else {
				hql+=" and status = "+stateID;
			}
		}
		if(stationID != 0){
			if(flag == 0){
				hql+=" where station = "+stationID;
				flag = 1;
			}
			else {
				hql+=" and station = "+stationID;
			}
		}
		stationList = stationService.findAllStation();
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		if(admin!=null)
		{
			int stationid = admin.getStation().getId();
			if(stationid!=stationID && stationid!=0)
			{
				if(stationID!=0)
				{
				if(flag==0)
					hql+=" where path like '"+stationid+"%'";
				else {
					hql+=" and path like '"+stationid+"%'";
				}	
				}
			}
		}
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer!=null){
			if(flag==0)
				hql+=" where customer = "+customer.getId();
			else {
				hql+=" and customer = "+customer.getId();
			}	
		}
		orderList = orderService.findOrderByHQL(hql);
		orderList = pageBean.queryByPage(currentPage, orderList);
		return "success";
	}
	public String changestatus()
	{
		System.out.println("aaaaaaaaaaaaaaaaaa");
		status="0";
		return "success";
	}
	public String flashSearchCondition()
	{
		orderId="";
		stateID=0;
		stationID=0;
		return "success";
	}
	
	public String showOrderfront()
	{
		
		order = orderService.findOrderByID(orderID);
		GetPathMessage();
		order.setPath(changePathFromID());
		return "success";
	}
	
	public String CheckOrder()
	{
		orderID=0;
		order = new Order();
		return "success";
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public List<Integer> getIdList() {
		return idList;
	}
	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public Customer getReceiver() {
		return receiver;
	}
	public void setReceiver(Customer receiver) {
		this.receiver = receiver;
	}
	public Customer getSender() {
		return sender;
	}
	public void setSender(Customer sender) {
		this.sender = sender;
	}
	public int getStaionID() {
		return stationID;
	}
	public void setStaionID(int staionID) {
		this.stationID = staionID;
	}
	public int getStateID() {
		return stateID;
	}
	public void setStateID(int stateID) {
		this.stateID = stateID;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public PageBean getPageBean() {
		return pageBean;
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
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setStationService(StationService stationService) {
		this.stationService = stationService;
	}
	public StationService getStationService() {
		return stationService;
	}
	public void setSourceStationID(int sourceStationID) {
		this.sourceStationID = sourceStationID;
	}
	public int getSourceStationID() {
		return sourceStationID;
	}
	public void setDestStationID(int destStationID) {
		this.destStationID = destStationID;
	}
	public int getDestStationID() {
		return destStationID;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setScurrentPage(String scurrentPage) {
		this.scurrentPage = scurrentPage;
	}
	public String getScurrentPage() {
		return scurrentPage;
	}
	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}
	public List<Customer> getCustomers() {
		return customers;
	}
	public void setSuctomerID(int suctomerID) {
		this.suctomerID = suctomerID;
	}
	public int getSuctomerID() {
		return suctomerID;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
	public void setAdminRole(int adminRole) {
		this.adminRole = adminRole;
	}
	public int getAdminRole() {
		return adminRole;
	}
	public void setReceiptID(String receiptID) {
		this.receiptID = receiptID;
	}
	public String getReceiptID() {
		return receiptID;
	}
	public void setPathMessage(String pathMessage) {
		this.pathMessage = pathMessage;
	}
	public String getPathMessage() {
		return pathMessage;
	}
}
