package stepDefinations;

import java.io.IOException;
import java.sql.Driver;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.record.PageBreakRecord.Break;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import CommonTestAbstract.TestContextObject;
import PageObject.AdminModule.GlobalPolicyPO;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class AdminSD {
	TestContextObject testContextObject;
	String product = null;
	String taskSchedulerName = null;
	private static Logger logger=LogManager.getLogger(AdminSD.class);
	
	@FindBy(xpath = "//*[@title='Home']")
	private List<WebElement> homePage1;
	
	public AdminSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@When("Set SMS Configuration")
	public void set_sms_configuration() throws InterruptedException {
		logger.info("Set SMS Configuration Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToSMSConfiguration();
		testContextObject.pom.smsConfigurationPO().setSMSConfiguration();
		testContextObject.pom.globalPolicyPO().homeButtonClick();
	}

	@Given("Set Email Configuration")
	public void set_email_configuration() throws Throwable {
		logger.info("Set Email Configuration Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToEmailConfiguration();
		testContextObject.pom.emailConfigurationPO().setEmailConfiguration();
		testContextObject.pom.globalPolicyPO().homeButtonClick();
	}

	// GLobal Policy > Login
	@And("^Login Authentication Mode set \"([^\"]*)\" in GP$")
	public void login_authentication_mode_set_something_in_gp(String strArg1) throws Throwable {
		logger.info("Login Authentication Mode set in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		testContextObject.pom.globalPolicyPO().setLoginAuthenticationMode(strArg1);
		testContextObject.pom.globalPolicyPO().homeButtonClick();
	}

	// GLobal Policy > Password Policy
	@And("^Set OTP Authentication For Setting Password \"([^\"]*)\" in GP$")
	public void set_otp_authentication_for_setting_password_as_something_in_gp(String strArg1) throws Throwable {
		logger.info("Set OTP Authentication For Setting Password in GP Started");
		boolean otpAuth = Boolean.parseBoolean(strArg1);
		logger.debug(otpAuth);
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		testContextObject.pom.globalPolicyPO().selectOTPAuthenticationForSettingPassword(otpAuth);
		testContextObject.pom.globalPolicyPO().homeButtonClick();
	}

	// GLobal Policy
	@And("^Reset \"([^\"]*)\" page to default$")
	public void reset_something_page_to_default(String strArg1) throws Throwable {
		logger.info("Reset page to default Started");
		testContextObject.baseTest.updateDefaultPolicy(strArg1);
	}

	// GLobal Policy > Password Policy
	@And("^Set Deny Password Reuse \"([^\"]*)\" and Reuse Count For System Account Users \"([^\"]*)\" in GP$")
	public void set_deny_password_reuse_something_and_reuse_count_for_system_account_users_something_in_gp(
			String denyPwdReuse, String reuseCount) throws Throwable {
		logger.info("Set Deny Password Reuse and Reuse Count For System Account Users in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		boolean denyPwdReuse1 = Boolean.parseBoolean(denyPwdReuse);
		testContextObject.pom.globalPolicyPO().passwordReuse(denyPwdReuse1, reuseCount);
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@And("^Create New System Account User$")
	public void create_new_system_account_user(DataTable table) throws Throwable {
		logger.info("Create New System Account User Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToSystemAccount();
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("SAUser: "+data.get("SAUser"));
			String actual = testContextObject.pom.systemAccountPO().createSystemAccount(data.get("SAUser"), data.get("Active"),
					data.get("ESSUSer"), data.get("APIAccess"), data.get("Role"), data.get("Module"), data.get("Menu"),
					data.get("ReportInPDF"));
			Assert.assertEquals(actual, data.get("ValidationMessage"));
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@And("^Reset Password for System Account User \"([^\"]*)\"$")
	public void reset_password_for_system_account_user_something(String systemAcID) throws Throwable {
		logger.info("Reset Password for System Account User Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToSystemAccount();
		testContextObject.pom.systemAccountPO().resetSystemAccountPwd(systemAcID);
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	// GLobal Policy > Password Policy > System Account User Password Strength -- update in V20R9.1 
	@And("Set Minimum Required Characters {string} and Security Level {string} in GP for SA")
	public void set_minimum_required_characters_and_security_level_in_gp_for_sa(String minReqChar,
			String secLvl) throws Throwable {
		logger.info("Set Minimum Required Characters and Security Level in GP for SA Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		testContextObject.pom.globalPolicyPO().setMinCharAndSecLvlSA(minReqChar, secLvl);
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	// GLobal Policy > Password Policy > System Account User Password Strength -- update in V20R9.1 
	@And("Set Minimum Required Characters {string} and Security Level {string} in GP for ESS")
	public void set_minimum_required_characters_and_security_level_in_gp_for_ess(String minReqChar, String secLvl)
			throws Throwable {
		logger.info("Set Minimum Required Characters and Security Level in GP for ESS Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		testContextObject.pom.globalPolicyPO().setMinCharAndSecLvlESS(minReqChar, secLvl);
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@And("^Delete System Account User \"([^\"]*)\" from database$")
	public void delete_system_account_user_something_from_database(String strArg1) throws Throwable {
		logger.info("Delete System Account User from database Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToSystemAccount();
		testContextObject.pom.systemAccountPO().deleteSystemAcountUser(strArg1);
		testContextObject.pom.adminPO().homeButtonClick();
	}

	// GLobal Policy > Password Policy
	@And("Set Maximum OTP Generation Attempts {string} and Resend OTP After \\(Min) {string} in GP")
	public void set_maximum_otp_generation_attempts_something_and_resend_otp_after_min_something_in_gp(
			String maxOTPGenAtmp, String reOTPAftMin) throws Throwable {
		logger.info("Set Maximum OTP Generation Attempts and Resend OTP in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		testContextObject.pom.globalPolicyPO().setMaxOTPGenAtmpAndResendOTPAfterMin(maxOTPGenAtmp, reOTPAftMin);
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	// GLobal Policy > Password Policy
	@When("Set Lock Account for Invalid Attempts {string} and Maximum Invalid Attempts {string} and Auto Unlock Timer \\(Min){string} in GP")
	public void set_lock_account_for_invalid_attempts_and_maximum_invalid_attempts_and_auto_unlock_timer_min_in_gp(
			String lockAcforInvalidAtmp, String maxInvalidAtmp, String AutoUnlockTimer) throws Throwable {
		logger.info("Set Lock Account for Invalid Attempts and Maximum Invalid Attempts and Auto Unlock Timer in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		boolean lockAcforInvalidAtmp1 = Boolean.parseBoolean(lockAcforInvalidAtmp);
		testContextObject.pom.globalPolicyPO().setLockAccountforInvalidAtmptsConfig(lockAcforInvalidAtmp1,
				maxInvalidAtmp, AutoUnlockTimer);
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	// GLobal Policy > Password Policy
	@And("^Set Password Security Policy \"([^\"]*)\" and Password Reset Period days \"([^\"]*)\" in GP$")
	public void set_password_security_policy_something_and_password_reset_period_days_something_in_gp(
			String pwdSecPolicy, String pwdResetPeriod) throws Throwable {
		logger.info("Set Password Security Policy and Password Reset Period days in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		boolean pwdSecPolicy1 = Boolean.parseBoolean(pwdSecPolicy);
		testContextObject.pom.globalPolicyPO().setPasswordSecurityPolicyAndPasswordResetPeriodDays(pwdSecPolicy1,
				pwdResetPeriod);
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@Given("Delete SMS and Mail log")
	public void delete_sms_and_mail_log(io.cucumber.datatable.DataTable dataTable) throws Throwable {
		logger.info("Delete SMS and Mail log Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Mobile Number: "+data.get("mobilenumber"));
			String mobile = data.get("mobilenumber");
			String mail = data.get("Email");
			Thread.sleep(1000);
			String mailDelete = "Delete Mx_MailLog where UPPER(MToID)=UPPER('" + mail + "')";
			testContextObject.baseTest.updateORDeleteDatabase(mailDelete);
			// logger.debug(mailDelete);
			Thread.sleep(1000);
			String smsDelete = "Delete Mx_SMSLog where UPPER(SPhNo)=UPPER('" + mobile + "')";
			testContextObject.baseTest.updateORDeleteDatabase(smsDelete);
			// logger.debug(smsDelete);
			Thread.sleep(1000);
			String whatsappDelete = "Delete Mx_WhatsAppLog where UPPER(WPhNo)=UPPER('" + mobile + "')";
			testContextObject.baseTest.updateORDeleteDatabase(whatsappDelete);
		}
		String alertDisable = "update Mx_TriggerEvtMst set TEvtSMS=0, TEvtMail=0, TEvtWhatsApp=0 where UPPER(TEvtID) in (70,71,50,16,17,45,46,58,59,60,61,62,64,72,77,89,90,94,97,6,7,8,9)";
		testContextObject.baseTest.updateORDeleteDatabase(alertDisable);
		// Mayank - 70 & 71 Alerts are auto triggered while we create user or Contractor
		// so need to disable
		// 50 is Indentification Server inactive
		// Others are Visitor module alerts
	}

	@Given("Set Alert Configuration {string}") // Mayank
	public void set_alert_configuration(String event) throws InterruptedException {
		logger.info("Set Alert Configuration Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToAlertMessageConfiguration();
		testContextObject.pom.alertMessageConfigPO().alertEventSelection(event);
		String val = testContextObject.pom.alertMessageConfigPO().messageSelection();
		Assert.assertEquals(val, "Saved Successfully");
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@And("^Set Send Alert to parameters for \"([^\"]*)\" Alert$")
	public void set_send_alert_to_parameters_for_something_alert(String event) throws Throwable {
		logger.info("Set Send Alert to parameters Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToAlertMessageConfiguration();
		testContextObject.pom.alertMessageConfigPO().alertEventSelection(event);
		String val = testContextObject.pom.alertMessageConfigPO().sendAlertTo(event);
		Assert.assertEquals(val, "Saved Successfully");
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@Given("Update Alert Configuration {string}") // Mayank
	public void update_alert_configuration(String event, io.cucumber.datatable.DataTable table)
			throws InterruptedException {
		logger.info("Update Alert Configuration Started");
		// for (Map<String, String> data : table.asMaps(String.class, String.class)) {
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToAlertMessageConfiguration();
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			testContextObject.pom.alertMessageConfigPO().alertEventSelection(event);
			testContextObject.pom.alertMessageConfigPO().clickOnAdditionalMsgParameters();
			testContextObject.pom.alertMessageConfigPO().alertParametersConfiguration(event, data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@Given("Assign User in Alert {string}") // Mayank
	public void assign_user_in_alert(String event, io.cucumber.datatable.DataTable table) throws InterruptedException {
		logger.info("Assign User in Alert Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToAlertMessageConfiguration();
		testContextObject.pom.alertMessageConfigPO().alertEventSelection(event);
		testContextObject.pom.alertMessageConfigPO().clickOnAssignAlert();
		if (event.equalsIgnoreCase("Worker Induction Approval/Rejection")) {
			for (Map<String, String> data : table.asMaps(String.class, String.class)) {
				logger.info("UserID: "+data.get("UserID"));
				testContextObject.pom.alertMessageConfigPO().assignContractors(data.get("UserID"));
			}
		} else if (event.equalsIgnoreCase("Contractor Details Alert")) {
			for (Map<String, String> data : table.asMaps(String.class, String.class)) {
				logger.info("UserID: "+data.get("UserID"));
				testContextObject.pom.alertMessageConfigPO().assignUsersContractors(data);
			}
		} else {
			for (Map<String, String> data : table.asMaps(String.class, String.class)) {
				//logger.info("UserID: "+data.get("UserID"));
				testContextObject.pom.alertMessageConfigPO().assignUsers(data);
			}
		}
		testContextObject.pom.abstractMethod().saveButtonClick();
		String val = testContextObject.pom.abstractMethod().validationMessage();
		Assert.assertEquals(val, "Saved Successfully");
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@Then("Validate SMS and Email Alert for Users")
	public void validate_sms_and_email_alert_for_users(DataTable dataTable) throws InterruptedException {
		logger.info("Validate SMS and Email Alert for Users Started");
//		logger.debug(product);
//		logger.debug(taskSchedulerName);
		if (AbstractMethod.product != null && AbstractMethod.product.contains("VYOM") && AbstractMethod.taskSchedulerName.equalsIgnoreCase("Database Backup")) {
			logger.debug(
					"COSEC VYOM is installed and You try to verify alert of Database Backup but it's not supported.");
		} else {
			testContextObject.pom.homePO().goTOAdminModule();
			testContextObject.pom.adminPO().goToAlertView();
			List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
			testContextObject.pom.alertViewPO().countCheckForAlert(data);
			testContextObject.pom.alertViewPO().homeButtonClick();
		}
	}

	// GLobal Policy > User
	@Given("Set Temperature and Symptoms Configuration in GP")
	public void set_temperature_and_symptoms_configuration_in_gp(io.cucumber.datatable.DataTable table)
			throws InterruptedException {
		logger.info("Set Temperature and Symptoms Configuration in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("TempConfig: "+data.get("TempConfig")+" TempThreshold: "+data.get("TempThreshold"));
			boolean tempConfig1 = Boolean.parseBoolean(data.get("TempConfig"));
			boolean symptomsConfig1 = Boolean.parseBoolean(data.get("SymptomsConfig"));
			String actual = testContextObject.pom.globalPolicyPO().setTemperatureAndSymptomsConfiguration(tempConfig1,
					data.get("TempUnit"), data.get("TempThreshold"), symptomsConfig1, data.get("SymptomsThreshold"));
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@When("Create Task scheduler {string}")
	public void create_task_scheduler(String taskScheduler, io.cucumber.datatable.DataTable table)
			throws InterruptedException {
		logger.info("Create Task scheduler Started");
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("SchedulerName: "+data.get("SchedulerName"));
			testContextObject.pom.homePO().goTOAdminModule();
			testContextObject.pom.adminPO().goToTaskScheduler();
			testContextObject.pom.taskSchedulerPO().createTaskSchedulerMainMethod(taskScheduler,
					 data);
			testContextObject.pom.systemAccountPO().homeButtonClick();
		}
	}

	@Given("Delete Task Scheduler")
	public void delete_task_scheduler(io.cucumber.datatable.DataTable table) throws InterruptedException {
		logger.info("Delete Task Scheduler Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToTaskScheduler();
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("SchedulerName: "+data.get("SchedulerName"));
			testContextObject.pom.taskSchedulerPO().deleteTaskScheduler(data.get("SchedulerName"));
		}
		Thread.sleep(2000);
		testContextObject.pom.systemAccountPO().homeButtonClick();
		Thread.sleep(1000);
	}

	// Mayank
	@When("Send Alert APTA Auto Sign-In Configuration from Alert Configuration")
	public void send_alert_apta_auto_sign_in_configuration_from_alert_configuration(
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Send Alert APTA Auto Sign-In Configuration from Alert Configuration Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToAlertMessageConfiguration();
		testContextObject.pom.alertMessageConfigPO().alertEventSelection("APTA Auto Sign-In Configuration");
		testContextObject.pom.alertMessageConfigPO().clickOnSendAlert();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String actual = testContextObject.pom.alertMessageConfigPO().sendAlertForAptaAutoSignIn(data);
			Assert.assertEquals(actual, "Alert Queued Successfully");
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	// Mayank
	@Given("Create Location from Location master")
	public void create_location_from_location_master(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create Location from Location master Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToLocationMaster();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Code: "+data.get("Code"));
			String code = data.get("Code");
			String name = data.get("Name");
			String type = data.get("Type");
			String bleCode = data.get("BLECode");
			String bleName = data.get("BLEName");
			String latitude = data.get("Latitude");
			String longitude = data.get("Longitude");
			String locationRadiusMeters = data.get("LocationRadiusMeters");
			String wifiMAC = data.get("WiFiMAC");
			String address = data.get("Address");
			String actual = testContextObject.pom.locationMasterPO().createLocationMaster(code, name, type, bleCode,
					bleName, latitude, longitude, locationRadiusMeters, wifiMAC, address);
			Assert.assertEquals(actual, data.get("validation"));
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	// GLobal Policy > CWM --Mayank
	@Given("Set CWM Parameters in GP")
	public void set_cwm_parameters_in_gp(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Set CWM Parameters in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("WorkerAssignmentFromCSS: "+data.get("WorkerAssignmentFromCSS"));
			String val = testContextObject.pom.globalPolicyPO().cwmParametersInGP(data);
			// If any induction approval pending then we can not change in GP so need to reject first
			if (val.equalsIgnoreCase("Settings cannot be changed as approval request is pending fo...")) {
				testContextObject.pom.abstractMethod().cancelButtonClick();
				testContextObject.pom.systemAccountPO().homeButtonClick();
				testContextObject.pom.homePO().goToCWMmodule();
				testContextObject.pom.contractorWorkerManagementPO().goToInductionApprovals();
				testContextObject.pom.inductionApprovalPO().inductionApprovalsWithAllWorkOrderAndAllWorkers("Reject");
				testContextObject.pom.systemAccountPO().homeButtonClick();
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToGlobalPolicy();
				val = testContextObject.pom.globalPolicyPO().cwmParametersInGP(data);
				Assert.assertEquals(val, "Saved Successfully");
			}
			else {
				Assert.assertEquals(val, "Saved Successfully");
			}
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	// *******************Report Scheduler related Code Start here***

	@And("Set system date format {string} in global policy.")
	public void set_system_date_format(String string) throws Exception {
		logger.info("Set system date format in global policy Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		String val = testContextObject.pom.globalPolicyPO().setSystemDateFormat(string);
		Assert.assertEquals(val, "Saved Successfully");
		testContextObject.pom.adminPO().homeButtonClick();
	}

	@Given("Report configuration in Report Scheduler")
	public void report_configuration_in_report_scheduler(DataTable dataTable) throws Exception {
		logger.info("Report configuration in Report Scheduler Started");
		testContextObject.baseTest.startStopService("AlertService", "start");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToReportScheduler();
		testContextObject.pom.abstractMethod().countOfReportSchedulerConfiguration = dataTable
				.asMaps(String.class, String.class).size();
		logger.debug("Report scheduler Configuration count :"
				+ testContextObject.pom.abstractMethod().countOfReportSchedulerConfiguration);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("SchedulerType: "+data.get("SchedulerType")+" SchedulerName: "+data.get("SchedulerName"));
			String schedulerType = data.get("SchedulerType");
			String schedulerName = data.get("SchedulerName");
			String active = data.get("Active");
			String report = data.get("Report");
			String emailId = data.get("EmailId");
			String reportFormat = data.get("ReportFormat");
			String scheduleTime = data.get("ScheduleTime");
			String scheduleRunDay = data.get("ScheduleRunDay");
			String everyDayOfMonth = data.get("EveryDayOfMonth");
			testContextObject.pom.abstractMethod().deleteRSExistFileInASforReportScheduler(report, schedulerName,
					schedulerType);
			String validation = testContextObject.pom.reportSchedulerPO().reportSchedulerConfiguration(schedulerType,
					schedulerName, active, report, emailId, reportFormat, scheduleTime, scheduleRunDay,
					everyDayOfMonth);
			Assert.assertEquals(validation, "Saved Successfully");
			testContextObject.pom.abstractMethod().reloadPageButtonClick();
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Then("Validate report scheduler")
	public void validate_report_scheduler(DataTable dataTable) throws Exception {
		logger.info("Validate report scheduler Started");
//		testContextObject.pom.homePO().goTOAdminModule();
//		testContextObject.pom.adminPO().goToGlobalPolicy();
		logger.debug(AbstractMethod.treeR);
//		String systemDateFormat = testContextObject.pom.globalPolicyPO().getSystemDateFormat();
		String systemDateFormat=GlobalPolicyPO.dateFormatSelected;
		System.out.println("system Date Format:"+systemDateFormat );
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Report: "+data.get("Report"));
			String report = data.get("Report");
			String fileFormat = data.get("FileFormat");
			String compare = data.get("Compare");
			String actualfile = testContextObject.pom.abstractMethod().findActualFileNamePathforReportScheduler(report,
					fileFormat);
			Assert.assertNotEquals(actualfile, "Actual File Not Found!!!");
			Thread.sleep(1500);
			String expectedFile = testContextObject.pom.abstractMethod().findExpectedFileNamePathforReports(report,
					fileFormat, systemDateFormat);
			Assert.assertNotEquals(actualfile, "Expected File Not Found!!!");
			logger.debug("*********************Actual File Path :" + actualfile);
			logger.debug("*********************Expected File Path :" + expectedFile);
			String result = testContextObject.baseTestReport.compareFiles(expectedFile, actualfile);
			Assert.assertEquals(result, compare);
		}
//		String val = testContextObject.pom.globalPolicyPO().setSystemDateFormat("dd/mm/yyyy");
//		Assert.assertEquals(val, "Saved Successfully");
//		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Export Data from Admin Module")
	public void export_data_from_admin_module(DataTable dataTable) throws Exception {
		logger.info("Export Data from Admin Module Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToExportData();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("TemplateType: "+data.get("TemplateType")+" Template: "+data.get("Template"));
			String eventSelection = null;
			String templateType = data.get("TemplateType");
			String template = data.get("Template");
			String fromDate = data.get("FromDate");
			String toDate = data.get("ToDate");
			String month = data.get("Month");
			String year = data.get("Year");
			String fileFormat = data.get("FileFormat");
			String fileName = data.get("FileName");
			if (data.containsKey("EventSelection")) {
				eventSelection = data.get("EventSelection");
			}
			String selectUsers = data.get("SelectUsers");
			testContextObject.pom.exportDataPO().exportData(templateType, template, fromDate, toDate, month, year,
					fileFormat, fileName, eventSelection, selectUsers);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Given("Create Visitor Form from admin module")
	public void create_visitor_form_from_admin_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create Visitor Form from admin module Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToFormBuilderPage();
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String actual = testContextObject.pom.formBuilderPO().createForm(data);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// Mayank
	@Given("Delete Visitor Form {string} from Database")
	public void delete_visitor_form_from_database(String formName) {
		logger.info("Delete Visitor Form from Database Started");
		// Get form id from db
		String databaseFetchingQuery = "select FormID from Mx_FormBuilderMst where UPPER(Name)=UPPER('" + formName + "')";
		String formID = testContextObject.baseTest.getDataFDatabase(databaseFetchingQuery);
		// Delete form
		String deleteFormQuery = "BEGIN DELETE FROM Mx_FormBuilderMst WHERE UPPER(FormID) = UPPER(" + formID + ");\r\n"
				+ "DELETE FROM Mx_FormBuilderQuestionMst WHERE UPPER(FormID) =UPPER(" + formID + ");\r\n"
				+ "DELETE FROM Mx_FormBuilderQuestionDetails WHERE UPPER(FormID) = UPPER(" + formID + ");\r\n"
				+ "UPDATE Mx_VSTRSTLocationMst SET FormID = 0,ExecutionOn = 0,VldTime = null,VldDuration = 0 WHERE UPPER(FormID) = "
				+ formID + ";\r\n"
				+ "UPDATE Mx_VSTRSTLocationMst SET VisitCheckInFormID = 0,VisitCheckInExecutionOn = 0,VisitCheckInVldTime = null,VisitCheckInVldDuration = 0  WHERE UPPER(VisitCheckInFormID) = "
				+ formID + ";\r\n"
				+ "UPDATE Mx_VSTRSTLocationMst SET VisitCheckOutFormID = 0,VisitCheckOutExecutionOn = 0,VisitCheckOutVldTime = null,VisitCheckOutVldDuration = 0 WHERE UPPER(VisitCheckOutFormID) = "
				+ formID + "; END;";
		testContextObject.baseTest.updateORDeleteDatabase(deleteFormQuery);
	}

	// Mayank
	@Given("Set Visitor Management tab parameteres in GP")
	public void set_visitor_management_tab_parameteres_in_gp(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Set Visitor Management tab parameteres in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("AuthForVisitorInitiatedVisit: "+data.get("AuthForVisitorInitiatedVisit"));
			testContextObject.pom.globalPolicyPO().setVisitorManagementTabParameters(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("{string} Report scheduler parameter configuration update")
	public void report_name_parameter_configuration_update(String reportSchName, DataTable dataTable) throws Exception {
		logger.info("Report scheduler parameter configuration update Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToReportScheduler();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ReportName: "+data.get("ReportName"));
			String cfp = null;
			String reportName = data.get("ReportName");
			String startDaysB = data.get("StartDaysB");
			String endDaysB = data.get("EndDaysB");
			String groupNeededInReport = data.get("GroupNeededInReport");
			String groupBy = data.get("GroupBy");
			if (data.containsKey("ConfirmationPeriodDays")) {
				cfp = data.get("ConfirmationPeriodDays");
				logger.debug(data.get("ConfirmationPeriodDays"));
				logger.debug(cfp);
			}
			String actual = testContextObject.pom.reportSchedulerPO().reportParameterUpdate(reportSchName, reportName,
					startDaysB, endDaysB, groupNeededInReport, groupBy, cfp);
			Assert.assertEquals(actual, "Saved Successfully");
			testContextObject.pom.abstractMethod().reloadPageButtonClick();
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	
	// Mayank //Pending
	@Then("Verify Task Scheduler in Scheduler Log")
	public void verify_task_scheduler_in_scheduler_log(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify Task Scheduler in Scheduler Log Started");
		if (AbstractMethod.product != null && AbstractMethod.product.contains("VYOM") && AbstractMethod.taskSchedulerName.equalsIgnoreCase("Database Backup")) {
			logger.debug(
					"COSEC VYOM is installed and You try to verify task scheduler of Database Backup but it's not supported.");
		}
		else {
			testContextObject.pom.homePO().goTOAdminModule();
			testContextObject.pom.adminPO().goToSchedulerLog();
			List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
			testContextObject.pom.schedulerLogPO().taskSchedulerVerify(data);
			testContextObject.pom.schedulerLogPO().homeButtonClick();
		}
	}

	// Mayank
	@When("Set Auto Generate User ID configurations in GP")
	public void set_auto_generate_user_id_configurations_in_gp(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Set Auto Generate User ID configurations in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("AutoGenerateUserID: "+data.get("AutoGenerateUserID"));
			testContextObject.pom.globalPolicyPO().setAutoGenerateUserIDCconfigurations(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// Mayank 
	@When("Set custom fields for {string} in GP")
	public void set_custom_fields_for_in_gp(String userType, io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Set custom fields for in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.globalPolicyPO().setUserCustomFields(userType, data);
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}

	@Given("Create template {string} with DatabaseView = {string} from Admin Module")
	public void create_template_with_database_view_from_admin_module(String string, String string2, DataTable dataTable)
			throws Exception {
		logger.info("Create template with DatabaseView from Admin Module Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToExportData();
		String validationMessage = testContextObject.pom.exportDataPO().createTemplate(string, string2, dataTable);
		Assert.assertEquals(validationMessage, "Saved Successfully");
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@When("Set Auto Generate Worker ID configurations in GP")
	public void set_auto_generate_worker_id_configurations_in_gp(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Set Auto Generate Worker ID configurations in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("AutoGenerateWorkerID: "+data.get("AutoGenerateWorkerID"));
			String val = testContextObject.pom.globalPolicyPO().setAutoGenerateWorkerIDCconfigurations(data);
			// If any induction approval pending then we can not change in GP so need to reject first
			if (val.equalsIgnoreCase("Settings cannot be changed as approval request is pending fo...")) {
				testContextObject.pom.abstractMethod().cancelButtonClick();
				testContextObject.pom.systemAccountPO().homeButtonClick();
				testContextObject.pom.homePO().goToCWMmodule();
				testContextObject.pom.contractorWorkerManagementPO().goToInductionApprovals();
				testContextObject.pom.inductionApprovalPO().inductionApprovalsWithAllWorkOrderAndAllWorkers("Reject");
				testContextObject.pom.systemAccountPO().homeButtonClick();
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToGlobalPolicy();
				val = testContextObject.pom.globalPolicyPO().setAutoGenerateWorkerIDCconfigurations(data);
				Assert.assertEquals(val, "Saved Successfully");
			}
			else {
				Assert.assertEquals(val, "Saved Successfully");
			}
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// Mayank
	@Given("Set ESS parameteres in GP")
	public void set_ess_parameteres_in_gp(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Set ESS parameteres in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("SpecialFunction: "+data.get("SpecialFunction"));
			testContextObject.pom.globalPolicyPO().setESSparameteres(data);
		}
		testContextObject.pom.abstractMethod().saveButtonClick();
		testContextObject.pom.abstractMethod().pageLoadWaitng();
		String validationmsg = testContextObject.pom.abstractMethod().validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		testContextObject.pom.abstractMethod().validationMessageCloseButton.click();
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}

	// Chhaya
	@Given("Create Role and Right from Roles and Rights Configuration")
	public void create_Role_and_Right_from_Roles_and_Rights_Configuration(DataTable dataTable)
			throws InterruptedException {
		logger.info("Create Role and Right from Roles and Rights Configuration Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToSystemAccount();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("RoleName: "+data.get("RoleName"));
			String roleName = data.get("RoleName");
			String module = data.get("Module");
			String menu = data.get("Menu");
			String view = data.get("View");
			String add = data.get("Add");
			String edit = data.get("Edit");
			String delete = data.get("Delete");
			String copyRight = data.get("CopyRightAsPer");
			String hide = data.get("Hide");
			// String print = data.get("Print");
			String autoApprove = data.get("Auto Approve");
			Thread.sleep(2000);
			String actual = testContextObject.pom.rolesAndRigthsPO().createRolesAndRights(roleName, module, menu, view,
					add, edit, delete, copyRight, hide, autoApprove);
			Thread.sleep(2000);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Delete Role and Right {string} from database")
	public void delete_role_and_right_from_database(String stringName) {
		logger.info("Delete Role and Right from database Started");
		// Selecting RoleID
		String selectQuery = "select RoleID from Mx_RoleMst where UPPER(RoleName)= UPPER('" + stringName + "')";
		logger.debug(selectQuery);
		String selectID = testContextObject.baseTest.getDataFDatabase(selectQuery);
		logger.debug(selectID);

		// table 1
		String query1 = "delete from Mx_RoleMst where UPPER(RoleID)=UPPER('" + selectID + "')";
		int DeleteRecord1 = testContextObject.baseTest.updateORDeleteDatabase(query1);
		Assert.assertEquals(DeleteRecord1, 1);

		// table 2
		String query2 = "delete from Mx_RoleRightsApplication where UPPER(RoleID)=UPPER('" + selectID + "')";
		int DeleteRecord2 = testContextObject.baseTest.updateORDeleteDatabase(query2);
		logger.debug("Mx_RoleRightsApplication = " + DeleteRecord2);
		// table 3
		String query3 = "delete from Mx_RoleDet where UPPER(RoleID)=UPPER('" + selectID + "')";
		int DeleteRecord3 = testContextObject.baseTest.updateORDeleteDatabase(query3);
		logger.debug("Mx_RoleDet = " + DeleteRecord3);

		// table 4
		String query4 = "delete from Mx_LoginRoleMst where UPPER(RoleID)=UPPER('" + selectID + "')";
		int DeleteRecord4 = testContextObject.baseTest.updateORDeleteDatabase(query4);
		logger.debug("Mx_LoginRoleMst = " + DeleteRecord4);
	}

	// By Chhaya
	@Given("Assign {string} rights to system account {string}")
	public void assign_rights_to_system_account(String rights, String saId, DataTable dataTable)
			throws InterruptedException {
		logger.info("Assign rights to system account Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToSystemAccount();
		String validationMsg = testContextObject.pom.systemAccountPO().assignGroupWiseRights(rights, saId, dataTable);
		Assert.assertEquals(validationMsg, "Saved Successfully");
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	/////////////////////////////////////////////////////////////////////////////
	///////////////////////// Export To pdf only Report Code ////////////////////
	////////////////////////////////////////////////////////////////////////////

	// By Chhaya
		@When("Generate {string} Report Export Output In PDF Only for Admin Module")
		public void generate_report_export_output_in_pdf_only_for_admin_module(String string, DataTable dataTable) throws Exception {
			logger.info("Generate Report Export Output In PDF Only for Admin Module Started");
			switch (string) {
			case "Contact Info":
				testContextObject.pom.homePO().goTOUserModule();
				testContextObject.pom.userPO().goToContactInfoReport();
				testContextObject.pom.contactInfoReportPO().contactInfoReportAdmin(dataTable);
			default:
				break;
			}
			Thread.sleep(1000);
		}

	// By Chhaya
	@When("Rename Group from Admin Module")
	public void rename_group_from_admin_module(DataTable dataTable) throws InterruptedException {
		logger.info("Rename Group from Admin Module Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToRenameGroupPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("GroupName: "+data.get("GroupName"));
			String groupName = data.get("GroupName");
			String renameAs = data.get("RenameAs");
			String actual = testContextObject.pom.renameGroupPO().renameGroup(groupName, renameAs);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.abstractMethod().homeButtonClick();

	}

	// By Chhaya
	@Then("Verify group name of import data in import data page")
	public void verify_group_name_of_import_data_for_field_in_import_data_page(DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify group name of import data in import data page Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToImportData();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("RenamedGroup: "+data.get("RenamedGroup"));
			String renamedGroupName = data.get("RenamedGroup");
			testContextObject.pom.importDataPO().verifyImportDataGroupName(renamedGroupName);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();

	}

	// by Chhaya
	@Given("Delete System Account User {string} from System Accounts page")
	public void delete_system_account_user_from_system_accounts_page(String deleteSystemAccID)
			throws InterruptedException {
		logger.info("Delete System Account User from System Accounts page Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToSystemAccount();
		testContextObject.pom.systemAccountPO().deleteSystemAcountUser(deleteSystemAccID);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// by Chhaya
	@Given("Delete Role and Right {string} from Roles and Rights Configuration page")
	public void delete_role_and_right_from_roles_and_rights_configuration_page(String deleteRoleID)
			throws InterruptedException {
		logger.info("Delete Role and Right from Roles and Rights Configuration page Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToSystemAccount();
		testContextObject.pom.rolesAndRigthsPO().deleteRoleAndRight(deleteRoleID);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Given("Set Reports parameters in GP")
	public void set_reports_parameters_in_gp(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Set Reports parameters in GP page Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ReportExportOutputInPDFOnly: "+data.get("ReportExportOutputInPDFOnly"));
			testContextObject.pom.globalPolicyPO().setReportsparameteres(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// By Chhaya
	@Given("Write Message {string} and subject {string} on {string} tab on Message board in Admin Module")
	public void write_message_and_subject_on_tab_on_message_board_in_admin_module(String message, String subject,
			String tabName) throws InterruptedException {
		logger.info("Write Message and subject on Message board in Admin Module Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToMessageBoard();
		String actual = testContextObject.pom.messageBoardPO().createMessageBoard(message, subject, tabName);
		Assert.assertEquals(actual, "Saved Successfully");
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//Chhaya
	@Then("Import {string} from Admin Module and check Imported Data for {string}")
	public void import_from_admin_module_and_check_imported_data_for(String fileFormat, String strName, DataTable dataTable) throws IOException, InterruptedException {
		logger.info("Import "+fileFormat+" from Admin Module and check Imported Data Started");
		testContextObject.baseTest.xlsFileConvertInToCSV(strName);
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToImportData();
		testContextObject.pom.importDataPO().importData(fileFormat, strName, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//Chhaya
	@Then("Verify Location from Location Master page")
	public void verify_location_from_location_master_page(DataTable dataTable) throws InterruptedException {
		logger.info("Verify Location from Location Master page Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToLocationMaster();
		testContextObject.pom.locationMasterPO().verifyLocationName(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Create Agreement Builder from admin module")
	public void create_agreement_builder_from_admin_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Agreement Builder from admin module Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToAgreementBuilderPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			testContextObject.pom.agreementBuilderPO().createAgreementB(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}
	
	//Chirag Analysis regarding Acustom alert
			@Given("Set Alert Message Preview in Alert {string}")
			public void set_alert_message_preview_in_alert(String string, DataTable dataTable)throws Exception {
				logger.info("Email message priview edit in Alert Started");
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToAlertMessageConfiguration();
				for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
					logger.info("Mail Content: "+data.get("Mail"));
					logger.info("Mail Content: "+data.get("Mail1"));
					logger.info("Mail Content: "+data.get("Mail2"));
					logger.info("SMS Content: "+data.get("SMS"));
					logger.info("What's App Content: "+data.get("WhatsApp"));
					
					String mail = data.get("Mail");
					String mail1 = data.get("Mail1");
					String mail2 = data.get("Mail2");
					String sms = data.get("SMS");
					String sms1 = data.get("SMS1");
					String sms2 = data.get("SMS2");
					String whatsAPP = data.get("WhatsApp");
					String whatsAPP1 = data.get("WhatsApp1");
					String whatsAPP2 = data.get("WhatsApp2");
					if (testContextObject.baseTest.checkProduct().equalsIgnoreCase("EVERTECT")) {
						if (mail != null) {
							mail = mail.replaceAll("COSEC", "EVERTECT");
						}
						if (mail1 != null) {
							mail1 = mail1.replaceAll("COSEC", "EVERTECT");
						}
						if (mail2 != null) {
							mail2 = mail2.replaceAll("COSEC", "EVERTECT");
						}
						if (sms != null) {
							sms = sms.replaceAll("COSEC", "EVERTECT");
						}
						if (sms1 != null) {
							sms1 = sms1.replaceAll("COSEC", "EVERTECT");
						}
						if (sms2 != null) {
							sms2 = sms2.replaceAll("COSEC", "EVERTECT");
						}
						if (whatsAPP != null) {
							whatsAPP = whatsAPP.replaceAll("COSEC", "EVERTECT");
						}
						if (whatsAPP1 != null) {
							whatsAPP1 = whatsAPP1.replaceAll("COSEC", "EVERTECT");
						}
						if (whatsAPP2 != null) {
							whatsAPP2 = whatsAPP2.replaceAll("COSEC", "EVERTECT");
						}
					}
					testContextObject.pom.alertMessageConfigPO().mailEdit(string, mail,mail1,mail2,sms,sms1,sms2,whatsAPP,whatsAPP1,whatsAPP2);
				}
				testContextObject.pom.userConfigurationPO().homeButtonClick();
			}
		
	
	//Chhaya
	@Given("Verify Role rights for RoleName= {string} {string}")
	public void verify_role_rights_for_role_name(String roleName, String module, DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify Role rights Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToSystemAccount();
		Thread.sleep(1200);
		testContextObject.pom.rolesAndRigthsPO().verifyRoleRights(roleName, module, dataTable);
		Thread.sleep(1200);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Make {string} user Active= {string}")
	public void make_user_active(String userId, String active) throws InterruptedException {
		logger.info("Make User Active Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToSystemAccount();
		testContextObject.pom.systemAccountPO().userActiveInactive(userId, active);
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	// Mayank
	@Given("Set Whatsapp Configuration")
	public void set_whatsapp_configuration() throws InterruptedException {
		logger.info("Set Whatsapp Configuration Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToWhatsappConfiguration();
		testContextObject.pom.whatsappConfigurationPO().setWhatsappConfiguration();
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	// Mayank
	@Given("Set User Parameters in GP")
	public void set_user_parameters_in_gp(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Set User parameters in GP page Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.globalPolicyPO().setUserparameteres(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}
	//Aagam
	@Given("Set Login Parameters in GP")
	public void set_Login_parameters_in_gp(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Set Login parameters in GP page Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.globalPolicyPO().setLoginparameteres(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}
	
	// Mayank
	@Given("Set Deny Password Reuse {string} and Reuse Count For ESS Users {string} in GP")
	public void set_deny_password_reuse_and_reuse_count_for_ess_users_in_gp(String denyPwdReuse, String reuseCount) throws InterruptedException {
		logger.info("Set Deny Password Reuse and Reuse Count For ESS Users in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		boolean denyPwdReuse1 = Boolean.parseBoolean(denyPwdReuse);
		testContextObject.pom.globalPolicyPO().passwordReuseForESS(denyPwdReuse1, reuseCount);
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@Given("Set Job Costing in GP")
	public void set_job_costing_in_gp(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Set Job Costing in GP Started");
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.globalPolicyPO().setJobCostingParameter(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Import {string} from Admin Module and Imported {string}")
	public void import_from_admin_module_and_imported(String string, String string2) throws InterruptedException {
	    // Write code here that turns the phrase above into concrete actions
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToImportData();
		testContextObject.pom.importDataPO().importDataForSingleSelect(string, string2);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//By Aagam(OTP timer)
	@And("Set OTP timer {string} in GP")
	public void set_otp_timer_in_gp(String string) throws InterruptedException {
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		testContextObject.pom.globalPolicyPO().setOTPtimer(string);
		testContextObject.pom.globalPolicyPO().homeButtonClick();
	}
	
}
