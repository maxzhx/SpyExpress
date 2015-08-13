package com.spy.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.spy.entity.Admin;
import com.spy.entity.Report;
import com.spy.entity.ReportHeadItem;
import com.spy.entity.ReportSubItem;
import com.spy.entity.Station;
import com.spy.service.ReportService;
import com.spy.service.StationService;
import com.spy.service.ReportService.Constraint;

@Component("reportAction")
public class ReportAction extends ActionSupport {

	@Autowired
	ReportService reportService;

	@Autowired
	StationService stationService;

	/*
	 * 查看报表
	 */
	private List<Report> reportList;// 省公司或配送点的所有报表
	private Report report;// 选中的要查看的报表
	private List<ReportHeadItem> headItems;// 省公司报表的详细内容
	private List<ReportSubItem> subItems;// 配送点报表的详细内容
	private String viewName;// 报表对应的视图名称
	private String title;// 报表的标题

	/*
	 * 分页
	 */
	private PageBean pageBean = new PageBean();
	private int currentPage = 1;
	private String scurrentPage = "";

	/*
	 * 生成报表
	 */
	private int[] years; // 待选年份
	private int selectYear; // 选中的年份
	private String selectType; // 选中的报表类型
	private String selectDate; // 选中的日期

	private List<Station> stationList; // 待选的配送点
	private int stationID;
	private int selectStaId; // 选中的配送点
	/*
	 * 查询
	 */
	private String searchDate;
	private String searchType;// 类型
	private String searchPro;// 性质

	/*
	 * 选中
	 */
	private List<String> selectList;// 选中的报表

	/*
	 * getter and setter
	 */

	public String getScurrentPage() {
		return scurrentPage;
	}

	public String getSearchPro() {
		return searchPro;
	}

	public void setSearchPro(String searchPro) {
		this.searchPro = searchPro;
	}

	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public void setScurrentPage(String scurrentPage) {
		this.scurrentPage = scurrentPage;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public List<String> getSelectList() {
		return selectList;
	}

	public void setSelectList(List<String> selectList) {
		this.selectList = selectList;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}

	public List<Report> getReportList() {
		return reportList;
	}

	public void setReportList(List<Report> reportList) {
		this.reportList = reportList;
	}

	public List<ReportHeadItem> getHeadItems() {
		return headItems;
	}

	public void setHeadItems(List<ReportHeadItem> headItems) {
		this.headItems = headItems;
	}

	public List<ReportSubItem> getSubItems() {
		return subItems;
	}

	public void setSubItems(List<ReportSubItem> subItems) {
		this.subItems = subItems;
	}

	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public int[] getYears() {
		return years;
	}

	public void setYears(int[] years) {
		this.years = years;
	}

	public int getSelectYear() {
		return selectYear;
	}

	public void setSelectYear(int selectYear) {
		this.selectYear = selectYear;
	}

	public String getSelectType() {
		return selectType;
	}

	public void setSelectType(String selectType) {
		this.selectType = selectType;
	}

	public String getSelectDate() {
		return selectDate;
	}

	public void setSelectDate(String selectDate) {
		this.selectDate = selectDate;
	}

	public List<Station> getStationList() {
		return stationList;
	}

	public void setStationList(List<Station> stationList) {
		this.stationList = stationList;
	}

	public int getSelectStaId() {
		return selectStaId;
	}

	public void setSelectStaId(int selectStaId) {
		this.selectStaId = selectStaId;
	}

	/*
	 * Action Method
	 */
	/**
	 * 查询总公司报表
	 */
	public String searchReportForHead() {
		int type = 0;
		if (searchType.equals("年报"))
			type = 1;
		else if (searchType.equals("季报"))
			type = 2;
		else if (searchType.equals("月报"))
			type = 3;
		Constraint constraint = new Constraint();
		constraint.setType(type);// 1-9
		constraint.setDate(searchDate.trim());// 11年 01月 正则
		System.out.println(constraint.getType());
		reportList = reportService.findReportForHead(constraint);
		if (reportList.size() != 0)
			reportList = pageBean.queryByPage(currentPage, reportList);

		if (reportList != null) {
			return "success";
		} else {
			return "fail";
		}
	}

	/**
	 * 取消查询总公司报表，清空条件
	 * 
	 * @return
	 */
	public String cancelSearchForHead() {
		searchDate = null;
		searchType = null;
		return "success";
	}

	/**
	 * 查询配送点报表
	 * 
	 * @return
	 */
	public String searchReportForSub() {
		int type = 0;
		if (searchType.equals("月报 发货"))
			type = 6;
		else if (searchType.equals("月报 收货"))
			type = 9;
		else if (searchType.equals("季报 发货"))
			type = 5;
		else if (searchType.equals("季报 收货"))
			type = 8;
		else if (searchType.equals("年报 发货"))
			type = 4;
		else if (searchType.equals("年报 收货"))
			type = 7;
		Constraint constraint = new Constraint();
		constraint.setType(type);// 1-9
		constraint.setDate(searchDate.trim());// 11年 01月 正则
		
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		setStationID(admin.getStation().getId());
		if (stationID==0) {
			constraint.setStationId(selectStaId);
		}
		else {
			constraint.setStationId(admin.getStation().getId());
		}
		reportList = reportService.findReportForSub(constraint);
		
		if (reportList.size() != 0)
			reportList = pageBean.queryByPage(currentPage, reportList);
		if (reportList != null) {
			return "success";
		} else {
			return "fail";
		}
	}

	/**
	 * 取消查询配送点报表，清空条件
	 * 
	 * @return
	 */
	public String cancelSearchForSub() {
		searchDate = null;
		searchType = null;
		searchPro = null;
		selectStaId = 0;
		return "success";
	}

	/**
	 * 查看所有总公司报表
	 * 
	 * @return
	 */
	public String showAllReportForHead() {
		currentPage = 1;
		reportList = new ArrayList<Report>();
		reportList = reportService.findReportForHead(new Constraint());
		reportList = pageBean.queryByPage(currentPage, reportList);
		searchDate = null;
		searchType = null;
		return "success";
	}

	/**
	 * 页面跳转
	 * 
	 * @return
	 */
	public String showCurrentPage() {
		if (!scurrentPage.equals("")) {
			currentPage = Integer.parseInt(scurrentPage);
			if (currentPage > pageBean.getTotalPages())
				currentPage = pageBean.getTotalPages();
			if (currentPage < 1)
				currentPage = 1;
			scurrentPage = "";
		}
		reportList = pageBean.showCurrentPage(currentPage);
		return "success";
	}

	/**
	 * 查看所有配送点报表
	 * 
	 * @return
	 */
	public String showAllReportForSub() {
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		setStationID(admin.getStation().getId());
		if (stationID==0) {
			stationList = stationService.findAllStation();
			reportList = new ArrayList<Report>();
			reportList = reportService.findReportForSub(new Constraint());
		}
		else {
			stationList = new ArrayList<Station>();
			stationList.add(admin.getStation());
			Constraint constraint=new Constraint();
			constraint.setStationId(admin.getStation().getId());
			reportList = reportService.findReportForSub(constraint);
		}
		
		currentPage = 1;
		System.out.println(pageBean.getTotalPages());
		reportList = pageBean.queryByPage(currentPage, reportList);
		searchDate = null;
		searchType = null;
		searchPro = null;
		selectStaId = 0;
		return "success";
	}

	/**
	 * 查看总公司报表详细内容
	 * 
	 * @return
	 */
	public String showReportItemForHead() {

		headItems = reportService.viewReportForHead(viewName);
		report = reportService.findReportByView(viewName);

		return "success";
	}

	/**
	 * 查看配送点报表详细内容
	 * 
	 * @return
	 */
	public String showReportItemForSub() {
		subItems = reportService.viewReportForSub(viewName);
		report = reportService.findReportByView(viewName);
		// System.out.println(report.getRpDate());
		return "success";
	}

	/**
	 * 生成总公司报表
	 * 
	 * @return
	 */
	public String addReportForHead() {
		years = new int[20];
		Calendar calendar = Calendar.getInstance();
		int curYear = calendar.get(Calendar.YEAR);
		for (int i = 0; i < years.length; i++)
			years[i] = curYear++;

		return "success";
	}

	/**
	 * 生成配送点报表
	 * 
	 * @return
	 */
	public String addReportForSub() {
		years = new int[20];
		Calendar calendar = Calendar.getInstance();
		int curYear = calendar.get(Calendar.YEAR);
		for (int i = 0; i < years.length; i++)
			years[i] = curYear++;
		
		HttpSession session=ServletActionContext.getRequest().getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		setStationID(admin.getStation().getId());
		if (stationID==0) {
			stationList = stationService.findAllStation();
		}
		else {
			stationList = new ArrayList<Station>();
			stationList.add(admin.getStation());
		}
		
		return "success";
	}

	/**
	 * 提交生成总公司报表，并查看生成的报表
	 * 
	 * @return
	 */
	public String submitAddForHead() {
		String year = String.valueOf(selectYear % 100);
		String month;
		if (selectDate.equals("全年"))
			month = "00";
		else if (selectDate.equals("第一季度"))
			month = "010203";
		else if (selectDate.equals("第二季度"))
			month = "040506";
		else if (selectDate.equals("第三季度"))
			month = "070809";
		else if (selectDate.equals("第四季度"))
			month = "101112";
		else
			month = selectDate;
		if (reportService.addReportForHead(year, month)) {
			viewName = "V_HEAD_" + year;
			if (!month.equals("00"))
				viewName += "_" + month;
			headItems = reportService.viewReportForHead(viewName);
			report = reportService.findReportByView(viewName);
			return "success";
		} else
			return "failure";
	}

	/**
	 * 提交生成配送点报表，并查看生成的报表
	 * 
	 * @return
	 */
	public String submitAddForSub() {
		System.out.println("date" + selectDate + ",type" + selectType + ",id"
				+ selectStaId + ",year" + selectYear);
		String year = String.valueOf(selectYear % 100);
		String month;
		if (selectDate.equals("全年"))
			month = "00";
		else if (selectDate.equals("第一季度"))
			month = "010203";
		else if (selectDate.equals("第二季度"))
			month = "040506";
		else if (selectDate.equals("第三季度"))
			month = "070809";
		else if (selectDate.equals("第四季度"))
			month = "101112";
		else
			month = selectDate;
		if (selectType.equals("发货报表")) {
			if (reportService.addSendReportForSub(selectStaId, year, month)) {
				viewName = "V_STA" + selectStaId + "_SEND_" + year;
				if (!month.equals("00"))
					viewName += "_" + month;
				subItems = reportService.viewReportForSub(viewName);
				report = reportService.findReportByView(viewName);
				return "success";
			} else
				return "failure";
		} else {
			if (reportService.addRecvReportForSub(selectStaId, year, month)) {
				viewName = "V_STA" + selectStaId + "_RECV_" + year;
				if (!month.equals("00"))
					viewName += "_" + month;
				subItems = reportService.viewReportForSub(viewName);
				report = reportService.findReportByView(viewName);
				return "success";
			} else
				return "failure";
		}

	}

	/**
	 * 总公司删除单个报表
	 * 
	 * @return
	 */
	public String deleteReportForHead() {
		reportService.deleteReport(viewName);
		return "success";
	}

	public String deleteMultiReportForHead() {
		int flag = 0;
		if (selectList.isEmpty())
			return "fail";
		else {
			for (String viewName : selectList) {
				flag = reportService.deleteReport(viewName);
				if (flag == 0)
					return "fail";
			}
			return "success";
		}
	}

	public String deleteReportForSub() {
		reportService.deleteReport(viewName);
		return "success";
	}

	public String deleteMultiReportForSub() {
		int flag = 0;
		if (selectList.isEmpty())
			return "fail";
		else {
			System.out.println(selectList);
			for (String viewName : selectList) {
				System.out.println("_____________________" + viewName);
				flag = reportService.deleteReport(viewName);
				if (flag == 0)
					return "fail";
			}
			return "success";
		}
	}

	public int getStationID() {
		return stationID;
	}

	public void setStationID(int stationID) {
		this.stationID = stationID;
	}

}
