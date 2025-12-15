package PageObject.TimeAndAttendance;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class HeadCountTAReportPO extends AbstractMethod {
	WebDriver driver;

	public HeadCountTAReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "cntFromMonth")
	private WebElement month;

	@FindBy(id = "cntFromYear")
	private WebElement year;

	public void headCountReport(String month1, String year1, String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(month, month1);
		element_DropDownSelectByvisibleText(year, year1);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
