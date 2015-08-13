package com.spy.dao;

import java.util.List;

import org.aspectj.weaver.ast.Or;

import com.spy.entity.Order;

/**
 *  订单管理模块
 * @author 郑启荣
 * 
 */
public interface OrderDao {
	
	/**
	 * 添加订单
	 * @param order 表示要添加的订单
	 * @return 0 :表示添加失败  1:表示添加成功
	 */
	public int addOrder(Order order);
	
	/**
	 * 删除订单
	 * @param order 表示要删除的订单
	 * @return 0 :表示删除失败  1:表示删除成功
	 */
	public int deleteOrder(Order order);
	
	/**
	 * 通过HQL语句查询订单
	 * @param hql 用于查询的hql语句
	 * @return orderList:通过hql语句查询到的订单的列表
	 */
	public List<Order> findOrderByHQL(String hql);
	
	/**
	 * 通过ID查询订单
	 * @param id:要查询的订单的ID
	 * @return order：查询到的订单
	 */
	public Order findOrderByID(int id);
	
	/**
	 * 修改订单
	 * @param order 表示要修改的订单
	 * @return 0 :表示修改失败  1:表示修改成功
	 */
	public int updateOrder(Order order);
	
	/**
	 * 获得目的站点的ID
	 * @param order：订单
	 * @return 目的站点的ID
	 */
	public int getDestID(Order order);
	
	/**
	 * 获得源站点的ID
	 * @param order：订单
	 * @return 源站点的ID
	 */
	public int getSourceID(Order order);

}
