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

public class OverflowManagementPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(OverflowManagementPO.class);
	
	public OverflowManagementPO(WebDriver driver) {
		// TODO Auto-generated constructor stub
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);

	}
	// Elements

	@FindBy(id = "usersID")
	private WebElement usrId;

	@FindBy(id = "leave")
	private WebElement leaveDrop;

	@FindBy(id = "adjtype")
	private WebElement adjstTypeDrop;

	@FindBy(id = "adjustmntvalue")
	private WebElement adjstValueTxt;

	@FindBy(id = "adjustmntvalue_1")
	private WebElement adjstValueHHHTxt;

	@FindBy(id = "adjustmntvalue_2")
	private WebElement adjstValueMMTxt;

	@FindBy(id = "CboMnthYear")
	private WebElement periodDrop;

	@FindBy(id = "ddlMonth")
	private WebElement monthDrop;

	@FindBy(xpath = "//*[@id='ddlYear']")
	private WebElement yearDrop;

	@FindBy(xpath = "//*[@id='ddlYears']")
	private WebElement yearDrop2;

	@FindBy(xpath = "//*[@key='btnApply']")
	private WebElement applyBtn;

	///////////////
	public void manageOverflowLeave(String adjstType, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(usrId);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("AdjustmentType: "+adjstType+" UserId: "+data.get("UserId"));
			String userId = data.get("UserId");
			String leaveIdName = data.get("LeaveId-Name");
			String adjustmentValue = data.get("AdjustmentValue");
			String period = data.get("Period");
			String month = data.get("Month");
			String year = data.get("Year");
			element_Clear(usrId);
			element_InputTextUsingActionClass(usrId, userId);
			element_TextBoxToClickOnTab(usrId);
			pageLoadWaitng();
			element_DropDownSelectByvisibleText(leaveDrop, leaveIdName);
			Thread.sleep(500);
			element_DropDownSelectByvisibleText(adjstTypeDrop, adjstType);
			Thread.sleep(500);
			if (adjustmentValue != null) {
				if (adjustmentValue.contains(":")) {
					String[] adjValAr = adjustmentValue.split(":");
					logger.debug("adjValAr[0]" + adjValAr[0]);
					logger.debug("adjValAr[1]" + adjValAr[1]);
					element_Clear(adjstValueHHHTxt);
					element_InputTextUsingActionClass(adjstValueHHHTxt, adjValAr[0]);
					element_TextBoxToClickOnTab(adjstValueHHHTxt);
					element_Clear(adjstValueMMTxt);
					element_InputTextUsingActionClass(adjstValueMMTxt, adjValAr[1]);
					element_TextBoxToClickOnTab(adjstValueMMTxt);
				} else {
					element_Clear(adjstValueTxt);
					element_InputTextUsingActionClass(adjstValueTxt, adjustmentValue);
					element_TextBoxToClickOnTab(adjstValueTxt);
				}
			}
			if (period != null) {
				element_DropDownSelectByvisibleText(periodDrop, period);
				Thread.sleep(500);
			}
			if (month != null) {
				String convertMonth = staticMonthOrPlusMinusMonthFromCurrentMonth(month);
				element_DropDownSelectByvisibleText(monthDrop, convertMonth);
				Thread.sleep(500);
			}
			if (year != null) {
				if (period.equalsIgnoreCase("Yearly")) {
					String convertYear1 = staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(year);
					element_DropDownSelectByvisibleText(yearDrop2, convertYear1);
					Thread.sleep(500);
				} else {
					String convertYear2 = staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(year);
					element_DropDownSelectByvisibleText(yearDrop, convertYear2);
					Thread.sleep(500);
				}
			}
			Thread.sleep(500);
			element_Click(applyBtn);
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Assert.assertEquals(valMsg, "Saved Successfully");
		}
	}

}
