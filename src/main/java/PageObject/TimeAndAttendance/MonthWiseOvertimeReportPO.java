package PageObject.TimeAndAttendance;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class MonthWiseOvertimeReportPO extends AbstractMethod {
	WebDriver driver;
	
	public MonthWiseOvertimeReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cntFromMonth")
	private WebElement forMonth;

	@FindBy(id = "cntFromYear")
	private WebElement forYear;

	@FindBy(id = "grpddl")
	private WebElement selectUsers;

	@FindBy(id = "cntToMonth")
	private WebElement toMonth;

	@FindBy(id = "cntToYear")
	private WebElement toYear;
	
	public void monthWiseOvertimeReport(String formonth, String foryear, String tomonth, String toyear,String selectuser, String reportExportFormat) throws Exception {
		pageLoadWaitng();
        element_DropDownSelectByvisibleText(forMonth, formonth);
        element_DropDownSelectByvisibleText(forYear, foryear);
        Thread.sleep(1000);
        element_DropDownSelectByvisibleText(toMonth, tomonth);
        element_DropDownSelectByvisibleText(toYear, toyear);
        Thread.sleep(1000);
        element_DropDownSelectByvisibleText(selectUsers, selectuser);
        Thread.sleep(1000);
        generateReportToAllModule(reportExportFormat);
	}

}
