package PageObject.CafeteriaManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class UserAccountDetialsReportPO  extends AbstractMethod{
	WebDriver driver;
	
	public UserAccountDetialsReportPO(WebDriver driver) {
		super(driver);
		this.driver =driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "grpddl")
	private WebElement selectUser;
	
	public void userAccountDetialsReport(String selectuser , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectUser, selectuser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
