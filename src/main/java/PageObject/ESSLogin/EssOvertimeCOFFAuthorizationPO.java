	package PageObject.ESSLogin;

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
import PageObject.PageObjectModel;
import groovy.transform.Final;
import io.cucumber.datatable.DataTable;

public class EssOvertimeCOFFAuthorizationPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(EssOvertimeCOFFAuthorizationPO.class);
	
	public EssOvertimeCOFFAuthorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

//Elements
	@FindBy(id = "CboPeriod")
	private WebElement periodDrop;

	@FindBy(id = "_fromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_toDate")
	private WebElement toDateTxt;

	@FindBy(id = "CboMonth")
	private WebElement month;

	@FindBy(id = "CboYear")
	private WebElement year;

	@FindBy(id = "CboAuthFor")
	private WebElement authorizationForDrop;

	@FindBy(xpath = "//*[@key='btnView']")
	private WebElement viewBtn;

	
	@FindBy(xpath = "//*[contains(text(),'Authorized')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> authorizedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Authorized')]/ancestor::a")
	private WebElement authorizedPanel;

	@FindBy(xpath = "//*[contains(text(),'Error List')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> errorListPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Error List')]/ancestor::a")
	private WebElement errorListPanel;

	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[@placeholder='Search']")
	private WebElement searchBox;

	@FindBy(xpath = "//*[@class='panel-collapse collapse panel-collapse-custom show']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> singleRecordPendingTabTable;

	@FindBy(xpath = "//*[@class='panel-collapse collapse panel-collapse-custom show']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]")
	private List<WebElement> multRecordPendingTabTable;

	@FindBy(xpath = "//*[@class='panel-collapse collapse panel-collapse-custom show']//*[@key='Define and Authorize']")
	private WebElement defineAndAuthorizeBtn;

	@FindBy(xpath = "//*[@id='collapseTwo']//table/tbody/tr[not(@hidden)]/td[1]")
	private List<WebElement> authorizedTable;
	
	@FindBy(xpath = "//*[@id='collapseTwo']//table/tbody/tr[not(@hidden)]/td[1]")
	private List<WebElement> authorizedTable1;

	@FindBy(xpath = "//*[@id='collapseThree']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> errorListTable;
	
	//////// Configure Authorization Parameters Page elements////////////
	@FindBy(xpath = "//*[@key='Configure Authorization Parameters']/label")
	private WebElement pageHeading;

	@FindBy(id = "SelectedCboAuthorizeFor")
	private WebElement authorizeDrop;

	@FindBy(id = "SelectedCboOTMode")
	private WebElement authorizationModeDrop;

	@FindBy(id = "SelectedAuthInTermsOf")
	private WebElement authInTermsOfDrop;

	@FindBy(id = "SelectedOperation")
	private WebElement selectOTCOFFDrop;

	@FindBy(xpath = "//input[contains(@key,'OTTime')]")
	private List<WebElement> otPercentageXpath;

	@FindBy(xpath = "//input[contains(@key,'COFFTime')]")
	private List<WebElement> coffPercentageXpath;

	@FindBy(xpath = "//input[contains(@id,'OTTime') and @placeholder='HHH']")
	private List<WebElement> otHoursHHH;

	@FindBy(xpath = "//input[contains(@id,'OTTime') and @placeholder='MM']")
	private List<WebElement> otHoursMM;

	@FindBy(xpath = "//input[contains(@id,'COFFTime') and @placeholder='HHH']")
	private List<WebElement> coffHoursHHH;

	@FindBy(xpath = "//input[contains(@id,'COFFTime') and @placeholder='MM']")
	private List<WebElement> coffHoursMM;

	@FindBy(xpath = "//*[@default='RecordWiseOT']")
	private WebElement authOTHrsRecordWiseTxt;

	@FindBy(xpath = "//*[@default='RecordWiseCOFF']")
	private WebElement authCOFFHrsRecordWiseTxt;

	@FindBy(id = "RecordWiseOT_1")
	private WebElement authOTHrsRecordWiseTxtHHH;

	@FindBy(id = "RecordWiseOT_2")
	private WebElement authOTHrsRecordWiseTxtMM;

	@FindBy(xpath = "//fieldset[not(@hidden)]//*[@id='RecordWiseCOFF_1']")
	private WebElement authCOFFHrsRecordWiseTxtHHH;

	@FindBy(id = "ok")
	private WebElement authorizeBtn;

	@FindBy(xpath = "//*[@class=\"modal-dialog modal-sm\"]//*[@id='ok']")
	private WebElement popUPADDButton;

	@FindBy(xpath = "//*[@class=\"modal-dialog modal-sm\"]//*[@id='ok']")
	private List<WebElement> popUPADDButtonSize;
	
	@FindBy(xpath = "//*[contains(text(),'Pending')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> pendingPanelClosed;

	@FindBy(xpath = "//*[contains(text(),'Pending')]/ancestor::a")
	private WebElement pendingPanel;
	
	@FindBy(xpath = "//*[@id='collapseOne']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingTable;
	
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[@default=\"No Data\"]/label")
	private WebElement labelNoData;
	
	@FindBy(xpath = "//*[@id=\"div_grd_grdApprovalDetails\"]//table/tbody/tr//td[not(@hidden)][1]")
	private List<WebElement> approvalDetailsTable;
	
	@FindBy(xpath = "//*[@class='modal-footer modal-popup-footer']//*[@default='Close']")
	private WebElement closeBtnAprvalDetailsPage;
	
/////////////////////////

	public void singleRecordOTCOffAuthorizationRIC(String authFor, String period, String fromDt, String toDt,
			DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		element_DropDownSelectByvisibleText(periodDrop, period);
		if (period.equalsIgnoreCase("Daily")) {
			String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDt);
			String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDt);
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
			Thread.sleep(500);
			element_Clear(toDateTxt);
			element_InputTextUsingActionClass(toDateTxt, convertToDt);
			Thread.sleep(500);
		} else {
			String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(fromDt);
			element_DropDownSelectByvisibleText(month, month1);
			String year1 = staticYearOrPlusMinusYearFromCurrentYear(fromDt, toDt);
			element_DropDownSelectByvisibleText(year, year1);
			Thread.sleep(500);
		}
		element_DropDownSelectByvisibleText(authorizationForDrop, authFor);
		element_Click(viewBtn);
		Thread.sleep(700);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+"Date: "+data.get("Date"));
			String actValMsg = null;
			String panelName = data.get("PanelName");
			String userId = data.get("UserID");
			String date = data.get("Date");
			String otType = data.get("OTType");
			String otHours = data.get("OTHours");
			String authAsOT = data.get("AuthAsOT");
			String authAsCOFF = data.get("AuthAsCOFF");
			String validation = data.get("Validation");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(date);
			if (panelName != null) {
				if (panelName.equalsIgnoreCase("Authorized")) {
					if (authorizedPanelOpenOrNot.size() >0) {
						element_Click(authorizedPanel);
						Thread.sleep(1000);
					}
				}
			}
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userId);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(3000);
			for (int i = 0; i < singleRecordPendingTabTable.size(); i++) {
				String getUserId = singleRecordPendingTabTable.get(i).getText();
				String getAppDate = singleRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[2]"))
						.getText();
				String getOTType = singleRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[4]"))
						.getText();
				String getOTHours = singleRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[5]"))
						.getText();
				if (getUserId.equalsIgnoreCase(userId) && getAppDate.equalsIgnoreCase(convertDate)
						&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours)) {
					singleRecordPendingTabTable.get(i).click();
					Thread.sleep(1000);
					if (authAsOT != null) {
						WebElement authAsOTTxt = singleRecordPendingTabTable.get(i)
								.findElement(By.xpath("following-sibling::td[6]"));
						if(authAsOT.equalsIgnoreCase("false")) {
							boolean authAsOTBool = Boolean.parseBoolean(authAsOT);
							Assert.assertEquals(false, authAsOTBool);
						}else if (authAsOTTxt.isEnabled() == true) {
							String[] authAsOTSplit = authAsOT.split(":");
							List<WebElement> ot = singleRecordPendingTabTable.get(i)
									.findElements(By.xpath("following-sibling::td[6]//input"));
							for (int k = 0; k < ot.size(); k++) {
								ot.get(k).clear();
								ot.get(k).sendKeys(authAsOTSplit[k]);
								Thread.sleep(500);
							}
						}
					} 
					if (authAsCOFF != null) {
						if ( authorizedPanelOpenOrNot.size()>0) {
							WebElement authAsCOffTxt = singleRecordPendingTabTable.get(i)
									.findElement(By.xpath("following-sibling::td[7]"));
							if(authAsCOFF.equalsIgnoreCase("false")) {
								boolean authAsCOFFBool = Boolean.parseBoolean(authAsCOFF);
								Assert.assertEquals(false, authAsCOFFBool);
							}else if (authAsCOffTxt.isEnabled() == true) {
								String[] authAsCOFFsplit = authAsCOFF.split(":");
								List<WebElement> co = singleRecordPendingTabTable.get(i)
										.findElements(By.xpath("following-sibling::td[7]//input"));
								for (int k = 0; k < co.size(); k++) {
									co.get(k).clear();
									co.get(k).sendKeys(authAsCOFFsplit[k]);
									Thread.sleep(500);
								}
							}
						} else {
							WebElement authAsCOffTxt = singleRecordPendingTabTable.get(i)
									.findElement(By.xpath("following-sibling::td[8]"));
							if(authAsCOFF.equalsIgnoreCase("false")) {
								boolean authAsCOFFBool = Boolean.parseBoolean(authAsCOFF);
								Assert.assertEquals(false, authAsCOFFBool);
							}else if (authAsCOffTxt.isEnabled() == true) {
								String[] authAsCOFFsplit = authAsCOFF.split(":");
								List<WebElement> co = singleRecordPendingTabTable.get(i)
										.findElements(By.xpath("following-sibling::td[8]//input"));
								for (int k = 0; k < co.size(); k++) {
									co.get(k).clear();
									co.get(k).sendKeys(authAsCOFFsplit[k]);
									Thread.sleep(500);
								}
							}
						}

					}
					Thread.sleep(1000);
					if ( authorizedPanelOpenOrNot.size()>0) {
						singleRecordPendingTabTable.get(i)
								.findElement(By
										.xpath("following-sibling::td[11]/a[@id='savebtn' and not(@hidden)]"))
								.click();
					} else {
						singleRecordPendingTabTable.get(i)
								.findElement(By
										.xpath("following-sibling::td[14]/a[@id='savebtn' and  not(@hidden)]"))
								.click();
					}
					Thread.sleep(1000);
					actValMsg = validationMessage();
					break;
				}
			}
			Assert.assertEquals(actValMsg, validation);
		}
	}

	public void multipleRecordsOTCOFFAuthRIC(String authFor, String period, String fromDt, String toDt,
			DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		element_DropDownSelectByvisibleText(periodDrop, period);
		if (period.equalsIgnoreCase("Daily")) {
			String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDt);
			String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDt);
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
			Thread.sleep(500);
			element_Clear(toDateTxt);
			element_InputTextUsingActionClass(toDateTxt, convertToDt);
			Thread.sleep(500);
		} else {
			String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(fromDt);
			element_DropDownSelectByvisibleText(month, month1);
			String year1 = staticYearOrPlusMinusYearFromCurrentYear(fromDt, toDt);
			element_DropDownSelectByvisibleText(year, year1);
			Thread.sleep(500);
		}
		element_DropDownSelectByvisibleText(authorizationForDrop, authFor);
		element_Click(viewBtn);
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+"Date: "+data.get("Date"));
			String panelName = data.get("PanelName");
			String userId = data.get("UserID");
			String date = data.get("Date");
			String otType = data.get("OTType");
			String otHours = data.get("OTHours");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(date);
			if (panelName != null) {
				if (panelName.equalsIgnoreCase("Authorized")) {
					if (authorizedPanelOpenOrNot.size() > 0) {
						element_Click(authorizedPanel);
					}
					Thread.sleep(1000);
				}
			}
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userId);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(5000);
			for (int i = 0; i < multRecordPendingTabTable.size(); i++) {
				String getUserID = multRecordPendingTabTable.get(i).getText();
				String getAppDate = multRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[2]"))
						.getText();
				String getOTType = multRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[4]"))
						.getText();
				String getOTHours = multRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[5]"))
						.getText();
				if (getUserID.equalsIgnoreCase(userId) && getAppDate.equalsIgnoreCase(convertDate)
						&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours)) {
					WebElement chk = multRecordPendingTabTable.get(i).findElement(By.xpath(
							"preceding::td[not(@hidden)][1]//input"));
					element_Click(chk);
					break;
				}
			}
		}
		Thread.sleep(1000);
		element_Click(defineAndAuthorizeBtn);
		pageLoadWaitng();
		String getPageHeading = pageHeading.getText();
		Thread.sleep(1000);
		Assert.assertEquals(getPageHeading, "Configure Authorization Parameters");
	}

	public String configAuthParameters(DataTable dataTable) throws InterruptedException {
		String actMsg = null;
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Authorize: "+data.get("Authorize"));
			String authorize = data.get("Authorize");
			String authorizationMode = data.get("AuthorizationMode");
			String authorizeInTermsOf = data.get("AuthorizeInTermsOf");
			String otCOff = data.get("OT/COff");
			String defineHoursforOT = data.get("DefineHoursforOT");
			String defineHoursforCOFF = data.get("DefineHoursforCOFF");
			String authHrsforEachRecordAsOT = data.get("AuthHrsforEachRecordAsOT");
			String authHrsforEachRecordAsCOff = data.get("AuthHrsforEachRecordAsCOff");
			String validation = data.get("Validation");
			element_DropDownSelectByvisibleText(authorizeDrop, authorize);
			Thread.sleep(500);
			element_DropDownSelectByvisibleText(authorizationModeDrop, authorizationMode);
			Thread.sleep(500);
			element_DropDownSelectByvisibleText(authInTermsOfDrop, authorizeInTermsOf);
			Thread.sleep(700);
			if (otCOff != null && element_isDisplayed(selectOTCOFFDrop) == true) {
				element_DropDownSelectByvisibleText(selectOTCOFFDrop, otCOff);
				Thread.sleep(500);
			}
			if (authorizationMode.equalsIgnoreCase("OT Type-Wise") && authorizeInTermsOf.equalsIgnoreCase("Percentage")) {
				if (defineHoursforOT != null) {
					String[] defineHoursforOTFsplit = defineHoursforOT.split(",");
					for (int k = 0; k < defineHoursforOTFsplit.length; k++) {
						if (defineHoursforOTFsplit[k].length() > 0 && defineHoursforOTFsplit[k].isEmpty() != true) {
							if (element_isEnabled(otPercentageXpath.get(k)) == true) {
								otPercentageXpath.get(k).sendKeys(Keys.CONTROL + "a");
								otPercentageXpath.get(k).sendKeys(Keys.DELETE);
								otPercentageXpath.get(k).sendKeys(defineHoursforOTFsplit[k]);
								element_TextBoxToClickOnTab(otPercentageXpath.get(k));
								Thread.sleep(500);
							}
						}
					}
				}
				if (defineHoursforCOFF != null) {
					String[] defineHoursforOTFsplit = defineHoursforCOFF.split(",");
					for (int j = 0; j < defineHoursforOTFsplit.length; j++) {
						if (defineHoursforOTFsplit[j].length() > 0 && defineHoursforOTFsplit[j].isEmpty() != true) {
							if (element_isEnabled(coffPercentageXpath.get(j)) == true) {
								coffPercentageXpath.get(j).sendKeys(Keys.CONTROL + "a");
								coffPercentageXpath.get(j).sendKeys(Keys.DELETE);
								coffPercentageXpath.get(j).sendKeys(defineHoursforOTFsplit[j]);
								Thread.sleep(500);
							}
						}
					}
				}
			}
			if (authorizationMode.equalsIgnoreCase("OT Type-Wise") && authorizeInTermsOf.equalsIgnoreCase("Hours")) {
				if (defineHoursforOT != null) {
					String[] defineHoursforOTsplit = defineHoursforOT.split(",");
					for (int i = 0; i < defineHoursforOTsplit.length; i++) {
						if (defineHoursforOTsplit[i].length() > 0) {
							String mm = null;
							String hhh = null;
							if (defineHoursforOTsplit[i].length() == 5) {
								mm = defineHoursforOTsplit[i].substring(defineHoursforOTsplit[i].length() - 2);
								hhh = defineHoursforOTsplit[i].substring(0, defineHoursforOTsplit[i].length() - 2);
								// for (int j = 0; j < otHoursHHH.size(); j++) {
								if (element_isEnabled(otHoursHHH.get(i)) == true) {
									otHoursHHH.get(i).sendKeys(Keys.CONTROL + "a");
									otHoursHHH.get(i).sendKeys(Keys.DELETE);
									otHoursHHH.get(i).sendKeys(hhh);
									Thread.sleep(500);
									otHoursMM.get(i).sendKeys(Keys.CONTROL + "a");
									otHoursMM.get(i).sendKeys(Keys.DELETE);
									otHoursMM.get(i).sendKeys(mm);
									element_TextBoxToClickOnTab(otHoursMM.get(i));
									Thread.sleep(500);
									// break;
								}
								// }
							}
						}
					}
				}

				if (defineHoursforCOFF != null) {
					String[] defineHoursforCOFFsplit = defineHoursforCOFF.split(",");
					for (int i = 0; i < defineHoursforCOFFsplit.length; i++) {
						if (defineHoursforCOFFsplit[i].length() > 0) {
							String mm = null;
							String hhh = null;
							if (defineHoursforCOFFsplit[i].length() == 5) {
								mm = defineHoursforCOFFsplit[i].substring(defineHoursforCOFFsplit[i].length() - 2);
								hhh = defineHoursforCOFFsplit[i].substring(0, defineHoursforCOFFsplit[i].length() - 2);
								// for (int j = 0; j < otHoursHHH.size(); j++) {
								if (element_isEnabled(coffHoursHHH.get(i)) == true) {
									coffHoursHHH.get(i).sendKeys(Keys.CONTROL + "a");
									coffHoursHHH.get(i).sendKeys(Keys.DELETE);
									coffHoursHHH.get(i).sendKeys(hhh);
									Thread.sleep(500);
									coffHoursMM.get(i).sendKeys(Keys.CONTROL + "a");
									coffHoursMM.get(i).sendKeys(Keys.DELETE);
									coffHoursMM.get(i).sendKeys(mm);
									element_TextBoxToClickOnTab(coffHoursMM.get(i));
									Thread.sleep(500);
									// break;
								}
								// }
							}
						}
					}
				}
			}
			if (authorizationMode.equalsIgnoreCase("Record-Wise")
					&& authorizeInTermsOf.equalsIgnoreCase("Percentage")) {
				if (authHrsforEachRecordAsOT != null) {
					authOTHrsRecordWiseTxt.sendKeys(Keys.CONTROL + "a");
					authOTHrsRecordWiseTxt.sendKeys(Keys.DELETE);
					//element_Clear(authOTHrsRecordWiseTxt);
					Thread.sleep(500);
					element_InputTextUsingActionClass(authOTHrsRecordWiseTxt, authHrsforEachRecordAsOT);
					Thread.sleep(500);
				}
				if (authHrsforEachRecordAsCOff != null) {
					//element_Clear(authCOFFHrsRecordWiseTxt);
					authCOFFHrsRecordWiseTxt.sendKeys(Keys.CONTROL + "a");
					authCOFFHrsRecordWiseTxt.sendKeys(Keys.DELETE);
					Thread.sleep(500);
					element_InputTextUsingActionClass(authCOFFHrsRecordWiseTxt, authHrsforEachRecordAsCOff);
					Thread.sleep(500);
				}
			}
			if (authorizationMode.equalsIgnoreCase("Record-Wise") && authorizeInTermsOf.equalsIgnoreCase("Hours")) {
				if (authHrsforEachRecordAsOT != null) {
					String mm = null;
					String hhh = null;
					if (authHrsforEachRecordAsOT.length() == 5) {
						mm = authHrsforEachRecordAsOT.substring(authHrsforEachRecordAsOT.length() - 2);
						hhh = authHrsforEachRecordAsOT.substring(0, authHrsforEachRecordAsOT.length() - 2);
					}
					element_Clear(authOTHrsRecordWiseTxtHHH);
					element_InputTextUsingActionClass(authOTHrsRecordWiseTxtHHH, hhh);
					element_TextBoxToClickOnTab(authOTHrsRecordWiseTxtHHH);
					Thread.sleep(1000);
					element_Clear(authOTHrsRecordWiseTxtMM);
					element_InputTextUsingActionClass(authOTHrsRecordWiseTxtMM, mm);
					Thread.sleep(1000);
				}
				if (authHrsforEachRecordAsCOff != null) {
					String mm = null;
					String hhh = null;
					if (authHrsforEachRecordAsCOff.length() == 5) {
						mm = authHrsforEachRecordAsCOff.substring(authHrsforEachRecordAsCOff.length() - 2);
						hhh = authHrsforEachRecordAsCOff.substring(0, authHrsforEachRecordAsCOff.length() - 2);
					}
					element_Clear(authCOFFHrsRecordWiseTxtHHH);
					element_InputTextUsingActionClass(authCOFFHrsRecordWiseTxtHHH, hhh);
					element_TextBoxToClickOnTab(authCOFFHrsRecordWiseTxtHHH);
					Thread.sleep(1000);
					WebElement authCOFFHrsRecordWiseTxtMM = authCOFFHrsRecordWiseTxtHHH.findElement(By.xpath("following::input"));
					element_Clear(authCOFFHrsRecordWiseTxtMM);
					element_InputTextUsingActionClass(authCOFFHrsRecordWiseTxtMM, mm);
					Thread.sleep(1000);
				}
			}
			Thread.sleep(1000);
			element_Click(authorizeBtn);
			Thread.sleep(1500);
			if (popUPADDButtonSize.size() > 0) {
				element_Click(popUPADDButton);
				Thread.sleep(1500);
			}
			
			actMsg = validationMessage();
			Assert.assertEquals(actMsg, validation);
		}
		return actMsg;
	}

	public void validateOTCOFF(String period, String fromDt, String toDt, DataTable dataTable)
			throws InterruptedException {
		waitForElementVisible(fromDateTxt);
		element_DropDownSelectByvisibleText(periodDrop, period);
		if (period.equalsIgnoreCase("Daily")) {
			String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDt);
			String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDt);
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
			Thread.sleep(500);
			element_Clear(toDateTxt);
			element_InputTextUsingActionClass(toDateTxt, convertToDt);
			Thread.sleep(500);
		} else {
			String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(fromDt);
			element_DropDownSelectByvisibleText(month, month1);
			String year1 = staticYearOrPlusMinusYearFromCurrentYear(fromDt, toDt);
			element_DropDownSelectByvisibleText(year, year1);
			Thread.sleep(500);
		}
		element_Click(viewBtn);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
			String actStatus = null;
			String convertDate = null;
			String panelName = data.get("PanelName");
			String userID = data.get("UserID");
			String date = data.get("Date");
			String otType = data.get("OTType");
			String otHours = data.get("OTHours");
			String authAsOT = data.get("AuthAsOT");
			String authAsCOFF = data.get("AuthAsCOFF");
			String expStatus = data.get("Status");
			if(date != null) {
				convertDate = staticDateOrPlusMinusFromCurrentDate(date);
			}
			Thread.sleep(500);
			if (panelName.equalsIgnoreCase("Authorized")) {
				if (authorizedPanelOpenOrNot.size() >0) {
					element_Click(authorizedPanel);
				}
				if(element_isEnabled(searchBox)) {
					element_Clear(searchBox);
					element_InputTextUsingActionClass(searchBox, userID);
					element_TextBoxToClickOnEnter(searchBox);
					for (int i = 0; i < authorizedTable.size(); i++) {
						String getUsrId = authorizedTable.get(i).getText();
						String getDate = authorizedTable.get(i).findElement(By.xpath("following-sibling::td[2]/label"))
								.getText();
						String getOTType = authorizedTable.get(i).findElement(By.xpath("following-sibling::td[4]/label"))
								.getText();
						String getOTHours = authorizedTable.get(i).findElement(By.xpath("following-sibling::td[5]/label"))
								.getText();
						String getAuthAsOT = authorizedTable.get(i).findElement(By.xpath("following-sibling::td[6]/label"))
								.getText();
						String getAuthAsCOFF = authorizedTable.get(i).findElement(By.xpath("following-sibling::td[8]/label"))
								.getText();
						System.out.println("Expected: "+userID+convertDate+otType+otHours);
						System.out.println("Acyual: "+getUsrId+getDate+getOTType+getOTHours);
						boolean authCheck=false;
						if (getUsrId.equalsIgnoreCase(userID) && getDate.equalsIgnoreCase(convertDate)
								&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours)) {
							System.out.println("A");
							if(authAsOT != null && authAsCOFF != null) {
								if (authAsOT.equalsIgnoreCase(getAuthAsOT) && authAsCOFF.equalsIgnoreCase(getAuthAsCOFF)) {
									actStatus = "Authorized";
									Thread.sleep(250);
									authCheck=true;
									//break;
								}
							}else if (authAsOT != null) {
								if (authAsOT.equalsIgnoreCase(getAuthAsOT)) {
									actStatus = "Authorized";
									Thread.sleep(250);
									authCheck=true;
									//break;
								}
							}else if (authAsCOFF != null) {
								if (authAsCOFF.equalsIgnoreCase(getAuthAsCOFF)) {
									actStatus = "Authorized";
									Thread.sleep(250);
									authCheck=true;
									//break;
								}
							}
							else if(authAsOT==null && authAsCOFF==null){
								actStatus = "Authorized"; //not displayed "Auth as OT/Auth as C-OFF" in RIC login while Approval Policy= All Sequential  
								Thread.sleep(250);
								authCheck=true;
							}
							if(data.get("AuthBy") != null) {
								String getAuthBy = authorizedTable.get(i).findElement(By.xpath("following-sibling::td[10]/label"))
										.getText();
								Thread.sleep(250);
								Assert.assertEquals(getAuthBy, data.get("AuthBy"));
								authCheck=true;
							}
							Assert.assertEquals(authCheck, true);
							break;
						}else {
							System.out.println("B");
							actStatus = "No Authorization";
							Thread.sleep(1000);
						}
					}
					
				}else {
					actStatus = "No Authorization";
				}
			Assert.assertEquals(actStatus, expStatus);
			}else if(panelName.equalsIgnoreCase("Pending")) {
				if(pendingPanelClosed.size() > 0) {
					element_Click(pendingPanel);
				}
				if(pendingTable.size() > 0) {
					element_Clear(searchBox);
					element_InputTextUsingActionClass(searchBox, userID);
					element_TextBoxToClickOnEnter(searchBox);
					for (int i = 0; i < pendingTable.size(); i++) {
						String getUsrId = pendingTable.get(i).getText();
						String getDate = pendingTable.get(i).findElement(By.xpath("following-sibling::td[2]/label"))
								.getText();
						String getOTType = pendingTable.get(i).findElement(By.xpath("following-sibling::td[4]/label"))
								.getText();
						String getOTHours = pendingTable.get(i).findElement(By.xpath("following-sibling::td[5]/label"))
								.getText();
					 if (getUsrId.equalsIgnoreCase(userID) && getDate.equalsIgnoreCase(convertDate)
								&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours)) {
						 actStatus = "Pending";
							break;
						}else {
							actStatus = "No Authorization";
						}
					}
					Assert.assertEquals(actStatus, expStatus);
				}else {
					actStatus = "No Authorization";
					//String actualRes = element_GetText(labelNoData);
					Assert.assertEquals(actStatus, expStatus);
					logger.info("No Authorization");
				}
			}
		}
	}
	
	public void verifyErrorListFromRIC(DataTable dataTable) throws InterruptedException {
		Thread.sleep(2000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+"Date: "+data.get("Date"));
			String actErrorDescription = null;
			String userID = data.get("UserID");
			String date = data.get("Date");
			String otType = data.get("OTType");
			String otHours = data.get("OTHours");
			String expErrorDescription = data.get("ErrorDescription");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(date);
			if (errorListPanelOpenOrNot.size() > 0) {
				element_Click(errorListPanel);
			}
			Thread.sleep(1500);
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userID);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1500);
			for (int i = 0; i < errorListTable.size(); i++) {
				String getUsrId = errorListTable.get(i).getText();
				String getDate = errorListTable.get(i).findElement(By.xpath("following-sibling::td[2]"))
						.getText();
				String getOTType = errorListTable.get(i).findElement(By.xpath("following-sibling::td[3]"))
						.getText();
				String getOTHours = errorListTable.get(i).findElement(By.xpath("following-sibling::td[4]"))
						.getText();
				String getErrorDescription = errorListTable.get(i).findElement(By.xpath("following-sibling::td[5]"))
						.getText();
				logger.debug("getErrorDescription = "+getErrorDescription);
				if (getUsrId.equalsIgnoreCase(userID) && getDate.equalsIgnoreCase(convertDate)
						&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours) && expErrorDescription.equalsIgnoreCase(getErrorDescription)) {
							actErrorDescription = expErrorDescription;
							Thread.sleep(1000);
							break;
					}
				}
			Assert.assertEquals(actErrorDescription, expErrorDescription);
		}
	}
	
	public void verifyOTCOFFApprovalDetails(String period, String fromDt, String toDt, String panel, String userId, String atdDate, String otType, String otHours, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		element_DropDownSelectByvisibleText(periodDrop, period);
		String convertDate = staticDateOrPlusMinusFromCurrentDate(atdDate);
		if (period.equalsIgnoreCase("Daily")) {
			String frmDt = staticDateOrPlusMinusFromCurrentDate(fromDt);
			String tDt = staticDateOrPlusMinusFromCurrentDate(toDt);
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, frmDt);
			Thread.sleep(500);
			element_Clear(toDateTxt);
			element_InputTextUsingActionClass(toDateTxt, tDt);
			Thread.sleep(500);
		} else {
			String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(fromDt);
			element_DropDownSelectByvisibleText(month, month1);
			String year1 = staticYearOrPlusMinusYearFromCurrentYear(toDt, toDt);
			element_DropDownSelectByvisibleText(year, year1);
			Thread.sleep(500);
		}
		element_Click(viewBtn);
		if (panel.equalsIgnoreCase("Pending")) {
			if(pendingPanelClosed.size() > 0) {
				element_Click(pendingPanel);
			}
			Thread.sleep(1500);
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userId);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1500);
			for (int i = 0; i < singleRecordPendingTabTable.size(); i++) {
				String getUsrId = singleRecordPendingTabTable.get(i).getText();
				String getDate = singleRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[2]/label")).getText();
				String getOTType = singleRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[4]/label"))
						.getText();
				String getOTHours = singleRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[5]/label"))
						.getText();
				if (getUsrId.equalsIgnoreCase(userId) && getDate.equalsIgnoreCase(convertDate)
						&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours)) {
					WebElement aprvlDetailsBtn = singleRecordPendingTabTable.get(i)
							.findElement(By.xpath("following-sibling::td[9]/img[contains(@id,'Details')]"));
					Thread.sleep(1000);
					element_Click(aprvlDetailsBtn);
					pageLoadWaitng();
					Thread.sleep(2000);
					break;
				}
			}
		}
		if (panel.equalsIgnoreCase("Authorized")) {
			if (authorizedPanelOpenOrNot.size() > 0) {
				element_Click(authorizedPanel);
			}
			Thread.sleep(1500);
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userId);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1500);
			for (int i = 0; i < authorizedTable1.size(); i++) {
				String getUsrId = authorizedTable1.get(i).getText();
				String getDate = authorizedTable1.get(i).findElement(By.xpath("following-sibling::td[2]/label")).getText();
				String getOTType = authorizedTable1.get(i).findElement(By.xpath("following-sibling::td[4]/label"))
						.getText();
				String getOTHours = authorizedTable1.get(i).findElement(By.xpath("following-sibling::td[5]/label"))
						.getText();
				if (getUsrId.equalsIgnoreCase(userId) && getDate.equalsIgnoreCase(convertDate)
						&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours)) {
					WebElement aprvlDetailsBtn = authorizedTable1.get(i)
							.findElement(By.xpath("following-sibling::td[12]/img[contains(@id,'Details')]"));
					Thread.sleep(1000);
					element_Click(aprvlDetailsBtn);
					pageLoadWaitng();
					Thread.sleep(2000);
					break;
				}
			}
		}
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Incharge: "+data.get("Incharge")+" Status: "+data.get("Status"));
			String incharge = data.get("Incharge");
			String status = data.get("Status");
			String actStatus = null;
			String statusColumnValue = null;
			for (int j = 0; j < approvalDetailsTable.size(); j++) {
				String ricName1 = approvalDetailsTable.get(j).getText();
				if (incharge.toUpperCase().equalsIgnoreCase(ricName1.toUpperCase())) {
					WebElement statusColumn = approvalDetailsTable.get(j).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][1]"));
					try {
						if (statusColumn.findElement(By.tagName("img")) != null) {
							statusColumnValue = approvalDetailsTable.get(j).findElement(By.xpath(
									"following-sibling::td[not(@hidden)][1]//img[not(@hidden)]"))
									.getAttribute("src");
							if (statusColumnValue.contains("/Approved")) {
								actStatus = "Authorized";
								break;
							} else if (statusColumnValue.contains("/Pending")) {
								actStatus = "Pending";
								break;
							} else {
								actStatus = "No Authorization";
								break;
							}
						}
					} catch (org.openqa.selenium.NoSuchElementException e) {
						actStatus = "No Authorization";
					}
				}
			}
			Thread.sleep(500);
			Assert.assertEquals(actStatus, status);
		}
		Thread.sleep(1000);
		element_Click(closeBtnAprvalDetailsPage);
	}
}
