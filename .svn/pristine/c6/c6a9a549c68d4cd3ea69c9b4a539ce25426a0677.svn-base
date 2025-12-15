package PageObject.JobProcessingCosting;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class TimesheetCorrectionAuthorizationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(TimesheetCorrectionAuthorizationPO.class);
	public TimesheetCorrectionAuthorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "filtered")
	private WebElement datefilter;
	
	@FindBy(id = "_calFromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_calToDate")
	private WebElement toDateTxt;

	@FindBy(id = "cboMode")
	private WebElement filterUserDropdown;

	@FindBy(id = "AutoUserID")
	private WebElement groupUserIdTxt;

	@FindBy(xpath = "//*[@key=\"btnView\"]")
	private WebElement viewBtn;
	
	@FindBy(id = "chkRejectgvPending")
	private WebElement rejectAllChk;

	@FindBy(id = "chkApprovegvPending")
	private WebElement approveAllChk;
	
	
	
	public void timesheetCorrectionAuth(Map<String, String> data) throws InterruptedException {
		waitForElementVisible(fromDateTxt);
		String val = null;
		String userName = data.get("UserName");
		String attendanceDate = data.get("AttendanceDate");
		String filterUser = data.get("FilterUser");
		String approval = data.get("Approval");
		String validation = data.get("Validation");

		Thread.sleep(1000);
		element_Click(datefilter);
		String adate = staticDateOrPlusMinusFromCurrentDate(attendanceDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, adate);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, adate);
		waitForElementClickable(filterUserDropdown);
		element_DropDownSelectByvisibleText(filterUserDropdown, filterUser);
		Thread.sleep(1000);
		element_Clear(groupUserIdTxt);
		element_InputTextUsingActionClass(groupUserIdTxt, userName);
		element_TextBoxToClickOnTab(groupUserIdTxt);
		waitForElementClickable(viewBtn);
		element_ClickUsingJS(viewBtn);
		pageLoadWaitng();
		if (approval.equalsIgnoreCase("Reject")) {
			element_Click(rejectAllChk);
		} else if (approval.equalsIgnoreCase("Approve")) {
			element_Click(approveAllChk);
		}
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(1000);
		val = validationMessage();
		Thread.sleep(1000);
		Assert.assertEquals(val, validation);
	}

}
