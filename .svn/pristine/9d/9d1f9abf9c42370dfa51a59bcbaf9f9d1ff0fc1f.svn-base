package PageObject.TimeAndAttendance;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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

public class AttendanceSummaryPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AttendanceSummaryPO.class);
	
	public AttendanceSummaryPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// ***************************ELEMENTS************************
	@FindBy(id = "userID")
	private WebElement userIDTxt;

	@FindBy(xpath = "//*[@title='Re-Calculate Attendance Data (Alt+R)' or @title='Re-Calculate Attendance Data (Alt+Shift+R)']")
	private WebElement recalculateAtdData;

	@FindBy(id = "TxtAbsent")
	private WebElement absentCountTxt;

	@FindBy(id = "ddlMnth")
	private WebElement atdMonthDrop;

	@FindBy(id = "ddlYear")
	private WebElement atdYearDrop;

	@FindBy(xpath = "//*[contains(text(),'Details')]/ancestor::a[@class=\"anchorclick\"]")
	private List<WebElement> detailsCollaps;

	@FindBy(xpath = "//*[contains(text(),'Details')]/ancestor::a")
	private WebElement detailsCollapsClick;

	@FindBy(xpath = "//*[@id='div_grd_detailGrid']//*[@default='Search']")
	private WebElement searchBar;

	@FindBy(xpath = "//*[@id='div_grd_detailGrid']//table/tbody/tr[not(@hidden)]/td")
	private List<WebElement> detailsTableSingleRowData;

	// *************************FUNCTIONS**************************
	public boolean verifyMonthlyProcessedOrNot(String userID) throws InterruptedException {
		waitForElementVisible(userIDTxt);
		element_Clear(userIDTxt);
		element_dynamicDDSelect(userIDTxt, userID);
		element_TextBoxToClickOnTab(userIDTxt);
		pageLoadWaitng();
		element_Click(recalculateAtdData);
		Thread.sleep(1000);
		String absentCount = element_getInputControlValue(absentCountTxt);
		boolean monthlyProcessed = true;
		if (absentCount.equalsIgnoreCase("0.0")) {
			monthlyProcessed = false;
		}
		reloadPageButtonClick();
		return monthlyProcessed;

	}

	public void verifyUserAttendanceDetails(String userId, String atdMonth, String atdYear, DataTable dataTable)
			throws InterruptedException {
		waitForElementVisible(userIDTxt);
		element_Clear(userIDTxt);
		element_dynamicDDSelect(userIDTxt, userId);
		element_TextBoxToClickOnTab(userIDTxt);
		pageLoadWaitng();
		String convertedAtdMonth = staticMonthOrPlusMinusMonthFromCurrentMonth(atdMonth);
		String convertedAtdYear = staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(atdYear);
		element_DropDownSelectByvisibleText(atdMonthDrop, convertedAtdMonth);
		Thread.sleep(500);
		element_DropDownSelectByvisibleText(atdYearDrop, convertedAtdYear);
		Thread.sleep(500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Date: "+data.get("Date"));
			String date = data.get("Date");
			String shift = data.get("Shift");
			String firstIN = data.get("FirstIN");
			String lastOUT = data.get("LastOUT");
			String workHours = data.get("WorkHours");
			String extraWork = data.get("ExtraWork");
			String netWork = data.get("Net-Work");
			String breakHours = data.get("BreakHours");
			String totalOT = data.get("TotalOT");
			String lateIN = data.get("Late-IN");
			String earlyOUT = data.get("Early-OUT");
			String firstHalf = data.get("1stHalf");
			String secondHalf = data.get("2ndHalf");
			String remark = data.get("Remark");
			String convertedDate = staticDateOrPlusMinusFromCurrentDate(date);
			Thread.sleep(500);
			if (detailsCollaps.size() == 0) {
				element_Click(detailsCollapsClick);
				Thread.sleep(1000);
			}

			ArrayList<String> userDetails = new ArrayList<>();
			if (searchBar.isEnabled()) {
				element_Clear(searchBar);
				element_InputTextUsingActionClass(searchBar, convertedDate);
				element_TextBoxToClickOnEnter(searchBar);
				Thread.sleep(1000);
				if (detailsTableSingleRowData.size() > 0) {
					for (WebElement details : detailsTableSingleRowData) {
						String details1 = details.getText();
						userDetails.add(details1);
					}
				} else {
					userDetails.add("No Data Found");
				}
			} else {
				userDetails.add("No Data Found");
			}
			
			if (userDetails.size() == 1) {
				logger.info("No Data Found");
				Assert.assertEquals("Failed", "Pass");
			} else {
				String actShift = userDetails.get(1);
				if (shift != null) {
					Assert.assertEquals(actShift, shift);
				}
				String actFirstIn = userDetails.get(2);
				if (firstIN != null) {
					Assert.assertEquals(actFirstIn, firstIN);
				}
				String actLastOut = userDetails.get(3);
				if (lastOUT != null) {
					Assert.assertEquals(actLastOut, lastOUT);
				}
				String actWorkHrs = userDetails.get(4);
				if (workHours != null) {
					Assert.assertEquals(actWorkHrs, workHours);
				}
				String actExtraWork = userDetails.get(5);
				if (extraWork != null) {
					Assert.assertEquals(actExtraWork, extraWork);
				}
				String actNetWork = userDetails.get(6);
				if (netWork != null) {
					Assert.assertEquals(actNetWork, netWork);
				}
				String actBreakHours = userDetails.get(7);
				if (breakHours != null) {
					Assert.assertEquals(actBreakHours, breakHours);
				}
				String actTotalOT = userDetails.get(8);
				if (totalOT != null) {
					Assert.assertEquals(actTotalOT, totalOT);
				}
				String actLateIN = userDetails.get(9);
				if (lateIN != null) {
					Assert.assertEquals(actLateIN, lateIN);
				}
				String actEarlyOUT = userDetails.get(10);
				if (earlyOUT != null) {
					Assert.assertEquals(actEarlyOUT, earlyOUT);
				}
				String actFirstHalf = userDetails.get(11);
				if (firstHalf != null) {
					Assert.assertEquals(actFirstHalf, firstHalf);
				}
				String actSecondHalf = userDetails.get(12);
				if (secondHalf != null) {
					Assert.assertEquals(actSecondHalf, secondHalf);
				}
				String actRemark = userDetails.get(13);
				if (remark != null) {
					Assert.assertEquals(actRemark, remark);
				}
			}
		}
	}
}
