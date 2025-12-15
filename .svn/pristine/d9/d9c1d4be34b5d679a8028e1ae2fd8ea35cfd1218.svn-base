package stepDefinations;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonTestAbstract.TestContextObject;
import groovyjarjarantlr4.v4.parse.ANTLRParser.element_return;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class VisitorPortalSD {
	TestContextObject testContextObject;
	private static Logger logger=LogManager.getLogger(VisitorPortalSD.class);
	public VisitorPortalSD(TestContextObject testContextObject) {
		this.testContextObject=testContextObject;
	}
	
	// Mayank
	@Given("Login with Visitor in Visitor Portal")
	public void login_with_visitor_in_visitor_portal(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Login with Visitor in Visitor Portal started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor Mobile Or Email = "+data.get("MobileEmail"));
			String title = testContextObject.pom.visitorPortalPO().loginWithVisitorWithSendOTP(data.get("MobileEmail"));
			Assert.assertEquals(title, data.get("Validation"));
		}
	}
	
	@When("Create Visit from visitor portal")
	public void create_visit_from_visitor_portal(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Visit from visitor portal started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host id = "+data.get("HostId")+", Visit date = "+data.get("VisitDate"));
			String val = testContextObject.pom.visitorPortalPO().createVisit(data);
			Assert.assertEquals(val, data.get("validation"));
		}
	}
	
	@Given("Enter visitor details in visitor portal")
	public void enter_visitor_details_in_visitor_portal(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Enter visitor details in visitor portal profile page started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor Name = "+data.get("Name"));
			String val = testContextObject.pom.visitorPortalPO().createProfile(data);
			Assert.assertEquals(val, data.get("validation"));
		}
	}
	
	@Given("SKIP TO LOGIN with Visitor in Visitor Portal")
	public void skip_to_login_with_visitor_in_visitor_portal(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("SKIP TO LOGIN with Visitor in Visitor Portal started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Visitor Mobile Or email = "+data.get("MobileEmail"));
			String val = testContextObject.pom.visitorPortalPO().loginWithVisitorWithSkipToLogin(data.get("MobileEmail"));
			Assert.assertEquals(val, data.get("Validation"));
		}
	}
	
	@When("CheckIn Visit from visitor portal and submit form")
	public void check_in_visit_from_visitor_portal_and_submit_form(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("CheckIn Visit from visitor portal and submit form started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host id = "+data.get("HostID"));
			String val = testContextObject.pom.visitorPortalPO().checkInVisitAndSubmitForm(data);
			Assert.assertEquals(val, data.get("validation"));
		}
	}
	
	
	@Given("Verify visit status in visitor portal")
	public void verify_visit_status_in_visitor_portal(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify visit status in visitor portal started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host Id = "+data.get("HostId"));
			testContextObject.pom.visitorPortalPO().verifyVisitStatus(data);
		}
	}
	
	@Given("{string} Visit from visitor portal")
	public void visit_from_visitor_portal(String state, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info(state+" Visit from visitor portal started");
	    switch (state) {
		case "CheckIn":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				testContextObject.pom.visitorPortalPO().checkInVisit(data);
			}
			break;
			
		case "CheckOut":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				testContextObject.pom.visitorPortalPO().checkOutVisit(data);
			}
			break;

		default:
			break;
		}
	}
	
	@Given("verify hostuser of created visit")
	public void verify_hostuser_of_created_visit(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("verify hostuser of created visit started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host Id = "+data.get("HostId"));
			testContextObject.pom.visitorPortalPO().verifyVisitHost(data);
		}
	}
	
	@Given("Verify Visitor profile fields")
	public void verify_visitor_profile_fields(io.cucumber.datatable.DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Verify Visitor profile fields started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Field Name = "+data.get("FieldName"));
			testContextObject.pom.visitorPortalPO().verifyVisitorProfileFields(data);
		}
	}
	
	@Given("Verify Visit fields")
	public void verify_visit_fields(io.cucumber.datatable.DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Verify Visit fields started");
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
			testContextObject.pom.visitorPortalPO().verifyVisitFields(data);
	}
	
	@Given("Exit from Visitor login")
	public void exit_from_visitor_login() throws InterruptedException {
		logger.info("Exit from Visitor login started");
		testContextObject.pom.visitorPortalPO().exitFromVisitorLogin();
	}
	
	@Given("Approval of Visitor from visitor portal")
	public void approval_of_visitor_from_visitor_portal(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Approval of Visitor from visitor portal started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host id = "+data.get("HostID"));
			testContextObject.pom.visitorPortalPO().visitorAcceptance(data);
		}
	}
	
	@Given("CheckOut Visit from visitor portal and submit form")
	public void check_out_visit_from_visitor_portal_and_submit_form(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("CheckOut Visit from visitor portal and submit form started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Host id = "+data.get("HostID"));
			String val = testContextObject.pom.visitorPortalPO().checkOutVisitAndSubmitForm(data);
			Assert.assertEquals(val, data.get("validation"));
		}
	}
	
	@Given("Refresh visit page of visitor portal")
	public void refresh_visit_page_of_visitor_portal() throws InterruptedException {
		logger.info("Refresh visit page of visitor portal started");
		testContextObject.pom.visitorPortalPO().refreshVisitList();
	}
	
	@Given("Submit visitor form")
	public void submit_visitor_form(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Submit visitor form started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String val = testContextObject.pom.visitorPortalPO().SubmitFormAtLogin(data);
			Assert.assertEquals(val, data.get("validation"));
		}
	}
	
	@Given("verify visitor login successfully or not")
	public void verify_visitor_login_successfully_or_not(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("verify visitor login successfully or not started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.visitorPortalPO().verifyLoginSuccessfullyOrNot(data);
		}
	}
	
	@Given("verify visit CheckIn successfully or not")
	public void verify_visit_check_in_successfully_or_not(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("verify visit CheckIn successfully or not started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.visitorPortalPO().verifyCheckInSuccessfullyOrNot(data);
		}
	}
	
	@Given("verify visit CheckOut successfully or not")
	public void verify_visit_check_out_successfully_or_not(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("verify visit CheckOut successfully or not started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.visitorPortalPO().verifyCheckOutSuccessfullyOrNot(data);
		}
	}


	
}
