package PageObject.UserModule;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class EnrollmentInfoReportPO extends AbstractMethod {
	WebDriver driver;
	
	public EnrollmentInfoReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath = "//*[@class='col-md-2 form-hr list-box']//*[@type='checkbox']")
	private List<WebElement> credentials;
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameters;
	
	@FindBy(id = "grpddl")
	private WebElement selectUserDD;
	
	@FindBy(xpath = "//*[@default='Generate Report']")
	private WebElement generateReport;
	
	public void enrollmentInfoReport(String selectDD , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_Click(optionalParameters);
		for(int i=0 ; i<credentials.size(); i++) {
			if(!credentials.get(i).isSelected()) {
				credentials.get(i).click();
			}
		}
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
