package com.spy.dao;

import java.util.List;

import com.spy.entity.Vehicle;

/**
 *  车辆管理模块
 * @author 郑慧翔
 * 
 */
public interface VehicleDao {
	
	/**
	 * 添加车辆
	 * @param vehicle 表示要添加的车辆
	 * @return 0 :表示添加失败  1:表示添加成功
	 */
	public int addVehicle(Vehicle vehicle);
	
	/**
	 * 删除车辆
	 * @param vehicle 表示要删除的车辆
	 * @return 0 :表示删除失败  1:表示删除成功
	 */
	public int deleteVehicle(Vehicle vehicle);
	
	/**
	 * 通过HQL语句查询车辆
	 * @param hql 用于查询的hql语句
	 * @return stationList:通过hql语句查询到的车辆列表
	 */
	public List<Vehicle> findVehicleByHQL(String hql);
	
	/**
	 * 通过ID查询车辆
	 * @param id 所要查询的车辆id
	 * @return vehicle:通过id查到的车辆
	 */
	public Vehicle findVehicleByID(int id);
	
	/**
	 * 修改车辆
	 * @param vehicle 所要修改的车辆
	 * @return 0:表示修改失败  1:表示修改成功
	 */
	public int updateVehicle(Vehicle vehicle);
	
	/**
	 * 交换车辆的始发地和目的地
	 * @param vehicle 要交换的车辆
	 * @return 0:表示修改失败  1:表示修改成功
	 */
	public int exchangeStation(Vehicle vehicle);
}
