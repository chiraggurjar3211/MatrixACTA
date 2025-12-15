package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class AssignedDevicesReportPO extends AbstractMethod {
	WebDriver driver;
	
	public AssignedDevicesReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "grpddl")
	private WebElement selectUsersDD;
	
	public void assignedDevicesReport( String selectDD , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectUsersDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
