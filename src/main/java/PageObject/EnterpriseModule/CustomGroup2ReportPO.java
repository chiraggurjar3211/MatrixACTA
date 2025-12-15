package PageObject.EnterpriseModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class CustomGroup2ReportPO extends AbstractMethod {
	WebDriver driver;
	
	public CustomGroup2ReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public void customGroup2Report(String reportExportFormat) throws Exception {
		pageLoadWaitng();
		generateReportToAllModule(reportExportFormat);
	}

}
