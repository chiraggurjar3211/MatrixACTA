package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class TimeZoneReportPO extends AbstractMethod {
	WebDriver driver;
	public TimeZoneReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public void timeZoneReport(String reportExportFormat) throws Exception {
		pageLoadWaitng();
		generateReportInSelectionFormat(reportExportFormat);
		driver.switchTo().defaultContent();
	}

}
