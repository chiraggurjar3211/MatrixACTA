package stepDefinations;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import CommonTestAbstract.TestContextObject;
import PageObject.ShiftAndSchedule.ShiftChangeApplicationPO;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class ShiftAndScheduleSD {
	TestContextObject testContextObject;
	private static Logger logger = LogManager.getLogger(ShiftAndScheduleSD.class);

	public ShiftAndScheduleSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@Given("Create shift in Shift Configuration")
	public void create_shift_in_shift_configuration(DataTable dataTable) throws Exception {
		logger.info("Create shift in Shift Configuration Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToShiftConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ShiftID: " + data.get("ShiftID"));
			String validation = data.get("Validation");
			String val = testContextObject.pom.shiftConfigurationPO().createShift(data);
			Assert.assertEquals(val, validation);
		}
		testContextObject.pom.shiftConfigurationPO().homeButtonClick();
	}

	@Given("Delete {string} shift schedule")
	public void delete_shift_schedule(String string) throws Exception {
		logger.info("Delete shift schedule Started");
		// Write code here that turns the phrase above into concrete actions
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToShiftSchedule();
		testContextObject.pom.shiftSchedulePO().deleteSchdeule(string);
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}

	@And("Delete {string} shift")
	public void delete_shift(String string) throws Exception {
		logger.info("Delete shift Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToShiftConfiguration();
		testContextObject.pom.shiftConfigurationPO().deleteSchift(string);
		testContextObject.pom.shiftConfigurationPO().homeButtonClick();
	}

	@Given("Create Shift Schedule {string} with Start Date {string}")
	public void create_shift_schedule_with_start_date(String string, String string2, DataTable dataTable)
			throws Exception {
		logger.info("Create Shift Schedule Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToShiftSchedule();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		String val = testContextObject.pom.shiftSchedulePO().createSchedule(string, string2, data);
		Assert.assertEquals(val, "Saved Successfully");
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}

	@Given("Run Shift Process for Month = {string} and Year = {string}")
	public void run_shift_process_for_month_and_year(String string, String string2, DataTable dataTable)
			throws Exception {
		logger.info("Run Shift Process Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToMonthlySchedule();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		String val = testContextObject.pom.monthlySchedulePO().monthlyProcess(string, string2, data);
		Assert.assertEquals(val, "Process Completed");
		testContextObject.pom.monthlySchedulePO().homeButtonClick();
	}

	@When("Change Shift via API")
	public void change_shift_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Change Shift via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: " + data.get("userid") + " FromDt: " + data.get("FromDt"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.manageShiftsPO().changeShiftAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String apiResponseValidation = "success: 0660200002 : Shift assigned successfully";
			String res = testContextObject.baseTest.setAPI(userParameter, "SA", "admin", "shift-changer", 200);
			Assert.assertEquals(res, apiResponseValidation);
		}
	}

	@Given("Get Shift and Change Shift via API for Alert")
	public void get_shift_and_change_shift_via_api_for_alert(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Get Shift and Change Shift via API for Alert Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: " + data.get("userid") + " date-range: " + data.get("date-range"));
			// GET API fire for get working shift id of user
			String userid = data.get("userid");
			String daterange = testContextObject.pom.abstractMethod().daterangeSelectedForAPI(data.get("date-range"),
					data.get("date-range"));
			// get;date-range=26072023-26072023;Id=COS_49;Field-name=workingshift
			String url = "get;Id=" + userid + ";date-range=" + daterange + ";Field-name=workingshift;format=json;";
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "attendance-daily", 200);
			String workingshift = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,
					"attendance-daily.workingshift");
			// SET API
			String newshift = null;
			if (workingshift.equalsIgnoreCase(data.get("shift-id1"))) {
				newshift = data.get("shift-id2");
			} else {
				newshift = data.get("shift-id1");
			}
			String seturl = "set;Userid=" + userid + ";date-range=" + daterange + ";shift-id=" + newshift
					+ ";week-off=0;public-holiday=0";
			String appliedby = null;
			// V20R9.1 v- Shift change application
			if (data.get("appliedBy") != null) {
				appliedby = data.get("appliedBy");
			} else {
				appliedby = "SA";
			}
			String res = testContextObject.baseTest.setAPI(seturl, appliedby, "admin", "shift-changer", 200);
			String val1 = "success: 0660200002 : Shift assigned successfully";
			String val2 = "success: 0660203002 : Shift Approval is Pending";
			String applicationVal = null;
			if (res.equalsIgnoreCase(val1) || res.equalsIgnoreCase(val2)) {
				applicationVal = "Shift Applied";
			} else {
				applicationVal = res;
			}
			Assert.assertEquals(applicationVal, "Shift Applied");
		}
	}

	@Given("Verify Shift is processed or not on Monthly Shift Schedule Page")
	public void verify_shift_is_processed_or_not_on_monthly_shift_schedule_page(
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Shift is processed or not on Monthly Shift Schedule Page Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToMonthlyShiftSchedule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("User: " + data.get("User"));
			String user = data.get("User");
			boolean processed1 = Boolean.parseBoolean(data.get("Processed"));
			boolean actual = testContextObject.pom.monthlyShiftSchedulePO().verifyShiftProcessedOrNot(user);
			Assert.assertEquals(actual, processed1);
		}
		Thread.sleep(2000);
		testContextObject.pom.shiftConfigurationPO().homeButtonClick();
		Thread.sleep(2000);
		
	}

	// By Chhaya
	@Then("Verify field name in Manage Shifts page")
	public void verify_field_name_in_manage_shifts_page(DataTable dataTable) throws InterruptedException {
		logger.info("Verify field name in Manage Shifts page Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToManageShifts();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FieldName: " + data.get("FieldName"));
			String fieldName = data.get("FieldName");
			testContextObject.pom.manageShiftsPO().verifyFieldName(fieldName);
		}

		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@When("Create Week Off Group")
	public void create_week_off_group(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Week Off Group Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToWeekOffGroup();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("WOName: " + data.get("WOName"));
			testContextObject.pom.weekOffGroupPO().createWeekOffGroup(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Then("Validate code = {string} in shift assigned for userid = {string} and Month = {string} and Year = {string}")
	public void validate_code_in_shift_assigned_for_userid_and_month_and_year(String shiftCode, String userID,
			String month, String year, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Validate code in shift assigned Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToMonthlyShiftSchedule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Validation: " + data.get("Validation"));
			testContextObject.pom.monthlyShiftSchedulePO().verifyShiftWoPhcodes(shiftCode, userID, month, year, data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Then("Delete Week off group")
	public void delete_week_off_group(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Week off group Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToWeekOffGroup();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("WOName: " + data.get("WOName"));
			testContextObject.pom.weekOffGroupPO().deleteWeekOffGroup(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@When("Create Holiday Schedule {string}")
	public void create_holiday_schedule(String hsName, io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create Holiday Schedule Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		Thread.sleep(1000);
		testContextObject.pom.shiftAndSchedulePO().goToHolidaySchedule();
		Thread.sleep(1000);
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.holidaySchedulePO().createHolidaySchedule(hsName, data);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Given("Delete Holiday Schedule")
	public void delete_holiday_schedule(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Holiday Schedule Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToHolidaySchedule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("HSName: " + data.get("HSName"));
			testContextObject.pom.holidaySchedulePO().deleteHolidaySchedule(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Given("Change shift schedule from Shift and Schedule Module")
	public void change_shift_schedule_from_shift_and_schedule_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Change shift schedule from Shift and Schedule Module Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToChangeSchedule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ChangeType: " + data.get("ChangeType") + " FromDate: " + data.get("FromDate"));
			testContextObject.pom.changeSchedulePO().changeScheduleOfUser(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Given("Change Week Off from shift and schedule module")
	public void change_week_off_from_shift_and_schedule_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Change Week Off from shift and schedule module Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToChangeWeekOff();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("CurrentWeekOffDate: " + data.get("CurrentWeekOffDate"));
			testContextObject.pom.changeWeekOffPO().changeWeekOffOfUser(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Given("Create Restricted Holidays for Holiday Schedule {string}")
	public void create_restricted_holidays_for_holiday_schedule(String hsName,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Restricted Holidays for Holiday Schedule Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToRestrictedHolidays();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.restrictedHolidaysPO().createRestrictedHolidaySchedule(hsName, data);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Kamal
	@When("{string} shiftschedule module reports configuration")
	public void report_configuration(String string, DataTable datatable) throws Exception {
		logger.info(string + " Shift Schedule module reports configuration Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftScheduleModuleReportPO().ShiftScheduleModuleReport(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Given("Configure Off Day Configuration in Shift Schedule {string}")
	public void configure_off_day_configuration_in_shift_schedule(String shiftScheduleName, DataTable dataTable)
			throws InterruptedException {
		logger.info("Configure Off Day Configuration in Shift Schedule Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToShiftSchedule();
		testContextObject.pom.shiftSchedulePO().configureOffDay(shiftScheduleName, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}

	// Mayank
	// CSR-6744
	@Given("Create shift in Shift Configuration for maximum limit")
	public void create_shift_in_shift_configuration_for_maximum_limit(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create shift in Shift Configuration Started");
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().goToShiftConfiguration();
		testContextObject.pom.abstractMethod().pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ShiftID: " + data.get("ShiftID"));
			testContextObject.pom.shiftConfigurationPO().createShiftMaximum(data);
		}
		testContextObject.pom.shiftConfigurationPO().homeButtonClick();
	}

	// Mayank
	@Given("Shift change approval via API")
	public void shift_change_approval_via_api(io.cucumber.datatable.DataTable dataTable) {
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		logger.info("Shift change approval via API Started");
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: " + data.get("userid"));
			// GET API fire for get TID from application
			String userid = data.get("userid");
			String daterange1 = testContextObject.pom.abstractMethod()
					.staticDateOrPlusMinusFromCurrentDate(data.get("date-range"));
			String daterange = daterange1.replace("/", "") + "-" + daterange1.replace("/", "");
			logger.debug(daterange);
			String url = "get;user-filter=0;userid=" + userid + ";date-range=" + daterange
					+ ";application-status=0;format=json;";
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "shift-changer", 200);
			String tid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres, "shift-changer.tid");

			// SET API
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			String valmsg;
			testContextObject.pom.shiftChangeApprovalPO().shiftApprovalAPI(columnHeader, apiParameter, data, tid);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String ricID = data.get("ricID");
			String res = testContextObject.baseTest.setAPI(userParameter, ricID, "admin", "shift-change-approval", 200);
			Assert.assertEquals(res, "success: 1270200002 : Saved Successfully");
			logger.info("Shift Application Approved/Rejected Successfully");
		}
	}

	@Given("Get Change Shift application data for custom Alert")
	public void get_change_shift_application_data(DataTable dataTable) throws Exception {
		testContextObject.pom.homePO().goTOShiftAndScheduleModule();
		testContextObject.pom.shiftAndSchedulePO().gotoShiftChangeApplicationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String userid=data.get("Userid");
			String fromDate=AbstractMethod.dateSelected(data.get("fromDate"));
			testContextObject.pom.shiftChangeApplicationPO().getPendingApplicationDataForCustomMail(userid, fromDate);;
		}
		testContextObject.pom.shiftConfigurationPO().homeButtonClick();
		System.out.println(ShiftChangeApplicationPO.pendingshiftAppData);
	}
	
	// Mayank
	@Given("Validate values via shift-schedule API")
	public void validate_values_via_shift_schedule_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Validate values via shift-schedule API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String userid = data.get("Userid");
			String date = testContextObject.pom.abstractMethod().staticDateOrPlusMinusFromCurrentDate(data.get("Date"));
	        String monthYear = testContextObject.pom.abstractMethod().dateddMMyyyyToMMyyyyWithInputSlash(date);
	        String dateMMDDYYYY = testContextObject.pom.abstractMethod().dateddMMyyyyToMMddyyyyWithInputOutputSlash(date);
	        String api = "get;Userid="+userid+";Month-year="+monthYear+";format=json";
	        String res = testContextObject.baseTest.setAPI(api, "sa", "admin", "shift-schedule", 200);
	        if (data.get("shift-code") != null) {
	        	logger.info("Validate shift-code Started");
	        	String shiftcodeValue = String.valueOf(testContextObject.baseTest.getValueFromAPI(res, "shift-schedule", "shift-code", "date", dateMMDDYYYY));
	        	Assert.assertEquals(shiftcodeValue, data.get("shift-code"));
			}
	        if (data.get("WO") != null) {
	        	logger.info("Validate WO Started");
	        	 String woValue = String.valueOf(testContextObject.baseTest.getValueFromAPI(res, "shift-schedule", "wo", "date", dateMMDDYYYY));
	        	 Assert.assertEquals(woValue, data.get("WO"));
			}
	        if (data.get("PH") != null) {
	        	logger.info("Validate PH Started");
	        	String phValue = String.valueOf(testContextObject.baseTest.getValueFromAPI(res, "shift-schedule", "ph", "date", dateMMDDYYYY));
	        	 Assert.assertEquals(phValue, data.get("PH"));
			}
		}
	}

}
