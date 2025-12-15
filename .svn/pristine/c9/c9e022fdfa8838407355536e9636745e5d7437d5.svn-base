package PageObject.JobProcessingCosting;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class MonthlyJobDetailsReportPO extends AbstractMethod {
	WebDriver driver;
	
	public MonthlyJobDetailsReportPO(WebDriver driver) {
	      super(driver);
	      this.driver = driver;
	      PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cntFromMonth")
	private WebElement month;
	
	@FindBy(id = "cntFromYear")
	private WebElement year;
	
	@FindBy(id = "grpddl")
	private WebElement selectUser;
	
	@FindBy(xpath = "//*[@default=\"Optional Parameters\"]")
	private WebElement optionalParameter;
	
	public void monthlyJobDetailsReport(String month1 , String year1 ,  String selectuser , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(month,month1);
		element_DropDownSelectByvisibleText(year, year1);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUser, selectuser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
