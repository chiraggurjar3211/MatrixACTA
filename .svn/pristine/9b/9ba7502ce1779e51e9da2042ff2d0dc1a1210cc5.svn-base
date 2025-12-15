package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class FunctionalGroupReportPO extends AbstractMethod {
	WebDriver driver;
	
	public FunctionalGroupReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public void functionalGroupReport(String reportExportFormat) throws Exception {
		pageLoadWaitng();
		generateReportInSelectionFormat(reportExportFormat);
		driver.switchTo().defaultContent();
	}

}
