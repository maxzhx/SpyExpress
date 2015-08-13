package com.spy.action;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.spy.entity.Admin;
import com.spy.entity.Customer;
import com.spy.entity.Role;
import com.spy.entity.Station;
import com.spy.service.RoleService;
import com.spy.service.StationService;
import com.spy.service.UserService;

@Component("userAction")
public class UserAction extends ActionSupport{
	
	private Admin admin;
	Station station;
	private List<Station> stationList;
	private int stationId,addStationId,searchStationId;
	private List<Admin> adminList;
	private Customer customer;
	private List<Customer> customerList;
	private List<Role> roleList;
	private String username="",realName="",occupation;
	private String password;
	private String sAdminCurrentPage="";
	private int stationflag;
	private String sCustomerCurrentPage="";
	private int adminId,roleId,addRoleId,searchRoleId;
	private int customerId;
	private int currentPage=1,tempPage;
	private String sex,unitphone="";
	private List<Integer> selectedIdList;
	private PageBean pageBean=new PageBean();
	private String confirmpass;
	@Autowired
	private UserService userService;
	@Autowired
	private StationService stationService;
	@Autowired
	private RoleService roleService;
	
	private String adminIdString="",customerIdString="",stationIdString="";
    private List<Station> sStationList;
    private List<Role> sRoleList;
    private boolean isclick;
    

	public List<Role> getsRoleList() {
		return sRoleList;
	}
	public void setsRoleList(List<Role> sRoleList) {
		this.sRoleList = sRoleList;
	}
	public int getAddStationId() {
		return addStationId;
	}
	public void setAddStationId(int addStationId) {
		this.addStationId = addStationId;
	}
	public int getSearchStationId() {
		return searchStationId;
	}
	public void setSearchStationId(int searchStationId) {
		this.searchStationId = searchStationId;
	}
	public int getAddRoleId() {
		return addRoleId;
	}
	public void setAddRoleId(int addRoleId) {
		this.addRoleId = addRoleId;
	}
	public int getSearchRoleId() {
		return searchRoleId;
	}
	public void setSearchRoleId(int searchRoleId) {
		this.searchRoleId = searchRoleId;
	}
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	public Station getStation() {
		return station;
	}
	public void setStation(Station station) {
		this.station = station;
	}
	public List<Station> getsStationList() {
		return sStationList;
	}
	public void setsStationList(List<Station> sStationList) {
		this.sStationList = sStationList;
	}
	public int getStationflag() {
		return stationflag;
	}
	public void setStationflag(int stationflag) {
		this.stationflag = stationflag;
	}
	public String getAdminIdString() {
		return adminIdString;
	}
	public void setAdminIdString(String adminIdString) {
		this.adminIdString = adminIdString;
	}
	public String getCustomerIdString() {
		return customerIdString;
	}
	public void setCustomerIdString(String customerIdString) {
		this.customerIdString = customerIdString;
	}
	public String getStationIdString() {
		return stationIdString;
	}
	public void setStationIdString(String stationIdString) {
		this.stationIdString = stationIdString;
	}
	public String getsAdminCurrentPage() {
		return sAdminCurrentPage;
	}
	public void setsAdminCurrentPage(String sAdminCurrentPage) {
		this.sAdminCurrentPage = sAdminCurrentPage;
	}
	public String getsCustomerCurrentPage() {
		return sCustomerCurrentPage;
	}
	public void setsCustomerCurrentPage(String sCustomerCurrentPage) {
		this.sCustomerCurrentPage = sCustomerCurrentPage;
	}
	public String getConfirmpass() {
		return confirmpass;
	}
	public void setConfirmpass(String confirmpass) {
		this.confirmpass = confirmpass;
	}
	public String getUnitphone() {
		return unitphone;
	}
	public void setUnitphone(String unitphone) {
		this.unitphone = unitphone;
	}
	public int getTempPage() {
		return tempPage;
	}
	public void setTempPage(int tempPage) {
		this.tempPage = tempPage;
	}
	public List<Integer> getSelectedIdList() {
		return selectedIdList;
	}
	public void setSelectedIdList(List<Integer> selectedIdList) {
		this.selectedIdList = selectedIdList;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public StationService getStationService() {
		return stationService;
	}
	public void setStationService(StationService stationService) {
		this.stationService = stationService;
	}
	public int getStationId() {
		return stationId;
	}
	public void setStationId(int stationId) {
		this.stationId = stationId;
	}
	public List<Station> getStationList() {
		return stationList;
	}
	public void setStationList(List<Station> stationList) {
		this.stationList = stationList;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
    
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public List<Admin> getAdminList() {
		return adminList;
	}
	public void setAdminList(List<Admin> adminList) {
		this.adminList = adminList;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public List<Customer> getCustomerList() {
		return customerList;
	}
	public void setCustomerList(List<Customer> customerList) {
		this.customerList = customerList;
	}
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	//************************************************************************************
	//set get
	
	
	public String addAdmin(){
		int flag;
		System.out.println(admin.getName());
		Station station=stationService.findStationByID(addStationId);
		Role role=roleService.findRoleByID(addRoleId);
		admin.setStation(station);
		admin.setRole(role);
		flag=userService.addAdmin(admin);
		if(flag==1)
		return "success";
		else return "fail";
	}
	
	public String addCustomer(){
		int flag;
		flag=userService.addCustomer(customer);
		if(flag==1)
		return "success";
		else return "fail";
	}
	
	public String deleteAdmin(){
		int flag;
		
		admin=userService.findAdminByID(adminId);
		flag=userService.deleteAdmin(admin);		 
		if(flag==1)
		return "success";
		else return "fail";
	}
	
	public String deleteCustomer(){
		int flag;
		customer=userService.findCustomerByID(customerId);
		flag=userService.deleteCustomer(customer);
		if(flag==1)
			return "success";
		else 
		return "fail";
	}
	
	public String deleteMultiAdmin(){
		int flag;
	    if(selectedIdList.isEmpty())
		return "fail";
	    else 
	    {
		flag=userService.deleteMultiAdmin(selectedIdList);
		if(flag==1)
		return "success";
		else return "fail";
		}
	}
	
	public String deleteMultiCustomer(){
		int flag;
		System.out.println(selectedIdList.get(0));
		flag=userService.deleteMultiCustomer(selectedIdList);
		if(flag==1)
			return "success";
		return "fail";
	}
	//ϵͳ�û���¼
	public String adminLogin(){
		int id;
		HttpSession session=ServletActionContext.getRequest().getSession();
		id=userService.adminlogin(username, password);
		if(id==0){
			return "fail";
		}
		else 
		{
		 admin=userService.findAdminByID(id);
		 stationflag=admin.getStation().getId();
		 System.out.println(admin.getName());
		 session.setAttribute("admin", admin);
		 session.setAttribute("vehicleState", admin.getRole().getVehicle());
		 session.setAttribute("stationState", admin.getRole().getStation());
		 session.setAttribute("scopeState", admin.getRole().getScope());
		 session.setAttribute("orderState", admin.getRole().getOrders());
		 session.setAttribute("receiptState", admin.getRole().getReceipt());
		 session.setAttribute("reportState", admin.getRole().getReport());
		 session.setAttribute("usersState", admin.getRole().getUsers());
		 HttpServletRequest request = ServletActionContext.getRequest(); 
	     HttpServletResponse response =  ServletActionContext.getResponse(); 
	     Cookie[] cookies = request.getCookies();
	     for (int i = 0; cookies != null && i < cookies.length; i++) {
	      Cookie cookie = cookies[i];
	      cookie.setMaxAge(0);
	      response.addCookie(cookie);
	     }
	     if(isclick==true)
	     {
	    	 Cookie cookie1 = new Cookie("username", username);
		     cookie1.setMaxAge(11111111);
		     Cookie cookie2 = new Cookie("password", password);
		     cookie2.setMaxAge(11111111);
		     System.out.println("ccccccc"+password);
		     response.addCookie(cookie1);
		     response.addCookie(cookie2);
	     }
		 username="";
		 System.out.println(stationflag);
		 return "success";
		}
	}
	//�ͻ���¼
	public String customerLogin()
	{
		int id;
		HttpSession session=ServletActionContext.getRequest().getSession();
		id=userService.customerLogin(username, password);
		if(id==0)
			return "fail";
		else{
			customer=userService.findCustomerByID(id);
			HttpServletRequest request = ServletActionContext.getRequest(); 
		     HttpServletResponse response =  ServletActionContext.getResponse(); 
		     Cookie[] cookies = request.getCookies();
		     for (int i = 0; cookies != null && i < cookies.length; i++) {
		      Cookie cookie = cookies[i];
		      cookie.setMaxAge(0);
		      response.addCookie(cookie);
		     }
		     if(isclick==true){
		    	 Cookie cookie1 = new Cookie("username", username);
			     cookie1.setMaxAge(11111111);
			     Cookie cookie2 = new Cookie("password", password);
			     cookie2.setMaxAge(11111111);
			     System.out.println("ccccccc"+password);
			     response.addCookie(cookie1);
			     response.addCookie(cookie2);
		     }
			session.setAttribute("customer",customer);
			return "success";
		}
	}
	//�˳���¼
	public String logout()
	{
		HttpServletRequest request = ServletActionContext.getRequest(); 
	     HttpServletResponse response =  ServletActionContext.getResponse(); 
	     Cookie[] cookies = request.getCookies();
	     for (int i = 0; cookies != null && i < cookies.length; i++) {
	      Cookie cookie = cookies[i];
	      cookie.setMaxAge(0);
	      response.addCookie(cookie);
	     }
		ServletActionContext.getRequest().getSession().invalidate();
		return "success";
	}
	
    public String showAdmin(){
		admin=userService.findAdminByID(adminId);
		return "success";
	}
	
	public String showAllAdmin(){
		adminList=userService.findAllAdmin();
		adminList=pageBean.queryByPage(currentPage, adminList);
		sStationList=stationService.findAllStation();
		sRoleList=roleService.findAllRole();
		System.out.println(stationflag);
		return "success";
	}
	//���ص�ǰҳ
	public String showAdminReturn()
	{
		adminList=userService.findAllAdmin();
		
		adminList=pageBean.queryByPage(currentPage, adminList);
		return "success";
	}
	
	//��ת�����ӹ���Ա��ҳ��
	public String showAddAdmin()
	{
		admin=new Admin();
		stationList=stationService.findAllStation();
		roleList=roleService.findAllRole();
		return "success";
	}
	public String showAddCustomer()
	{
		
		customer=new Customer();
		return "success";
	}
	//��ת��ǰ̨�û���Ϣ
	public String showFrontInfo()
	{
		HttpSession session=ServletActionContext.getRequest().getSession();
		customer=(Customer)session.getAttribute("customer");
		confirmpass=customer.getPass();
		System.out.println(customer.getName());
		return "success";
	}
	public String showUpdateAdmin()
	{
		System.out.println(adminId);
		admin=new Admin();
		stationList=stationService.findAllStation();
		stationList.add(stationService.findStationByID(0));
		admin=userService.findAdminByID(adminId);
		if(admin.getStation()!=null)
		stationId=admin.getStation().getId();
		else stationId=0;
		roleList=roleService.findAllRole();
		return "success";
	}
	public String showUpadateCustomer()
	{
		customer=new Customer();
		customer=userService.findCustomerByID(customerId);
		return "success";
	}
	public String showAllCustomer(){
		customerList=userService.findAllCustomer();
		customerList=pageBean.queryByPage(currentPage, customerList);
		return "success";
	}
	
	public String showCustomer(){
		customer=userService.findCustomerByID(customerId);
		return "success";
	}
	
	public String updateAdmin(){
		Station station=stationService.findStationByID(stationId);
		admin.setStation(station);
		System.out.println(roleId);
		admin.setRole(roleService.findRoleByID(roleId));
		int flag=userService.updateAdmin(admin);
		if(flag==1)
		return "success";
		else return "fail";
	}
	public String updateBackCustomer()
	{
		int flag=userService.updateCustomer(customer);
		if(flag==1)
		return "success";
		else return "fail";
	}
	public String updateCustomer(){
		if(confirmpass.equals(customer.getPass()))
		{
		int flag=userService.updateCustomer(customer);
		if(flag==1)
		return "success";
		else return "fail";
		}
		else return "fail";
	}
	//��������Ա
	public String searchAdmin()
	{
		
		if(!adminIdString.equals(""))
		{
			adminId=Integer.parseInt(adminIdString);
		}
		else adminId=0;
		/*if(!stationIdString.equals(""))
		{
			stationId=Integer.parseInt(stationIdString);
		}
		else stationId=0;*/
		username="";
		occupation="";
		adminList=userService.searchAdmin(adminId, username, realName, occupation, searchRoleId, searchStationId);
		if(!adminList.isEmpty())
		{
		
		currentPage=1;
		adminList=pageBean.queryByPage(currentPage, adminList);
		/*adminId=0;
		adminIdString="";
		username="";
		realName="";
		occupation="";
		roleId=0;
		stationId=0;
		stationIdString="";*/
		return "success";
		}
		else
		{
			//adminList=userService.findAllAdmin();
			adminList=pageBean.queryByPage(currentPage, adminList);
		/*	adminId=0;
			adminIdString="";
			username="";
			realName="";
			occupation="";
			roleId=0;
			stationId=0;
			stationIdString="";*/
			return "fail";
		}
	}
	public String searchCustomer()
	{
		if(!customerIdString.equals(""))
			customerId=Integer.parseInt(customerIdString);
		else customerId=0;
		customerList=userService.searchCustomer(customerId, username, realName, unitphone);
		if(!customerList.isEmpty())
		{
		currentPage=1;
		customerList=pageBean.queryByPage(currentPage, customerList);
		/*customerId=0;
		username="";
		realName="";unitphone="";*/
		return "success";
		}
		else 
			{
			//customerList=userService.findAllCustomer();
			customerList=pageBean.queryByPage(currentPage, customerList);
			/*customerId=0;
			customerIdString="";
			username="";
			realName="";unitphone="";*/
			return "fail";
			}
	}
	//������������Ա����
	public String cancelAdmin()
	{
		adminId=0;
		stationIdString="";
		adminIdString="";
		username="";
		realName="";
		occupation="";
		roleId=0;
		stationId=0;
		adminList=userService.findAllAdmin();
		return "success";
	}
	//���������ͻ�����
	public String cancelCustomer()
	{
		customerId=0;
		customerIdString="";
		username="";
		realName="";unitphone="";
		customerList=userService.findAllCustomer();
		return "success";
	}
	public String adminCurrentPage()
	{
		sStationList=stationService.findAllStation();
		if(!sAdminCurrentPage.equals("")){
			currentPage = Integer.parseInt(sAdminCurrentPage);
			if(currentPage>pageBean.getTotalPages())
				currentPage = pageBean.getTotalPages();
			if(currentPage<1)
				currentPage = 1;
			sAdminCurrentPage="";
		}
		adminList=pageBean.showCurrentPage(currentPage);
		return "success";
	}
	public String customerCurrentPage()
	{
		if(!sCustomerCurrentPage.equals("")){
			currentPage = Integer.parseInt(sCustomerCurrentPage);
			if(currentPage>pageBean.getTotalPages())
				currentPage = pageBean.getTotalPages();
			if(currentPage<1)
				currentPage = 1;
			sCustomerCurrentPage="";
		}
		customerList=pageBean.showCurrentPage(currentPage);
		return "success";
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public boolean isIsclick() {
		return isclick;
	}
	public void setIsclick(boolean isclick) {
		this.isclick = isclick;
	}



}
