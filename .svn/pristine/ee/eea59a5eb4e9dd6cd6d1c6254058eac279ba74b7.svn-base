package PageObject.UserModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class WhoIsInReportPO extends AbstractMethod {
	
	WebDriver driver;
	public WhoIsInReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "txtPunchTime")
	private WebElement InPunchTime;
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameters;
	
	@FindBy(id = "grpddl")
	private WebElement selectUserDD;
	
	@FindBy(id = "//*[@default='Generate Report']")
	private WebElement generateReport;
	
	public void whoIsInReport(String inpunchPeriod , String selectDD , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_Click(optionalParameters);
		element_Clear(InPunchTime);
		element_inputTextUsingActionClassCharacterOneByOne(InPunchTime, inpunchPeriod);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
