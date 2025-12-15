package PageObject.TimeAndAttendance;

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
import groovy.transform.Final;
import io.cucumber.datatable.DataTable;
import oracle.sql.DATE;


public class OvertimeCOFFPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(OvertimeCOFFPO.class);
	
	public OvertimeCOFFPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "CboPeriod")
	private WebElement periodDD;

	@FindBy(id = "_fromDate")
	private WebElement fromDate;

	@FindBy(id = "_toDate")
	private WebElement toDate;

	@FindBy(id = "CboMonth")
	private WebElement month;

	@FindBy(id = "CboYear")
	private WebElement year;

	@FindBy(id = "filter")
	private WebElement filter;

	@FindBy(id = "userID")
	private WebElement userID;

	@FindBy(id = "CboAuthFor")
	private WebElement authFor;

	@FindBy(xpath = "//*[@value=\"View\"]")
	private WebElement viewButton;

	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement search;

	@FindBy(xpath = "//*[@id='div_grd_gvSinglePending']/ancestor::div[1]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][3]")
	private List<WebElement> tableDateOfPendingTab;

	@FindBy(xpath = "//*[@id='div_grd_gvSinglePending']/ancestor::div[1]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> tableDateOfPendingTabWhileMthlySelected;

	

	@FindBy(xpath = "//label[contains(text(),'Authori')]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> authorizedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Authorized')]")
	private WebElement authorizedPanel;

	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]")
	private List<WebElement> multRecordPendingTabTable;

	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[@key='Define and Authorize']")
	private WebElement defineAndAuthorizeBtn;

	@FindBy(xpath = "//*[@class=\"anchorclick\"]/ancestor::div[1]//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> authorizedTable;

	@FindBy(xpath = "//div[@class=\"panel-heading accordion-heading\"]/label[contains(text(),'Error List')]")
	private List<WebElement> errorListPanelOpenOrNot;

	@FindBy(xpath = "//label[contains(text(),'Error List')]/ancestor::a[@class=\"collapsed\"][1]")
	private WebElement errorListPanel;

	@FindBy(xpath = "//*[@class=\"anchorclick\"]/ancestor::div[1]//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> errorListTable;

////////Configure Authorization Parameters Page elements////////////
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

	@FindBy(xpath = "//fieldset[not(@hidden)]//*[@id=\"RecordWiseCOFF_1\"]")
	private WebElement authCOFFHrsRecordWiseTxtHHH;

//	@FindBy(id = "//*[@ng-disabled=\"modal.SelectedCboOTMode != '1'\"]//*[@id='RecordWiseCOFF_2']")
//	private WebElement authCOFFHrsRecordWiseTxtMM;

	@FindBy(id = "ok")
	private WebElement authorizeBtn;

	@FindBy(xpath = "//*[@class=\"modal-dialog modal-sm\"]//*[@id='ok']")
	private WebElement popUPADDButton;

	@FindBy(xpath = "//*[@class=\"modal-dialog modal-sm\"]//*[@id='ok']")
	private List<WebElement> popUPADDButtonSize;
	
	@FindBy(xpath = "//label[contains(text(),'Pending')]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> pendingPanelClosed;

	@FindBy(xpath = "//*[contains(text(),'Pending') and @class=\"mx-input-theme label-text\"]")
	private WebElement pendingPanel;
	
	@FindBy(xpath = "//*[@id='collapseOne']//table/tbody/tr/td[1]")
	private List<WebElement> pendingTableUserId;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement searchBox;
	
	@FindBy(xpath = "//*[@class=\"modal-body modal-body-md modalWithFooter form-hr\"]//table/tbody/tr[contains(@id,'grdApprovalDetailsro')]//td[not(@hidden)][1]")
	private List<WebElement> approvalDetailsTable;
	
	@FindBy(xpath = "//*[@value=\"Close\"]")
	private WebElement closeBtnAprvalDetailsPage;
	
	@FindBy(xpath="//*[@class='modal-header']//*[text()='All Attendance Punches']")
	private WebElement allAtdPunPopUp;
	
	//////////////////////////////

	public void overtimeCOFFAuthApp(String recordType, String period, String fdate, String tdate, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDate);
		element_DropDownSelectByvisibleText(periodDD, period);
		if (period.equalsIgnoreCase("Daily")) {
			String frmDt = staticDateOrPlusMinusFromCurrentDate(fdate);
			String tDt = staticDateOrPlusMinusFromCurrentDate(tdate);
			element_Clear(fromDate);
			element_InputTextUsingActionClass(fromDate, frmDt);
			Thread.sleep(500);
			element_Clear(toDate);
			element_InputTextUsingActionClass(toDate, tDt);
			Thread.sleep(500);
		} else {
			String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(fdate);
			element_DropDownSelectByvisibleText(month, month1);
			String year1 = staticYearOrPlusMinusYearFromCurrentYear(fdate, tdate);
			element_DropDownSelectByvisibleText(year, year1);
			Thread.sleep(500);
		}
		element_DropDownSelectByvisibleText(authFor, recordType);
		element_Click(viewButton);
		Thread.sleep(500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
			String actValidation = null;
			String userID = data.get("UserID");
			String appDate = data.get("Date");
			String applicationDate=null;
			if (appDate != null) {
				applicationDate = staticDateOrPlusMinusFromCurrentDate(appDate);
			}
			String oTtype = data.get("OTType");
			String otHours = data.get("OTHours");
			String authasOvertime = data.get("AuthAsOT");
			String authasCOFF = data.get("AuthAsCOFF");
			String validation = data.get("Validation");
			String authSequence = data.get("AuthSequence");
			element_Clear(search);
			element_InputTextUsingActionClass(search, userID);
			element_TextBoxToClickOnTab(search);
			Thread.sleep(5000);
			if (period.equalsIgnoreCase("Daily")) {
				for (int i = 0; i < tableDateOfPendingTab.size(); i++) {
					if (tableDateOfPendingTab.get(i).getText().equalsIgnoreCase(applicationDate)) {
						if (tableDateOfPendingTab.get(i).findElement(By.xpath("preceding::td[2]")).getText()
								.equalsIgnoreCase(userID)
								&& tableDateOfPendingTab.get(i).findElement(By.xpath("following-sibling::td[2]"))
										.getText().equalsIgnoreCase(oTtype)
								&& tableDateOfPendingTab.get(i).findElement(By.xpath("following-sibling::td[3]"))
										.getText().equalsIgnoreCase(otHours)) {
							tableDateOfPendingTab.get(i).click();
							Thread.sleep(1000);
							if (authasOvertime != null) {
								if (tableDateOfPendingTab.get(i).findElement(By.xpath("following-sibling::td[4]"))
										.isEnabled()) {
									String[] authasOvertimesplit = authasOvertime.split(":");
									List<WebElement> ot = tableDateOfPendingTab.get(i)
											.findElements(By.xpath("following-sibling::td[4]//input"));
									for (int k = 0; k < ot.size(); k++) {
										ot.get(k).sendKeys(authasOvertimesplit[k]);
										Thread.sleep(500);
									}
								}
							}
							if (authasCOFF != null) {
								if (tableDateOfPendingTab.get(i).findElement(By.xpath("following-sibling::td[5]"))
										.isEnabled()) {
									String[] authasCOFFsplit = authasCOFF.split(":");
									List<WebElement> co = tableDateOfPendingTab.get(i)
											.findElements(By.xpath("following-sibling::td[5]//input"));
									for (int k = 0; k < co.size(); k++) {
										co.get(k).sendKeys(authasCOFFsplit[k]);
										Thread.sleep(500);
									}
								}
							}
							Thread.sleep(1000);
							tableDateOfPendingTab.get(i).findElement(By.xpath("following-sibling::td[9]/a")).click();
							Thread.sleep(1000);
							actValidation = validationMessage();
							break;
						}
					}

				}

			} else {
				for (int i = 0; i < tableDateOfPendingTabWhileMthlySelected.size(); i++) {
					if (tableDateOfPendingTabWhileMthlySelected.get(i).getText().equalsIgnoreCase(userID)) {
						if (tableDateOfPendingTabWhileMthlySelected.get(i)
								.findElement(By.xpath("following-sibling::td[2]")).getText().equalsIgnoreCase(oTtype)
								&& tableDateOfPendingTabWhileMthlySelected.get(i)
										.findElement(By.xpath("following-sibling::td[3]")).getText()
										.equalsIgnoreCase(otHours)) {
							tableDateOfPendingTabWhileMthlySelected.get(i).click();
							if (authasOvertime != null) {
								if (tableDateOfPendingTabWhileMthlySelected.get(i)
										.findElement(By.xpath("following-sibling::td[4]")).isEnabled()) {
									String[] authasOvertimesplit = authasOvertime.split(":");
									Thread.sleep(1000);
									List<WebElement> ot = tableDateOfPendingTabWhileMthlySelected.get(i)
											.findElements(By.xpath("following-sibling::td[4]//input"));
									for (int k = 0; k < ot.size(); k++) {
										ot.get(k).sendKeys(authasOvertimesplit[k]);
										Thread.sleep(500);
									}
								}
							}
							if (authasCOFF != null) {
								if (tableDateOfPendingTabWhileMthlySelected.get(i)
										.findElement(By.xpath("following-sibling::td[5]")).isEnabled()) {
									String[] authasCOFFsplit = authasCOFF.split(":");
									List<WebElement> co = tableDateOfPendingTabWhileMthlySelected.get(i)
											.findElements(By.xpath("following-sibling::td[5]//input"));
									for (int k = 0; k < co.size(); k++) {
										co.get(k).sendKeys(authasCOFFsplit[k]);
										Thread.sleep(500);
									}
								}
							}
							if (authSequence != null) {
								if (tableDateOfPendingTabWhileMthlySelected.get(i)
										.findElement(By.xpath("following-sibling::td[7]//select")).isEnabled()) {
									element_DropDownSelectByvisibleText(tableDateOfPendingTabWhileMthlySelected.get(i)
											.findElement(By.xpath("following-sibling::td[7]//select")), authSequence);
								}
							}
							Thread.sleep(1000);
							tableDateOfPendingTabWhileMthlySelected.get(i)
									.findElement(By.xpath("following-sibling::td[10]/a")).click();
							Thread.sleep(1000);
							actValidation = validationMessage();
							break;
						}
					}
				}
			}
			Assert.assertEquals(actValidation, validation);
		}

	}

	public void multRecordsOTCOFFAuthSA(String recordType, String period, String fromDt, String toDt,
			DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDate);
		element_DropDownSelectByvisibleText(periodDD, period);
		if (period.equalsIgnoreCase("Daily")) {
			String frmDt = staticDateOrPlusMinusFromCurrentDate(fromDt);
			String tDt = staticDateOrPlusMinusFromCurrentDate(toDt);
			element_Clear(fromDate);
			element_InputTextUsingActionClass(fromDate, frmDt);
			Thread.sleep(500);
			element_Clear(toDate);
			element_InputTextUsingActionClass(toDate, tDt);
			Thread.sleep(500);
		} else {
			String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(fromDt);
			element_DropDownSelectByvisibleText(month, month1);
			String year1 = staticYearOrPlusMinusYearFromCurrentYear(fromDt, toDt);
			element_DropDownSelectByvisibleText(year, year1);
			Thread.sleep(500);
		}
		element_DropDownSelectByvisibleText(authFor, recordType);
		element_Click(viewButton);
		Thread.sleep(500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
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
			element_Clear(search);
			element_InputTextUsingActionClass(search, userId);
			element_TextBoxToClickOnTab(search);
			Thread.sleep(5000);
			for (int i = 0; i < multRecordPendingTabTable.size(); i++) {
				String getUserID = multRecordPendingTabTable.get(i).getText();
				String getAppDate = multRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[2]"))
						.getText();
				String getOTType = multRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[4]"))
						.getText();
				String getOTHours = multRecordPendingTabTable.get(i).findElement(By.xpath("following-sibling::td[5]"))
						.getText();
				Thread.sleep(500);
				if (getUserID.equalsIgnoreCase(userId) && getAppDate.equalsIgnoreCase(convertDate)
						&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours)) {
					WebElement chk = multRecordPendingTabTable.get(i).findElement(By.xpath(
							"preceding::td[not(@hidden)][1]//input"
							+ ""));
					element_Click(chk);
					break;
				}
			}
			Thread.sleep(500);
		}
		Thread.sleep(1000);
		element_Click(defineAndAuthorizeBtn);
		pageLoadWaitng();
		Thread.sleep(1000);
		String getPageHeading = pageHeading.getText();
		Thread.sleep(1000);
		Assert.assertEquals(getPageHeading, "Configure Authorization Parameters");
	}

	public String configAuthParametersFromSA(DataTable dataTable) throws InterruptedException {
		String actMsg = null;
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			//logger.info("Authorize: "+data.get("Authorize")+" AuthorizationMode: "+data.get("AuthorizationMode"));
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
			if (authorizationMode.equalsIgnoreCase("OT Type-Wise")
					&& authorizeInTermsOf.equalsIgnoreCase("Percentage")) {
				if (defineHoursforOT != null) {
					String[] defineHoursforOTFsplit = defineHoursforOT.split(",");
					for (int k = 0; k < defineHoursforOTFsplit.length; k++) {
						if (defineHoursforOTFsplit[k].length() > 0 && defineHoursforOTFsplit[k].isEmpty() != true) {
							if (element_isEnabled(otPercentageXpath.get(k)) == true) {
								otPercentageXpath.get(k).sendKeys(Keys.CONTROL + "a");
								otPercentageXpath.get(k).sendKeys(Keys.DELETE);
								otPercentageXpath.get(k).sendKeys(defineHoursforOTFsplit[k]);
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
//					element_Clear(authOTHrsRecordWiseTxt);
					Thread.sleep(500);
					element_InputTextUsingActionClass(authOTHrsRecordWiseTxt, authHrsforEachRecordAsOT);
					Thread.sleep(500);
				}
				if (authHrsforEachRecordAsCOff != null) {
//					element_Clear(authCOFFHrsRecordWiseTxt);
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
					WebElement authCOFFHrsRecordWiseTxtMM = authCOFFHrsRecordWiseTxtHHH
							.findElement(By.xpath("following::input"));
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

	public void validateAuthorizedOTCOFFFromSA(String period, String fromDt, String toDt, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDate);
		element_DropDownSelectByvisibleText(periodDD, period);
		if (period.equalsIgnoreCase("Daily")) {
			String frmDt = staticDateOrPlusMinusFromCurrentDate(fromDt);
			String tDt = staticDateOrPlusMinusFromCurrentDate(toDt);
			element_Clear(fromDate);
			element_InputTextUsingActionClass(fromDate, frmDt);
			Thread.sleep(500);
			element_Clear(toDate);
			element_InputTextUsingActionClass(toDate, tDt);
			Thread.sleep(500);
		} else {
			String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(fromDt);
			element_DropDownSelectByvisibleText(month, month1);
			String year1 = staticYearOrPlusMinusYearFromCurrentYear(fromDt, toDt);
			element_DropDownSelectByvisibleText(year, year1);
			Thread.sleep(500);
		}
		element_Click(viewButton);
		Thread.sleep(500);
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
			String currentDtTominusMonthDate = data.get("CurrentDtTominusMonthDate");
			if (currentDtTominusMonthDate != null && date != null) {
				convertDate = currentDt2minus1MonthDateAndDate(currentDtTominusMonthDate, date);
			} else if (currentDtTominusMonthDate != null) {
				convertDate = currentDt2minus1MonthDate(currentDtTominusMonthDate);
			} else if (date != null) {
				convertDate = staticDateOrPlusMinusFromCurrentDate(date);
			}
			Thread.sleep(500);
			if (panelName.equalsIgnoreCase("Authorized")) {
				if (authorizedPanelOpenOrNot.size() > 0) {
					element_Click(authorizedPanel);
				}
			}
			Thread.sleep(1500);
			element_Clear(search);
			element_InputTextUsingActionClass(search, userID);
			element_TextBoxToClickOnTab(search);
			Thread.sleep(5000);
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
				if (getUsrId.equalsIgnoreCase(userID) && getDate.equalsIgnoreCase(convertDate)
						&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours)) {
					if (authAsOT != null && authAsCOFF != null) {
						if (authAsOT.equalsIgnoreCase(getAuthAsOT) && authAsCOFF.equalsIgnoreCase(getAuthAsCOFF)) {
							actStatus = "Authorized";
							Thread.sleep(1000);
							// break;
						}
					} else if (authAsOT != null) {
						if (authAsOT.equalsIgnoreCase(getAuthAsOT)) {
							actStatus = "Authorized";
							Thread.sleep(1000);
							// break;
						}
					} else if (authAsCOFF != null) {
						if (authAsCOFF.equalsIgnoreCase(getAuthAsCOFF)) {
							actStatus = "Authorized";
							Thread.sleep(1000);
							// break;
						}
					}
				}
			}
			Assert.assertEquals(actStatus, expStatus);
		}
	}

	public void verifyErrorListFromSA(DataTable dataTable) throws InterruptedException {
		Thread.sleep(2000);
		if (errorListPanelOpenOrNot.size() > 0) {
			element_Click(errorListPanel);
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
			String actErrorDescription = null;
			String userID = data.get("UserID");
			String date = data.get("Date");
			String otType = data.get("OTType");
			String otHours = data.get("OTHours");
			String expErrorDescription = data.get("ErrorDescription");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(date);
			Thread.sleep(1500);
			element_Clear(search);
			element_InputTextUsingActionClass(search, userID);
			element_TextBoxToClickOnTab(search);
			Thread.sleep(5000);
			for (int i = 0; i < errorListTable.size(); i++) {
				String getUsrId = errorListTable.get(i).getText();
				String getDate = errorListTable.get(i).findElement(By.xpath("following-sibling::td[2]")).getText();
				String getOTType = errorListTable.get(i).findElement(By.xpath("following-sibling::td[3]")).getText();
				String getOTHours = errorListTable.get(i).findElement(By.xpath("following-sibling::td[4]")).getText();
				String getErrorDescription = errorListTable.get(i).findElement(By.xpath("following-sibling::td[5]"))
						.getText();
				if (getUsrId.equalsIgnoreCase(userID) && getDate.equalsIgnoreCase(convertDate)
						&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours)
						&& expErrorDescription.equalsIgnoreCase(getErrorDescription)) {
					actErrorDescription = expErrorDescription;
					Thread.sleep(1000);
					break;
				}
			}
			Assert.assertEquals(actErrorDescription, expErrorDescription);
		}
	}
	
	public void validateOTApprovalDetails(String period, String fDate, String tDate, String panelName, String userId, String atdDate, String otType, String otHours, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(fromDate);
		element_DropDownSelectByvisibleText(periodDD, period);
		String convertDate = staticDateOrPlusMinusFromCurrentDate(atdDate);
		if (period.equalsIgnoreCase("Daily")) {
			String frmDt = staticDateOrPlusMinusFromCurrentDate(fDate);
			String tDt = staticDateOrPlusMinusFromCurrentDate(tDate);
			element_Clear(fromDate);
			element_InputTextUsingActionClass(fromDate, frmDt);
			Thread.sleep(500);
			element_Clear(toDate);
			element_InputTextUsingActionClass(toDate, tDt);
			Thread.sleep(500);
		} else {
			String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(fDate);
			element_DropDownSelectByvisibleText(month, month1);
			String year1 = staticYearOrPlusMinusYearFromCurrentYear(tDate, tDate);
			element_DropDownSelectByvisibleText(year, year1);
			Thread.sleep(500);
		}
		element_Click(viewButton);
		if (panelName.equalsIgnoreCase("Pending")) {
			if(pendingPanelClosed.size() > 0) {
				element_Click(pendingPanel);
			}
			waitForElementVisible(searchBox);
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userId);
			element_TextBoxToClickOnEnter(searchBox);
			waitForElementVisible(pendingTableUserId.get(0));
			for (int i = 0; i < pendingTableUserId.size(); i++) {
				String getUsrId = pendingTableUserId.get(i).getText();
				String getDate = pendingTableUserId.get(i).findElement(By.xpath("following-sibling::td[2]/label")).getText();
				String getOTType = pendingTableUserId.get(i).findElement(By.xpath("following-sibling::td[4]/label"))
						.getText();
				String getOTHours = pendingTableUserId.get(i).findElement(By.xpath("following-sibling::td[5]/label"))
						.getText();
				if (getUsrId.equalsIgnoreCase(userId) && getDate.equalsIgnoreCase(convertDate)
						&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours)) {
					WebElement aprvlDetailsBtn = pendingTableUserId.get(i)
							.findElement(By.xpath("following-sibling::td[9]/img[contains(@id,'Details')]"));
					element_Click(aprvlDetailsBtn);
					waitForElementVisible(allAtdPunPopUp);
					break;
				}
			}
		}
		if (panelName.equalsIgnoreCase("Authorized")) {
			if (authorizedPanelOpenOrNot.size() > 0) {
				element_Click(authorizedPanel);
			}
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userId);
			element_TextBoxToClickOnEnter(searchBox);
			for (int i = 0; i < authorizedTable.size(); i++) {
				String getUsrId = authorizedTable.get(i).getText();
				String getDate = authorizedTable.get(i).findElement(By.xpath("following-sibling::td[2]/label")).getText();
				String getOTType = authorizedTable.get(i).findElement(By.xpath("following-sibling::td[4]/label"))
						.getText();
				String getOTHours = authorizedTable.get(i).findElement(By.xpath("following-sibling::td[5]/label"))
						.getText();
				if (getUsrId.equalsIgnoreCase(userId) && getDate.equalsIgnoreCase(convertDate)
						&& getOTType.equalsIgnoreCase(otType) && getOTHours.equalsIgnoreCase(otHours)) {
					WebElement aprvlDetailsBtn = authorizedTable.get(i)
							.findElement(By.xpath("following-sibling::td[12]/img[contains(@id,'Details')]"));
					
					element_Click(aprvlDetailsBtn);
					waitForElementVisible(allAtdPunPopUp);
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
			Assert.assertEquals(actStatus, status);
		}
		element_Click(closeBtnAprvalDetailsPage);
	}
}
