package com.spy.service;

import java.util.List;

import com.spy.entity.Order;
import com.spy.entity.Scope;

/**
 *  订单管理模块的服务层
 * @author 郑启荣
 * 
 */
public interface OrderService {
	
	/**
	 * 添加订单
	 * @param order 表示要添加的订单
	 * @return 0 :表示添加失败  1:表示添加成功
	 */
	public int addOrder(Order order);
	
	/**
	 * 修改一组订单的状态为已到达状态
	 * @param idList 表示要修改的订单的ID号的列表
	 * @return 0 :表示修改失败  1:表示修改成功
	 */
	public int arriveMultiOrder(List<Integer> idList);
	
	/**
	 * 修改订单的状态为已到达状态
	 * @param id 表示要修改的订单的ID
	 * @return 0 :表示修改失败  1:表示修改成功
	 */
	public int arriveOrder(int id);
	
	/**
	 * 修改订单的状态为已到以确认
	 * @param id 表示要修改的订单的ID
	 * @return 0 :表示修改失败  1:表示修改成功
	 */
	public int confirmOrder(int id);
	
	/**
	 * 修改一组订单的状态为以确认状态
	 * @param idList 表示要修改的订单的ID号的列表
	 * @return 0 :表示修改失败  1:表示修改成功
	 */
	public int confirmMultiOrder(List<Integer> idList);
	
	/**
	 * 删除订单
	 * @param id 表示要删除的订单的ID
	 * @return 0 :表示删除失败  1:表示删除成功
	 */
	public int deleteOrder(int id);
	
	/**
	 * 删除一组订单
	 * @param idList 表示要删除的订单的ID的列表
	 * @return 0 :表示删除失败  1:表示删除成功
	 */
	public int deleteMultiOder(List<Integer> idList);
	
	/**
	 * 查询订单：通过站点的信息和订单的状态查询
	 * @param stateID 表示订单的状态 0表示所有的状态
	 * @param stationID 表示站点的ID 0表示所有的站点
	 * @return orderList:表示查询到的订单
	 */
	public List<Order> findOrder(int stateID, int stationID);
	
	/**
	 * 通过订单的ID来查询订单
	 * @param id：要查询的订单的ID
	 * @return order：查询到的ID
	 */
	public Order findOrderByID(int id);
	
	/**
	 * 查询订单：通过发送人的信息
	 * @param senderID:发送人的ID
	 * @return orderList:查询到的订单的列表
	 */
	public List<Order> findOrderBySender(int senderID);
	
	/**
	 * 修改一组订单的状态为已接收状态
	 * @param idList 表示要修改的订单的ID号的列表
	 * @return 0 :表示修改失败  1:表示修改成功
	 */
	public int receiveMultiOrder(List<Integer> idList);
	
	/**
	 * 修改订单的状态为已接收
	 * @param id 表示要修改的订单的ID
	 * @return 0 :表示修改失败  1:表示修改成功
	 */
	public int receiveOrder(int id);
	
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
	
	/**
	 * 查找从本站点发出的订单
	 * @param stationID：站点的ID
	 * @return 找到的订单的列表
	 */
	public List<Order> getOrderFromSendStation(int stationID);
	
	/**
	 * 查找从某一站点发往下一站点的的所有订单
	 * @param nowstationID 当前站点
	 * @param nextstationID 下一站
	 * @return 订单列表
	 */
	public List<Order> getNextStationID(int nowstationID,int nextstationID);
	
	/**
	 * 通过hql查找订单
	 * @param hql hql语句
	 * @return 订单列表
	 */
	public List<Order> findOrderByHQL(String hql);
	
	/**
	 * 查找目前在某站点与从某站点出发的所有订单
	 * @param nowstation 当前站点
	 * @param firststation 起始站点
	 * @return 订单列表
	 */
	public List<Order> findOrderByNowStationAndFirstStation(int nowstation,int firststation);

}
