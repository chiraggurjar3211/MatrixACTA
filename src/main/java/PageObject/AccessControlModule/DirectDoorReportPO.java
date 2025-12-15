package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class DirectDoorReportPO extends AbstractMethod {
	WebDriver driver;
	
	public DirectDoorReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "grpddl")
	private WebElement selectDirectdoors;
	
	public void directDoorsReport(String selectdirectdoor , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectDirectdoors, selectdirectdoor);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
