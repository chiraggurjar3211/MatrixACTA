package PageObject.UserModule;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class DeviceAssignmentInformationReportPO extends AbstractMethod  {
	
	WebDriver driver;
	
	public DeviceAssignmentInformationReportPO( WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this );
	}
	
	@FindBy(id = "_calFromDate")
	WebElement fromdate;
	
	@FindBy(id = "_calToDate")
	WebElement todate;
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	WebElement optionalParameter;
	
	@FindBy(xpath = "//*[@class='col-md-2 form-hr list-box']//*[@type='checkbox']")
	List<WebElement> actions;
	
	@FindBy(id = "grpddl")
	WebElement selectUserDD;
	
	public void deviceAssignmentInformation(String fdate, String tdate , String selectDD , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(fromdate);
		String dateFormat = fromdate.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(fdate, dateFormat);
		element_Clear(fromdate);
		element_InputTextUsingActionClass(fromdate, insertFromDate);
		String insertToDate = reportFromDateToDateChangeFormat(tdate, dateFormat);
		element_Clear(todate);
		element_InputTextUsingActionClass(todate, insertToDate);
		element_Click(optionalParameter);
		for(int i=0 ; i<actions.size(); i++) {
			if(!actions.get(i).isSelected()) {
				actions.get(i).click();
			}
		}
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
