package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class AccessGroupWiseTimeZoneReportPO  extends AbstractMethod{
	WebDriver driver;
	
	public AccessGroupWiseTimeZoneReportPO(WebDriver driver) {
		super(driver);
		this.driver =driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "grpddl")
	private WebElement selectAccessGroups;
	
	
	
	public void accessGroupWiseTimeZoneReport(String selectaccessGroups , String reportExportFormat ) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectAccessGroups, selectaccessGroups);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
