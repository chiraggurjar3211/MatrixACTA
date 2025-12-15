package PageObject.LeaveManagement;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class LeaveModuleReportsPO extends AbstractMethod{
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(LeaveModuleReportsPO.class);
	
	public LeaveModuleReportsPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	public PageObjectModel pom() {
		pom=new PageObjectModel(driver);
		return pom;
	}
	
	public void leaveModuleReport(String reportName, DataTable dataTable) throws Exception {
		switch(reportName) {
		case "Monthly Leave Details":
			pom().leaveManagementPO().gotoMonthlyLeaveDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().monthlyLeaveDetialsReportPO().monthlyLeaveDetialsReport(month, year, selectUsers, exportFormat);
			}
			break;
			
		case "C-OFF Register":
			pom().leaveManagementPO().gotoCoffRegisterReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().coffRegisterReportPO().coffRegisterReport(fromDate, toDate, selectUsers, exportFormat);
			}
			break;
			
		case "Leave Register":
			pom().leaveManagementPO().gotoLeaveRegisterReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Period: "+data.get("Period")+" Year: "+data.get("Year"));
				String period = data.get("Period");
				String year  = data.get("Year");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().leaveRegisterReportPO().leaveRegisterReport(period, year, selectUsers, exportFormat);
			}
			break;
				
		case "Leave":
			pom().leaveManagementPO().gotoLeaveReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().leaveReportPO().leaveReport(exportFormat);
			}
			break;
			
		case "Leave Group":
			pom().leaveManagementPO().gotoLeaveGroupReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().leaveGroupReportPO().leaveGroupReport(exportFormat);
			}
			break;
			
		case "Leave Application":
			pom().leaveManagementPO().gotoLeaveApplicationReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ReportName: "+reportName+" FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String groupBy = data.get("GroupBy");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().leaveApplicationReportPO().leaveApplicationReport(fromDate, toDate, groupBy, selectUsers, exportFormat);
			}
			break;
			
		case "Leave Encashment":
			pom().leaveManagementPO().gotoLeaveEncashmentReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Period: "+data.get("Period")+" Year: "+data.get("Year"));
				String period = data.get("Period");
				String year = data.get("Year");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().leaveEncashmentReportPO().leaveEncashmentReport(period, year, selectUsers, exportFormat);
			}
			break;
			
		case "Leave  Credit/Debit":
			pom().leaveManagementPO().gotoLeaveCreditDebitReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Period: "+data.get("Period")+" Year: "+data.get("Year"));
				String period = data.get("Period");
				String year = data.get("Year");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().leaveCreditDebitReportPO().leaveCreditDebitReport(period, year, selectUsers, exportFormat);
			}
			break;
			
		case "Form B":
			pom().leaveManagementPO().gotoFormBReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Year: "+data.get("Year"));
				String year = data.get("Year");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().formBReportPO().formBReport(year, selectUsers, exportFormat);
			}
			break;
			
		case "Form 15":
			pom().leaveManagementPO().gotoForm15Report();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Year: "+data.get("Year"));
				String year = data.get("Year");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().form15ReportPO().form15Report(year, selectUsers, exportFormat);
			}
			break;
			
		case "Form Q":
			pom().leaveManagementPO().gotoFormQReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String header= data.get("Header");
				String subHeader = data.get("SubHeader");
				String leftAlignLabel = data.get("LeftAlignLabel");
				String footer = data.get("Footer");
				String leave = data.get("LeaveId");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().formQReportPO().formQReport(month, year, header, subHeader, leftAlignLabel, footer, leave, selectUsers, exportFormat);
				
			}
			break;
			
			
			default:
				break;
		}
	}

}
