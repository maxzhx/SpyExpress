package com.spy.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.mapping.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spy.dao.StationDao;
import com.spy.entity.Scope;
import com.spy.entity.Station;
import com.spy.service.StationService;

@Service("stationService")
public class StationServiceImp implements StationService{

	@Autowired
	StationDao stationDao;
	public int addStation(Station station) {
		// TODO Auto-generated method stub
		stationDao.addStation(station);
		return 1;
	}

	public int deleteStation(Station station) {
		// TODO Auto-generated method stub
		stationDao.deleteStation(station);
		return 1;
	}

	public List<Station> findAllStation() {
		// TODO Auto-generated method stub
		return stationDao.findStationByHQL("from Station where id > 0");
	}

	public Station findStationByID(int id) {
		// TODO Auto-generated method stub
		return stationDao.findStationByID(id);
	}

	public int updateStation(Station station) {
		// TODO Auto-generated method stub
		stationDao.updateStation(station);
		return 1;
	}


	public int addScope(Scope scope) {
		// TODO Auto-generated method stub
		stationDao.addScope(scope);
		return 1;
	}

	public int deleteScope(Scope scope) {
		// TODO Auto-generated method stub
		stationDao.deleteScope(scope);
		return 1;
	}

	public int updateScope(Scope scope) {
		// TODO Auto-generated method stub
		stationDao.updateScope(scope);
		return 1;
	}

	public List<Scope> findAllScope() {
		// TODO Auto-generated method stub
		return stationDao.findScopeByHQL("from Scope");
	}

	public Scope findScopeByID(int scopeID) {
		// TODO Auto-generated method stub
		return stationDao.findScopeByID(scopeID);
	}

	public int deleteMultiStation(List<Integer> stationIDList) {
		// TODO Auto-generated method stub
		Station station = new Station();
		for(int i=0;i<stationIDList.size();i++)
		{
			station = stationDao.findStationByID(stationIDList.get(i));
			stationDao.deleteStation(station);
		}
		return 1;
	}

	public List<Scope> findScopeByDestID(int DestID) {
		// TODO Auto-generated method stub
		String hql = "from Scope where stationByDestStaId = "+DestID+"";
		return stationDao.findScopeByHQL(hql);
	}

	public List<Scope> findScopeBySourceID(int sourceID) {
		// TODO Auto-generated method stub
		String hql = "from Scope where stationBySourceStaId = "+sourceID+"";
		return stationDao.findScopeByHQL(hql);
	}

	public int deleteMultiSocpe(List<Integer> scopeListID) {
		// TODO Auto-generated method  stub
		Scope scope = new Scope();
		for(int i=0;i<scopeListID.size();i++)
		{
			scope = stationDao.findScopeByID(scopeListID.get(i));
			stationDao.deleteScope(scope);
		}
		return 1;
	}

	public List<Scope> findScopeByHQL(String hql) {
		// TODO Auto-generated method stub
		return stationDao.findScopeByHQL(hql);
	}

	public Scope findScopeBySourceAndDest(int sourceID, int destID) {
		// TODO Auto-generated method stub
		String hql = "from Scope where stationBySourceStaId = "+sourceID+" and stationByDestStaId = "+destID+"";
		List<Scope> scopes = new ArrayList<Scope>();
		scopes = stationDao.findScopeByHQL(hql);
		if(scopes.size()==0)
			return null;
		else {
			return scopes.get(0);
		}
	}
	
	

}
