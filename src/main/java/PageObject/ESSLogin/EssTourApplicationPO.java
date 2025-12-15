package PageObject.ESSLogin;

import java.io.IOException;
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

public class EssTourApplicationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssTourApplicationPO.class);
	
	public EssTourApplicationPO(WebDriver driver) {
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
	private WebElement tourDrop;

	@FindBy(id = "btnSave")
	private WebElement submitBtn;

	@FindBy(id = "txtRemarks")
	private WebElement reasonTxt;

	@FindBy(xpath = "//*[contains(@class,'removeRightPadding tour-app-class2')]")
	private WebElement detailGrid;

	@FindBy(xpath = "//table/tbody/tr//td[not(@hidden)][1]")
	private List<WebElement> applicationTable;

	@FindBy(id = "txtPostedDays")
	private WebElement postedDurationTxt;

	@FindBy(id = "lblSncnStat")
	private WebElement applicationStatusTxt;

	@FindBy(xpath = "//*[@key=\"ULabel2\"]/ancestor::a[@class=\"anchorclick\"]")
	private List<WebElement> modificationCollaps;

	@FindBy(xpath = "//*[contains(text(),'Apply For Modification')]")
	private WebElement modificationCollapsClick;

	@FindBy(id = "_ModifyToDate")
	private WebElement modifyToDateTxt;

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

	@FindBy(xpath = "//*[@class=\"image-upload-container\"]//*[@type=\"tooltip\"]")
	private WebElement uploadBtn;
	////////////

	public void tourApplicationFromEss(DataTable dataTable) throws InterruptedException, IOException {
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FromDate: "+data.get("FromDate"));
			String fromDate = data.get("FromDate");
			String toDate = data.get("ToDate");
			String duration = data.get("Duration");
			String tour = data.get("Tour");
			String reason = data.get("Reason");
			String medDocAvail = data.get("MedDocAvail");
			String medCert = data.get("MedCert");
			String validation = data.get("Validation");
			String convrtdFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
			String convrtdToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
			Thread.sleep(500);
			addButtonClick();
			Thread.sleep(500);
			waitForElementVisible(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, convrtdFromDate);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(fromDateTxt);
			element_InputTextUsingActionClass(toDateTxt, convrtdToDate);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(toDateTxt);
			Thread.sleep(500);
			if (duration != null) {
				element_Click(fullDayHalfDayDrop1);
				element_DropDownSelectByvisibleText(fullDayHalfDayDrop1, duration);
				Thread.sleep(1000);
			}
			element_DropDownSelectByvisibleText(tourDrop, tour);
			Thread.sleep(500);
			element_Clear(reasonTxt);
			element_InputTextUsingActionClass(reasonTxt, reason);
			if (medDocAvail != null) {
				boolean medCertAvail1 = Boolean.parseBoolean(medDocAvail);
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
			Thread.sleep(500);
			if (medCert != null) {
				if (medCert.equalsIgnoreCase("UploadFile")) {
					element_Click(uploadBtn);
					pageLoadWaitng();
					uploadDocumentUsingAutoIT();
				}
			}
			Thread.sleep(1000);
			element_Click(submitBtn);
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valMsg, validation);
			Thread.sleep(1000);
			reloadPageButtonClick();
		}
	}

	public void verifyTourApplicationStatus(String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		String convrtdFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convrtdToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Click(detailGrid);
		Thread.sleep(2000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Status: "+data.get("Status"));
			String status = data.get("Status");
			String postedDuration = data.get("PostedDuration");
			String actAppStatus = null;
			String getPostedDuration = null;
			for (int i = 0; i < applicationTable.size(); i++) {
				String getFDate = applicationTable.get(i).getText();
				if (getFDate.equalsIgnoreCase(convrtdFromDate)) {
					WebElement toDateCol = applicationTable.get(i).findElement(By.xpath("following-sibling::td[1]"));
					Thread.sleep(500);
					String getTDate = toDateCol.getText();
					if (getTDate.equalsIgnoreCase(convrtdToDate)) {
						element_Click(applicationTable.get(i));
						pageLoadWaitng();
						Thread.sleep(1500);
						if (postedDuration != null) {
							getPostedDuration = postedDurationTxt.getAttribute("value");
							Thread.sleep(500);
							logger.debug("getPostedDuration " + getPostedDuration);
						}
						if (status != null) {
							String fullAppStatus = applicationStatusTxt.getAttribute("value");
							logger.debug("App Status = " + fullAppStatus);
							if (fullAppStatus.contains("(")) {
								String[] splitfullAppStatus = fullAppStatus.split(" ");
								actAppStatus = splitfullAppStatus[0];
								Thread.sleep(1000);
							}
						}
					}
				}
			}
			Assert.assertEquals(actAppStatus, status);
		}
	}

	public void applyTourModificationCancellation(String appType, String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		String convrtdFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convrtdToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Click(detailGrid);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ModifyToDate: "+data.get("ModifyToDate"));
			String modifyToDate = data.get("ModifyToDate");
			String validation = data.get("Validation");
			String convrtdModifyToDate = null;
			for (int i = 0; i < applicationTable.size(); i++) {
				String getFDate = applicationTable.get(i).getText();
				if (getFDate.equalsIgnoreCase(convrtdFromDate)) {
					WebElement toDateCol = applicationTable.get(i).findElement(By.xpath("following-sibling::td[1]"));
					Thread.sleep(500);
					String getTDate = toDateCol.getText();
					if (getTDate.equalsIgnoreCase(convrtdToDate)) {
						element_Click(applicationTable.get(i));
						Thread.sleep(2000);
						break;
					}
				}
			}
			if (appType.equalsIgnoreCase("modification")) {
				if (modificationCollaps.size() == 0) {
					element_Click(modificationCollapsClick);
					Thread.sleep(1000);
				}
				if (modifyToDate != null) {
					convrtdModifyToDate = staticDateOrPlusMinusFromCurrentDate(modifyToDate);
					Thread.sleep(500);
					element_Clear(modifyToDateTxt);
					element_InputTextUsingActionClass(modifyToDateTxt, convrtdModifyToDate);
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
}
