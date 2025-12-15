package stepDefinations;

import java.io.IOException;
import java.sql.Driver;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.record.PageBreakRecord.Break;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import CommonTestAbstract.TestContextObject;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class AdminPortalSD {
	TestContextObject testContextObject;
	private static Logger logger=LogManager.getLogger(AdminPortalSD.class);
	
	public AdminPortalSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}
	
	// Mayank
	@Given("Delete System Account user of Admin Portal")
	public void delete_system_account_user_of_admin_portal(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete System Account user of Admin Portal started");
		testContextObject.pom.adminPortalPO().goToAdminPortalSytstemAccountPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("SAUser: "+data.get("UserID"));
			testContextObject.pom.apSystemAccountsPO().deleteApSystemAccount(data);
		}
	}
	
	//Mayank
	@Given("Create System Account user of Admin Portal")
	public void create_system_account_user_of_admin_portal(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create System Account user of Admin Portal started");
		testContextObject.pom.adminPortalPO().goToAdminPortalSytstemAccountPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("SAUser: "+data.get("UserID"));
			testContextObject.pom.apSystemAccountsPO().createApSystemAccount(data);
		}
	}
	
	// Mayank
	@Given("Set Password Policy in system configuration page of Admin Portal")
	public void set_password_policy_in_system_configuration_page_of_admin_portal(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Set Password Policy in system configuration page of Admin Portal started");
		testContextObject.pom.adminPortalPO().goToAdminPortalPasswordPolicyPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.apPasswordPolicyPO().setPasswordPolicyParameters(data);
		}
	}
	
	// Mayank
	@Given("Set Email Configuration in Admin Portal")
	public void set_email_configuration_in_admin_portal() throws InterruptedException {
		logger.info("Set Email Configuration in Admin Portal started");
		testContextObject.pom.adminPortalPO().goToAdminPortalEmailConfigurationPage();
		testContextObject.pom.apEmailConfigurationPO().setEmailConfiguration();
	}
	
	// Mayank
	@Given("Reset Security Question Answer from Change Password page")
	public void reset_security_question_answer_from_change_password_page(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Reset Security Question Answer from Change Password page of Admin Portal started");
		testContextObject.pom.adminPortalPO().goToAdminPortalChangePasswordPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("SecurityQuestion"));
			testContextObject.pom.apChangePasswordPO().resetSecurityQA(data);
		}
	}
	
	// Mayank
	@Given("Set SMS Configuration in Admin Portal")
	public void set_sms_configuration_in_admin_portal() throws InterruptedException {
		logger.info("Set SMS Configuration in Admin Portal started");
		testContextObject.pom.adminPortalPO().goToAdminPortalSmsConfigurationPage();
		testContextObject.pom.apSmsConfigurationPO().setSmsConfiguration();
	}
	
}
