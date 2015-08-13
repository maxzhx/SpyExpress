package com.spy.service;

import java.util.List;

import com.spy.entity.Order;
import com.spy.entity.Receipt;
import com.spy.entity.Vehicle;

/**
 *  交接单管理服务层
 * @author 郑慧翔
 * 
 */
public interface ReceiptService {
	
	/**
	 * 使多个交接单到达
	 * @param idList 交接单id列表
	 * @return 0:失败  1:成功
	 */
	public int arriveMultiReceipt(List<Integer> receiptIDList);
	
	/**
	 * 到达交接单
	 * 1,改变交接单状态为到达
	 * 2,改变订单站点为当前站点,改变到达最终目的地的订单状态为到达
	 * 3,交换车辆源地点目的地点,改变状态为空闲
	 * @param receipt 订单
	 * @return 0:失败  1:成功
	 */
	public int arriveReceipt(Receipt receipt);
	
	/**
	 * 创建交接单
	 * 1,创建新的交接单
	 * 2,增加新的订单-交接单项;改变起始订单状态
	 * 3,改变车辆状态为在途; 交接单为当前交接单
	 * @param receipt 新增的交接单
	 * @param orderList 相关订单列表
	 * @param vehicleList 车辆列表
	 * @return 0:失败 1:成功
	 */
	public int createReceipt(Receipt receipt, List<Integer> orderIDList, List<Integer> vehicleIDList);
	
	/**
	 * 删除多个交接单
	 * @param idList 要删除的交接单id列表
	 * @return 0:失败  1:成功
	 */
	public int deleteMultiReceipt(List<Integer> receiptIDList);
	
	/**
	 * 删除交接单
	 * @param receipt 要删除的交接单
	 * @return 0:失败  1:成功
	 */
	public int deleteReceipt(Receipt receipt);
	
	/**
	 * 查找交接单
	 * @param id 交接单id
	 * @param stateID 状态
	 * @param sourceStationID 源站点id
	 * @param destStationID 目的站点id
	 * @return 查找到的交接单列表
	 */
	public List<Receipt> findReceipt(int id,int stateID, int sourceStationID, int destStationID);
	
	/**
	 * 通过id查找交接单
	 * @param id 交接单id
	 * @return Receipt 找到的交接单
	 */
	public Receipt findReceiptByID(int id);
	
	/**
	 * 更新交接单
	 * @param receipt 要更新的交接单
	 * @return 0:失败  1:成功
	 */
	public int updateReceipt(Receipt receipt);
}
