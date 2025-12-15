package PageObject.TimeAndAttendance;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class SpecialFunctionPunchReportPO extends AbstractMethod{
	WebDriver driver;
	
	public SpecialFunctionPunchReportPO(WebDriver driver) {
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
	
	@FindBy(xpath = "//*[@default=\"Optional Parameters\"]")
	private WebElement optionalParameter;
	
	@FindBy(xpath = "//*[@class=\"col-md-2 form-hr list-box\"]//input")
	private List<WebElement> approvalType;
	
	@FindBy(id = "cboGrpLvl")
	private WebElement format;
	
	public void specialFunctionPunchReport(String fDate, String tDate,  String format1 , String selectuser , String reportExportFormat) throws Exception {
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
		element_DropDownSelectByvisibleText(format, format1);
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
