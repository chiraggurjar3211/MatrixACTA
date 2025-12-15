package stepDefinations;

import static org.testng.Assert.assertEquals;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.Put;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonTestAbstract.TestContextObject;
import groovyjarjarantlr4.v4.parse.ANTLRParser.element_return;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class VisitorManagementSD {
	TestContextObject testContextObject;
	private static Logger logger = LogManager.getLogger(VisitorManagementSD.class);

	public VisitorManagementSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	// Mayank
	@Given("Delete visitor via API")
	public void delete_visitor_via_api(io.cucumber.datatable.DataTable dataTable) {
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		logger.info("Delete Visitor Started");
		// System.out.println(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("mobilenumber"));
			String res = null;
			// GET API fire for get Visitor ID from application
			String mobilenumber = data.get("mobilenumber");
			String url = "get;visitor-filter=1;search-criteria=2;format=json;search-string=" + mobilenumber;
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "visitor", 200);
			if (getres.equalsIgnoreCase("success: 0950100000 : No records found")) {
				res = "No Visitor Found";
			} else {
				System.out.println("visitor found");
				String visitorid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,
						"visitor.visitor-id");
				// Mx_DVSTRTrn delete
				String query3 = "Delete from Mx_DVSTRTrn where VID in (select VID from  Mx_VSTRPassTrn  where Vmobile='"+ mobilenumber + "')";
				int deleteRecordNulber3 = testContextObject.baseTest.updateORDeleteDatabase(query3);
				// Mx_VMSVisitLogs Delete
				String query5 = "Delete from Mx_VMSVisitLogs where registerid in (select registerid from Mx_ADVVSTRTrn where VSTRMobile='" + mobilenumber + "')";
				int deleteRecordNulber5 = testContextObject.baseTest.updateORDeleteDatabase(query5);
				// Visitor Pass Transaction Delete
				String query = "Delete from Mx_VSTRPassTrn where Vmobile='" + mobilenumber + "'";
				int deleteRecordNulber = testContextObject.baseTest.updateORDeleteDatabase(query);
				// Visitor Login Auth Transaction Delete
				String query1 = "Delete from Mx_VisitorLoginAuthTrn where Mobile='" + mobilenumber + "'";
				int deleteRecordNulber1 = testContextObject.baseTest.updateORDeleteDatabase(query1);
				// Visitor event Transaction Delete
				String query2 = "Delete from Mx_VSTREventTrn where PERSMobile='" + mobilenumber + "'";
				int deleteRecordNulber2 = testContextObject.baseTest.updateORDeleteDatabase(query2);
				// Visitor Mx_ADVVSTRTrn Transaction Delete
				String query4 = "Delete from Mx_ADVVSTRTrn where VSTRMobile='" + mobilenumber + "'";
				int deleteRecordNulber4 = testContextObject.baseTest.updateORDeleteDatabase(query4);

				
				// DELETE API
				List<String> apiParameter = new ArrayList<>();
				apiParameter.add("delete");
				String valmsg;
				testContextObject.pom.deleteFrequentVisitorsPO().deletevisitorAPI(columnHeader, apiParameter, data,
						visitorid);
				StringBuilder builder = new StringBuilder();
				for (String s : apiParameter) {
					builder.append(s + ";");
				}
				String userParameter = builder.toString();
				res = testContextObject.baseTest.setAPI(userParameter, "SA", "admin", "visitor", 200);
//				// Delete Visitor Pass
//				String url1 = "get;user-type=0;user-filter=0;user-id="+hostID+";status=0;FORMAT=JSON";
//				String getres1 = testContextObject.baseTest.getAPI(url1, "SA", "admin", "visitor-pre-registration", 200);
//				String appointmentNo = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres1, "visitor.visitor-id");
				
			}
			String exRes1 = "No Visitor Found";
			String exRes2 = "success: 0950403008 : deleted successfully";
			String result = null;
			if (res.equalsIgnoreCase(exRes1) || res.equalsIgnoreCase(exRes2)) {
				result = "Pass";
				logger.debug("Visitor Delete successfully Or Visitor Not Found");
			} else {
				result = "Failed";
				logger.debug(res);
			}
			Assert.assertEquals("Pass", result);
					}

	}

	// Mayank
	@When("Invite Visitor via API")
	public void invite_visitor_via_api(io.cucumber.datatable.DataTable dataTable) {
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		logger.info("Invite Visitor Via API Started");
		// System.out.println(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("Visitor-mobile-no"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.inviteVisitorPO().inviteVisitorAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String appliedBy = data.get("appliedBy");
			String res = testContextObject.baseTest.setAPI(userParameter, appliedBy, "admin", "invite-visitor", 200);
			String result = null;
			if (res.contains("success: 1090200002 : saved successfully")) {
				result = "Pass";
			} else {
				result = "Failed";
				logger.debug(res);
			}
			Assert.assertEquals("Pass", result);
		}
	}

	// Mayank
	@Given("Visitor Preregistration via API")
	public void visitor_preregistration_via_api(io.cucumber.datatable.DataTable dataTable) {
		List<String> columnHeader = new ArrayList<>();
		logger.info("Visitor Preregistration via API Started");
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// System.out.println(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("mobile-no"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			// V20R8.1 - Station Linking
			String stationIdQuery = "select STLID from Mx_VSTRSTLocationMst where UPPER(Name)=UPPER('"
					+ data.get("visit-station-name") + "')";
			String stationId = testContextObject.baseTest.getDataFDatabase(stationIdQuery);
			testContextObject.pom.visitorPreRegistrationPO().visitorPreRegistrationAPI(columnHeader, apiParameter, data,
					stationId);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String appliedBy = data.get("appliedBy");
			String res = testContextObject.baseTest.setAPI(userParameter, appliedBy, "admin",
					"visitor-pre-registration", 200);
			Assert.assertEquals(res, "success: 0860200002 : saved successfully");
		}
	}

	// Mayank
	@Given("Visit State Change via API")
	public void visit_state_change_via_api(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Visit State Change via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// System.out.println(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host Id = " + data.get("HostID"));
			// GET API fire for get Appointment Number from application
			String sdate = testContextObject.pom.abstractMethod().dateSelectedinddMMyyyy(data.get("StartDate"));
			String edate = testContextObject.pom.abstractMethod().dateSelectedinddMMyyyy(data.get("EndDate"));
			String hostID = data.get("HostID");
			String url = "get;user-type=0;date-range=" + sdate + "-" + edate + ";user-filter=0;user-id=" + hostID
					+ ";status=0;FORMAT=JSON";
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "visitor-pre-registration", 200);
			String appointmentid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,
					"visitor-pre-registration.appointment-no");

			// Set state change
			List<String> apiParameter = new ArrayList<>();
			String userParameter = "Set;user-type=" + data.get("user-type") + ";appointment-no=" + appointmentid
					+ ";state-change=" + data.get("state-change");
			String appliedBy = data.get("appliedBy");
			String res = testContextObject.baseTest.setAPI(userParameter, appliedBy, "admin", "visit-state", 200);
			String result = null;
			if (res.contains("success: 0980201001 : saved successfully")) {
				result = "Pass";
			} else {
				result = "Failed";
				logger.debug(res);
			}
			Assert.assertEquals(result, "Pass");
			Thread.sleep(2000);
		}
	}

	// Mayank
	@Given("create visitor profile via API")
	public void create_visitor_profile_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("create visitor profile via API started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// System.out.println(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor Profile Id = " + data.get("id"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.visitorProfilePO().visitorProfileAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String res = testContextObject.baseTest.setAPI(userParameter, "SA", "admin", "visitor-profile", 200);
			String result = null;
			if (res.contains("success: 1080200001 : saved successfully.")) {
				result = "Pass";
			} else {
				result = "Failed";
				logger.debug(res);
			}
			Assert.assertEquals(result, "Pass");
		}
	}

	// Mayank
	@When("Add Visitor in Watchlist or Blacklist from Visitor module")
	public void add_visitor_in_watchlist_or_blacklist_from_visitor_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Add Visitor in Watchlist or Blacklist from Visitor module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToFrequentVisitorsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("VisitorMobileNo"));
			String actual = testContextObject.pom.frequentVisitorsPO()
					.addToWatchlistBlacklist(data.get("VisitorMobileNo"), data.get("AddIn"));
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// Mayank
	@When("Visitor Invites Approval API")
	public void visitor_invites_approval_api(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Visitor Invites Approval API started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// System.out.println(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host Id = " + data.get("HostID"));
			// GET API fire for get Appointment Number from application
			String sdate = testContextObject.pom.abstractMethod().dateSelectedinddMMyyyy(data.get("StartDate"));
			String edate = testContextObject.pom.abstractMethod().dateSelectedinddMMyyyy(data.get("EndDate"));
			String hostID = data.get("HostID");
			String url = "get;user-type=0;date-range=" + sdate + "-" + edate + ";user-filter=0;user-id=" + hostID
					+ ";status=0;FORMAT=JSON";
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "visitor-pre-registration", 200);
			String appointmentid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,
					"visitor-pre-registration.appointment-no");

			// SET API
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.visitApprovalPO().visitApprovalAPI(columnHeader, apiParameter, data, appointmentid);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String approvedBy = data.get("approvedBy");
			String res = testContextObject.baseTest.setAPI(userParameter, approvedBy, "admin",
					"visitor-invites-approval", 200);
			Assert.assertEquals(res, "success: 0960200002 : Saved Successfully");
			Thread.sleep(2000);
		}
	}

	// Mayank
	@Given("Create station location from visitor module")
	public void create_station_location_from_visitor_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create station location from visitor module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToStationLocationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Station locatin name = " + data.get("Name"));
			String actual = testContextObject.pom.stationLocationPO().createStationLocation(data);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// Mayank
	@When("Visitor PreRegistration Approval API")
	public void visitor_pre_registration_approval_api(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Visitor PreRegistration Approval API started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// System.out.println(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host Id = " + data.get("HostID"));
			// GET API fire for get Appointment Number from application
			String sdate = testContextObject.pom.abstractMethod().dateSelectedinddMMyyyy(data.get("StartDate"));
			String edate = testContextObject.pom.abstractMethod().dateSelectedinddMMyyyy(data.get("EndDate"));
			String hostID = data.get("HostID");
			String url = "get;user-type=0;date-range=" + sdate + "-" + edate + ";user-filter=0;user-id=" + hostID
					+ ";status=0;FORMAT=JSON";
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "visitor-pre-registration", 200);
			String appointmentid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,
					"visitor-pre-registration.appointment-no");

			// SET API
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.visitRegistrationApprovalPO().visitRegistrationApprovalAPI(columnHeader, apiParameter,
					data, appointmentid);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String userParameter = builder.toString();
			String approvedBy = data.get("approvedBy");
			String res = testContextObject.baseTest.setAPI(userParameter, approvedBy, "admin",
					"visitor-pre-registration-approval", 200);
			Assert.assertEquals(res, "success: 0890200002 : Saved Successfully");
			Thread.sleep(2000);
		}
	}

	@Given("Verify visit state via Visitor Preregistration API")
	public void verify_visit_state_via_visitor_preregistration_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Verify visit state via Visitor Preregistration API started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// System.out.println(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host Id = " + data.get("HostID"));
			// GET API fire for get Appointment Number from application
			String sdate = testContextObject.pom.abstractMethod().dateSelectedinddMMyyyy(data.get("StartDate"));
			String edate = testContextObject.pom.abstractMethod().dateSelectedinddMMyyyy(data.get("EndDate"));
			String hostID = data.get("HostID");
			String url = "get;user-type=0;date-range=" + sdate + "-" + edate + ";user-filter=0;user-id=" + hostID
					+ ";status=0;FORMAT=JSON";
			String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "visitor-pre-registration", 200);
			String visitStateWithDate = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,
					"visitor-pre-registration.visit-state");
			String[] visitStateWithDate1 = visitStateWithDate.split("_");
			String visitState = visitStateWithDate1[0];
			Map<String, String> state = new HashMap();
			state.put("0", "Check-IN");
			state.put("1", "Start");
			state.put("2", "Paused");
			state.put("3", "Resume");
			state.put("4", "Stop");
			state.put("5", "Check-OUT");
			String actualState = state.get(visitState);
			Assert.assertEquals(actualState, data.get("ExpectedVisitState"));
		}
	}

	@Given("Send link from Invite Visitor page")
	public void send_link_from_invite_visitor_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Send link from Invite Visitor page started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToInviteVisitorsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("VMobile"));
			String actual = testContextObject.pom.inviteVisitorPO().sendInviteVisitorLink(data);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Copy Link from Invite Visitor page")
	public void copy_link_from_invite_visitor_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Copy Link from Invite Visitor page started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToInviteVisitorsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor Name = " + data.get("VName"));
			String actual = testContextObject.pom.inviteVisitorPO().copyInviteVisitorLink(data);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Copy invite visitor link and Open link in new tab")
	public void copy_invite_visitor_link_and_open_link_in_new_tab(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Copy invite visitor link and Open link in new tab started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToInviteVisitorsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor Name = " + data.get("VName"));
			testContextObject.pom.inviteVisitorPO().copyLinkGetLinkAndOpenInNewTab(data);
		}
	}

	@Given("verify invite visitor link status from invite visitor page")
	public void verify_invite_visitor_link_status_from_invite_visitor_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("verify invite visitor link status from invite visitor page started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToInviteVisitorsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor Name = " + data.get("VName"));
			String actual = testContextObject.pom.inviteVisitorPO().inviteVisitorLinkStatus(data);
			Assert.assertEquals(actual, data.get("Status"));
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Delete invite visitor")
	public void delete_invite_visitor(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete invite visitor started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToInviteVisitorsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor Name = " + data.get("VName"));
			testContextObject.pom.inviteVisitorPO().deleteInviteVisitorLink(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Visitor Preregistration from VMS module")
	public void visitor_preregistration_from_vms_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Visitor Preregistration from VMS module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNO = " + data.get("VMobile"));
			String actual = testContextObject.pom.visitorPreRegistrationPO().visitorPreregistartion(data);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Approval of Security from Security Approval page in VMS module")
	public void approval_of_security_from_security_approval_page_in_vms_module(
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Approval of Security from Security Approval page in VMS module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToSecurityApprovalPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host Id = " + data.get("HostID"));
			String actual = testContextObject.pom.securityApprovalPO().securityApprovalFromVMS(data);
			Assert.assertEquals(actual, "Saved Successfully");
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Set parameters of Visit Request Handling")
	public void set_parameters_of_visit_request_handling(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Set parameters of Visit Request Handling started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitRequestHandlingPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Hopst Id = " + data.get("HostId"));
			String actual = testContextObject.pom.visitRequestHandlingPO().visitRequestHandling(data);
			Assert.assertEquals(actual, "Saved Successfully");
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Set parameters of Visit Request Handling Unavailability Days for HostId {string}")
	public void set_parameters_of_visit_request_handling_unavailability_days_for_host_id(String hostID,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Set parameters of Visit Request Handling Unavailability Days started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitRequestHandlingPage();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		String actual = testContextObject.pom.visitRequestHandlingPO().unavailabilityDays(hostID, data);
		Assert.assertEquals(actual, "Saved Successfully");

		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Verify visitor in frequent visitor page")
	public void verify_visitor_in_frequent_visitor_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify visitor in frequent visitor page started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToFrequentVisitorsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("VMobile"));
			String actual = testContextObject.pom.frequentVisitorsPO().verifyFrequentVisitor(data);
			Assert.assertEquals(actual, "Visitor Found");
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Verify visit in Visitor Preregistration page")
	public void verify_visit_in_visitor_preregistration_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify visit in Visitor Preregistration page started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor Name = " + data.get("VisitorName"));
			String actual = testContextObject.pom.visitorPreRegistrationPO().verifyVisit(data);
			Assert.assertEquals(actual, "Visit Found");
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Create {string} from Visit Components")
	public void create_from_visit_components(String component, io.cucumber.datatable.DataTable table)
			throws InterruptedException {
		logger.info("Create " + component + " from Visit Components started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitComponentsPage();
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("Name = " + data.get("Name"));
			testContextObject.pom.visitComponentsPO().createVisitComponentsMainMethod(component, data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@Given("Delete {string} from Visit Components")
	public void delete_from_visit_components(String component, io.cucumber.datatable.DataTable table)
			throws InterruptedException {
		logger.info("Delete " + component + " from Visit Components started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitComponentsPage();
		for (Map<String, String> data : table.asMaps(String.class, String.class)) {
			logger.info("Name = " + data.get("Name"));
			testContextObject.pom.visitComponentsPO().deleteVisitComponentsMainMethod(component, data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@Given("Verify {string} in Visit template")
	public void verify_in_visit_template(String component, io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify " + component + " in Visit template started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitTemplatePage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name = " + data.get("Name"));
			testContextObject.pom.visitTemplatePO().verifyVisitComponentsMainMethod(component, data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}

	@Given("Visitor Login Authorization from VMS module")
	public void visitor_login_authorization_from_vms_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Visitor Login Authorization from VMS module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorLoginAuthorizationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("VMobile"));
			String actual = testContextObject.pom.visitorLoginAuthorizationPO().visitorLoginAuthorizationFromVMS(data);
			Assert.assertEquals(actual, "Saved Successfully");
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Create Visitor Template {string}")
	public void create_visitor_template(String templateName, io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create Visitor Template started, Name = " + templateName);
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorTemplatePage();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.visitorTemplatePO().createVisitorTemplate(templateName, data);
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}

	@Given("Create Visit Template {string}")
	public void create_visit_template(String templateName, io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create Visit Template started, Name = " + templateName);
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitTemplatePage();
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		testContextObject.pom.visitTemplatePO().createVisitTemplate(templateName, data);
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}

	// Kamal
	@When("{string} Visitor Management module reports configuration")
	public void report_configuration(String string, DataTable datatable) throws Exception {
		logger.info(string + " Visitor Management module reports configuration started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementModuleReportPO().visitorManagementModuleReport(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Verify Visitor events from VMS module")
	public void verify_visitor_events_from_vms_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify Visitor events from VMS module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorEventsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("VMobile"));
			testContextObject.pom.visitorEventsPO().verifyEventsCount(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Restore Visitor from Watchlist or Blacklist")
	public void restore_visitor_from_watchlist_or_blacklist(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Restore Visitor from Watchlist or Blacklist started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToWatchlistBlacklistPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("VMobile"));
			testContextObject.pom.watchlistBlacklistPO().restorVisitorFromWatchlistBlacklist(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Verify Visitor history from VMS module")
	public void verify_visitor_history_from_vms_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify Visitor history from VMS module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorHistoryPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("VMobile"));
			testContextObject.pom.visitorHistoryPO().verifyVisitorHistory(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Verify host users from VMS module")
	public void verify_host_users_from_vms_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify host users from VMS module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToAuthorizedHostUsersPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host Id = " + data.get("userid"));
			testContextObject.pom.authorizedHostUsersPO().verifyHostUsers(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Add users in Authorized Host Users from VMS module")
	public void add_users_in_authorized_host_users_from_vms_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Add users in Authorized Host Users from VMS module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToAuthorizedHostUsersPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("User Ids = " + data.get("UserIDs"));
			testContextObject.pom.authorizedHostUsersPO().addUserAsAuthorizedHostUser(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Create visitor from Frequent visitor page")
	public void create_visitor_from_frequent_visitor_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create visitor from Frequent visitor page started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToFrequentVisitorsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("VMobile"));
			testContextObject.pom.frequentVisitorsPO().createFrequentVisitor(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Delete visitor from Delete Frequent Visitors page")
	public void delete_visitor_from_delete_frequent_visitors_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Delete visitor from Delete Frequent Visitors page started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToDeleteFrequentVisitorsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("VMobile"));
			testContextObject.pom.deleteFrequentVisitorsPO().deleteFrequentVisitors(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Verify visit status from visitor preregistration page")
	public void verify_visit_status_from_visitor_preregistration_page(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Verify visit status from visitor preregistration page started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor MobileNo = " + data.get("VMobile"));
			testContextObject.pom.visitorPreRegistrationPO().verifyVisitStatus(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("verify Form summary from VMS module")
	public void verify_form_summary_from_vms_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("verify Form summary from VMS module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToFormSummaryPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Station location = " + data.get("StationLocation"));
			testContextObject.pom.formSummaryPO().verifyFormSummary(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Delete Station Location from VMS module")
	public void delete_station_location_from_vms_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Delete Station Location from VMS module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToStationLocationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Station location name = " + data.get("Name"));
			testContextObject.pom.stationLocationPO().deleteStationLocation(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Delete Visitor Template")
	public void delete_visitor_template(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Visitor Template started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorTemplatePage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor Template = " + data.get("Name"));
			testContextObject.pom.visitorTemplatePO().deleteVisitorTemplate(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Delete Visit Template")
	public void delete_visit_template(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Visit Template started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitTemplatePage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visit Template = " + data.get("Name"));
			testContextObject.pom.visitTemplatePO().deleteVisitTemplate(data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Assign groups to Visitor profile from VMS module")
	public void assign_groups_to_visitor_profile_from_vms_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Assign groups to Visitor profile from VMS module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorProfilePage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor profile id = " + data.get("ProfileID"));
			String validationMsg = testContextObject.pom.visitorProfilePO().groupAssignToVisitorProfile(data);
			Assert.assertEquals(validationMsg, data.get("Validation"));
		}
		testContextObject.pom.reportingGroupPO().homeButtonClick();
	}

	@Given("Create Visitor Profile from VMS module")
	public void create_visitor_profile_from_vms_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Create Visitor Profile from VMS module started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// System.out.println(columnHeader);
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorProfilePage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor profile id = " + data.get("ID"));
			testContextObject.pom.visitorProfilePO().createVisitorProfile(columnHeader, data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Delete Visitor Pre-Registration from SA")
	public void delete_visitor_pre_registration_from_sa(io.cucumber.datatable.DataTable dataTable) throws Exception {
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.visitorPreRegistrationPO().deleteVisitorPreRegistration(data.get("visitor"));
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	// Chhaya
	@Given("Delete visitor profile via API")
	public void delete_visitor_profile_via_api(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete visitor profile via API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("id: " + data.get("id"));
			String url = "delete;id=" + data.get("id") + ";";
			String username = "sa";
			String password = "admin";
			String apiName = "visitor-profile";
			// Second one is for if user is not exist in server
			String exResponse1 = "success: 1080400003 : deleted successfully";
			String exResponse2 = "failed: 1080402003 : Insufficient User rights or Inactive User(s) or ID(s) does not exist.";
			String res = testContextObject.baseTest.setAPI(url, username, password, apiName, 200);
			boolean val = false;
			if (res.equals(exResponse1) || res.equals(exResponse2)) {
				val = true;
			} else {
				val = false;
				logger.debug(res);
			}
			Thread.sleep(1000);
			Assert.assertEquals(val, true);
		}
	}

	@When("Verify Device Configuration from Visitor Profile page for VisitorProfileId= {string}")
	public void verify_device_configuration_from_visitor_profile_page_for_visitor_profile_id(String vpId,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Device Configuration from Visitor Profile page started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitorProfilePage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor profile id = " + data.get("ID"));
			testContextObject.pom.visitorProfilePO().verifyDeviceConfigurations(vpId, data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Set default Visitor Pre-Registration Template")
	public void set_default_visitor_pre_registration_template() throws InterruptedException {
		logger.info("Verify Device Configuration from Visitor Profile page started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToPreRegistrationTemplatePage();
		testContextObject.pom.preRegistrationTemplatePO().updateDefaultPreRegistrationTemplate();
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}
	
	@When("Approval of RIC from Visit Registration Approval page in VMS module")
	public void approval_of_ric_from_visit_registration_approval_page_in_vms_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Approval of RIC from Visit Registration Approval page in VMS module started");
		testContextObject.pom.homePO().goToVisitormodule();
		testContextObject.pom.visitorManagementPO().goToVisitRegistrationApprovalPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host = " + data.get("HostID"));
			String actual = testContextObject.pom.visitRegistrationApprovalPO().visitRegistrationApproval(data);
			Assert.assertEquals(actual, "Saved Successfully");
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

}
