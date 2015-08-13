package com.spy.dao.imp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import oracle.jdbc.OracleTypes;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.spy.dao.ReportDao;
import com.spy.entity.Report;
import com.spy.entity.ReportHeadItem;
import com.spy.entity.ReportSubItem;

@Component("reportDao")
public class ReportDaoImp implements ReportDao {

	@Autowired
	HibernateTemplate hb;

	@SuppressWarnings("unchecked")
	public List<Report> findReportByHQL(String hql, String[] paramNames,
			Object[] values) {
		return hb.findByNamedParam(hql, paramNames, values);
	}

	public int deleteReport(Report report) {
		try{
			 Session session = hb.getSessionFactory().openSession();
			 Query query = session.createSQLQuery("drop view "+report.getViewName());
			 System.out.println(query.getQueryString());
			 query.executeUpdate();
			 session.close();
			hb.delete(report);
			return 1;
		}catch(HibernateException hb){
			hb.printStackTrace();
		}catch(DataAccessException de){
			de.printStackTrace();
		}
		
	return 0;
	}

	public Report findReportByView(String view_name) {
		return (Report) hb.get(Report.class, view_name);
	}

	public boolean addReportForHead(final String year, final String month) {
		int r = (Integer) hb.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) {
				int rs = 0;
				try {
					Connection conn = session.connection();
					String sql = "{call PROC_HEAD(?,?,?)}";
					CallableStatement stmt = conn.prepareCall(sql);
					stmt.setString(1, year);
					stmt.setString(2, month);
					stmt.registerOutParameter(3, OracleTypes.INTEGER);
					stmt.execute();
					rs = stmt.getInt(3);
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return rs;
			}
		});
		if (r == 1)
			return true;
		return false;
	}

	public boolean addSendReportForSub(final int station_id, final String year,
			final String month) {
		int r = (Integer) hb.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) {
				int rs = 0;
				try {
					Connection conn = session.connection();
					String sql = "{call PROC_SUB_SEND(?,?,?,?)}";
					CallableStatement stmt = conn.prepareCall(sql);
					stmt.setInt(1, station_id);
					stmt.setString(2, year);
					stmt.setString(3, month);
					stmt.registerOutParameter(4, OracleTypes.INTEGER);
					stmt.execute();
					rs = stmt.getInt(4);
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return rs;
			}
		});
		if (r == 1)
			return true;
		return false;
	}

	public boolean addRecvReportForSub(final int station_id, final String year,
			final String month) {
		int r = (Integer) hb.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) {
				int rs = 0;
				try {
					Connection conn = session.connection();
					String sql = "{call PROC_SUB_RECV(?,?,?,?)}";
					CallableStatement stmt = conn.prepareCall(sql);
					stmt.setInt(1, station_id);
					stmt.setString(2, year);
					stmt.setString(3, month);
					stmt.registerOutParameter(4, OracleTypes.INTEGER);
					stmt.execute();
					rs = stmt.getInt(4);
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return rs;
			}
		});
		if (r == 1)
			return true;
		return false;

	}

	public List<ReportSubItem> viewReportForSub(String view_name) {
		List<ReportSubItem> results = null;
		// if (isExistView(view_name)) {
		Session session = hb.getSessionFactory().openSession();
		Query query = session.createSQLQuery("select * from " + view_name);
		List li = query.list();
		results = new ArrayList<ReportSubItem>();
		for (int i = 0; i < li.size(); i++) {
			Object[] obj = (Object[]) (li.get(i));
			ReportSubItem item = new ReportSubItem();
			item.setOrderId(Integer.parseInt(obj[0].toString()));
			item.setWeight(Double.parseDouble(obj[1].toString()));
			item.setVolume(Double.parseDouble(obj[2].toString()));
			item.setPrice(Double.parseDouble(obj[3].toString()));
			item.setSender(obj[4].toString());
			item.setReceiver(obj[5].toString());
			try {
				Date date = new SimpleDateFormat("yyyy-MM-dd").parse(obj[6]
						.toString());
				item.setTime(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			results.add(item);
		}
		// } else {
		// System.out.println("內  该报表不存在！");
		// }
		session.close();
		return results;
	}

	public List<ReportHeadItem> viewReportForHead(String view_name) {

		List<ReportHeadItem> results = null;
		Session session = hb.getSessionFactory().openSession();
		// if (isExistView(view_name)) {
		Query query = session.createSQLQuery("select * from " + view_name);
		List li = query.list();
		results = new ArrayList<ReportHeadItem>();
		for (int i = 0; i < li.size(); i++) {
			Object[] obj = (Object[]) (li.get(i));
			ReportHeadItem item = new ReportHeadItem();
			item.setStationId(Integer.parseInt(obj[0].toString()));
			item.setStationName(obj[1].toString());
			item.setTotalWeight(Double.parseDouble(obj[2].toString()));
			item.setTotalVolume(Double.parseDouble(obj[3].toString()));
			item.setTotalIncome(Double.parseDouble(obj[4].toString()));
			// System.out.println(item);
			results.add(item);
		}
		// } else {
		// System.out.println("该报表不存在！");
		// }
		session.close();
		return results;
	}

	/**
	 * 判断视图是否存在，废弃
	 * 
	 * @param view_name
	 *            视图名称
	 * @return 存在返回true，不存在返回false
	 */
	private boolean isExistView(String view_name) {
		Session session = hb.getSessionFactory().openSession();
		String sql = "select view_name from user_views where view_name=:name";
		Object object = session.createSQLQuery(sql)
				.setString("name", view_name).uniqueResult();
		session.close();
		if (object == null)
			return false;
		return true;
	}

}
