package PageObject.JobProcessingCosting;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class JobProcessingCostingModuleReportPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(JobProcessingCostingModuleReportPO.class);
	
	public JobProcessingCostingModuleReportPO(WebDriver driver) {
		super(driver);
		this.driver  = driver;
		PageFactory.initElements(driver, this);
	}
	
	public PageObjectModel pom() {
		pom=new PageObjectModel(driver);
		return pom;
	}
	
	public void jobProcessingCostingModuleReport(String reportName, DataTable dataTable) throws Exception {
		switch(reportName) {
		case "Job Summary":
			pom().jobProcessingCostingPO().gotoJobSummaryReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectjob = data.get("SelectJobs");
				String exportFormat = data.get("ExportFormat");
				pom().jobSummaryReportPO().jobSummaryReport(fromDate, toDate, selectjob, exportFormat);
			}
			break;
			
		case "Phase Summary":
			pom().jobProcessingCostingPO().goToPhaseSummary();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectphase = data.get("SelectPhases");
				String exportFormat = data.get("ExportFormat");
				pom().phaseSummaryReportPO().phaseSummaryReport(fromDate, toDate, selectphase, exportFormat);
			}
			break;
			
		case "Project Summary":
			pom().jobProcessingCostingPO().goToProjectSummary();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectproject = data.get("SelectProjects");
				String exportFormat = data.get("ExportFormat");
				pom().projectSummaryReportPO().projectSummaryReport(fromDate, toDate, selectproject, exportFormat);
			}
			break;
			
		case "Transaction-Wise Hours Summary":
			pom().jobProcessingCostingPO().gotoTrasactionWiseHourSummaryReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().transactionWiseHoursSummaryReportPO().transactionWiseHoursSummaryReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;
			
		case "Daily Job Details":
			pom().jobProcessingCostingPO().gotoDailyJobDetialsReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().dailyJobDetailsReportPO().dailyJobDetailsReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;
			
		case "Monthly Job Details":
			pom().jobProcessingCostingPO().gotoMonthlyJobDetialsReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().monthlyJobDetailsReportPO().monthlyJobDetailsReport(month, year, selectuser, exportFormat);
			}
			break;
			
		case "Job Transactions":
			pom().jobProcessingCostingPO().gotoJobTrasactionReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String groupby = data.get("GroupBy");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().jobTransactionsReportPO().jobTransactionReport(fromDate, toDate, groupby, selectuser, exportFormat);
			}
			break;
	 
			
		case "User Job Details":
			pom().jobProcessingCostingPO().goToUserJobDetails();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userJobDetailsReportPO().userJobDetailsReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;
			
			
			
	   default:
		   break;
		}
	}

}
