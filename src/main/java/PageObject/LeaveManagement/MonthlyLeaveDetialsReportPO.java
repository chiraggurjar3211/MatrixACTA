package PageObject.LeaveManagement;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class MonthlyLeaveDetialsReportPO extends AbstractMethod {
	WebDriver driver;
	
	public MonthlyLeaveDetialsReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cntFromMonth")
	private WebElement month;
	
	@FindBy(id = "cntFromYear")
	private WebElement year;
	
	@FindBy(id = "grpddl")
	private WebElement selectUsers;
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameter;
	
	@FindBy(xpath = "//*[@class='col-md-2 form-hr list-box']//label/input")
	private List<WebElement> selectLeave;
	
	public void monthlyLeaveDetialsReport(String month1 , String year1 , String selectUser , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(month, month1);
		Thread.sleep(500);
		element_DropDownSelectByvisibleText(year, year1);
		Thread.sleep(500);
		element_Click(optionalParameter);
		for(int i=0 ; i<selectLeave.size(); i++) {
			if(!selectLeave.get(i).isSelected()) {
				element_Click(selectLeave.get(i));
			}
		}
		Thread.sleep(500);
		element_DropDownSelectByvisibleText(selectUsers, selectUser);
		Thread.sleep(500);
		generateReportToAllModule(reportExportFormat);
	}

}
