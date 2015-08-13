package com.spy.service;

import java.util.List;

import com.spy.entity.Admin;
import com.spy.entity.Customer;

/**
 *  用户管理服务层
 * @author 郑启荣
 * 
 */
public interface UserService {
	
	/**
	 * 增加管理员
	 * @param admin 管理员
	 * @return 0:失败  1:成功
	 */
	public int addAdmin(Admin admin);
	
	/**
	 * 增加客户
	 * @param customer 客户
	 * @return 0:失败  1:成功
	 */
	public int addCustomer(Customer customer);
	
	/**
	 * 删除管理员
	 * @param admin 管理员
	 * @return 0:失败  1:成功
	 */
	public int deleteAdmin(Admin admin);
	
	/**
	 * 删除客户
	 * @param customer 客户
	 * @return 0:失败  1:成功
	 */
	public int deleteCustomer(Customer customer);
	
	/**
	 * 删除多个客户
	 * @param idList 客户id列表
	 * @return 0:失败  1:成功
	 */
	public int deleteMultiCustomer(List<Integer> idList);
	
	/**
	 * 删除多个管理员
	 * @param idList id列表
	 * @return 0:失败  1:成功
	 */
	public int deleteMultiAdmin(List<Integer> idList);
	
	/**
	 * 通过id查找管理员
	 * @param id 要找的id
	 * @return 找到的管理员
	 */
	public Admin findAdminByID(int id);
	
	/**
	 * 通过id查找客户
	 * @param id 要找的id
	 * @return 找到的客户
	 */
	public Customer findCustomerByID(int id);
	
	/**
	 * 查找所有管理员
	 * @return adminList:所有管理员的列表
	 */
	public List<Admin> findAllAdmin();
	
	/**
	 * 查找所有客户
	 * @return adminList:所有客户的列表
	 */
	public List<Customer> findAllCustomer();
	
	/**
	 * 管理员登陆
	 * @param username 登录名
	 * @param password 密码
	 * @return 0:失败  1:成功
	 */
	public int adminlogin(String username,String password);
	
	/**
	 * 更新管理员
	 * @param admin 管理员
	 * @return 0:失败  1:成功
	 */
	public int updateAdmin(Admin admin);
	
	/**
	 * 更新客户
	 * @param customer 客户
	 * @return 0:失败  1:成功
	 */
	public int updateCustomer(Customer customer);
	
	/**
	 * 通过站点查找管理员
	 * @param stationID 站点id
	 * @return 找到的管理员
	 */
	public List<Admin> findAdminByStation(int stationID);
	
	/**
	 * 搜索管理员
	 * @param id id
	 * @param name 用户名
	 * @param realName 真实姓名
	 * @param occupation 职位
	 * @param roleId 角色id
	 * @param stationId 站点id
	 * @return 找到的管理员
	 */
	public List<Admin> searchAdmin(int id,String name,String realName,String occupation,int roleId,int stationId);
	
	/**
	 * 搜索客户
	 * @param id id
	 * @param name 用户名
	 * @param realName 真实姓名
	 * @param unitphone 电话
	 * @return 找到的客户
	 */
	public List<Customer> searchCustomer(int id,String name,String realName,String unitphone);
	
	/**
	 * 客户登陆
	 * @param username 用户名
	 * @param password 密码
	 * @return 0:失败  1:成功
	 */
	public int customerLogin(String username,String password);
}
