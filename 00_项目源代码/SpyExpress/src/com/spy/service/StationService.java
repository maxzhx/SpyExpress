package com.spy.service;

import java.util.List;

import com.spy.entity.Scope;
import com.spy.entity.Station;

/**
 * 站点管理的service层
 * @author 郑启荣
 *
 */
public interface StationService {
	
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
	 * 查找所有的配送点
	 * @return 查找到的配送点
	 */
	public List<Station> findAllStation();
	
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
	 * 更新配送范围
	 * @param scope 要更新的配送范围
	 * @return 0：表示更新失败 1：表示更新成功
	 */
	public int updateScope(Scope scope);
	
	/**
	 * 添加配送范围
	 * @param scope 要添加的配送范围
	 * @return 0：表示添加失败 1：表示添加成功
	 */
	public int addScope(Scope scope);
	
	/**
	 * 删除配送范围
	 * @param scope 要删除的配送范围
	 * @return 0：表示删除失败 1：表示删除成功
	 */
	public int deleteScope(Scope scope);
	
	/**
	 * 查找所有的配送范围
	 * @return 查找到的配送点
	 */
	public List<Scope> findAllScope();
	
	/**
	 * 通过ID查找配送范围
	 * @param scopeID 配送范围的ID
	 * @return 查找到的配送范围
	 */
	public Scope findScopeByID(int scopeID);

	/**
	 * 删除一组站点
	 * @param stationIDList 要删除站点ID的列表
	 * @return 0：表示删除失败  1：表示删除成功
	 */
	public int deleteMultiStation(List<Integer> stationIDList);
	
	/**
	 * 通过源站点查找配送范围
	 * @param sourceID 源站点的ID
	 * @return 查找到的配送范围的列表
	 */
	public List<Scope> findScopeBySourceID(int sourceID);
	
	/**
	 * 通过目的站点查找配送范围
	 * @param sourceID 目的站点的ID
	 * @return 查找到的配送范围的列表
	 */
	public List<Scope> findScopeByDestID(int DestID);
	
	/**
	 * 删除一组配送范围
	 * @param scopeListID 要删除的配送范围的ID的列表
	 * @return 0:表示删除失败 1：表示删除成功
	 */
	public int deleteMultiSocpe(List<Integer> scopeListID);
	
	/**
	 * 通过HQL查找配送范围
	 * @param hql hql语句
	 * @return 查找到的配送范围
	 */
	public List<Scope> findScopeByHQL(String hql);
	
	/**
	 * 通过源站点和目的站点查找配送范围
	 * @param sourceID 源站点的ID
	 * @param destID 目的站点的ID
	 * @return 查找到的配送范围
	 */
	public Scope findScopeBySourceAndDest(int sourceID,int destID);
}
