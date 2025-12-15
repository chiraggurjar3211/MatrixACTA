package PageObject.FieldVisitManagement;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class FieldVisitManagementModuleReportPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(FieldVisitManagementModuleReportPO.class);
	public FieldVisitManagementModuleReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public PageObjectModel pom() {
		pom=new PageObjectModel(driver);
		return pom;
	}
	
	public void fieldVisitManagementModuleReport(String reportName, DataTable dataTable) throws Exception {
		switch(reportName) {
		case "Schedule Status Summary":
			pom().fieldVisitManagementPO().gotoScheduleStatusSummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+"ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().scheduleStatusSummaryReportPO().scheduleStatusSummaryReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;
			
		case "Field Visit Summary":
			pom().fieldVisitManagementPO().gotoFieldVisitSummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+"ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().fieldVisitSummaryReportPO().fieldVisitSummaryReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;
		
			
			
			
	   
	  default:
		  break;
		}
	}

}
