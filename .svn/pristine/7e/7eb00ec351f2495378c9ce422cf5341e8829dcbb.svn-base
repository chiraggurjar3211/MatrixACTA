package PageObject.TimeAndAttendance;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class FlexibleSummaryReportPO extends AbstractMethod {
	WebDriver driver;

	public FlexibleSummaryReportPO(WebDriver driver) {
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

	@FindBy(id = "cboGrpLvl")
	private WebElement target;

	@FindBy(xpath = "//*[@default=\"Optional Parameters\"]")
	private WebElement optionalParameter;

	public void flexibleSummaryReport(String month1, String year1, String target1, String selectuser,
			String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(month, month1);
		element_DropDownSelectByvisibleText(year, year1);
		Thread.sleep(1000);
		element_Click(optionalParameter);
		element_DropDownSelectByvisibleText(target, target1);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUsers, selectuser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
