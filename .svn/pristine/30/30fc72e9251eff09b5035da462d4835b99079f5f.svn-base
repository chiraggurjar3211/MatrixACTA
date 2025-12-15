package PageObject.ShiftAndSchedule;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class ShiftScheduleModuleReportPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(ShiftScheduleModuleReportPO.class);
	
	public ShiftScheduleModuleReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public PageObjectModel pom() {
		pom=new PageObjectModel(driver);
		return pom;
	}
	
	public void ShiftScheduleModuleReport(String reportName, DataTable dataTable) throws Exception {
		switch(reportName) {
		case "Shift":
			pom().shiftAndSchedulePO().gotoShiftReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
			pom().shiftReportPO().shiftReport(exportFormat);
			}
			break;
		
		case "Schedule Groups":
			pom().shiftAndSchedulePO().gotoScheduleGroupsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().scheduleGroupsReportPO().scheduleGroupsReport(exportFormat);
			}
			break;
			
		case "Holiday Schedules":
			pom().shiftAndSchedulePO().gotoHolidayScheduleReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectSchedules: "+data.get("SelectSchedules"));
				String selectSchedules= data.get("SelectSchedules");
				String exportFormat = data.get("ExportFormat");
				pom().holidayScheduleReportPO().holidayScheduleReport(selectSchedules, exportFormat);
			}
			break;
		
		case "Shift Schedule":
			pom().shiftAndSchedulePO().gotoShiftScheduleReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectUser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().shiftScheduleReportPO().shiftScheduleReport(month, year, selectUser, exportFormat);
			}
			break;
			
		case "Week-Off Change":
			pom().shiftAndSchedulePO().gotoWeekOffChangeReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromdate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String Selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().weekOffChangeReportPO().weekOffChangeReport(fromdate, toDate, Selectuser, exportFormat);
			}
			break;
		
		default:
			break;
		
		}
	}

}
