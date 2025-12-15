package PageObject.LeaveManagement;

import java.util.ArrayList;
import java.util.Iterator;
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
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class LeaveBalancePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(LeaveBalancePO.class);
	
	public LeaveBalancePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// ***************************ELEMENTS*****************
	@FindBy(id = "userID")
	private WebElement userIDTxt;

	@FindBy(id = "ddlPeriod")
	private WebElement periodDD;

	@FindBy(id = "ddlMnth")
	private WebElement monthDD;

	@FindBy(id = "ddlYear")
	private WebElement yearDD;

	@FindBy(xpath = "//*[@gridname='grddetail']//*[@default='Search']")
	private WebElement searchBar;

	@FindBy(xpath = "//*[@gridname='grddetail']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)]")
	private List<WebElement> row1data;

	@FindBy(xpath = "//*[@class='panel-group accordion_master1 btn-bottom']//*[@class='anchorclick']")
	private List<WebElement> cOffCollaps;

	@FindBy(xpath = "//*[@class='panel-heading accordion-heading']//*[text()='C-OFF']")
	private WebElement cOffCollapsClick;

	@FindBy(xpath = "//*[@gridname='grdcoffdetail']//*[@default='Search']")
	private WebElement searchBarCOff;

	@FindBy(xpath = "//*[@gridname='grdcoffdetail']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)]")
	private List<WebElement> cOff1RowData;

	@FindBy(xpath = "//*[@gridname='grdcoffdetail']//*[@class='table-responsive']/table/thead/tr/th[not(@hidden)]")
	private List<WebElement> coffTableHeader;

	@FindBy(xpath = "//*[@gridname='grdcoffdetail']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> cOffDetailsTable;

	@FindBy(xpath = "//*[@gridname='grdcoffdetail']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][1]")
	private WebElement cOffDetailsTableDate;

	@FindBy(id = "_fromDate")
	private WebElement fromDatTxt;

	@FindBy(id = "_toDate")
	private WebElement toDateTxt;

	@FindBy(xpath = "//*[@gridname='grdcoffdetail']//*[@key='No Data']")
	private WebElement labelNoData;

	@FindBy(xpath = "//*[@gridname='grdcoffdetail']//*[@default='Search']")
	private WebElement searchCOff;
	
	// ****************************FUNCTIONS*************************
	public ArrayList<String> leaveBalanceView(Map<String, String> data) throws InterruptedException {
		element_Clear(userIDTxt);
		Thread.sleep(1000);
		element_InputTextUsingActionClass(userIDTxt, data.get("UserID"));
		Thread.sleep(1000);
		element_TextBoxToClickOnTab(userIDTxt);
		pageLoadWaitng();
		if (data.get("Period") != null) {
			element_DropDownSelectByvisibleText(periodDD, data.get("Period"));
		}
		if (data.get("Period").equalsIgnoreCase("Monthly")) {
			String selectM = staticMonthOrPlusMinusMonthFromCurrentMonth(data.get("Month"));
			element_DropDownSelectByvisibleText(monthDD, selectM);
		}
		String selectY = staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(data.get("Year"));
		element_DropDownSelectByvisibleText(yearDD, selectY);
		Thread.sleep(1000);
		ArrayList<String> leaveBalanceData = new ArrayList<>();
		if (searchBar.isEnabled()) {
			element_Clear(searchBar);
			element_InputTextUsingActionClass(searchBar, data.get("LeaveName"));
			element_TextBoxToClickOnEnter(searchBar);
			Thread.sleep(1000);
			if (row1data.size() > 0) {
				for (WebElement balance : row1data) {
					String balance1 = balance.getText();
					leaveBalanceData.add(balance1);
				}
			} else {
				leaveBalanceData.add("No Data Found");
			}
		} else {
			leaveBalanceData.add("No Data Found");
		}
		logger.debug(leaveBalanceData);
		return leaveBalanceData;
	}

	public void cOffBalanceView(String userId, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(userIDTxt);
		element_Clear(userIDTxt);
		element_InputTextUsingActionClass(userIDTxt, userId);
		element_TextBoxToClickOnTab(userIDTxt);
		pageLoadWaitng();
		if (cOffCollaps.size() == 0) {
			element_Click(cOffCollapsClick);
			Thread.sleep(1500);
		}
		List<String> headerD = new ArrayList<>();
		List<List<String>> header = dataTable.asLists();
		for (int i = 0; i < 1; i++) {
			for (int j = 0; j < header.get(i).size(); j++) {
				if (header.get(i).get(j).equalsIgnoreCase("date") == false
						&& header.get(i).get(j).equalsIgnoreCase("CurrentDtTominusMonthDate") == false
						&& header.get(i).get(j).equalsIgnoreCase("ValidityFrom") == false
						&& header.get(i).get(j).equalsIgnoreCase("ValidityTo") == false
						&& header.get(i).get(j).equalsIgnoreCase("TableRecord") == false) {
					headerD.add(header.get(i).get(j));
				}
			}
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
			String date = null;
			String validityFromDate = null;
			String validityToDate = null;
			if (data.get("Date") != null) {
				date = staticDateOrPlusMinusFromCurrentDate(data.get("Date"));
			}
			if (data.get("ValidityFrom") != null) {
				validityFromDate = staticDateOrPlusMinusFromCurrentDate(data.get("ValidityFrom"));
			}
			if (data.get("CurrentDtTominusMonthDate") != null) {
				date = currentDt2minus1MonthDate(data.get("CurrentDtTominusMonthDate"));
				validityFromDate = currentDt2minus1MonthDate(data.get("CurrentDtTominusMonthDate"));
			}
			if (data.get("ValidityFrom") != null || data.get("CurrentDtTominusMonthDate") != null) {
				String getFromDate = fromDatTxt.getAttribute("value");
				Assert.assertEquals(getFromDate, validityFromDate);
			}
			if (data.get("ValidityTo") != null) {
				validityToDate = staticDateOrPlusMinusFromCurrentDate(data.get("ValidityTo"));
				String getToDate = toDateTxt.getAttribute("value");
				Assert.assertEquals(getToDate, validityToDate);
			}
			if (data.containsKey("TableRecord") && data.get("TableRecord") != null) {
				Assert.assertEquals(labelNoData.getText(), data.get("TableRecord"));
			} else {
				boolean dateFound;
				boolean coffTableFound;
				if (cOffDetailsTable.size() > 0) {
					element_Clear(searchCOff);
					element_InputTextUsingActionClass(searchCOff, date);
					element_TextBoxToClickOnEnter(searchCOff);
					List<String> allDate = new ArrayList<String>();
					Thread.sleep(250);
					for (int i = 0; i < cOffDetailsTable.size(); i++) {
						allDate.add(cOffDetailsTable.get(i).getText());
					}
					if (allDate.contains(date)) {
						for (int i = 0; i < cOffDetailsTable.size(); i++) {
							if (cOffDetailsTable.get(i).getText().equalsIgnoreCase(date)) {
								for (int j = 0; j < headerD.size(); j++) {
									String dynamicXpath = "following-sibling::td[" + headerIntValue(headerD.get(j))
											+ "]";
									String actualVal = cOffDetailsTable.get(i).findElement(By.xpath(dynamicXpath))
											.getText();
									if (data.get(headerD.get(j)) != null) {
										Assert.assertEquals(actualVal, data.get(headerD.get(j)));
									} else {
										if (actualVal.isEmpty() == true) {
											actualVal = null;
											Assert.assertEquals(actualVal, data.get(headerD.get(j)));
										} else {
											Assert.assertEquals(actualVal, data.get(headerD.get(j)));
										}
									}
								}
							}
						}
					} else {
						dateFound = false;
						logger.debug("Date Not Found");
						Assert.assertEquals(dateFound, true);
					}
				} else {
					coffTableFound = false;
					logger.debug("C-OFF Balance Table Not Found");
					Assert.assertEquals(coffTableFound, true);
				}
			}
		}
	}

	public int headerIntValue(String name) {
		int findValue = 0;
		for (int i = 1; i <= coffTableHeader.size(); i++) {
			if (coffTableHeader.get(i).getText().toUpperCase().equals(name.toUpperCase())) {
				findValue = i;
				break;
			}
		}
		return findValue;
	}

}
