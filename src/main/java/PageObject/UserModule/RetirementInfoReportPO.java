package PageObject.UserModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class RetirementInfoReportPO extends AbstractMethod {
	WebDriver driver;
	
	public RetirementInfoReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromdate;
	
	@FindBy(id = "_calToDate")
	private WebElement todate;
	
	@FindBy(id = "txtOther")
	private WebElement retireage;
	
	@FindBy(id = "grpddl")
    private WebElement selectUserDD;
	
	@FindBy(xpath = "//*[@default='Generate Report']")
	private WebElement generateReport;
	
	public void retirementInfoReport(String fDate , String tDate , String  retireage1 , String selectDD , String reportExportFormat ) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(fromdate);
		String dateFormat = fromdate.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(fDate, dateFormat);
		element_Clear(fromdate);
		element_InputTextUsingActionClass(fromdate, insertFromDate);
		String insertToDate = reportFromDateToDateChangeFormat(tDate, dateFormat);
		element_Clear(todate);
		element_InputTextUsingActionClass(todate, insertToDate);
		element_Clear(retireage);
		element_InputTextUsingActionClass(retireage, retireage1);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
