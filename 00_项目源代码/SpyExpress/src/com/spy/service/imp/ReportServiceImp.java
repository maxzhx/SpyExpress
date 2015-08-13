package com.spy.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spy.dao.ReportDao;
import com.spy.dao.StationDao;
import com.spy.entity.Report;
import com.spy.entity.ReportHeadItem;
import com.spy.entity.ReportSubItem;
import com.spy.entity.Station;
import com.spy.service.ReportService;

/**
 * 报表管理的服务层
 * 
 * @author 张婧虹
 * 
 */
@Service("reportService")
public class ReportServiceImp implements ReportService {

	@Autowired
	ReportDao reportDao;

	@Autowired
	StationDao stationDao;

	public int deleteReport(String viewName) {
		Report report = reportDao.findReportByView(viewName);
		return reportDao.deleteReport(report);
	}

	public boolean addReportForHead(String year, String month) {
		return reportDao.addReportForHead(year, month);
	}

	public boolean addRecvReportForSub(int stationId, String year, String month) {
		return reportDao.addRecvReportForSub(stationId, year, month);
	}

	public boolean addSendReportForSub(int stationId, String year, String month) {
		return reportDao.addSendReportForSub(stationId, year, month);
	}

	public List<ReportSubItem> viewReportForSub(String viewName) {
		return reportDao.viewReportForSub(viewName);
	}

	public List<ReportHeadItem> viewReportForHead(String viewName) {
		return reportDao.viewReportForHead(viewName);
	}

	public List<Report> findReportForSub(Constraint constraint) {
		Integer station_id = constraint.getStationId();
		String date = constraint.getDate();
		Integer type = constraint.getType();
		List<String> params = new ArrayList<String>();
		List<Object> values = new ArrayList<Object>();
		StringBuilder sql = new StringBuilder("from Report ");
		String staSql = null, dateSql = null, typeSql = null;
		boolean hasWhere = false;
		if (station_id != null && station_id != 0) {
			Station station = stationDao.findStationByID(station_id);
			params.add("sta");
			values.add(station);
			staSql = "station=:sta ";
			if (!hasWhere) {
				hasWhere = true;
				sql.append("where ");
			} else {
				sql.append("and ");
			}
			sql.append(staSql);
		} else {
			if (!hasWhere) {
				hasWhere = true;
				sql.append("where ");
			} else {
				sql.append("and ");
			}
			sql.append("rpType!=1 and rpType!=2 and rpType!=3 ");
		}
		if (date != null && !date.equals("")) {
			params.add("date");
			values.add(date);
			dateSql = "rpDate=:date ";
			if (!hasWhere) {
				hasWhere = true;
				sql.append("where ");
			} else {
				sql.append("and ");
			}
			sql.append(dateSql);
		}
		if (type != null && type != 0) {
			params.add("type");
			values.add(type);
			typeSql = "rpType=:type ";
			if (!hasWhere) {
				hasWhere = true;
				sql.append("where ");
			} else {
				sql.append("and ");
			}
			sql.append(typeSql);
		}

		sql.append("order by rpDate ");
		String[] ps = params.toArray(new String[params.size()]);
		Object[] vs = values.toArray(new Object[values.size()]);
		return reportDao.findReportByHQL(sql.toString(), ps, vs);

	}

	public List<Report> findReportForHead(Constraint constraint) {
		String date = constraint.getDate();
		Integer type = constraint.getType();
		List<String> params = new ArrayList<String>();
		List<Object> values = new ArrayList<Object>();
		StringBuilder sql = new StringBuilder("from Report ");
		String dateSql = null, typeSql = null;
		boolean hasWhere = false;
		if (date != null && !date.equals("")) {
			params.add("date");
			values.add(date);
			dateSql = "rpDate=:date ";
			if (!hasWhere) {
				hasWhere = true;
				sql.append("where ");
			} else {
				sql.append("and ");
			}
			sql.append(dateSql);
		}
		if (type != null && type != 0) {
			params.add("type");
			values.add(type);
			typeSql = "rpType=:type ";
			if (!hasWhere) {
				hasWhere = true;
				sql.append("where ");
			} else {
				sql.append("and ");
			}
			sql.append(typeSql);
		}
		if (!hasWhere) {
			hasWhere = true;
			sql.append("where ");
		} else {
			sql.append("and ");
		}
		sql.append("(rpType=1 or rpType=2 or rpType=3) order by rpDate");

		String[] ps = params.toArray(new String[params.size()]);
		Object[] vs = values.toArray(new Object[values.size()]);
	
		return reportDao.findReportByHQL(sql.toString(), ps, vs);
	}

	public Report findReportByView(String viewName) {
		return reportDao.findReportByView(viewName);
	}

}
