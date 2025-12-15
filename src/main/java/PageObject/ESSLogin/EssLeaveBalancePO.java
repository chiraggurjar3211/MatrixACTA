package PageObject.ESSLogin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class EssLeaveBalancePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssLeaveBalancePO.class);
	
	public EssLeaveBalancePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// ***************************ELEMENTS*****************
	@FindBy(id = "ddlPeriod")
	private WebElement periodDrop;

	@FindBy(id = "ddlMnth")
	private WebElement monthDrop;

	@FindBy(id = "ddlYear")
	private WebElement yearDrop;

	@FindBy(xpath = "//*[@id=\"collapseOne\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement searchBarLeaveBal;

	@FindBy(xpath = "//*[@id='collapseOne']//table/tbody/tr/td[not(@hidden)]")
	private List<WebElement> oneRowData;

	@FindBy(xpath = "//*[@default=\"C-OFF\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> coffPanelOpenOrNot;

	@FindBy(xpath = "//*[@default=\"C-OFF\"]")
	private WebElement coffPanel;

	@FindBy(xpath = "//*[@id='collapseTwo']//table/thead/tr/th[not(@hidden)]")
	private List<WebElement> coffTableHeader;

	@FindBy(xpath = "//*[@id='collapseTwo']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> coffDetailsTable;

	@FindBy(id = "_fromDate")
	private WebElement fromDatTxt;

	@FindBy(id = "_toDate")
	private WebElement toDateTxt;

	@FindBy(xpath = "//*[@gridname=\"grdcoffdetail\"]//*[@key=\"No Data\"]")
	private WebElement labelNoData;

	///////////////////////

	public void essLeaveBalance(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(periodDrop);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Period: "+data.get("Period"));
			String period = data.get("Period");
			String month = data.get("Month");
			String year = data.get("Year");
			String leaveName = data.get("LeaveName");
			String opening = data.get("Opening");
			String credit = data.get("Credit");
			String debit = data.get("Debit");
			String encashment = data.get("Encashment");
			String availed = data.get("Availed");
			String closing = data.get("Closing");
			String overflow = data.get("Overflow");
			String convertMonth = null;
			String convertYear = null;
			element_DropDownSelectByvisibleText(periodDrop, period);
			Thread.sleep(500);
			if (month != null) {
				convertMonth = staticMonthOrPlusMinusMonthFromCurrentMonth(month);
				element_DropDownSelectByvisibleText(monthDrop, convertMonth);
				Thread.sleep(500);
			}
			if (year != null) {
				convertYear = staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(year);
				element_DropDownSelectByvisibleText(yearDrop, convertYear);
				Thread.sleep(500);
			}

			ArrayList<String> leaveBalanceData = new ArrayList<>();
			if (searchBarLeaveBal.isEnabled()) {
				element_Clear(searchBarLeaveBal);
				element_InputTextUsingActionClass(searchBarLeaveBal, leaveName);
				element_TextBoxToClickOnEnter(searchBarLeaveBal);
				Thread.sleep(1000);
				if (oneRowData.size() > 0) {
					for (WebElement balance : oneRowData) {
						String balance1 = balance.getText();
						leaveBalanceData.add(balance1);
					}
				} else {
					leaveBalanceData.add("No Data Found");
				}
			} else {
				leaveBalanceData.add("No Data Found");
			}
			if (leaveBalanceData.size() == 1) {
				logger.debug("Leave Balance Not Found");
				Assert.assertEquals("Failed", "Pass");
			} else {
				if (period.equalsIgnoreCase("Monthly")) {
					String actualOpening = leaveBalanceData.get(4);
					if (opening != null) {
						Assert.assertEquals(actualOpening, opening);
					}
					String actualCredit = leaveBalanceData.get(5);
					if (credit != null) {
						Assert.assertEquals(actualCredit, credit);
					}
					String actualDebit = leaveBalanceData.get(6);
					if (debit != null) {
						Assert.assertEquals(actualDebit, debit);
					}
					String actualEncashment = leaveBalanceData.get(7);
					if (encashment != null) {
						Assert.assertEquals(actualEncashment, encashment);
					}
					String actualAvailed = leaveBalanceData.get(8);
					if (availed != null) {
						Assert.assertEquals(actualAvailed, availed);
					}
					String actualClosing = leaveBalanceData.get(9);
					if (closing != null) {
						Assert.assertEquals(actualClosing, closing);
					}
					String actualOverflow = leaveBalanceData.get(10);
					if (actualOverflow.contains(".00")==false && actualOverflow.contains(":") == false){
						actualOverflow =actualOverflow+".00";
						logger.info("Hello1= "+actualOverflow);
					}
					if (overflow != null) {
						logger.info("Hello= "+actualOverflow);
						Assert.assertEquals(actualOverflow, overflow);
					}
				} else {
					String actualOpening = leaveBalanceData.get(3);
					if (opening != null) {
						Assert.assertEquals(actualOpening, opening);
					}
					String actualCredit = leaveBalanceData.get(4);
					if (credit != null) {
						Assert.assertEquals(actualCredit, credit);
					}
					String actualDebit = leaveBalanceData.get(5);
					if (debit != null) {
						Assert.assertEquals(actualDebit, debit);
					}
					String actualEncashment = leaveBalanceData.get(6);
					if (encashment != null) {
						Assert.assertEquals(actualEncashment, encashment);
					}
					String actualAvailed = leaveBalanceData.get(7);
					if (availed != null) {
						Assert.assertEquals(actualAvailed, availed);
					}
					String actualClosing = leaveBalanceData.get(8);
					if (closing != null) {
						Assert.assertEquals(actualClosing, closing);
					}
					String actualOverflow = leaveBalanceData.get(9);
					if (actualOverflow.contains(".00")==false && actualOverflow.contains(":") == false){
						actualOverflow =actualOverflow+".00";
						logger.info("Hello1= "+actualOverflow);
					}
					if (overflow != null) {
						logger.info("Hello= "+actualOverflow);
						Assert.assertEquals(actualOverflow, overflow);
					}
				}
			}

			// Assert.assertEquals(actual, data.get("Validation"));
		}
	}

	public void essCOFFBalanceView(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		if (coffPanelOpenOrNot.size() > 0) {
			element_Click(coffPanel);
			Thread.sleep(1000);
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
			logger.info("Date: "+data.get("Date"));
			logger.debug(data.get("Date"));
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
				if (coffDetailsTable.size() > 0) {
					List<String> allDate = new ArrayList<String>();
					for (int i = 0; i < coffDetailsTable.size(); i++) {
						allDate.add(coffDetailsTable.get(i).getText());
					}
					if (allDate.contains(date)) {
						for (int i = 0; i < coffDetailsTable.size(); i++) {
							if (coffDetailsTable.get(i).getText().equalsIgnoreCase(date)) {
								for (int j = 0; j < headerD.size(); j++) {
									String dynamicXpath = "following-sibling::td[" + headerIntValue(headerD.get(j))+ "]";
									String actualVal = coffDetailsTable.get(i).findElement(By.xpath(dynamicXpath))
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
