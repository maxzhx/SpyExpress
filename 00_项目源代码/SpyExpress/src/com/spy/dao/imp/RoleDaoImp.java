package com.spy.dao.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.spy.dao.RoleDao;
import com.spy.entity.Role;

@Component("roleDao")
public class RoleDaoImp implements RoleDao{

	@Autowired
	HibernateTemplate hb;
	
	public int addRole(Role role) {
		// TODO Auto-generated method stub
		hb.save(role);
		return 1;
	}

	public int deleteRole(Role role) {
		// TODO Auto-generated method stub
		hb.delete(role);
		return 1;
	}

	public int updateRole(Role role) {
		// TODO Auto-generated method stub
		hb.update(role);
		return 1;
	}

	public Role findRoleByID(int id) {
		// TODO Auto-generated method stub
		return (Role)hb.get(Role.class, id);
	}

	public List<Role> findRoleByHql(String hql) {
		// TODO Auto-generated method stub
		return hb.find(hql);
	}
	
}
