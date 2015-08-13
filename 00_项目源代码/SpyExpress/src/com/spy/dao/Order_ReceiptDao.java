package com.spy.dao;

import java.util.List;

import com.spy.entity.Order;
import com.spy.entity.Order_Receipt;
import com.spy.entity.Receipt;

/**
 * 通过交接单查订单和通过订单查交接单的Dao
 * @author 郑启荣
 *
 */
public interface Order_ReceiptDao {
	
	/**
	 * 用于添加一个增加订单接收单表的项
	 * @param order_Receipt：要添加的对象
	 * @return 0：表示添加失败 1：表示添加成功
	 */
	public int addOrder_Receipt(Order_Receipt order_Receipt);
	
	/**
	 * 通过订单号和状态查找接收单
	 * @param OrderID：订单号
	 * @param status：状态
	 * @return 查找到的接收单
	 */
	public List<Receipt> findReceiptByOrderIdAndStatus(int OrderID,int status);
	
	/**
	 * 通过接收单号和状态查找订单
	 * @param ReceiptID：接收单的ID
	 * @param status：状态
	 * @return 查找到的订单
	 */
	public List<Order> findOrderByReceiptIdAndStatus(int ReceiptID,int status);
	
	/**
	 * 通过hql查找订单-交接单
	 * @param hql：hql语句
	 * @return 查找到的订单-交接单列表
	 */
	public List<Order_Receipt> findOrder_ReceiptByHQL(String hql);
	
	/**
	 * 修改订单-交接单信息
	 * @param order_Receipt
	 * @return 0：表示修改失败 1：表示修改成功
	 */
	public int updateOrder_Receipt(Order_Receipt order_Receipt);
}
