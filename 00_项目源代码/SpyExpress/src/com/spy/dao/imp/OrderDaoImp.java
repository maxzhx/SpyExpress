package com.spy.dao.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.spy.dao.OrderDao;
import com.spy.entity.Order;

@Component("orderDao")
public class OrderDaoImp implements OrderDao{

	
	@Autowired
	HibernateTemplate hb;

	public int addOrder(Order order) {
		hb.save(order);
		// TODO Auto-generated method stub
		return 1;
	}
	public int deleteOrder(Order order) {
		// TODO Auto-generated method stub
		hb.delete(order);
		return 1;
	}
	public List<Order> findOrderByHQL(String hql) {
		// TODO Auto-generated method stub
		return hb.find(hql);
	}
	public Order findOrderByID(int id) {
		// TODO Auto-generated method stub
		return (Order)hb.get(Order.class, id);
	}
	public int updateOrder(Order order) {
		// TODO Auto-generated method stub
		hb.update(order);
		return 1;
	}
	public int getDestID(Order order) {
		// TODO Auto-generated method stub
		String[] stationList;
		String path = order.getPath();
		stationList = path.split("-");
		int stationID = Integer.parseInt(stationList[stationList.length-1]);
		return stationID;
	}
	public int getSourceID(Order order) {
		// TODO Auto-generated method stub
		String[] stationList;
		String path = order.getPath();
		stationList = path.split("-");
		int stationID = Integer.parseInt(stationList[0]);
		return stationID;
	}

}
