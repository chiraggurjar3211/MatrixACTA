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

public class BulkSD {
	TestContextObject testContextObject;
	public Properties prop;
	private static Logger logger=LogManager.getLogger(BulkSD.class);
	
	public BulkSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}
	
	
	
	@Given("Bulk User create via api")
	public void bulk_user_create_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Bulk User create via api");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			int idstart = Integer.parseInt(data.get("IdFrom"));
			int idend = Integer.parseInt(data.get("IdTo"));
			for (int j = idstart; j <= idend; j++) {
				logger.info("Id: Bulk"+j);
				List<String> apiParameter = new ArrayList<>();
				apiParameter.add("set");
				apiParameter.add("Id=Bulk"+j);
				apiParameter.add("name=Bulk"+j);
				testContextObject.pom.userConfigurationPO().userAPI(columnHeader, apiParameter, data);
				StringBuilder builder = new StringBuilder();
				for (String s : apiParameter) {
					builder.append(s + ";");
				}
				String userParameter = builder.toString();
				// logger.debug(userParameter);
				String userID = "Bulk"+j;
				String apiResponseValidation = "success: 0070200001 : saved successfully. User ID = " + userID;
				String res = testContextObject.baseTest.setAPI(userParameter, "sa", "admin", "user", 200);
				Assert.assertEquals(res, apiResponseValidation);
			}
		}
	}
	
	@Given("Bulk Set Password via API")
	public void bulk_set_password_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Bulk Set Password via API");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			int idstart = Integer.parseInt(data.get("IdFrom"));
			int idend = Integer.parseInt(data.get("IdTo"));
			for (int j = idstart; j <= idend; j++) {
				
				logger.info("Id: Bulk"+j);
				List<String> apiParameter = new ArrayList<>();
				apiParameter.add("set");
				apiParameter.add("Userid=Bulk"+j);
				testContextObject.pom.loginPO().setPasswordAPI(columnHeader, apiParameter, data);
				StringBuilder builder = new StringBuilder();
				for (String s : apiParameter) {
					builder.append(s + ";");
				}
				String userParameter = builder.toString();
				// logger.debug(userParameter);
				String userID = "Bulk"+j;

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
	}
	
	@Given("Bulk Event generate of users")
	public void bulk_event_generate_of_users(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Set event via Event Set API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			int idstart = Integer.parseInt(data.get("useridFrom"));
			int idend = Integer.parseInt(data.get("useridTo"));
			for (int j = idstart; j <= idend; j++) {
				String firstEvtDate =testContextObject.pom.abstractMethod().staticDateOrPlusMinusFromCurrentDate(data.get("FirstEvtDate")) ;
				String url1 = "set;Userid=Bulk"+j+";event-datetime="+firstEvtDate.replace("/", "")+data.get("FirstEvtTime")+";";
				String apiResponseValidation = "success: 0210200001 : successful";
				String res1 = testContextObject.baseTest.setAPI(url1, "sa", "admin", "events", 200);
				logger.info("res1= "+res1+" --- "+j);
				Assert.assertEquals(res1, apiResponseValidation);
				
				
				if (data.get("LastEvtDate") != null) {
					String lastEvtDate =testContextObject.pom.abstractMethod().staticDateOrPlusMinusFromCurrentDate(data.get("LastEvtDate")) ;
					String url2 = "set;Userid=Bulk"+j+";event-datetime="+lastEvtDate.replace("/", "")+data.get("LastEvtTime")+";";
					Assert.assertEquals(res1, apiResponseValidation);
					String res2 = testContextObject.baseTest.setAPI(url2, "sa", "admin", "events", 200);
					logger.info("res2= "+res2);
					Assert.assertEquals(res2, apiResponseValidation);
				}
			}
		}
	}
	
	@Given("Bulk Advance OT Application generate")
	public void bulk_advance_ot_application_generate(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Bulk Advance OT Application generate");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			int idstart = Integer.parseInt(data.get("useridFrom"));
			int idend = Integer.parseInt(data.get("useridTo"));
			for (int j = idstart; j <= idend; j++) {
				String oTdate =testContextObject.pom.abstractMethod().staticDateOrPlusMinusFromCurrentDate(data.get("OT-date")) ;
				String url1 = "set;userid=Bulk"+j+";OT-date="+oTdate.replace("/", "")+";ot-hours="+data.get("ot-hours")+";reason="+data.get("reason");
				String apiResponseValidation = "success: 1110200002 : saved successfully";
				String res1 = testContextObject.baseTest.setAPI(url1, "Bulk"+j, "admin", "overtime-application", 200);
				logger.info("res1= "+res1);
				Assert.assertEquals(res1, apiResponseValidation);
				
			}
		}
	}
	
	@Given("Bulk Leave Application generate")
	public void bulk_leave_application_generate(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Bulk Leave Application generate");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			int idstart = Integer.parseInt(data.get("useridFrom"));
			int idend = Integer.parseInt(data.get("useridTo"));
			for (int j = idstart; j <= idend; j++) {
				String sdate =testContextObject.pom.abstractMethod().staticDateOrPlusMinusFromCurrentDate(data.get("Start-date")) ;
				String edate =testContextObject.pom.abstractMethod().staticDateOrPlusMinusFromCurrentDate(data.get("end-date")) ;
				String url1 = "set;userid=Bulk"+j+";half-consideration="+data.get("half-consideration")+";Start-date="+sdate+";end-date="+edate+";leave-code="+data.get("leave-code");
				String res = testContextObject.baseTest.setAPI(url1, "Bulk"+j, "admin", "leave-application", 200);
				String val1 = "success: 0330200002 : saved successfully";
				String val2 = "success: 0330203002 : Leave Approval is pending";
				String val3 = "success: 0330203002 : Tour Approval is pending";
				String applicationVal = null;
				if (res.equalsIgnoreCase(val1) || res.equalsIgnoreCase(val2) || res.equalsIgnoreCase(val3)) {
					applicationVal = "Leave or Tour Applied";
				} else {
					applicationVal = res;
				}
				logger.info(res+" ---- "+j);
				Assert.assertEquals(applicationVal, "Leave or Tour Applied");
				
			}
		}
	}
	
	@Given("Bulk Timesheet correction Application generate")
	public void bulk_timesheet_correction_application_generate(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Bulk Timesheet correction Application generate");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			int idstart = Integer.parseInt(data.get("useridFrom"));
			int idend = Integer.parseInt(data.get("useridTo"));
			for (int j = idstart; j <= idend; j++) {
				// GET
//				String daterange = testContextObject.pom.abstractMethod()
//						.daterangeSelectedForAPI(data.get("attendance-date"), data.get("attendance-date"));
//				String url = "get;userid=Bulk" + j + ";date-range=" + daterange + ";format=json;";
//				String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "timesheet", 200);
//				String tid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,"timesheet.transaction-id");
				// SET
				String adate =testContextObject.pom.abstractMethod().staticDateOrPlusMinusFromCurrentDate(data.get("attendance-date")) ;
				String url1 = "set;userid=Bulk"+j+";transaction-id="+"1"+";attendance-date="+adate.replace("/", "")+";correction-type="+data.get("correction-type")+";job-code="+data.get("job-code")+";job-count="+data.get("job-count")+";reason="+data.get("reason");
				String res = testContextObject.baseTest.setAPI(url1, "Bulk"+j, "admin", "timesheet-correction-application", 200);
				logger.info(res+" --- "+j);
				Assert.assertEquals(res, "success: 0800200001 : successful");
			}
		}
	}
	
	@Given("Bulk field visit correction Application generate")
	public void bulk_field_visit_correction_application_generate(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Bulk field visit correction Application generate");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			int idstart = Integer.parseInt(data.get("useridFrom"));
			int idend = Integer.parseInt(data.get("useridTo"));
			for (int j = idstart; j <= idend; j++) {
				String adate =testContextObject.pom.abstractMethod().staticDateOrPlusMinusFromCurrentDate(data.get("attendance-date")) ;
				String url1 = "set;Userid=Bulk"+j+";attendance-date="+adate.replace("/", "")+";punch-time="+adate.replace("/", "")+data.get("punch-time")+";iotype="+data.get("iotype");
				String res = testContextObject.baseTest.setAPI(url1, "Bulk"+j, "admin", "field-visit-correction", 200);
				logger.info(res+" --- "+j);
				Assert.assertEquals(res, "success: 0710200002 : saved successfully");
			}
		}
	}
	
	@Given("Bulk Visitor Login authorization generate")
	public void bulk_visitor_login_authorization_generate(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Bulk Visitor Login authorization generate");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			int mobileFrom = Integer.parseInt(data.get("mobileFrom"));
			int mobileTo = Integer.parseInt(data.get("mobileTo"));
				testContextObject.pom.visitorPortalPO().bulkVisitorLoginWithSkipToLogin(mobileFrom, mobileTo);
			
		}
	}
	
//	@When("Bulk Assign Award Penalty Hours from RIC ESS login")
//	public void bulk_assign_award_penalty_hours_from_ric_ess_login(io.cucumber.datatable.DataTable dataTable)
//			throws InterruptedException {
//		logger.info("Bulk Assign Award Penalty Hours from RIC ESS login");
//		testContextObject.pom.essPO().goToAssignAwardPenaltyHours();
//		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
//			logger.info("Userid: "+data.get("Userid")+" Date: "+data.get("Date"));
//			int useridFrom = Integer.parseInt(data.get("UseridFrom"));
//			int useridTo = Integer.parseInt(data.get("useridTo"));
//			testContextObject.pom.assignAwardPenaltyHoursPO().bulkassignAwardPenaltyHours(data, useridFrom, useridTo);
//		}
//		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
//	}
	
	
}
