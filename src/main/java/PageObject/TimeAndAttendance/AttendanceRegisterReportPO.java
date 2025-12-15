package PageObject.TimeAndAttendance;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class AttendanceRegisterReportPO extends AbstractMethod {
	WebDriver driver;

	public AttendanceRegisterReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "cntFromMonth")
	private WebElement month;

	@FindBy(id = "cntFromYear")
	private WebElement year;

	@FindBy(xpath = "//*[text()='Optional Parameters']")
	private WebElement optionalParameter;

	@FindBy(id = "cboGrpLvl")
	private WebElement format;

	@FindBy(id = "grpddl")
	private WebElement selectUsers;

	@FindBy(id = "chkArchieve")
	private WebElement checkbox;

	public void attendenceRegisterReport(String month1, String year1, String format1, String selectuser,
			String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(month, month1);
		element_DropDownSelectByvisibleText(year, year1);
		if (!checkbox.isSelected()) {
			element_Click(checkbox);
		}
		Thread.sleep(1000);
		element_Click(optionalParameter);
		element_DropDownSelectByvisibleText(format, format1);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUsers, selectuser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
