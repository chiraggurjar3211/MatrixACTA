package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class AccessRouteMasterReportPO extends AbstractMethod {
	WebDriver driver;
	
	public AccessRouteMasterReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "chkNPGrp")
	private WebElement checkbox;
	
	@FindBy(id = "cboPanel")
	private WebElement selectPanel;
	
	@FindBy(id = "cboAccessRoute")
	private WebElement selectAccessRoute;
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameters;
	
	public void accessRouteMasterReport(String selectpanel , String selectaccessRoute, String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_Click(optionalParameters);
		if(!checkbox.isSelected()) {
			element_Click(checkbox);
		}
		element_DropDownSelectByvisibleText(selectPanel, selectpanel);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectAccessRoute, selectaccessRoute);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
		
	}

}
