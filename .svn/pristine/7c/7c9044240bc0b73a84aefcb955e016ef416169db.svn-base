package TestRunner;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.DataProvider;

import CommonTestAbstract.BaseTest;
import io.cucumber.java.Scenario;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(features = "src/test/java/features",glue = "stepDefinations",
plugin = {"pretty","com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:",
		"pretty","json:ExtentReports/cucumber-reports.json",
		"pretty","html:ExtentReports/cucumber-reports.html",
		"timeline:test-output-thread/",
		"rerun:target/failed_scenario.txt"}
		)
public class TestRunnerNG extends AbstractTestNGCucumberTests{
	@Override
	@DataProvider(parallel =false)
	public Object[][] scenarios() {
		return super.scenarios();
	}
	
	@AfterSuite
	public void before_or_after_all() throws InterruptedException {
		System.gc();
		BaseTest.mailSent();
	}
	
}
