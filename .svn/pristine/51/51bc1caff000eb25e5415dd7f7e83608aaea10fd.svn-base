package stepDefinations;

import java.io.IOException;
import java.sql.Driver;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.record.PageBreakRecord.Break;
import org.testng.Assert;

import CommonTestAbstract.TestContextObject;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class EssSD {
	TestContextObject testContextObject;
	private static Logger logger=LogManager.getLogger(EssSD.class);
	
	public EssSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@When("Assign Award Penalty Hours from RIC ESS login")
	public void assign_award_penalty_hours_from_ric_ess_login(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Assign Award Penalty Hours from RIC ESS login Started");
		testContextObject.pom.essPO().goToAssignAwardPenaltyHours();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("Userid")+" Date: "+data.get("Date"));
			String val = testContextObject.pom.assignAwardPenaltyHoursPO().assignAwardPenaltyHours(data.get("Userid"),
					data.get("Date"), data.get("AdjustmentType"), data.get("Hours"), data.get("Remark"),
					data.get("Reason"));
			Assert.assertEquals(val, data.get("Validation"));
		}
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}

	// Mayank
	@Then("Vefiry options of IN and OUT at Mark Punch Field")
	public void vefiry_options_of_in_and_out_at_mark_punch_field(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Vefiry options of IN and OUT at Mark Punch Field Started");
		ArrayList<String> markLabels = testContextObject.pom.essPO().markPunchesAvialables();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Special Function: "+data.get("SpecialFunction"));
			testContextObject.pom.essPO().markPunchVerify(data, markLabels);
		}
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}

	// Mayank
	@Then("Mark punch via ESS")
	public void mark_punch_via_ess(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Mark punch via ESS Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("SpecialFunction: "+data.get("SpecialFunction"));
			testContextObject.pom.essPO().markPunchViaESS(data);
		}
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}

	// by Chhaya
	@Then("Apply Timesheet Correction Application via ESS")
	public void apply_timesheet_correction_application_via_ess(DataTable dataTable) throws InterruptedException {
		logger.info("Apply Timesheet Correction Application via ESS Started");
		testContextObject.pom.essPO().goToTimeSheetCorrectionApp();
		testContextObject.pom.essTimesheetCorrectionPO().essTimesheetCorrectionApplication(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// by Chhaya
	@When("Authorize time sheet corrrection application from RIC Login")
	public void authorize_time_sheet_corrrection_application_from_ric_login(DataTable dataTable)
			throws InterruptedException {
		logger.info("Authorize time sheet corrrection application from RIC Login Started");
		testContextObject.pom.essPO().goToTimeSheetCorrectionAuthorization();
		testContextObject.pom.ricTimesheetCorrectionAuthPO().ricTimesheetCorrectionAuthorization(dataTable);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// By Chhaya
	@Then("Verify Message {string} by clicking on tab {string} shown on the scrolling information from the bottom of home page")
	public void verify_message_by_clicking_on_tab_shown_on_the_scrolling_information_from_the_bottom_of_home_page(
			String message, String tabName) throws InterruptedException {
		logger.info("Verify Message "+message+" by clicking on tab "+tabName+" shown on the scrolling information from the bottom of home page Started");
		testContextObject.pom.essBottomMessagePO().verifyMessageInESS(message, tabName);
		Thread.sleep(1000);
	}

	// By Chhaya
	@Then("Validate Scheduled visits for Date={string} Field Visit Schedule page")
	public void validate_scheduled_visits_for_date_field_visit_schedule_page(String date, DataTable dataTable)
			throws InterruptedException {
		logger.info("Validate Scheduled visits for Date= "+date+" Field Visit Schedule page Started");
		testContextObject.pom.essPO().essFieldVisitSchedule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Task: "+data.get("Task"));
			String task = data.get("Task");
			String locationGroup = data.get("LocationGroup");
			testContextObject.pom.essFieldVisitSchedulePO().validateEssFieldVisit(date, task, locationGroup);
		}
		Thread.sleep(1000);
	}

	// By Chhaya
	@Then("Validate scheduled visit form Field visit status Page for ESS login")
	public void validate_scheduled_visit_form_field_visit_status_page_for_ess_login(DataTable dataTable)
			throws InterruptedException {
		logger.info("Validate scheduled visit form Field visit status Page for ESS login Started");
		testContextObject.pom.essPO().essFieldVisitStatus();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("AttendancePeriodMonth: "+data.get("AttendancePeriodMonth")+" TaskName: "+data.get("TaskName"));
			String attendancePeriodMonth = data.get("AttendancePeriodMonth");
			String attendancePeriodYear = data.get("AttendancePeriodYear");
			String startDate = data.get("StartDate");
			String endDate = data.get("EndDate");
			String scheduleStartTime = data.get("ScheduleStartTime");
			String scheduleEndTime = data.get("ScheduleEndTime");
			String taskName = data.get("TaskName");
			String location = data.get("Location");
			testContextObject.pom.essFieldVisitStatusPO().validateEssFieldVisitStatus(attendancePeriodMonth,
					attendancePeriodYear, startDate, endDate, scheduleStartTime, scheduleEndTime, taskName, location);
		}
		Thread.sleep(1000);
	}
	
	// By Chhaya
	@When("Apply Field Visit Correction date on {string} from ESS login")
	public void apply_field_visit_correction_date_on_from_ess_login(String string, DataTable dataTable)
			throws InterruptedException {
		logger.info("Apply Field Visit Correction date on "+string+" from ESS login Started");
		testContextObject.pom.essPO().essFieldVisitCorrection();
		testContextObject.pom.essFieldVisitCorrectionPO().essFieldVisitCorrection(dataTable, string);
		Thread.sleep(1000);
	}

	// chhaya
	@Then("Validate Field visit correction in table in Applicatiion detail tab on Field Visit Correction page")
	public void validate_field_visit_correction_in_table_in_applicatiion_detail_tab_on_field_visit_correction_page(
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Validate Field visit correction in table in Applicatiion detail tab on Field Visit Correction page Started");
		testContextObject.pom.essPO().essFieldVisitCorrection();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Date: "+data.get("Date")+" Status: "+data.get("Status"));
			String date = data.get("Date");
			String status = data.get("Status");
			testContextObject.pom.essFieldVisitCorrectionPO().validateEssFieldVisitCorrection(date, status);
		}
		Thread.sleep(1000);
	}

	// chhaya
	@Then("Authorize Field visit corretion from RIC FromDate={string} ToDate= {string}")
	public void authorize_field_visit_corretion_from_ric_from_date_to_date(String fDate, String tDate, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Authorize Field visit corretion from RIC FromDate= "+fDate+" ToDate= "+tDate+" Started");
		testContextObject.pom.essPO().goToFieldVisitCorretionApproval();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserName: "+data.get("UserName")+" AttendanceDate: "+data.get("AttendanceDate"));
			String userName = data.get("UserName");
			String attendanceDate = data.get("AttendanceDate");
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String validaton = data.get("Validaton");
			testContextObject.pom.ricFieldVisitCorrectionAutorizationPO().fieldVisitCorrectionAuthorization(fDate, tDate, userName,
					attendanceDate, approve, reject, validaton);
		}
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// chhaya
	@Then("Verify In {string} Tab in Field Visit Correction Authorization Page from RIC Login")
	public void verify_in_tab_in_field_visit_correction_authorization_page_from_ric_login(String tabName,
			DataTable dataTable) throws InterruptedException {
		logger.info("Verify In "+tabName+" Tab in Field Visit Correction Authorization Page from RIC Login Started");
		Thread.sleep(1000);
		testContextObject.pom.essPO().goToFieldVisitCorretionApproval();
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserName: "+data.get("UserName")+" AttendanceDate: "+data.get("AttendanceDate"));
			String userName = data.get("UserName");
			String attendanceDate = data.get("AttendanceDate");
			testContextObject.pom.ricFieldVisitCorrectionAutorizationPO().verifyRejectedFieldVisitInRICLogin(tabName,
					userName, attendanceDate);
		}
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// by Chhaya
	@Then("Verify In {string} Tab in Timesheet Correction Application Page from RIC Login")
	public void verify_in_tab_in_timesheet_correction_application_page_from_ric_login(String tabName,
			DataTable dataTable) throws InterruptedException {
		logger.info("Verify In "+tabName+" Tab in Timesheet Correction Application Page from RIC Login Started");
		testContextObject.pom.essPO().goToTimeSheetCorrectionAuthorization();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserName: "+data.get("UserName")+" AttendanceDate: "+data.get("AttendanceDate"));
			String userName = data.get("UserName");
			String attendanceDate = data.get("AttendanceDate");
			String filterUser = data.get("FilterUser");
			testContextObject.pom.ricTimesheetCorrectionAuthPO().verifyRicTimesheetCorrectionAuthorization(tabName,
					userName, attendanceDate, filterUser);
		}
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// By Chhaya
	@When("Authorize Award Penalty application from RIC Login")
	public void authorize_award_penalty_application_from_ric_login(DataTable dataTable) throws InterruptedException {
		logger.info("Authorize Award Penalty application from RIC Login Started");
		testContextObject.pom.essPO().goToAwardPenaltyAuthorization();
		testContextObject.pom.ricAwardPenaltyAuthPO().authorizeAwardPenaltyAppFromRIC(dataTable);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// By Chhaya
	@Then("Verify In {string} Tab in Award Penalty Authorization Page from RIC Login")
	public void verify_in_tab_in_award_penalty_authorization_page_from_ric_login(String tabName, DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify In "+tabName+" Tab in Award Penalty Authorization Page from RIC Login Started");
		testContextObject.pom.essPO().goToAwardPenaltyAuthorization();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserName: "+data.get("UserName")+"AttendanceDate: "+data.get("AttendanceDate"));
			String ricName = data.get("RicName");
			String userName = data.get("UserName");
			String attendanceDate = data.get("AttendanceDate");
			String filterUser = data.get("FilterUser");
			testContextObject.pom.ricAwardPenaltyAuthPO().verifyRicAwardPenaltyAuthorization(tabName, ricName, userName,
					attendanceDate, filterUser);
		}
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@Given("Submit Self Declaration from ESS")
	public void submit_self_declaration_from_ess(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Submit Self Declaration from ESS Started");
		testContextObject.pom.essPO().goToSelfDeclarationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Date: "+data.get("Date"));
			String date = data.get("Date");
			String temperature = data.get("Temperature");
			String fever = data.get("Fever");
			String validation = data.get("Validation");
			testContextObject.pom.selfDeclarationPO().submitSelfDeclaration(date, temperature, fever, validation);
		}
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@Then("Apply Leave Application from ESS")
	public void apply_leave_application_from_ess(DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Apply Leave Application from ESS Started");
		testContextObject.pom.essPO().goToLeaveApplicationPage();
		testContextObject.pom.essLeaveApplicatioPO().leaveApplicationFromEss(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@Given("Verify Leave Application Status in ESS date From= {string} To= {string}")
	public void verify_leave_application_status_in_ess_date_from_to(String fromDt, String toDt, DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify Leave Application Status in ESS Started");
		testContextObject.pom.essPO().goToLeaveApplicationPage();
		testContextObject.pom.essLeaveApplicatioPO().verifyApplicationStatus(fromDt, toDt, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	// Common line for Authorization from RIC accept Overtime/C-OFF authorization
	@Given("Approve Reject {string} Application from RIC Date from= {string} To= {string}")
	public void approve_reject_application_from_ric_date_from_to(String pageName, String fromDt, String toDt,
			DataTable dataTable) throws InterruptedException {
		logger.info("Approve Reject "+pageName+" Application from RIC Started");
		testContextObject.pom.ricApplicationAuthorizationPO().approveRejectApplication(pageName, fromDt, toDt,
				dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@Then("Apply for leave application {string} from ESS Date From= {string} To= {string}")
	public void apply_for_leave_application_from_ess_date_from_to(String appType, String fromDate, String toDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Apply for leave application "+appType+" from ESS Date From= "+fromDate+" To= "+toDate+" Started");
		testContextObject.pom.essPO().goToLeaveApplicationPage();
		testContextObject.pom.essLeaveApplicatioPO().applyLeaveModificationCancellation(appType, fromDate, toDate,
				dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Mayank
	@Given("Send link from Invite Visitor page in ESS")
	public void send_link_from_invite_visitor_page_in_ess(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Send link from Invite Visitor page in ESS Started");
		testContextObject.pom.essPO().goToInviteVisitorPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("VName: "+data.get("VName"));
			String actual = testContextObject.pom.essInviteVisitorPO().sendInviteVisitorLink(data);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}

	// Mayank
	@Given("Copy invite visitor link in ESS and Open link in new tab")
	public void copy_invite_visitor_link_in_ess_and_open_link_in_new_tab(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Copy invite visitor link in ESS and Open link in new tab Started");
		testContextObject.pom.essPO().goToInviteVisitorPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("VName: "+data.get("VName"));
			testContextObject.pom.essInviteVisitorPO().copyLinkGetLinkAndOpenInNewTab(data);
		}
	}

	// Chhaya
	@Then("Apply Tour Application from ESS")
	public void apply_tour_application_from_ess(DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Apply Tour Application from ESS Started");
		testContextObject.pom.essPO().goToTourApplicationPage();
		testContextObject.pom.essTourApplicationPO().tourApplicationFromEss(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@Given("Verify Tour Application Status in ESS date From= {string} To= {string}")
	public void verify_tour_application_status_in_ess_date_from_to(String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify Tour Application Status in ESS date From= "+fromDate+" To= "+toDate+" Started");
		testContextObject.pom.essPO().goToTourApplicationPage();
		testContextObject.pom.essTourApplicationPO().verifyTourApplicationStatus(fromDate, toDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@Then("Apply for tour application {string} from ESS Date From= {string} To= {string}")
	public void apply_for_tour_application_from_ess_date_from_to(String appType, String fromDate, String toDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Apply for tour application "+appType+" from ESS Date From= "+fromDate+" To= "+toDate+" Started");
		testContextObject.pom.essPO().goToTourApplicationPage();
		testContextObject.pom.essTourApplicationPO().applyTourModificationCancellation(appType, fromDate, toDate,
				dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Mayank
	@Given("Visitor Preregistration from ESS")
	public void visitor_preregistration_from_ess(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Visitor Preregistration from ESS Started");
		testContextObject.pom.essPO().goToVisitorPreRegistrationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("HostUser: "+data.get("HostUser")+" VName: "+data.get("VName"));
			String actual = testContextObject.pom.essVisitorPreRegistrationPO().visitorPreregistartion(data);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}

	// Mayank
	@When("Approval of host from Visit Approval page in ESS")
	public void approval_of_host_from_visit_approval_page_in_ess(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Approval of host from Visit Approval page in ESS Started");
		testContextObject.pom.essPO().goToVisitApprovalPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FromDate: "+data.get("FromDate")+" VName: "+data.get("VName"));
			String actual = testContextObject.pom.essVisitApprovalPO().visitApprovalFromESS(data);
			Assert.assertEquals(actual, "Saved Successfully");
		}
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}

	// Mayank
	@Given("Approval of RIC from Visit Registration Approval page in ESS")
	public void approval_of_ric_from_visit_registration_approval_page_in_ess(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Approval of RIC from Visit Registration Approval page in ESS Started");
		testContextObject.pom.essPO().goToVisitRegistrationApproval();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FromDate: "+data.get("FromDate")+" HostID: "+data.get("HostID"));
			String actual = testContextObject.pom.essVisitRegistrationApprovalPO()
					.visitRegistartionApprovalFromESS(data);
			Assert.assertEquals(actual, "Saved Successfully");
		}
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}

	// Chhaya
	@Then("Apply COff Application from ESS")
	public void apply_c_off_application_from_ess(DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Apply COff Application from ESS Started");
		testContextObject.pom.essPO().goToCOffApplicationPage();
		testContextObject.pom.essCOffApplicationPO().cOffApplicationFromEss(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@Then("Verify C-OFF Application Status in ESS date From= {string} To= {string}")
	public void verify_c_off_application_status_in_ess_date_from_to(String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify C-OFF Application Status in ESS date From= "+fromDate+" To= "+toDate+" Started");
		testContextObject.pom.essPO().goToCOffApplicationPage();
		testContextObject.pom.essCOffApplicationPO().verifyCOffApplicationStatus(fromDate, toDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@Then("Apply for C-Off application {string} from ESS Date From= {string} To= {string}")
	public void apply_for_c_off_application_from_ess_date_from_to(String appType, String fromDate, String toDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Apply for C-Off application "+appType+" from ESS Date From= "+fromDate+" To= "+toDate+" Started");
		testContextObject.pom.essPO().goToCOffApplicationPage();
		testContextObject.pom.essCOffApplicationPO().applyCOffCancellationApplication(appType, fromDate, toDate,
				dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	@Then("Copy Link from Invite Visitor page in ESS")
	public void copy_link_from_invite_visitor_page_in_ess(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Copy Link from Invite Visitor page in ESS Started");
		testContextObject.pom.essPO().goToInviteVisitorPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("VName: "+data.get("VName"));
			String actual = testContextObject.pom.essInviteVisitorPO().copyInviteVisitorLink(data);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@Given("Verify leave balance from ESS")
	public void verify_leave_balance_from_ess(DataTable dataTable) throws InterruptedException {
		logger.info("Verify leave balance from ESS Started");
		testContextObject.pom.essPO().goToLeaveBalancePage();
		testContextObject.pom.essLeaveBalancePO().essLeaveBalance(dataTable);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	@Given("Approve Reject Induction Approval from ESS login")
	public void approve_reject_induction_approval_from_ess_login(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Approve Reject Induction Approval from ESS login Started");
		testContextObject.pom.essPO().goToInductionApprovalPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("WorkOrderID: "+data.get("WorkOrderID"));
			String actual = testContextObject.pom.essInductionApprovalPO().inductionApprovalsFromESS(data);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@Given("Validate Leave Approval Details in ESS date From= {string} To= {string}")
	public void validate_leave_approval_details_in_ess_date_from_to(String fromDt, String toDt, DataTable dataTable)
			throws InterruptedException {
		logger.info("Validate Leave Approval Details in ESS date From= "+fromDt+" To= "+toDt+" Started");
		testContextObject.pom.essPO().goToLeaveApplicationPage();
		testContextObject.pom.essLeaveApplicatioPO().validateLeaveApprovalDetails(fromDt, toDt, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
		Thread.sleep(500);
	}

	// Chhaya
	@Given("Validate {string} Application from RIC date From= {string} To= {string}")
	public void validate_application_from_ric_date_from_to(String pageName, String fromDate, String toDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Validate "+pageName+" Application from RIC date From= "+fromDate+" To= "+toDate+" Started");
		testContextObject.pom.ricApplicationAuthorizationPO().validateApplicationApproval(pageName, fromDate, toDate,
				dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
		Thread.sleep(500);
	}

	// Kamal
	@Then("Daily Attendance View for period {string} on {string} and {string} in ESS")
	public void essDailyAttendenceViewFormat(String typeselection, String month, String year, DataTable dataTable)
			throws Exception {
		logger.info("Daily Attendance View for period "+typeselection+" on "+month+" and "+year+" in ESS Started");
		testContextObject.pom.essPO().gotoDailyAttendence_ViewPage();
		testContextObject.pom.essUserDailyAttendenceViewFormatPO().essDailyAttendenceViewFormat(typeselection, month,
				year, dataTable);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Kamal
	@Then("Validate and select default the template in ESS")
	public void essValidationTemplate(DataTable dataTable) throws Exception {
		logger.info("Validate and select default the template in ESS Started");
		testContextObject.pom.essPO().gotoDailyAttendence_TemplateConfiguration();
		testContextObject.pom.essDailyAttendence_TemplatePO().validationoftemplate(dataTable);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Kamal
	@Then("Daily Attendance View export report for period {string} on {string} and {string} in ESS")
	public void essExportReport(String typeselection, String month, String year, DataTable dataTable) throws Exception {
		logger.info("Daily Attendance View export report for period "+typeselection+" on "+month+" and "+year+" in ESS Started");
		testContextObject.pom.essPO().gotoDailyAttendence_ViewPage();
		testContextObject.pom.essUserDailyAttendenceViewFormatPO().exportReport(typeselection, month, year, dataTable);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@Then("Validate {string} Application in ESS date From= {string} To= {string}")
	public void validate_application_in_ess_date_from_to(String panelName, String fromDate, String toDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Validate "+panelName+" Application in ESS date From= "+fromDate+" To= "+toDate+" Started");
		testContextObject.pom.essPO().goToEventPage();
		testContextObject.pom.essEventPO().validateEvents(panelName, fromDate, toDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
		Thread.sleep(500);
	}

	// Chhaya
	@When("Create Advance Overtime Application from ESS")
	public void create_advance_overtime_application_from_ess(DataTable dataTable) throws InterruptedException {
		logger.info("Create Advance Overtime Application from ESS Started");
		testContextObject.pom.essPO().goToAdvanceOvertimeApplicationPage();
		testContextObject.pom.essAdvanceOvertimeApplicationPO().createAdvanceOvertimeApplication(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
		Thread.sleep(500);
	}

	@Given("Verify Advance Overtime Application status in ESS")
	public void verify_advance_overtime_application_status_in_ess(DataTable dataTable) throws InterruptedException {
		logger.info("Verify Advance Overtime Application status in ESS Started");
		testContextObject.pom.essPO().goToAdvanceOvertimeApplicationPage();
		testContextObject.pom.essAdvanceOvertimeApplicationPO().verifyAdvanceOvertimeApplicationStatus(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
		Thread.sleep(500);
	}

	@When("Validate Advance Overtime Application Approval Details in ESS for OT Date= {string}")
	public void validate_advance_overtime_application_approval_details_in_ess_for_ot_date(String otDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Validate Advance Overtime Application Approval Details in ESS for OT Date= "+otDate+" Started");
		testContextObject.pom.essPO().goToAdvanceOvertimeApplicationPage();
		testContextObject.pom.essAdvanceOvertimeApplicationPO().validateAdvanceOTAppApprovalDetails(otDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
		Thread.sleep(500);
	}

	@Then("Generate Attendance Correction Application from ESS")
	public void generate_attendance_correction_application_from_ess(DataTable dataTable) throws InterruptedException {
		logger.info("Generate Attendance Correction Application from ESS Started");
		testContextObject.pom.essPO().goToAttendanceCorrectionPage();
		testContextObject.pom.essAttendanceCorrectionApplicationPO().generateAtdCorrection(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
		Thread.sleep(500);
	}

	@Then("Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = {string}")
	public void verify_attendance_correction_application_approval_details_in_ess_for_attendance_date(String atdDate,
			DataTable dataTable) throws InterruptedException {
		logger.info("Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "+atdDate+" Started");
		testContextObject.pom.essPO().goToAttendanceCorrectionPage();
		testContextObject.pom.essAttendanceCorrectionApplicationPO().verifyAtdCorretionApprovalDetails(atdDate,
				dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
		Thread.sleep(500);
	}

	@When("Attendance Correction for N-Punch User from ESS for AtdDate= {string} Shift= {string} Day= {string}")
	public void attendance_correction_for_n_punch_user_from_ess_for_atd_date_shift_day(String atdDate, String shift,
			String day, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Attendance Correction for N-Punch User from ESS for AtdDate= "+atdDate+" Shift= "+shift+" Day= "+day+" Started");
		testContextObject.pom.essPO().goToAttendanceCorrectionPage();
		testContextObject.pom.essAttendanceCorrectionApplicationPO().atdCorrectionForNPunchUser(atdDate, shift, day,
				dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
		Thread.sleep(500);
	}

	// Mayank
	@Then("Verify ShortLeave Or Official InOut Application from ESS login")
	public void verify_short_leave_or_official_in_out_application_from_ess_login(
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify ShortLeave Or Official InOut Application from ESS login Started");
		testContextObject.pom.essPO().goToshortLeaveOfficialInOut();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Date: "+data.get("Date")+" Start Time: "+data.get("Start"));
			testContextObject.pom.essShortLeaveOfficialINOUTEntryPO().verifyShortLeaveOfficialINOUTEntryInESS(data);
		}
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Chhaya
	@When("{string} Authorization for {string} and Period {string} from RIC on {string} and {string}")
	public void authorization_for_and_period_from_ric_on_and(String pageName, String authFor, String period,
			String fromDt, String toDt, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info(pageName+" Authorization for "+authFor+" and Period "+period+" from RIC on "+fromDt+" and "+toDt+" Started");
		testContextObject.pom.essPO().goToApproveRejectPage(pageName);
		testContextObject.pom.ricApplicationAuthorizationPO().otCOFFAuthFromRIC(authFor, period, fromDt, toDt,
				dataTable);
	}

	@Given("Configure Authorization Parameters for Overtime\\/C-OFF Authorization from RIC")
	public void configure_authorization_parameters_for_overtime_c_off_authorization_from_ric(
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC Started");
		String actMsg = testContextObject.pom.essOvertimeCOFFAuthorizationPO().configAuthParameters(dataTable);
		Thread.sleep(1000);
		if (actMsg.equalsIgnoreCase("Saved Successfully")) {
			testContextObject.pom.abstractMethod().essDashboardButtonClick();
			Thread.sleep(500);
		}
	}

	@Then("Validate {string} Application from RIC for Period {string} on {string} and {string}")
	public void validate_application_from_ric_for_period_on_and(String pageName, String period, String fromDt,
			String toDt, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Validate "+pageName+" Application from RIC for Period "+period+" on "+fromDt+" and "+toDt+" Started");
		testContextObject.pom.essPO().goToApproveRejectPage(pageName);
		testContextObject.pom.essOvertimeCOFFAuthorizationPO().validateOTCOFF(period, fromDt, toDt,
				dataTable);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	@Given("Verify C-OFF Balance from Leave Balance Page in ESS")
	public void verify_c_off_balance_from_leave_balance_page_in_ess(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify C-OFF Balance from Leave Balance Page in ESS Started");
		testContextObject.pom.essPO().goToLeaveBalancePage();
		testContextObject.pom.essLeaveBalancePO().essCOFFBalanceView(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	// Mayank
	@When("ShortLeave OfficialInOut Application from ESS on AttendanceDate= {string} then validate {string}")
	public void short_leave_official_in_out_application_from_ess_on_attendance_date_then_validate(String atdDate,
			String validation, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("ShortLeave OfficialInOut Application from ESS on AttendanceDate= "+atdDate+" then validate "+validation+" Started");
		testContextObject.pom.essPO().goToshortLeaveOfficialInOut();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		String val = testContextObject.pom.essShortLeaveOfficialINOUTEntryPO()
				.applyShortLeaveOfficialInOutApplication(atdDate, data);
		Assert.assertEquals(val, validation);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}

	//Chhaya
	@Then("Verify Error List from RIC")
	public void verify_error_list_from_ric(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Error List from RIC Started");
		testContextObject.pom.essOvertimeCOFFAuthorizationPO().verifyErrorListFromRIC(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
		Thread.sleep(500);
	}

	//Chhaya
	@Then("Verify Overtime Details from Attendance Details page in ESS for AtdDate= {string}")
	public void verify_overtime_details_from_attendance_details_page_in_ess_for_atd_date(String atdDate, DataTable dataTable) throws InterruptedException {
		logger.info("Verify Overtime Details from Attendance Details page in ESS for AtdDate= "+atdDate+" Started");
		testContextObject.pom.essPO().goToAttendanceDetailsPage();
		testContextObject.pom.essAttendanceDetailsPO().verifyOvertimeDetails(atdDate, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}
	
	@Then("Validate punch from Timesheet Correction Application page in ESS")
	public void validate_punch_from_timesheet_correction_application_page_in_ess(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Apply Timesheet Correction Application via ESS Started");
		testContextObject.pom.essPO().goToTimeSheetCorrectionApp();
		testContextObject.pom.essTimesheetCorrectionPO().validateTimesheetCorrectionApplication(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}
	
	@When("Apply Shift Change Application from ESS")
	public void apply_shift_change_application_from_ess(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
	    logger.info("Apply Shift Change Application from ESS");
	    testContextObject.pom.essPO().goToShiftChangeApplicationPage();
	    testContextObject.pom.essShiftChangeApplicationPO().shiftChangeApplication(dataTable);
	    Thread.sleep(500);
	    testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}
	
	
	@Given("Verify {string} Auth Details in RIC Period= {string} on {string} to {string} Panel={string} User={string} AtdDate={string} OTType={string} OTHours={string}")
	public void verify_auth_details_in_ric_period_on_to_panel_user_atd_date_ot_type_ot_hours(String pageName, String period, String fromDt, String toDt, String panel, String userId, String atdDate, String otType, String otHours, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify OT/C-OFF Auth Details in RIC Started");
		testContextObject.pom.essPO().goToApproveRejectPage(pageName);
		testContextObject.pom.essOvertimeCOFFAuthorizationPO().verifyOTCOFFApprovalDetails(period, fromDt, toDt, panel, userId, atdDate, otType, otHours, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
		Thread.sleep(500);
	}
	
	@Given("Validate Shift Change Approval Details from ESS date From= {string} To= {string}")
	public void validate_shift_change_approval_details_from_ess_date_from_to(String fromDate, String toDate, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Validate Shift Change Approval Details in ESS Started");
		testContextObject.pom.essPO().goToShiftChangeApplicationPage();
		testContextObject.pom.essShiftChangeApplicationPO().verifyShChApprovalDetails(fromDate, toDate, dataTable);
		testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}
	
	@Given("Verify Shift Change Application Status from ESS")
	public void verify_shift_change_application_status_from_ess(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
	    logger.info("Verify Shift Change Application Status from ESS Started");
	    testContextObject.pom.essPO().goToShiftChangeApplicationPage();
	    testContextObject.pom.essShiftChangeApplicationPO().verifyShiftChangeAppStatus(dataTable);
	    testContextObject.pom.abstractMethod().essDashboardButtonClick();
	}
	
	@Given("Transaction Correction Application from ESS")
	public void transaction_correction_application_from_ess(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Transaction Correction Application from ESS Started");
		testContextObject.pom.essPO().goToTrnCorrectionPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.essTransactionCorrectionApplicationPO().essTrnCorrectionApp(data);
		}
		Thread.sleep(1000);
	    testContextObject.pom.abstractMethod().essDashboardButtonClick();
	    Thread.sleep(500);
	}
	
	@Given("Pre Order Meals from ESS")
	public void pre_order_meals_from_ess(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Pre Order Meals from ESS Started");
		testContextObject.pom.essPO().goToPreOrderMealsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.essPreOrderMealsPO().essPreOrderMeal(data);
		}
		Thread.sleep(1000);
	    testContextObject.pom.abstractMethod().essDashboardButtonClick();
	    Thread.sleep(500);
	}
	
}
