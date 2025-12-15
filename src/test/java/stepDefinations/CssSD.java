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

public class CssSD {
	TestContextObject testContextObject;
	private static Logger logger=LogManager.getLogger(CssSD.class);
	
	public CssSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}
	
	// Mayank
	@Given("Create Worker from worker profile in CSS login")
	public void create_worker_from_worker_profile_in_css_login(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Worker from worker profile in CSS login Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		Thread.sleep(2000);
		testContextObject.pom.cssPO().goToCSSworkerProfile();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("WorkerName: "+data.get("WorkerName")+" WorkOrderID: "+data.get("WorkOrderID"));
		testContextObject.pom.cssWorkerProfilePO().createWorkerProfile(columnHeader, data);
		}
		testContextObject.pom.cssPO().clickOnWorkerTab();
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}
	
	// Mayank
	@Then("Verify Worker Id from Worker Profile page in CSS login")
	public void verify_worker_id_from_worker_profile_page_in_css_login(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Worker Id from Worker Profile page in CSS login Started");
		testContextObject.pom.cssPO().goToCSSworkerProfile();
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) 
		{
			logger.info("Name: "+data.get("name")+" WorkerId: "+data.get("WorkerId"));
			String name = data.get("name");
			String actualWorkerid = testContextObject.pom.cssWorkerProfilePO().verifyWorkerID(name);
			logger.debug(actualWorkerid);
			Assert.assertEquals(actualWorkerid, data.get("WorkerId"));
		}
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}
	
	// Mayank
	@Then("Verify Worker Assignment Status in CSS login")
	public void verify_worker_assignment_status_in_css_login(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Worker Assignment Status in CSS login Started");
		testContextObject.pom.cssPO().goToCSSworkerProfile();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) 
		{
			logger.info("WorkerName: "+data.get("WorkerName"));
			testContextObject.pom.cssWorkerProfilePO().verifyWorkerAssignmentStatus(data);
		}
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}
	
	// Mayank
	@Then("Worker Assignment in WorkOrder {string} in CSS login")
	public void worker_assignment_in_work_order_in_css_login(String workorderID, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Worker Assignment in WorkOrder in CSS login Started");
		testContextObject.pom.cssPO().goToCSSworkerAssignment();
		List<Map<String, String>> data=dataTable.asMaps(String.class,String.class);
			String actual = testContextObject.pom.cssWorkerAssignmentPO().workerAssignmentFromCSS(workorderID, data);
			Assert.assertEquals(actual, "Saved Successfully");
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}
	
	// Mayank
	@Then("Verify Unregistered Workers from Worker Assignment page in CSS login")
	public void verify_unregistered_workers_from_worker_assignment_page_in_css_login(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Unregistered Workers in CSS login Started");
		testContextObject.pom.cssPO().goToCSSworkerAssignment();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) 
		{
			logger.info("WorkOrderID: "+data.get("WorkOrderID"));
			testContextObject.pom.cssWorkerAssignmentPO().verifyUnregisteredWorkers(data);
		}
		testContextObject.pom.jobProcessingCostingPO().essDashboardButtonClick();
	}

	
	
}
