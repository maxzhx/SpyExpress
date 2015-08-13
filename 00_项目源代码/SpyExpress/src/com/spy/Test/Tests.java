package com.spy.Test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.spy.entity.Report;
import com.spy.entity.ReportHeadItem;
import com.spy.entity.ReportSubItem;
import com.spy.entity.Station;
import com.spy.service.ReportService;
import com.spy.service.StationService;
import com.spy.service.ReportService.Constraint;

public class Tests {
	@Test
	public void Test() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		// Order order = new Order();;
		// order.setId(1000);
		// order.setSendTime(new Date(2001, 1, 20));
		// order.setRecvTime(new Date(2001, 1, 21));
		// order.setStatus(1);
		// order.setPath("aa");
		// order.setPrice(new Double("11111"));
		// order.setRecvName("aaaaaa");
		// order.setRecvPhone("110");
		// order.setRecvAddress("bbb");
		StationService stationService = (StationService) ctx
				.getBean("stationService");
		// List<Order> orders = station.findOrder(1, 9002);
		Station station = new Station();
		station.setId(9066);
		station.setName("aa");
		station.setAddress("aa");
		station.setNote("ww");
		station.setPhone("aaa");
		stationService.addStation(station);
		// List<Order> orderList = orderDao.findOrderByHQL("from Order");
		// System.out.println(orders.get(0).getPath());
	}

	@Test
	public void testAddHeadReport() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		ReportService reportService = (ReportService) ctx
				.getBean("reportService");
		if (reportService.addReportForHead("13", "040506"))
			System.out.println("成功");
		else
			System.out.println("日期格式错误");
	}

	@Test
	public void testAddSubReport() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		ReportService reportService = (ReportService) ctx
				.getBean("reportService");
		if (reportService.addRecvReportForSub(9002, "13", "040506"))
			System.out.println("成功");
		else
			System.out.println("日期格式错误");

	}

	@Test
	public void testViewHead() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		ReportService reportService = (ReportService) ctx
				.getBean("reportService");
		List<ReportHeadItem> items=reportService.viewReportForHead("V_HAED_13");
		if (items != null) {
			if (items.size() == 0)
				System.out.println("内容为空");
			else
				System.out.println(items);
		} else
			System.out.println("该报表不存在！!");
	}

	@Test
	public void testHeadReport() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		ReportService reportService = (ReportService) ctx
				.getBean("reportService");
		Constraint constraint = new Constraint();
		// constraint.setType(1);
		List<Report> reports = reportService.findReportForHead(constraint);
		if (reports != null) {
			System.out.println("结果如下");
			for (Report report : reports) {
				System.out.println(report.getViewName());
				List<ReportHeadItem> items = reportService
						.viewReportForHead(report.getViewName());
				if (items != null) {
					if (items.size() == 0)
						System.out.println("内容为空");
					else
						System.out.println(items);
				} else
					System.out.println("该报表不存在！");

				System.out.println("----------------------------------------");
			}

		} else
			System.out.println("没有符合条件的结果");
	}

	@Test
	public void testSubReport() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		ReportService reportService = (ReportService) ctx
				.getBean("reportService");
		Constraint constraint = new Constraint();
		constraint.setStationId(9001);
		constraint.setType(6);
		List<Report> reports = reportService.findReportForSub(constraint);
		if (reports != null) {
			System.out.println("结果如下");
			for (Report report : reports) {
				System.out.println(report.getViewName());
				List<ReportSubItem> items = reportService
						.viewReportForSub(report.getViewName());
				if (items != null) {
					if (items.size() == 0)
						System.out.println("内容为空");
					else
						System.out.println(items);
				} else
					System.out.println("该报表不存在！");

				System.out.println("----------------------------------------");
			}

		} else
			System.out.println("没有符合条件的结果");
	}
}
