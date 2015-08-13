package com.spy.service;

import java.util.List;

import com.spy.entity.Role;

/**
 * 角色管理服务层
 * @author 郑慧翔
 *
 */
public interface RoleService {
	/**
	 * 增加角色
	 * @param role 要加的角色
	 * @return 0:失败  1:成功
	 */
	public int addRole(Role role);
	
	/**
	 * 删除多个角色
	 * @param roleIDList 角色id列表
	 * @return 0:失败  1:成功
	 */
	public int deleteMultiRole(List<Integer> roleIDList);
	
	/**
	 * 删除角色
	 * @param role 要删除的角色
	 * @return 0:失败  1:成功
	 */
	public int deleteRole(Role role);
	
	/**
	 * 更新角色
	 * @param role 要更新的角色
	 * @return 0:失败  1:成功
	 */
	public int updateRole(Role role);
	
	/**
	 * 通过id查找角色
	 * @param id 要查找的id
	 * @return 找到的角色
	 */
	public Role findRoleByID(int id);
	
	/**
	 * 查找所有角色
	 * @return 所有角色列表
	 */
	public List<Role> findAllRole();
	
	/**
	 * 搜索角色
	 * @param roleName 角色名
	 * @return 找到的角色列表
	 */
	public List<Role> searchRole(String roleName);
}
