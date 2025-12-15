package PageObject.AccessControlModule;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class TourDetialsReportPO extends AbstractMethod {
	WebDriver driver;
	
	public TourDetialsReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_calToDate")
	private WebElement toDate;
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameters;
	
	@FindBy(xpath =  "//*[@id='cboGroupBy']")
	private WebElement formatSelection;
	
	@FindBy(id = "grpddl")
	private WebElement selectTour;
	
	public void tourDetialsReport( String fDate , String tDate  , String format ,  String selecttour,  String reportExoprtFormat) throws Exception {
		pageLoadWaitng();
		String dateFormat = fromDate.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(fDate, dateFormat);
		element_Clear(fromDate);
		element_InputTextUsingActionClass(fromDate, insertFromDate);
		String insertToDate = reportFromDateToDateChangeFormat(tDate, dateFormat);
		element_Clear(toDate);
		element_InputTextUsingActionClass(toDate, insertToDate);
		element_Click(optionalParameters);
		//element_Click(formatSelection);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(formatSelection, format);
		
		
		element_DropDownSelectByvisibleText(selectTour, selecttour);
		Thread.sleep(1000);
		generateReportToAllModule(reportExoprtFormat);
	}
	
	

}
