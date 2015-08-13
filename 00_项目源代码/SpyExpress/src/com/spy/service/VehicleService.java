package com.spy.service;

import java.util.List;

import com.spy.entity.Vehicle;

/**
 *  车辆管理服务层
 * @author 郑慧翔
 * 
 */
public interface VehicleService {
	
	/**
	 * 增加车辆
	 * @param vehicle 要增加的车辆
	 * @return 0:失败  1:成功
	 */
	public int addVehicle(Vehicle vehicle);
	
	/**
	 * 删除多个车辆
	 * @param vehicleIDList 要删除的车辆id列表
	 * @return 0:失败  1:成功
	 */
	public int deleteMultiVehicle(List<Integer> vehicleIDList);
	
	/**
	 * 删除车辆
	 * @param vehicle 要删除的车辆
	 * @return 0:失败  1:成功
	 */
	public int deleteVehicle(Vehicle vehicle);
	
	/**
	 * 查找所有车辆
	 * @return vehicleList:所有的车辆列表
	 */
	public List<Vehicle> findAllVehicle();
	
	/**
	 * 通过id查找车辆
	 * @param id 要查找的id
	 * @return vehicle:查找到的车辆
	 */
	public Vehicle findVehicleByID(int id);

	/**
	 * 更新车辆
	 * @param vehicle 要更新的车辆
	 * @return 0:失败  1:成功
	 */
	public int updateVehicle(Vehicle vehicle);
	
	/**
	 * 查找车辆
	 * @param id 车辆id
	 * @param license 车牌
	 * @param stateID 状态
	 * @param sourceStationID 源站点id
	 * @param destStationID 目的站点id
	 * @param receiptID 交接单号
	 * @return 查找到的车辆列表
	 */
	public List<Vehicle> findVehicle(int id, String license, int stateID,
			int sourceStationID, int destStationID, int receiptID);
	
	/**
	 * 查找可用车辆
	 * @param sourceStationID 源站点id
	 * @param destStationID 目的站点id
	 * @return 找到的车辆列表
	 */
	public List<Vehicle> findAvailableVehicle(int sourceStationID,int destStationID);
	
	/**
	 * 
	 * @param destStationID
	 * @return �����б�
	 */
	public List<Vehicle> findComingVehicle(int destStationID);
	
	/**
	 * 调度车辆,使空闲的车辆开往路线上的另一站点
	 * @param vehicle 要调度的车辆
	 * @return 0:失败  1:成功
	 */
	public int dispatchVehicle(Vehicle vehicle);
	
	/**
	 * 调度多辆车
	 * @param vehicleIDList 车辆id列表
	 * @return 0:失败  1:成功
	 */
	public int dispatchMultiVehicle(List<Integer> vehicleIDList);
	
	/**
	 * 确认车辆到达
	 * @param vehicle 要确认的车辆
	 * @return 0:失败  1:成功
	 */
	public int arriveVehicle(Vehicle vehicle);
	
	/**
	 * 确认多个车辆到达
	 * @param vehicleIDList 车辆id列表
	 * @return 0:失败  1:成功
	 */
	public int arriveMultiVehicle(List<Integer> vehicleIDList);	

}
