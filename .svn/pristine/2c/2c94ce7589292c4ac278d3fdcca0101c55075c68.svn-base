package PageObject.CafeteriaManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class DeviceWiseConsumptionReportPO extends AbstractMethod {
	WebDriver driver;
	
	public DeviceWiseConsumptionReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_calToDate")
	private WebElement toDate;
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameter;
	
	@FindBy(id = "cboGrpLvl")
	private WebElement formatselection;
	
	@FindBy(id = "grpddl")
	private WebElement selectDevices;
	
	public void deviceWiseConsumptionReport(String fDate , String tDate , String formatSelection , String selectdevices , String reportExportFormat) throws Exception {
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
        element_DropDownSelectByvisibleText(formatselection, formatSelection);
        Thread.sleep(1000);
        element_DropDownSelectByvisibleText(selectDevices, selectdevices);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
