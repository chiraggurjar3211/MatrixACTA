package PageObject.AccessControlModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class EmergencyEvacuationReportPO extends AbstractMethod {
	WebDriver driver;
	
	public EmergencyEvacuationReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_calToDate")
	private WebElement toDate;
	
	@FindBy(id="txtToTime")
	private WebElement totime;
	
	@FindBy(id = "grpddl")
	private WebElement selectUsers;
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameter;
	
	@FindBy(id = "cboGrpLvl")
	private WebElement userType;
	
	public void emergencyEvacuationReport(String fDate , String tDate , String UserType  ,  String SelectUsers , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		String dateFormat = fromDate.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(fDate, dateFormat);
		element_Clear(fromDate);
		element_InputTextUsingActionClass(fromDate, insertFromDate);
		String insertToDate = reportFromDateToDateChangeFormat(tDate, dateFormat);
		element_Clear(toDate);
		element_InputTextUsingActionClass(toDate, insertToDate);
		Thread.sleep(1000);
		element_Clear(totime);
		element_inputTextUsingActionClassCharacterOneByOne(totime, "23:59");
		element_Click(optionalParameter);
		element_DropDownSelectByvisibleText(userType, UserType);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUsers, SelectUsers);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
