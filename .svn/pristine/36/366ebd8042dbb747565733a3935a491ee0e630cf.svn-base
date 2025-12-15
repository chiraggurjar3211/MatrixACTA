package PageObject.TimeAndAttendance;

import java.util.List;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class Form18ReportPO extends AbstractMethod {
	WebDriver driver;
	
	public Form18ReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cboGrpSel")
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
	
	@FindBy(id = "leaveName")
	private WebElement leaveName;
	

	@FindBy(xpath = "//*[@class=\"table-responsive\"]//tbody/tr")
	private List<WebElement> table;

	@FindBy(xpath = "//*[@class=\"table-responsive\"]//tbody/tr[1]//*[@key=\"Delete\"]")
	private WebElement delete;

	@FindBy(xpath = "//*[@key=\"btnSave\"]")
	private WebElement saveBtn;
	
	public void form18Report(String year, String message1,  String orgname, String orgaddress, String leaveid,
			String selectuser, String reportExportFormat) throws Exception {
		 pageLoadWaitng();
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
         while(table.size()!=0) {
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
         		Thread.sleep(500);
         		element_InputTextUsingActionClass(leaveName, arr[i]);
         		Thread.sleep(1000);
         		element_TextBoxToClickOnTab(leaveName);
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
