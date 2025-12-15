package stepDefinations;

import java.sql.Driver;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.record.PageBreakRecord.Break;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.testng.Assert;

import CommonTestAbstract.TestContextObject;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class JobProcessingCostingSD {
	TestContextObject testContextObject;
	String product = null;
	String taskSchedulerName = null;
	private static Logger logger=LogManager.getLogger(JobProcessingCostingSD.class);
	
	public JobProcessingCostingSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}
	
		// By Mayank
	@Given("Create Job from Job Processing and Costing")
	public void create_job_from_job_processing_and_costing(io.cucumber.datatable.DataTable dataTable)
			throws Exception {
		logger.info("Create Job from Job Processing and Costing Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Code: "+data.get("Code")+ " JobStartDate: "+data.get("JobStartDate"));
			if (data.get("ChangeDate") != null) {
				// Change Date
				testContextObject.baseTest.startStopService("AlertService", "stop");
				logger.debug("Alert Service Stop");
				Thread.sleep(1000);
				String currentDate = testContextObject.pom.abstractMethod().currentdateSystemDateChangeFormat();
				Thread.sleep(1000);
				String changedate = testContextObject.pom.abstractMethod().staticDateOrPlusMinusFromCurrentDate(data.get("ChangeDate"));
				//Runtime.getRuntime().exec("cmd /c date " + changedate);
				testContextObject.pom.abstractMethod().systemDatetimeCHanged(changedate);
				logger.debug("Date changed to "+changedate);
				Thread.sleep(1000);
				int code = testContextObject.baseTest.startStopService("AlertService", "start");
				Assert.assertEquals(code, 0);
				logger.debug("Alert Service Start");
				Thread.sleep(1000);
				testContextObject.baseTest.intializeBrowser();
				testContextObject.baseTest.goTo();
				String title = testContextObject.pom.loginPO().credential("sa", "admin");
				Assert.assertEquals(title, "Welcome System Admin");		
				logger.debug("Login Successfully");
				// Main code
				testContextObject.pom.homePO().goToJPCmodule();
				testContextObject.pom.jobProcessingCostingPO().goToJob();
				Thread.sleep(3000);
				String val = testContextObject.pom.jobPO().createJob(data.get("Code"), data.get("Name"),
						data.get("JobStartDate"), data.get("JobEndDate"), data.get("EstimatedHours"), data.get("JobSchedulerType"));
				Assert.assertEquals(val, data.get("Validation"));
				testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
				logger.debug("Job Created");
				// Change Date
				int code1 = testContextObject.baseTest.startStopService("AlertService", "stop");
				Assert.assertEquals(code1, 0);
				logger.debug("Alert Service Stop");
				Thread.sleep(1000);
				//Runtime.getRuntime().exec("cmd /c date " + currentDate);
				testContextObject.pom.abstractMethod().systemDatetimeCHanged(currentDate);

				logger.debug("Date changed to current date");
				Thread.sleep(1000);
				testContextObject.baseTest.startStopService("AlertService", "start");
				logger.debug("Alert Service Start");
				Thread.sleep(1000);
				testContextObject.baseTest.intializeBrowser();
				testContextObject.baseTest.goTo();
				String title1 = testContextObject.pom.loginPO().credential("sa", "admin");
				Assert.assertEquals(title1, "Welcome System Admin");	
				logger.debug("Login Successfully");
			} else {
//				Thread.sleep(500);
				testContextObject.pom.homePO().goToJPCmodule();
//				Thread.sleep(500);
				testContextObject.pom.jobProcessingCostingPO().goToJob();
//				Thread.sleep(3000);
				String val = testContextObject.pom.jobPO().createJob(data.get("Code"), data.get("Name"),
						data.get("JobStartDate"), data.get("JobEndDate"), data.get("EstimatedHours"), data.get("JobSchedulerType"));
				Thread.sleep(1200);
				Assert.assertEquals(val, data.get("Validation"));
				testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
				testContextObject.pom.jobPO().warningPopUp();
				logger.debug("Job Created");
			}
		}
		
	}

	// By Mayank
	@Given("Create Phase from Job Processing and Costing")
	public void create_phase_from_job_processing_and_costing(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create Phase from Job Processing and Costing Started");
		testContextObject.pom.homePO().goToJPCmodule();
		Thread.sleep(1000);
		testContextObject.pom.jobProcessingCostingPO().goToPhase();
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String val = testContextObject.pom.phasePO().createPhase(data.get("Name"), data.get("Description"));
			Assert.assertEquals(val, data.get("Validation"));
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	// By Mayank
	@Given("Create Project {string} with StartDate {string} and EndDate {string} from Job Processing and Costing")
	public void create_project_with_start_date_and_end_date_from_job_processing_and_costing(String projectName,
			String projectSdate, String projectEdate, io.cucumber.datatable.DataTable dataTable)
			throws Exception {
		logger.info("Create Project Started");
		if (dataTable.entries().get(0).get("ChangeDate") != null) {
			// Change Date
			testContextObject.baseTest.startStopService("AlertService", "stop");
			logger.debug("Alert Service Stop");
			Thread.sleep(1000);
			String currentDate = testContextObject.pom.abstractMethod().currentdateSystemDateChangeFormat();
			Thread.sleep(1000);
			String changedate = testContextObject.pom.abstractMethod().staticDateOrPlusMinusFromCurrentDate(dataTable.entries().get(0).get("ChangeDate"));
			//Runtime.getRuntime().exec("cmd /c date " + changedate);
			testContextObject.pom.abstractMethod().systemDatetimeCHanged(changedate);
			logger.debug("Date changed to "+changedate);
			Thread.sleep(1000);
			int code = testContextObject.baseTest.startStopService("AlertService", "start");
			Assert.assertEquals(code, 0);
			logger.debug("Alert Service Start");
			Thread.sleep(1000);
			testContextObject.baseTest.intializeBrowser();
			testContextObject.baseTest.goTo();
			String title = testContextObject.pom.loginPO().credential("sa", "admin");
			Assert.assertEquals(title, "Welcome System Admin");	
			logger.debug("Login successfully");
			// Main code
			testContextObject.pom.homePO().goToJPCmodule();
			testContextObject.pom.jobProcessingCostingPO().goToProject();
			List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
			testContextObject.pom.projectPO().createProject(projectName, projectSdate, projectEdate, data);
			testContextObject.pom.userConfigurationPO().homeButtonClick();
			logger.debug("Project created");
			// Change Date
			int code1 = testContextObject.baseTest.startStopService("AlertService", "stop");
			Assert.assertEquals(code1, 0);
			logger.debug("Alert Service Stop");
			Thread.sleep(1000);
			//Runtime.getRuntime().exec("cmd /c date " + currentDate);
			testContextObject.pom.abstractMethod().systemDatetimeCHanged(currentDate);
			logger.debug("Date changed to current date");
			Thread.sleep(1000);
			testContextObject.baseTest.startStopService("AlertService", "start");
			logger.debug("Alert Service Start");
			Thread.sleep(1000);
			testContextObject.baseTest.intializeBrowser();
			testContextObject.baseTest.goTo();
			String title1 = testContextObject.pom.loginPO().credential("sa", "admin");
			Assert.assertEquals(title1, "Welcome System Admin");
			logger.debug("Login successfully");
		} else {
			// Main code
			testContextObject.pom.homePO().goToJPCmodule();
			testContextObject.pom.jobProcessingCostingPO().goToProject();
			List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
			testContextObject.pom.projectPO().createProject(projectName, projectSdate, projectEdate, data);
			testContextObject.pom.userConfigurationPO().homeButtonClick();
			logger.debug("Project created");
		}
	}

	// By Mayank
	@Given("Set Job Configuration in Phase {string} of Project {string} from Job Processing and Costing")
	public void set_job_configuration_in_phase_of_project_from_job_processing_and_costing(String phase, String project,
			io.cucumber.datatable.DataTable dataTable) throws Exception {
		logger.info("Set Job Configuration in Phase Started");
		if (dataTable.entries().get(0).get("ChangeDate") != null) {
			// Change Date
			testContextObject.baseTest.startStopService("AlertService", "stop");
			logger.debug("Alert Service Stop");
			Thread.sleep(1000);
			String currentDate = testContextObject.pom.abstractMethod().currentdateSystemDateChangeFormat();
			Thread.sleep(1000);
			String changedate = testContextObject.pom.abstractMethod().staticDateOrPlusMinusFromCurrentDate(dataTable.entries().get(0).get("ChangeDate"));
			//Runtime.getRuntime().exec("cmd /c date " + changedate);
			testContextObject.pom.abstractMethod().systemDatetimeCHanged(changedate);
			logger.debug("Date Changed to "+changedate);
			Thread.sleep(1000);
			int code = testContextObject.baseTest.startStopService("AlertService", "start");
			Assert.assertEquals(code, 0);
			logger.debug("Alert Service Start");
			Thread.sleep(1000);
			testContextObject.baseTest.intializeBrowser();
			testContextObject.baseTest.goTo();
			String title = testContextObject.pom.loginPO().credential("sa", "admin");
			Assert.assertEquals(title, "Welcome System Admin");	
			logger.debug("Login Successfully");
			// Main code
			testContextObject.pom.homePO().goToJPCmodule();
			testContextObject.pom.jobProcessingCostingPO().goToProject();
			List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
			testContextObject.pom.projectPO().jobConfigInPhaseInProject(phase, project, data);
			testContextObject.pom.userConfigurationPO().homeButtonClick();
			logger.debug("Job Configuration in Phase Set Successfully");
			// Change Date
			int code1 = testContextObject.baseTest.startStopService("AlertService", "stop");
			Assert.assertEquals(code1, 0);
			logger.debug("Alert Service Stop");
			Thread.sleep(1000);
			//Runtime.getRuntime().exec("cmd /c date " + currentDate);
			testContextObject.pom.abstractMethod().systemDatetimeCHanged(currentDate);
			logger.debug("Date changed to current date");
			Thread.sleep(1000);
			testContextObject.baseTest.startStopService("AlertService", "start");
			logger.debug("Alert Service Start");
			Thread.sleep(1000);
			testContextObject.baseTest.intializeBrowser();
			testContextObject.baseTest.goTo();
			String title1 = testContextObject.pom.loginPO().credential("sa", "admin");
			Assert.assertEquals(title1, "Welcome System Admin");
			logger.debug("Login successfully");
		} else {
			// Main code
			testContextObject.pom.homePO().goToJPCmodule();
			testContextObject.pom.jobProcessingCostingPO().goToProject();
			List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
			testContextObject.pom.projectPO().jobConfigInPhaseInProject(phase, project, data);
			testContextObject.pom.userConfigurationPO().homeButtonClick();
			logger.debug("Job Configuration in Phase Set Successfully");
		}
	}

	// By Mayank
	@Given("Apply Timesheet Correction Application via API")
	public void apply_timesheet_correction_application_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Apply Timesheet Correction Application via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userid: "+data.get("userid"));
			// GET API fire for get TID from application
			String userid = data.get("userid");
			String daterange = testContextObject.pom.abstractMethod()
					.daterangeSelectedForAPI(data.get("attendance-date"), data.get("attendance-date"));
			String url = "get;userid=" + userid + ";date-range=" + daterange + ";format=json;";
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "timesheet", 200);
			logger.debug(getres);
			String tid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,
					"timesheet.transaction-id");
			// SET API
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			String valmsg;
			testContextObject.pom.timesheetCorrectionPO().timesheetCorrectionApplicationAPI(columnHeader, apiParameter,
					data, tid);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String appliedBy = data.get("appliedBy");
			String res = testContextObject.baseTest.setAPI(userParameter, appliedBy, "admin",
					"timesheet-correction-application", 200);
			Assert.assertEquals(res, "success: 0800200001 : successful");
		}
	}

	// Mayank
	@Given("Delete Project from Job Processing and Costing")
	public void delete_project_from_job_processing_and_costing(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.debug("Delete Project from Job Processing and Costing Started");
		testContextObject.pom.homePO().goToJPCmodule();
		Thread.sleep(1000);
		testContextObject.pom.jobProcessingCostingPO().goToProject();
		Thread.sleep(2000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ProjectName: "+data.get("ProjectName"));
			testContextObject.pom.projectPO().deleteProject(data.get("ProjectName"));
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	// Mayank
	@Given("Delete Phase from Job Processing and Costing")
	public void delete_phase_from_job_processing_and_costing(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Delete Phase from Job Processing and Costing Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToPhase();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("PhaseName: "+data.get("PhaseName"));
			testContextObject.pom.phasePO().deletePhase(data.get("PhaseName"));
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	// Mayank
	@Given("Delete Job from Job Processing and Costing")
	public void delete_job_from_job_processing_and_costing(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Delete Job from Job Processing and Costing Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToJob();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("JobCode: "+data.get("JobCode"));
			testContextObject.pom.jobPO().deleteJob(data.get("JobCode"));
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	// By Chhaya
	@Given("Verify dropdown value {string} on User Job Details Page")
	public void verify_dropdown_value_on_user_job_details_page(String dropValue) throws InterruptedException {
		logger.info("Verify dropdown value "+dropValue+" on User Job Details Page Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToUserJobDetails();
		Thread.sleep(2000);
		testContextObject.pom.userJobDetailsPO().verifyDropdownValue(dropValue);
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	// Chhaya
	@Given("Verify Field name {string} on Job Page")
	public void verify_field_name_on_job_page(String fieldName) throws InterruptedException {
		logger.info("Verify Field name "+fieldName+" on Job Page Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToJob();
		testContextObject.pom.jobPO().verifyJobFieldName(fieldName);
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	// By Chhaya
	@Given("Verify Field name {string} on Project Summary report Page")
	public void verify_field_name_on_project_summary_report_page(String fieldName) throws InterruptedException {
		logger.info("Verify Field name "+fieldName+" on Project Summary report Page Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToProjectSummary();
		testContextObject.pom.projectSummaryPO().verifyProjectSummaryFieldName(fieldName);
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	// by Chhaya
	@Given("Verify Field name {string} on Phase Summary report Page")
	public void verify_field_name_on_phase_summary_report_page(String fieldName) throws InterruptedException {
		logger.info("Verify Field name "+fieldName+" on Phase Summary report Page Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToPhaseSummary();
		testContextObject.pom.phaseSummaryPO().verifyPhaseSummaryFieldName(fieldName);
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	// by Chhaya
	@Given("Verify Tab Header {string} on Project Page")
	public void verify_tab_header_on_project_page(String tabName) throws InterruptedException {
		logger.info("Verify Tab Header "+tabName+" on Project Page Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToProject();
		testContextObject.pom.projectPO().verifyPhaseTabName(tabName);
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	// by Chhaya
	@Then("Apply Timesheet Correction Application from SA login")
	public void apply_timesheet_correction_application_from_sa_login(DataTable dataTable) throws InterruptedException {
		logger.info("Apply Timesheet Correction Application from SA login Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToTimesheetCorrection();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("userid")+" attendance-date: "+data.get("attendance-date"));
			String userid = data.get("userid");
			String attendanceDate = data.get("attendance-date");
			String jobCode = data.get("job-code");
			String validation = data.get("Validation");
			testContextObject.pom.timesheetCorrectionPO().timesheetCorrectionApplicationFromSA(userid, attendanceDate,
					jobCode, validation);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	//by Chhaya
	@When("Export Daily Timesheet from JPC Module")
	public void export_daily_timesheet_from_jpc_module(DataTable dataTable) throws InterruptedException {
		logger.info("Export Daily Timesheet from JPC Module Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToDailyTimesheet();
		testContextObject.pom.dailyTimesheetPO().exportDailyTimesheet(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	//Kamal
	@When("{string} Job Processing Costing  module reports configuration")
	public void report_configuration(String string, DataTable datatable) throws Exception {
		logger.info(string+" Job Processing Costing  module reports configuration Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingModuleReportPO().jobProcessingCostingModuleReport(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Assign Award Penalty Hours from SA login")
	public void assign_award_penalty_hours_from_sa_login(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Assign Award Penalty Hours from SA login Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToTimesheetCorrection();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+data.get("Userid")+" Date: "+data.get("Date"));
			testContextObject.pom.timesheetCorrectionPO().assignAwardPaneltyFromSA(data);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	
	@Then("Verify Job according to user punches from Timesheet Correction page")
	public void verify_job_according_to_user_punches_from_timesheet_correction_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Job according to user punches from Timesheet Correction page Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToTimesheetCorrection();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Date = "+data.get("Date")+" JobCode: "+data.get("JobCode"));
			String userId = data.get("UserId");
			String date = data.get("Date");
			String jobCode = data.get("JobCode");
			String phaseCode = data.get("PhaseCode");
			String projectCode = data.get("ProjectCode");
			String startDate = data.get("StartDate");
			String startTime = data.get("StartTime");
			String endDate = data.get("EndDate");
			String endTime = data.get("EndTime");
			String transactionType = data.get("TransactionType");
			String hours = data.get("Hours");
			String jobCount = data.get("JobCount");
			testContextObject.pom.timesheetCorrectionPO().verifyJobInTimesheetCorrection(userId, date, jobCode, phaseCode, projectCode, startDate, startTime, endDate, endTime, transactionType, hours, jobCount);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	@When("Create Job via API")
	public void create_job_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Create Job via API Started");
		List<String> columnHeader = new ArrayList<>();
		for(int i = 0; i<dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("job-code: "+data.get("job-code"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.jobPO().createJobAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for(String s : apiParameter) {
				builder.append(s+";");
			}
			String userParameter = builder.toString();
			// logger.debug(userParameter);
			String expectedAPIResponse = "success: 0750203008 : Job Created/Updated Successfully";
			String result = testContextObject.baseTest.setAPI(userParameter, "sa", "admin", "job", 200);
			Assert.assertEquals(result, expectedAPIResponse);
		}
	}

	@Then("Verify Job from Job Processing and Costing Module")
	public void verify_job_from_job_processing_and_costing_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Job from Job Processing and Costing Module Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToJob();
		Thread.sleep(3000);
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("JobCode: "+data.get("JobCode"));
			testContextObject.pom.jobPO().verifyJob(data);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	@Then("Update Project {string} with StartDate {string} and EndDate {string} from Job Processing and Costing")
	public void update_project_with_start_date_and_end_date_from_job_processing_and_costing(String projectName,
			String projectSdate, String projectEdate, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Update Project from Job Processing and Costing Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToProject();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.projectPO().updateProject(projectName, projectSdate, projectEdate, data);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
		logger.debug("Project created");
	}

	@Given("Delete Job Scheduler")
	public void delete_job_scheduler(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Job Scheduler Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToJobScheduler();
		for(Map<String, String> data: dataTable.asMaps(String.class, String.class)) {
			logger.info("SchedulerName: "+data.get("SchedulerName"));
			testContextObject.pom.jobSchedulerPO().deleteJobScheduler(data);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	@When("Create Job Scheduler from JPC Module")
	public void create_job_scheduler_from_jpc_module(io.cucumber.datatable.DataTable dataTable) throws Exception {
		logger.info("Create Job Sceduler from JPC Module Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToJobScheduler();
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("JobSchedulerName: "+data.get("JobSchedulerName"));
			testContextObject.pom.jobSchedulerPO().createJobScheduler(data);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	//Chhaya
	@When("Configure Job Parameters in Job Scheduler= {string}")
	public void configure_job_parameters_in_job_scheduler(String schedulerName, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Configure Job Parameters in Job Scheduler Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToJobScheduler();
		testContextObject.pom.jobSchedulerPO().configureJob(schedulerName, dataTable);
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

	//Chhaya
	@When("Verify Job Scheduler in Scheduler Log")
	public void verify_job_scheduler_in_scheduler_log(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Configure Job Parameters in Job Scheduler Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToSchedulerLogs();
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("SchedulerName: "+data.get("SchedulerName"));
			testContextObject.pom.schedulerLogsJPCPO().verifyJobSchedulerLog(data);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	//Chhaya
	@Then("Preview Schedule from Job Scheduler page for SchedulerName= {string} and ProcessingPeriod= {string}")
	public void preview_schedule_from_job_scheduler_page_for_scheduler_name_and_processing_period(String schedulerName, String processingPeriod, io.cucumber.datatable.DataTable dataTable) throws Exception {
		logger.info("Preview Schedule from Job Scheduler page Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToJobScheduler();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		
		testContextObject.pom.jobSchedulerPO().previewSchedule(schedulerName, processingPeriod, data);
		
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	//Chhaya
	@When("Run Job Assignment Process for Month = {string} and Year = {string}")
	public void run_job_assignment_process_for_month_and_year(String month, String year, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Run Job Assignment Process Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToJobAssignmentProcess();
		testContextObject.pom.jobAssignmentProcessPO().jobAssignmentProcess(month, year, dataTable);
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	//Chhaya
	@When("Update configured jobs in Job Scheduler = {string} Schedule Run Time= {string}")
	public void update_configured_jobs_in_job_scheduler_schedule_run_time(String jobSchedulerName, String scheduleRunTime, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Update configured jobs in Job Scheduler Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToJobScheduler();
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("JobName: "+data.get("JobName"));
			testContextObject.pom.jobSchedulerPO().updateJob(jobSchedulerName, scheduleRunTime, dataTable);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}
	
	@Given("Authorize time sheet corrrection application from JPC module")
	public void authorize_time_sheet_corrrection_application_from_jpc_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Authorize time sheet corrrection application from JPC module Started");
		testContextObject.pom.homePO().goToJPCmodule();
		testContextObject.pom.jobProcessingCostingPO().goToTimesheetCorrectionAutjorization();
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserName: "+data.get("UserName")+"   AttendanceDate="+data.get("AttendanceDate"));
			testContextObject.pom.timesheetCorrectionAuthorizationPO().timesheetCorrectionAuth(data);
		}
		testContextObject.pom.jobProcessingCostingPO().homeButtonClick();
	}

}
