package com.spy.service;

import java.util.List;

import com.spy.entity.Report;
import com.spy.entity.ReportHeadItem;
import com.spy.entity.ReportSubItem;

/**
 * 报表管理的服务层
 * 
 * @author 张婧虹
 * 
 */
public interface ReportService {

	/**
	 * 删除报表
	 * @param viewName 视图名称
	 * @return
	 */
	public int deleteReport(String viewName);

	/**
	 * 生成总公司报表
	 * 
	 * @param year
	 *            年份
	 * @param month
	 *            月份，"00"表年报，"040506"表第二季度报，"06"表月报，以此类推
	 */
	public boolean addReportForHead(String year, String month);

	/**
	 * 生成配送点的发货报表
	 * 
	 * @param station_id
	 *            配送点id
	 * @param year
	 *            年份
	 * @param month
	 *            月份，"00"表年报，"040506"表第二季度报，"06"表月报，以此类推
	 */
	public boolean addSendReportForSub(int station_id, String year, String month);

	/**
	 * 生成配送点的收货报表
	 * 
	 * @param station_id
	 *            配送点id
	 * @param year
	 *            年份
	 * @param month
	 *            月份，"00"表年报，"040506"表第二季度报，"06"表月报，以此类推
	 */
	public boolean addRecvReportForSub(int station_id, String year, String month);

	/**
	 * 查找配送点报表
	 * 
	 * @param constraint
	 *            查询条件
	 * @return 符合条件的报表列表
	 */
	public List<Report> findReportForSub(Constraint constraint);

	/**
	 * 查找总公司报表
	 * 
	 * @param constraint
	 *            查询条件
	 * @return 符合条件的报表列表
	 */
	public List<Report> findReportForHead(Constraint constraint);

	/**
	 * 查看配送点报表的内容
	 * 
	 * @param report
	 *            报表
	 * @return 报表内容，null表示报表不存在
	 */
	public List<ReportSubItem> viewReportForSub(String viewName);

	/**
	 * 查看总公司报表的内容
	 * 
	 * @param report
	 *            报表
	 * @return 报表内容，null表示报表不存在
	 */
	public List<ReportHeadItem> viewReportForHead(String viewName);

	/**
	 * 根据视图名称查找报表Report
	 * 
	 * @param viewName
	 *            视图名称
	 * @return Report
	 */
	public Report findReportByView(String viewName);

	/**
	 * 查询条件类
	 * 
	 */
	public class Constraint {

		private Integer station_id = null;// 配送点id
		private String date = null;// 报表日期
		private Integer type = null;// 报表类型

		public Constraint() {
			station_id = null;
		}

		public Integer getStationId() {
			return station_id;
		}

		public void setStationId(int stationId) {
			station_id = stationId;
		}

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}

		public Integer getType() {
			return type;
		}

		public void setType(int type) {
			this.type = type;
		}

	}

}
