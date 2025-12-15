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

public class CafeteriaManagementSD {
	TestContextObject testContextObject;
	public Properties prop;
	private static Logger logger=LogManager.getLogger(CafeteriaManagementSD.class);
	
	public CafeteriaManagementSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}
	
	@Given("Verify User Transaction Summary {string} in Cafeteria Module")
	public void verify_user_transaction_summary_in_cafeteria_module(String transactionType, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify User Transaction Summary Started");
		//for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			//logger.info("OpeningBalance: "+data.get("OpeningBalance"));
			testContextObject.pom.homePO().goToCafeteriamodule();
			testContextObject.pom.cafeteriaManagementPO().goToTransactionSummary();
			testContextObject.pom.transactionSummaryPO().transactionSummaryMainMethod(transactionType, dataTable);
			testContextObject.pom.systemAccountPO().homeButtonClick();
		//}
	}
	
	//Kamal
	@When("{string} Cafeteria Management module reports configuration")
	public void report_configuration(String string, DataTable datatable) throws Exception {
		logger.info("Cafeteria Management module reports configuration Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementModuleReportPO().cafeteriaManagementModuleReport(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Create Maximum Items in cafeteria module")
	public void create_maximum_items_in_cafeteria_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Create Maximum Items in cafeteria module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoItemsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.itemsPO().createMaxItems(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Create Maximum Menus in cafeteria module")
	public void create_maximum_menus_in_cafeteria_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException, IOException {
		logger.info("Create Maximum Menus in cafeteria module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoMenusPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.menusPO().createMaxMenus(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	// Mayank
	
	@Given("Delete Menu from CMM module")
	public void delete_menu_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Menu from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoMenusPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("Name"));
			String q1 = "delete from Mx_CntnMenuDeviceConfig where MenuCode in (select MenuCode from Mx_CNTNMenuMst where MenuName='"+data.get("Name")+"')";
			testContextObject.baseTest.updateORDeleteDatabase(q1);
			String q2 = "delete from Mx_CntnMenuSchedule where MenuCode in (select MenuCode from Mx_CNTNMenuMst where MenuName='"+data.get("Name")+"')";
			testContextObject.baseTest.updateORDeleteDatabase(q2);
			testContextObject.pom.menusPO().deleteMenus(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Create Menu from CMM module")
	public void create_menu_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Menu from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoMenusPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("Name"));
			testContextObject.pom.menusPO().createMenus(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Delete Item from CMM module")
	public void delete_item_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Item from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoItemsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("Name"));
			testContextObject.pom.itemsPO().deleteItems(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Create Item from CMM module")
	public void create_item_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Item from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoItemsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("Name"));
			testContextObject.pom.itemsPO().createItems(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("POS Devices Configuration from CMM module for Device {string} and Menu names {string}")
	public void pos_devices_configuration_from_cmm_module_for_device_and_menu_names(String deviceName, String menuNames, io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("POS Devices Configuration from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoPosDevicesConfigurationPage();
		testContextObject.pom.posDevicesConfigurationPO().posDevicesConfiguration(deviceName, menuNames, dataTable);
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Cafeteria Recharge of user from CMM module")
	public void cafeteria_recharge_of_user_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Cafeteria Recharge of user from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoRechargePage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("UserId"));
			testContextObject.pom.rechargePO().rechargeReset(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Cafeteria Payment of user from CMM module")
	public void cafeteria_payment_of_user_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Cafeteria Payment of user from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoPaymentPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("UserId"));
			testContextObject.pom.paymentPO().payment(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Set value in Cafeteria Settings in CMM module")
	public void set_value_in_cafeteria_settings_in_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Set value in Cafeteria Settings in CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoCafeteriaSettingsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.cafeteriaSettingsPO().CafeteriaSetting(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Create Cafeteria Usage Policy from CMM module")
	public void create_cafeteria_usage_policy_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Cafeteria Usage Policy from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoCafeUsagePolicyPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("Name"));
			testContextObject.pom.cafeteriaUsagePolicyPO().createCafeUsagePolicy(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Manual Correction from CMM module")
	public void manual_correction_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Manual Correction from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().goToManualCorrectionPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("UserId")+" & "+data.get("TrnDate")+" & "+data.get("TrnTime"));
			testContextObject.pom.manualCorrectionPO().manualCorrection(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Correction Approval from CMM module")
	public void correction_approval_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Correction Approval from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().goToCorrectionApprovalPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("UserId")+" & "+data.get("TrnDate"));
			testContextObject.pom.correctionApprovalPO().correctionApproval(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Verify Transaction Correction Application status in Manual Correction from CMM module")
	public void verify_transaction_correction_application_status_in_manual_correction_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Transaction Correction Application status in Manual Correction from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().goToManualCorrectionPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("UserId")+" & "+data.get("TrnDateTime"));
			testContextObject.pom.manualCorrectionPO().VerifyApplicationStatus(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Cafeteria Manual Adjustment of user from CMM module")
	public void cafeteria_manual_adjustment_of_user_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Cafeteria Manual Adjustment of user from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoManualAdjustmentPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("UserId"));
			testContextObject.pom.manualAdjustmentPO().manualAdjustmentOfUser(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Verify Pre-ordered Meals from CMM module")
	public void verify_pre_ordered_meals_from_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify Pre-ordered Meals from CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().goToPreOrderedMealsPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("UserId")+" & "+data.get("Date"));
			testContextObject.pom.preorderedMealsPO().verifyPreOrderedMeals(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Then("Verify blocked user in CMM module")
	public void verify_blocked_user_in_cmm_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Verify blocked user in CMM module Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoBlockedUserPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("Userid"));
			testContextObject.pom.blockedUserPO().verifyBlockedUser(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Delete Cafeteria Usage Policy")
	public void delete_cafeteria_usage_policy(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Cafeteria Usage Policy Started");
		testContextObject.pom.homePO().goToCafeteriamodule();
		testContextObject.pom.cafeteriaManagementPO().gotoCafeUsagePolicyPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("Name"));
			testContextObject.pom.cafeteriaUsagePolicyPO().deleteCafeUsagePlc(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	

	
	
}
