package com.spy.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spy.dao.RoleDao;
import com.spy.entity.Role;
import com.spy.service.RoleService;

@Service("roleService")
public class RoleServiceImp implements RoleService{
	@Autowired
	RoleDao roleDao;
	
	public int addRole(Role role) {
		// TODO Auto-generated method stub
		return roleDao.addRole(role);
	}

	public int deleteRole(Role role) {
		// TODO Auto-generated method stub
		return roleDao.deleteRole(role);
	}

	public int updateRole(Role role) {
		// TODO Auto-generated method stub
		return roleDao.updateRole(role);
	}

	public Role findRoleByID(int id) {
		// TODO Auto-generated method stub
		return roleDao.findRoleByID(id);
	}

	public List<Role> findAllRole() {
		// TODO Auto-generated method stub
		return roleDao.findRoleByHql("from Role");
	}

	public int deleteMultiRole(List<Integer> roleIDList) {
		// TODO Auto-generated method stub
		for (int i = 0; i < roleIDList.size(); i++) {
			if (deleteRole(roleDao.findRoleByID(roleIDList.get(i)))==0) {
				return 0;
			}
		}
		return 1;
	}

	public List<Role> searchRole(String roleName) {
		// TODO Auto-generated method stub
		String nameString="";
		if (!roleName.equals("")) {
			nameString=" where name='"+roleName+"'";
		}
		return roleDao.findRoleByHql("from Role"+nameString);
	}

}
