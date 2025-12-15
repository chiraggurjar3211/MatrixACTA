package PageObject.DeviceModule;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class DeviceWiseEventReportPO extends AbstractMethod {
	WebDriver driver;
	public DeviceWiseEventReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_calToDate")
	private WebElement toDate;
	
	@FindBy(id = "grpddl")
	private WebElement selectDoors;
	
	@FindBy(xpath = "//*[@default='Generate Report']")
	private WebElement generatereport;
	
	@FindBy(xpath = "//*[@class='col-md-2 form-hr list-box']//input ")
	private List<WebElement> eventType;
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameters;
	
	public void deviceWiseEventReport(String fDate , String tDate , String selectDD , String reportExportFormat) throws Exception {
		waitForElementVisible(fromDate);
		String dateFormat = fromDate.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(fDate, dateFormat);
		element_Clear(fromDate);
		element_InputTextUsingActionClass(fromDate, insertFromDate);
		String insertToDate = reportFromDateToDateChangeFormat(tDate, dateFormat);
		element_Clear(toDate);
		element_InputTextUsingActionClass(toDate, insertToDate);
		element_Click(optionalParameters);
		for(int i=0 ; i<eventType.size(); i++) {
			if(!eventType.get(i).isSelected()) {
				eventType.get(i).click();
			}
		}
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectDoors, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
