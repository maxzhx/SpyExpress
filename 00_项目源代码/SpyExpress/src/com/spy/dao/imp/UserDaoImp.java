package com.spy.dao.imp;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.spy.dao.UserDao;
import com.spy.entity.Admin;
import com.spy.entity.Customer;

@Component("userDao")
public class UserDaoImp implements UserDao{

	@Autowired
	HibernateTemplate hb;
	public int addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		hb.save(admin);
		return 1;
	}

	public int addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		hb.save(customer);
		return 1;
	}

	public List<Admin> FindAdminByHQL(String hql) {
		// TODO Auto-generated method stub
		return hb.find(hql);
	}

	public List<Customer> FindCustomerByHQL(String hql) {
		// TODO Auto-generated method stub
		return hb.find(hql);
	}

	public int deleteAdmin(Admin admin) {
		// TODO Auto-generated method stub
		hb.delete(admin);
		return 1;
	}

	public int deleteCustomer(Customer customer) {
		// TODO Auto-generated method stub
		hb.delete(customer);
		return 1;
	}

	public Admin findAdminByID(int id) {
		// TODO Auto-generated method stub
		return (Admin)hb.get(Admin.class, id);
	}

	public Customer findCustomerByID(int id) {
		// TODO Auto-generated method stub
		return (Customer)hb.get(Customer.class, id);
	}

	public int updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		hb.update(admin);
		return 1;
	}

	public int updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		hb.update(customer);
		return 1;
	}

}
