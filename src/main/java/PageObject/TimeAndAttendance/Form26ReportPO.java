package PageObject.TimeAndAttendance;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class Form26ReportPO extends AbstractMethod {
	WebDriver driver;

	public Form26ReportPO(WebDriver driver) {
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

	@FindBy(id = "LAUpLabel")
	private WebElement leftUpperLabel;

	@FindBy(id = "LALowLabel")
	private WebElement leftLowerLabel;

	@FindBy(id = "RAUpLabel")
	private WebElement rigthUpperLabel;

	@FindBy(id = "RALowLabel")
	private WebElement rightLowerLabel;

	@FindBy(id = "footer")
	private WebElement footer;

	@FindBy(xpath = "//*[@default=\"Save\"]")
	private WebElement saveBtn;

	public void form26Report(String month, String year, String message1,String leUpLabel, String leLowLabel, String rgUpLabel,
			String rgLowLabel, String footer1, String selectuser, String reportExportFormat) throws Exception {
           pageLoadWaitng();
           element_DropDownSelectByvisibleText(forMonth, month);
           element_DropDownSelectByvisibleText(forYear, year);
           Thread.sleep(1000);
           element_Click(optionalParameter);
           element_Clear(message);
           element_InputTextUsingActionClass(message, message1);
           element_Clear(leftUpperLabel);
           element_InputTextUsingActionClass(leftUpperLabel, leUpLabel);
           element_Clear(leftLowerLabel);
           element_InputTextUsingActionClass(leftLowerLabel, leLowLabel);
           element_Clear(rigthUpperLabel);
           element_InputTextUsingActionClass(rigthUpperLabel, rgUpLabel);
           element_Clear(rightLowerLabel);
           element_InputTextUsingActionClass(rightLowerLabel, rgLowLabel);
           element_Clear(footer);
           element_InputTextUsingActionClass(footer, footer1);
           element_Click(saveBtn);
           Thread.sleep(1000);
           element_DropDownSelectByvisibleText(selectUsers, selectuser);
           Thread.sleep(1000);
           generateReportToAllModule(reportExportFormat);
	}

}
