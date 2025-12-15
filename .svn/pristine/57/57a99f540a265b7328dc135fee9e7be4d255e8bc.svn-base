package PageObject.JobProcessingCosting;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class UserJobDetailsReportPO extends AbstractMethod{
	WebDriver driver;
	
	public UserJobDetailsReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_calToDate")
	private WebElement toDate;
	
	@FindBy(xpath = "//*[@default=\"Optional Parameters\"]")
	private WebElement optionalParameter;
	
	@FindBy(id = "grpddl")
	private WebElement selectUser;
	
	@FindBy(id = "chkGrpOpt1")
	private WebElement checkbox;
	
	public void userJobDetailsReport(String fDate , String tDate , String selectuser , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		String dateFormat = fromDate.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(fDate, dateFormat);
		element_Clear(fromDate);
		element_InputTextUsingActionClass(fromDate, insertFromDate);
		String insertToDate = reportFromDateToDateChangeFormat(tDate, dateFormat);
		element_Clear(toDate);
		element_InputTextUsingActionClass(toDate, insertToDate);
		Thread.sleep(1000);
		element_Click(optionalParameter);
		if(!checkbox.isSelected()) {
			element_Click(checkbox);
		}
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUser, selectuser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
