package PageObject.CafeteriaManagement;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class CafeteriaManagementModuleReportPO  extends AbstractMethod{
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(CafeteriaManagementModuleReportPO.class);
	public CafeteriaManagementModuleReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public PageObjectModel pom() {
		pom=new PageObjectModel(driver);
		return pom;
	}
	
	
	public void cafeteriaManagementModuleReport(String reportName, DataTable dataTable) throws Exception {
		switch(reportName) {
		case "Items":
			pom().cafeteriaManagementPO().gotoItemsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat =  data.get("ExportFormat");
				pom().itemsReportPO().itemsReport(exportFormat);
			}
			break;
			
		case "Menu":
			pom().cafeteriaManagementPO().gotoMenuReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat =  data.get("ExportFormat");
				pom().menuReportPO().menuReport(exportFormat);
			}
			break;
		
		case "Menu Schedule":
			pom().cafeteriaManagementPO().gotoMenuScheduleReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectDoors: "+data.get("SelectDoors"));
				String selectDoor = data.get("SelectDoors");
				String exportFormat =  data.get("ExportFormat");
				pom().menuScheduleReportPO().menuScheduleReport(selectDoor, exportFormat);
			}
			break;
			
		case "Head Count":
			pom().cafeteriaManagementPO().gotoHeadCountReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String exportFormat = data.get("ExportFormat");
				pom().headCountReportPO().headCountReport(fromDate, toDate, exportFormat);
			}
			break;
			
		case "User Transactions":
			pom().cafeteriaManagementPO().gotoUserTransactionReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String groupBy = data.get("GroupBy");
				String selectUser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userTransactionReportPO().userTransactionReport(fromDate, toDate, groupBy, selectUser, exportFormat);
			}
			break;
			
		case "Users Account Details":
			pom().cafeteriaManagementPO().gotoUserAccountDetialsReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectUser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userAccountDetialsReportPO().userAccountDetialsReport(selectUser, exportFormat);
			}
			break;
		
		case "User Consumption":
			pom().cafeteriaManagementPO().gotoUserConsumptionReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDatev = data.get("ToDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userConsumptionReportPO().userConsumptionReport(fromDate, toDatev, selectuser, exportFormat);
			}
			break;
			
		case "Credit/Debit":
			pom().cafeteriaManagementPO().gotoCreditDebitReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().creditDebitReportPO().creditDebitReport(month, year, selectuser, exportFormat);
			}
			break;
			
		case "Blocked Users":
			pom().cafeteriaManagementPO().gotoBlockedUserReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().blockedUserReportPO().bloeckedUserReport(exportFormat);
			}
			break;
			
		case "User Pre-Order Details":
			pom().cafeteriaManagementPO().gotoUserPreOrderDetialReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String groupBy = data.get("GroupBy");
				String selectUser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userPreOrderDetialsReportPO().userPreOrderDetailsReport(fromDate, toDate, groupBy, selectUser, exportFormat);
			}
			break;
			
		case "Sales":
			pom().cafeteriaManagementPO().gotoSalesReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectUser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().salesReportPO().salesReport(fromDate, toDate, selectUser, exportFormat);
			}
			break;
			
		case "Device-Wise Consumption":
			pom().cafeteriaManagementPO().gotoDeviceWiseConsumptionReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String formatSelection = data.get("FormatSelection");
				String selectUser = data.get("SelectDevices");
				String exportFormat = data.get("ExportFormat");
				pom().deviceWiseConsumptionReportPO().deviceWiseConsumptionReport(fromDate, toDate, formatSelection, selectUser, exportFormat);
			}
			break;
			
		case "Item-Wise Consumption":
			pom().cafeteriaManagementPO().gotoItemWiseConsumptionReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String groupBy = data.get("GroupBy");
				String selectUser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().itemWiseConsumptionReportPO().itemWiseConsumptionReport(fromDate, toDate, groupBy, selectUser, exportFormat);
			}
			break;
			
		case "Daily Consumption":
			pom().cafeteriaManagementPO().gotoDailyConsumptionReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String groupBy = data.get("GroupBy");
				String selectUser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().dailyConsumptionReportPO().dailyConsumptionReport(fromDate, toDate, groupBy, selectUser, exportFormat);
			}
			break;
			
		case "Monthly Consumption":
			pom().cafeteriaManagementPO().gotoMonthlyConsumptionReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String gourpby = data.get("GroupBy");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().monthlyConsumptionReportPO().monthlyConsumptionReport(month, year, gourpby, selectuser, exportFormat);
			}
			break;
			
		case "Cafeteria Devices":
			pom().cafeteriaManagementPO().gotoCafeteriaDevicesReports();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().cafeteriaDevicesReportPO().cafeteriaDevicesReport(exportFormat);
			}
			break;
			
			
			
			
		default:
			break;
		}
	}

}
