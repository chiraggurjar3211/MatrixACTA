package PageObject.JobProcessingCosting;

import java.time.Duration;
import java.util.ArrayList;
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
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class TimesheetCorrectionPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(TimesheetCorrectionPO.class);
	public TimesheetCorrectionPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//elements by chhaya
	@FindBy(id = "TSJPCUserID")
	private WebElement userIdTxt;
	
	@FindBy(id = "_PDate")
	private WebElement dateTxt;
	
	@FindBy(xpath = "(//*[@id='div_grd_gvTimesheedDetails']//table/tbody/tr/td[not(@hidden)][11])[1]")
	private WebElement editBtnTimeCorrect;
	
	@FindBy(xpath = "//*[@id='JobCode']")
	private WebElement jobCodeDropdown;
	
	@FindBy(xpath = "//*[@id='savebtn'][not(@hidden)]")
	private WebElement saveBtnTimeCorrect;
	
	@FindBy(id = "AdjmntImgList_0")
	private WebElement adjustmentIcon;
	
	@FindBy(id = "cmbAdjustmentType")
	private WebElement adjustmentTypeDD;
	
	@FindBy(id = "txtAdjHours")
	private WebElement adjustmentHrsTxt;
	
	@FindBy(id = "txtRemark")
	private WebElement adjustmentRemarkTxt;
	
	@FindBy(id = "btnYes")
	private List<WebElement> adjustmentSavePopupYesBtnChk;
	
	@FindBy(id = "btnYes")
	private WebElement adjustmentSavePopupYesBtn;
	
//	@FindBy(xpath = "//*[@title='Edit (Alt+E)']")
//	private WebElement editButton;
//	
//	@FindBy(xpath = "//*[@title='Cancel (Alt+C)']")
//	private WebElement cancelButton;
	
	@FindBy(xpath = "//*[@class='modal-content']//*[@id='btnOk' and @value='OK']")
	private WebElement adjustmentPopupOK;
	
	@FindBy(id = "loading-overlay")
	private WebElement pageOnLoad;

	@FindBy(id = "loading-overlay")
	private List<WebElement> pageOnLoadCount;
	
	@FindBy(xpath = "//*[@id='div_grd_gvTimesheedDetails']//table/thead/tr/th")
	private List<WebElement> timesheetCorrectionTableHeader;
	
	@FindBy(xpath = "//*[@id='div_grd_gvTimesheedDetails']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> timesheetCorrectionTable;
	
/////////////////////////////////////////	
	// By Mayank
	// Timesheet Correction Application via API
	public String timesheetCorrectionApplicationAPI(List<String> columnHeader, List<String> apiParameter,
			Map<String, String> data, String tid) {
		String apiPar = null;
		if (columnHeader.contains("userid")) {
			if (data.get("userid") != null) {
				apiParameter.add("userid=" + data.get("userid"));
			}
		}
		apiParameter.add("transaction-id=" + tid);
		if (columnHeader.contains("attendance-date")) {
			if (data.get("attendance-date") != null) {
				String adate = dateSelectedinddMMyyyy(data.get("attendance-date"));
				apiParameter.add("attendance-date=" + adate);
			}
		}
		if (columnHeader.contains("correction-type")) {
			if (data.get("correction-type") != null) {
				apiParameter.add("correction-type=" + data.get("correction-type"));
			}
		}
		if (columnHeader.contains("job-code")) {
			if (data.get("job-code") != null) {
				apiParameter.add("job-code=" + data.get("job-code"));
			}
		}
		if (columnHeader.contains("reason")) {
			if (data.get("reason") != null) {
				apiParameter.add("reason=" + data.get("reason"));
			}
		}
		if (columnHeader.contains("job-count")) {
			if (data.get("job-count") != null) {
				apiParameter.add("job-count=" + data.get("job-count"));
			}
		}
		if (columnHeader.contains("adjustment-type")) {
			if (data.get("adjustment-type") != null) {
				apiParameter.add("adjustment-type=" + data.get("adjustment-type"));
			}
		}
		if (columnHeader.contains("adjustment-hours")) {
			if (data.get("adjustment-hourst") != null) {
				apiParameter.add("adjustment-hours=" + data.get("adjustment-hours"));
			}
		}

		return apiPar;
	}

	// By Chhaya
	// Apply Timesheet Correction Application from SA login
	public void timesheetCorrectionApplicationFromSA(String userid, String attendanceDate, String jobCode,
			String validation) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		waitForElementVisible(userIdTxt);
		element_Clear(userIdTxt);
		element_InputTextUsingActionClass(userIdTxt, userid);
		element_TextBoxToClickOnTab(userIdTxt);
		pageLoadWaitng();
		if (element_isEnabled(cancelButton)) {
			cancelButtonClick();
		}
		String adate = staticDateOrPlusMinusFromCurrentDate(attendanceDate);
		Thread.sleep(2000);
		element_Clear(dateTxt);
		Thread.sleep(2000);
		element_InputText(dateTxt, adate);
		Thread.sleep(2000);
		// More wait
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(120));
		if (pageOnLoadCount.size() > 0) {
			wait.until(ExpectedConditions.invisibilityOf(pageOnLoad));
			Thread.sleep(1000);
		}
		element_ClickUsingJS(editBtnTimeCorrect);
		Thread.sleep(2000);
		element_DropDownSelectByvisibleText(jobCodeDropdown, jobCode);
		Thread.sleep(1000);
		element_Click(saveBtnTimeCorrect);
		Thread.sleep(1000);
		saveButtonClick();
		val = validationMessage();
		Assert.assertEquals(val, validation);
	}
	
	// By Chhaya
	// Apply Timesheet Correction Application from SA login
	public void assignAwardPaneltyFromSA(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		waitForElementVisible(userIdTxt);
		element_Clear(userIdTxt);
		element_InputTextUsingActionClass(userIdTxt, data.get("Userid"));
		element_TextBoxToClickOnTab(userIdTxt);
		pageLoadWaitng();
		Thread.sleep(2000);
		//cancelButtonClick();
		if (element_isEnabled(cancelButton)) {
			cancelButtonClick();
		}
		if (data.get("Date") != null) {
			String adate = staticDateOrPlusMinusFromCurrentDate(data.get("Date"));
			element_Clear(dateTxt);
			element_InputTextUsingActionClass(dateTxt, adate);
		}
		Thread.sleep(2000);
		// More wait
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(120));
		if (pageOnLoadCount.size() > 0) {
			wait.until(ExpectedConditions.invisibilityOf(pageOnLoad));
			Thread.sleep(1000);
		}
		element_Click(adjustmentIcon);
		Thread.sleep(3000);
		if (data.get("AdjustmentType") != null) {
			element_DropDownSelectByvisibleText(adjustmentTypeDD, data.get("AdjustmentType"));
		}
		if (data.get("Hours") != null) {
			element_Clear(adjustmentHrsTxt);
			element_inputTextUsingActionClassCharacterOneByOne(adjustmentHrsTxt, data.get("Hours"));
		}
		if (data.get("Remark") != null) {
			element_Clear(adjustmentRemarkTxt);
			element_InputTextUsingActionClass(adjustmentRemarkTxt, data.get("Remark"));
		}
		element_Click(adjustmentPopupOK);
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(2000);
		if (adjustmentSavePopupYesBtnChk.size()>0) {
			element_Click(adjustmentSavePopupYesBtn);
		}
		val = validationMessage();
		Assert.assertEquals(val, data.get("Validation"));
	}
	
	public void verifyJobInTimesheetCorrection(String userId, String date, String jobCode, String phaseCode, String projectCode, String startDate, String startTime, String endDate, String endTime, String transactionType, String hours, String jobCount) throws InterruptedException{
		pageLoadWaitng();
		waitForElementVisible(userIdTxt);
		element_Clear(userIdTxt);
		Thread.sleep(500);
		element_InputTextUsingActionClass(userIdTxt, userId);
		element_TextBoxToClickOnTab(userIdTxt);
		Thread.sleep(500);
		String convertDate= staticDateOrPlusMinusFromCurrentDate(date);
		element_Clear(dateTxt);
		element_InputTextUsingActionClass(dateTxt, convertDate);
		Thread.sleep(1500);
		for (int i = 0; i < timesheetCorrectionTable.size(); i++) {
			if(jobCode != null) {
				Assert.assertEquals(timesheetCorrectionTable.get(i).getText(), jobCode);
			}
			if(phaseCode != null) {
				String actPhaseCode = timesheetCorrectionTable.get(i).findElement(By.xpath("following-sibling::td[1]")).getText();
				Assert.assertEquals(actPhaseCode, phaseCode);
			}
			if(projectCode != null) {
				String actProjectCode = timesheetCorrectionTable.get(i).findElement(By.xpath("following-sibling::td[2]")).getText();
				Assert.assertEquals(actProjectCode, projectCode);
			}
			if(startDate != null) {
				String convertStartDate = staticDateOrPlusMinusFromCurrentDate(startDate);
				String actStartDate = timesheetCorrectionTable.get(i).findElement(By.xpath("following-sibling::td[3]")).getText();
				Assert.assertEquals(actStartDate, convertStartDate);
			}
			if(startTime != null) {
				String actStartTime = timesheetCorrectionTable.get(i).findElement(By.xpath("following-sibling::td[4]")).getText();
				Assert.assertEquals(actStartTime, startTime);
			}
			if(endDate != null) {
				String convertEndDate = staticDateOrPlusMinusFromCurrentDate(endDate);
				String actEndDate = timesheetCorrectionTable.get(i).findElement(By.xpath("following-sibling::td[5]")).getText();
				Assert.assertEquals(actEndDate, convertEndDate);
			}
			if(endTime != null) {
				String actEndTime = timesheetCorrectionTable.get(i).findElement(By.xpath("following-sibling::td[6]")).getText();
				Assert.assertEquals(actEndTime, endTime);
			}
			if(transactionType != null) {
				String actTransactionType = timesheetCorrectionTable.get(i).findElement(By.xpath("following-sibling::td[7]")).getText();
				Assert.assertEquals(actTransactionType, transactionType);
			}
			if(hours != null) {
				String actHours = timesheetCorrectionTable.get(i).findElement(By.xpath("following-sibling::td[9]")).getText();
				Assert.assertEquals(actHours, hours);
			}
			if(jobCount != null) {
				String actJobCount = timesheetCorrectionTable.get(i).findElement(By.xpath("following-sibling::td[10]")).getText();
				Assert.assertEquals(actJobCount, jobCount);
			}
		}
		Thread.sleep(1500);
		reloadPageButtonClick();
		Thread.sleep(1500);
	}

}
