package com.spy.dao.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.spy.dao.VehicleDao;
import com.spy.entity.Station;
import com.spy.entity.Vehicle;

@Component("vehicleDao")
public class VehicleDaoImp implements VehicleDao{
	
	@Autowired
	HibernateTemplate hb;
	
	public int addVehicle(Vehicle vehicle) {
		// TODO Auto-generated method stub
		hb.save(vehicle);
		return 1;
	}

	public int deleteVehicle(Vehicle vehicle) {
		// TODO Auto-generated method stub
		hb.delete(vehicle);
		return 1;
	}

	public List<Vehicle> findVehicleByHQL(String hql) {
		// TODO Auto-generated method stub
		return hb.find(hql);
	}

	public Vehicle findVehicleByID(int id) {
		// TODO Auto-generated method stub
		return (Vehicle) hb.get(Vehicle.class, id);
	}

	public int updateVehicle(Vehicle vehicle) {
		// TODO Auto-generated method stub
		hb.update(vehicle);
		return 1;
	}

	public int exchangeStation(Vehicle vehicle) {
		// TODO Auto-generated method stub
		Station station=vehicle.getStationByDestId();
		vehicle.setStationByDestId(vehicle.getStationBySourceId());
		vehicle.setStationBySourceId(station);
		updateVehicle(vehicle);
		return 1;
	}

}
