package stepDefinations;

import java.io.IOException;
import java.sql.Driver;
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

public class FieldVisitManagementSD {
	private static Logger logger=LogManager.getLogger(FieldVisitManagementSD.class);
	TestContextObject testContextObject;
	String product = null;
	String taskSchedulerName = null;

	public FieldVisitManagementSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	// by Mayank
	@Given("Create Task from Field Visit Management")
	public void create_task_from_field_visit_management(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create Task from Field Visit Management Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToTask();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("TaskName: "+data.get("TaskName"));
			String taskName = data.get("TaskName");
			String desription = data.get("Description");
			String actual = testContextObject.pom.taskPO().createTask(taskName, desription);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	// By Mayank
	@Given("Create Field Visit Schedule for User {string} and date {string} from Field Visit Management")
	public void create_field_visit_schedule_for_user_and_date_from_field_visit_management(String userid, String date,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Field Visit Schedule for User "+userid+" and date "+date+" from Field Visit Management Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToFieldVisitSchedule();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.fieldVisitSchedulePO().createFieldVisitSchedule(userid, date, data);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// By Chhaya
	@Then("Validate Scheduled visits for UserID={string} in table on Field Visit Schedule page")
	public void validate_scheduled_visits_for_user_id_in_table_on_field_visit_schedule_page(String userID,
			DataTable dataTable) throws InterruptedException {
		logger.info("Validate Scheduled visits for UserID= "+userID+" in table on Field Visit Schedule page Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToFieldVisitSchedule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String date = data.get("Date");
			String scheduledVisits = data.get("ScheduledVisits");
			testContextObject.pom.fieldVisitSchedulePO().validateScheduledFieldVisit(userID, date, scheduledVisits);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// By Chhaya
	@Given("Delete Task from Field Visit Management")
	public void delete_task_from_field_visit_management(DataTable dataTable) throws InterruptedException {
		logger.info("Delete Task from Field Visit Management Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToTask();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("TaskName: "+data.get("TaskName"));
			String taskName = data.get("TaskName");
			testContextObject.pom.taskPO().deleteTask(taskName);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// By Chhaya
	@Then("Validate scheduled visit form Field visit status Page")
	public void validate_scheduled_visit_form_field_visit_status_page(DataTable dataTable) throws InterruptedException {
		logger.info("Validate scheduled visit form Field visit status Page Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToFieldVisitStatus();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+"TaskName: "+data.get("TaskName"));
			String usrId = data.get("UserID");
			String attendancePeriodMonth = data.get("AttendancePeriodMonth");
			String attendancePeriodYear = data.get("AttendancePeriodYear");
			String startDate = data.get("StartDate");
			String endDate = data.get("EndDate");
			String scheduleStartTime = data.get("ScheduleStartTime");
			String scheduleEndTime = data.get("ScheduleEndTime");
			String taskName = data.get("TaskName");
			String location = data.get("Location");
			testContextObject.pom.fieldVisitStatusPO().validateFieldVisitFromStatusPage(usrId, attendancePeriodMonth,
					attendancePeriodYear, startDate, endDate, scheduleStartTime, scheduleEndTime, taskName, location);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// By Chhaya
	@When("Apply Field Visit Correction from SA login")
	public void apply_field_visit_correction_from_sa_login(DataTable dataTable) throws InterruptedException {
		logger.info("Apply Field Visit Correction from SA login Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToFieldVisitCorrection();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+"Date: "+data.get("Date")+"Time: "+data.get("Time"));
			String userID = data.get("UserID");
			String date = data.get("Date");
			String time = data.get("Time");
			String location = data.get("Location");
			String comment = data.get("Comment");
			String validation = data.get("Validation");
			testContextObject.pom.fieldVisitCorrectionPO().createFieldVisitCorrectionFromSA(userID, date, time,
					location, comment, validation);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// By Chhaya
	@Then("Validate Field visit correction for UserID={string} in table on Field Visit Correction page")
	public void validate_field_visit_correction_for_user_id_in_table_on_field_visit_correction_page(String userId,
			DataTable dataTable) throws InterruptedException {
		logger.info("Validate Field visit correction for UserID= "+userId+" in table on Field Visit Correction page Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToFieldVisitCorrection();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Date: "+data.get("Date")+"ScheduleStatus: "+data.get("ScheduleStatus"));
			String date = data.get("Date");
			String scheduleStatus = data.get("ScheduleStatus");
			testContextObject.pom.fieldVisitCorrectionPO().validateFieldVisitCorrectionFromSA(userId, date,
					scheduleStatus);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// chhaya
	@Then("Authorize Field visit corretion from Field Visit Correction Authorization Page from SA Login")
	public void authorize_field_visit_corretion_from_field_visit_correction_authorization_page_from_sa_login(
			DataTable dataTable) throws InterruptedException {
		logger.info("Authorize Field visit corretion from Field Visit Correction Authorization Page from SA Login Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToFieldVisitCorrectionAuthorization();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserName: "+data.get("UserName")+"AttendanceDate: "+data.get("AttendanceDate"));
			String userName = data.get("UserName");
			String attendanceDate = data.get("AttendanceDate");
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String validaton = data.get("Validaton");
			testContextObject.pom.fieldVisitCorrectionAuthorizationPO().fieldVisitCorrectionAuthorization(userName,
					attendanceDate, approve, reject, validaton);
		}
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// chhaya
	@Then("Verify In {string} Tab in Field Visit Correction Authorization Page from SA Login")
	public void verify_in_tab_in_field_visit_correction_authorization_page_from_sa_login(String tabName,
			DataTable dataTable) throws InterruptedException {
		logger.info("Verify In "+tabName+" Tab in Field Visit Correction Authorization Page from SA Login Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToFieldVisitCorrectionAuthorization();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserName: "+data.get("UserName")+"AttendanceDate: "+data.get("AttendanceDate"));
			String userName = data.get("UserName");
			String attendanceDate = data.get("AttendanceDate");
			testContextObject.pom.fieldVisitCorrectionAuthorizationPO().verifyRejectedFieldVisitInSA(tabName, userName,
					attendanceDate);
		}
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// chhaya
	@Given("Copy created Field Visit Schedule")
	public void copy_created_field_visit_schedule(DataTable dataTable) throws InterruptedException {
		logger.info("Copy created Field Visit Schedule Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToFieldVisitSchedule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FVSOfUser: "+data.get("FVSOfUser")+"Date: "+data.get("Date"));
			String fVSOfUser = data.get("FVSOfUser");
			String fVSToUser = data.get("FVSToUser");
			String date = data.get("Date");
			String validation = data.get("Validation");
			testContextObject.pom.fieldVisitSchedulePO().copyScheduledFieldVisit(fVSOfUser, fVSToUser, date, validation);
		}
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Re-assign created Field Visit Schedule")
	public void re_assign_created_field_visit_schedule(DataTable dataTable) throws InterruptedException {
		logger.info("Re-assign created Field Visit Schedule Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToFieldVisitSchedule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FVSOfUser: "+data.get("FVSOfUser")+"ScheduledDate: "+data.get("ScheduledDate"));
			String fVSOfUser = data.get("FVSOfUser");
			String fVSToUser = data.get("FVSToUser");
			String scheduledDate = data.get("ScheduledDate");
			String reassignDate = data.get("ReassignDate");
			String validation = data.get("Validation");
			testContextObject.pom.fieldVisitSchedulePO().reassignScheduledFieldVisit(fVSOfUser, fVSToUser, scheduledDate, reassignDate, validation);
		}
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Then("Validate imported visits in Field Visit Schedule page")
	public void validate_imported_visits_in_field_visit_schedule_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Validate imported visits in Field Visit Schedule page Started");
		testContextObject.pom.homePO().goToFVMmodule();
		testContextObject.pom.fieldVisitManagementPO().goToFieldVisitSchedule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+"Date: "+data.get("Date"));
			String userID = data.get("UserID");
			String date = data.get("Date");
			String scheduledVisits = data.get("ScheduledVisits");
			testContextObject.pom.fieldVisitSchedulePO().validateImportedFieldVisit(userID, date, scheduledVisits);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//Kamal
		@When("{string} Field Visit Management  module reports configuration")
		public void report_configuration(String string , DataTable datatable) throws Exception {
			logger.info(string+"Field Visit Management  module reports configuration Started");
			testContextObject.pom.homePO().goToFVMmodule();
			testContextObject.pom.fieldVisitManagementModuleReportPO().fieldVisitManagementModuleReport(string, datatable);
			testContextObject.pom.abstractMethod().homeButtonClick();
		}
	
	
}
