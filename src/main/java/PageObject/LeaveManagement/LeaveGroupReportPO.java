package PageObject.LeaveManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class LeaveGroupReportPO extends AbstractMethod {
	WebDriver driver;
	
	public LeaveGroupReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public void leaveGroupReport(String reportExportFormat) throws Exception {
		pageLoadWaitng();
		generateReportInSelectionFormat(reportExportFormat);
		driver.switchTo().defaultContent();
	}

}
