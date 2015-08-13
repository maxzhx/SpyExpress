package com.spy.dao;

import java.util.List;

import com.spy.entity.Scope;
import com.spy.entity.Station;

/**
 * 站点管理模块的DAO
 * @author 郑启荣
 *
 */
public interface StationDao {
	
	/**
	 * 增加配送点
	 * @param station 要增加的配送点
	 * @return 0：表示增加失败 1：表示增加成功
	 */
	public int addStation(Station station);
	
	/**
	 * 删除配送点
	 * @param station 要删除的配送点
	 * @return 0：表示删除失败 1：表示删除成功
	 */
	public int deleteStation(Station station);
	
	
	/**
	 * 通过HQL语句查找配送点
	 * @param hql 查询使用的HQL语句
	 * @return 查找到的站点的列表
	 */
	public List<Station> findStationByHQL(String hql);
	
	
	/**
	 * 通过站点的ID查找配送点
	 * @param id 要查找站点的ID
	 * @return 查找到的站点
	 */
	public Station findStationByID(int id);
	
	/**
	 * 更新配送点
	 * @param station 要更新的配送点
	 * @return 0：表示更新失败 1：表示更新成功
	 */
	public int updateStation(Station station);
	
	/**
	 * 通过站点的ID查找站点的配送范围
	 * @param stationID 站点的ID 
	 * @return 查找到的配送范围的列表
	 */
	public List<Scope> findScope(int stationID);
	
	/**
	 * 更新配送范围
	 * @param scope 要更新的配送范围
	 * @return 0：表示更新失败 1：表示更新成功
	 */
	public int updateScope(Scope scope);
	
	/**
	 * 增加配送范围
	 * @param scope 要增加的配送范围
	 * @return 0：表示增加失败 1：表示增加成功
	 */
	public int addScope(Scope scope);
	

	/**
	 * 删除配送范围
	 * @param scope 要删除的配送范围
	 * @return 0：表示删除失败 1：表示删除成功
	 */
	public int deleteScope(Scope scope);
	
	/**
	 * 通过HQL查找配送范围
	 * @param hql hql语句
	 * @return 查找到的配送范围
	 */
	public List<Scope> findScopeByHQL(String hql);
	
	/**
	 * 通过ID查找配送范围
	 * @param scopeID 配送范围的ID
	 * @return 查找到的配送范围
	 */
	public Scope findScopeByID(int scopeID);
	
}
