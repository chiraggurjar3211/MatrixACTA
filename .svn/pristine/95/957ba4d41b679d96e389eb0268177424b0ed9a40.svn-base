package PageObject.CafeteriaManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class BlockedUserReportPO  extends AbstractMethod{
	WebDriver driver;
	
	public BlockedUserReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public void bloeckedUserReport(String reportExportFormat) throws Exception {
		pageLoadWaitng();
		generateReportInSelectionFormat(reportExportFormat);
		driver.switchTo().defaultContent();
	}

}
