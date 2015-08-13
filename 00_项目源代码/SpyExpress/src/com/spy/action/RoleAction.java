package com.spy.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.spy.entity.Role;
import com.spy.service.RoleService;

@Component("roleAction")
public class RoleAction extends ActionSupport {
	List<Role> roleList;
	Role role;
	String roleName="";
	int roleID=0;
	List<Integer> selectedIDList;
	int currentPage=1;
	String sCurrentPage="";
	PageBean pageBean=new PageBean();
	List<Integer> selectAuthorList;
	
	@Autowired
	RoleService roleService;
	public String showAllRole(){
		flashRoleSearchCondition();
		roleList=roleService.findAllRole();
		roleList=pageBean.queryByPage(currentPage, roleList);
		return "success";
	}
	public String deleteMultiRole(){
		roleService.deleteMultiRole(selectedIDList);
		return "success";
	}
	public String deleteRole(){
		roleService.deleteRole(roleService.findRoleByID(roleID));
		return "success";
	}
	public String showRole(){
		role=roleService.findRoleByID(roleID);
		return "success";
	}
	public String newRole(){
		role=new Role();
		return "success";
	}
	
	public String searchRole(){
		roleList=roleService.searchRole(roleName);
		roleList=pageBean.queryByPage(currentPage, roleList);
		return "success";
	}
	
	public String flashRoleSearchCondition(){
		roleName="";
		return "success";
	}
	
	public String addRole(){
		role.setVehicle(0);
		role.setStation(0);
		role.setScope(0);
		role.setReceipt(0);
		role.setOrders(0);
		role.setReport(0);
		role.setUsers(0);
		for (int a:selectAuthorList) {
			switch (a) {
			case 1:
				role.setVehicle(1);
				break;
			case 2:
				role.setStation(1);
				break;
			case 3:
				role.setScope(1);
				break;
			case 4:
				role.setReceipt(1);
				break;
			case 5:
				role.setOrders(1);
				break;
			case 6:
				role.setReport(1);
				break;
			case 7:
				role.setUsers(1);
				break;

			default:
				break;
			}
		}
		roleService.addRole(role);
		return "success";
	}
	
	public String updateRole(){
//		System.out.println(selectAuthorList.size());
		role.setVehicle(0);
		role.setStation(0);
		role.setScope(0);
		role.setReceipt(0);
		role.setOrders(0);
		role.setReport(0);
		role.setUsers(0);
		for (int a:selectAuthorList) {
			switch (a) {
			case 1:
				role.setVehicle(1);
				break;
			case 2:
				role.setStation(1);
				break;
			case 3:
				role.setScope(1);
				break;
			case 4:
				role.setReceipt(1);
				break;
			case 5:
				role.setOrders(1);
				break;
			case 6:
				role.setReport(1);
				break;
			case 7:
				role.setUsers(1);
				break;

			default:
				break;
			}
		}
		roleService.updateRole(role);
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
		roleList=pageBean.showCurrentPage(currentPage);
		return "success";
	}
	
	
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public List<Integer> getSelectedIDList() {
		return selectedIDList;
	}

	public void setSelectedIDList(List<Integer> selectedIDList) {
		this.selectedIDList = selectedIDList;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public String getsCurrentPage() {
		return sCurrentPage;
	}
	public void setsCurrentPage(String sCurrentPage) {
		this.sCurrentPage = sCurrentPage;
	}
	public int getRoleID() {
		return roleID;
	}
	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public List<Integer> getSelectAuthorList() {
		return selectAuthorList;
	}
	public void setSelectAuthorList(List<Integer> selectAuthorList) {
		this.selectAuthorList = selectAuthorList;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
}
