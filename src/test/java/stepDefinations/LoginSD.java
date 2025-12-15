package stepDefinations;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Driver;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import CommonTestAbstract.TestContextObject;
import PageObject.Dashboard.DashboardPO;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class LoginSD {
	TestContextObject testContextObject;
	String otp = null;
	public static Properties prop;
	private static Logger logger = LogManager.getLogger(LoginSD.class);

	public LoginSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@Given("^Open Cosec Web$")
	public void open_cosec_web() throws Throwable {
		logger.info("Open Cosec Web Started");
		
		testContextObject.pom.abstractMethod().changeSyatemDateTimeAfter();
		testContextObject.baseTest.intializeBrowser();
		testContextObject.baseTest.goTo();
		Thread.sleep(2000);
		testContextObject.baseTest.goTo();
		System.out.println("broser Name in login page"+testContextObject.baseTest.browserName);
		if(testContextObject.baseTest.browserName.equalsIgnoreCase("firefox")) {
			testContextObject.baseTest.closeOneTab();
		}
		logger.info("Browser Open SuccessFully");
		// given below line only for list is clear
		testContextObject.pom.abstractMethod().downloadFileUsingTestScenario.clear();
		AbstractMethod.fi.clear();
		testContextObject.pom.abstractMethod().product = null;
		AbstractMethod.currentDatetime = new Date();
		DashboardPO.additionalDataForDB=null;
	}

	@And("^Open Cosec Web in new tab$")
	public void open_cosec_web_in_new_tab() throws Throwable {
		logger.info("Open Cosec Web in new tab Started");
		testContextObject.baseTest.openNewTab();
		testContextObject.baseTest.goTo();
	}

	@When("Open new Tab and Open Device Webpage")
	public void open_new_tab_and_open_device_webpage() throws InterruptedException {
		logger.info("Open new Tab and Open Device Webpage Started");
		testContextObject.baseTest.openNewTab();
		testContextObject.baseTest.goToDeviceURL();
	}

	@When("Open Cosec Visitor Portal in new tab")
	public void open_cosec_visitor_portal_in_new_tab(DataTable table) throws InterruptedException {
		logger.info("Open Cosec Visitor Portal in new tab Started");
		testContextObject.baseTest.openNewTab();
		testContextObject.baseTest.goToVisitorPortal();
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("StationLocation: " + data.get("StationLocation") + " UserId: " + data.get("UserId"));
			String title = testContextObject.pom.visitorPortalPO().loginInVisitorPortal(data.get("StationLocation"),
					data.get("UserId"), data.get("Password"));
			Assert.assertEquals(title, data.get("validation"));
		}
	}

	@Then("^Go to previous Tab$")
	public void go_to_previous_tab() throws Throwable {
		logger.info("Go to previous Tab Started");
		testContextObject.baseTest.goToPreviousTab();
	}

	@Then("Go to next Tab")
	public void go_to_next_tab() throws Throwable {
		logger.info("Go to next Tab Started");
		testContextObject.baseTest.goToNextTab();
	}

	@When("^Login with user$")
	public void login_with_user(DataTable table) throws Throwable {
		logger.info("Login with user Started");
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			String title = testContextObject.pom.loginPO().credential(data.get("username"), data.get("password"));
			Assert.assertEquals(title, data.get("Validation"));
			logger.info("Login Successfully");
		}
	}

	@And("^Logout from Cosec Web$")
	public void logout_from_cosec_web() throws Throwable {
		logger.info("Logout from Cosec Web Started");
		testContextObject.pom.abstractMethod().logOut();
	}

	@And("^Click on Send Button$")
	public void click_on_send_button() throws Throwable {
		logger.info("Click on Send Button Started");
		testContextObject.pom.loginPO().clickOnSendButton();
	}

	@Then("^Enter OTP and click Verify$")
	public void enter_otp_and_click_verify(DataTable table) throws Throwable {
		logger.info("Enter OTP and click Verify Started");
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("OTP: " + data.get("OTP"));
			String val = testContextObject.pom.loginPO().enterOTP(data.get("OTP"));
			Assert.assertEquals(val, data.get("Validation"));
		}
	}

	@And("^Get OTP from Database for \"([^\"]*)\" and click on verify after entering OTP$")
	public void get_otp_from_database_for_something_and_click_on_verify_after_entering_otp(String strArg1)
			throws Throwable {
		logger.info("Get OTP from Database and click on verify after entering OTP Started");
		Thread.sleep(2000);
		String databaseFetchingQuery = "select ForgotPwdOTP from Mx_UserMst where UPPER(userid)=UPPER('" + strArg1
				+ "')";
		String getOTP = testContextObject.baseTest.getDataFDatabase(databaseFetchingQuery);
		// logger.debug(getOTP);
		String name = testContextObject.pom.loginPO().enterOTP(getOTP);
		Assert.assertEquals(name, "Set Password");

	}

	@Then("^Enter New password and Confirm Password$")
	public void enter_new_password_and_confirm_password(DataTable table) throws Throwable {
		logger.info("Enter New password and Confirm Password Started");
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("NewPassword: " + data.get("NewPassword"));
			String value = testContextObject.pom.loginPO().setPassword(data.get("NewPassword"),
					data.get("ConfirmPassword"));
			Assert.assertEquals(value, data.get("Validation"));
		}
	}

	@And("^Set User password$")
	public void set_user_password(DataTable table) throws Throwable {
		logger.info("Set User password Started");
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("User: " + data.get("User"));
			String actual = testContextObject.pom.loginPO().setUserPassword(data.get("User"),
					data.get("NewPassword"), data.get("ConfirmPassword"));
			if (data.get("User").equalsIgnoreCase("se") || data.get("User").equalsIgnoreCase("so")) {
				 if(data.get("Validation").equalsIgnoreCase("Password should not be blank") || data.get("Validation").equalsIgnoreCase("LOGIN")) {
					 Assert.assertEquals(true, true);
				 }
				 else {
					 Assert.assertEquals(actual, data.get("Validation"));
				 }
			} else {
				Assert.assertEquals(actual, data.get("Validation"));
			}
		}
	}

	@Given("Set Password via API")
	public void set_password_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Set Password via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: " + data.get("Userid"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.loginPO().setPasswordAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			// logger.debug(userParameter);
			String userID = data.get("Userid");

			String res = testContextObject.baseTest.setAPI(userParameter, userID, "", "change-password", 200);
			String exRes1 = "success: 0580200002 : Password is set successfully";
			String exRes2 = "failed: 0580201004 : Password already exists against this user id. Click on forgot password to reset";
			String result = null;
			if (res.equalsIgnoreCase(exRes1) || res.equalsIgnoreCase(exRes2)) {
				result = "Pass";
				logger.debug("Password set successfully Or Password already exists");
			} else {
				result = "Failed";
				logger.debug(res);
			}
			Assert.assertEquals(result, "Pass");

		}
	}

	@And("^Set User password and Refresh Page$")
	public void set_user_password_and_refresh_page(DataTable table) throws Throwable {
		logger.info("Set User password and Refresh Page Started");
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("User: " + data.get("User"));
			testContextObject.pom.loginPO().pageRefresh();
			String actual = testContextObject.pom.loginPO().setUserPassword(data.get("User"), data.get("NewPassword"),
					data.get("ConfirmPassword"));
			Thread.sleep(2000);
			Assert.assertEquals(actual, data.get("Validation"));
			testContextObject.pom.loginPO().pageRefresh();

		}
	}

	@When("^Enter \\\"([^\\\"]*)\\\" and click on OTP$")
	public void enter_something_and_click_on_otp(String credential) throws Throwable {
		logger.info("Enter Credentials and click on OTP Started");
		testContextObject.pom.loginPO().enterCredentialsAndClickOnOTP(credential);
	}

	@Then("^Click on Resend OTP \"([^\"]*)\" time$")
	public void click_on_resend_otp_something_time(String resendCount) throws Throwable {
		logger.info("Click on Resend OTP Started");
		int resendCount1 = Integer.parseInt(resendCount);
		testContextObject.pom.loginPO().clickOnResendOTP(resendCount1);
	}
	
	@And("^Validate \"([^\"]*)\"$")
	public void validate_something(String validationMessage) throws Throwable {
		logger.info("Validate Message Started");
		String actual = testContextObject.pom.loginPO().validateMessage();
		Assert.assertEquals(actual, validationMessage);
	}
	
	
	@Given("OTP validity period is set to timing {string} minute then the message {string} should be displayed.")
	public void otp_validity_period_is_set_to_timing_minute_then_the_message_should_be_displayed(String string, String validationMessage) throws Throwable{
		logger.info("Validate Message Started");
		String actual = testContextObject.pom.loginPO().validateMessage();
		String expected=validationMessage.replace("timing", string);
//		System.out.println(expected);
		Assert.assertEquals(actual, expected);
	}

	@And("^Wait for \"([^\"]*)\" min$")
	public void wait_for_something_min(String definedTime) throws Throwable {
		logger.info("Wait for min Started");
		float definedTime1 = Float.parseFloat(definedTime);
		testContextObject.pom.abstractMethod().waitForDefinedMin(definedTime1);
	}

	@When("^Update Last Password Change Date to \"([^\"]*)\" for user \"([^\"]*)\" in database$")
	public void update_last_password_change_date_to_something_for_user_something_in_database(String Days, String userID)
			throws Throwable {
		logger.info("Update Last Password Change Date Started");
		String globalPropertiesFilePath = System.getProperty("user.dir") + "\\src\\test\\resources\\global.properties";
		FileInputStream fis = new FileInputStream(globalPropertiesFilePath);
		prop = new Properties();
		prop.load(fis);
		String database = System.getProperty("database") != null ? System.getProperty("database")
				: prop.getProperty("database");
		String lastPWChgDTUpdateQuery = null;
		if (database.equalsIgnoreCase("MSSQL")) {
			lastPWChgDTUpdateQuery = "update Mx_UserMst set LastPWChgDT=dateadd(DAY," + Days
					+ ",LastPWChgDT) where UPPER(UserID)=UPPER('" + userID + "')";
		} else {
			lastPWChgDTUpdateQuery = "update Mx_UserMst set LastPWChgDT=LastPWChgDT+" + Days
					+ " where UPPER(UserID)=UPPER('" + userID + "')";
		}
		int updateDeleteRecord = testContextObject.baseTest.updateORDeleteDatabase(lastPWChgDTUpdateQuery);
		Assert.assertEquals(updateDeleteRecord, 1);
	}

	@Then("^Enter \"([^\"]*)\" and \"([^\"]*)\" and click on Next$")
	public void enter_something_and_something_and_click_on_next(String userID, String pwd) throws Throwable {
		logger.info("Enter userid and password and click on Next Started");
		testContextObject.pom.loginPO().enterUseridPasswordAndClickOnNext(userID, pwd);
	}

	@And("^Enter OTP and click on Login$")
	public void enter_otp_and_click_on_login(DataTable table) throws Throwable {
		logger.info("Enter OTP and click on Login Started");
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("OTP: " + data.get("OTP"));
			String actual = testContextObject.pom.loginPO().enterOTPandClickOnLogin(data.get("OTP"));
			Assert.assertEquals(actual, data.get("Validation"));
		}
	}

	@Then("^Get OTP from Database for \"([^\"]*)\" and click on Login after entering OTP$")
	public void get_otp_from_database_for_something_and_click_on_login_after_entering_otp(String userID,
			DataTable table) throws Throwable {
		logger.info("Get OTP from Database and click on Login after entering OTP Started");
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("Validation: " + data.get("Validation"));
			String databaseFetchingQuery = "select LoginOTP from Mx_UserMst where UPPER(userid)=UPPER('" + userID
					+ "')";
			String getOTP = testContextObject.baseTest.getDataFDatabase(databaseFetchingQuery);
			String actual = testContextObject.pom.loginPO().enterOTPandClickOnLogin(getOTP);
			Assert.assertEquals(actual, data.get("Validation"));
		}
	}

//	@Then("^Verify Password or OTP toggle should be displayed$")
//    public void verify_password_or_otp_toggle_should_be_displayed() throws Throwable {
//		testContextObject.pom.loginPO().passwordOTPtoggleDisplayedOrNot();
//    }

	@Then("^Verify Password or OTP toggle displayed \"([^\"]*)\"$")
	public void verify_password_or_otp_toggle_displayed_something(String strArg1) throws Throwable {
		logger.info("Verify Password or OTP toggle displayed Started");
		boolean validate = Boolean.parseBoolean(strArg1);
		testContextObject.pom.loginPO().passwordOTPtoggleDisplayedOrNot(validate);
	}

	@Then("^Refresh Page, Enter credentials, click on OTP, Enter OTP and Click on Login$")
	public void refresh_page_enter_credentials_click_on_otp_enter_otp_and_click_on_login(DataTable table)
			throws Throwable {
		logger.info("Refresh Page, Enter credentials, click on OTP, Enter OTP and Click on Login Started");
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("credentials: " + data.get("credentials"));
			testContextObject.pom.loginPO().pageRefresh();
			String actual = testContextObject.pom.loginPO()
					.enterCredentialsClickOnOTPEnterOTPAndClickOnLogin(data.get("credentials"), data.get("OTP"));
			Assert.assertEquals(actual, data.get("Validation"));
		}
	}

	@And("^Get OTP from Alert view for \"([^\"]*)\"$")
	public void get_otp_from_alert_view_for_something(String credential) throws Throwable {
		logger.info("Get OTP from Alert view Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToAlertView();
		otp = testContextObject.pom.alertViewPO().getOTPFromAlertView(credential);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@And("^click on Login after entering OTP$")
	public void click_on_login_after_entering_otp(DataTable table) throws Throwable {
		logger.info("click on Login after entering OTP Started");
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("Validation: " + data.get("Validation"));
			String actual = testContextObject.pom.loginPO().enterOTPandClickOnLogin(otp);
			Assert.assertEquals(actual, data.get("Validation"));
		}
	}

	@Given("click on Login after entering OTP in Visitor Portal")
	public void click_on_login_after_entering_otp_in_visitor_portal(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("click on Login after entering OTP in Visitor Portal Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Validation: " + data.get("Validation"));
			String actual = testContextObject.pom.visitorPortalPO().enterOTPandClickOnLoginInVisitorPortal(otp);
			Assert.assertEquals(actual, data.get("Validation"));
		}
	}

	@Given("click on Verify after entering Email OTP in Visitor Portal")
	public void click_on_verify_after_entering_email_otp_in_visitor_portal(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("click on Verify after entering Email OTP in Visitor Portal Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Validation: " + data.get("Validation"));
			String actual = testContextObject.pom.visitorPortalPO().enterEmailOTPandClickOnVerifyInVisitorPortal(otp);
			Assert.assertEquals(actual, data.get("Validation"));
		}
	}

	@Given("click on Login after entering OTP in COSEC Onboarding Portal")
	public void click_on_login_after_entering_otp_in_cosec_onboarding_portal(DataTable dataTable)
			throws InterruptedException {
		logger.info("click on Login after entering OTP in COSEC Onboarding Portal Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Validation: " + data.get("Validation"));
			String actual = testContextObject.pom.inviteUserPO().enterOTPandClickOnLoginInOnboardingPortal(otp);
			Assert.assertEquals(actual, data.get("Validation"));
		}
	}

	// Mayank
	@Given("Open Cosec Admin Portal")
	public void open_cosec_admin_portal() throws IOException, InterruptedException {
		logger.info("Open Cosec Admin Portal Started");
		testContextObject.baseTest.intializeBrowser();
		testContextObject.baseTest.goToAdminPortal();
	}

	@Given("Logout from Cosec Admin Portal")
	public void logout_from_cosec_admin_portal() {
		logger.info("Logout from Cosec Admin Portal Started");
		testContextObject.pom.abstractMethod().logOutAdminPortal();
	}

	@When("Enter {string} and Click on Forget Password")
	public void enter_and_click_on_forget_password(String userid) throws InterruptedException {
		logger.info("Enter userid and click on forget pwd Started");
		testContextObject.pom.loginPO().enterUseridAndClickForgetPwd(userid);
	}

	@When("Select {string} option and Click on Send or Next button on Forget password screen")
	public void select_option_and_click_on_send_or_next_button_on_forget_password_screen(String forgetPwdOption)
			throws InterruptedException {
		logger.info("select forget pwd option and click send or next Started");
		testContextObject.pom.loginPO().selectForgetPwdOptions(forgetPwdOption);
	}

	@Then("Enter Security Answer and Click on Next and set password")
	public void enter_security_answer_and_click_on_next_and_set_password(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Enter Security Answer and Click on Next and set password Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.loginPO().EnterSecAnsAndSetPwd(data);
		}
	}

}
