package com.spy.dao.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.spy.dao.ScopeDao;
import com.spy.entity.Scope;

@Component("scopeDao")
public class ScopeDaoImp implements ScopeDao{

	@Autowired
	HibernateTemplate hb;
	public int addScope(Scope scope) {
		// TODO Auto-generated method stub
		hb.save(scope);
		return 1;
	}

	public int deleteScope(Scope scope) {
		// TODO Auto-generated method stub
		hb.delete(scope);
		return 1;
	}

	public Scope findScopeByID(int scopeID) {
		// TODO Auto-generated method stub
		return (Scope) hb.get(Scope.class, scopeID);
	}

	public List<Scope> findStationByHQL(String hql) {
		// TODO Auto-generated method stub
		return hb.find(hql);
	}

	public int updateScope(Scope scope) {
		// TODO Auto-generated method stub
		hb.update(scope);
		return 1;
	}

}
