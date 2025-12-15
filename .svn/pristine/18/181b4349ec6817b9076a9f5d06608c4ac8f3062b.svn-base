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

public class EssCOffApplicationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssCOffApplicationPO.class);
	
	public EssCOffApplicationPO(WebDriver driver) {
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

	@FindBy(id = "imgSelCoff")
	private WebElement selectCOffHrsIcon;

	@FindBy(xpath = "//*[@id='div_grd_leaveBal']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> panelTable;

	@FindBy(id = "cboFromHalf")
	private WebElement fullDayHalfDayDrop1;

	@FindBy(xpath = "//*[@class='panel']//*[@id='btnSave']")
	private WebElement selectBtn;

	@FindBy(id = "txtRemarks")
	private WebElement reasonTxt;

	@FindBy(id = "ChkMedCert")
	private WebElement medicalCertAvailChk;

	@FindBy(xpath = "//*[@class='fa fa-upload']")
	private WebElement uploadBtn;

	@FindBy(xpath = "//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> applicationTable;
	
	
	
	@FindBy(xpath = "//*[contains(@class,'removeRightPadding tour-app-')]")
	private WebElement detailGrid;
	
	@FindBy(id = "txtPostedDays")
	private WebElement postedDurationTxt;

	@FindBy(id = "lblSncnStat")
	private WebElement applicationStatusTxt;

	@FindBy(xpath = "//*[@key=\"Apply For Cancellation\"]/ancestor::a[@class=\"anchorclick\"]")
	private List<WebElement> cancellationCollaps;

	@FindBy(xpath = "//*[contains(text(),'Apply For Cancellation')]")
	private WebElement cancellationCollapsClick;

	@FindBy(id = "btnCan")
	private WebElement applyBtnCancelCollaps;

	@FindBy(xpath = "//*[@id='message']/div/label")
	private List<WebElement> validationMsg;
	
	////////////////

	public void cOffApplicationFromEss(DataTable dataTable) throws InterruptedException, IOException {
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FromDate: "+data.get("FromDate"));
			String fromDate = data.get("FromDate");
			String toDate = data.get("ToDate");
			String duration = data.get("Duration");
			String leave = data.get("Leave");
			String atdDate = data.get("AtdDate");
			String selectCOffHrs = data.get("SelectCOffHrs");
			String reason = data.get("Reason");
			String medCertAvail = data.get("MedCertAvail");
			String medCert = data.get("MedCert");
			String validation = data.get("Validation");
			String convrtdFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
			String convrtdToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
			Thread.sleep(500);
			addButtonClick();
			Thread.sleep(700);
			waitForElementVisible(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, convrtdFromDate);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(fromDateTxt);
			element_InputTextUsingActionClass(toDateTxt, convrtdToDate);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(toDateTxt);
			Thread.sleep(500);
			if (duration != null) {
				element_DropDownSelectByvisibleText(fullDayHalfDayDrop1, duration);
				Thread.sleep(700);
			}
			element_DropDownSelectByvisibleText(leaveDrop, leave);
			Thread.sleep(500);
			element_Click(selectCOffHrsIcon);
			pageLoadWaitng();
			Thread.sleep(1500);
			waitForElementVisible(driver.findElement(By.xpath("//*[text()='Leave Balance Detail']")));
			if (atdDate != null) {
				String convrtdAtdDate = staticDateOrPlusMinusFromCurrentDate(atdDate);
				for (int i = 0; i < panelTable.size(); i++) {
					String getAtdDate = panelTable.get(i).getText();
					if (getAtdDate.equalsIgnoreCase(convrtdAtdDate)) {
						WebElement selectCOffTxt = panelTable.get(i)
								.findElement(By.xpath("following-sibling::td[2]/input"));
						Thread.sleep(500);
						element_inputTextUsingActionClassCharacterOneByOne(selectCOffTxt, selectCOffHrs);
					}
				}
				Thread.sleep(700);
				element_Click(selectBtn);
			}
			if (reason != null) {
				element_Clear(reasonTxt);
				element_InputTextUsingActionClass(reasonTxt, reason);
			}
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
			Thread.sleep(700);
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
			String valMsg = validationMessage();
			Thread.sleep(1500);
			Assert.assertEquals(valMsg, validation);
			Thread.sleep(1000);
			reloadPageButtonClick();
			Thread.sleep(1000);
		}
	}

	public void verifyCOffApplicationStatus(String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		String convrtdFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convrtdToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Click(detailGrid);
		Thread.sleep(2500);
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
						if (postedDuration != null) {
							getPostedDuration = postedDurationTxt.getAttribute("value");
							Thread.sleep(500);
						}
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
			}
			Assert.assertEquals(actAppStatus, status);
		}
	}

	public void applyCOffCancellationApplication(String appType, String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		String convrtdFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convrtdToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Click(detailGrid);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("validation: "+data.get("validation"));
			String validation = data.get("Validation");
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
			if (appType.equalsIgnoreCase("cancellation")) {
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
