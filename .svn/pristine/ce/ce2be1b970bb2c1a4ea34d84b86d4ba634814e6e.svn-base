package stepDefinations;

import static io.restassured.RestAssured.given;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import CommonTestAbstract.TestContextObject;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;

public class LeaveManagementSD {
	TestContextObject testContextObject;
	private static Logger logger = LogManager.getLogger(LeaveManagementSD.class);
	// List<String> tid = new ArrayList<>();
	// String tid = null; // For Leave Application and Approval

	public LeaveManagementSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	// By Mayank
	@When("Apply Leave Application via API")
	public void apply_leave_application_via_api(io.cucumber.datatable.DataTable dataTable) {
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		logger.info("Apply Leave Application via API Started");
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: " + data.get("userid") + " Start-date: " + data.get("Start-date"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.leaveApplicationPO().leaveApplicationAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String appliedBy = data.get("appliedBy");
			String res = testContextObject.baseTest.setAPI(userParameter, appliedBy, "admin", "leave-application", 200);
//			if (appliedBy.equalsIgnoreCase("SA")) {
//				Assert.assertEquals(res, "success: 0330200002 : saved successfully");
//			} else {
//				Assert.assertEquals(res, "success: 0330203002 : Leave Approval is pending");
//			}
			String val1 = "success: 0330200002 : saved successfully";
			String val2 = "success: 0330203002 : Leave Approval is pending";
			String val3 = "success: 0330203002 : Tour Approval is pending";
			String applicationVal = null;
			if (res.equalsIgnoreCase(val1) || res.equalsIgnoreCase(val2) || res.equalsIgnoreCase(val3)) {
				applicationVal = "Leave or Tour Applied";
			} else {
				applicationVal = res;
			}
			Assert.assertEquals(applicationVal, "Leave or Tour Applied");
			logger.info("Leave/Tour Applied Successfully");
		}
	}

	// By Mayank
	@Given("Approve Reject Leave Application via API")
	public void approve_reject_leave_application_via_api(io.cucumber.datatable.DataTable dataTable) {
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		logger.info("Approve Reject Leave Application via API Started");
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: " + data.get("userid") + " Start-date: " + data.get("Start-date"));
			// GET API fire for get TID from application
			String userid = data.get("userid");
			String sdate = testContextObject.pom.abstractMethod()
					.staticDateOrPlusMinusFromCurrentDate(data.get("Start-date"));
			String edate = testContextObject.pom.abstractMethod()
					.staticDateOrPlusMinusFromCurrentDate(data.get("end-date"));
			String daterange = sdate.replace("/", "") + "-" + edate.replace("/", "");
			logger.debug(daterange);
			String url = "get;user-filter=0;userid=" + userid + ";date-range=" + daterange
					+ ";application-status=0;format=json;";
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "leave-application", 200);
			String tid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres, "leave-application.tid");

			// SET API
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			String valmsg;
			testContextObject.pom.leaveApprovalPO().leaveApprovalAPI(columnHeader, apiParameter, data, tid);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String ricID = data.get("ricID");
			String res = testContextObject.baseTest.setAPI(userParameter, ricID, "admin", "leave-approval", 200);
			Assert.assertEquals(res, "success: 0340200002 : Saved Successfully");
			logger.info("Leave or Tour Application Approved/Rejected Successfully");
		}
	}

	// By Mayank
	@When("Apply Leave {string} Application via API")
	public void apply_leave_application_via_api(String type, io.cucumber.datatable.DataTable dataTable) {
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		logger.info("Apply Leave " + type + " Application via API Started");
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: " + data.get("userid") + " Start-date: " + data.get("Start-date"));
			// GET API fire for get TID from application
			String userid = data.get("userid");
			String daterange = testContextObject.pom.abstractMethod().daterangeSelectedForAPI(data.get("OldStartdate"),
					data.get("OldEnddate"));
			String url = "get;user-filter=0;userid=" + userid + ";date-range=" + daterange
					+ ";application-status=0;format=json;";
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "leave-application", 200);
			String tid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres, "leave-application.tid");

			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("update");
			String valmsg;
			testContextObject.pom.leaveApplicationPO().leaveModificationCancellationAPI(columnHeader, apiParameter,
					data, tid);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String appliedBy = data.get("appliedBy");
			String res = testContextObject.baseTest.setAPI(userParameter, appliedBy, "admin", "leave-application", 200);
			if (type.equalsIgnoreCase("Modification")) {
				Assert.assertEquals(res, "success: 0330300003 : Leave Modification Request Sent");
			} else if (type.equalsIgnoreCase("Cancellation")) {
				Assert.assertEquals(res, "success: 0330300003 : Leave Cancellation Request Sent");
			} else {
				Assert.assertEquals("Leave Type is not valid", "Leave Type should be Modification or Cancellation");
			}
			logger.info("Leave or Tour Modification/Cancellation Applied Successfully");
		}
	}

	// By Mayank
	@Given("Credit_Debit_Encash Leave via API")
	public void credit_debit_encash_leave_via_api(io.cucumber.datatable.DataTable dataTable) throws Exception {
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		logger.info("Credit_Debit_Encash Leave via API Started");
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: " + data.get("userid") + " leave-code: " + data.get("leave-code"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			String valmsg;
			testContextObject.pom.leaveCreditDebitEncashPO().LeaveCreditDebitEncashAPI(columnHeader, apiParameter,
					data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String res = testContextObject.baseTest.setAPI(userParameter, "SA", "admin", "leave-balance", 200);
			Assert.assertEquals(res, "success: 0300200002 : saved successfully");
		}
	}

	// By Mitali
	@Given("Create Leave")
	public void create_leave(DataTable dataTable) throws InterruptedException {
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToLeave();
		logger.info("Create Leave Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("LeaveID: " + data.get("LeaveID") + " LeaveType: " + data.get("LeaveType"));
			String leaveId = data.get("LeaveID");
			String leaveName = data.get("LeaveName");
			String leaveType = data.get("LeaveType");
			String minAlwAtATime = data.get("MinAlwAtATime");
			String maxAlwLimit = data.get("MaxAlwLimit");
			String maxAllLimitFor = data.get("MaxAllLimitFor");
			String minAlwDur = data.get("MinAlwDur");
			String maxAlwDurPerApp = data.get("MaxAlwDurPerApp");
			String maxAlwDurPerDay = data.get("MaxAlwDurPerDay");
			String maxAccumCheck = data.get("MaxAccumCheck");
			String maxBalAlw = data.get("MaxBalAlw");
			String maxHHAlw = data.get("MaxHHAlw");
			String maxMMAlw = data.get("MaxMMAlw");
			String lvEncash = data.get("LvEncash");
			String mediCertReq = data.get("MediCertReq");
			String minLvForCertComp = data.get("MinLvForCertComp");
			String minDurHHH = data.get("MinDurHHH");
			String minDurMM = data.get("MinDurMM");
			String adLvHrsInWrkHrs = data.get("AdLvHrsInWrkHrs");
			String alwWithOthrLv = data.get("AlwWithOthrLv");
			String woAlwSinglSidLv = data.get("WoAlwSinglSidLv");
			String woAlwBothSidLv = data.get("WoAlwBothSidLv");
			String hldAlwSinglSidLv = data.get("HldAlwSinglSidLv");
			String hldAlwBothSidLv = data.get("HldAlwBothSidLv");
			String carryFrdToNxtYr = data.get("CarryFrdToNxtYr");
			String woAtlstFullDayLvForClbCvr = data.get("WOAtlstFullDayLvForClbCvr");
			String woEnblMinLmtChk = data.get("WOEnblMinLmtChk");
			String minLmtAroundWO = data.get("MinLmtAroundWO");
			String hldAtlstFullDayLvForClbCvr = data.get("HldAtlstFullDayLvForClbCvr");
			String hldEnblMinLmtChk = data.get("HldEnblMinLmtChk");
			String minLmtAroundHld = data.get("MinLmtAroundHld");
			String appAlwB4Lv = data.get("AppAlwB4Lv");
			String minDaysB4LvStartDt = data.get("MinDaysB4LvStartDt");
			String appAlwAftrLv = data.get("AppAlwAftrLv");
			String maxDaysAftrLvEndDt = data.get("MaxDaysAftrLvEndDt");
			String resAppWthnSpecPrd = data.get("ResAppWthnSpecPrd");
			String resType = data.get("ResType");
			String resPrd = data.get("ResPrd");
			String resPrdDayOrMonth = data.get("ResPrdDay/Month");
			String minDurB4LvStartDt = data.get("MinDurB4LvStartDt");
			String minDurB4LvStartDtDays = data.get("MinDurB4LvStartDtDays");
			String minDurB4LvStartDtHrs = data.get("MinDurB4LvStartDtHrs");
			String maxDurAftrLvEndDt = data.get("MaxDurAftrLvEndDt");
			String maxDurAftrLvEndDtDays = data.get("MaxDurAftrLvEndDtDays");
			String maxDurAftrLvEndDtHrs = data.get("MaxDurAftrLvEndDtHrs");
			String chkClbAcross = data.get("ChkClbAcross");
			String validation = data.get("Validation");
			String val = testContextObject.pom.leavePO().createLeave(leaveId, leaveName, leaveType, minAlwAtATime,
					maxAlwLimit, maxAllLimitFor, minAlwDur, maxAlwDurPerApp, maxAlwDurPerDay, maxAccumCheck, maxBalAlw,
					maxHHAlw, maxMMAlw, lvEncash, mediCertReq, minLvForCertComp, minDurHHH, minDurMM, adLvHrsInWrkHrs,
					alwWithOthrLv, woAlwSinglSidLv, woAlwBothSidLv, hldAlwSinglSidLv, hldAlwBothSidLv, carryFrdToNxtYr,
					woAtlstFullDayLvForClbCvr, woEnblMinLmtChk, minLmtAroundWO, hldAtlstFullDayLvForClbCvr,
					hldEnblMinLmtChk, minLmtAroundHld, appAlwB4Lv, minDaysB4LvStartDt, appAlwAftrLv, maxDaysAftrLvEndDt, resAppWthnSpecPrd, resType, resPrd, resPrdDayOrMonth, minDurB4LvStartDt, minDurB4LvStartDtDays, minDurB4LvStartDtHrs, maxDurAftrLvEndDt, maxDurAftrLvEndDtDays, maxDurAftrLvEndDtHrs, chkClbAcross);
			Assert.assertEquals(val, validation);
		}
		testContextObject.pom.leavePO().homeButtonClick();
	}

	@Given("Create Leave Group {string} with Pro-rata {string}")
	public void create_leave_group_with_pro_rata(String lvGrpName, String prorata,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Leave Group " + lvGrpName + " with Pro-rata " + prorata + " Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		Thread.sleep(1200);
		testContextObject.pom.leaveManagementPO().goTOLeaveGroup();
		Thread.sleep(1200);
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.leaveGroupPO().createLeaveGroup(lvGrpName, prorata, data);
		testContextObject.pom.leavePO().homeButtonClick();
	}

	@Given("{string} Leave from Credit_Debit_Encashment page")
	public void leave_from_credit_debit_encashment_page(String entryType, DataTable dataTable)
			throws InterruptedException {
		logger.info(entryType + " Leave from Credit_Debit_Encashment page Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToCreditDebitEncashment();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Period: " + data.get("Period") + " LeaveID: " + data.get("LeaveID"));
			String period = data.get("Period");
			String month = data.get("Month");
			String year = data.get("Year");
			String leaveID = data.get("LeaveID");
			String creditMode = data.get("CreditMode");
			String accrualPolicy = data.get("AccrPlcName");
			String creditValue = data.get("CreditValue");
			String debitValue = data.get("DebitValue");
			String encashmentMode = data.get("EncashmentMode");
			String encashmentValue = data.get("EncashmentValue");
			String applyProrata = data.get("AplyPro-rata");
			boolean applyProrata1 = Boolean.parseBoolean(applyProrata);
			String selectUsers = data.get("SelectUsers");
			String userIds = data.get("UserIDs");
			String group = data.get("Group");
			String groupIDs = data.get("GroupIDs");
			String timeHHH = data.get("TimeHHH");
			String timeMM = data.get("TimeMM");
			String status = data.get("Status");
			String hourlyAccrPlcName = data.get("HourlyAccrPlcName");
			String validation = data.get("Validation");
			String val = testContextObject.pom.leaveCreditDebitEncashPO().crediDebitEncashtLeave(entryType, period,
					month, year, leaveID, creditMode, accrualPolicy, creditValue, debitValue, encashmentMode,
					encashmentValue, applyProrata1, selectUsers, userIds, group, groupIDs, timeHHH, timeMM, status,
					hourlyAccrPlcName);
			Assert.assertEquals(val, validation);
		}
		testContextObject.pom.leaveCreditDebitEncashPO().homeButtonClick();
	}

	// Mayank
	@Given("Verify Leave Balance in Leave Balance Page")
	public void verify_leave_balance_in_leave_balance_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify Leave Balance in Leave Balance Page Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToLeaveBalance();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: " + data.get("UserID") + " LeaveName: " + data.get("LeaveName"));
			String period = data.get("Period");
			ArrayList<String> leaveBalanceData = testContextObject.pom.leaveBalancePO().leaveBalanceView(data);
			if (leaveBalanceData.size() == 1) {
				logger.debug("Leave Balance Not Found");
				Assert.assertEquals("Failed", "Pass");
			} else {
				if (period.equalsIgnoreCase("Monthly")) {
					String actualOpening = leaveBalanceData.get(4);
					if (data.get("Opening") != null) {
						Assert.assertEquals(actualOpening, data.get("Opening"));
					}
					String actualCredit = leaveBalanceData.get(5);
					if (data.get("Credit") != null) {
						Assert.assertEquals(actualCredit, data.get("Credit"));
					}
					String actualDebit = leaveBalanceData.get(6);
					if (data.get("Debit") != null) {
						Assert.assertEquals(actualDebit, data.get("Debit"));
					}
					String actualEncashment = leaveBalanceData.get(7);
					if (data.get("Encashment") != null) {
						Assert.assertEquals(actualEncashment, data.get("Encashment"));
					}
					String actualAvailed = leaveBalanceData.get(8);
					if (data.get("Availed") != null) {
						Assert.assertEquals(actualAvailed, data.get("Availed"));
					}
					String actualClosing = leaveBalanceData.get(9);
					if (data.get("Closing") != null) {
						Assert.assertEquals(actualClosing, data.get("Closing"));
					}
					String actualOverflow = leaveBalanceData.get(10);
					if (actualOverflow.contains(".00")==false && actualOverflow.contains(":") == false){
						actualOverflow =actualOverflow+".00";
						logger.info("Hello1= "+actualOverflow);
					}
					if (data.get("Overflow") != null) {
						logger.info("Hello1= "+actualOverflow);
							Assert.assertEquals(actualOverflow, data.get("Overflow"));
					}
				} else {
					String actualOpening = leaveBalanceData.get(3);
					if (data.get("Opening") != null) {
						Assert.assertEquals(actualOpening, data.get("Opening"));
					}
					String actualCredit = leaveBalanceData.get(4);
					if (data.get("Credit") != null) {
						Assert.assertEquals(actualCredit, data.get("Credit"));
					}
					String actualDebit = leaveBalanceData.get(5);
					if (data.get("Debit") != null) {
						Assert.assertEquals(actualDebit, data.get("Debit"));
					}
					String actualEncashment = leaveBalanceData.get(6);
					if (data.get("Encashment") != null) {
						Assert.assertEquals(actualEncashment, data.get("Encashment"));
					}
					String actualAvailed = leaveBalanceData.get(7);
					if (data.get("Availed") != null) {
						Assert.assertEquals(actualAvailed, data.get("Availed"));
					}
					String actualClosing = leaveBalanceData.get(8);
					if (data.get("Closing") != null) {
						Assert.assertEquals(actualClosing, data.get("Closing"));
					}
					String actualOverflow = leaveBalanceData.get(9);
					if (actualOverflow.contains(".00")==false && actualOverflow.contains(":") == false){
						actualOverflow =actualOverflow+".00";
						logger.info("Hello1= "+actualOverflow);
					}
					if (data.get("Overflow") != null) {
						logger.info("Hello= "+actualOverflow);
						Assert.assertEquals(actualOverflow, data.get("Overflow"));
					}
				}

			}
		}
		testContextObject.pom.shiftConfigurationPO().homeButtonClick();
	}

	@Given("Create Tour")
	public void create_tour(DataTable dataTable) throws InterruptedException {
		logger.info("Create Tour Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToTour();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("TourID: " + data.get("TourID"));
			String tourID = data.get("TourID");
			String tourName = data.get("TourName");
			String minAlwAtATime = data.get("MinAlwAtATime");
			String maxAlwLimit = data.get("MaxAlwLimit");
			String maxAlwLimitFor = data.get("MaxAlwLimitFor");
			String tourDocReq = data.get("TourDocReq");
			String minTrDayForDocCom = data.get("MinTrDayForDocCom");
			String alwWithAllOthrTour = data.get("AlwWithAllOthrTour");
			String woAlwSingleSidTr = data.get("WoAlwSingleSidTr");
			String woAlwBothSidTr = data.get("WoAlwBothSidTr");
			String hldAlwSingleSidTr = data.get("HldAlwSingleSidTr");
			String hldAlwBothSidTr = data.get("HldAlwBothSidTr");
			String validation = data.get("Validation");
			testContextObject.pom.tourPO().createTour(tourID, tourName, minAlwAtATime, maxAlwLimit, maxAlwLimitFor,
					tourDocReq, minTrDayForDocCom, alwWithAllOthrTour, woAlwSingleSidTr, woAlwBothSidTr,
					hldAlwSingleSidTr, hldAlwBothSidTr, validation);
		}
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@When("Create Accrual Policy from Accrual Policy page")
	public void create_accrual_policy_from_accrual_policy_page(DataTable dataTable) throws InterruptedException {
		logger.info("Create Accrual Policy from Accrual Policy page Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToAccrualPolicy();
		testContextObject.pom.accrualPolicyPO().createAccrualPolicy(dataTable);
		Thread.sleep(500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@When("Add Considered Attendance values in {string} Accrual Policy")
	public void add_considered_attendance_values_in_accrual_policy(String plcName, DataTable dataTable)
			throws InterruptedException {
		logger.info("Add Considered Attendance values in " + plcName + " Accrual Policy Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToAccrualPolicy();
		testContextObject.pom.accrualPolicyPO().addValuesInAccrualPolicy(plcName, dataTable);
		Thread.sleep(500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Then("Encash C-OFF from C-OFF Encashment page")
	public void encash_c_off_from_c_off_encashment_page(DataTable dataTable) throws InterruptedException {
		logger.info("Encash C-OFF from C-OFF Encashment page Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToCOffEncashmentPage();
		testContextObject.pom.cOFFEncashmentPO().cOffEncashment(dataTable);
		Thread.sleep(500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Then("Verify C-OFF from C-OFF Encashment page for UserId={string}")
	public void verify_c_off_from_c_off_encashment_page_for_user_id(String userId, DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify C-OFF from C-OFF Encashment page for UserId= " + userId + " Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToCOffEncashmentPage();
		testContextObject.pom.cOFFEncashmentPO().verifyCOffEncashment(userId, dataTable);
		Thread.sleep(500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Then("{string} Overflow Leaves from Overflow Management page")
	public void overflow_leaves_from_overflow_management_page(String adjstType, DataTable dataTable)
			throws InterruptedException {
		logger.info(adjstType + " Overflow Leaves from Overflow Management page Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToOverflowManagementPage();
		testContextObject.pom.overflowManagementPO().manageOverflowLeave(adjstType, dataTable);
		Thread.sleep(500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Run Leave Balance Process for Month = {string} and Year = {string}")
	public void run_leave_balance_process_for_month_and_year(String month, String year, DataTable dataTable)
			throws InterruptedException {
		logger.info("Run Leave Balance Process for Month = " + month + " and Year = " + year + " Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToLeaveBalanceProcessPage();
		testContextObject.pom.leaveBalanceProcessPO().processLeaveBalance(month, year, dataTable);
		Thread.sleep(500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Kamal
	@When("{string} Leave module reports configuration")
	public void report_configuration(String string, DataTable datatable) throws Exception {
		logger.info(string + " Leave module reports configuration Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveModuleReportsPO().leaveModuleReport(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@When("Export {string} Leave Register from Leave Register page")
	public void export_leave_register_from_leave_register_page(String period, DataTable dataTable)
			throws InterruptedException {
		logger.info("Export " + period + " Leave Register from Leave Register page Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToLeaveRegisterPage();
		testContextObject.pom.leaveRegisterPO().exportLeaveRegister(period, dataTable);
		Thread.sleep(500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Configure Leaves Which Cannot Be Clubbed for LeaveID = {string}")
	public void configure_leaves_which_cannot_be_clubbed_for_leave_id(String leaveId, DataTable dataTable)
			throws InterruptedException {
		logger.info("Configure Leaves Which Cannot Be Clubbed for LeaveID = " + leaveId + " Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToLeave();
		testContextObject.pom.leavePO().configLeaveWhCanNtClub(leaveId, dataTable);
		Thread.sleep(500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Configure Tours which cannot be Clubbed for TourID = {string}")
	public void configure_tours_which_cannot_be_clubbed_for_tour_id(String tourId, DataTable dataTable)
			throws InterruptedException {
		logger.info("Configure Tours which cannot be Clubbed for TourID = " + tourId + " Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToTour();
		testContextObject.pom.tourPO().configTourWhCanNtClub(tourId, dataTable);
		Thread.sleep(500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Then("Verify C-OFF Balance in Leave Balance Page for UserID= {string}")
	public void verify_c_off_balance_in_leave_balance_page_for_user_id(String userId,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify C-OFF Balance in Leave Balance Page for UserID= " + userId + " Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToLeaveBalance();
		testContextObject.pom.leaveBalancePO().cOffBalanceView(userId, dataTable);
		testContextObject.pom.shiftConfigurationPO().homeButtonClick();
	}

	// Chhaya
	@Then("Apply COff Application from SA")
	public void apply_c_off_application_from_sa(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException, IOException {
		logger.info("Apply COff Application from SA Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToCOFFApplication();
		testContextObject.pom.coffApplicationPO().coffApplicationFromSA(dataTable);
		testContextObject.pom.shiftConfigurationPO().homeButtonClick();
	}

	@When("Apply Leave Application from leave module")
	public void apply_leave_application_from_leave_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Apply Leave Application from leave module Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToLeaveApplication();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: " + data.get("userid") + " FromDate: " + data.get("FromDate"));
			testContextObject.pom.leaveApplicationPO().applyLeaveApplication(data);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	@Given("Approve Reject Leave Application from SA Date From= {string} To= {string}")
	public void approve_reject_leave_application_from_sa_date_from_to(String fromDtHeader, String toDtHeader, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Approve Reject Leave Application from SA Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToLeaveApproval();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: " + data.get("User"));
			String user = data.get("User");
			String fromDate = data.get("FromDate");
			String toDate = data.get("ToDate");
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String panelName = data.get("PanelName");
			String validation = data.get("Validation");
			testContextObject.pom.leaveApprovalPO().approvalOfLeave(fromDtHeader, toDtHeader, user, fromDate, toDate, approve, reject,
					panelName, validation);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	@Given("Approve Reject Tour Application from SA Date From= {string} To= {string}")
	public void approve_reject_tour_application_from_sa_date_from_to(String fromDtHeader, String toDtHeader, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Approve Reject Tour Application from SA Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToTourApproval();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: " + data.get("User"));
			String user = data.get("User");
			String fromDate = data.get("FromDate");
			String toDate = data.get("ToDate");
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String validation = data.get("Validation");
			testContextObject.pom.tourApprovalPO().tourApplicationApproval(fromDtHeader, toDtHeader, user, fromDate, toDate, approve, reject,
					validation);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	@Given("Approve Reject Coff Application from SA Date From= {string} To= {string}")
	public void approve_reject_coff_application_from_sa_date_from_to(String fromDtHeader, String toDtHeader, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Approve Reject Tour Application from SA Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToCoffApproval();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("User: "+data.get("User")+" FromDate: "+data.get("FromDate"));
			String user = data.get("User");
			String fromDate = data.get("FromDate");
			String toDate = data.get("ToDate");
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String validation = data.get("Validation");
			testContextObject.pom.coffApprovalPO().cOffApplicationApproval(fromDtHeader, toDtHeader, user, fromDate, toDate, approve, reject,
					validation);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	@Given("Apply Tour Application from leave module")
	public void apply_tour_application_from_leave_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Apply Tour Application from leave module Started");
		testContextObject.pom.homePO().goToLeaveManagementModule();
		testContextObject.pom.leaveManagementPO().goToTourApplication();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: " + data.get("userid") + " FromDate: " + data.get("FromDate"));
			testContextObject.pom.tourApplicationPO().applyTourApplication(data);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();

	}
	

}
