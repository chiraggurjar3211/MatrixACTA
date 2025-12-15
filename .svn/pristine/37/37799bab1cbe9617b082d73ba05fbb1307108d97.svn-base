package PageObject.UserModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class UserWiseControllerReportPO extends AbstractMethod {
	WebDriver driver;
    public UserWiseControllerReportPO(WebDriver driver) {
    	super(driver);
		this.driver = driver; 
		PageFactory.initElements(driver, this);
	}
    
    @FindBy(id ="grpddl")
    WebElement selectUserID;
    
    public void userWiseController(String selectDD, String reportExportFormat) throws Exception {
    	pageLoadWaitng();
    	element_DropDownSelectByvisibleText(selectUserID, selectDD);
    	Thread.sleep(1000);
    	generateReportToAllModule(reportExportFormat);
    }

}
