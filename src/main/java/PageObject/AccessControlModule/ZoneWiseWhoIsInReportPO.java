package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class ZoneWiseWhoIsInReportPO extends AbstractMethod {
	WebDriver driver;
	
	public ZoneWiseWhoIsInReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cboACSSel")
	private WebElement selectPanelZoneReport;
	
	
	public void zoneWiseWhoIsIn(String selectpanelZoneReport  ,  String  reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectPanelZoneReport, selectpanelZoneReport);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
