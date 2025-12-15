package PageObject.VisitorManagement;

import java.util.Map;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class VisitorManagementModuleReportPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	public VisitorManagementModuleReportPO(WebDriver driver) {
		super(driver);
		this.driver =driver;
		PageFactory.initElements(driver, this);
	}
	public PageObjectModel pom() {
		pom=new PageObjectModel(driver);
		return pom;
	}
	
	public void visitorManagementModuleReport(String reportName, DataTable dataTable) throws Exception {
		switch(reportName) {
		case "Visitor Punch":
			pom().visitorManagementPO().gotoVisitorPunchReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectDoor = data.get("SelectDoors");
				String exportFormat = data.get("ExportFormat");
				pom().visitorPunchReportPO().visitorPunchReport(fromDate, toDate, selectDoor, exportFormat);
			}
			break;
			
		case "Visitor Punch Detail":
			pom().visitorManagementPO().gotoVisitorPunchDetialReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String exportFormat = data.get("ExportFormat");
				pom().visitorPunchDetialReportPO().visitorPunchDetialReport(fromDate, toDate, exportFormat);
			}
			break;
			
		case "Visitor Punch Exception":
			pom().visitorManagementPO().gotoVisitorPunchExecptionReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String exportFormat = data.get("ExportFormat");
				pom().visitorPunchExceptionReportPO().visitorPunchExceptionReport(fromDate, toDate, exportFormat);
			}
			break;
			
		case "Visitor Enrollment Status":
			pom().visitorManagementPO().gotoVisitorEnrollmnetStatusReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String selectVisitor = data.get("SelectVisitors");
				String exportFormat = data.get("ExportFormat");
				pom().visitorEnrollmentStatusReportPO().visitorEnrollmentStatusReport(selectVisitor, exportFormat);
			}
			break;
			
		case "Panel-Wise Visitor":
			pom().visitorManagementPO().gotoPanelWiseVisitorReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String exportFormat = data.get("ExportFormat");
				pom().panelWiseVisitorReportPO().panelWiseVisitorReport(exportFormat);
			}
			break;
			
		case "Visitor Access Denied":
			pom().visitorManagementPO().gotoVisitorAccessDeniedReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectVisitor = data.get("SelectVisitors");
				String exportFormat = data.get("ExportFormat");
				pom().visitorAccessDeniedReportPO().visitorAccessDeniedReport(fromDate, toDate, selectVisitor, exportFormat);
			}
			break;
			
		case "Visitor Pass Validity":
			pom().visitorManagementPO().gotoVisitorPassValidityReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String date = data.get("Date");
				String time = data.get("Time");
				String exportFormat = data.get("ExportFormat");
				pom().visitorPassValidityReportPO().visitorPassValidityReport(date, time, exportFormat);
			}
			break;
			
		case "Visitor Pass Status":
			pom().visitorManagementPO().gotoVisitorPassStatusReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String date = data.get("Date");
				String exportFormat = data.get("ExportFormat");
				pom().visitorPassStatusReportPO().visitorPassStatusReport(date, exportFormat);
			}
			break;
			
		case "Expired Passes":
			pom().visitorManagementPO().gotoExpiredPassesReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String exportFormat = data.get("ExportFormat");
				pom().expiredPassReportPO().expiredPassReport(fromDate, toDate, exportFormat);
			}
			break;
			
		case "Visitor Watchlist/Blacklist":
			pom().visitorManagementPO().gotoVisitorWatchBlackListReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String exportFormat = data.get("ExportFormat");
				pom().visitorWatchlistBlacklistReportPO().visitorWatchlistBlacklistReport(exportFormat);
			}
			break;
			
		case "Pre-Registered Visitors":
			pom().visitorManagementPO().gotoPreRegisterVisitorsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String exportFormat = data.get("ExportFormat");
				pom().preregisterVisitorReportPO().preregisteredVisitorReport(fromDate, toDate, exportFormat);
			}
			break;
			
		case "Visitor History":
			pom().visitorManagementPO().gotoVisitorHistoryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectUser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().visitorHistoryReportPO().vistorHistoryReport(fromDate, toDate, selectUser, exportFormat);
			}
			break;
			
		case "Visitor Head Count":
			pom().visitorManagementPO().gotoVisitorHeadCountReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectVisitor = data.get("SelectVisitors");
				String exportFormat = data.get("ExportFormat");
				pom().visitorHeadCountReportPO().visitorHeadCountReport(fromDate, toDate, selectVisitor, exportFormat);
			}
			break;
			
		case "Visitor Evacuation":
			pom().visitorManagementPO().gotoVisitorEvacuationReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String time = data.get("Time");
				String selectVisitor = data.get("SelectVisitors");
				String exportFormat = data.get("ExportFormat");
				pom().visitorEvacuationReportPO().visitorEvacuationReport(fromDate, toDate, time, selectVisitor, exportFormat);
			}
			break;
			
			
		default:
			break;
		}
	}

}
