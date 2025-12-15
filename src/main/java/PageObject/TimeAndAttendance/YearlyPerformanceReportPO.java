package PageObject.TimeAndAttendance;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class YearlyPerformanceReportPO extends AbstractMethod {
	WebDriver driver;

	public YearlyPerformanceReportPO(WebDriver driver) {
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

	@FindBy(id = "cboRptTemplate")
	private WebElement format;
	
	@FindBy(xpath = "//*[@default=\"Optional Parameters\"]")
	private WebElement optionalParameter;

	public void yearlyPerformanceReport(String formonth, String foryear, String tomonth, String toyear, String format1,
			String selectuser, String reportExportFormat) throws Exception {
            pageLoadWaitng();
            element_DropDownSelectByvisibleText(forMonth, formonth);
            element_DropDownSelectByvisibleText(forYear, foryear);
            Thread.sleep(1000);
            element_DropDownSelectByvisibleText(toMonth, tomonth);
            element_DropDownSelectByvisibleText(toYear, toyear);
            Thread.sleep(1000);
            element_Click(optionalParameter);
            element_DropDownSelectByvisibleText(format, format1);
            Thread.sleep(1000);
            element_DropDownSelectByvisibleText(selectUsers, selectuser);
            Thread.sleep(1000);
            generateReportToAllModule(reportExportFormat);
            
	}

}
