package com.spy.dao;

import java.util.List;

import com.spy.entity.Report;
import com.spy.entity.ReportHeadItem;
import com.spy.entity.ReportSubItem;

/**
 * 报表管理模块
 * 
 * @author 张婧虹
 * 
 */
public interface ReportDao {

	/**
	 * 删除报表
	 * 
	 * @param admin
	 *            表示要删除的报表
	 * @return 0 :表示删除失败 1:表示删除成功
	 */
	public int deleteReport(Report report);

	/**
	 * 通过HQL语句查询报表
	 * 
	 * @param hql
	 *            用于查询的hql语句
	 * @param paramNames
	 *            参数名
	 * @param values
	 *            参数值
	 * @return 通过hql语句查询到的报表的列表
	 */
	public List<Report> findReportByHQL(String hql, String[] paramNames,
			Object[] values);

	/**
	 * 通过ID查询报表
	 * 
	 * @param id
	 *            :要查询的报表的ID
	 * @return order：查询到的报表
	 */
	public Report findReportByView(String view_name);

	/**
	 * 生成总公司报表
	 * 
	 * @param year
	 *            年份
	 * @param month
	 *            月份，"00"表年报，"040506"表第二季度报，"06"表月报，以此类推
	 * @return true表示成功，false表示格式错误，失败
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
	 * @return true表示成功，false表示格式错误，失败
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
	 * @return true表示成功，false表示格式错误，失败
	 */
	public boolean addRecvReportForSub(int station_id, String year, String month);

	/**
	 * 查看总公司报表内容
	 * 
	 * @param view_name
	 *            报表的视图名称
	 * @return 报表内容，null表示报表不存在
	 */
	public List<ReportSubItem> viewReportForSub(String view_name);

	/**
	 * 查看配送点报表内容
	 * 
	 * @param view_name
	 *            报表的视图名称
	 * @return 报表内容，null表示报表不存在
	 */
	public List<ReportHeadItem> viewReportForHead(String view_name);

}
