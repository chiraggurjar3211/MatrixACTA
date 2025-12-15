package PageObject.LeaveManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class Form15ReportPO extends AbstractMethod {
	WebDriver driver;
	
	public Form15ReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cboGrpSel")
  	private WebElement year;
      
    @FindBy(id = "grpddl")
  	private WebElement selectUsers;
      
      public void form15Report(String year1 , String selectUser , String reportExportFormat) throws Exception {
  		pageLoadWaitng();
  		element_DropDownSelectByvisibleText(year, year1);
  		Thread.sleep(1000);
  		element_DropDownSelectByvisibleText(selectUsers, selectUser);
  		Thread.sleep(1000);
  		generateReportToAllModule(reportExportFormat);
  	}

}
