package PageObject.LeaveManagement;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class LeaveApplicationReportPO extends AbstractMethod {
	WebDriver driver;
	
	public LeaveApplicationReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_calToDate")
	private WebElement toDate;
	
	@FindBy(xpath = "//*[@class='col-md-2 form-hr list-box']//label/input")
	private List<WebElement> select;
	
	@FindBy(id = "cboZamSel")
	private WebElement groupBy;
	
	@FindBy(id = "grpddl")
	private WebElement selectUsers;
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameter;
	
	
	public void leaveApplicationReport(String fDate , String tDate , String groupBY , String selectUser , String reportExportFormat) throws Exception {
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
		for(int i=0 ; i<select.size() ; i++) {
			if(!select.get(i).isSelected()) {
				element_Click(select.get(i));
			}
		}
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(groupBy, groupBY);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUsers, selectUser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
