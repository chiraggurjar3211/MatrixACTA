package PageObject.EnterpriseModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class DepartmentReportPO extends AbstractMethod  {
      WebDriver driver;
      
      public DepartmentReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
      
    public void departmentReport(String reportExportFormat) throws Exception {
    	pageLoadWaitng();
    	generateReportToAllModule(reportExportFormat);
    }
}
