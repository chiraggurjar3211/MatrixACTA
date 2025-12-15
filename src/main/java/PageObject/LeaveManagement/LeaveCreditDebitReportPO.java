package PageObject.LeaveManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class LeaveCreditDebitReportPO extends AbstractMethod {
	WebDriver driver;
	
	public LeaveCreditDebitReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cboPeriod")
	private WebElement period;
	
	@FindBy(id = "cboGrpSel")
	private WebElement year;
	
	@FindBy(id = "grpddl")
	private WebElement selectUsers;
	
	public void leaveCreditDebitReport(String period1 , String year1 , String selectUser , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(period, period1);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(year, year1);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUsers, selectUser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
