package PageObject.UserModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class DoorWiseUsersReportPO extends AbstractMethod{
	WebDriver driver;
	public DoorWiseUsersReportPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	@FindBy(id = "grpddl")
	private WebElement selectUserDD;

	public void doorWiseUsersReport(String selectDD, String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}
}
