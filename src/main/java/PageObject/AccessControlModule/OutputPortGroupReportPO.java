package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class OutputPortGroupReportPO  extends AbstractMethod{
	WebDriver driver;
	
	public OutputPortGroupReportPO(WebDriver driver) {
		super(driver);
		this.driver =driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "grpddl")
	private WebElement selectPanels;
	
	public void outputPortGroupReport(String selectPanel , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectPanels, selectPanel);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}


}
