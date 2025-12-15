package PageObject.EnterpriseModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class BranchReportPO extends AbstractMethod {
	WebDriver driver;
	
	public BranchReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public void branchReport(String reportExportFormat) throws Exception {
		pageLoadWaitng();
		generateReportToAllModule(reportExportFormat);
	}

}
