package com.spy.service.imp;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spy.dao.OrderDao;
import com.spy.dao.Order_ReceiptDao;
import com.spy.dao.ReceiptDao;
import com.spy.dao.VehicleDao;
import com.spy.entity.Order;
import com.spy.entity.Order_Receipt;
import com.spy.entity.Receipt;
import com.spy.entity.Vehicle;
import com.spy.service.ReceiptService;

@Service("receiptService")
public class ReceiptServiceImp implements ReceiptService{
	
	@Autowired
	ReceiptDao receiptDao;
	@Autowired
	VehicleDao vehicleDao;
	@Autowired
	OrderDao orderDao;
	@Autowired
	Order_ReceiptDao order_ReceiptDao;
	
	public int arriveMultiReceipt(List<Integer> receiptIDList) {
		// TODO Auto-generated method stub
		for (int i = 0; i < receiptIDList.size(); i++) {
			if (arriveReceipt(receiptDao.findReceiptByID(receiptIDList.get(i)))==0) {
				return 0;
			}
		}
		return 1;
	}

	public int arriveReceipt(Receipt receipt) {
		// TODO Auto-generated method stub
		List<Vehicle> vehicleList=vehicleDao.findVehicleByHQL("from Vehicle where status=2 and receipt='"+
		receipt.getId()+"'");
		List<Order_Receipt> order_ReceiptList=order_ReceiptDao.findOrder_ReceiptByHQL("from Order_Receipt where receipt='"+
		receipt.getId()+"'");
		List<Order> orderList=order_ReceiptDao.findOrderByReceiptIdAndStatus(receipt.getId(), 1);
		
		for (int i = 0; i < vehicleList.size(); i++) {//交换车辆起始站点目的站点，并将其状态置为空闲
			Vehicle vehicle=vehicleList.get(i);
			vehicle.setReceipt(null);
			vehicleDao.exchangeStation(vehicle);
			vehicle.setStatus(1);
			vehicleDao.updateVehicle(vehicle);
		}
		
		for (int i = 0; i < orderList.size(); i++) {
			Order order=orderList.get(i);
//			System.out.println(receipt.getStationByDestStaId().getName());
//			System.out.println(orderList.size());
			order.setStation(receipt.getStationByDestStaId());//改变订单目前站点为交接单的目的站点
			if (orderDao.getDestID(order)==receipt.getStationByDestStaId().getId()) {//若订单已到达最终目的地 则改变其状态为已到达
				order.setStatus(4);
				order.setRecvTime(new Date());
			}
			orderDao.updateOrder(order);
		}
		
		for (int i = 0; i < order_ReceiptList.size(); i++) {//订单-交接单表中的状态更改
			Order_Receipt order_Receipt=order_ReceiptList.get(i);
			order_Receipt.setStatus(2);
			order_ReceiptDao.updateOrder_Receipt(order_Receipt);
		}
		receipt.setStatus(2);
		receipt.setRecvTime(new Date());
		updateReceipt(receipt);
		return 1;
	}

	public int createReceipt(Receipt receipt, List<Integer> orderIDList,
			List<Integer> vehicleIDList) {
		// TODO Auto-generated method stub
		double weight=0,volume=0,price=0;
		receipt.setWeight(weight);
		receipt.setVolume(volume);
		receipt.setIncome(price);
		receipt.setSendTime(new Date());
		receiptDao.addReceipt(receipt);
		for (int i = 0; i < orderIDList.size(); i++) {//改变订单状态为在途
			Order order=orderDao.findOrderByID(orderIDList.get(i));
			order.setStatus(3);
			if (order.getSendTime()==null) {
				order.setSendTime(new Date());
			}
			orderDao.updateOrder(order);
			Order_Receipt order_Receipt=new Order_Receipt();//创建新的订单-交接单项
			order_Receipt.setOrder(order);
			order_Receipt.setReceipt(receipt);
			order_Receipt.setStatus(1);
			order_ReceiptDao.addOrder_Receipt(order_Receipt);
			weight+=order.getWeight();
			volume+=order.getVolume();
			price+=order.getPrice();
		}
		for (int i = 0; i < vehicleIDList.size(); i++) {//改变车辆交接单为当前交接单 改变状态为途中
			Vehicle vehicle=vehicleDao.findVehicleByID(vehicleIDList.get(i));
			vehicle.setReceipt(receipt);
			vehicle.setStatus(2);
			vehicleDao.updateVehicle(vehicle);
		}
		receipt.setWeight(weight);
		receipt.setVolume(volume);
		receipt.setIncome(price);
		receiptDao.updateReceipt(receipt);
		return 1;
	}
	
	public int deleteMultiReceipt(List<Integer> receiptIDList) {
		// TODO Auto-generated method stub
		for (int i = 0; i < receiptIDList.size(); i++) {
			if (deleteReceipt(receiptDao.findReceiptByID(receiptIDList.get(i)))==0) {
				return 0; 
			}
		}
		return 1;
	}

	public int deleteReceipt(Receipt receipt) {
		// TODO Auto-generated method stub
		return receiptDao.deleteReceipt(receipt);
	}
	
	public List<Receipt> findReceipt(int id, int stateID, int sourceStationID, int destStationID) {
		// TODO Auto-generated method stub
		String idString="",stateString="",sourceString="",destString="";
		int firstFlag=1;
		if (id!=0) {
			idString=" where id="+id;firstFlag--;
		}
		if (stateID!=0) {
			if (firstFlag==1) {
				stateString=" where status="+stateID;firstFlag--;firstFlag--;
			}else {
				stateString=" and status="+stateID;
			}
		}
		if (sourceStationID!=0) {
			if (firstFlag==1) {
				sourceString=" where stationBySourceStaId='"+sourceStationID+"'";firstFlag--;
			}else {
				sourceString=" and stationBySourceStaId='"+sourceStationID+"'";
			}
		}
		if (destStationID!=0) {
			if (firstFlag==1) {
				destString=" where stationByDestStaId='"+destStationID+"'";
			}
			else {
				destString=" and stationByDestStaId='"+destStationID+"'";
			}
		}
		System.out.println(idString);
		System.out.println(stateString);
		System.out.println(sourceString);
		System.out.println(destString);
		return receiptDao.findReceiptByHQL("from Receipt"+idString+stateString+sourceString+destString);
	}
	
	public Receipt findReceiptByID(int id) {
		// TODO Auto-generated method stub
		return receiptDao.findReceiptByID(id);
	}

	public int updateReceipt(Receipt receipt) {
		// TODO Auto-generated method stub
		return receiptDao.updateReceipt(receipt);
	}





}
