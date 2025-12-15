package stepDefinations;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonTestAbstract.TestContextObject;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;

public class PanelSD {
	TestContextObject testContextObject;
	private static Logger logger=LogManager.getLogger(PanelSD.class);
	
	public PanelSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@Given("Open Device Login Page")
	public void open_panel_login_page() throws Exception {
		logger.info("Open Device Login Page Started");
		// Write code here that turns the phrase above into concrete actions
		testContextObject.baseTest.goToDeviceURL();
		Thread.sleep(1000);
	}

	@Given("Device login with user")
	public void panel_login_with_user(DataTable dataTable) throws Exception {
		logger.info("Device login with user Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("password: "+data.get("password"));
			String value=testContextObject.pom.deviceWebpagePO().cosecDeviceLogin(data.get("username"), data.get("password"));
			if(data.get("password")!=null) {
			Assert.assertEquals(value, data.get("Validation"));
			}
		}
	}
	
	@Given("Door added in Door Configuration Page")
	public void door_added_in_door_configuration_page(DataTable dataTable)throws Exception {
		logger.info("Door added in Door Configuration Page Started");
		testContextObject.panel.panel200HomePO().goToDoorConfigurationPage();
		testContextObject.panel.panelDoorConfigurationPO().doorConfigure(dataTable);
		testContextObject.panel.panel200HomePO().clickOnDashboard();
	}
	
	@Given("Create Elevator in Elevator Configuration")
	public void create_elevator_in_elevator_configuration(DataTable dataTable) throws Exception {
		logger.info("Create Elevator in Elevator Configuration Started");
		testContextObject.panel.panel200HomePO().gotoElevatorConfiguration();
		//testContextObject.panel.panelElevatorConfigurationPO().elevatorConfiguration(dataTable);
		testContextObject.panel.panelElevatorConfigurationPO().elevatorConfigurationfetchinfFromExcel(dataTable);
		testContextObject.panel.panel200HomePO().clickOnDashboard();
	}
	
	@Given("Create Elevator floor group in Elevator Floor Group Page")
	public void create_elevator_floor_group_in_elevator_floor_group_page(DataTable dataTable) throws Exception {
		logger.info("Create Elevator floor group in Elevator Floor Group Page Started");
		// Write code here that turns the phrase above into concrete actions
		testContextObject.panel.panel200HomePO().gotoElevatorFloorGroup();
		//testContextObject.panel.panelElevatorFloorGroupPO().elevatorFloorGroup(dataTable);
		testContextObject.panel.panelElevatorFloorGroupPO().elevatorFloorGroupfetchinfFromExcel(dataTable);
		testContextObject.panel.panel200HomePO().clickOnDashboard();
	}

	@Then("Validate Url of VAPT for sheetName {string}")
	public void validate_url(String string, io.cucumber.datatable.DataTable dataTable) throws Exception{
		logger.info("Validate Url of VAPT for sheetName Started");
		String url=testContextObject.baseTest.deviceUrl;
		logger.debug("Url Link :"+url);
		testContextObject.pom.deviceWebpagePO().vapt(url,string,dataTable);
		
	}
	
	@Given("Create Elevator in Smart Elevator Elevator Access Control")
	public void create_Elevator_in_Smart_Elevator_Elevator_Access_Control(DataTable dataTable) throws Exception {
		logger.info("Create Elevator in Elevator Configuration Started");
		testContextObject.panel.panel200HomePO().gotoSmartElevatorConfiguration();
		//testContextObject.panel.panelElevatorConfigurationPO().elevatorConfiguration(dataTable);
		testContextObject.panel.elevatorFacilityPO().addElevatorFacility(dataTable);
		testContextObject.panel.panel200HomePO().clickOnDashboard();
	}
	
	@Given("Create Smart Elevator Flooe Group in Smart Elevator Elevator Access Control")
	public void create_Smart_Elevator_Flooe_Group_in_Smart_Elevator_Elevator_Access_Control(DataTable dataTable) throws Exception {
		logger.info("Create Elevator in Elevator Configuration Started");
		testContextObject.panel.panel200HomePO().gotoSmartElevatorFloorGroupConfiguration();
		//testContextObject.panel.panelElevatorConfigurationPO().elevatorConfiguration(dataTable);
		testContextObject.panel.smartElevatorFloorGroupPO().addSmartEleFlrGrp(dataTable);
		testContextObject.panel.panel200HomePO().clickOnDashboard();
	}

	
}
