package PageObject.TimeAndAttendance;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class Form28ReportPO extends AbstractMethod {
	WebDriver driver;

	public Form28ReportPO(WebDriver driver) {
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
	
	@FindBy(id = "cboGroupBylvl1Sel")
	private WebElement format;

	@FindBy(id = "header")
	private WebElement message;

	@FindBy(id = "orgName")
	private WebElement orgName;

	@FindBy(xpath = "//*[@key=\"txtOrgAdd\"]")
	private WebElement orgAddress;

	@FindBy(xpath = "//*[@key=\"btnSave\"]")
	private WebElement saveBtn;

	public void form28Report(String month, String year, String format1, String message1, String orgname,
			String orgaddress, String selectuser, String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(forMonth, month);
		element_DropDownSelectByvisibleText(forYear, year);
		Thread.sleep(1000);
		element_Click(optionalParameter);
		element_DropDownSelectByvisibleText(format, format1);
		element_Clear(message);
		element_InputTextUsingActionClass(message, message1);
		element_Clear(orgName);
		element_InputTextUsingActionClass(orgName, orgname);
		element_Clear(orgAddress);
		element_InputTextUsingActionClass(orgAddress, orgaddress);
		element_Click(saveBtn);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUsers, selectuser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
