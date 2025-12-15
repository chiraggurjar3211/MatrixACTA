package PageObject.EnterpriseModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class SectionReportPO extends AbstractMethod {
	WebDriver driver;
	
	public SectionReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public void sectionReport(String reportExportFormat) throws Exception {
		pageLoadWaitng();
		generateReportToAllModule(reportExportFormat);
	}

}
