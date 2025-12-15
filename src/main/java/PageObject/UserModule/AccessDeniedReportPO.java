package PageObject.UserModule;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class AccessDeniedReportPO extends AbstractMethod{
	WebDriver driver;
	public AccessDeniedReportPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromdate;

	@FindBy(id = "_calToDate")
	private WebElement todate;
	
	@FindBy(xpath="//*[@id='vListSel']//input[@type='checkbox']")
	private List<WebElement> deniedEvents;
	
	@FindBy(xpath = "//*[text()='Optional Parameters']")
	private WebElement optionalParameter;
	
	@FindBy(id = "grpddl")
	private WebElement selectUserDD;

	public void accessDeniedReport(String fdate, String tDate,String selectDD, String reportExportFormat) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(fromdate);
		String dateFormat = fromdate.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(fdate, dateFormat);
		element_Clear(fromdate);
		element_InputTextUsingActionClass(fromdate, insertFromDate);
		String insertToDate = reportFromDateToDateChangeFormat(tDate, dateFormat);
		element_Clear(todate);
		element_InputTextUsingActionClass(todate, insertToDate);
		element_Click(optionalParameter);
		for(int i=0;i<deniedEvents.size();i++) {
			if(deniedEvents.get(i).isSelected()!=true) {
				deniedEvents.get(i).click();
			}
		}
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
