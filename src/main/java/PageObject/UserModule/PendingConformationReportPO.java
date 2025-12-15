package PageObject.UserModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class PendingConformationReportPO extends AbstractMethod {
	WebDriver driver;
	public PendingConformationReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_calToDate")
	private WebElement toDate;
	
	@FindBy(id = "txtOther")
	private WebElement confirmationPeriod;
	
	@FindBy(id = "grpddl")
	private WebElement selectUserDD;
	
	@FindBy(id = "//*[@default='Generate Report']")
	private WebElement generateReport;
	
	public void pendingConformationReport(String fDate , String tDate , String confPeriod , String selectDD , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(fromDate);
		String dateFormat = fromDate.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(fDate, dateFormat);
		element_Clear(fromDate);
		element_InputTextUsingActionClass(fromDate, insertFromDate);
		String insertToDate = reportFromDateToDateChangeFormat(tDate, dateFormat);
		element_Clear(toDate);
		element_InputTextUsingActionClass(toDate, insertToDate);
		element_Clear(confirmationPeriod);
		element_InputTextUsingActionClass(confirmationPeriod, confPeriod);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
