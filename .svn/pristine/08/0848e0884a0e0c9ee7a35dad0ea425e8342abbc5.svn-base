package PageObject.TimeAndAttendance;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class CustomAttendanceRegisterReportPO extends AbstractMethod{
	WebDriver driver;
	
	public CustomAttendanceRegisterReportPO(WebDriver driver) {
	       super(driver);
	       this.driver = driver;
	       PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cntFromMonth")
	private WebElement forMonth;

	@FindBy(id = "cntFromYear")
	private WebElement forYear;

	@FindBy(id = "grpddl")
	private WebElement selectUsers;
	
	@FindBy(xpath = "//*[@default=\"Optional Parameters\"]")
	private WebElement optionalParameter;
	
	@FindBy(xpath = "(//*[@class=\"col-md-2 form-hr list-box\"])[1]//input ")
	private List<WebElement> availableFields;
	
	@FindBy(xpath = "//*[@default=\"Add\"] ")
	private WebElement add;
	
	@FindBy(xpath = "(//*[@class=\"col-md-2 form-hr list-box\"])[2]//input")
	private List<WebElement> selectedFields;
	
	public void customAttendanceRegisterReport(String month , String year , String selectuser , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(forMonth, month);
		element_DropDownSelectByvisibleText(forYear, year);
		Thread.sleep(1000);
		element_Click(optionalParameter);
		for(int i=0; i<availableFields.size(); i++) {
			if(!availableFields.get(i).isSelected()) {
				element_Click(availableFields.get(i));
			}
		}
		Thread.sleep(1000);
		element_Click(add);
		Thread.sleep(1000);
		for(int i=0;i<selectedFields.size(); i++) {
			if(!selectedFields.get(i).isSelected()) {
				element_Click(selectedFields.get(i));
			}
		}
		
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUsers, selectuser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
