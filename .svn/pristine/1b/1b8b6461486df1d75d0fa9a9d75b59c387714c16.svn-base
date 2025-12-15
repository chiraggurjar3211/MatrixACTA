package stepDefinations;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import CommonTestAbstract.TestContextObject;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class TimeAndAttendanceSD {
	TestContextObject testContextObject;
	private static Logger logger=LogManager.getLogger(TimeAndAttendanceSD.class);
	
	public TimeAndAttendanceSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@Given("Run Monthly Attendance Process with Close Attendance Period = {string} for Month = {string} and Year = {string}")
	public void run_monthly_attendance_process_with_close_attendance_period_for_month_and_year(String clsAtdPeriod,
			String month, String year, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Run Monthly Attendance Process Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToMonthlyAttendanceProcess();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		String val = testContextObject.pom.monthlyAttendanceProcess().monthlyAttendanceProcess(clsAtdPeriod, month,
				year, data);
		Assert.assertEquals(val, "Process Completed");
		testContextObject.pom.monthlyAttendanceProcess().homeButtonClick();
	}

	@Given("Generate Attendance Correction Application via API")
	public void generate_attendance_correction_application_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Generate Attendance Correction Application via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("userid")+" process-date: "+data.get("process-date"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.attendanceCorrectionPO().attendanceCorrectionApplicationAPI(columnHeader,
					apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			logger.debug(userParameter);
			String appliedBy = data.get("appliedBy");
			logger.debug(appliedBy);
			String apiResponseValidation = "success: 0370200002 : saved successfully";
			String res = testContextObject.baseTest.setAPI(userParameter, appliedBy, "admin", "attendance-correction",200);
			Assert.assertEquals(res, apiResponseValidation);
		}
	}

	@When("Approve Reject Attendance Correction Application via API")
	public void approve_reject_attendance_correction_application_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Approve Reject Attendance Correction Application via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("userid")+" process-date: "+data.get("process-date"));
			// GET API fire for get TID from application
			String userid = data.get("userid");
//			String daterange = testContextObject.pom.abstractMethod().daterangeSelectedForAPI(data.get("process-date"),
//					data.get("process-date"));
			String date = testContextObject.pom.abstractMethod()
					.staticDateOrPlusMinusFromCurrentDate(data.get("process-date"));
			String dateWithoutSlash = date.replace("/", "");
			String daterange = dateWithoutSlash + "-" + dateWithoutSlash;
			logger.debug(daterange);
			String url = "get;user-filter=0;userid=" + userid + ";date-range=" + daterange + ";Status=1;format=json;";
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "attendance-correction", 200);
			String tid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,
					"attendance-correction.application-id");
			// SET API
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			String valmsg;
			testContextObject.pom.attendanceCorrectionApprovalPO().attendanceCorrectionApprovalAPI(columnHeader,
					apiParameter, data, tid);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String ricID = data.get("ricID");
			String res = testContextObject.baseTest.setAPI(userParameter, ricID, "admin",
					"attendance-correction-approval", 200);
			Assert.assertEquals(res, "success: 0470200002 : saved successfully");
		}
	}

	@When("Generate ShortLeave OfficialInOut Application via API")
	public void generate_short_leave_official_in_out_application_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Generate ShortLeave OfficialInOut Application via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("Userid")+" Attendance-date: "+data.get("Attendance-date"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.shortLvOfficialAppApprovalPO().shortLvOfficialApplicationAPI(columnHeader,
					apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String appliedBy = data.get("appliedBy");
			String apiResponseValidation = "success: 0480200002 : saved successfully";
			String res = testContextObject.baseTest.setAPI(userParameter, appliedBy, "admin", "short-leave-entry", 200);
			Assert.assertEquals(res, apiResponseValidation);
		}
	}

	@When("Approve Reject ShortLeave OfficialInOut Application via API")
	public void approve_reject_short_leave_official_in_out_application_via_api(
			io.cucumber.datatable.DataTable dataTable) {
		logger.info("Approve Reject ShortLeave OfficialInOut Application via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("Userid")+" Attendance-date: "+data.get("Attendance-date"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.shortLvOfficialAppApprovalPO().shortLvOfficialAppApprovalAPI(columnHeader,
					apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String ricID = data.get("ricID");
			String apiResponseValidation = "success: 0490200002 : saved successfully";
			String res = testContextObject.baseTest.setAPI(userParameter, ricID, "admin", "short-leave-authorization",
					200);
			Assert.assertEquals(res, apiResponseValidation);
		}
	}

	@When("Generate Advance Overtime Application via API")
	public void generate_advance_overtime_application_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Generate Advance Overtime Application via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("userid")+" OT-date: "+data.get("OT-date"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.advanceOTApplicationPO().advanceOTApplicationAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String appliedBy = data.get("appliedBy");
			String apiResponseValidation = "success: 1110200002 : saved successfully";
			String res = testContextObject.baseTest.setAPI(userParameter, appliedBy, "admin", "overtime-application",
					200);
			Assert.assertEquals(res, apiResponseValidation);
		}
	}

	@When("Approve Reject Advance Overtime Application via API")
	public void approve_reject_advance_overtime_application_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Approve Reject Advance Overtime Application via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("userid")+" OT-date: "+data.get("OT-date"));
			// GET API fire for get TID from application
			String userid = data.get("userid");
			String daterange = testContextObject.pom.abstractMethod().daterangeSelectedForAPI(data.get("OT-date"),
					data.get("OT-date"));
			String url = "get;user-filter=0;userid=" + userid + ";date-range=" + daterange
					+ ";application-status=0;format=json;";
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "overtime-application", 200);
			String tid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,
					"overtime-application.tid");
			// SET API
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			String valmsg;
			testContextObject.pom.advanceOTApprovalPO().advanceOTApprovalAPI(columnHeader, apiParameter, data, tid);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String ricID = data.get("ricID");
			String res = testContextObject.baseTest.setAPI(userParameter, ricID, "admin", "overtime-approval", 200);
			Assert.assertEquals(res, "success: 1120200002 : saved successfully");
		}
	}
	
	@Given("Create NetWork Hours Policy {string}")
	public void create_net_work_hours_policy(String plcName, io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create NetWork Hours Policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToNetworkHoursPolicy();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		String val = testContextObject.pom.netWorkHoursPolicyPO().createNetWorkHoursPolicy(plcName, data);
		Assert.assertEquals(val, "Saved Successfully");
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Create Attendance Policy")
	public void create_attendance_policy(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Attendance Policy Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAttendancePolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("PlcName: "+data.get("PlcName"));
			testContextObject.pom.attendancePolicyPO().createAttendancePolicy(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Create Overtime Policy")
	public void create_overtime_policy(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Overtime Policy Started");
		// logger.debug(columnHeader);
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimePolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("PlcName: "+data.get("PlcName"));
			testContextObject.pom.overtimePolicyPO().createOvertimePolicy(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Overtime Calculation Daily2 Work Component Configuration In Overtime Policy {string}")
	public void overtime_calculation_daily2_work_component_configuration_in_overtime_policy(String plcName,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Overtime Calculation Daily2 Work Component Configuration In Overtime Policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimePolicy();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.overtimePolicyPO().daily2ConfigurationOvertimePolicy(plcName, data);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Overtime Calculation Daily1 Work Component Configuration In Overtime Policy {string}")
	public void overtime_calculation_daily1_work_component_configuration_in_overtime_policy(String plcName,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Overtime Calculation Daily1 Work Component Configuration In Overtime Policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimePolicy();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.overtimePolicyPO().daily1ConfigurationOvertimePolicy(plcName, data);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy {string}")
	public void overtime_calculation_weekly_monthly_work_component_configuration_in_overtime_policy(String plcName,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimePolicy();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.overtimePolicyPO().weeklyMonthlyConfigurationOvertimePolicy(plcName, data);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy {string}")
	public void overtime_rounding_for_fraction_of_an_hour_configuration_in_overtime_policy(String plcName,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimePolicy();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.overtimePolicyPO().OTRoundingForFractionOfAnHourOvertimePolicy(plcName, data);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Verify Monthly process done or not in Attendance Summary Page")
	public void verify_monthly_process_done_or_not_in_attendance_summary_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify Monthly process done or not in Attendance Summary Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAttendanceSummary();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("User: "+data.get("User")+" Processed: "+data.get("Processed"));
			String user = data.get("User");
			boolean processed1 = Boolean.parseBoolean(data.get("Processed"));
			boolean actual = testContextObject.pom.attendanceSummaryPO().verifyMonthlyProcessedOrNot(user);
			Assert.assertEquals(actual, processed1);
		}
		testContextObject.pom.shiftConfigurationPO().homeButtonClick();
	}


	// Chhaya
	@Then("Verify user Attendance in Attendance Summary page for userid= {string} and month= {string} year= {string}")
	public void verify_user_attendance_in_attendance_summary_page_for_userid_and_month_year(String userId,
			String atdMonth, String atdYear, DataTable dataTable) throws InterruptedException {
		logger.info("Verify user Attendance in Attendance Summary page Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAttendanceSummary();
		testContextObject.pom.attendanceSummaryPO().verifyUserAttendanceDetails(userId, atdMonth, atdYear, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Kamal
	@When("{string} Time and Attendence module reports configuration")
	public void report_configuration(String string, DataTable datatable) throws Exception {
		logger.info("Time and Attendence module reports configuration Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendenceModuleReportPO().timeandAttendenceReport(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Kamal
	@When("Create Template {string} in Daily Attendance View.")
	public void createTemplate(String string, DataTable datatable) throws Exception {
		logger.info("Create Template in Daily Attendance View Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().gotoDailyAttendenceView_TemplateConfiguration();
		testContextObject.pom.dailyAttendenceView_TemplatePO().createTemplate(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Kamal
	@When("field configuration in {string} template in Daily Attendance View.")
	public void figurattionofTemplate(String string, DataTable datatable) throws Exception {
		logger.info("field configuration in template in Daily Attendance View Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().gotoDailyAttendenceView_TemplateConfiguration();
		testContextObject.pom.dailyAttendenceView_TemplatePO().fieldConfigurationOfTemplate(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Kamal
	@When("User Selection in {string} template in Daily Attendance View.")
	public void selectUsers(String string, DataTable datatable) throws Exception {
		logger.info("User Selection in template in Daily Attendance View Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().gotoDailyAttendenceView_TemplateConfiguration();
		for (Map<String, String> data : datatable.asMaps(String.class, String.class)) {
			logger.info("Select Users: "+data.get("Select Users"));
			String selectuser = data.get("Select Users");
			String selectgroup = data.get("Select Group");
			String userorgroup = data.get("user or group");
			testContextObject.pom.dailyAttendenceView_TemplatePO().selectUsers(string, selectuser, selectgroup,
					userorgroup);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Kamal
	@Then("Validate and select default the template in System Account User")
	public void sasystemUserValidationTemplate(DataTable dataTable) throws Exception {
		logger.info("Validate and select default the template in System Account User Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().gotoDailyAttendenceView_TemplateConfiguration();
		testContextObject.pom.dailyAttendenceView_TemplatePO().validateTemplate(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Kamal
	@Then("Daily Attendance View for userid {string} and period {string} on {string} and {string}")
	public void saUserDailyAttendenceFormat(String userid, String typeselection, String fromOrMonth, String toOrYear,
			DataTable dataTable) throws Exception {
		logger.info("Daily Attendance View Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().gotoDailyAttendence_ViewPage();
		testContextObject.pom.dailyAttendenceViewPO().fieldValidation(userid, typeselection, fromOrMonth, toOrYear,
				dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Kamal
	@Given("{string} in Configuration of the {string} in TAndA Exports")
	public void Configuration(String tabName, String exportName, DataTable dataTable) throws Exception {
		logger.info(tabName+"in Configuration of the "+exportName+" in TAndA Exports Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.exportsPO().exportsConfiguration(tabName, exportName, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Create Absentee Policy")
	public void create_absentee_policy(DataTable dataTable) throws InterruptedException {
		logger.info("Create Absentee Policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAbsenteePolicyPage();
		testContextObject.pom.absenteePolicyPO().createAbsenteePolicy(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Kamal
	@Then("Export the {string} in TAndA Exports")
	public void exportReport(String exportName, DataTable dataTable) throws Exception {
		logger.info("Export the "+exportName+" in TAndA Exports Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.exportsPO().exportReport(exportName, dataTable);
		Thread.sleep(15000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Given("Create Late-In Policy")
	public void create_late_in_policy(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Late-In Policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToLateInPolicyPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			testContextObject.pom.lateINPolicyPO().createLateInPolicy(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Given("Update Rounding For Fraction Of An Hour of LateIn Policy {string}")
	public void update_rounding_for_fraction_of_an_hour_of_late_in_policy(String plcName,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Update Rounding For Fraction Of An Hour of LateIn Policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToLateInPolicyPage();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.lateINPolicyPO().updateRoundingForFractionOfAnHour(plcName, data);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Create Early-Out Policy")
	public void create_early_out_policy(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Early-Out Policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToEarlyOutPolicyPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			testContextObject.pom.earlyOUTPolicyPO().createEarlyOutPolicy(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Daily Attendance Authorization from SA Date from= {string} To= {string}")
	public void daily_attendance_authorization_from_sa_date_from_to(String fDate, String tDate, DataTable dataTable)
			throws InterruptedException {
		logger.info("Daily Attendance Authorization from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToDailyAttendanceAuthorizationPage();
		testContextObject.pom.dailyAttendanceAuthorizationPO().authorizeDailyAttendance(fDate, tDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Verify Authorized Attendance from Daily Attendance page in SA Date from= {string} To= {string}")
	public void verify_authorized_attendance_from_daily_attendance_page_in_sa_date_from_to(String fDate, String tDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Verify Authorized Attendance from Daily Attendance page in SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToDailyAttendanceAuthorizationPage();
		testContextObject.pom.dailyAttendanceAuthorizationPO().verifyAuthorizedDailyAttendance(fDate, tDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Update Rounding For Fraction Of An Hour of EarlyOut Policy {string}")
	public void update_rounding_for_fraction_of_an_hour_of_early_out_policy(String plcName,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Update Rounding For Fraction Of An Hour of EarlyOut Policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToEarlyOutPolicyPage();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.earlyOUTPolicyPO().updateRoundingForFractionOfAnHour(plcName, data);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Approve Reject Event Authorization Application from SA Date from= {string} To= {string}")
	public void approve_reject_event_authorization_application_from_sa_date_from_to(String fromDate, String toDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Approve Reject Event Authorization Application from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToEventAuthorizationPage();
		testContextObject.pom.eventAuthorizationPO().authorizeEventBySA(fromDate, toDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Approve Reject Advance Overtime Application from SA Date from= {string} To= {string}")
	public void approve_reject_advance_overtime_application_from_sa_date_from_to(String fromDate, String toDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Approve Reject Advance Overtime Application from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAdvanceOTApproval();
		testContextObject.pom.advanceOTApprovalPO().advanceOvertimeApproval(fromDate, toDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Verify Advance Overtime Application Approval Status from SA Date from= {string} To= {string}")
	public void verify_advance_overtime_application_approval_status_from_sa_date_from_to(String fromDate, String toDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Verify Advance Overtime Application Approval Status from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAdvanceOTApproval();
		testContextObject.pom.advanceOTApprovalPO().verifyAdvanceOTAppApprovalStatus(fromDate, toDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@When("Create Advance Overtime Application from SA")
	public void create_advance_overtime_application_from_sa(DataTable dataTable) throws InterruptedException {
		logger.info("Create Advance Overtime Application from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAdvanceOTApplication();
		testContextObject.pom.advanceOTApplicationPO().createAdvanceOTApp(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@When("Verify Advance Overtime Application status from SA")
	public void verify_advance_overtime_application_status_from_sa(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify Advance Overtime Application status from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAdvanceOTApplication();
		testContextObject.pom.advanceOTApplicationPO().verifyAdvanceOTAppStatus(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@When("Manual Status correction done from TnA module")
	public void manual_status_correction_done_from_tn_a_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Manual Status correction done from TnA module Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToManualStatusCorrectionPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FromDt: "+data.get("FromDt")+" ToDt: "+data.get("ToDt"));
			testContextObject.pom.manualStatusCorrectionPO().manualStatusCorrection(data);
		}
	}

	// Mayank
	@Given("Verify Manual Correction Status from TnA module")
	public void verify_manual_correction_status_from_tn_a_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify Manual Correction Status from TnA module Started");
		testContextObject.pom.manualStatusCorrectionPO().validateManualStatusCorrection(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Approve Reject Attendance Correction from SA Date From= {string} To= {string}")
	public void approve_reject_attendance_correction_from_sa_date_from_to(String fromDate, String toDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Approve Reject Attendance Correction from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAttendanceCorrectionApproval();
		testContextObject.pom.attendanceCorrectionApprovalPO().attendanceCorrectionApprovalSA(fromDate, toDate,
				dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Validate {string} Attendance Correction Application from SA from= {string} To= {string}")
	public void validate_attendance_correction_application_from_sa_from_to(String panelName, String fromDate,
			String toDate, DataTable dataTable) throws InterruptedException {
		logger.info("Validate Attendance Correction Application from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAttendanceCorrectionApproval();
		testContextObject.pom.attendanceCorrectionApprovalPO().validateAuthorizedAtdCorrectApp(panelName, fromDate,
				toDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//Mayank 
	@Given("Range Based Short Leave configuration for Attendance policy {string}")
	public void range_based_short_leave_configuration_for_attendance_policy(String atdPlcName, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Range Based Short Leave configuration for Attendance policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAttendancePolicy();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.attendancePolicyPO().rangeBasedShortLeaveConfig(atdPlcName, data);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//Chhaya
	@Given("Create C-OFF Policy")
	public void create_c_off_policy(DataTable dataTable) throws InterruptedException {
		logger.info("Create C-OFF Policy Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToCOFFPolicyPage();
		testContextObject.pom.cOFFPolicyPO().createCOFFPolicy(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Then("Approve Reject Short Leave\\/Official IN-OUT Application from SA Date from= {string} To= {string}")
	public void approve_reject_short_leave_official_in_out_application_from_sa_date_from_to(String fromDate, String toDate, DataTable dataTable) throws InterruptedException {
		logger.info("Approve Reject Short Leave/Official IN-OUT Application from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToshortLeaveOfficialINOUT();
		testContextObject.pom.shortLvOfficialAppApprovalPO().shortLvOfficialInOutApprovalFromSA(fromDate, toDate, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Then("Validate Short Leave\\/Official IN-OUT Application from SA date From= {string} To= {string}")
	public void validate_short_leave_official_in_out_application_from_sa_date_from_to(String fromDate, String toDate, DataTable dataTable) throws InterruptedException {
		logger.info("Validate Short Leave/Official IN-OUT Application from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToshortLeaveOfficialINOUT();
		testContextObject.pom.shortLvOfficialAppApprovalPO().validateShortLvOffInOutAppApproval(fromDate, toDate, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@When("Overtime\\/C-OFF Authorization for {string} and Period {string} from SA on {string} and {string}")
	public void overtime_c_off_authorization_for_and_period_from_sa_on_and(String recordType, String period, String fromDt, String toDt, DataTable dataTable) throws Exception {
		logger.info("Overtime/C-OFF Authorization from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimeCOFFAuthorizationApprovalPage();
		if(recordType.equalsIgnoreCase("Multiple Records")) {
			testContextObject.pom.overtimeCOFFPO().multRecordsOTCOFFAuthSA(recordType, period, fromDt, toDt, dataTable);
		}else if(recordType.equalsIgnoreCase("Single Record")) {
			testContextObject.pom.overtimeCOFFPO().overtimeCOFFAuthApp(recordType, period, fromDt, toDt, dataTable);
			testContextObject.pom.abstractMethod().homeButtonClick();
		}
	}
	
	@When("Configure Authorization Parameters for Overtime\\/C-OFF Authorization from SA")
	public void configure_authorization_parameters_for_overtime_c_off_authorization_from_sa(io.cucumber.datatable.DataTable dataTable) throws Exception {
		logger.info("Configure Authorization Parameters for Overtime/C-OFF Authorization from SA Started");
		String actMsg = testContextObject.pom.overtimeCOFFPO().configAuthParametersFromSA(dataTable);
		if (actMsg.equalsIgnoreCase("Saved Successfully")) {
			testContextObject.pom.abstractMethod().homeButtonClick();
		}
	}

	@Then("Verify Error List from SA")
	public void verify_error_list_from_sa(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Error List from SA Started");
		testContextObject.pom.overtimeCOFFPO().verifyErrorListFromSA(dataTable);
	    Thread.sleep(500);
	    testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Then("Validate Overtime\\/C-OFF Application from SA for Period {string} on {string} and {string}")
	public void validate_overtime_c_off_application_from_sa_for_period_on_and(String period, String fromDt, String toDt, DataTable dataTable) throws Exception {
		logger.info("Validate Overtime/C-OFF Application from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimeCOFFAuthorizationApprovalPage();
		testContextObject.pom.overtimeCOFFPO().validateAuthorizedOTCOFFFromSA(period, fromDt, toDt, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Manual Overtime\\/C-OFF Entry for UserID= {string} on AtdDate= {string}")
	public void manual_overtime_c_off_entry_for_user_id_on_atd_date(String userId, String atdDate, DataTable dataTable) throws InterruptedException {
		logger.info("Manual Overtime/C-OFF Entry Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimeCOFFEntry();
		testContextObject.pom.overtimeCOffEntryPO().manualOvertimeCOffEntry(userId, atdDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Then("Verify Manual Overtime\\/C-OFF Entry for UserID= {string} and AtdDate= {string}")
	public void verify_manual_overtime_c_off_entry_for_user_id_and_atd_date(String userID, String atdDate, DataTable dataTable) throws InterruptedException {
		logger.info("Verify Manual Overtime/C-OFF Entry Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimeCOFFEntry();
		testContextObject.pom.overtimeCOffEntryPO().verifyOvertimeCOffEntry(userID, atdDate, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Verify Total OT\\/C-OFF Credit\\/Debit Entry for UserID= {string} and AtdDate= {string}")
	public void verify_total_ot_c_off_credit_debit_entry_for_user_id_and_atd_date(String userID, String atdDate, DataTable dataTable) throws InterruptedException {
		logger.info("Verify Total OT/C-OFF Credit/Debit Entry Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimeCOFFEntry();
		testContextObject.pom.overtimeCOffEntryPO().verifyTotalOTCOffCrDrEntry(userID, atdDate, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Then("Verify N-Punch details from N-Punch View page")
	public void verify_n_punch_details_from_n_punch_view_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify N-Punch details from N-Punch View page Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToNPunchViewPage();
		testContextObject.pom.nPunchViewPO().npunchDetails(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@When("Add\\/Edit punch in N-Punch View for UserID= {string} and AtdDate= {string}")
	public void add_edit_punch_in_n_punch_view_for_user_id_and_atd_date(String userID, String atdDate, DataTable dataTable) throws InterruptedException {
		logger.info("Add/Edit punch in N-Punch View Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToNPunchViewPage();
		testContextObject.pom.nPunchViewPO().addEditNPunchDetails(userID, atdDate, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@When("Export N-Punch Data from N-Punch View Page")
	public void export_n_punch_data_from_n_punch_view_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Add/Edit punch in N-Punch View Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToNPunchViewPage();
		testContextObject.pom.nPunchViewPO().exportNPunchData(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	// Mayank
	@Given("Delete Overtime Policy from TnA module")
	public void delete_overtime_policy_from_tn_a_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Overtime Policy from TnA module Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimePolicy();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			testContextObject.pom.overtimePolicyPO().deleteOvertimePolicy(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//Chhaya
	@When("Generate Attendance Correction from SA")
	public void generate_attendance_correction_from_sa(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Generate Attendance Correction from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAttendanceCorrection();
		testContextObject.pom.attendanceCorrectionPO().attendanceCorrectionFromSA(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//Chhaya
	@When("Attendance Correction for N-Punch User from SA for UserID= {string} on AtdDate= {string}, Shift= {string}, Day= {string} and Remark= {string}")
	public void attendance_correction_for_n_punch_user_from_sa_for_user_id_on_atd_date_shift_day_and_remark(String userId, String atdDate, String shift, String day, String remark, DataTable dataTable) throws InterruptedException {
		logger.info("Attendance Correction for N-Punch User from SA Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAttendanceCorrection();
		testContextObject.pom.attendanceCorrectionPO().attendanceCorrectionNPunchUserBySA(userId, atdDate, shift, day, remark, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//Chhaya
	@Then("Verify attendance details from Attendance Correction page")
	public void verify_attendance_details_from_attendance_correction_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify attendance details from Attendance Correction page Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAttendanceCorrection();
		testContextObject.pom.attendanceCorrectionPO().verifyAtdDetails(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//Chhaya
	@Given("Verify Authorized Overtime")
	public void verify_authorized_overtime(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Authorized Overtime Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAttendanceCorrection();
		testContextObject.pom.attendanceCorrectionPO().verifyAttendanceSummary(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//Chhaya
	@Given("Run Daily Attendance Process with Reprocess Attendance Events = {string} and Include Denied Events= {string} for Date= {string} To {string}")
	public void run_daily_attendance_process_with_reprocess_attendance_events_and_include_denied_events_for_date_to(String reprocesAtdEvents, String includDeniedEvents, String fromDate, String toDate, DataTable dataTable) throws InterruptedException {
		logger.info("Run Daily Attendance Process Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToDailyAttendanceProcessPage();
		testContextObject.pom.dailyAttendanceProcessPO().dailyAttendanceProcess(reprocesAtdEvents, includDeniedEvents, fromDate, toDate, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//Chhaya
	@Given("Create In\\/Out Reasons")
	public void create_in_out_reasons(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create In/Out Reasons Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToInOutReasonsPage();
		testContextObject.pom.inOutReasonsPO().createInOutReasons(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//aagam
	@Given("Create Bus Route from TnA Module")
	public void create_bus_route_from_tna_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create In/Out Reasons Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToBusRoutePage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.busRoutePO().createBusRoute(data);
		}
		
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//Chhaya
	@Then("View Shift-Wise Management data")
	public void view_shift_wise_management_data(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("View Shift-Wise Management data Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToShiftWiseManagementPage();
		testContextObject.pom.shiftWiseManagementPO().viewShiftWiseManagementData(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//Mayank
	@When("Change Policy from time attendance module for {string} user")
	public void change_policy_from_time_attendance_module_for_user(String userCount, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Change Policy from time attendance module Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToChangePlc();
		if (userCount.equalsIgnoreCase("Single")) {
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("UserId: "+data.get("UserId"));
				testContextObject.pom.changePolicyPO().changePolicy(data);
			}
		} else {
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("UserId: "+data.get("UserId"));
				testContextObject.pom.changePolicyPO().changePolicyMultipleUser(data);
			}
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	

	@When("Previous adjustment from TnA module")
	public void previous_adjustment_from_tn_a_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Previous adjustment from TnA module Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToPreviousAdjustmentPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserId: "+data.get("UserId")+" PrevAtdDt: "+data.get("PrevAtdDt"));
			testContextObject.pom.previousAdjustmentEntryPO().previousAdjustmentEntry(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Then("Verify Previous adjustment for user {string} from TnA module")
	public void verify_previous_adjustment_for_user_from_tn_a_module(String userid, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Previous adjustment from TnA module Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToPreviousAdjustmentPage();
		testContextObject.pom.previousAdjustmentEntryPO().previousAdjustmentVerify(userid, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//Chhaya
	@Then("Validate Attendance Summary from Manage Attendance page for {string}")
	public void validate_attendance_summary_from_manage_attendance_page_for(String userSelection, DataTable dataTable)
			throws InterruptedException {
		logger.info("Validate Attendance Summary from Manage Attendance page Started");
		if(userSelection.equalsIgnoreCase("Single User")) {
			testContextObject.pom.homePO().goToTimeAndAttendanceModule();
			testContextObject.pom.timeAndAttendancePO().goToManageAttendancePage();
		}
		testContextObject.pom.manageAttendancePO().atdSummaryOfSingleUsr(userSelection, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@When("User Selection for multiple user from Manage Attendance page")
	public void user_selection_for_multiple_user_from_manage_attendance_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("User Selection for multiple user from Manage Attendance page Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToManageAttendancePage();
		testContextObject.pom.manageAttendancePO().userSelection(dataTable);
	}

	@Then("Validate Attendance Exceptions from Manage Attendance page for multiple users")
	public void validate_attendance_exceptions_from_manage_attendance_page_for_multiple_users(
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Validate Attendance Exceptions from Manage Attendance page for multiple users Started");
		testContextObject.pom.manageAttendancePO().validateAtdException(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@When("Export Manage Attendance Data from Manage Attendance Page for {string}")
	public void export_manage_attendance_data_from_manage_attendance_page_for(String userSelection, DataTable dataTable) throws InterruptedException {
		logger.info("Export Manage Attendance Data from Manage Attendance Page Started");
		if(userSelection.equalsIgnoreCase("Single User")) {
			testContextObject.pom.homePO().goToTimeAndAttendanceModule();
			testContextObject.pom.timeAndAttendancePO().goToManageAttendancePage();
		}
		testContextObject.pom.manageAttendancePO().exportManageAtdData(userSelection, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@When("Delete Adjusted Work Hours from Attendance Correction page")
	public void delete_adjusted_work_hours_from_attendance_correction_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Adjusted Work Hours from Attendance Correction page Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToAttendanceCorrection();
		testContextObject.pom.attendanceCorrectionPO().deleteAdjstedWrkHrs(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Run Monthly Attendance Process via API for Month = {string} and Year = {string}")
	public void run_monthly_attendance_process_via_api_for_month_and_year(String month, String year, io.cucumber.datatable.DataTable dataTable) {
		logger.info("Run Monthly Attendance Process via API started");
		String finalUseridArgumentValue = "";
		int i=0;
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String userid = data.get("UserID");
			logger.info(userid);
			if (i==0) {
				finalUseridArgumentValue += userid;
			} else {
				finalUseridArgumentValue = finalUseridArgumentValue + "," + userid;
			}
			i++;
		}
		String month1 = AbstractMethod.staticMonthOrPlusMinusMonthFromCurrentMonthForAPI(month);
		String year1 = AbstractMethod.staticYearOrPlusMinusYearFromCurrentYear(month, year);
		String url = "command;Range=User;id=" + finalUseridArgumentValue + ";month-year="+month1+year1+";";
		String apiResponseValidation = "success: 0610500003 : Process Completed";
		String res = testContextObject.baseTest.setAPI(url, "sa", "admin", "monthly-process", 200);
		Assert.assertEquals(res, apiResponseValidation);
	}
	
	@Given("Delete In\\/Out Reason")
	public void delete_in_out_reason(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete In/Out Reasons Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToInOutReasonsPage();
		testContextObject.pom.inOutReasonsPO().deleteInOutReasons(dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//Chhaya
	@Given("Verify OT\\/C-OFF Auth Details in SA Period= {string} on {string} to {string} Panel={string} User={string} AtdDate={string} OTType={string} OTHours={string}")
	public void verify_ot_c_off_auth_details_in_sa_period_on_to_panel_user_atd_date_ot_type_ot_hours(String period, String fDate, String tDate, String panelName, String userId, String atdDate, String otType, String otHours, io.cucumber.datatable.DataTable dataTable) throws Exception {
		logger.info("Verify OT/C-OFF Auth Details in SA Period Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToOvertimeCOFFAuthorizationApprovalPage();
		testContextObject.pom.overtimeCOFFPO().validateOTApprovalDetails(period, fDate, tDate, panelName, userId, atdDate, otType, otHours, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@When("Short leave Official InOut entry from TnA module")
	public void short_leave_official_in_out_entry_from_tn_a_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Short leave Official InOut entry from TnA module Started");
		testContextObject.pom.homePO().goToTimeAndAttendanceModule();
		testContextObject.pom.timeAndAttendancePO().goToShortLeaveOfficialINOUTEntryPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.shortLeaveOfficialInOutEntryPO().shortLeaveOfficialInOutEntry(data);
		}
		
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
}
