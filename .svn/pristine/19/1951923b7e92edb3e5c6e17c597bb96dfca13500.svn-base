package PageObject.VisitorManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class VisitorPassStatusReportPO  extends AbstractMethod {
	WebDriver driver;
	
	public VisitorPassStatusReportPO(WebDriver driver) {
		super(driver);
		this.driver =driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement date;
	
	public void visitorPassStatusReport(String date1 , String reportExportFormat ) throws Exception {
		pageLoadWaitng();
		String dateFormat = date.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(date1, dateFormat);
		element_Clear(date);
		element_InputTextUsingActionClass(date, insertFromDate);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
