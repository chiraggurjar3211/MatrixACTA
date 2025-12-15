package CommonTestAbstract;

import java.io.IOException;

import org.openqa.selenium.WebDriver;

import PageObject.PageObjectModel;
import PageObject.Panel200.PanelPageObject;



public class TestContextObject {
	public WebDriver driver;
	public PageObjectModel pom;
	public BaseTest baseTest;
	public BaseTestWebAPI baseTestWebAPI;
	public BaseTestDeviceAPI baseTestDeviceAPI; 
	public BaseTestReport baseTestReport;
	public PanelPageObject panel;
	public TestContextObject() throws IOException {
		baseTest=new BaseTest();
		pom=new PageObjectModel(baseTest.intializeBrowser());
		panel=new PanelPageObject(baseTest.intializeBrowser());
		baseTestWebAPI=new BaseTestWebAPI();
		baseTestDeviceAPI=new BaseTestDeviceAPI();
		baseTestReport=new BaseTestReport();
	}

}
