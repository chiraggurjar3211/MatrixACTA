package stepDefinations;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import CommonTestAbstract.TestContextObject;
import PageObject.AdminModule.GlobalPolicyPO;
import PageObject.ShiftAndSchedule.ShiftChangeApplicationPO;
import PageObject.TimeAndAttendance.OvertimePolicyPO;
import PageObject.VisitorManagement.VisitorPortalPO;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class CommonSD {
	TestContextObject testContextObject;
	public static Properties prop;
	private static Logger logger = LogManager.getLogger(CommonSD.class);

	public CommonSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@And("Update value of can publish field for all alert service reports.")
	public void update_value_of_can_publish_field_for_all_alert_service_reports() throws Exception {
		logger.info("Update value of can publish field for all alert service reports Started");
		String globalPropertiesFilePath = System.getProperty("user.dir") + "\\src\\test\\resources\\global.properties";
		FileInputStream fis = new FileInputStream(globalPropertiesFilePath);
		prop = new Properties();
		prop.load(fis);
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String path = null;
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")
				|| cosecURL1[3].equalsIgnoreCase("Cosec")) {
			path = "C:\\Program Files (x86)\\Matrix\\COSEC Alerts Service\\Reports";
		} else {
			path = "C:\\Program Files (x86)\\EVERIT\\EVERTECT Alerts Service\\Reports";
		}
		testContextObject.pom.abstractMethod().repxFileDatetimeFieldChange(path);
	}

	@Given("Update value of can publish field for all .repx reports.")
	public void update_value_of_can_publish_field_for_all_repx_reports() throws IOException {
		logger.info("Update value of can publish field for all .repx reports Started");
		String globalPropertiesFilePath = System.getProperty("user.dir") + "\\src\\test\\resources\\global.properties";
		FileInputStream fis = new FileInputStream(globalPropertiesFilePath);
		prop = new Properties();
		prop.load(fis);
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String path = null;
		logger.debug(cosecURL1[3]);
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")
				|| cosecURL1[3].equalsIgnoreCase("Cosec")) {
			path = "C:\\inetpub\\wwwroot\\COSEC\\Reports";
		} else {
			path = "C:\\inetpub\\wwwroot\\EVERTECT\\Reports";
		}
		logger.debug(path);
		testContextObject.pom.abstractMethod().repxFileDatetimeFieldChange(path);
	}

	@When("change system date from current date to {string}.")
	public void change_system_date_from_current_date_to(String string) throws Exception {
		logger.info("change system date Started");
		if (string.length() == 8) {
			// Write code here that turns the phrase above into concrete actions
			int totalConfigurationCount = testContextObject.pom.abstractMethod().countOfReportSchedulerConfiguration;
			testContextObject.baseTest.startStopService("AlertService", "stop");
			Thread.sleep(2000);
			String currentDate = testContextObject.pom.abstractMethod().currentdateSystemDateChangeFormat();
			Thread.sleep(2000);
			// Runtime.getRuntime().exec("cmd /c date " + string);
			testContextObject.pom.abstractMethod().systemDatetimeCHanged(string);
			Thread.sleep(2000);
			int code = testContextObject.baseTest.startStopService("AlertService", "start");
			Assert.assertEquals(code, 0);
			Thread.sleep(2000);
			if (AbstractMethod.reportschedulerType.equalsIgnoreCase("Export Data")) {
				testContextObject.pom.abstractMethod().waitForDefinedMin(3);
			} else {
				int downloadCount = testContextObject.pom.abstractMethod()
						.waitForNewFileToDownloadForReportScheduler(200, totalConfigurationCount);
				logger.debug("Reports scheduler download file list : " + AbstractMethod.treeR);
				Assert.assertEquals(downloadCount, totalConfigurationCount);
				logger.debug("All Files Downloaded in Alerts Service -> Export ");
			}
			int code1 = testContextObject.baseTest.startStopService("AlertService", "stop");
			Assert.assertEquals(code1, 0);
			Thread.sleep(2000);
			// Runtime.getRuntime().exec("cmd /c date " + currentDate);
			testContextObject.pom.abstractMethod().systemDatetimeCHanged(currentDate);
			Thread.sleep(2000);
			testContextObject.baseTest.startStopService("AlertService", "start");
			Thread.sleep(2000);
		} else {
			String date = AbstractMethod.dateSelected(string);
			logger.debug(date);
			String date1 = testContextObject.pom.abstractMethod().dateChangeFormatddMMyy(date);
			logger.info("System Date Change from current date to " + date1);
			logger.debug(date1);
			Thread.sleep(2000);
			testContextObject.baseTest.startStopService("AlertService", "stop");
			Thread.sleep(1000);
			// Runtime.getRuntime().exec("cmd /c date " + date1);
			testContextObject.pom.abstractMethod().systemDatetimeCHanged(date1);
			logger.info(date1 + " Date Change Successfully");
			Thread.sleep(1000);
			int code = testContextObject.baseTest.startStopService("AlertService", "start");
			Assert.assertEquals(code, 0);
			Thread.sleep(2000);
		}
	}

	@Then("Validate report")
	public void validate_Report(DataTable datatable) throws Exception {
		logger.info("Validate report Started");
		String actualfile = null;
		logger.debug("********Download file" + AbstractMethod.downloadFileUsingTestScenario);
		List<String> files = AbstractMethod.downloadFileUsingTestScenario;
//		testContextObject.pom.homePO().goTOAdminModule();
//		testContextObject.pom.adminPO().goToGlobalPolicy();
//		String systemDateFormat = testContextObject.pom.globalPolicyPO().getSystemDateFormat();
		String systemDateFormat = GlobalPolicyPO.dateFormatSelected;
		System.out.println("Global policy Selected dateformat: " + systemDateFormat);
		for (Map<String, String> data : datatable.asMaps(String.class, String.class)) {
			logger.info("Report: " + data.get("Report"));
			String report = data.get("Report");
			String fileFormat = data.get("FileFormat");
			String result = data.get("Compare");
			String expectedFile = testContextObject.pom.abstractMethod().findExpectedFileNamePathforReports(report,
					fileFormat, systemDateFormat);
			Assert.assertNotEquals(expectedFile, "Expected File Not Found!!!");
//			logger.debug(expectedFile);
			for (int i = 0; i < files.size(); i++) {
				if (files.get(i).contains("(")) {
					String[] spliteWithBracket = files.get(i).split("\\(");
					String[] spliteWithBracketExtention = spliteWithBracket[1].split("\\.");
					if ((spliteWithBracket[0].trim().toUpperCase()).equalsIgnoreCase(report.toUpperCase())
							&& spliteWithBracketExtention[1].equalsIgnoreCase(fileFormat)) {
						actualfile = System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataExports\\"
								+ files.get(i);
					}
				} else {
					String[] splitwithdot = files.get(i).split("\\.");
					logger.debug(splitwithdot[0]);
					if ((splitwithdot[0]).equalsIgnoreCase(report.toUpperCase())
							&& splitwithdot[1].equalsIgnoreCase(fileFormat)) {
						actualfile = System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataExports\\"
								+ files.get(i);
					}
				}

			}
//			logger.debug(actualfile);
			String actualcompareFileResult = testContextObject.baseTestReport.compareFiles(expectedFile, actualfile);
			Assert.assertEquals(actualcompareFileResult, result);
			logger.debug("File format " + fileFormat + " Comparison done....");
		}
//		String val = testContextObject.pom.globalPolicyPO().setSystemDateFormat("dd/mm/yyyy");
//		Assert.assertEquals(val, "Saved Successfully");
	}

	// Create By chirag
	@Given("Check all pre-Coditions for automation")
	public void check_all_pre_coditions_for_automation() throws Exception {
		logger.info("Check all pre-Coditions for automation Started");
		// Write code here that turns the phrase above into concrete actions
		String title = testContextObject.pom.loginPO().credential("sa", "admin");
		logger.debug(title);
		if (title.equalsIgnoreCase("Welcome System Admin")) {
			logger.debug("password already set");
			// Go to User module and create or update saess user
			String apiResponseValidation = "success: 0070200001 : saved successfully. User ID = saess";
			String res = testContextObject.baseTest.setAPI(
					"set;Id=saess;name=saess;personal-cell=9898989898;personal-email=saess@gmail.com;ess-login=1;Ess-detail-edit=1;Attendance-via-ess=1;Attendance-calc=1;",
					"sa", "admin", "user", 200);
			Assert.assertEquals(res, apiResponseValidation);
			// Go to Admin module and check email configuration set or not
			testContextObject.pom.homePO().goTOAdminModule();
			testContextObject.pom.adminPO().goToEmailConfiguration();
			testContextObject.pom.emailConfigurationPO().setEmailConfiguration();
			testContextObject.pom.globalPolicyPO().homeButtonClick();
			// Go to Admin module and check SMS configuration set or not
			testContextObject.pom.homePO().goTOAdminModule();
			testContextObject.pom.adminPO().goToSMSConfiguration();
			testContextObject.pom.smsConfigurationPO().setSMSConfiguration();
			testContextObject.pom.globalPolicyPO().homeButtonClick();
			// Go to Admin module and ESS user linked or not on SA user
			testContextObject.pom.homePO().goTOAdminModule();
			testContextObject.pom.adminPO().goToSystemAccount();
			String val = testContextObject.pom.systemAccountPO().linkESSusertoAlreadyCreateUser("sa", "saess");
			Assert.assertEquals(val, "Saved Successfully");
			testContextObject.pom.globalPolicyPO().homeButtonClick();
			// Go to global policy and set Password OR OTP
			testContextObject.baseTest.updateDefaultPolicy("Password Policy");
			testContextObject.baseTest.updateDefaultPolicy("Login");
			testContextObject.pom.homePO().goTOAdminModule();
			testContextObject.pom.adminPO().goToGlobalPolicy();
			testContextObject.pom.globalPolicyPO().setLoginAuthenticationMode("Password OR OTP");

		} else if (title.equalsIgnoreCase("login")) {
			logger.debug("password not set Now Password is set");
			String title1 = testContextObject.pom.loginPO().credential("sa", "admin");
			Assert.assertEquals(title1, "Welcome System Admin");

			// Go to User module and create or update saess user
			String apiResponseValidation = "success: 0070200001 : saved successfully. User ID = saess";
			String res = testContextObject.baseTest.setAPI(
					"set;Id=saess;name=saess;personal-cell=9898989898;personal-email=saess@gmail.com;ess-login=1;Ess-detail-edit=1;Attendance-via-ess=1;Attendance-calc=1;",
					"sa", "admin", "user", 200);
			Assert.assertEquals(res, apiResponseValidation);
			// Go to Admin module and check email configuration set or not
			testContextObject.pom.homePO().goTOAdminModule();
			testContextObject.pom.adminPO().goToEmailConfiguration();
			testContextObject.pom.emailConfigurationPO().setEmailConfiguration();
			testContextObject.pom.globalPolicyPO().homeButtonClick();
			// Go to Admin module and check SMS configuration set or not
			testContextObject.pom.homePO().goTOAdminModule();
			testContextObject.pom.adminPO().goToSMSConfiguration();
			testContextObject.pom.smsConfigurationPO().setSMSConfiguration();
			testContextObject.pom.globalPolicyPO().homeButtonClick();
			// Go to Admin module and ESS user linked or not on SA user
			testContextObject.pom.homePO().goTOAdminModule();
			testContextObject.pom.adminPO().goToSystemAccount();
			String val = testContextObject.pom.systemAccountPO().linkESSusertoAlreadyCreateUser("sa", "saess");
			Assert.assertEquals(val, "Saved Successfully");
		}
		// Add "or" condition for old version of COSEC -- By Mayank
		else if (title.contains("OTP (valid for 3 mins) has been sent to your registered")
				|| title.contains("OTP has been sent to your registered")) {
			String databaseFetchingQuery = "select LoginOTP from Mx_LoginUserMst where UPPER(LoginUserID)=UPPER('sa')";
			String getOTP = testContextObject.baseTest.getDataFDatabase(databaseFetchingQuery);
			Thread.sleep(1000);
			String val = testContextObject.pom.loginPO().enterOTPandClickOnLogin(getOTP);
			Assert.assertEquals(val, "Welcome System Admin");
			// Go to global policy and set Password OR OTP
			testContextObject.baseTest.updateDefaultPolicy("Password Policy");
			testContextObject.baseTest.updateDefaultPolicy("Login");
			testContextObject.pom.abstractMethod().pageRefresh();
//				Thread.sleep(1000);
//				testContextObject.pom.homePO().goTOAdminModule();
//				testContextObject.pom.adminPO().goToGlobalPolicy();
//				testContextObject.pom.globalPolicyPO().setLoginAuthenticationMode("Password OR OTP");
		}

	}

	// Mayank
	@When("Refresh page")
	public void refresh_page() {
		logger.info("Refresh page Started");
		testContextObject.pom.loginPO().pageRefresh();
	}

	// *********************Service Start Stop **********************************
	@When("Start Stop Service from Command Propmt")
	public void start_stop_service_from_command_propmt(io.cucumber.datatable.DataTable dataTable) throws Exception {
		logger.info("Start Stop Service from Command Propmt Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Service: " + data.get("Service") + " Status: " + data.get("Status"));
			int exitcode = testContextObject.baseTest.startStopService(data.get("Service"), data.get("Status"));
			// Assert.assertEquals("Command ExitCode = " + exitcode, "Command ExitCode =
			// 0");
			Thread.sleep(2000);
		}
	}

	@Then("Validate exported file")
	public void validate_exported_file(DataTable dataTable) throws Exception {
		logger.info("Validate exported file Started");
		String actualfile = null;
		logger.debug("********Download file" + AbstractMethod.downloadFileUsingTestScenario);
		List<String> files = AbstractMethod.downloadFileUsingTestScenario;
		testContextObject.pom.homePO().goTOAdminModule();
		testContextObject.pom.adminPO().goToGlobalPolicy();
		String systemDateFormat = testContextObject.pom.globalPolicyPO().getSystemDateFormat();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FileName: " + data.get("FileName") + " FileFormat: " + data.get("FileFormat"));
			String fileName = data.get("FileName");
			String fileFormat = data.get("FileFormat");
			String compare = data.get("Compare");
			String expectedFile = testContextObject.pom.abstractMethod()
					.findExpectedFileNamePathforExportReports(fileName, fileFormat, systemDateFormat);

//				logger.debug(expectedFile);
			for (int i = 0; i < files.size(); i++) {
				if (files.get(i).contains("(")) {
					String[] spliteWithBracket = files.get(i).split("\\(");
					String[] spliteWithBracketExtention = spliteWithBracket[1].split("\\.");
					if ((spliteWithBracket[0].trim().toUpperCase()).equalsIgnoreCase(fileName.toUpperCase())
							&& spliteWithBracketExtention[1].equalsIgnoreCase(fileFormat)) {
						actualfile = System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataExports\\"
								+ files.get(i);
					}
				} else {
					String[] splitwithdot = files.get(i).split("\\.");
					logger.debug(splitwithdot[0]);
					if ((splitwithdot[0]).equalsIgnoreCase(fileName.toUpperCase())
							&& splitwithdot[1].equalsIgnoreCase(fileFormat)) {
						actualfile = System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataExports\\"
								+ files.get(i);
					}
				}

			}
//				logger.debug(actualfile);
			String actualcompareFileResult = testContextObject.baseTestReport.compareFiles(expectedFile, actualfile);
			Assert.assertEquals(actualcompareFileResult, compare);
			logger.debug("File format " + fileFormat + " Comparison done....");
		}
		String val = testContextObject.pom.globalPolicyPO().setSystemDateFormat("dd/mm/yyyy");
		Assert.assertEquals(val, "Saved Successfully");
	}

	// Chhaya
	@Given("Open {string} Page in {string} Module")
	public void open_page_in_module(String string, String string2) throws InterruptedException {
		logger.info("Open " + string + " Page in " + string2 + " Module Started");
		testContextObject.pom.homePO().findModule(string, string2);
	}

	// By Chhaya
	@Then("verify Page rights")
	public void verify_page_rights(DataTable dataTable) throws InterruptedException {
		logger.info("verify Page rights Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Menu: " + data.get("Menu"));
			String menu = data.get("Menu");
			String view = data.get("View");
			String add = data.get("Add");
			String edit = data.get("Edit");
			String delete = data.get("Delete");
			testContextObject.pom.homePO().verifyPageRights(menu, view, add, edit, delete);
		}
		Thread.sleep(2000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// By Chhaya
	@Then("Verify {string} Module is displayed or Not - {string}")
	public void verify_module_is_displayed_or_not(String module1, String stringValue) throws InterruptedException {
		logger.info("Verify Module is displayed or Not Started");
		testContextObject.pom.homePO().verifyModuleRights(module1, stringValue);
		Thread.sleep(2000);
	}

	@Then("Verify Launch Page should be {string}")
	public void verify_launch_page_should_be(String menu) throws InterruptedException {
		logger.info("Verify Launch Page Started");
		testContextObject.pom.homePO().verifyLaunchPage(menu);
		Thread.sleep(2000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// By Chhaya
	@Then("Verify file format of export report")
	public void verify_file_format_of_export_report(DataTable dataTable) throws InterruptedException {
		logger.info("Verify file format of export report Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ExportTo: " + data.get("ExportTo"));
			String fileFormat = data.get("ExportTo");
			testContextObject.pom.abstractMethod().verifyExportReportFileFormat(fileFormat);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// By Chhaya
	@Given("Verify Page name in {string} module")
	public void verify_page_name_in_module(String module, DataTable dataTable) throws InterruptedException {
		logger.info("Verify Page name Started");
		switch (module) {
		case "Users":
			testContextObject.pom.homePO().goTOUserModule();
			break;
		case "CWM":
			testContextObject.pom.homePO().goToCWMmodule();
			break;
		case "JPC":
			testContextObject.pom.homePO().goToJPCmodule();
			;
			break;
		default:
			break;
		}

		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("RenamedPage: " + data.get("RenamedPage"));
			String renamedPage = data.get("RenamedPage");
			testContextObject.pom.abstractMethod().verifyPageName(renamedPage);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();

	}

	// By Chhaya
	@Then("Verify Header {string}")
	public void verify_header(String headerName, DataTable dataTable) throws InterruptedException {
		logger.info("Verify Header Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ModuleName: " + data.get("ModuleName"));
			String module = data.get("ModuleName");
			switch (module) {
			case "Admin":
				testContextObject.pom.homePO().goTOAdminModule();
				break;
			case "Users":
				testContextObject.pom.homePO().goTOUserModule();
				break;
			case "Enterprise Structure":
				testContextObject.pom.homePO().goTOEnterpriseModule();
				;
				break;
			default:
				break;
			}
			testContextObject.pom.homePO().verifyHeaderName(headerName);
			Thread.sleep(1000);
			testContextObject.pom.abstractMethod().homeButtonClick();
		}

	}

	@When("Import Data {string}")
	public void import_data(String string, DataTable dataTable) throws Exception {
		logger.info("Import Data Started");
		testContextObject.baseTest.updateImportSheet(string, dataTable);
	}

	@Then("Import {string} and check Imported Data for {string}")
	public void import_and_check_imported_data_for(String fileFormat, String strName, DataTable dataTable)
			throws InterruptedException, IOException {
		logger.info("Import File and check Imported Data Started");
		String xlsFile = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		String xlsxFile = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xlsx";
		try {
			testContextObject.baseTest.xlsFileConvertInToCSV(strName);
			testContextObject.baseTest.convertXLStoXLSX(xlsFile, xlsxFile);
			logger.debug("XLSX and CSV file Conversion completed successfully.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		switch (strName) {
		case "User":
			testContextObject.pom.homePO().goTOUserModule();
			testContextObject.pom.userPO().goToImportUsersPage();
			testContextObject.pom.importUserPO().importFile(fileFormat, dataTable);
			break;
		case "Invite User":
			testContextObject.pom.homePO().goTOUserModule();
			testContextObject.pom.userPO().goToInviteUserPage();
			testContextObject.pom.inviteUserPO().importUserFrmInviteUser(fileFormat, dataTable);
			break;
		case "Health Declaration":
			testContextObject.pom.homePO().goTOUserModule();
			testContextObject.pom.userPO().goToImportHealthDeclarPage();
			testContextObject.pom.importHealthDeclarationPO().impDataForHealthDeclaration(fileFormat, dataTable);
			break;
		case "Shift Schedule":
			testContextObject.pom.homePO().goTOShiftAndScheduleModule();
			testContextObject.pom.shiftAndSchedulePO().goToManualScheduleImport();
			testContextObject.pom.manualScheduleImportPO().importShiftSchedule(fileFormat, dataTable);
			break;
		case "Field Schedule":
			testContextObject.pom.homePO().goToFVMmodule();
			testContextObject.pom.fieldVisitManagementPO().goToFieldVisitSchedule();
			testContextObject.pom.fieldVisitSchedulePO().createFieldVisitViaImport(fileFormat, dataTable);
			break;
		case "Leave Balance":
			testContextObject.pom.homePO().goToLeaveManagementModule();
			testContextObject.pom.leaveManagementPO().goToImportLeaveBalancePage();
			testContextObject.pom.importLeaveBalancePO().importLeaveBalance(fileFormat, dataTable);
			break;
		case "Visitor and Visit":
			testContextObject.pom.homePO().goToVisitormodule();
			testContextObject.pom.visitorManagementPO().goToImportPage();
			testContextObject.pom.importDataVisitorVisitPO().importVisitorVisit(fileFormat, dataTable);
			break;
		case "Workers":
			testContextObject.pom.homePO().goToCWMmodule();
			testContextObject.pom.contractorWorkerManagementPO().gotoImportDataPage();
			testContextObject.pom.importDataCWMPO().importWorkers(fileFormat, dataTable);
			break;
		case "Attendance Exception":
			testContextObject.pom.homePO().goToTimeAndAttendanceModule();
			testContextObject.pom.timeAndAttendancePO().goToManageAttendancePage();
			testContextObject.pom.manageAttendancePO().importManageAtdData(fileFormat, dataTable);
			break;
		case "Job":
			testContextObject.pom.homePO().goToJPCmodule();
			testContextObject.pom.jobProcessingCostingPO().goToImportDataPage();
			testContextObject.pom.importDataJPCPO().importJob(fileFormat, dataTable);
			break;
		case "Purchase":
			testContextObject.pom.homePO().goToCafeteriamodule();
			testContextObject.pom.cafeteriaManagementPO().goToTransactionSummary();
			testContextObject.pom.transactionSummaryPO().importPurchase(fileFormat, dataTable);
			break;
		default:
			logger.debug("Invalid Name");
			break;
		}
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chirag
	@Then("Validate exported file from UI selection.")
	public void validate_exported_file_From_UI_Selection(DataTable dataTable) throws Exception {
		logger.info("Validate exported file from UI selection Started");
		String actualfile = null;
		String expectedFile = null;
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FileName: " + data.get("FileName") + " FileFormat: " + data.get("FileFormat"));
			String fileName = data.get("FileName");
			String fileFormat = data.get("FileFormat");
			String compare = data.get("Compare");
			File files2 = new File(
					System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataResource\\ExportDataReports");
			for (File file1 : files2.listFiles()) {
				if (file1.getName().contains(fileName)
						&& (file1.getName().substring(file1.getName().length() - 3).equalsIgnoreCase(fileFormat))) {
					logger.debug("Final expectedFile file name :" + file1.getName());
					expectedFile = System.getProperty("user.dir")
							+ "\\src\\test\\resources\\TestDataResource\\ExportDataReports\\" + file1.getName();
					break;
				}
			}
			logger.debug(expectedFile);
			Thread.sleep(30000);
			File files = new File(System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataExports");
			for (File file : files.listFiles()) {
				Date date = new Date();
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				cal.add(Calendar.MINUTE, -3);
				date = cal.getTime();
				if (date.getTime() < file.lastModified()) {
					if (file.getName().contains(fileName)
							&& (file.getName().substring(file.getName().length() - 3).equalsIgnoreCase(fileFormat))) {
						logger.debug("Final file name :" + file.getName());
						actualfile = System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataExports\\"
								+ file.getName();
						break;
					}
				}
			}
			String actualcompareFileResult = testContextObject.baseTestReport.compareFiles(expectedFile, actualfile);
			Assert.assertEquals(actualcompareFileResult, compare);
			logger.debug("File format " + fileFormat + " Comparison done....");
		}
	}

////////////////***********************************************//////////////////
///////////// API Related CODE start Here/////////////////////////////
//////////////// ***********************************************//////////////////

	@When("Execute scenario start from {string} to {string} in API sheet named {string}.")
	public void execute_scenario_start_from_to_in_api_sheet_named(String string, String string2, String string3)
			throws Exception {
		logger.info("Execute API scenarios started");
		// Write code here that turns the phrase above into concrete actions
		testContextObject.baseTestWebAPI.webAPITest(string, string2, string3);
	}

	@Then("Verify API sheet named {string} and scenario start from {string} to {string} result {string}.")
	public void verify_api_sheet_named_and_scenario_start_from_to_result(String string, String string2, String string3,
			String string4) throws Exception {
		logger.info("executed api results Started");
		testContextObject.baseTestWebAPI.executeReseltVerify(string, string2, string3, string4);
	}

//////////////// ***********************************************//////////////////
///////////// API Related CODE END Here/////////////////////////////
//////////////// ***********************************************//////////////////

	@And("Custom report design Repx file is uploaded in the Report Builder")
	public void custom_report_design_repx_file_is_uploaded_in_the_report_builder(DataTable dataTable) throws Exception {
		testContextObject.pom.homePO().goTOReportBuilderModule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.reportbuilderPO().customReportDesign(data);
		}
		testContextObject.pom.reportbuilderPO().homeButtonClick();
	}

	@When("the UI controls are verified as per the Excel sheet {string}")
	public void the_ui_controls_are_verified_as_per_the_excel_sheet(String string) throws Exception {
		// Write code here that turns the phrase above into concrete actions
		testContextObject.pom.homePO().goTODeviceModule();
		testContextObject.pom.devicePO().goToDeviceConfiguration();
		List<Map<String, String>> data = testContextObject.baseTest.getExcelDataForUIControlValidation(string);
		System.out.println(data);
		switch (string) {
		case "ARGOFACE300Basic":
			testContextObject.pom.deviceConfigurationPO().deviceUIControlValidation_Basic(data, string);
			break;
		case "ARGOFACE300Reader":
			testContextObject.pom.deviceConfigurationPO().deviceUIControlValidation_Readers(data, string);
			break;
		case "ARGOFACE300General":
			testContextObject.pom.deviceConfigurationPO().deviceUIControlValidation_General(data, string);
			break;
		case "ARGOFACE300AccessSettings":
			testContextObject.pom.deviceConfigurationPO().deviceUIControlValidation_AccessSettings(data, string);
			break;
		case "ARGOFACE300Enrollment":
			testContextObject.pom.deviceConfigurationPO().deviceUIControlValidation_Enrollment(data, string);
			break;
		case "ARGOFACE300VoiceGuidance":
			testContextObject.pom.deviceConfigurationPO().deviceUIControlValidation_VoiceGuidance(data, string);
			break;
		case "ARGOFACE300Advanced_Settings":
			testContextObject.pom.deviceConfigurationPO().deviceUIControlValidation_Advanced_Settings(data, string);
			break;
		case "ARGOFACE300Advanced_Alarms":
			testContextObject.pom.deviceConfigurationPO().deviceUIControlValidation_Advanced_Alarms(data, string);
			break;
		case "ARGOFACE300Advanced_Timers":
			testContextObject.pom.deviceConfigurationPO().deviceUIControlValidation_Advanced_Timers(data, string);
			break;
		case "ARGOFACE300Advanced_Wiegand":
			testContextObject.pom.deviceConfigurationPO().deviceUIControlValidation_Advanced_Wiegand(data, string);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + string);
		}

//		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

}
