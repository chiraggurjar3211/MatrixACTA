package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class FirstInUserReportPO extends AbstractMethod {
	WebDriver driver;
	
	public FirstInUserReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "grpddl")
	private WebElement selectFirstinUserGroup;
	
	public void firstInUserReport(String selectfirstInuserGroup , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectFirstinUserGroup, selectfirstInuserGroup);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
