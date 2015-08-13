package com.spy.dao;

import java.util.List;

import com.spy.entity.Receipt;

/**
 *  交接单管理模块
 * @author 郑慧翔
 * 
 */
public interface ReceiptDao {
	
	/**
	 * 添加交接单
	 * @param receipt 表示要添加的交接单
	 * @return 0 :表示添加失败  1:表示添加成功
	 */
	public int addReceipt(Receipt receipt);
	
	/**
	 * 删除交接单
	 * @param receipt 表示要删除的交接单
	 * @return 0 :表示删除失败  1:表示删除成功
	 */
	public int deleteReceipt(Receipt receipt);
	
	/**
	 * 修改交接单
	 * @param receipt 所要修改的交接单
	 * @return 0:表示修改失败  1:表示修改成功
	 */
	public int updateReceipt(Receipt receipt);
	
	/**
	 * 通过HQL语句查询交接单
	 * @param hql 用于查询的hql语句
	 * @return receiptList:通过hql语句查询到的交接单列表
	 */
	public List<Receipt> findReceiptByHQL(String hql);
	
	/**
	 * 通过ID查询交接单
	 * @param id 所要查询的id
	 * @return Receipt:通过id查到交接单
	 */
	public Receipt findReceiptByID(int id);

}
