package com.spy.service.imp;

import java.util.List;

import org.aspectj.apache.bcel.generic.NEW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spy.dao.UserDao;
import com.spy.dao.VehicleDao;
import com.spy.entity.Admin;
import com.spy.entity.Customer;
import com.spy.service.UserService;

@Service("userService")
public class UserServiceImp implements UserService{

	@Autowired
	UserDao userDao;
	int findAId;
	int findCId;
	Admin admin;
	Customer customer;
	int aflag,cflag;
	public int addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return userDao.addAdmin(admin);
	}

	public int addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return userDao.addCustomer(customer);
	}

	public int deleteAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return userDao.deleteAdmin(admin);
	}

	public int deleteCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return userDao.deleteCustomer(customer);
	}

	public int deleteMultiAdmin(List<Integer> idList) {
		// TODO Auto-generated method stub
		for(int i=0;i<idList.size();i++)
		{
		    findAId=idList.get(i);
			admin=userDao.findAdminByID(findAId);
			aflag=userDao.deleteAdmin(admin);
			if(aflag==0)
				return 0;
		}
		return 1;
	}

	public int deleteMultiCustomer(List<Integer> idList) {
		// TODO Auto-generated method stub
		for(int i=0;i<idList.size();i++)
		{
			findCId=idList.get(i);
			customer=userDao.findCustomerByID(findCId);
			cflag=userDao.deleteCustomer(customer);
			if(cflag==0)
				return 0;
		}
		return 1;
	}

	public Admin findAdminByID(int id) {
		// TODO Auto-generated method stub
		return userDao.findAdminByID(id);
	}

	public List<Admin> findAllAdmin() {
		// TODO Auto-generated method stub
		
		return userDao.FindAdminByHQL("from Admin");
	}

	public List<Customer> findAllCustomer() {
		// TODO Auto-generated method stub
		return userDao.FindCustomerByHQL("from Customer");
	}

	public Customer findCustomerByID(int id) {
		// TODO Auto-generated method stub
		return userDao.findCustomerByID(id);
	}
	
	public int adminlogin(String username, String password) {
		// TODO Auto-generated method stub
		List<Admin> listAdmins;
		//List<Customer> listCustomers;
		listAdmins=userDao.FindAdminByHQL("from Admin");
		//listCustomers=userDao.FindCustomerByHQL("from Customer");
		for(int i=0;i<listAdmins.size();i++)
		{
			admin=listAdmins.get(i);
			System.out.println(admin.getName()+admin.getPass());
			System.out.println(username+password);
			if((username.equals(admin.getName()))&&password.equals(admin.getPass()))
				return admin.getId();
		}
		/*for(int j=0;j<listCustomers.size();j++)
		{
			customer=listCustomers.get(j);
			if((username.equals(customer.getName()))&&(password.equals(customer.getPass())))
				return customer.getId();
		}*/
		return 0;
	}
   public int customerLogin(String username,String password){
	   List<Customer> listCustomers;
	   listCustomers=userDao.FindCustomerByHQL("from Customer");
	   for(int j=0;j<listCustomers.size();j++)
		{
			customer=listCustomers.get(j);
			if((username.equals(customer.getName()))&&(password.equals(customer.getPass())))
				return customer.getId();
		}
	   return 0;
   }
	public int updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return userDao.updateAdmin(admin);
	}

	public int updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return userDao.updateCustomer(customer);
	}
	//����admin����
	public List<Admin> searchAdmin(int id,String name,String realName,String occupation,int roleId,int stationId)
	{
		String idString="",nameString="",realNameString="",occpString="",roleString="",stationString="";
		int firstFlag=1;
		if (id!=0) {
			idString=" where id="+id;firstFlag--;
		}
		
		if(!name.equals("")){
			if(firstFlag==1){
				//licensesString=" where license='"+license+"'";firstFlag--;
				nameString=" where name='"+name+"'";firstFlag--;
			}
			else{
			//licensesString=" and license='"+license+"'";
				nameString=" and name='"+name+"'";
			}
		}
		if(!realName.equals("")){
			if(firstFlag==1){
				realNameString=" where realName='"+realName+"'";firstFlag--;
			}
			else{
				realNameString=" and realName='"+realName+"'";
			}
		}
		if(!occupation.equals("")){
			if(firstFlag==1){
				occpString=" where occupation='"+occupation+"'";firstFlag--;
			}
			else{
				occpString=" and occupation='"+occupation+"'";
			}
		}
		if(roleId!=0){
			if(firstFlag==1){
				roleString=" where role='"+roleId+"'";firstFlag--;
			}
			else {
				roleString=" and role='"+roleId+"'";
			}
		}
		if(stationId!=0){
			if(firstFlag==1){
				stationString=" where station='"+stationId+"'";firstFlag--;
			}
			else{
				stationString=" and station='"+stationId+"'";
			}
		}
		System.out.println(idString);
		System.out.println(nameString);
		System.out.println(realNameString);
		System.out.println(occpString);
		System.out.println(roleString);
		System.out.println(stationString);
		return userDao.FindAdminByHQL("from Admin"+idString+nameString+realNameString+occpString+roleString+stationString);
	}
	//����customer
	public List<Customer> searchCustomer(int id,String name,String realName,String unitphone)
	{
		String idString="",nameString="",realNameString="",unitphoneString="";
		int firstFlag=1;
		if (id!=0) {
			idString=" where id="+id;firstFlag--;
		}
		
		if(!name.equals("")){
			if(firstFlag==1){
				//licensesString=" where license='"+license+"'";firstFlag--;
				nameString=" where name='"+name+"'";firstFlag--;
			}
			else{
			//licensesString=" and license='"+license+"'";
				nameString=" and name='"+name+"'";
			}
		}
		if(!realName.equals("")){
			if(firstFlag==1){
				realNameString=" where realName='"+realName+"'";firstFlag--;
			}
			else{
				realNameString=" and realName='"+realName+"'";
			}
		}
		if(!unitphone.equals("")){
			if(firstFlag==1){
				unitphoneString=" where unitphone='"+unitphone+"'";firstFlag--;
			}
			else {
				unitphoneString=" and unitphone='"+unitphone+"'";
			}
		}
		System.out.println(idString);
		System.out.println(nameString);
		System.out.println(realNameString);
		
		return userDao.FindCustomerByHQL("from Customer"+idString+nameString+realNameString+unitphoneString);
	}

	public List<Admin> findAdminByStation(int stationID) {
		// TODO Auto-generated method stub
		return userDao.FindAdminByHQL("from Admin where station='"+stationID+"'");
	}
}
