package PageObject.DeviceModule;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class DeviceModuleReportsPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(DeviceModuleReportsPO.class);
	
	public DeviceModuleReportsPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public PageObjectModel pom() {
		pom=new PageObjectModel(driver);
		return pom;
	}
	
	public void deviceModuleReport(String reportName, DataTable dataTable) throws Exception {
		switch(reportName) {
		
		case "Panel":
			pom().devicePO().gotoPanelReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().panelReportPO().panelReportPO(exportFormat);
			}
			break;
		
		case "Door":
			pom().devicePO().gotoDoorReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().doorReportPO().doorReport(exportFormat);
			}
			break;
		
		case "Invalid Events":
			pom().devicePO().gotoInvalidEventsReport();
			for(Map<String , String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("fromDate: "+data.get("fromDate")+" toDate: "+data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String selectDoors = data.get("SelectDoors");
				String exportFormat = data.get("ExportFormat");
				pom().invalidEventsReportPO().invalidEventsReport(fromDate, toDate, selectDoors, exportFormat);
			}
			break;
		
		case "Device-Wise Event":
			pom().devicePO().gotoDeviceWiseEventReport();
			for(Map<String , String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("fromDate: "+data.get("fromDate")+" toDate: "+data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String selectDoors = data.get("SelectDoors");
				String exportFormat = data.get("ExportFormat");
				pom().deviceWiseEventReportPO().deviceWiseEventReport(fromDate, toDate, selectDoors, exportFormat);
			}
			break;
		
		case "Door Offline":
			pom().devicePO().gotoDoorOfflineReport();
			for(Map<String , String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("fromDate: "+data.get("fromDate")+" toDate: "+data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String FilterDevices = data.get("FilterDevices");
				String exportFormat = data.get("ExportFormat");
				pom().doorOfflineReportPO().doorOfflineReport(fromDate, toDate, FilterDevices, exportFormat);
			}
			break;
			
		case "Intercom Events":
			pom().devicePO().gotoIntercomEventsReport();
			for(Map<String , String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("fromDate: "+data.get("fromDate")+" toDate: "+data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String exportFormat = data.get("ExportFormat");
				pom().intercomEventsReportPO().intercomEventReport(fromDate, toDate, exportFormat);
			}
			break;
			
		default:
			break;
		}
	}
	

}
