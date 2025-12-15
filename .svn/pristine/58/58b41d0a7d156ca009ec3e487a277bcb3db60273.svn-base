package PageObject.EnterpriseModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class CategoryReportPO extends AbstractMethod  {
	WebDriver driver;
	
	public CategoryReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public void categoryReport(String reportExportFormat) throws Exception {
		pageLoadWaitng();
		generateReportToAllModule(reportExportFormat);
	}

}
