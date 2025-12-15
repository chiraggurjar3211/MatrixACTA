package PageObject.VisitorManagement;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class VisitorEnrollmentStatusReportPO extends AbstractMethod {
	WebDriver driver;
	
	public VisitorEnrollmentStatusReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameter;
	
	@FindBy(xpath = "//*[@class='col-md-2 form-hr list-box']//label/input")
	private List<WebElement> credentials;
	
	@FindBy(id = "grpddl")
	private WebElement selectVisitors;
	
	public void visitorEnrollmentStatusReport(String selectVisitor , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_Click(optionalParameter);
		Thread.sleep(1000);
		for(int i=0 ; i<credentials.size() ; i++) {
			if(!credentials.get(i).isSelected()) {
				element_Click(credentials.get(i));
			}
		}
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectVisitors, selectVisitor);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
