package PageObject.ESSLogin;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

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

public class EssLeaveApplicatioPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssLeaveApplicatioPO.class);
	
	public EssLeaveApplicatioPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_Todate")
	private WebElement toDateTxt;

	@FindBy(id = "cboLeaveID")
	private WebElement leaveDrop;

	@FindBy(id = "btnSave")
	private WebElement submitBtn;

	@FindBy(id = "_FromDate")
	private WebElement fDate;

	@FindBy(xpath = "//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> applicationTable;

	@FindBy(xpath = "//*[contains(@class,'removeRightPadding tour-app')]")
	private WebElement detailGrid;

	@FindBy(xpath = "//*[@gridname='grdApprovalDetails']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> approvalDetailsTable;

	@FindBy(xpath = "//*[@class=\"close\"]")
	private WebElement closeBtnAprvalDetailsPage;

	@FindBy(id = "lblSncnStat")
	private WebElement applicationStatusTxt;

	@FindBy(xpath = "//*[@key=\"ULabel2\"]/ancestor::a[@class=\"anchorclick\"]")
	private List<WebElement> modificationCollaps;

	@FindBy(xpath = "//*[contains(text(),'Apply For Modification')]")
	private WebElement modificationCollapsClick;

	@FindBy(id = "_ModifyToDate")
	private WebElement modifyToDateTxt;

	@FindBy(id = "cboModifyFromHalf")
	private WebElement dayTypeDrop;

	@FindBy(id = "txtModifyFromTime")
	private WebElement modifyFromTimeTxt;

	@FindBy(id = "txtModifyToTime")
	private WebElement modifyToTimeTxt;

	@FindBy(id = "btnModify")
	private WebElement applyBtnModifCollaps;

	@FindBy(xpath = "//*[@key=\"Apply For Cancellation\"]/ancestor::a[@class=\"anchorclick\"]")
	private List<WebElement> cancellationCollaps;

	@FindBy(xpath = "//*[contains(text(),'Apply For Cancellation')]")
	private WebElement cancellationCollapsClick;

	@FindBy(id = "btnCan")
	private WebElement applyBtnCancelCollaps;

	@FindBy(id = "cboFromHalf")
	private WebElement fullDayHalfDayDrop1;

	@FindBy(id = "ChkMedCert")
	private WebElement medicalCertAvailChk;

	@FindBy(xpath = "//*[@title=\"Change Document\"]//a")
	private WebElement uploadBtn;

	@FindBy(id = "txtPostedDays")
	private WebElement postedDurationTxt;

	@FindBy(xpath = "//*[@class=\"form-group\" and not(@hidden)]//*[@id=\"CboHalfDay\"]")
	private WebElement consiInTermsOfDrop;

	@FindBy(id = "_PDate")
	private WebElement atdDateTxt;

	@FindBy(id = "txtFromTime")
	private WebElement startTimeTxt;

	@FindBy(id = "txtToTime")
	private WebElement toTimeTxt;
	
	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[text()=\"Approval Details\"]")
	private WebElement approvalDetailsPageName;

	

	//////////////////
	public void leaveApplicationFromEss(DataTable dataTable) throws InterruptedException, IOException {
		waitForElementVisible(detailGrid);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FromDate: "+data.get("FromDate"));
			String consiInTermsOf = data.get("ConsiInTermsOf");
			String atdDate = data.get("AtdDate");
			String fromDate = data.get("FromDate");
			String toDate = data.get("ToDate");
			String duration = data.get("Duration");
			String leave = data.get("Leave");
			String medCertAvail = data.get("MedCertAvail");
			String medCert = data.get("MedCert");
			String fromTime = data.get("FromTime");
			String toTime = data.get("ToTime");
			String validation = data.get("Validation");
			String convrtdFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
			String convrtdToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
			Thread.sleep(500);
			addButtonClick();
			Thread.sleep(500);
			waitForElementVisible(fromDateTxt);
			if (consiInTermsOf != null) {
				element_DropDownSelectByvisibleText(consiInTermsOfDrop, consiInTermsOf);
				Thread.sleep(1000);
			}
			if (atdDate != null) {
				String convrtdAtdDate = staticDateOrPlusMinusFromCurrentDate(atdDate);
				element_InputTextUsingActionClass(atdDateTxt, convrtdAtdDate);
				Thread.sleep(500);
				element_TextBoxToClickOnTab(atdDateTxt);
			}
			//element_Clear(fromDateTxt);
			Thread.sleep(500);
			element_InputTextUsingActionClass(fromDateTxt, convrtdFromDate);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(fromDateTxt);
			toDateTxt.sendKeys(Keys.CONTROL + "a");
			toDateTxt.sendKeys(Keys.DELETE);
			//element_Clear(toDateTxt);
			Thread.sleep(500);
			element_InputTextUsingActionClass(toDateTxt, convrtdToDate);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(toDateTxt);
			Thread.sleep(500);
			if (duration != null) {
				element_DropDownSelectByvisibleText(fullDayHalfDayDrop1, duration);
				Thread.sleep(500);
			}
			if (fromTime != null) {
				logger.info("FromTime: "+fromTime);
				String convertStartTime = staticTimeOrPlusMinusHoursFromCurrentTime(fromTime);
				logger.info("convertToTime "+convertStartTime);
				element_inputTextUsingActionClassCharacterOneByOne(startTimeTxt, convertStartTime);
				Thread.sleep(500);
			}
			if (toTime != null) {
				String convertToTime = staticTimeOrPlusMinusHoursFromCurrentTime(toTime);
				logger.info("convertToTime "+convertToTime);
				element_inputTextUsingActionClassCharacterOneByOne(toTimeTxt, convertToTime);
				Thread.sleep(500);
			}
			element_DropDownSelectByvisibleText(leaveDrop, leave);
			Thread.sleep(500);
			driver.findElement(By.id("txtLContact")).sendKeys("1212");
			Thread.sleep(500);
			if (medCertAvail != null) {
				boolean medCertAvail1 = Boolean.parseBoolean(medCertAvail);
				if (medCertAvail1 == true) {
					if (element_isSelected(medicalCertAvailChk) != true) {
						element_Click(medicalCertAvailChk);
					}
				} else {
					if (element_isSelected(medicalCertAvailChk) == true) {
						element_Click(medicalCertAvailChk);
					}
				}
			}
			Thread.sleep(1000);
			if (medCert != null) {
				if (medCert.equalsIgnoreCase("UploadFile")) {
					element_Click(uploadBtn);
					pageLoadWaitng();
					uploadDocumentUsingAutoIT();
				}
			}
			Thread.sleep(500);
			element_Click(submitBtn);
			Thread.sleep(1500);
			if (validation != null) {
				String valMsg = validationMessage();
				Thread.sleep(1000);
				Assert.assertEquals(valMsg, validation);
			}
			Thread.sleep(500);
			reloadPageButtonClick();
		}
	}

	public void verifyApplicationStatus(String fromDt, String toDt, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(detailGrid);
		String convrtdFromDate = staticDateOrPlusMinusFromCurrentDate(fromDt);
		String convrtdToDate = staticDateOrPlusMinusFromCurrentDate(toDt);
		element_Click(detailGrid);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Status: "+data.get("Status"));
			String status = data.get("Status");
			String postedDuration = data.get("PostedDuration");
			String actAppStatus = null;
			String getPostedDuration = null;
			for (int i = 0; i < applicationTable.size(); i++) {
				String getFDate = applicationTable.get(i).getText();
				WebElement toDateCol = applicationTable.get(i).findElement(By.xpath("following-sibling::td[1]"));
				Thread.sleep(500);
				String getTDate = toDateCol.getText();
				if (getFDate.equalsIgnoreCase(convrtdFromDate) && getTDate.equalsIgnoreCase(convrtdToDate)) {
					element_Click(applicationTable.get(i));
					pageLoadWaitng();
					// Thread.sleep(2000);
					if (postedDuration != null) {
						getPostedDuration = postedDurationTxt.getAttribute("value");
						if(getPostedDuration.length() > 3) {
							postedDuration = postedDuration+"0";
						}
						Thread.sleep(500);
					}
					Thread.sleep(1000);
					if (status != null) {
						String fullAppStatus = applicationStatusTxt.getAttribute("value");
						if (fullAppStatus.contains("(")) {
							String[] splitfullAppStatus = fullAppStatus.split(" ");
							actAppStatus = splitfullAppStatus[0];
							Thread.sleep(1000);
						}
					}
				}

			}
			if (postedDuration != null) {
				Assert.assertEquals(getPostedDuration, postedDuration);
			}
			Assert.assertEquals(actAppStatus, status);
		}
	}

	public void applyLeaveModificationCancellation(String appType, String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		waitForElementVisible(detailGrid);
		String convrtdFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convrtdToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Click(detailGrid);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ModifyToDate: "+data.get("modifyToDate"));
			String modifyToDate = data.get("ModifyToDate");
			String validation = data.get("Validation");
			String dayType = data.get("DayType");
			String modifyFromTime = data.get("ModifyFromTime");
			String modifyToTime = data.get("ModifyToTime");
			String convrtdModifyToDate = null;
			for (int i = 0; i < applicationTable.size(); i++) {
				String getFDate = applicationTable.get(i).getText();
				if (getFDate.equalsIgnoreCase(convrtdFromDate)) {
					WebElement toDateCol = applicationTable.get(i).findElement(By.xpath("following-sibling::td[1]"));
					Thread.sleep(500);
					String getTDate = toDateCol.getText();
					if (getTDate.equalsIgnoreCase(convrtdToDate)) {
						element_Click(applicationTable.get(i));
						// element_Click(detailGrid);
						Thread.sleep(2000);
						break;
					}
				}
			}
			if (appType.equalsIgnoreCase("modification")) {
				if (modificationCollaps.size() == 0) {
					element_Click(modificationCollapsClick);
					Thread.sleep(1500);
				}
				if (modifyToDate != null) {
					convrtdModifyToDate = staticDateOrPlusMinusFromCurrentDate(modifyToDate);
					Thread.sleep(500);
					element_Clear(modifyToDateTxt);
					element_InputTextUsingActionClass(modifyToDateTxt, convrtdModifyToDate);
				}
				if (dayType != null) {
					element_DropDownSelectByvisibleText(dayTypeDrop, dayType);
				}
				if (modifyFromTime != null) {
					element_Clear(modifyFromTimeTxt);
					element_inputTextUsingActionClassCharacterOneByOne(modifyFromTimeTxt, modifyFromTime);
					element_TextBoxToClickOnTab(modifyFromTimeTxt);
				}
				if (modifyToTime != null) {
					element_Clear(modifyToTimeTxt);
					element_inputTextUsingActionClassCharacterOneByOne(modifyToTimeTxt, modifyToTime);
					element_TextBoxToClickOnTab(modifyToTimeTxt);
				}
				Thread.sleep(500);
				element_Click(applyBtnModifCollaps);
			} else {
				if (cancellationCollaps.size() == 0) {
					element_Click(cancellationCollapsClick);
					Thread.sleep(1500);
				}
				element_Click(applyBtnCancelCollaps);
			}
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valMsg, validation);
		}
	}

	public void validateLeaveApprovalDetails(String fromDt, String toDt, DataTable dataTable)
			throws InterruptedException {
		waitForElementVisible(detailGrid);
		String convrtdFromDate = staticDateOrPlusMinusFromCurrentDate(fromDt);
		String convrtdToDate = staticDateOrPlusMinusFromCurrentDate(toDt);
		element_Click(detailGrid);
		for (int i = 0; i < applicationTable.size(); i++) {
			String getFDate = applicationTable.get(i).getText();
			WebElement toDateCol = applicationTable.get(i).findElement(By.xpath("following-sibling::td[1]"));
			Thread.sleep(500);
			String getTDate = toDateCol.getText();
			if (getFDate.equalsIgnoreCase(convrtdFromDate) && getTDate.equalsIgnoreCase(convrtdToDate)) {
				WebElement aprvlDetailsBtn = applicationTable.get(i)
						.findElement(By.xpath("following-sibling::td[not(@hidden)]/i"));
				element_Click(aprvlDetailsBtn);
//				pageLoadWaitng();
				waitForElementVisible(approvalDetailsPageName);
			}
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
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
								actStatus = "Approved";
								break;
							} else if (statusColumnValue.contains("/Rejected")) {
								actStatus = "Rejected";
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
//			Thread.sleep(500);
			Assert.assertEquals(actStatus, status);
		}
		element_Click(closeBtnAprvalDetailsPage);
	}
}
