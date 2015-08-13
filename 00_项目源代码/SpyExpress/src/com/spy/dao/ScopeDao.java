package com.spy.dao;

import java.util.List;

import com.spy.entity.Scope;

/**
 * 配送范围管理的DAO
 * @author 郑启荣
 *
 */
public interface ScopeDao {
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
	 * 更新配送范围
	 * @param scope 要更新的配送范围
	 * @return 0：表示更新失败 1：表示更新成功
	 */
	public int updateScope(Scope scope);
	
	/**
	 * 通过ID查找配送范围
	 * @param scopeID 配送范围的ID
	 * @return 查找到的配送范围
	 */
	public Scope findScopeByID(int scopeID);
	
	/**
	 * 通过HQL查找配送范围
	 * @param hql hql语句
	 * @return 查找到的配送范围
	 */
	public List<Scope> findStationByHQL(String hql);
}
