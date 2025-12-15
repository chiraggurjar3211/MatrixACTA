package PageObject.ContractorWorkerManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class MonthlyAttendanceReportPO extends AbstractMethod {
	WebDriver driver;
	
	public MonthlyAttendanceReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_calToDate")
	private WebElement toDate;
	
	@FindBy(id = "cmbContractor")
	private WebElement selectContractors;
	
	@FindBy(id = "cmbWorkOrder")
	private WebElement selectworkOrders;
	
	@FindBy(id = "cmbWorkers")
	private WebElement selectWorkers;
	
	public void monthlyAttendanceReport(String fDate , String tDate , String selectcontracter , String selectworkorder  , String  selectworker , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		String dateFormat = fromDate.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(fDate, dateFormat);
		element_Clear(fromDate);
		element_InputTextUsingActionClass(fromDate, insertFromDate);
		String insertToDate = reportFromDateToDateChangeFormat(tDate, dateFormat);
		element_Clear(toDate);
		element_InputTextUsingActionClass(toDate, insertToDate);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectContractors, selectcontracter);
		element_DropDownSelectByvisibleText(selectworkOrders, selectworkorder);
		element_DropDownSelectByvisibleText(selectWorkers, selectworker);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}
	

}
