package PageObject.UserModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class FormerUsersReportPO extends AbstractMethod {
	WebDriver driver;
	public FormerUsersReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cntFromMonth")
	private WebElement month;
	
	@FindBy(id = "cntFromYear")
	private WebElement year;
	
	@FindBy(xpath = "(//*[@id='grpddl'])[1]")
	private WebElement selectUserDD;
	
	@FindBy(id = "//*[@default='Generate Report']")
	private WebElement generateReport;
	
	public void formerUsersReport(String month1 , String year1 , String selectDD , String reportExportFormat) throws Exception {
		Thread.sleep(2000);
		waitForElementVisible(month);
		element_DropDownSelectByvisibleText(month, month1);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(year, year1);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
