package PageObject.TimeAndAttendance;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class AuthorizationStatusReportPO extends AbstractMethod {
	WebDriver driver;
	
	public AuthorizationStatusReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_calToDate")
	private WebElement toDate;
	
	@FindBy(id = "grpddl")
	private WebElement selectUsers;
	
	@FindBy(xpath = "//*[@class=\"col-md-2 form-hr list-box\"]//input")
	private List<WebElement> approvalType;
	
	@FindBy(xpath = "//*[@default=\"Optional Parameters\"]")
	private WebElement optionalParameter;
	
	public void authorizationStatusReport(String fDate, String tDate, String selectuser , String reportExportFormat) throws Exception {
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
		for(int i=0; i<approvalType.size(); i++) {
			if(!approvalType.get(i).isSelected()) {
				element_Click(approvalType.get(i));
			}
		}
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUsers, selectuser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
