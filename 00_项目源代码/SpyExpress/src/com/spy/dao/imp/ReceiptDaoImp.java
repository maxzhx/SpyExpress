package com.spy.dao.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.spy.dao.ReceiptDao;
import com.spy.entity.Receipt;

@Component("receiptDao")
public class ReceiptDaoImp implements ReceiptDao{

	@Autowired
	HibernateTemplate hb;
	public int addReceipt(Receipt receipt) {
		// TODO Auto-generated method stub
		hb.save(receipt);
		return 1;
	}

	public int deleteReceipt(Receipt receipt) {
		// TODO Auto-generated method stub
		hb.delete(receipt);
		return 1;
	}

	public List<Receipt> findReceiptByHQL(String hql) {
		// TODO Auto-generated method stub
		return hb.find(hql);
	}

	public Receipt findReceiptByID(int id) {
		// TODO Auto-generated method stub
		return (Receipt)hb.get(Receipt.class, id);
	}

	public int updateReceipt(Receipt receipt) {
		// TODO Auto-generated method stub
		hb.update(receipt);
		return 1;
	}

}
