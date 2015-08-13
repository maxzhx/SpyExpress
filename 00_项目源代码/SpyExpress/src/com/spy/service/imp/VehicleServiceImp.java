package com.spy.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spy.dao.VehicleDao;
import com.spy.entity.Station;
import com.spy.entity.Vehicle;
import com.spy.service.VehicleService;

@Service("vehicleService")
public class VehicleServiceImp implements VehicleService{
	
	@Autowired
	VehicleDao vehicleDao;
	
	public int addVehicle(Vehicle vehicle) {
		// TODO Auto-generated method stub
		return vehicleDao.addVehicle(vehicle);
	}

	public int deleteMultiVehicle(List<Integer> vehicleIDList) {
		// TODO Auto-generated method stub
		for (int i = 0; i < vehicleIDList.size(); i++) {
			if (deleteVehicle(vehicleDao.findVehicleByID(vehicleIDList.get(i)))==0) {
				return 0;
			}
		}
		return 1;
	}

	public int deleteVehicle(Vehicle vehicle) {
		// TODO Auto-generated method stub
		return vehicleDao.deleteVehicle(vehicle);
	}

	public List<Vehicle> findAllVehicle() {
		// TODO Auto-generated method stub
		return vehicleDao.findVehicleByHQL("from Vehicle");
	}

	public Vehicle findVehicleByID(int id) {
		// TODO Auto-generated method stub
		return vehicleDao.findVehicleByID(id);
	}

	public int updateVehicle(Vehicle vehicle) {
		// TODO Auto-generated method stub
		return vehicleDao.updateVehicle(vehicle);
	}

	public List<Vehicle> findVehicle(int id, String license, int stateID,
			int sourceStationID, int destStationID, int receiptID) {
		// TODO Auto-generated method stub
		String idString="",licensesString="",stateString="",
				sourceString="",destString="",receiptString="";
		int firstFlag=1;
		if (id!=0) {
			idString=" where id="+id;firstFlag--;
		}
		if (!license.equals("")) {
			if (firstFlag==1) {
				licensesString=" where license='"+license+"'";firstFlag--;
			}else {
				licensesString=" and license='"+license+"'";
			}
		}
		if (stateID!=0) {
			if (firstFlag==1) {
				stateString=" where status='"+stateID+"'";firstFlag--;
			}else {
				stateString=" and status='"+stateID+"'";
			}
		}
		if (sourceStationID!=0) {
			if (firstFlag==1) {
				sourceString=" where stationBySourceId='"+sourceStationID+"'";firstFlag--;
			}else {
				sourceString=" and stationBySourceId='"+sourceStationID+"'";
			}
		}
		if (destStationID!=0) {
			if (firstFlag==1) {
				destString=" where stationByDestId='"+destStationID+"'";firstFlag--;
			}else {
				destString=" and stationByDestId='"+destStationID+"'";
			}
		}
		if (receiptID!=0) {
			if (firstFlag==1) {
				receiptString=" where receipt='"+receiptID+"'";
			}else {
				receiptString=" and receipt='"+receiptID+"'";
			}
		}
		System.out.println(idString);
		System.out.println(licensesString);
		System.out.println(stateString);
		System.out.println(sourceString);
		System.out.println(destString);
		System.out.println(receiptString);
		return vehicleDao.findVehicleByHQL("from Vehicle"+idString+licensesString
				+stateString+sourceString+destString+receiptString);
	}

	public List<Vehicle> findAvailableVehicle(int sourceStationID,
			int destStationID) {
		// TODO Auto-generated method stub
		return vehicleDao.findVehicleByHQL("from Vehicle where stationByDestId='"+destStationID+
				"' and stationBySourceId='"+sourceStationID+"' and status=1");
	}

	public int dispatchVehicle(Vehicle vehicle) {
		// TODO Auto-generated method stub
		if (vehicle.getStatus()!=1) {//�����״̬��Ϊ����,����
			return 0;
		}
		vehicle.setStatus(3);//������״̬��Ϊ����
		updateVehicle(vehicle);
		return 1;
	}

	public int dispatchMultiVehicle(List<Integer> vehicleIDList) {
		// TODO Auto-generated method stub
		for (int i = 0; i < vehicleIDList.size(); i++) {
			if (dispatchVehicle(vehicleDao.findVehicleByID(vehicleIDList.get(i)))==0) {
				return 0;
			}
		}
		return 1;
	}

	public int arriveVehicle(Vehicle vehicle) {
		// TODO Auto-generated method stub
		if (vehicle.getStatus()!=3) {//�����Ϊ����,����
			return 0;
		}
		vehicleDao.exchangeStation(vehicle);
		vehicle.setStatus(1);//������״̬��Ϊ����
		updateVehicle(vehicle);
		return 1;
	}

	public int arriveMultiVehicle(List<Integer> vehicleIDList) {
		// TODO Auto-generated method stub
		for (int i = 0; i < vehicleIDList.size(); i++) {
			if (arriveVehicle(vehicleDao.findVehicleByID(vehicleIDList.get(i)))==0)return 0;
		}
		return 1;
	}

	public List<Vehicle> findComingVehicle(int destStationID) {
		// TODO Auto-generated method stub
		return vehicleDao.findVehicleByHQL("from Vehicle where status=3 and stationByDestId='"+
				destStationID+"'");
	}

}
