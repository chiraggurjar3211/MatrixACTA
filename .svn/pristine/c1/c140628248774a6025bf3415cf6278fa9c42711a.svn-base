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

public class ContractorWorkerManagementSD {
	TestContextObject testContextObject;
	String product=null;
	String taskSchedulerName=null;
	private static Logger logger=LogManager.getLogger(ContractorWorkerManagementSD.class);
	
	public ContractorWorkerManagementSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}
	
	// Mayank
	@Given("Delete Contractor via API")
	public void delete_contractor_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Delete Contractor via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		//logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Id: "+data.get("id"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("delete");
				testContextObject.pom.contractorProfilePO().contractorDeleteAPI(columnHeader, apiParameter, data);
				StringBuilder builder = new StringBuilder();
				for (String s : apiParameter) {
					builder.append(s + ";");
				}
				String userParameter=builder.toString();
				String res = testContextObject.baseTest.setAPI(userParameter, "SA", "admin", "contractor", 200);
				String exRes1="success: 1050400003 : Deleted Successsfully";
				String exRes2="failed: 1050400000 : Entered Contractor-id does not exist";
				String result = null;
				if (res.equalsIgnoreCase(exRes1) || res.equalsIgnoreCase(exRes2)) {
					result = "Pass";
					logger.info("Contractor deleted successfully or not exist");
				}
				else {
					result = "Failed";
					logger.info(res);
				}
				Assert.assertEquals(result,"Pass");
		}
	}
	
	// Mayank
	@When("Create Contractor from CWM module")
	public void create_contractor_from_cwm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Contractor from CWM module Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToContractorProfile();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Id: "+data.get("Id"));
		testContextObject.pom.contractorProfilePO().createContractor(columnHeader, data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}
	
	// Mayank
		@Given("Delete WorkOrder via API")
		public void delete_work_order_via_api(io.cucumber.datatable.DataTable dataTable) throws Exception {
			logger.info("Delete WorkOrder via API Started");
			List<String> columnHeader = new ArrayList<>();
			for (int i = 0; i < dataTable.width(); i++) {
				columnHeader.add(dataTable.cell(0, i));
			}
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("id: "+data.get("id"));
				//***********************Worker delete code************
				// Reason: we need to delete workers which are assigned to that workOrder after that we can delete WorkOrder
				// GET API fire for get Contractor
				String contractorID = data.get("contractorID");
				String url = "get;id="+contractorID;
				String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "contractor", 200);
				// if Contractor exist then CSS login and delete worker and then delete workorder
				// if Contractor doesn't exist then workorder also doesn't exist
				if (!getres.equalsIgnoreCase("success: 1050100000 : No Data Found")) {
					// Firstly reject worker induction application if pending because pending worker deletion is not allowed from CSS as well as CWM
					Thread.sleep(1000);
					if (testContextObject.pom.contractorWorkerManagementPO().getTitle().contains("Welcome")) {
						testContextObject.pom.contractorWorkerManagementPO().logOut();
						Thread.sleep(1000);
					}
					testContextObject.pom.loginPO().credential("SA", "admin");
					
					String pendingWorkersOfInductionlevelQuery = "select WorkerName from Mx_CWMCSSWorkerMst where UPPER(CWMStatus)=2 and UPPER(CWMWOID)=UPPER('"+data.get("id")+"')";
					ArrayList<String> allPendingWorkers = testContextObject.baseTest.getAllDataFDatabase(pendingWorkersOfInductionlevelQuery);
					if (allPendingWorkers.size()>0) {
						testContextObject.pom.homePO().goToCWMmodule();
						testContextObject.pom.contractorWorkerManagementPO().goToInductionApprovals();
						testContextObject.pom.abstractMethod().pageLoadWaitng();
						for (String pendingWorker : allPendingWorkers) {
							testContextObject.pom.inductionApprovalPO().inductionApprovalsFromCWM(data.get("id"), pendingWorker, "Reject");
						}
					}
					testContextObject.pom.contractorWorkerManagementPO().logOut();
					Thread.sleep(1000);
					
					// Workers get from Usermst table and delete from SA login
					String workerGetFromUsermstQuery = "Select Name from Mx_UserMst where UPPER(CWMFlg)=1 and UPPER(CWMWOID)=UPPER('"+data.get("id")+"')";
					ArrayList<String> allWorkers = testContextObject.baseTest.getAllDataFDatabase(workerGetFromUsermstQuery);
					logger.debug(allWorkers);
						for (String worker : allWorkers) {
							String workerIdGetFromUsermst = "Select UserID from Mx_UserMst where UPPER(Name)=UPPER('"+worker+"')";
							String workerIDFromDB = testContextObject.baseTest.getDataFDatabase(workerIdGetFromUsermst);
							String apiParameter = "delete;id='"+workerIDFromDB+"'";
							String res = testContextObject.baseTest.setAPI(apiParameter, "SA", "admin", "worker", 200);
							Thread.sleep(1000);
						}
						
					//Workers which are rejected in induction level then they only displayed in CSS login so get from CWMCSSWorker table and delete from CSS login
					String workerGetFromCWMCSSWorkerMstQuery = "select WorkerName from Mx_CWMCSSWorkerMst where UPPER(CWMWOID)=UPPER('"+ data.get("id") + "')";
					ArrayList<String> workersFromCWMCSS = testContextObject.baseTest.getAllDataFDatabase(workerGetFromCWMCSSWorkerMstQuery);
					logger.debug(workersFromCWMCSS);
						for (String worker1 : workersFromCWMCSS) {
							String loginres = testContextObject.pom.loginPO().credential(contractorID, "admin");
							if (loginres.equalsIgnoreCase("Set Password")) {
								String setpwd = testContextObject.pom.loginPO().setPassword("admin", "admin");
								Assert.assertEquals(setpwd, "LOGIN");
								testContextObject.pom.loginPO().credential(contractorID, "admin");
							}
							testContextObject.pom.cssPO().goToCSSworkerProfile();
							testContextObject.pom.cssWorkerProfilePO().deleteWorkerProfile(worker1);
							testContextObject.pom.contractorWorkerManagementPO().essDashboardButtonClick();
							testContextObject.pom.contractorWorkerManagementPO().logOut();
							Thread.sleep(1000);
						}
					
					
					//***********************Worker delete code end************
					// Delete WorkOrder via API
					List<String> apiParameter = new ArrayList<>();
					apiParameter.add("delete");
					testContextObject.pom.workOrderPO().workOrderDeleteAPI(columnHeader, apiParameter, data);
					StringBuilder builder = new StringBuilder();
					for (String s : apiParameter) {
						builder.append(s + ";");
					}
					String userParameter=builder.toString();
					String res = testContextObject.baseTest.setAPI(userParameter, "SA", "admin", "work-order", 200);
					String exRes1="success: 1070400003 : Deleted Successfully";
					String exRes2="failed: 1070400000 : Entered work-order-id does not exist";
					String result = null;
					if (res.equalsIgnoreCase(exRes1) || res.equalsIgnoreCase(exRes2)) {
						result = "Pass";
						logger.debug("WorkOrder deleted successfully or not exist");
					}
					else {
						result = "Failed";
						logger.debug(res);
					}
					Assert.assertEquals("Pass", result);
					//testContextObject.pom.contractorWorkerManagementPO().logOut();
					Thread.sleep(1000);
					testContextObject.pom.loginPO().credential("sa", "admin");
				}
			}
		}
	
	// Mayank
	@Given("Create WorkOrder from CWM module")
	public void create_work_order_from_cwm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create WorkOrder from CWM module Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToWorkOrders();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Id: "+data.get("Id"));
		testContextObject.pom.workOrderPO().createWorkOrder(columnHeader, data);
		}
		testContextObject.pom.contractorWorkerManagementPO().homeButtonClick();
	}
	
	// Mayank
	@Given("Delete Worker from CWM module")
	public void delete_worker_from_cwm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Worker from CWM module Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("WorkerName: "+data.get("WorkerName"));
			testContextObject.pom.homePO().goToCWMmodule();
			testContextObject.pom.contractorWorkerManagementPO().goToWorkerList();
			testContextObject.pom.workerProfilePO().deleteWorker(data.get("WorkerName"));
			testContextObject.pom.contractorWorkerManagementPO().homeButtonClick();
		}	
	}
	
	// Mayank
	@Given("Delete Approval Stages from CWM module")
	public void delete_approval_stages_from_cwm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Approval Stages from CWM module Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToApprovalStages();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ApprovalStagesName: "+data.get("ApprovalStagesName"));
			testContextObject.pom.approvalStagesPO().deleteApprovalStages(data.get("ApprovalStagesName"));
		}
		testContextObject.pom.contractorWorkerManagementPO().homeButtonClick();
	}
	
	// Mayank
	@Given("Create Induction Level from CWM module")
	public void create_induction_level_from_cwm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Induction Level from CWM module Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToInductionLevels();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String val=testContextObject.pom.inductionLevelsPO().createInductionLevels(data.get("Name"), data.get("Description"));
			Assert.assertEquals(val, data.get("Validation"));	
		}
		testContextObject.pom.contractorWorkerManagementPO().homeButtonClick();
	}
	
	// Mayank
	@Given("Create Approval Stage {string} from CWM module")
	public void create_approval_stage_from_cwm_module(String name, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Approval Stage from CWM module Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToApprovalStages();
		List<Map<String, String>> data=dataTable.asMaps(String.class,String.class);
		testContextObject.pom.approvalStagesPO().createApprovalStage(name , data);
		testContextObject.pom.contractorWorkerManagementPO().homeButtonClick();
	}
	
	// Mayank
	@Given("Approve Reject Induction Approval from CWM module")
	public void approve_reject_induction_approval_from_cwm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Approve Reject Induction Approval from CWM module Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToInductionApprovals();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("WorkOrderID: "+data.get("WorkOrderID"));
			String workOrderID = data.get("WorkOrderID");
			String workerName = data.get("WorkerName");
			String approval = data.get("Approval");
			testContextObject.pom.inductionApprovalPO().inductionApprovalsFromCWM(workOrderID, workerName, approval);	
		}
		testContextObject.pom.contractorWorkerManagementPO().homeButtonClick();
	}
	
	// Mayank
	@Then("WorkerID field Editable or not in Worker Profile page while add Worker")
	public void worker_id_field_editable_or_not_in_worker_profile_page_while_add_worker(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("WorkerID field Editable or not in Worker Profile page while add Worker Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToWorkerProfile();
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) 
		{
			logger.info("Editable: "+data.get("Editable"));
			Boolean editable = Boolean.parseBoolean(data.get("Editable"));
			Boolean actualEditable = testContextObject.pom.workerProfilePO().verifyWorkerIDfieldWhileAddUser();
			Assert.assertEquals(actualEditable, editable);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}
	
	// Mayank
	@Given("Create Worker from CWM module")
	public void create_worker_from_cwm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Worker from CWM module Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToWorkerProfile();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("WorkerId: "+data.get("WorkerId"));
			testContextObject.pom.workerProfilePO().createWorker(columnHeader, data);
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();	
	}
	
	// Mayank
	@Then("Verify Worker Id from Worker Profile page")
	public void verify_worker_id_from_worker_profile_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Worker Id from Worker Profile page Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToWorkerProfile();
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) 
		{
			logger.info("Name: "+data.get("name"));
			String name = data.get("name");
			String actualWorkerid = testContextObject.pom.workerProfilePO().verifyWorkerID(name);
			logger.debug(actualWorkerid);
			Assert.assertEquals(actualWorkerid, data.get("WorkerId"));
		}
		testContextObject.pom.userConfigurationPO().homeButtonClick();	
	}
	
	// Mayank
	@Then("Verify custom field of {string} in Contractor Profile Page")
	public void verify_custom_field_of_in_contractor_profile_page(String contractorID, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify custom field in Contractor Profile Page Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToContractorProfile();
		List<Map<String, String>> data=dataTable.asMaps(String.class,String.class);
		testContextObject.pom.contractorProfilePO().customFieldsVerification(contractorID, data);
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}
	
	// Mayank
	@Given("Upload Contractor custom field documents from Contractor Profile Page")
	public void upload_contractor_custom_field_documents_from_contractor_profile_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Upload Contractor custom field documents from Contractor Profile Page Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToContractorProfile();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) 
		{
			logger.info("Id: "+data.get("Id"));
		String val = testContextObject.pom.contractorProfilePO().uploadDocumentsInCustomFields(data);
		Assert.assertEquals(val, data.get("Validation"));
		}
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}
	
	// Mayank
	@Given("Update Contractor custom fields from Contractor Profile")
	public void update_contractor_custom_fields_from_contractor_profile(io.cucumber.datatable.DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Update Contractor custom fields from Contractor Profile Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToContractorProfile();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) 
		{
			logger.info("Id: "+data.get("Id"));
		String val = testContextObject.pom.contractorProfilePO().updateContractorCustomFields(data);
		Assert.assertEquals(val, data.get("Validation"));
		}
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}
	
	//Chhaya
	@Then("Verify Contractor from Contractor Profile page")
	public void verify_contractor_from_contractor_profile_page(DataTable dataTable) throws InterruptedException {
		logger.info("Verify Contractor from Contractor Profile page Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToContractorProfile();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) 
		{
			logger.info("ID: "+data.get("ID"));
			testContextObject.pom.contractorProfilePO().verifyContractorName(data);;
		}
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}

	//Chhaya
	@Then("Verify Work Order from Work Order page")
	public void verify_work_order_from_work_order_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Work Order from Work Order page Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToWorkOrders();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) 
		{
			logger.info("ID: "+data.get("ID"));
			testContextObject.pom.workOrderPO().verifyWorkOrderName(data);
		}
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}
	
	//Kamal
	@When("{string} CWM module reports configuration")
	public void report_configuration(String string, DataTable datatable) throws Exception {
		logger.info("CWM module reports configuration Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.cvmModuleReportPO().cvmModuleReport(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	// Mayank
	@Given("Set Skill-Wise Worker Limit for WorkOrder {string}")
	public void set_skill_wise_worker_limit_for_work_order(String workorderID, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Set Skill-Wise Worker Limit for WorkOrder Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToWorkOrders();
		List<Map<String, String>> data=dataTable.asMaps(String.class,String.class);
			String actual = testContextObject.pom.workOrderPO().skillWiseWorkerLimitSet(workorderID, data);
			Assert.assertEquals(actual, "Saved Successfully");
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}
	
	// Mayank
	@Given("Create Skill from CWM module")
	public void create_skill_from_cwm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Skill from CWM module Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().gotoSkillPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) 
		{
			logger.info("Name: "+data.get("Name"));
			testContextObject.pom.skillPO().createSkill(data);
		}
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}
	
	// Mayank
	@Then("Worker Assignment in WorkOrder {string} from CWM module")
	public void worker_assignment_in_work_order_from_cwm_module(String workorderID, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Worker Assignment in WorkOrder  from CWM module Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().gotoWorkerAssignmentPage();
		List<Map<String, String>> data=dataTable.asMaps(String.class,String.class);
			String actual = testContextObject.pom.workerAssignmentPO().workerAssignmentFromCWM(workorderID, data);
			Assert.assertEquals(actual, "Saved Successfully");
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}
	
	// Mayank
	@Given("Verify Unregistered Workers from Worker Assignment page in CWM module")
	public void verify_unregistered_workers_from_worker_assignment_page_in_cwm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Unregistered Workers from Worker Assignment page in CWM module Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().gotoWorkerAssignmentPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) 
		{
			logger.info("WorkOrderID: "+data.get("WorkOrderID"));
			testContextObject.pom.workerAssignmentPO().verifyUnregisteredWorkers(data);
		}
		testContextObject.pom.shiftSchedulePO().homeButtonClick();
	}
	
	// Mayank
	@Then("Verify Worker in Worker profile Page")
	public void verify_worker_in_worker_profile_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Worker in Worker profile Page Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("WorkerName: "+data.get("WorkerName"));
			testContextObject.pom.homePO().goToCWMmodule();
			testContextObject.pom.contractorWorkerManagementPO().goToWorkerList();
			testContextObject.pom.workerProfilePO().verifyWorkerFromWorkerProfile(columnHeader, data);
			testContextObject.pom.userConfigurationPO().homeButtonClick();
		}
	}
	
	// Mayank
	@When("Add to blacklist {string} from Blacklist page")
	public void add_to_blacklist_from_blacklist_page(String blacklistType, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Add to blacklist "+blacklistType+" from Blacklist page Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().gotoBlacklistPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			testContextObject.pom.cwmBlacklistPO().blacklistFromBlacklistPageinCWM(blacklistType, data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	// Mayank
	@Then("Verify blacklisted {string} in Blacklist page")
	public void verify_blacklisted_in_blacklist_page(String blacklistType, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify blacklisted "+blacklistType+" in Blacklist page Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().gotoBlacklistPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			testContextObject.pom.cwmBlacklistPO().verifyBlacklistedinCWM(blacklistType, data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@When("Restore from blacklist {string} from Blacklist page")
	public void restore_from_blacklist_from_blacklist_page(String blacklistType, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Restore from blacklist "+blacklistType+" from Blacklist page Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().gotoBlacklistPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			testContextObject.pom.cwmBlacklistPO().restoreFromBlacklistedinCWM(blacklistType, data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Then("Verify Restored {string} from Blacklist page")
	public void verify_restored_from_blacklist_page(String blacklistType, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Restored "+blacklistType+" from Blacklist Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().gotoBlacklistPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			testContextObject.pom.cwmBlacklistPO().verifyRestoredFromBlacklistedinCWM(blacklistType, data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@When("Add to blacklist Worker from Worker profile page")
	public void add_to_blacklist_worker_from_worker_profile_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Add to blacklist Worker from Worker profile page Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToWorkerList();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			testContextObject.pom.workerProfilePO().addToBlacklistWorker(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	
	@When("Restore Worker from Worker profile Page")
	public void restore_worker_from_worker_profile_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Restore Worker from Worker profile Page Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToWorkerList();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			testContextObject.pom.workerProfilePO().restoredFromBlacklistWorker(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@When("Manage Workers from CWM module")
	public void manage_workers_from_cwm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Manage Workers from CWM module Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToManageWorkersPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("OldContractorID: "+data.get("OldContractorID")+" OldWorkOrderID: "+data.get("OldWorkOrderID"));
			testContextObject.pom.manageWorkersPO().manageWorkers(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Then("Verify Work Order Progress from CWM module")
	public void verify_work_order_progress_from_cwm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Work Order Progress from CWM module Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToWorkOrderProgressPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Contractor: "+data.get("Contractor")+" WorkOrder: "+data.get("WorkOrder"));
			testContextObject.pom.workOrderProgressPO().verifyWorkOrderProgress(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	//Chhaya	
	@Given("Create Worker via api")
	public void create_worker_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Create Worker via api Started");
		List<String> columnHeader = new ArrayList<>();
		for(int i=0; i<dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Id: "+data.get("Id"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.workerProfilePO().workerAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for(String s : apiParameter) {
				builder.append(s+";");
			}
			String workerParameter = builder.toString();
			String workerId = data.get("Id");
			String expectedAPIResponse = "success: 1060200001 : saved successfully. Worker ID = "+ workerId;
			String actualRes = testContextObject.baseTest.setAPI(workerParameter, "sa", "admin", "worker", 200); 
			Assert.assertEquals(actualRes, expectedAPIResponse);
		}
	}
	
	//Chhaya
	@Given("Verify Job Scheduler from Worker Profile for WorkerId= {string}")
	public void verify_job_scheduler_from_worker_profile_for_worker_id(String workerId, DataTable dataTable) throws Exception {
		logger.info("Verify Job Scheduler from Worker Profile Started");
		testContextObject.pom.homePO().goToCWMmodule();
		testContextObject.pom.contractorWorkerManagementPO().goToWorkerProfile();
		testContextObject.pom.workerProfilePO().verifyJobScheduler(workerId, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Delete Worker via API")
	public void delete_worker_via_api(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Worker via API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("WorkerID: "+data.get("WorkerID"));
			String url = "delete;id=" + data.get("WorkerID") + ";";
			String username = "sa";
			String password = "admin";
			String apiName = "worker";
			// Second one is for if worker is not exist in server
			String exResponse1 = "success: 1060400003 : Deleted Successsfully";
			String exResponse2 = "failed: 1060402003 : Insufficient User rights or Inactive User(s) or ID(s) does not exist.";
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
	
}
