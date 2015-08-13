package com.spy.dao.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.spy.dao.StationDao;
import com.spy.entity.Scope;
import com.spy.entity.Station;

@Component("stationDao")
public class StationDaoImp implements StationDao{

	@Autowired
	HibernateTemplate hb;
	
	public int addStation(Station station) {
		// TODO Auto-generated method stub
		hb.save(station);
		return 1;
	}

	public int deleteStation(Station station) {
		// TODO Auto-generated method stub
		hb.delete(station);
		return 1;
	}

	public List<Station> findStationByHQL(String hql) {
		// TODO Auto-generated method stub
		return hb.find(hql);
	}

	public Station findStationByID(int id) {
		// TODO Auto-generated method stub
		return (Station) hb.get(Station.class, id);
	}

	public int updateStation(Station station) {
		// TODO Auto-generated method stub
		hb.update(station);
		return 1;
	}

	public List<Scope> findScope(int stationID) {
		// TODO Auto-generated method stub
		String hql = "from Scope where stationBySourceStaId = '"+stationID+"'";
		return hb.find(hql);
	}

	public int updateScope(Scope scope) {
		// TODO Auto-generated method stub
		hb.update(scope);
		return 0;
	}

	public int addScope(Scope scope) {
		// TODO Auto-generated method stub
		hb.save(scope);
		return 0;
	}

	public int deleteScope(Scope scope) {
		// TODO Auto-generated method stub
		hb.delete(scope);
		return 0;
	}

	public List<Scope> findScopeByHQL(String hql) {
		// TODO Auto-generated method stub
		return hb.find(hql);
	}

	public Scope findScopeByID(int scopeID) {
		// TODO Auto-generated method stub
		return (Scope) hb.get(Scope.class, scopeID);
	}

}
