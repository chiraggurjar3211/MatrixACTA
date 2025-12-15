package PageObject.VisitorManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class VisitorPassValidityReportPO extends AbstractMethod {
	WebDriver driver;
	
	public VisitorPassValidityReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement date;
	
	@FindBy(id = "txtFromTime")
	private WebElement time;
	
	public void visitorPassValidityReport(String date1 , String time1 , String reportExpoortFormat ) throws Exception {
		pageLoadWaitng();
		String dateFormat = date.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(date1, dateFormat);
		element_Clear(date);
		element_InputTextUsingActionClass(date, insertFromDate);
		element_Clear(time);
		element_inputTextUsingActionClassCharacterOneByOne(time, time1);
		Thread.sleep(1000);
		generateReportToAllModule(reportExpoortFormat);
	}

}
