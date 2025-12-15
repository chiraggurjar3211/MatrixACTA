package PageObject.TimeAndAttendance;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class MonthlyDetailsReport extends AbstractMethod {
	WebDriver driver;

	public MonthlyDetailsReport(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "cntFromMonth")
	private WebElement fromMonth;

	@FindBy(id = "cntFromYear")
	private WebElement fromYear;

	@FindBy(xpath = "//*[text()='Optional Parameters']")
	private WebElement optionalParameter;

	@FindBy(id = "cboGrpLvl")
	private WebElement formatSelection;

	@FindBy(id = "chkNPGrp")
	private WebElement includeExcessBreakcheckbox;

	@FindBy(id = "grpddl")
	private WebElement selectUserDD;

	public void monthlyDetailsReport(String month, String year, String format, String selectDD,
			String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(fromMonth, month);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(fromYear, year);
		Thread.sleep(1000);
		element_Click(optionalParameter);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(formatSelection, format);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
