package PageObject.TimeAndAttendance;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class MusterSummaryReportPO extends AbstractMethod {
	WebDriver driver;

	public MusterSummaryReportPO(WebDriver driver) {
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

	public void musterSummaryReport(String month1, String year1, String selectuser, String reportExportFormat)
			throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(month, month1);
		element_DropDownSelectByvisibleText(year, year1);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUsers, selectuser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
