package com.spy.dao;

import java.util.List;

import com.spy.entity.Role;

/**
 *  角色管理
 * @author 郑慧翔
 * 
 */
public interface RoleDao {
	
	/**
	 * 添加角色
	 * @param role 添加的角色
	 * @return 0:添加失败 1:添加成功
	 */
	public int addRole(Role role);
	
	/**
	 * 删除角色
	 * @param role 要删除的角色
	 * @return 0:删除失败 1:删除成功
	 */
	public int deleteRole(Role role);
	
	/**
	 * 更新角色
	 * @param role 要更新的角色
	 * @return 0:更新失败 1:更新成功
	 */
	public int updateRole(Role role);
	
	/**
	 * 通过id查找角色
	 * @param id 要查找的id
	 * @return 查找到的角色
	 */
	public Role findRoleByID(int id);
	
	/**
	 * 通过hql语句查找角色
	 * @param hql hql语句
	 * @return 查找到的角色列表
	 */
	public List<Role> findRoleByHql(String hql);
	
}
