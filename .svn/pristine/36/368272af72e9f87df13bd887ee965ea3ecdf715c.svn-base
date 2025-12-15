package TestRunner;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.DataProvider;

import CommonTestAbstract.BaseTest;
import io.cucumber.java.Scenario;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(features = "@target/failed_scenario.txt",glue = "stepDefinations",
plugin = {"pretty","com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:",
		"pretty","json:ExtentReports/cucumber-reports.json",
		"pretty","html:ExtentReports/cucumber-reports.html",
		"timeline:test-output-thread/",
		"rerun:target/failed_scenario1.txt"
		}
		)
public class FailTestRunner extends AbstractTestNGCucumberTests{
	@Override
	@DataProvider(parallel =false)
	public Object[][] scenarios() {
		return super.scenarios();
	}
	@AfterSuite
	public static void before_or_after_all() throws InterruptedException {
//		BaseTest.sentMail(BaseTest.prop.getProperty("toMail"));
	}
	
}
