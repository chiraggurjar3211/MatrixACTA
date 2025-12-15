package PageObject.TimeAndAttendance;

import java.util.List;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class FormTReportPO extends AbstractMethod {
	WebDriver driver;

	public FormTReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "cntFromMonth")
	private WebElement forMonth;

	@FindBy(id = "cntFromYear")
	private WebElement forYear;

	@FindBy(id = "grpddl")
	private WebElement selectUsers;

	@FindBy(xpath = "//*[@default=\"Optional Parameters\"]")
	private WebElement optionalParameter;

	@FindBy(id = "header")
	private WebElement message;

	@FindBy(id = "orgName")
	private WebElement orgName;

	@FindBy(xpath = "//*[@key=\"txtOrgAdd\"]")
	private WebElement orgAddress;

	@FindBy(id = "leaveID")
	private WebElement leaveId;

	@FindBy(xpath = "//*[@class=\"table-responsive\"]//tbody/tr")
	private List<WebElement> table;

	@FindBy(xpath = "//*[@class=\"table-responsive\"]//tbody/tr[1]//i[@title=\"Delete\" ][1]")
	private WebElement delete;

	@FindBy(xpath = "//*[@key=\"btnSave\"]")
	private WebElement saveBtn;

	public void formTReport(String month, String year, String message1,  String orgname, String orgaddress, String leaveid,
			String selectuser, String reportExportFormat) throws Exception {
            pageLoadWaitng();
            element_DropDownSelectByvisibleText(forMonth, month);
            element_DropDownSelectByvisibleText(forYear, year);
            Thread.sleep(1000);
            element_Click(optionalParameter);
            element_Clear(message);
            element_InputTextUsingActionClass(message, message1);
            element_Clear(orgName);
            element_InputTextUsingActionClass(orgName, orgname);
            element_Clear(orgAddress);
            element_InputTextUsingActionClass(orgAddress, orgaddress);
            Thread.sleep(1000);
           while (table.size()!=0)
             {
            	element_Click(delete);
            	Thread.sleep(450);
            	driver.switchTo().alert().accept();
            	Thread.sleep(1000);
            }
            Thread.sleep(1000);
            if(leaveid.contains(",")) {
            	String arr[]= leaveid.split(",");
            	for(int i=0 ; i<arr.length;i++) {
            		element_Clear(leaveId);
            		element_InputTextUsingActionClass(leaveId, arr[i]);
            		Thread.sleep(500);
            		leaveId.sendKeys(Keys.TAB);
            		Thread.sleep(1000);
            	}
            }
            element_Click(saveBtn);
            Thread.sleep(1000);
            element_DropDownSelectByvisibleText(selectUsers, selectuser);
            Thread.sleep(1000);
            generateReportToAllModule(reportExportFormat);
	}

}
