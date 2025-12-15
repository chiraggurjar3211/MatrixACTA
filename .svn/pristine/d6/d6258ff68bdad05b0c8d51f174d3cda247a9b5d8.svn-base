package stepDefinations;

import static io.restassured.RestAssured.given;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import CommonTestAbstract.BaseTest;
import CommonTestAbstract.TestContextObject;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;

public class UserSD {
	TestContextObject testContextObject;
	public Properties prop;
	private static Logger logger=LogManager.getLogger(UserSD.class);
	
	public UserSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@Given("Create user from user configuration")
	public void create_user_from_user_configuration(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create user from user configuration Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: "+data.get("userid"));
			Thread.sleep(1000);
			testContextObject.pom.userConfigurationPO().createUser(columnHeader, data);
			testContextObject.pom.userConfigurationPO().reloadPageButtonClick();
			Thread.sleep(1000);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@And("^Delete User \"([^\"]*)\" from database$")
	public void delete_user_something_from_database(String strArg1) throws Throwable {
		logger.info("Delete User from database Started");
		String query = "delete from  Mx_UserMst where UPPER(userid)=UPPER('" + strArg1 + "')";
		int deleteRecordNulber = testContextObject.baseTest.updateORDeleteDatabase(query);
	}

	@Given("Delete user from user configuration page")
	public void delete_user_from_user_configuration_page(DataTable dataTable) throws Throwable {
		logger.info("Delete user from user configuration page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			testContextObject.pom.userConfigurationPO().deleteUser(data.get("UserID"));
			// V20R9.1 Mayank
//			// N Punch User Attendance correction data is not deleted from this table -Resolved in V20R7.1
//			String query1 = "delete from Mx_AtdCorrectionDetail where UPPER(UserID)=upper('" + data.get("UserID") + "')";
//			testContextObject.baseTest.updateORDeleteDatabase(query1);
//			// Adjusted OT data is not deleted from this table -Resolved in V20R8.1
//			String query2 = "delete from Mx_OverTimeTrn where UPPER(UserID)=upper('" + data.get("UserID") + "')";
//			testContextObject.baseTest.updateORDeleteDatabase(query2);
//			String query3 = "delete from Mx_OverTimeTrnbak where UPPER(UserID)=upper('" + data.get("UserID") + "')";
//			testContextObject.baseTest.updateORDeleteDatabase(query3);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Delete user via API")
	public void delete_user_via_api(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete user via API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String url = "delete;id=" + data.get("UserID") + ";";
			String username = "sa";
			String password = "admin";
			String apiName = "user";
			// Second one is for if user is not exist in server
			String exResponse1 = "success: 0070400001 : successful";
			String exResponse2 = "failed: 0070401004 : Insufficient User rights or Inactive User(s) or ID(s) does not exist.";
			String res = testContextObject.baseTest.setAPI(url, username, password, apiName, 200);
			boolean val = false;
			if (res.equals(exResponse1) || res.equals(exResponse2)) {
				val = true;
			} else {
				val = false;
				logger.debug(res);
			}
			// V20R9.1 Mayank
//			// N Punch User Attendance correction data is not deleted from this table -Resolved in V20R7.1
//			String query1 = "delete from Mx_AtdCorrectionDetail where UPPER(UserID)=upper('" + data.get("UserID") + "')";
//			testContextObject.baseTest.updateORDeleteDatabase(query1);
//			// Adjusted OT data is not deleted from this table -Resolved in V20R8.1
//			String query2 = "delete from Mx_OverTimeTrn where UPPER(UserID)=upper('" + data.get("UserID") + "')";
//			testContextObject.baseTest.updateORDeleteDatabase(query2);
//			String query3 = "delete from Mx_OverTimeTrnbak where UPPER(UserID)=upper('" + data.get("UserID") + "')";
//			testContextObject.baseTest.updateORDeleteDatabase(query3);
			Thread.sleep(1000);
			Assert.assertEquals(val, true);
		}
	}

	@Given("Create Reporting Group")
	public void create_reporting_group(DataTable dataTable) throws Throwable {
		logger.info("Create Reporting Group Started");
		// Write code here that turns the phrase above into concrete actions
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToReportingGroup();
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ReportingGroupId: "+data.get("ReportingGroupId"));
			String reportingGroupId = data.get("ReportingGroupId");
			String policyId = data.get("PolicyId");
			String policyName = data.get("PolicyName");
			String ric1 = data.get("RIC1");
			String ric2 = data.get("RIC2");
			String ric3 = data.get("RIC3");
			String ric4 = data.get("RIC4");
			String ric5 = data.get("RIC5");
			String validation = data.get("Validation");
			Thread.sleep(1000);
			String val = testContextObject.pom.reportingGroupPO().createReportingGroup(reportingGroupId, policyId,
					policyName, ric1, ric2, ric3, ric4, ric5);
			Thread.sleep(1000);
			Assert.assertEquals(val, validation);
		}
		testContextObject.pom.reportingGroupPO().homeButtonClick();
	}

	@Given("Assign groups to user from user configuration")
	public void assign_groups_to_user_from_user_configuration(DataTable dataTable) throws Throwable {
		logger.info("Assign groups to user from user configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String userID = data.get("UserID");
			String reportingGroup = data.get("ReportingGroup");
			String approvalPolicy = data.get("ApprovalPolicy");
			String leaveGroup = data.get("LeaveGroup");
			String weekOffGroup = data.get("WeekOffGroup");
			String validation = data.get("Validation");
			String validationMsg = testContextObject.pom.userConfigurationPO().groupAssignToUser(userID, reportingGroup,
					approvalPolicy, leaveGroup, weekOffGroup, data);
			Assert.assertEquals(validationMsg, validation);
		}
		testContextObject.pom.reportingGroupPO().homeButtonClick();
	}

	@Given("Assign users to device from API")
	public void assign_users_to_device_from_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Assign users to device from API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("Userid"));
			String url = "assign;device=all;id=" + data.get("Userid") + ";";
			String username = "sa";
			String password = "admin";
			String apiName = "device";
			String exResponse = "success: 0080600002 : successful";
			String res = testContextObject.baseTest.setAPI(url, username, password, apiName, 200);
			Assert.assertEquals(res, exResponse);
		}
	}

	@When("Generate User Event {string} times for User via API")
	public void generate_user_event_times_for_user_via_api(String eventCount, io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException, IOException {
		logger.info("Generate User Event for User via API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			Integer eventCountInt = Integer.parseInt(eventCount);
			String globalPropertiesFilePath = System.getProperty("user.dir")
					+ "\\src\\test\\resources\\global.properties";
			FileInputStream fis = new FileInputStream(globalPropertiesFilePath);
			prop = new Properties();
			prop.load(fis);
			for (int i = 0; i < eventCountInt; i++) {
				// RestAssured.baseURI="http://"+data.get("DeviceIP");
				String deviceUrl = System.getProperty("deviceurl") != null ? System.getProperty("deviceurl")
						: prop.getProperty("deviceurl");
				RestAssured.baseURI = deviceUrl;
				String res = given().log().all().queryParams("action", "set").queryParams("user-id", data.get("UserID"))
						.queryParams("Name", data.get("UserID")).queryParams("operation", "2").auth()
						.basic("admin", "1234").urlEncodingEnabled(false).when().post("device.cgi/verify-open-door")
						.then().log().all().assertThat().statusCode(200).extract().response().asString(); // body("success",equalTo("0210200001
																											// :
																											// successful"));
				Thread.sleep(1000);
				Assert.assertEquals(res, "Response-Code=0\r\n" + "\r\n");
			}
		}
	}

	// User configuration API
	@Given("Create User via api")
	public void create_user_via_api(DataTable dataTable) {
		logger.info("Create User via api Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Id: "+data.get("Id"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.userConfigurationPO().userAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			// logger.debug(userParameter);
			String userID = data.get("Id");
			String apiResponseValidation = "success: 0070200001 : saved successfully. User ID = " + userID;
			String res = testContextObject.baseTest.setAPI(userParameter, "sa", "admin", "user", 200);
			Assert.assertEquals(res, apiResponseValidation);
		}
	}

	@Given("Set event via Event Set API")
	public void set_event_via_event_set_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Set event via Event Set API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("Userid")+" event-date: "+data.get("event-date")+" event-time: "+data.get("event-time"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.userConfigurationPO().userEventsAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userEventsParameter = builder.toString();
			String apiResponseValidation = "success: 0210200001 : successful";
			String res = testContextObject.baseTest.setAPI(userEventsParameter, "sa", "admin", "events", 200);
			Assert.assertEquals(res, apiResponseValidation);
		}

	}

	@Given("ESS Roles and Rights set from User Module")
	public void ess_roles_and_rights_set_from_user_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("ESS Roles and Rights set from User Module Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToESSRolesRights();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("PageRights: "+data.get("PageRights"));
			boolean value1 = Boolean.parseBoolean(data.get("value"));
			String val = testContextObject.pom.eSSRolesAndRightsPO().essRolesRightsSet(data.get("PageRights"), value1);
			Assert.assertEquals(val, "Saved Successfully");
		}
		testContextObject.pom.reportingGroupPO().homeButtonClick();
	}

	@Given("Declare Temperature and Symptoms for Self Declaration of ESSUser from API")
	public void declare_temperature_and_symptoms_for_self_declaration_of_ess_user_from_api(
			io.cucumber.datatable.DataTable dataTable) {
		logger.info("Declare Temperature and Symptoms for Self Declaration of ESSUser from API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String declarationdate = testContextObject.pom.abstractMethod()
					.dateSelectedinddMMyyyy(data.get("declaration-date"));
			String url = "set;userid=" + data.get("UserID") + ";declaration-date=" + declarationdate + ";temperature="
					+ data.get("Temperature") + ";symptoms=" + data.get("Symptoms") + ";source=2";
			String username = data.get("UserID");
			String password = "admin";
			String apiName = "health-declaration";
			String exResponse = "success: 1160200002 : saved successfully.";
			String res = testContextObject.baseTest.setAPI(url, username, password, apiName, 200);
			Assert.assertEquals(res, exResponse);
		}
	}

	@When("Generate Password via API")
	public void generate_password_via_api(io.cucumber.datatable.DataTable table) {
		logger.info("Generate Password via API Started");
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String databaseFetchingQuery = "select IMEINo from Mx_UserMst where UserID='" + data.get("UserID") + "'";
			String imei = testContextObject.baseTest.getDataFDatabase(databaseFetchingQuery);
			String dob = testContextObject.pom.abstractMethod().daysMonthYear1999forDOB(data.get("BirthDate"));
			String url = "set;userid=" + data.get("UserID") + ";birthdate=" + dob + ";imei=" + imei;
			String username = "MatrixAdmin";
			String password = "admin";
			String apiName = "generate-password";
			String exResponse = "success: 0570200003 : Password generate successfully";
			String res = testContextObject.baseTest.setAPI(url, username, password, apiName, 200);
			Assert.assertEquals(res, exResponse);
		}
	}

	// T&A Policy assign to user
	@Given("Assign policy to user")
	public void assign_policy_to_user(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Assign policy to user Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String userID = data.get("UserID");
			String attendancePlc = data.get("AttendancePlc");
			String absenteePlc = data.get("AbsenteePlc");
			String overtimePlc = data.get("OvertimePlc");
			String lateInPlc = data.get("LateInPlc");
			String earlyOutPlc = data.get("EarlyOutPlc");
			String coffPlc = data.get("CoffPlc");
			String validation = data.get("Validation");
			String validationMsg = testContextObject.pom.userConfigurationPO().policyAssignToUser(userID, attendancePlc,
					absenteePlc, overtimePlc, lateInPlc, earlyOutPlc, coffPlc);
			Assert.assertEquals(validationMsg, validation);
		}
		testContextObject.pom.reportingGroupPO().homeButtonClick();
	}
	
	//////////////// ***********************************************//////////////////
	///////////// Report Related CODE start Here/////////////////////////////
	//////////////// ***********************************************//////////////////

	@When("{string} user module reports configuration")
	public void report_configuration(String string, DataTable dataTable) throws Exception {
		logger.info(string+" user module reports configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userModuleReportsPO().userModuleReport(string, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//////////////// ***********************************************//////////////////
	///////////// Report Related CODE End Here/////////////////////////////
	//////////////// ***********************************************//////////////////
	// Mayank
	@Then("Verify User in User Configuration Page")
	public void verify_user_in_user_configuration_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify User in User Configuration Page Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			testContextObject.pom.homePO().goTOUserModule();
			testContextObject.pom.userPO().goToUserConfiguration();
			testContextObject.pom.userConfigurationPO().verifyUserFromUserConfig(columnHeader, data);
			testContextObject.pom.userConfigurationPO().homeButtonClick();
		}
	}

	// Mayank
	@Then("UserID field Editable or not in User Configuration page while add user")
	public void user_id_field_editable_or_not_in_user_configuration_page_while_add_user(
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("UserID field Editable or not in User Configuration page while add user Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Editable: "+data.get("Editable"));
			Boolean editable = Boolean.parseBoolean(data.get("Editable"));
			Boolean actualEditable = testContextObject.pom.userConfigurationPO().verifyUserIDfieldWhileAddUser();
			Assert.assertEquals(actualEditable, editable);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// Mayank
	@Given("Verify User ID from user configuration")
	public void verify_user_id_from_user_configuration(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify User ID from user configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String name = data.get("name");
			String actualUserid = testContextObject.pom.userConfigurationPO().verifyUserID(name);
			logger.debug(actualUserid);
			Assert.assertEquals(actualUserid, data.get("UserID"));
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// Mayank
	@Then("Verify custom field of {string} in User configuration page")
	public void verify_custom_field_of_in_user_configuration_page(String userID,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify custom field in User configuration page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.userConfigurationPO().customFieldsVerification(userID, data);
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}

	// Mayank
	@Given("Upload user custom field documents from user configuration")
	public void upload_user_custom_field_documents_from_user_configuration(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException, IOException {
		logger.info("Upload user custom field documents from user configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("userid"));
			String val = testContextObject.pom.userConfigurationPO().uploadDocumentsInCustomFields(data);
			Assert.assertEquals(val, data.get("Validation"));
		}
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}

	@Given("Update user custom fields from user configuration")
	public void update_user_custom_fields_from_user_configuration(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException, IOException {
		logger.info("Update user custom fields from user configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("userid"));
			String val = testContextObject.pom.userConfigurationPO().updateUserCustomFields(data);
			Assert.assertEquals(val, data.get("Validation"));
		}
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}

	// Chhaya
	@Given("Verify Enterprise Group in User Configuration Page")
	public void verify_enterprise_group_in_user_configuration_page(DataTable dataTable) throws InterruptedException {
		logger.info("Verify Enterprise Group in User Configuration Page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String userID = data.get("UserID");
			String organization = data.get("Organization");
			String branch = data.get("Branch");
			String department = data.get("Department");
			String section = data.get("Section");
			String category = data.get("Category");
			String grade = data.get("Grade");
			String designation = data.get("Designation");
			String customGroup1 = data.get("CustomGroup1");
			String customGroup2 = data.get("CustomGroup2");
			String customGroup3 = data.get("CustomGroup3");
			testContextObject.pom.userConfigurationPO().verifyEnterpriseGroupFromUserConfig(userID, organization,
					branch, department, section, category, grade, designation, customGroup1, customGroup2,
					customGroup3);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
		Thread.sleep(1500);
	}

	// By Chhaya
	@Given("Verify field name of Group in user configuration")
	public void verify_field_name_of_group_in_user_configuration(DataTable dataTable) throws InterruptedException {
		logger.info("Verify field name of Group in user configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("RenamedGroup: "+data.get("RenamedGroup"));
			String renamedGroup = data.get("RenamedGroup");
			testContextObject.pom.userConfigurationPO().verifyGroupFieldName(renamedGroup);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
		Thread.sleep(1500);
	}

	// By Chhaya
	@Given("Verify Field name {string} on User configuration page")
	public void verify_field_name_on_user_configuration_page(String tabName) throws InterruptedException {
		logger.info("Verify Field name on User configuration page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		testContextObject.pom.userConfigurationPO().verifyJobCostingTabName(tabName);
		testContextObject.pom.abstractMethod().homeButtonClick();
		Thread.sleep(1500);
	}

	// by Chhaya
	@Given("Reset ESS Password from user configuration")
	public void reset_ess_password_from_user_configuration(DataTable dataTable) throws InterruptedException {
		logger.info("Reset ESS Password from user configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		testContextObject.pom.userConfigurationPO().resetUserPassword(dataTable);
		Thread.sleep(1500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// chhaya
	@Given("Add user into blacklist from user configuration")
	public void add_user_into_blacklist_from_user_configuration(DataTable dataTable) throws InterruptedException {
		logger.info("Add user into blacklist from user configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		testContextObject.pom.userConfigurationPO().addUserInBlacklist(dataTable);
		Thread.sleep(1500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// chhaya
	@Then("Verify user in the Blacklist Users page")
	public void verify_user_in_the_blacklist_users_page(DataTable dataTable) throws InterruptedException {
		logger.info("Verify user in the Blacklist Users page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToBlacklistUsers();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserId: "+data.get("UserId"));
			String userId = data.get("UserId");
			testContextObject.pom.blacklistUserPO().verifyBlacklistedUser(userId);
		}
		Thread.sleep(1500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Restore user from Blacklist User page")
	public void restore_user_from_blacklist_user_page(DataTable dataTable) throws InterruptedException {
		logger.info("Restore user from Blacklist User page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToBlacklistUsers();
		testContextObject.pom.blacklistUserPO().restoreBlacklistedUser(dataTable);
		Thread.sleep(2000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Restored user displayed in the Restored User page")
	public void restored_user_displayed_in_the_restored_user_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Restored user displayed in the Restored User page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToBlacklistUsers();
		testContextObject.pom.blacklistUserPO().verifyRestoredUser(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
		Thread.sleep(1500);
	}

	// Chhaya
	@Given("Verify user events for user {string} and date from {string} to {string} in user configuration")
	public void verify_user_events_for_user_and_date_from_to_in_user_configuration(String usrId, String fromDt,
			String toDt, DataTable dataTable) throws InterruptedException {
		logger.info("Verify user events in user configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		testContextObject.pom.userConfigurationPO().verifyUserEvents(usrId, fromDt, toDt, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
		Thread.sleep(1500);
	}

	// Chhaya
	@Given("Set User - Module Configuration")
	public void set_user_module_configuration(DataTable dataTable) throws InterruptedException {
		logger.info("Set User - Module Configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToModuleConfigurationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String userID = data.get("UserID");
			String module = data.get("Module");
			String Value = data.get("Value");
			testContextObject.pom.userModuleConfigurationPO().setUserModuleConfiguration(userID, module, Value);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
		Thread.sleep(1500);
	}

	// Chhaya
	@Given("Send link from Invite user tab")
	public void send_link_from_invite_user_tab(DataTable dataTable) throws InterruptedException {
		logger.info("Send link from Invite user tab Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToInviteUserPage();
		testContextObject.pom.inviteUserPO().inviteUser(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("{string} Link from Invite User page - {string}")
	public void link_from_invite_user_page(String action, String validation, DataTable dataTable)
			throws InterruptedException {
		logger.info(action+" Link from Invite User page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToInviteUserPage();
		testContextObject.pom.inviteUserPO().resendOrCopyLink(action, validation, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Delete Link from Invite User page")
	public void delete_link_from_invite_user_page(DataTable dataTable) throws InterruptedException {
		logger.info("Delete Link from Invite User page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToInviteUserPage();
		testContextObject.pom.inviteUserPO().deleteLink(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("{string} and open in new browser tab")
	public void and_open_in_new_browser_tab(String copyLink, DataTable dataTable) throws InterruptedException {
		logger.info(copyLink+" and open in new browser tab Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToInviteUserPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String name = data.get("Name");
			testContextObject.pom.inviteUserPO().getAndOpenInviteUserLink(copyLink, name);
		}
	}

	@Given("Enter details in employees onbording portal")
	public void enter_details_in_employees_onbording_portal(DataTable dataTable) throws InterruptedException {
		logger.info("Enter details in employees onbording portal Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String name = data.get("Name");
			String dateOfBirth = data.get("DateOfBirth");
			String joiningDate = data.get("JoiningDate");
			String vehicleRegiNo = data.get("VehicleRegistrationNo");
			String field1 = data.get("Field1");
			String field2 = data.get("Field2");
			String field3 = data.get("Field3");
			String field4 = data.get("Field4");
			String field5 = data.get("Field5");
			String fatherSpouseName = data.get("FatherSpouseName");
			testContextObject.pom.onBoardingPortalPO().enterDetailsInOnBoardingPortal(name, dateOfBirth, joiningDate,
					vehicleRegiNo, field1, field2, field3, field4, field5, fatherSpouseName);
		}
	}

	@Then("Verify user details from Invite User Page")
	public void verify_user_details_from_invite_user_page(DataTable dataTable) throws InterruptedException {
		logger.info("Verify user details from Invite User Page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToInviteUserPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String name = data.get("Name");
			String dateOfBirth = data.get("DateOfBirth");
			String joiningDate = data.get("JoiningDate");
			String vehicleRegNo = data.get("VehicleRegistrationNo");
			String field1 = data.get("Field1");
			String fatherSpouseName = data.get("FatherSpouseName");
			testContextObject.pom.inviteUserPO().verifyUserDetailsFromInviteUserPage(name, dateOfBirth, joiningDate,
					vehicleRegNo, field1, fatherSpouseName);
		}
	}

	@Then("Delete User from Delete Users Page")
	public void delete_user_from_delete_users_page(DataTable dataTable) throws InterruptedException {
		logger.info("Delete User from Delete Users Page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToDeleteUsers();
		testContextObject.pom.deleteUsersPO().deleteUsers();
		testContextObject.pom.deleteUsersPO().deleteUsersFromDeleteUserPage(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Create ESS Role Rights from ESS Role Rights page")
	public void create_ess_role_rights_from_ess_role_rights_page(DataTable dataTable) throws InterruptedException {
		logger.info("Create ESS Role Rights from ESS Role Rights page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToESSRolesRights();
		testContextObject.pom.eSSRolesAndRightsPO().createEssRolesdRights(dataTable);
		testContextObject.pom.reportingGroupPO().homeButtonClick();
	}

	// Chhaya
	@Given("Assign {string} ESS Role Rights to user from ESS Role Rights page")
	public void assign_ess_role_rights_to_user_from_ess_role_rights_page(String EssRRName, DataTable dataTable)
			throws InterruptedException {
		logger.info("Assign ESS Role Rights to user from ESS Role Rights page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToESSRolesRights();
		testContextObject.pom.eSSRolesAndRightsPO().assignEssRoleRights(EssRRName, dataTable);
		testContextObject.pom.reportingGroupPO().homeButtonClick();
	}

	// Chhaya
	@Then("Verify user events for user {string} and date from {string} to {string} from User Events page")
	public void verify_user_events_for_user_and_date_from_to_from_user_events_page(String usrId, String fromDt,
			String toDt, DataTable dataTable) throws InterruptedException {
		logger.info("Verify user events from User Events page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserEventsPage();
		testContextObject.pom.userEventsPO().verifyEventsFromUserEvents(usrId, fromDt, toDt, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
		Thread.sleep(1500);
	}

	// By Chhaya
	@Given("Change User Id from Change User ID page")
	public void change_user_id_from_change_user_id_page(DataTable dataTable) throws InterruptedException {
		logger.info("Change User Id from Change User ID page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToChangeUserIDPage();
		testContextObject.pom.changeUserIdPO().changeUserId(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
		Thread.sleep(1500);
	}

	// By Chhaya
	@Given("Submit Health Declaration from Health Declaration Page")
	public void submit_health_declaration_from_health_declaration_page(DataTable dataTable)
			throws InterruptedException {
		logger.info("Submit Health Declaration from Health Declaration Page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToHealthDeclarationPage();
		testContextObject.pom.healthDeclarationPO().healthDeclaration(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
		Thread.sleep(1500);
	}

	// By Chhaya
	@Then("Verify Health Record of {string} and date from {string} to {string} in Health Records page")
	public void verify_health_record_of_and_date_from_to_in_health_records_page(String userId, String fromDt,
			String toDt, DataTable dataTable) throws InterruptedException {
		logger.info("Verify Health Record in Health Records page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToHealthRecordsPage();
		testContextObject.pom.healthRecordsPO().verifyHealthRecord(userId, fromDt, toDt, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
		Thread.sleep(1500);
	}

	// By Chhaya
	@Given("Delete ESS Role Rights from ESS Role Rights page")
	public void delete_ess_role_rights_from_ess_role_rights_page(DataTable dataTable) throws InterruptedException {
		logger.info("Delete ESS Role Rights from ESS Role Rights page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToESSRolesRights();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ESSRoleRights: "+data.get("ESSRoleRights"));
			String eSSRoleRights = data.get("ESSRoleRights");
			testContextObject.pom.eSSRolesAndRightsPO().deleteEssRolesdRights(eSSRoleRights);
		}
		testContextObject.pom.reportingGroupPO().homeButtonClick();
	}

	// By Chhaya
	@When("Add user into blacklist from Blacklist Users page")
	public void add_user_into_blacklist_from_blacklist_users_page(DataTable dataTable) throws InterruptedException {
		logger.info("Add user into blacklist from Blacklist Users page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToBlacklistUsers();
		testContextObject.pom.blacklistUserPO().blackUsrFromBlacklistUser(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// By Chhaya
	@When("Restore user from User Configuration page")
	public void restore_user_from_user_configuration_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Restore user from User Configuration page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String UsrId = data.get("UserID");
			testContextObject.pom.userConfigurationPO().restoreUserFromUserConfig(UsrId);
		}
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// By Chhaya
	@Given("Download File from Import Data page")
	public void download_file_from_import_data_page(DataTable dataTable) throws InterruptedException {
		logger.info("Download File from Import Data page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToImportUsersPage();
		testContextObject.pom.importUserPO().downloadFile(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Then("Verify Reporting Group from Reporting Group page")
	public void verify_reporting_group_from_reporting_group_page(DataTable dataTable) throws InterruptedException {
		logger.info("Verify Reporting Group from Reporting Group page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToReportingGroup();
		testContextObject.pom.reportingGroupPO().verifyGroupName(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Delete Reporting Group")
	public void delete_reporting_group(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Reporting Group Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToReportingGroup();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("GroupName: "+data.get("GroupName"));
			testContextObject.pom.reportingGroupPO().deleteReportingGroup(data.get("GroupName"));
		}
		Thread.sleep(1000);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// Chhaya
	@Given("Create Approval Policy from Approval Policy page")
	public void create_approval_policy_from_approval_policy_page(DataTable dataTable) throws InterruptedException {
		logger.info("Create Approval Policy from Approval Policy page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToApprovalPolicy();
		Thread.sleep(1000);
		testContextObject.pom.approvalPolicyPO().createApprovalPolicy(dataTable);
		Thread.sleep(2000);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// Chhaya
	@Given("Add Exceptions in Approval Policy for PolicyName= {string}")
	public void add_exceptions_in_approval_policy_for_policy_name(String policyName,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Add Exceptions in Approval Policy Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToApprovalPolicy();
		Thread.sleep(1500);
		testContextObject.pom.approvalPolicyPO().addExceptionInApprovalPlc(policyName, dataTable);
		Thread.sleep(1500);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// Chhaya
	@Given("Configure Auto Forward Application for PolicyName= {string}")
	public void configure_auto_forward_application_for_policy_name(String policyName,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Configure Auto Forward Application Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToApprovalPolicy();
		testContextObject.pom.approvalPolicyPO().configureAutoForwardApplication(policyName, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}
	
	// Mayank
	@Given("Update users from multiuser Configuration page")
	public void update_users_from_multiuser_configuration_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Update users from multiuser Configuration page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToMultiUserConfigurationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			testContextObject.pom.multiUserConfigurationPO().multiUserConfiguration(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Assign jobs to user={string} from user configuration")
	public void assign_jobs_to_user_from_user_configuration(String user, io.cucumber.datatable.DataTable dataTable) throws Exception {
		logger.info("Assign jobs to user from User Configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		testContextObject.pom.userConfigurationPO().assignJobToUser(user, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Prioritize Job from user configuration for UserID= {string}")
	public void prioritize_job_from_user_configuration_for_user_id(String userID, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Prioritize Job from user configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		testContextObject.pom.userConfigurationPO().prioritizeJob(userID, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//Chhaya
	@Then("Verify Job Priority from User configuration for UserID= {string}")
	public void verify_job_priority_from_user_configuration_for_user_id(String userID, DataTable dataTable) throws InterruptedException {
		logger.info("Verify Job Priority from User configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		testContextObject.pom.userConfigurationPO().verifyJobPriority(userID, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//Chhaya
	@Then("Verify Device Configuration from User Configuration for UserId= {string}")
	public void verify_device_configuration_from_user_configuration_for_user_id(String userId, DataTable dataTable) throws InterruptedException {
		logger.info("Verify Device Configuration from User Configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		testContextObject.pom.userConfigurationPO().verifyDeviceConfigurations(userId, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@When("{string} users from User On Device page")
	public void users_from_user_on_device_page(String assignRevoke, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info(assignRevoke+" users from User On Device page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserOnDevicePage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Device Name: "+data.get("DeviceName"));
			testContextObject.pom.usersOnDevicePO().assignRevokeUsers(assignRevoke, data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@When("Change group for {string} from Change Group page")
	public void change_group_for_from_change_group_page(String userType, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("change group from Change Group page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToChangeGroupPage();
		testContextObject.pom.changeGroupPO().changeGroup(userType, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@When("Change Device Configuration from User Configuration for UserId= {string}")
	public void change_device_configuration_from_user_configuration_for_user_id(String userId, DataTable dataTable) throws InterruptedException {
		logger.info("Change Device Configuration from User Configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Device: "+data.get("Device"));
			testContextObject.pom.userConfigurationPO().changeDeviceConfigurations(userId, data);
		}
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@When("Generate QR Credential from User Configuration")
	public void generate_qr_credential_from_user_configuration(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Generate QR Credential from User Configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserId: "+data.get("UserId"));
			String userid = data.get("UserId");
			testContextObject.pom.userConfigurationPO().getnarateOR(userid);
		}
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Then("Verify Jobs from User configuration for UserID= {string}")
	public void verify_jobs_from_user_configuration_for_user_id(String userID, io.cucumber.datatable.DataTable dataTable) throws Exception {
		logger.info("Verify Jobs from User configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		testContextObject.pom.userConfigurationPO().verifyJob(userID, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Then("Verify Job Scheduler from User configuration for UserID= {string}")
	public void verify_job_scheduler_from_user_configuration_for_user_id(String userID, io.cucumber.datatable.DataTable dataTable) throws Exception {
		logger.info("Verify Job Scheduler from User configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		testContextObject.pom.userConfigurationPO().verifyJobScheduler(userID, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@When("Update job from user configuration for UserID={string}")
	public void update_job_from_user_configuration_for_user_id(String userID, io.cucumber.datatable.DataTable dataTable) throws Exception {
	   	logger.info("Update job from user configuration Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToUserConfiguration();
		testContextObject.pom.userConfigurationPO().updateAssignedJobs(userID, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Delete All Links from Invite User page")
	public void delete_all_links_from_invite_user_page() throws InterruptedException {
		logger.info("Delete All Links from Invite User page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToInviteUserPage();
		testContextObject.pom.inviteUserPO().deleteAllLink();
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//Chhaya
	@Given("Update ESS Role Rights {string} from ESS Role Rights page")
	public void update_ess_role_rights_from_ess_role_rights_page(String string, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Update ESS Role Rights from ESS Role Rights page Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToESSRolesRights();
		testContextObject.pom.eSSRolesAndRightsPO().updateEssRolesdRights(string, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Delete Approval policy from user module")
	public void delete_approval_policy_from_user_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Approval policy from user module Started");
		testContextObject.pom.homePO().goTOUserModule();
		testContextObject.pom.userPO().goToApprovalPolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("AP : "+data.get("Name"));
			String name = data.get("Name");
			testContextObject.pom.approvalPolicyPO().deleteApprovalPolicy(name);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Delete Reporting Group via API")
	public void delete_reporting_group_via_api(io.cucumber.datatable.DataTable dataTable) {

		logger.info("Delete Reporting Group via API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("GName : " + data.get("GroupName"));
			String name = data.get("GroupName");
			// GET all reporting groups
			String url = "get;format=json";
			String res = testContextObject.baseTest.getAPI(url, "sa", "admin", "reporting-group", 200);
			// Find ID from name which we want
			if (!res.contains("No records found")) {
				Object rgid = testContextObject.baseTest.getValueFromAPI(res, "reporting-group", "id", "name", name);

				if (rgid != null) {
					String deleteurl = "delete;rg_id=" + rgid;
					String deleteres = testContextObject.baseTest.setAPI(deleteurl, "sa", "admin", "reporting-group",
							200);
					Assert.assertEquals(deleteres, "success: 1290400003 : Deleted Successfully");
					logger.info("Deleted Successfully");
				} else {
					logger.info("RG not found");
				}
			}
		}
	}
	

	// Mayank
	@When("Create Reporting Group via API")
	public void create_reporting_group_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Create Reporting Group via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("rg_name: "+data.get("rg_name"));
			List<String> apiParameter = new ArrayList<>();
			//apiParameter.add("update");
			// FInd RG Id
			String url = "get;format=json";
			String res1 = testContextObject.baseTest.getAPI(url, "sa", "admin", "reporting-group", 200);
			Object rgid = null;
			if (!res1.equalsIgnoreCase("success: 1290100000 : No records found")) {
				 rgid = testContextObject.baseTest.getValueFromAPI(res1, "reporting-group", "id", "name", data.get("rg_name"));
			} 
			
			// FInd Approval policy Id
			String apid = null;
			if (columnHeader.contains("approval-policy-name")) {
				if (data.get("approval-policy-name") != null) {
					String apidQuery = "select APID from Mx_ApprovalPolicyMst where upper(Name)=upper('"+ data.get("approval-policy-name") + "')";
					apid = testContextObject.baseTest.getDataFDatabase(apidQuery);
				}
			}			
			testContextObject.pom.reportingGroupPO().createUpdateReportingGroupViaAPI(columnHeader, apiParameter, data, apid, rgid);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			// logger.debug(userParameter);
			String apiResponseValidation1 = "success: 1290300003 : Reporting Group data updated/modified.";
			String apiResponseValidation2 = "success: 1290200002 : New Reporting Group Added.";
			String res = testContextObject.baseTest.setAPI(userParameter, "sa", "admin", "reporting-group", 200);
			boolean result = false;
			if (res.contains(apiResponseValidation1) || res.contains(apiResponseValidation2)) {
				result = true;
			} else {
				result = false;
				logger.info(res);
			}
			Assert.assertEquals(result, true);
			
		}
	}
	

	
}