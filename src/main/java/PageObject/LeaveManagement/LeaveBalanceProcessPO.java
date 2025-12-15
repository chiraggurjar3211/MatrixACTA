package PageObject.LeaveManagement;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class LeaveBalanceProcessPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(LeaveBalanceProcessPO.class);
	
	// Created by Mayank
	public LeaveBalanceProcessPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// elements
	@FindBy(id = "cboMonth")
	private WebElement monthDrop;

	@FindBy(id = "cboYear")
	private WebElement yearDrop;

	@FindBy(id = "grpddl")
	private WebElement selectUsersDrop;

	@FindBy(id = "ID")
	private WebElement userIdTxt;

	@FindBy(xpath = "//*[@default='Process']")
	private WebElement processBtn;

	/////////////////////////
	public void processLeaveBalance(String month, String year,DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementClickable(monthDrop);
		String convertedMonth = staticMonthOrPlusMinusMonthFromCurrentMonth(month);
		String convertedYear = staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(year);
		element_DropDownSelectByvisibleText(monthDrop, convertedMonth);
		Thread.sleep(500);
		element_DropDownSelectByvisibleText(yearDrop, convertedYear);
		Thread.sleep(500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String userID = data.get("UserID");
			selectUsersOrGroupFromPicklist(userID, userIdTxt);
			Thread.sleep(500);
			element_Click(processBtn);
			Thread.sleep(500);
			String valMsg=validationMessage();
			Thread.sleep(500);
			Assert.assertEquals(valMsg, "Process Completed");
		}
	}
}
