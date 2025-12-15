package PageObject.ShiftAndSchedule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class HolidayScheduleReportPO  extends AbstractMethod{
	WebDriver driver;
	
	public HolidayScheduleReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "grpddl")
	private WebElement selectSchedules;
	
	@FindBy(xpath = "//*[@default='Generate Report']")
	private WebElement generateReport;
	
	public void holidayScheduleReport(String selectDD , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectSchedules, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
		
	}

}
