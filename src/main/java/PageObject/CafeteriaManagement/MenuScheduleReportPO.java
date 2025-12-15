package PageObject.CafeteriaManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class MenuScheduleReportPO extends AbstractMethod {
	WebDriver driver;
	
	public MenuScheduleReportPO(WebDriver driver) {
		super(driver);
		this.driver =driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "grpddl")
	private WebElement selectDoor;
	
	public void menuScheduleReport(String selectDoors , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectDoor, selectDoors);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
