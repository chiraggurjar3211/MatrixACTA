package PageObject.EnterpriseModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class DesignationReportPO extends AbstractMethod {
	WebDriver driver;
	
	public DesignationReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public void designationReport(String reportExportFormat) throws Exception {
		pageLoadWaitng();
		generateReportToAllModule(reportExportFormat);
	}

}
