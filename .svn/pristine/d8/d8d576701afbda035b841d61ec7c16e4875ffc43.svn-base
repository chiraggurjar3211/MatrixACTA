package PageObject.AccessControlModule;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class AccessControlModuleReportPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(AccessControlModuleReportPO.class);
	
	public AccessControlModuleReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public PageObjectModel pom() {
		pom=new PageObjectModel(driver);
		return pom;
	}
	
	public void accessControlModuleReport(String reportName, DataTable dataTable) throws Exception {
		switch(reportName) {
		case "Access Zone":
			pom().accessControlPO().gotoAccessZoneReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectPanels: "+data.get("SelectPanels"));
				String exportFormat = data.get("ExportFormat");
				String selectPanels = data.get("SelectPanels");
				pom().accessZoneReportPO().accessZoneReport(selectPanels, exportFormat);
			}
			break;
		
		case "Time Zone":
			pom().accessControlPO().gotoTimeZoneReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().timeZoneReportPO().timeZoneReport(exportFormat);
			}
			break;
			
		case "Access Group":
			pom().accessControlPO().gotoAccessGroupReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().accessGroupReportPO().accessGroupReport(exportFormat);
			}
			break;
			
		case "Functional Group":
			pom().accessControlPO().gotoFunctionalGroupReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().functionalGroupReportPO().functionalGroupReport(exportFormat);
			}
			break;
			
		case "2-Person Group":
			pom().accessControlPO().gotoTwoPersonsGroupReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().twoPersonsGroupReportPO().twoPersonsGroupReport(exportFormat);
			}
			break;
			
		case "Access Group-Wise Time Zone":
			pom().accessControlPO().gotoAccessGroupWiseTimeZoneReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectAccessGroups: "+data.get("SelectAccessGroups"));
				String selectAccessGroup = data.get("SelectAccessGroups");
				String exportFormat = data.get("ExportFormat");
				pom().accessGroupWiseTimeZoneReportPO().accessGroupWiseTimeZoneReport(selectAccessGroup, exportFormat);
			}
			break;
			
		case "Input Port Group":
			pom().accessControlPO().gotoInputPortGroupReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectPanels: "+data.get("SelectPanels"));
				String selectPanel = data.get("SelectPanels");
				String exportFormat = data.get("ExportFormat");
				pom().inputPortGroupReportPO().inputPortGroupReport(selectPanel, exportFormat);
			}
			break;
			
		case "Output Port Group":
			pom().accessControlPO().gotoOutputPortGroupReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectPanels: "+data.get("SelectPanels"));
				String selectPanel = data.get("SelectPanels");
				String exportFormat = data.get("ExportFormat");
				pom().outputPortGroupReportPO().outputPortGroupReport(selectPanel, exportFormat);
			}
			break;
			
		case "Panels":
			pom().accessControlPO().gotoPanelsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectPanels: "+data.get("SelectPanels"));
				String selectPanel = data.get("SelectPanels");
				String exportFormat = data.get("ExportFormat");
				pom().panelsReportPO().panelsReport(selectPanel, exportFormat);
			}
			break;
		
		case "Direct Doors":
			pom().accessControlPO().gotoDirectDoorsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectDirectDoors: "+data.get("SelectDirectDoors"));
				String selectdirectDoor = data.get("SelectDirectDoors");
				String exportFormat = data.get("ExportFormat");
				pom().directDoorReportPO().directDoorsReport(selectdirectDoor, exportFormat);
			}
			break;
		
		case "First IN User":
			pom().accessControlPO().gotoFirstInUserReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectFirstInUserGroup: "+data.get("SelectFirstInUserGroup"));
				String selectFirstInUserGroup = data.get("SelectFirstInUserGroup");
				String exportFormat = data.get("ExportFormat");
				pom().firstInUserReportPO().firstInUserReport(selectFirstInUserGroup, exportFormat);
			}
			break;
		
		case "Zones Accessed by User":
			pom().accessControlPO().gotoZoneAccessedByUserReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectUser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().zoneAccessedByUserReportPO().zoneAccessedByUserReport(fromDate, toDate, selectUser, exportFormat);
			}
			break;
		
		case "2-Person Access":
			pom().accessControlPO().gotoTwoPersonAccessReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String selectDoor = data.get("SelectDoors");
				String exportFormat = data.get("ExportFormat");
				pom().twoPersonAccessReportPO().twoPersonAccessReport(fromDate, toDate, selectDoor, exportFormat);
			}
			break;
		
		case "Zone-Wise Who Is In":
			pom().accessControlPO().gotoZoneWiseWhoIsInReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectPanelZone: "+data.get("SelectPanelZone"));
				String selectPanelZone = data.get("SelectPanelZone");
				String exportFormat = data.get("ExportFormat");
				pom().zoneWiseWhoIsInReportPO().zoneWiseWhoIsIn(selectPanelZone, exportFormat);
			}
			break;
			
		case "Access Route-Wise Who Is In":
			pom().accessControlPO().gotoAccessRouteWiseWhoIsInReort();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectAccessRoute: "+data.get("SelectAccessRoute"));
				String selectAccessRoute = data.get("SelectAccessRoute");
				String exportFormat = data.get("ExportFormat");
				pom().accessRouteWiseWhoIsInReportPO().accessRouteWiseWhoIsInReport(selectAccessRoute, exportFormat);
			}
			break;
			
		case "Smart Access Route-Wise Who Is In":
			pom().accessControlPO().gotoSmartAccessRouteWiseWhoIsInReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectAccessRoute: "+data.get("SelectAccessRoute"));
				String selectAccessRoute = data.get("SelectAccessRoute");
				String exportFormat = data.get("ExportFormat");
				pom().smartAccessRouteWiseWhoIsInReportPO().smartAccessRouteWiseWhoIsInReport(selectAccessRoute, exportFormat);
			}
			break;
		
		case "Assigned Devices":
			pom().accessControlPO().gotoAssignedDevicesReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().assignedDevicesReportPO().assignedDevicesReport(selectUsers, exportFormat);
			}
			break;
			
		case "Guard Tour":
			pom().accessControlPO().gotoGuardTourReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().guardTourReportPO().guardTourReport(exportFormat);
			}
			break;
			
		case "Tour Details":
			pom().accessControlPO().gotoTourDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String todate = data.get("ToDate");
				String format = data.get("Format");
				String selectTours = data.get("SelectTours");
				String exportFormat = data.get("ExportFormat");
				pom().tourDetialsReportPO().tourDetialsReport(fromDate, todate, format, selectTours, exportFormat);
			}
			break;
			
		case "Access Route Master":
			pom().accessControlPO().gotoAccessRouteMaterReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectPanel: "+data.get("SelectPanel")+" SelectAccessRoute: "+data.get("SelectAccessRoute"));
				String selectPanel = data.get("SelectPanel");
				String selectAccessRoute = data.get("SelectAccessRoute");
				String exportFormat = data.get("ExportFormat");
				pom().accessRouteMasterReportPO().accessRouteMasterReport(selectPanel, selectAccessRoute, exportFormat);
			}
			break;
			
		case "Elevator Access Report":
			pom().accessControlPO().gotoElevatorAccessReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String todate = data.get("ToDate");
				String selectElevator = data.get("SelectElevator");
				String exportFormat = data.get("ExportFormat");
				pom().elevatorAccessReportPO().elevatorAccessReport(fromDate, todate, selectElevator, exportFormat);
			}
			break;
			
		case "Elevator Floor Group Master":
			pom().accessControlPO().gotoElevatorFloorGroupMasterReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectElevatorFloorGroup: "+data.get("SelectElevatorFloorGroup")+" GenerateReportFor: "+data.get("GenerateReportFor"));
				String selectElevatorFloorGroup = data.get("SelectElevatorFloorGroup");
				String generateReportFor = data.get("GenerateReportFor");
				String exportFormat = data.get("ExportFormat");
				pom().elevatorFloorGroupMasterReportPO().elevatorFloorGroupMasterReport(selectElevatorFloorGroup, generateReportFor, exportFormat);
			}
			break;
			
		case "Door Held Open":
			pom().accessControlPO().gotoDoorHeldOpenReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String todate = data.get("ToDate");
				String exportFormat = data.get("ExportFormat");
				pom().doorHeldOpenReportPO().doorHeldReport(fromDate, todate, exportFormat);
			}
			break;
		
		case "Alarm Details":
			pom().accessControlPO().gotoAlarmDetialsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String todate = data.get("ToDate");
				String selectDevices = data.get("SelectDevices");
				String exportFormat = data.get("ExportFormat");
				pom().alarmDetailsReportPO().alarmDetialsReport(fromDate, todate, selectDevices, exportFormat);
			}
			break;
			
		case "Emergency Evacuation":
			pom().accessControlPO().gotoEmergencyEvacuationReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate"));
				String fromDate = data.get("FromDate");
				String todate = data.get("ToDate");
				String userType = data.get("UserType");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().emergencyEvacuationReportPO().emergencyEvacuationReport(fromDate, todate, userType, selectUsers, exportFormat);
			}
			break;
		
	    default:
	    	break;
		}
	}
	

}
