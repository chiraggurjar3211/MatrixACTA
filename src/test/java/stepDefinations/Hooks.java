package stepDefinations;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;

import CommonAbstract.AbstractMethod;
import CommonTestAbstract.TestContextObject;
import io.cucumber.java.After;
import io.cucumber.java.AfterStep;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;

public class Hooks {
	TestContextObject testContextObject;
	private static Logger logger = LogManager.getLogger(Hooks.class);

	public Hooks(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@Before
	public void beforeStartScenario(Scenario scenario) {
		logger.info("Test Scenario Start Tag Number:" + scenario.getSourceTagNames());

	}

	@After
	public void tearDown(Scenario scenario) throws IOException {
		testContextObject.baseTest.intializeBrowser().quit();
		if (scenario.isFailed() == false) {
			logger.info("**********Scenario run successfully without any error.**********");
		}
	}

	@AfterStep
	public void ADDScreenShot(Scenario scenario) throws IOException {
		WebDriver driver = testContextObject.baseTest.intializeBrowser();
		// validate if scenario has failed
		if (scenario.isFailed()) {
			logger.info("Test scenario Failed!!!! And Tag number :" + scenario.getSourceTagNames()
					+ " Or Line Number : " + scenario.getLine());
			File src = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
			byte[] fileContent = FileUtils.readFileToByteArray(src);
			scenario.attach(fileContent, "image/png", "image");

		}
	}

}
