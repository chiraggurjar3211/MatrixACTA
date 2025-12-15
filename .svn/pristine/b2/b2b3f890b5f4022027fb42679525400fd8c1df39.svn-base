package PageObject.ShiftAndSchedule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class ShiftScheduleReportPO extends AbstractMethod {
	
	WebDriver driver;
	
	public ShiftScheduleReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cntFromMonth")
	private WebElement month;
	
	@FindBy(id = "cntFromYear")
	private WebElement year;
	
	@FindBy(id = "grpddl")
	private WebElement selectUsers;
	
	@FindBy(xpath = "//*[@default='Generate Report']")
	private WebElement generateReport;
	
	public void shiftScheduleReport(String month1 , String year1  ,  String selectDD , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(month, month1);
		element_DropDownSelectByvisibleText(year, year1);
	    Thread.sleep(1000);
	    element_DropDownSelectByvisibleText(selectUsers, selectDD);
	    Thread.sleep(1000);
	    generateReportToAllModule(reportExportFormat);
	}

}
