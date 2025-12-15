package stepDefinations;

import java.io.IOException;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonTestAbstract.TestContextObject;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class AccessControlSD {
	
	TestContextObject testContextObject;
	String product = null;
	String taskSchedulerName = null;
	private static Logger logger=LogManager.getLogger(AccessControlSD.class);
	
	public AccessControlSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}
	
	//Kamal
	@When("{string} Access Control module reports configuration")
	public void report_configuration(String string , DataTable datatable) throws Exception {
		logger.info("Access Control module reports configuration Started");
		testContextObject.pom.homePO().goTOAccessControlModule();
		testContextObject.pom.accessControlModuleReportPO().accessControlModuleReport(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	// Mayank
	@Given("Create Elevator in Elevator Configuration from access module for panelname {string}")
	public void create_elevator_in_elevator_configuration_from_access_module_for_panelname(String panel, io.cucumber.datatable.DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Create Elevator in Elevator Configuration from access module Started");
		testContextObject.pom.homePO().goTOAccessControlModule();
		testContextObject.pom.accessControlPO().gotoElevatorConfigurationPage();
			testContextObject.pom.elevatorConfigurationPO().createElevator(dataTable, panel);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	
	@Given("Create Elevator Floor group from access module")
	public void create_elevator_floor_group_from_access_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Create Elevator Floor group from access module Started");
		testContextObject.pom.homePO().goTOAccessControlModule();
		testContextObject.pom.accessControlPO().gotoElevatorFloorGroupPage();
			testContextObject.pom.elevatorFloorGroupPO().createFloorGroup(dataTable);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}
	
	//Chhaya
	@Given("Delete Access Profile from Access Control Module")
	public void delete_access_profile_from_access_control_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Access Profile Group Started");
		testContextObject.pom.homePO().goTOAccessControlModule();
		testContextObject.pom.accessControlPO().gotoAccessProfilePage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Access Profile Name: "+data.get("AcsProflName"));
			String acsProflName = data.get("AcsProflName");
			testContextObject.pom.accessProfilePO().deleteAccessProfile(acsProflName);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Create Access Profile from Access Profile Page")
	public void create_access_profile_from_access_profile_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Access Profile Started");
		testContextObject.pom.homePO().goTOAccessControlModule();
		testContextObject.pom.accessControlPO().gotoAccessProfilePage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Access Profile Name: "+data.get("AcsProflName"));
			String acsProflName = data.get("AcsProflName");
			String workHrs = data.get("WorkHrs");
			String breakHrs = data.get("BreakHrs");
			String nonWorkingHrs = data.get("Non-WorkingHrs");
			String validation = data.get("Validation");
			testContextObject.pom.accessProfilePO().createAccessProfile(acsProflName, workHrs, breakHrs, nonWorkingHrs, validation);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Add Elevator Facility Configuration")
	public void add_elevator_facility_configuration(io.cucumber.datatable.DataTable dataTable)  throws Exception{
		logger.info("Add Elevator Facility Configuration started");
		testContextObject.pom.homePO().goTOAccessControlModule();
		testContextObject.pom.accessControlPO().goToElevatorFacilityConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.elevatorFacilityConfigurationPO().addElevatorFacilityConfiguration(data);	
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Add Smart Elevator Floor Group configuration")
	public void add_smart_elevator_floor_group_configuration(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Add Smart Elevator Floor Group configuration started");
		testContextObject.pom.homePO().goTOAccessControlModule();
		testContextObject.pom.accessControlPO().goToSmartElevatorFloorGroup();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.smartElevatorFloorGroupPO().addSmartElevatorFloorGroup(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//Aagam
	@Given("Add Smart Access Route")
	public void add_smart_access_route(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Add Smart Access Route Started");
		testContextObject.pom.homePO().goTOAccessControlModule();
		testContextObject.pom.accessControlPO().goToSmartAccessRoute();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.smartAccessRoutePO().createSmartAccessRoute(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	
	@Given("Create Maximum Two person Group in Access Control module")
	public void create_maximum_two_person_group_in_cafeteria_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Create Maximum Two person Group in Access Control module Started");
		testContextObject.pom.homePO().goTOAccessControlModule();
		testContextObject.pom.accessControlPO().goToTwoPersonGroupPage();
		testContextObject.pom.abstractMethod().pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			int maxGroupCount = Integer.parseInt(data.get("GroupCount"));
			for (int i = 1; i < maxGroupCount+1; i++) {
				String formattedI = String.format("%04d", i);
//				String url = "set;id=2Puser" + formattedI + ";name=2Puser" + formattedI + ";Attendance-calc=1;ess-login=1";
//				String exResponse1 = "success: 0070200001 : saved successfully. User ID = 2Puser"+formattedI;
//				String res = testContextObject.baseTest.setAPI(url, "sa", "admin", "user", 200);
//				Assert.assertEquals(res, exResponse1);
				testContextObject.pom.twoPersonGroupPO().createMaxGroups(data,formattedI);
			}
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Create Maximum First IN User Group in Access Control module")
	public void create_maximum_first_in_user_group_in_access_control_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Maximum First IN User Group in Access Control module Started");
		testContextObject.pom.homePO().goTOAccessControlModule();
		testContextObject.pom.accessControlPO().goToFirstInUserGroupPage();
		testContextObject.pom.abstractMethod().pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			int maxGroupCount = Integer.parseInt(data.get("GroupCount"));
			for (int i = 1; i < maxGroupCount+1; i++) {
				String formattedI = String.format("%02d", i);
				String url = "set;id=FInUser" + formattedI + ";name=FInUser" + formattedI + ";Attendance-calc=1;ess-login=1";
				String exResponse1 = "success: 0070200001 : saved successfully. User ID = FInUser"+formattedI;
				String res = testContextObject.baseTest.setAPI(url, "sa", "admin", "user", 200);
				Assert.assertEquals(res, exResponse1);
				testContextObject.pom.firstInUserPO().createMaxGroups(data,formattedI);
			}
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Assign Max 999 users in First IN User group {string}")
	public void assign_max_users_in_first_in_user_group(String grpName) throws InterruptedException {
		logger.info("Create Maximum First IN User Group in Access Control module Started");
		testContextObject.pom.homePO().goTOAccessControlModule();
		testContextObject.pom.accessControlPO().goToFirstInUserGroupPage();
		testContextObject.pom.firstInUserPO().assignMaxUsers(grpName);
		testContextObject.pom.systemAccountPO().homeButtonClick();
		
	}
	
	
}
