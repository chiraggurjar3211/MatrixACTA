package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class SmartAccessRouteWiseWhoIsInReportPO extends AbstractMethod {
	WebDriver driver;
	
	public SmartAccessRouteWiseWhoIsInReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	@FindBy(id = "grpddl")
	private WebElement selectSmartAccessRouteReport;
	
	public void smartAccessRouteWiseWhoIsInReport(String selectsmartAccessRouteReport , String  reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectSmartAccessRouteReport, selectsmartAccessRouteReport);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
