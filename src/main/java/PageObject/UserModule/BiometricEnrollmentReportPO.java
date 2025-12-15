package PageObject.UserModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class BiometricEnrollmentReportPO extends AbstractMethod {
	WebDriver driver;
	
	public BiometricEnrollmentReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "grpddl")
	private WebElement selectUserDD;
	
	@FindBy(id = "//*[@default=\"Generate Report\"]")
	private WebElement generateReport;
	
	public void biometricEnrollmentReport(String selectDD , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
