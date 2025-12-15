package PageObject.UserModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class UserWisePolicyAssignmentReportPO extends AbstractMethod {
	WebDriver driver;
	
	public UserWisePolicyAssignmentReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameters;
	
	@FindBy(id = "chkGrpOpt1")
	private WebElement checkbox;
	
	@FindBy(id = "grpddl")
	private WebElement selectUserDD;
	
	@FindBy(id = "//*[@default='Generate Report']")
	private WebElement generateReport;
   
	public void userWisePolicyAssignmentReport(String selectDD , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_Click(optionalParameters);
		if(!checkbox.isSelected()) {
			element_Click(checkbox);
		}
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
