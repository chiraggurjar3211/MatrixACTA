package PageObject.ShiftAndSchedule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class ScheduleGroupsReportPO extends AbstractMethod {
	WebDriver driver;
	
	public ScheduleGroupsReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public void scheduleGroupsReport(String reportExportFormat) throws Exception {
		pageLoadWaitng();
		generateReportInSelectionFormat(reportExportFormat);
		driver.switchTo().defaultContent();
	}

}
