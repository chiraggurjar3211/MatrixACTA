package PageObject.UserModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class OfficalInfoReportPO extends AbstractMethod {
	WebDriver driver;
	
    public OfficalInfoReportPO(WebDriver driver) {
    	super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
    
    @FindBy(id = "grpddl")
	private WebElement selectUserDD;
	
	@FindBy(xpath = "//*[@default='Generate Report']")
	private WebElement generateReport;
	
	public void officalInfoReport(String reportExportFormat, String selectUsers) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectUserDD, selectUsers);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
