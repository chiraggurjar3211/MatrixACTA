package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class InputPortGroupReportPO extends AbstractMethod {
	WebDriver driver;
	
	public InputPortGroupReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "grpddl")
	private WebElement selectPanels;
	
	public void inputPortGroupReport(String selectPanel , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectPanels, selectPanel);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
