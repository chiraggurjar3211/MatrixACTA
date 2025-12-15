package PageObject.FieldVisitManagement;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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

public class FieldVisitSchedulePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(FieldVisitSchedulePO.class);
	
	public FieldVisitSchedulePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "fieldVisitSchuserID")
	private WebElement useridtxt;

	@FindBy(id = "_txtPDate")
	private WebElement datetxt;

	@FindBy(id = "_calenderDate1")
	private WebElement sDatetxt;

	@FindBy(id = "txtStartTime")
	private WebElement sTimetxt;

	@FindBy(id = "_calenderDate2")
	private WebElement eDatetxt;

	@FindBy(id = "txtEndTime")
	private WebElement eTimetxt;

	@FindBy(id = "fvsTaskName")
	private WebElement taskNametxt;

	@FindBy(id = "fvsLocationID")
	private WebElement locationcodetxt;

	@FindBy(id = "txtRemark")
	private WebElement remarktxt;

	@FindBy(xpath = "//*[@default='Add']")
	private WebElement addBtn;

	@FindBy(xpath = "//*[contains(@id,'row')]//*[not(@hidden)]//*[@title='Delete']")
	private List<WebElement> gridDeleteBtns;

	@FindBy(xpath = "//*[@id='row_0']//*[not(@hidden)]//*[@title='Delete']")
	private WebElement gridDeleteBtn;

	// By Chhaya
	@FindBy(xpath = "//table//th//label[text()='Date']/ancestor::table/tbody/tr[not(@hidden)]//td[not(@hidden)][1]")
	private List<WebElement> visitTableColumn;

	// By Chhaya
	@FindBy(xpath = "//*[contains(@title,'Import Field Visit Schedule')]")
	private WebElement importButton;

	// By Chhaya
	@FindBy(id = "importData")
	private WebElement chooseFile;

	// By Chhaya
	@FindBy(id = "Upload")
	private WebElement uploadBtn;

	// By Chhaya
	@FindBy(id = "Process")
	private WebElement impFldVisProcessBtn;

	// By Chhaya
	@FindBy(id = "Cancel")
	private WebElement impFldVisCancelBtn;

	// By Chhaya
	@FindBy(xpath = "//*[@id=\"message1\"]//label")
	private WebElement valMsgImpFldVisSch;

	// chhaya
	@FindBy(id = "btnCopy")
	private WebElement copyBtn;

	// chhaya
	@FindBy(id = "fieldVisitcopyuserID")
	private WebElement copyTaskUserId;

	// chhaya
	@FindBy(xpath = "//*[@value='Process']")
	private WebElement processButton;

	// chhaya
	@FindBy(xpath = "//*[@class='close']")
	private WebElement closeButton;

	// chhaya
	@FindBy(xpath = "//*[@id=\"message1\"]//label")
	private WebElement validationMsgXpath;

	// chhaya
	@FindBy(xpath = "//*[@key='btnReassign']")
	private WebElement reassignBtn;

	@FindBy(id = "fieldVisitreassignuserID")
	private WebElement reassignTaskUserId;

	@FindBy(id = "_calenderDate5")
	private WebElement reassignDateXpath;

	@FindBy(id = "mdok")
	private WebElement reassignOkBtn;
	
	
	@FindBy(id = "cboFileFrmt")
	private WebElement fileTypeXpath;

	// chhaya
	@FindBy(xpath = "//*[@class='table-responsive']//table//tbody//tr//td[not(@hidden)][1]")
	private List<WebElement> resultTable;

	// Functions
	// By Mayank
	// ***************************************************************************
	// *********** Create Field Visit Schedule *********************************
	// ****************************************************************************
	public void createFieldVisitSchedule(String userid, String date, List<Map<String, String>> data)
			throws InterruptedException {
		waitForElementVisible(useridtxt);
		element_Clear(useridtxt);
		element_InputTextUsingActionClass(useridtxt, userid);
		element_TextBoxToClickOnTab(useridtxt);
		waitForElementClickable(datetxt);
		String date1 = dateSelectedinddMMyyyy(date);
		element_Clear(datetxt);
		element_InputTextUsingActionClass(datetxt, date1);
		Thread.sleep(1000);
		// Delete already added rows
		logger.info("Delete already added rows");
		while (gridDeleteBtns.size() != 0) {
			element_Click(gridDeleteBtn);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
		}
		// Add new rows
		logger.info("Add new rows");
		for (int i = 0; i < data.size(); i++) {
			String scheduleStartDate = data.get(i).get("ScheduleStartDate");
			String scheduleStartTime = data.get(i).get("ScheduleStartTime");
			String scheduleEndDate = data.get(i).get("ScheduleEndDate");
			String scheduleEndTime = data.get(i).get("ScheduleEndTime");
			String taskName = data.get(i).get("TaskName");
			String location = data.get(i).get("Location");
			String remark = data.get(i).get("Remark");
			if (scheduleStartDate != null) {
				logger.info("userid: "+userid+"ScheduleStartDate: "+scheduleStartDate);
				if (sDatetxt.isEnabled()) {
					String sdate = dateSelectedinddMMyyyy(scheduleStartDate);
					element_Clear(sDatetxt);
					element_InputTextUsingActionClass(sDatetxt, sdate);
				}
			}
			Thread.sleep(1000);
			if (scheduleStartTime != null) {
				if (sTimetxt.isEnabled()) {
					element_Clear(sTimetxt);
					element_inputTextUsingActionClassCharacterOneByOne(sTimetxt, scheduleStartTime);
				}
			}
			Thread.sleep(1000);
			if (scheduleEndDate != null) {
				if (eDatetxt.isEnabled()) {
					String edate = dateSelectedinddMMyyyy(scheduleEndDate);
					element_Clear(eDatetxt);
					element_InputTextUsingActionClass(eDatetxt, edate);
				}
			}
			Thread.sleep(1000);
			if (scheduleEndTime != null) {
				if (eTimetxt.isEnabled()) {
					element_Clear(eTimetxt);
					element_inputTextUsingActionClassCharacterOneByOne(eTimetxt, scheduleEndTime);
				}
			}
			Thread.sleep(1000);
			if (taskName != null) {
				if (taskNametxt.isEnabled()) {
					element_Clear(taskNametxt);
					element_dynamicDDSelect(taskNametxt, taskName);
					element_TextBoxToClickOnTab(taskNametxt);
				}
			}
			Thread.sleep(1000);
			if (location != null) {
				if (locationcodetxt.isEnabled()) {
					element_dynamicDDSelect(locationcodetxt, location);
					element_TextBoxToClickOnTab(locationcodetxt);
				}
			}
			Thread.sleep(1000);
			if (remark != null) {
				if (remarktxt.isEnabled()) {
					element_Clear(remarktxt);
					element_InputTextUsingActionClass(remarktxt, remark);
				}
			}
			Thread.sleep(1000);
			element_Click(addBtn);
			Thread.sleep(1000);
		}
		saveButtonClick();
		String val = validationMessage();
		Assert.assertEquals(val, "Saved Successfully");
	}

	// By Chhaya
	public void validateScheduledFieldVisit(String userID, String date, String scheduledVisits)
			throws InterruptedException {
		pageLoadWaitng();
		String date1 = null;
		String visit1 = null;
		String actValue;
		String expValue;
		String currentDate = dateSelected(date);
		waitForElementVisible(useridtxt);
		element_Clear(useridtxt);
		element_InputTextUsingActionClass(useridtxt, userID);
		element_TextBoxToClickOnTab(useridtxt);
		Thread.sleep(1000);
		for (int i = 0; i < visitTableColumn.size(); i++) {
			String colnm = visitTableColumn.get(i).getText();
			if (colnm.equalsIgnoreCase(currentDate)) {
				date1 = visitTableColumn.get(i).getText();
				WebElement scheVisit = visitTableColumn.get(i).findElement(By.xpath("following-sibling::td[1]"));
				visit1 = scheVisit.getText();
			}
		}
		Thread.sleep(2000);
		actValue = date1 + ", " + visit1;
		expValue = currentDate + ", " + scheduledVisits;
		Thread.sleep(1000);
		Assert.assertEquals(actValue, expValue);
		Thread.sleep(1000);
	}

	// By Chhaya
	public void copyScheduledFieldVisit(String fVSOfUser, String fVSToUser, String date, String validation)
			throws InterruptedException {
		waitForElementVisible(useridtxt);
		element_Clear(useridtxt);
		element_InputTextUsingActionClass(useridtxt, fVSOfUser);
		element_TextBoxToClickOnTab(useridtxt);
		waitForElementClickable(datetxt);
		String date1 = dateSelectedinddMMyyyy(date);
		element_Clear(datetxt);
		element_InputTextUsingActionClass(datetxt, date1);
		pageLoadWaitng();
		cancelButtonClick();
		Thread.sleep(2000);
		element_Click(copyBtn);
		waitForElementClickable(copyTaskUserId);
		element_Clear(copyTaskUserId);
		element_InputTextUsingActionClass(copyTaskUserId, fVSToUser);
		Thread.sleep(1000);
		element_TextBoxToClickOnEnter(copyTaskUserId);
		Thread.sleep(1000);
		element_ClickUsingJS(processButton);
		Thread.sleep(1000);
		String val = validationMsgXpath.getText();
		Assert.assertEquals(val, validation);
		Thread.sleep(1000);
		element_Click(closeButton);
	}

	// By Chhaya
	public void reassignScheduledFieldVisit(String fVSOfUser, String fVSToUser, String scheduledDate,
			String reassignDate, String validation) throws InterruptedException {
		waitForElementVisible(useridtxt);
		element_Clear(useridtxt);
		element_InputTextUsingActionClass(useridtxt, fVSOfUser);
		element_TextBoxToClickOnTab(useridtxt);
		waitForElementClickable(datetxt);
		String date1 = dateSelectedinddMMyyyy(scheduledDate);
		element_Clear(datetxt);
		element_InputTextUsingActionClass(datetxt, date1);
		pageLoadWaitng();
		cancelButtonClick();
		Thread.sleep(1000);
		element_Click(reassignBtn);
		String reassignDate1 = dateSelectedinddMMyyyy(reassignDate);
		waitForElementClickable(reassignDateXpath);
		element_Clear(reassignDateXpath);
		element_InputTextUsingActionClass(reassignDateXpath, reassignDate1);
		element_TextBoxToClickOnTab(reassignDateXpath);
		element_Clear(reassignTaskUserId);
		element_InputTextUsingActionClass(reassignTaskUserId, fVSToUser);
		Thread.sleep(1000);
		element_TextBoxToClickOnEnter(reassignTaskUserId);
		Thread.sleep(1000);
		element_Click(processButton);
		Thread.sleep(1000);
		waitForElementClickable(reassignOkBtn);
		Thread.sleep(1000);
		element_Click(reassignOkBtn);
		Thread.sleep(1000);
		String val = validationMsgXpath.getText();
		Assert.assertEquals(val, validation);
		Thread.sleep(1000);
		element_Click(closeButton);
	}

	// By Chhaya
	public void createFieldVisitViaImport(String fileFormat, DataTable dataTable)
			throws InterruptedException, IOException {
		pageLoadWaitng();
		String filePath = null;
		element_Click(importButton);
		pageLoadWaitng();
		element_Click(fileTypeXpath);
		element_DropDownSelectByvisibleText(fileTypeXpath, fileFormat);
		Thread.sleep(1000);
		if (fileFormat.equalsIgnoreCase("XLS")) {

			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		} else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\Field Schedule.csv";
		}
		element_InputText(chooseFile, filePath);
		Thread.sleep(2000);
		element_Click(uploadBtn);
		Thread.sleep(1000);
		element_Click(impFldVisProcessBtn);
		Thread.sleep(1000);
		String valMsg = valMsgImpFldVisSch.getText();
		if (fileFormat.equalsIgnoreCase("XLS")) {
			Assert.assertEquals(valMsg, "Processing completed...");
		} else {
			Assert.assertEquals(valMsg, "Processing Completed");
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: " + data.get("UserID") + " Success: " + data.get("Success"));
			String usrId = data.get("UserID");
			String success = data.get("Success");
			String actRes = null;
			for (int i = 0; i < resultTable.size(); i++) {
				String userId1 = resultTable.get(i).getText();
				if (usrId.toUpperCase().equalsIgnoreCase(userId1.toUpperCase())) {
					actRes = resultTable.get(i)
							.findElement(By.xpath("following-sibling::td[not (@hidden)][last()-1]"))
							.getText();
					Thread.sleep(1000);
					break;
				}
			}
			Thread.sleep(1000);
			Assert.assertEquals(actRes, success);
		}
		Thread.sleep(2000);
		element_Click(impFldVisCancelBtn);
	}

	// By Chhaya
	public void validateImportedFieldVisit(String userID, String date, String scheduledVisits)
			throws InterruptedException {
		pageLoadWaitng();
		String date1 = null;
		String visit1 = null;
		String actValue;
		String expValue;
		String currentDate = dateSelected(date);
		waitForElementVisible(useridtxt);
		element_Clear(useridtxt);
		element_InputTextUsingActionClass(useridtxt, userID);
		element_TextBoxToClickOnTab(useridtxt);
		Thread.sleep(1000);
		for (int i = 0; i < visitTableColumn.size(); i++) {
			String colnm = visitTableColumn.get(i).getText();
			if (colnm.equalsIgnoreCase(currentDate)) {
				date1 = visitTableColumn.get(i).getText();
				WebElement scheVisit = visitTableColumn.get(i).findElement(By.xpath("following-sibling::td[1]"));
				visit1 = scheVisit.getText();
			}
		}
		Thread.sleep(2000);
		actValue = date1 + ", " + visit1;
		expValue = currentDate + ", " + scheduledVisits;
		Thread.sleep(1000);
		Assert.assertEquals(actValue, expValue);
		Thread.sleep(1000);
	}
}
