package stepDefinations;

import java.io.IOException;
import java.sql.Driver;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonTestAbstract.TestContextObject;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class DeviceWebpageSD {
	TestContextObject testContextObject;
	private static Logger logger=LogManager.getLogger(DeviceWebpageSD.class);
	
	public DeviceWebpageSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	
	//////////////// ***********************************************//////////////////
	///////////// Device side API Related CODE start Here/////////////////////////////
	//////////////// ***********************************************//////////////////
	@When("Execute {string} device side API.")
	public void execute_device_side_api(String string) throws Exception {
		logger.info("Execute device side API. Started");
		// Write code here that turns the phrase above into concrete actions
		testContextObject.baseTestDeviceAPI.deviceAPITest(string);

	}

	@Then("{string} executed device side api results should be {string}.")
	public void executed_device_side_api_results_should_be(String string, String string2) throws Exception {
		logger.info("executed device side api results Started");
		// Write code here that turns the phrase above into concrete actions
		String[][] data = testContextObject.baseTestDeviceAPI.excelData(string);
		for (int i = 1; i < data.length; i++) {
			String testResult = data[i][0];
			Assert.assertEquals(testResult, string2);
		}
	}

	//////////////// ***********************************************//////////////////
	/////////////  Device side API Related CODE start Here /////////////////////////////
	//////////////// ***********************************************//////////////////

}