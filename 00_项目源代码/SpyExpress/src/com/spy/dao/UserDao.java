package com.spy.dao;

import java.util.List;

import com.spy.entity.Admin;
import com.spy.entity.Customer;

/**
 * 用户管理模块
 * @author 郑启荣
 * 
 */
public interface UserDao {
	
	/**
	 * 添加系统用户
	 * @param admin 表示要添加的系统用户
	 * @return 0 :表示添加失败  1:表示添加成功
	 */
	public int addAdmin(Admin admin);
	
	/**
	 * 添加客户
	 * @param customer 表示要添加的客户
	 * @return 0 :表示添加失败  1:表示添加成功
	 */
	public int addCustomer(Customer customer);
	
	/**
	 * 删除系统用户
	 * @param admin 表示要删除的系统用户
	 * @return 0 :表示删除失败  1:表示删除成功
	 */
	public int deleteAdmin(Admin admin);
	
	/**
	 * 删除客户
	 * @param customer 表示要添删除的客户
	 * @return 0 :表示删除失败  1:表示删除成功
	 */
	public int deleteCustomer(Customer customer);
	
	/**
	 * 通过HQL语句查询系统用户
	 * @param hql 用于查询的hql语句
	 * @return adminList:通过hql语句查询到的系统用户的列表
	 */
	public List<Admin> FindAdminByHQL(String hql);
	
	/**
	 * 通过ID查询系统用户
	 * @param id:要查询的系统用户的ID
	 * @return order：查询到的系统用户
	 */
	public Admin findAdminByID(int id);
	
	/**
	 * 通过HQL语句查询客户
	 * @param hql 用于查询的hql语句
	 * @return customerList:通过hql语句查询到的客户的列表
	 */
	public List<Customer> FindCustomerByHQL(String hql);
	
	/**
	 * 通过ID查询客户
	 * @param id:要查询的客户的ID
	 * @return order：查询到的客户
	 */
	public Customer findCustomerByID(int id);
	
	/**
	 * 更新系统用户
	 * @param customer 表示更新的系统用户
	 * @return 0 :表示更新失败  1:表示更新成功
	 */
	public int updateAdmin(Admin admin);
	
	/**
	 * 更新客户
	 * @param customer 表示更新的客户
	 * @return 0 :表示更新失败  1:表示更新成功
	 */
	public int updateCustomer(Customer customer);
}
