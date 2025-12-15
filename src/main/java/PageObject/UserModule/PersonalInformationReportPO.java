package PageObject.UserModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class PersonalInformationReportPO extends AbstractMethod {
	WebDriver driver;
	
	public PersonalInformationReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "grpddl")
	WebElement selectUserDD;
	
	@FindBy(xpath = "//*[@value='Generate Report']")
	WebElement generatereport;
	
	public void personalInformationPO(String selectDD, String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
