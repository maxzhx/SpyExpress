package com.spy.action;

import java.util.ArrayList;
import java.util.List;

import org.aspectj.apache.bcel.generic.NEW;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.spy.entity.Vehicle;


public class PageBean {

	private int totalPages=0;
	private List<Integer> pageList = new ArrayList<Integer>();
	private int pageSize;
	private List allList=new ArrayList();
	
	public PageBean(int pageSize){
		this.pageSize=pageSize;
	}
	public PageBean(){
		this.pageSize=10;
	}
	
	public List queryByPage(int currentPage, List list) {
		allList = list;
		int listSize=allList.size();
		if (listSize%pageSize==0) {
			totalPages=listSize/pageSize;
		}
		else {
			totalPages=listSize/pageSize+1;
		}
		return showCurrentPage(currentPage);
	}
	public List showCurrentPage(int currentPage)
	{
		int first=(currentPage-1)*pageSize;
		int last=first+pageSize;
		if (last>allList.size()) {
			last=allList.size();
		}
		if(totalPages==0){
			return null;
		}
		if (currentPage>totalPages) {
			System.out.println("hh");
			currentPage=totalPages;
			first=(currentPage-1)*pageSize;
			last=first+pageSize;
			if (last>allList.size()) {
				last=allList.size();
			}
		}
		if(totalPages<9)
		{
			for (int i = 0; i < totalPages; i++) {
				pageList.add(i, i+1);	
			}
		}
		else {
			if(currentPage<=5){
				for (int i = 0; i < 9; i++) {
					pageList.add(i, i+1);	
				}
			}
			else if(totalPages-currentPage<=4){
				for (int i = 0; i < 9; i++) {
					pageList.add(i,totalPages-8+i);
				}
			}
			else {
				for (int i = 0; i < 9; i++) {
					pageList.add(i,currentPage-4+i);
				}
			}
		}
//		System.out.println(first+" "+last);
		return  allList.subList(first,last);
	}

	
	public List<Integer> getPageList() {
		return pageList;
	}

	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}


	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}


	public void setAllList(List allList) {
		this.allList = allList;
	}


	public List getAllList() {
		return allList;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
