package com.spy.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.spy.dao.OrderDao;
import com.spy.dao.Order_ReceiptDao;
import com.spy.dao.ReceiptDao;
import com.spy.entity.Order;
import com.spy.entity.Receipt;
import com.spy.service.OrderService;

/**
 * ��������ģ��ķ����
 * @author ֣����
 *
 */
@Service("orderService")
public class OrderServiceImp implements OrderService{

	
	@Autowired
	OrderDao orderDao;
	@Autowired
	ReceiptDao receiptDao;
	@Autowired
	Order_ReceiptDao orderReceiptDao;
	@Autowired
	HibernateTemplate hb;
	public int addOrder(Order order) {
		// TODO Auto-generated method stub
		orderDao.addOrder(order);
		return 0;
	}

	public int arriveMultiOrder(List<Integer> idList) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int arriveOrder(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int confirmMultiOrder(List<Integer> idList) {
		// TODO Auto-generated method stub
		Order order;
		for(int i = 0 ;i < idList.size();i++)
		{
			order = orderDao.findOrderByID(idList.get(i));
			order.setStatus(2);
			orderDao.updateOrder(order);
		}
		return 1;
	}

	public int confirmOrder(int id) {
		// TODO Auto-generated method stub
		Order order;
		order = orderDao.findOrderByID(id);
		order.setStatus(2);
		orderDao.updateOrder(order);
		return 1;
	}

	public int deleteMultiOder(List<Integer> idList) {
		// TODO Auto-generated method stub
		Order order;
		for(int i = 0 ;i < idList.size();i++)
		{
			order = orderDao.findOrderByID(idList.get(i));
			orderDao.deleteOrder(order);
		}
		return 1;
	}

	public int deleteOrder(int id) {
		// TODO Auto-generated method stub
		Order order;
		order = orderDao.findOrderByID(id);
		orderDao.deleteOrder(order);
		return 1;
	}

	public List<Order> findOrder(int stateID, int stationID) {
		// TODO Auto-generated method stub
		String hql = null;
		if(stateID!=0){
			if(stationID!=0){
				hql = "from Order where station = '"+stationID+"' and status = '"+stateID+"'";
			}
			else {
				hql = "from Order where status = '"+stateID+"'";
			}
		}
		else {
			if(stationID!=0){
				hql = "from Order where station = '"+stationID+"'";
			}
			else {
				hql = "from Order";
			}
		}
		return orderDao.findOrderByHQL(hql);
	}

	public Order findOrderByID(int id) {
		// TODO Auto-generated method stub
		return orderDao.findOrderByID(id);
	}

	public List<Order> findOrderBySender(int senderID) {
		// TODO Auto-generated method stub
		String hql = "from Order where customer = '"+senderID+"'";
		return orderDao.findOrderByHQL(hql);
	}

	public int receiveMultiOrder(List<Integer> idList) {
		// TODO Auto-generated method stub
		Order order;
		for(int i = 0 ;i < idList.size();i++)
		{
			order = orderDao.findOrderByID(idList.get(i));
			order.setStatus(5);
			orderDao.updateOrder(order);
		}
		return 1;
	}

	public int receiveOrder(int id) {
		// TODO Auto-generated method stub
		Order order;
		order = orderDao.findOrderByID(id);
		order.setStatus(5);
		orderDao.updateOrder(order);
		return 1;
	}

	public int updateOrder(Order order) {
		// TODO Auto-generated method stub
		orderDao.updateOrder(order);
		return 0;
	}

	public int getDestID(Order order) {
		// TODO Auto-generated method stub
		return orderDao.getDestID(order);
	}

	public int getSourceID(Order order) {
		// TODO Auto-generated method stub
		return orderDao.getSourceID(order);
	}

	public List<Order> getOrderFromSendStation(int stationID) {
		// TODO Auto-generated method stub
		String ststionId = String.valueOf(stationID);
		Session session = hb.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(Order.class);
		Criterion cno =  Restrictions.like("path",ststionId+"%");
		//System.out.println();
		criteria.add(cno);
		session.close();
		return criteria.list();
	}

	
	public List<Order> getNextStationID(int nowstationID, int nextstationID) {
		// TODO Auto-generated method stub
		String nowststionId = String.valueOf(nowstationID);
		String nextstationId = String.valueOf(nextstationID);
		Session session = hb.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(Order.class);
		//Criterion cno =  Restrictions.like("path","%-"+nowststionId+"-"+nextstationId+"%");
		//Criterion cno4 = Restrictions.eq("station", nowstationID);
		//Criterion cno5 = Restrictions.and(cno, cno4);
		String hql = "from Order where path like '%-"+nowststionId+"-"+nextstationId+"%' and station = "+nowstationID+"";
		//System.out.println();
		//criteria.add(cno5);
		List<Order> orders = new ArrayList<Order>();
		List<Order> orderList = orderDao.findOrderByHQL(hql);
		for (int i = 0; i < orderList.size(); i++) {
			if(orderReceiptDao.findReceiptByOrderIdAndStatus(orderList.get(i).getId(), 1).size()==0){
				orders.add(orderList.get(i));
			}
		}
		Criterion cno1 =  Restrictions.like("path",nowststionId+"-"+nextstationId+"%");
		Criterion cno2 = Restrictions.eq("status", 2);
		Criterion  cno3 =  Restrictions.and(cno1, cno2);
		Criteria criteria1 = session.createCriteria(Order.class);
		criteria1.add(cno3);
		orders.addAll(criteria1.list());
		session.close();
		return orders;
	}

	public List<Order> findOrderByHQL(String hql) {
		// TODO Auto-generated method stub
		return orderDao.findOrderByHQL(hql);
	}

	public List<Order> findOrderByNowStationAndFirstStation(int nowstation,int firststation) {
		// TODO Auto-generated method stub
		Session session = hb.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(Order.class);
		Criterion cno =  Restrictions.like("path",firststation+"%");
		Criterion cno1 = Restrictions.le("station", nowstation);
		Criterion cno2 = Restrictions.or(cno, cno1);
		criteria.add(cno2);
		session.close();
		return criteria.list();
	}

}
