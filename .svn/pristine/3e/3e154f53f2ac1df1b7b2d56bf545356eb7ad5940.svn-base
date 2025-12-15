package PageObject.TimeAndAttendance;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class TimeAndAttendenceModuleReportPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(TimeAndAttendenceModuleReportPO.class);
	
	public TimeAndAttendenceModuleReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	public PageObjectModel pom() {
		pom = new PageObjectModel(driver);
		return pom;
	}

	public void timeandAttendenceReport(String reportName, DataTable dataTable) throws Exception {
		switch (reportName) {
		case "Late-IN":
			pom().timeAndAttendancePO().gotoLateInReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().lateInReportPO().lateInReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Early-IN":
			pom().timeAndAttendancePO().gotoEarlyInReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().earlyInReportPO().earlyInReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Early-OUT":
			pom().timeAndAttendancePO().gotoEarlyOutReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().earlyOutReportPO().earlyOutReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Overstay":
			pom().timeAndAttendancePO().gotoOverstayReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().overstayReportPO().overstayReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Attendance":
			pom().timeAndAttendancePO().gotoAttendenceReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String format = data.get("Format");
				String groupBy = data.get("GroupBy");
				String eachgroup = data.get("EachGroup");
				String showlessdetials = data.get("ShowLessDetials");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().attendenceReportPO().attendenceReport(fromDate, toDate, format, groupBy, selectuser, eachgroup,
						showlessdetials, exportFormat);
			}
			break;

		case "Attendance Summary":
			pom().timeAndAttendancePO().gotoAttendenceSummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String format = data.get("Format");
				String showlessdetials = data.get("ShowLessDetials");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().attendanceSummaryReportPO().attendenceSummaryReport(fromDate, toDate, format, showlessdetials,
						selectuser, exportFormat);
			}
			break;

		case "Late Arrival Memo":
			pom().timeAndAttendancePO().gotoLateArrivalMemoReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().lateArrivalMemoReportPO().lateArrivalMemoReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Grace Time Usage":
			pom().timeAndAttendancePO().gotoGraceTimeUsageReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().graceTimeUsageReportPO().graceTimeUsageReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "N-Punch Work Hours":
			pom().timeAndAttendancePO().gotoNpunchWorkHoursReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String groupby = data.get("GroupBy");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().nPunchWorkHoursReportPO().npunchWorkHoursReport(fromDate, toDate, groupby, selectuser,
						exportFormat);
			}
			break;

		case "Daily Work Hours":
			pom().timeAndAttendancePO().gotoDailyWorkHoursReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String groupby = data.get("GroupBy");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().dailyWorkHoursTAReportPO().daliyWorkHoursTAReport(fromDate, toDate, groupby, selectuser,
						exportFormat);
			}
			break;

		case "Absent Adjustments":
			pom().timeAndAttendancePO().gotoAbsentAdjustmentReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().absentAdjustmentsReportPO().absentAdjustmentsReport(month, year, selectuser, exportFormat);
			}
			break;

		case "Hourly Attendance":
			pom().timeAndAttendancePO().gotoHourlyAttendenceReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().hourlyAttendanceReportPO().hourlyAttendenceReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Work Hours Summary":
			pom().timeAndAttendancePO().gotoWorkHoursSummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().workHoursSummaryReportPO().workHoursSummaryReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Daily Details":
			pom().timeAndAttendancePO().gotoDailyDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String groupby = data.get("GroupBy");
				String format = data.get("Format");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().dailyDetialsReportPO().dailyDateilsReport(fromDate, toDate, groupby, format, selectuser,
						exportFormat);
			}
			break;

		case "Daily Summary":
			pom().timeAndAttendancePO().gotoDailySummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String format = data.get("Format");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().dailySummaryReportTAPO().dailySummaryReport(fromDate, toDate, format, selectuser, exportFormat);
			}
			break;

		case "Daily Work Details":
			pom().timeAndAttendancePO().gotoDailyWorkDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().dailyWorkDetailsReportPO().dailyWorkDetialsReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Break Deviation":
			pom().timeAndAttendancePO().gotoBreakDeviationReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().breakDeviationReportPO().breakDeviationReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Shift-Wise Count Summary":
			pom().timeAndAttendancePO().gotoShiftWiseCountSummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate"));
				String fromDate = data.get("FromDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().shiftWiseCountSummaryReportPO().shiftWiseCountSummaryReport(fromDate, selectuser, exportFormat);
			}
			break;

		case "First IN-Last OUT Punch Details":
			pom().timeAndAttendancePO().gotoFirstInLastOutPunchDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().firstINLastOUTPunchDetailsReportPO().firstInLastOutPunchDetialsReport(fromDate, toDate,
						selectuser, exportFormat);
			}
			break;

		case "Absentee":
			pom().timeAndAttendancePO().gotoAbsenteeReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().absenteeReportPO().absenteeReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Absenteeism Memo":
			pom().timeAndAttendancePO().gotoAbsenteeismMemoReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().absenteeismMemoReportPO().absenteeismMemoReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Continuous Absence/Presence":
			pom().timeAndAttendancePO().gotoContinuousAbsencePresenceReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().continuousAbsencePresenceReportPO().continuousAbsencePresenceReport(fromDate, toDate, selectuser,
						exportFormat);
			}
			break;

		case "Week-Off & Holiday":
			pom().timeAndAttendancePO().gotoWeekOffHolidayReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().weekOffHolidayReportPO().weekOffHolidayReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "User Field Break":
			pom().timeAndAttendancePO().gotoUserFieldBreakReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userFieldBreakReportPO().userFieldBreakReport(month, year, selectuser, exportFormat);
			}
			break;

		case "Overtime Report":
			pom().timeAndAttendancePO().gotoOvertimewkReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().overtimeReportPO().overtimeReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Overtime Details":
			pom().timeAndAttendancePO().gotoOvertimeDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().overtimeDetailsReportPO().overtimeDetialsReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Total Head Count & Overtime":
			pom().timeAndAttendancePO().gotoTotalHeadCountOvertimeReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().totalHeadCountOvertimeReportPO().totalHeadCountOvertimeReport(fromDate, toDate, selectuser,
						exportFormat);
			}
			break;

		case "User Presence & Overtime":
			pom().timeAndAttendancePO().gotoUserPresenceOvertimeReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userPresenceOvertimeReportPO().userPresenceOvertimeReport(fromDate, toDate, selectuser,
						exportFormat);
			}
			break;
			
		case "Weekly Working Hrs & Overtime":
			pom().timeAndAttendancePO().gotoWeeklyWorkingHrsOvertimeReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate"));
				String fromDate = data.get("FromDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().weeklyWorkingHrsOvertimeReportPO().weeklyWorkingHrsOvertimeReport(fromDate, selectuser,
						exportFormat);
			}
			break;

		case "Daily Overtime Summary":
			pom().timeAndAttendancePO().gotoDailyOvertimeSummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().dailyOvertimeSummaryReportPO().dailyOvertimeSummaryReport(fromDate, toDate, selectuser,
						exportFormat);
			}
			break;

		case "Exceptions":
			pom().timeAndAttendancePO().gotoExpectioninnerReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().exceptionsReportPO().expectionsReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Attendance Exception":
			pom().timeAndAttendancePO().gotoAttendenceExpectionReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String format = data.get("Format");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().attendanceExceptionReportPO().attendenceExpectionReport(fromDate, toDate, format, selectuser,
						exportFormat);
			}
			break;

		case "Manual Correction":
			pom().timeAndAttendancePO().gotoManualCorrectionReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String format = data.get("Format");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().manualCorrectionReportPO().manualCorrectionReport(fromDate, toDate, format, selectuser,
						exportFormat);
			}
			break;

		case "Pending Authorization":
			pom().timeAndAttendancePO().gotoPendingAuthorizationReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().pendingAuthorizationReportPO().pendingAuthorizationReport(fromDate, toDate, selectuser,
						exportFormat);
			}
			break;

		case "Special Function Punch":
			pom().timeAndAttendancePO().gotoSpecialFunctionPunchReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String format = data.get("Format");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().specialFunctionPunchReportPO().specialFunctionPunchReport(fromDate, toDate, format, selectuser,
						exportFormat);
			}
			break;

		case "Shift Change":
			pom().timeAndAttendancePO().gotoShiftChangeReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().shiftChangeReportPO().shiftChangeReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Shift Allowance":
			pom().timeAndAttendancePO().gotoShiftAllowanceReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().shiftAllowanceReportPO().shiftAllowanceReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;

		case "Authorization Status":
			pom().timeAndAttendancePO().gotoAuthorizationStatusReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().authorizationStatusReportPO().authorizationStatusReport(fromDate, toDate, selectuser,
						exportFormat);
			}
			break;

		case "Muster Summary":
			pom().timeAndAttendancePO().gotoMusterSummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().musterSummaryReportPO().musterSummaryReport(month, year, selectuser, exportFormat);
			}
			break;

		case "Previous Adjustment Summary":
			pom().timeAndAttendancePO().gotoPreviousAdjustmentSummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().previousAdjustmentSummaryReportPO().previousAdjustmentSummaryReport(month, year, selectuser,
						exportFormat);
			}
			break;

		case "Salary Data":
			pom().timeAndAttendancePO().gotoSalaryDataReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().salaryDataReportPO().salaryDataReport(month, year, selectuser, exportFormat);
			}
			break;

		case "Absentee Detail":
			pom().timeAndAttendancePO().gotoAbsenteeDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().absenteeDetailReportPO().absenteeDetialReport(month, year, selectuser, exportFormat);
			}
			break;

		case "Monthly Details":
			pom().timeAndAttendancePO().goToMonthlyDetailsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ForMonth: "+data.get("forMonth")+" ForYear: "+data.get("forYear"));
				String month = data.get("forMonth");
				String year = data.get("forYear");
				String format = data.get("FormatSelection");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().monthlyDetailsReport().monthlyDetailsReport(month, year, format, selectuser, exportFormat);
			}
			break;

		case "Monthly Summary":
			pom().timeAndAttendancePO().gotoMonthlySummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String format = data.get("Format");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().monthlySummaryReportPO().monthlySummaryReport(month, year, format, selectuser, exportFormat);
			}
			break;

		case "Monthly Log":
			pom().timeAndAttendancePO().gotoMonthlyLogReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().monthlyLogReportPO().monthlyLogReport(month, year, selectuser, exportFormat);
			}
			break;

		case "Shift Details":
			pom().timeAndAttendancePO().gotoShiftDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().shiftDetailsReportPO().shiftDetialsReport(month, year, selectuser, exportFormat);
			}
			break;

		case "Head Count":
			pom().timeAndAttendancePO().gotoHeadCountReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String exportFormat = data.get("ExportFormat");
				pom().headCountTAReportPO().headCountReport(month, year, exportFormat);
			}
			break;

		case "Flexible Summary":
			pom().timeAndAttendancePO().gotoFlexibleSummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String target = data.get("Target");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().flexibleSummaryReportPO().flexibleSummaryReport(month, year, target, selectuser, exportFormat);
			}
			break;

		case "Attendance Register":
			pom().timeAndAttendancePO().gotoAttendenceRegisterReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String format = data.get("Format");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().attendanceRegisterReportPO().attendenceRegisterReport(month, year, format, selectuser,
						exportFormat);
			}
			break;

		case "Late-IN Register":
			pom().timeAndAttendancePO().gotoLateInRegisterReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().lateInRegisterReportPO().lateInRegisterReport(month, year, selectuser, exportFormat);
			}
			break;

		case "Early-OUT Register":
			pom().timeAndAttendancePO().gotoEarlyOutRegisterReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().earlyOutRegisterReportPO().earlyOutRegisterReport(month, year, selectuser, exportFormat);
			}
			break;

		case "Overtime Register":
			pom().timeAndAttendancePO().gotoOvertimeRegisterReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().overtimeRegisterReportPO().overtimeRegisterReport(month, year, selectuser, exportFormat);
			}
			break;

		case "Yearly Performance":
			pom().timeAndAttendancePO().gotoYearlyPerformanceReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ForMonth: "+data.get("forMonth")+" forYear: "+data.get("forYear")+"toMonth: "+data.get("toMonth")+" toYear: "+data.get("toYear"));
				String formonth = data.get("forMonth");
				String foryear = data.get("forYear");
				String tomonth = data.get("toMonth");
				String toyear = data.get("toYear");
				String format = data.get("Format");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().yearlyPerformanceReportPO().yearlyPerformanceReport(formonth, foryear, tomonth, toyear, format,
						selectuser, exportFormat);
			}
			break;

		case "Form T":
			pom().timeAndAttendancePO().gotoFormTReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String formonth = data.get("Month");
				String foryear = data.get("Year");
				String message = data.get("Message");
				String orgname = data.get("OrgName");
				String orgaddress = data.get("OrgAddress");
				String leaveid = data.get("LeaveId");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().formTReportPO().formTReport(formonth, foryear, message, orgname, orgaddress, leaveid, selectuser,
						exportFormat);
			}
			break;

		case "Form 18":
			pom().timeAndAttendancePO().gotoForm18Report();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Year: "+data.get("Year"));
				String foryear = data.get("Year");
				String message = data.get("Message");
				String orgname = data.get("OrgName");
				String orgaddress = data.get("OrgAddress");
				String leaveid = data.get("LeaveId");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().form18ReportPO().form18Report(foryear, message, orgname, orgaddress, leaveid, selectuser,
						exportFormat);
			}
			break;

		case "Form 28":
			pom().timeAndAttendancePO().gotoForm28Report();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String formonth = data.get("Month");
				String foryear = data.get("Year");
				String format = data.get("Format");
				String message = data.get("Message");
				String orgname = data.get("OrgName");
				String orgaddress = data.get("OrgAddress");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().form28ReportPO().form28Report(formonth, foryear, format, message, orgname, orgaddress, selectuser,
						exportFormat);
			}
			break;

		case "Custom Attendance Register":
			pom().timeAndAttendancePO().gotoCustomAttendenceRegisterReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String formonth = data.get("Month");
				String foryear = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().customAttendanceRegisterReportPO().customAttendanceRegisterReport(formonth, foryear, selectuser,
						exportFormat);
			}
			break;

		case "Form 26":
			pom().timeAndAttendancePO().gotoForm26Report();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String formonth = data.get("Month");
				String foryear = data.get("Year");
				String message = data.get("Message");
				String leUpLabel = data.get("LeftUpperLabel");
				String leLowLabel = data.get("LeftLowerLabel");
				String rgUpLabel = data.get("RigthUpperLabel");
				String rgLowLabel = data.get("RightLowerLabel");
				String footer = data.get("Footer");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().form26ReportPO().form26Report(formonth, foryear, message, leUpLabel, leLowLabel, rgUpLabel,
						rgLowLabel, footer, selectuser, exportFormat);
			}
			break;
			
		case "Time Loss":
			pom().timeAndAttendancePO().gotoTimeLossReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromdate = data.get("FromDate");
				String todate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().timeLossReportPO().timeLossReport(fromdate, todate, selectuser, exportFormat);
			}
			break;
			
		case "Overtime Chart":
			pom().timeAndAttendancePO().gotoOvertimeChartReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromdate = data.get("FromDate");
				String todate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().overtimeChartReportPO().overtimeChartReport(fromdate, todate, selectuser, exportFormat);
			}
			break;
			
		case "Absent":
			pom().timeAndAttendancePO().gotoAbsentReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromdate = data.get("FromDate");
				String todate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().absentReportPO().absentReport(fromdate, todate, selectuser, exportFormat);
			}
			break;
			
		case "User Absent":
			pom().timeAndAttendancePO().gotoUserAbsentReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromdate = data.get("FromDate");
				String todate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userAbsentReportPO().userAbsentReport(fromdate, todate, selectuser, exportFormat);
			}
			break;
			
		case "User Late-IN":
			pom().timeAndAttendancePO().gotoUserLateInReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromdate = data.get("FromDate");
				String todate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userLateInReportPO().userLateInReport(fromdate, todate, selectuser, exportFormat);
			}
			break;
			
		case "User Early-OUT":
			pom().timeAndAttendancePO().gotoUserEarlyOutReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromdate = data.get("FromDate");
				String todate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userEarlyOutReportPO().userEarlyOutReport(fromdate, todate, selectuser, exportFormat);
			}
			break;
			
		case "User Irregularity":
			pom().timeAndAttendancePO().gotoUserIrregularityReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromdate = data.get("FromDate");
				String todate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userIrregularityReportPO().userIrregularityReport(fromdate, todate, selectuser, exportFormat);
			}
			break;
			
		case "Month-Wise Overtime":
			pom().timeAndAttendancePO().gotoMonthWiseOvertimeReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("forMonth: "+data.get("forMonth")+" forYear: "+data.get("forYear")+"toMonth: "+data.get("toMonth")+" toYear: "+data.get("toYear"));
				String formonth = data.get("forMonth");
				String foryear = data.get("forYear");
				String tomonth = data.get("toMonth");
				String toyear = data.get("toYear");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().monthWiseOvertimeReportPO().monthWiseOvertimeReport(formonth, foryear, tomonth, toyear, selectuser, exportFormat);
			}
			break;
			
		case "Attendance Summary Chart":
			pom().timeAndAttendancePO().gotoAttendenceSummaryChartReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromdate = data.get("FromDate");
				String todate = data.get("ToDate");
				String exportFormat = data.get("ExportFormat");
				pom().attendanceSummaryChartReportPO().attendenceSummaryChartReportPO(fromdate, todate, exportFormat);
			}
			break;
			

		default:
			break;
		}
	}

}
