package PageObject.ContractorWorkerManagement;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class CWMModuleReportPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(CWMModuleReportPO.class);
	
	public CWMModuleReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public PageObjectModel pom() {
		pom=new PageObjectModel(driver);
		return pom;
	}
	
	public void cvmModuleReport(String reportName, DataTable dataTable) throws Exception {
		switch(reportName) {
		case  "Shift Schedule":
			pom().contractorWorkerManagementPO().gotoShiftScheduleAttendenceReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectcontractor = data.get("SelectContractor");
				String selectworkorder = data.get("SelectWorkerOrder");
				String selectworker = data.get("SelectWorkers");
				String exportFormat = data.get("ExportFormat");
				pom().shiftScheduleAttendenceReportPO().shiftScheduleAttendenceReport(month, year, selectcontractor, selectworkorder, selectworker, exportFormat);
			}
			break;
			
		case "Muster Roll":
			pom().contractorWorkerManagementPO().gotoMusterRollReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectcontractor = data.get("SelectContractor");
				String selectworkorder = data.get("SelectWorkerOrder");
				String selectworker = data.get("SelectWorkers");
				String exportFormat = data.get("ExportFormat");
				pom().musterRollReportPO().musterRollReport(month, year, selectcontractor, selectworkorder, selectworker, exportFormat);
				}
			break;
			
		case "Continuous Absence/Presence":
			pom().contractorWorkerManagementPO().gotoContinuousAbPrReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectcontractor = data.get("SelectContractor");
				String selectworkorder = data.get("SelectWorkerOrder");
				String exportFormat = data.get("ExportFormat");
				pom().continuousAbPrReportPO().continuousAbPrReport(fromDate, toDate, selectcontractor, selectworkorder, exportFormat);
			}
			break;
			
		
		case "Monthly Attendance":
			pom().contractorWorkerManagementPO().gotoMonthlyAttendenceReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectcontractor = data.get("SelectContractor");
				String selectworkorder = data.get("SelectWorkerOrder");
				String selectworker = data.get("SelectWorkers");
				String exportFormat = data.get("ExportFormat");
				pom().monthlyAttendanceReportPO().monthlyAttendanceReport(fromDate, toDate, selectcontractor, selectworkorder, selectworker, exportFormat);
			}
			break;
			
		case "Daily Summary":
			pom().contractorWorkerManagementPO().gotoDailySummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectcontractor = data.get("SelectContractor");
				String selectworkorder = data.get("SelectWorkerOrder");
				String selectworker = data.get("SelectWorkers");
				String exportFormat = data.get("ExportFormat");
				pom().dailySummaryReportPO().dailySummaryReport(fromDate, toDate, selectcontractor, selectworkorder, selectworker, exportFormat);
			}
			break;
			
		case "Daily Work Hours":
			pom().contractorWorkerManagementPO().gotoDailyWorkHoursReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectcontractor = data.get("SelectContractor");
				String selectworkorder = data.get("SelectWorkerOrder");
				String selectworker = data.get("SelectWorkers");
				String exportFormat = data.get("ExportFormat");
				pom().dailyWorkHoursReportPO().dailyWorkHoursReport(fromDate, toDate, selectcontractor, selectworkorder, selectworker, exportFormat);
			}
			break;
			
		case "Daily Head Count":
			pom().contractorWorkerManagementPO().gotoDailyHeadCountReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectcontractor = data.get("SelectContractor");
				String selectworkorder = data.get("SelectWorkerOrder");
				String exportFormat = data.get("ExportFormat");
				pom().dailyHeadCountReportPO().dailyHeadCountReport(fromDate, toDate, selectcontractor, selectworkorder, exportFormat);
			}
			break;
			
		case "Work Order Man Days":
			pom().contractorWorkerManagementPO().gotoWorkOrderManDaysReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectcontractor = data.get("SelectContractor");
				String selectworkorder = data.get("SelectWorkerOrder");
				String exportFormat = data.get("ExportFormat");
				pom().workOrderManDaysReportPO().workOrderManDaysReport(fromDate, toDate, selectcontractor, selectworkorder, exportFormat);
			}
			break;
			
		case "Blacklisted Workers":
			pom().contractorWorkerManagementPO().gotoBlackedlistWorkersReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectContractor: "+data.get("SelectContractor"));
				String selectcontractor = data.get("SelectContractor");
				String exportFormat = data.get("ExportFormat");
				pom().blackedlistWorkersReportPO().blackedlistWorkerReport(selectcontractor, exportFormat);
			}
			break;
			
		case "Work Order Details":
			pom().contractorWorkerManagementPO().gotoWorkOrderDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectContractor: "+data.get("SelectContractor")+" SelectWorkerOrder: "+data.get("SelectWorkerOrder"));
				String selectcontractor = data.get("SelectContractor");
				String selectworkorder = data.get("SelectWorkerOrder");
				String exportFormat = data.get("ExportFormat");
				pom().workOrderDetailsReportPO().workOrderDetialsReport(selectcontractor, selectworkorder, exportFormat);
			}
			break;
			
		case "Contractor Details":
			pom().contractorWorkerManagementPO().gotoContractorDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectContractor: "+data.get("SelectContractor"));
				String selectcontractor = data.get("SelectContractor");
				String exportFormat = data.get("ExportFormat");
				pom().contractorDetailsReportPO().contractorDetialsReport(selectcontractor, exportFormat);
			}
			break;
			
		case "Worker Details":
			pom().contractorWorkerManagementPO().gotoWorkerDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectContractor: "+data.get("SelectContractor")+" SelectWorkerOrder: "+data.get("SelectWorkerOrder"));
				String selectcontractor = data.get("SelectContractor");
				String selectworkorder = data.get("SelectWorkerOrder");
				String selectworker = data.get("SelectWorkers");
				String exportFormat = data.get("ExportFormat");
				pom().workerDetialsReportPO().workerDetialsReport(selectcontractor, selectworkorder, selectworker, exportFormat);
			}
			break;
		default:
			break;
		}
	}

}
