package com.spy.dao.imp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.spy.dao.Order_ReceiptDao;
import com.spy.entity.Order;
import com.spy.entity.Order_Receipt;
import com.spy.entity.Receipt;

@Component("order_ReceiptDao")
public class Order_ReceiptDaoImp implements Order_ReceiptDao{

	@Autowired
	HibernateTemplate hb;
	
	public int addOrder_Receipt(Order_Receipt orderReceipt) {
		// TODO Auto-generated method stub
		hb.save(orderReceipt);
		return 0;
	}

	public List<Order> findOrderByReceiptIdAndStatus(int ReceiptID, int status) {
		// TODO Auto-generated method stub
		String hql = "from Order_Receipt where receipt='"+ReceiptID+"' and status='"+status+"'";
		List<Order_Receipt> orderReceipts =  hb.find(hql);
		List<Order> orders = new ArrayList<Order>();
		for(int i=0;i<orderReceipts.size();i++)
		{
			orders.add(orderReceipts.get(i).getOrder());
		}
		return orders;
	}


	public List<Receipt> findReceiptByOrderIdAndStatus(int OrderID, int status) {
		// TODO Auto-generated method stub
		String hql = "from Order_Receipt where order='"+OrderID+"' and status='"+status+"'";
		List<Order_Receipt> orderReceipts =  hb.find(hql);
//		System.out.println(hql);
		List<Receipt> receipts = new ArrayList<Receipt>();
		for(int i=0;i<orderReceipts.size();i++)
		{
			receipts.add(orderReceipts.get(i).getReceipt());
		}
		return receipts;
	}
	
	public List<Order_Receipt> findOrder_ReceiptByHQL(String hql){
		// TODO Auto-generated method stub
		return hb.find(hql);
	}

	public int updateOrder_Receipt(Order_Receipt order_Receipt) {
		// TODO Auto-generated method stub
		hb.update(order_Receipt);
		return 1;
	}


}
