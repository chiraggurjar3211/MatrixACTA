package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class ElevatorFloorGroupMasterReportPO extends AbstractMethod {
	
	WebDriver driver;
	
	public ElevatorFloorGroupMasterReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cboElevatorFloorGrp")
	private WebElement selectElevatorFloorGroup;
	
	@FindBy(id = "cboUserSel")
	private WebElement generateReportFor;

	
	public void  elevatorFloorGroupMasterReport(String selectelevatorFloorGroup  , String generatereportFor ,String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectElevatorFloorGroup, selectelevatorFloorGroup);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(generateReportFor, generatereportFor);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
