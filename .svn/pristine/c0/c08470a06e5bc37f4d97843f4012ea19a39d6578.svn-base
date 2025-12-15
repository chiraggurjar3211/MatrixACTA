package stepDefinations;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonTestAbstract.TestContextObject;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class EnterpriseSD {
	TestContextObject testContextObject;
	private static Logger logger=LogManager.getLogger(EnterpriseSD.class);
	
	public EnterpriseSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@Given("Create Enterprise group from Enterprise module")
	public void create_enterprise_group_from_enterprise_module(DataTable dataTable) throws InterruptedException {
		testContextObject.pom.homePO().goTOEnterpriseModule();
		logger.info("Create Enterprise group Started");
		String actual = null;
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String group = data.get("Group");
			String name = data.get("Name");
			String code = data.get("Code"); // sending Code separately because Code textbox char limit is 6 digit and
											// Name Textbox char limit is more
			testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(group);
			actual = testContextObject.pom.enterprisePO().createGroup(group, name, code);
			Assert.assertEquals(actual, data.get("Validation"));
		}
		Thread.sleep(2000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Delete Enterprise group from Enterprise module")
	public void delete_enterprise_group_from_enterprise_module(DataTable dataTable) throws InterruptedException {
		logger.info("Delete Enterprise group Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String group = data.get("Group");
			String name = data.get("Name");
			String expectedValMsg = data.get("Validation");
			testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(group);
			Thread.sleep(500);
			testContextObject.pom.enterprisePO().deleteGroup(group, name, expectedValMsg);
			Thread.sleep(500);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Verify Page name in Enterprise Module")
	public void verify_page_name_in_enterprise_module(DataTable dataTable) throws InterruptedException {
		logger.info("Verify Page name in Enterprise Module Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("RenamedGroup: "+data.get("RenamedGroup"));
			String renamedGroup = data.get("RenamedGroup");
			testContextObject.pom.enterprisePO().verifyEnterpriseGroupName(renamedGroup);
		}
		Thread.sleep(2000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@When("Set value in Group Associations for {string} module in Enterprise module")
	public void set_value_in_group_associations_for_module_in_enterprise_module(String module,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Set value in Group Associations for "+module+" Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		testContextObject.pom.enterprisePO().goToGroupAssociationsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Group: "+data.get("Group"));
			testContextObject.pom.groupAssociationsPO().setValueInGroupAssociations(module, data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Then("Verify checkboxes enabled or disabled in Group Associations for {string} module in Enterprise module")
	public void verify_checkboxes_enabled_or_disabled_in_group_associations_for_module_in_enterprise_module(
			String module, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify checkboxes enabled or disabled in Group Associations for "+module+" Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		testContextObject.pom.enterprisePO().goToGroupAssociationsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Group: "+data.get("Group"));
			testContextObject.pom.groupAssociationsPO().verifyValueInGroupAssociations(module, data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@Then("Verify Group Associations reflection for {string} module in Enterprise Group")
	public void verify_group_associations_reflection_for_module_in_enterprise_group(String module,
			io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Group Associations reflection Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Group: "+data.get("Group"));
			String group = data.get("Group");
			testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(group);
			testContextObject.pom.enterprisePO().groupAssociationReflections(module, data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@When("Set Value of Associated Parameters in Enterprise module")
	public void set_value_of_associated_parameters_in_enterprise_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Set Value of Associated Parameters Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Group: "+data.get("Group"));
			String group = data.get("Group");
			testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(group);
			testContextObject.pom.enterprisePO().setValueOfAssociatedParameters(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Mayank
	@When("Assign user from Enterprise module")
	public void assign_user_from_enterprise_module(io.cucumber.datatable.DataTable dataTable)
			throws InterruptedException {
		logger.info("Assign user from Enterprise module Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Group: "+data.get("Group"));
			String group = data.get("Group");
			testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(group);
			testContextObject.pom.enterprisePO().assignUserFromGroupPages(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Chhaya
	@Then("Verify {string} from Enterprise Module")
	public void verify_from_enterprise_module(String group, DataTable dataTable) throws InterruptedException {
		logger.info("Verify "+group+" from Enterprise Module Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(group);
		Thread.sleep(2000);
		testContextObject.pom.enterprisePO().verifyGroupInEnterpriseModule(group, dataTable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	// Kamal
	@When("{string} enterprise module reports configuration")
	public void report_configuration(String string, DataTable datatable) throws Exception {
		logger.info(string+" enterprise module reports configuration Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		testContextObject.pom.enterpriseModuleReportPO().enterpriseModuleReport(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	
	//Chhaya
	@When("Assign jobs to {string} = {string} from Enterprise Structure Module")
	public void assign_jobs_to_from_enterprise_structure_module(String enterprizeGroup, String groupName, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Assign jobs to group Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(enterprizeGroup);
		testContextObject.pom.enterprisePO().assignJobToGroup(groupName, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Then("Verify Job Priority from Enterprise Structure for {string} = {string}")
	public void verify_job_priority_from_enterprise_structure_for(String enterprizeGroup, String groupName, DataTable dataTable) throws InterruptedException {
		logger.info("Verify Job Priority from Enterprise Structure Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(enterprizeGroup);
		testContextObject.pom.enterprisePO().verifyPrioritizedJob(groupName, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//Chhaya
	@When("Prioritize Job from Enterprise Structure for {string} = {string}")
	public void prioritize_job_from_enterprise_structure_for(String enterprizeGroup, String groupName, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Prioritize Job from Enterprise Structure Started");
		Thread.sleep(1500);
		testContextObject.pom.homePO().goTOEnterpriseModule();
		Thread.sleep(2000);
		testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(enterprizeGroup);
		testContextObject.pom.enterprisePO().prioritizeJob(groupName, dataTable);
		Thread.sleep(1500);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	//Chhaya
	@Given("Assign Access Profile to device from Enterprise group= {string} GroupName= {string}")
	public void assign_access_profile_to_device_from_enterprise_group_group_name(String enterprizeGroup, String groupName, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Assign Access Profile to device from Enterprise group Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(enterprizeGroup);
		testContextObject.pom.enterprisePO().assignAcsProfile(groupName, dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Assign Device Group to Enterprise Group from Association Mapping in Enterprise module")
	public void assign_device_group_to_enterprise_group_from_association_mapping_in_enterprise_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Assign Device Group to Enterprise Group from Association Mapping in Enterprise module Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("EnterpriseGroup: "+data.get("Group")+" and GroupName: "+data.get("Name"));
			String groupName = data.get("Group");
			testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(groupName);
			testContextObject.pom.enterprisePO().assignDeviceGroup(data);
			Thread.sleep(1000);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@When("Remove Job Scheduler from Enterprise Group")
	public void remove_job_scheduler_from_enterprise_group(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Job Scheduler from Enterprise Group Started");
		testContextObject.pom.homePO().goTOEnterpriseModule();
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Remove Job Scheduler from Enterprise Group");
			String groupName = data.get("Group");
			testContextObject.pom.enterprisePO().goToEnterpriseGroupPage(groupName);
			testContextObject.pom.enterprisePO().removeJobScheduler(data);
			Thread.sleep(1000);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}


}
