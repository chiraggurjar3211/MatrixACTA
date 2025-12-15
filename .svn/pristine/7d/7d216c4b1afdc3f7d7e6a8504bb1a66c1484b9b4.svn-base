package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import com.aventstack.extentreports.reporter.configuration.Theme;

import CommonAbstract.AbstractMethod;

public class AccessRouteWiseWhoIsInReportPO extends AbstractMethod {
	WebDriver driver;
	
	public AccessRouteWiseWhoIsInReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cboACSSel")
	private WebElement selectAccessRouteReport;
	
	public void accessRouteWiseWhoIsInReport(String selectaccessRouteReport ,  String reprtExportFormat ) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectAccessRouteReport, selectaccessRouteReport);
		Thread.sleep(1000);
		generateReportToAllModule(reprtExportFormat);
	}

}
