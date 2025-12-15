package PageObject.TimeAndAttendance;

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
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class ManageAttendancePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ManageAttendancePO.class);
	
	public ManageAttendancePO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements

	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_ToDate")
	private WebElement toDateTxt;

	@FindBy(id = "AutoUserID")
	private WebElement userIdTxt;

	@FindBy(id = "btnView")
	private WebElement viewButton;

	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[1]")
	private List<WebElement> manageAtdTbl;

	@FindBy(xpath = "//*[@class=\"attd-summary\"]//*[@class=\"form-group\"]//mx-label")
	private List<WebElement> labelsOfAtdSummary;

	@FindBy(xpath = "//*[@class=\"fa fa-filter user-filter cursor MSFilterIconColor\"]")
	private WebElement filterIcon;

	@FindBy(xpath = "//*[@default=\"More Filter\"]/label")
	private WebElement moreFilterLabel;

	@FindBy(xpath = "//*[@class=\"table-responsive\"]//table/thead//input")
	private WebElement tblHeaderCheckbox;

	@FindBy(xpath = "//*[@name=\"gvExceptionList\"]//*[@class=\"pagination-next\"]")
	private List<WebElement> paginationXpath;

	@FindBy(xpath = "//*[@name=\"gvExceptionList\"]//*[@class=\"pagination-next\"]")
	private WebElement paginationClick;

	@FindBy(id = "btnexceptionFilter_ApplyFilter")
	private WebElement applyButton;

	@FindBy(xpath = "//*[@id=\"exceptionFilter_message\"]//*[@class=\"manage-atd-validation overlay_success\" and not(@hidden)]/label")
	private WebElement exceptionValMsg;

	@FindBy(xpath = "//*[@default=\"More Filter\"]/ancestor::div[1]/button")
	private WebElement moreFilterCloseButton;

	@FindBy(xpath = "//*[@class=\"nav navbar-nav hr-tab hr-tab-user panel-group accordion\"]/li[2]/a")
	private WebElement userSelectionTab;

	@FindBy(id = "grpddl")
	private WebElement selectUsersDD;

	@FindBy(id = "ID")
	private WebElement idTxt;

	@FindBy(xpath = "//*[@id=\"grpddl\" and @class=\"form-control mx-input-theme ng-untouched ng-pristine ng-valid\"]")
	private WebElement selectGroupDD;

	@FindBy(id = "grpid")
	private WebElement groupIdTxt;

	@FindBy(xpath = "//*[@class=\"row div-grp attd-summary\"]//*[@class=\"form-group\"]//mx-label")
	private List<WebElement> labelsOfAtdException;

	@FindBy(id = "btnExport")
	private WebElement exportButton;

	@FindBy(id = "btnImport")
	private WebElement importButton;

	@FindBy(xpath = "//*[@class=\"modal-header\"]/mx-label")
	private WebElement exportExpLbl;

	@FindBy(id = "mpuExport_cboFileFrmt")
	private WebElement fileFormatDD;

	@FindBy(id = "cboPunchToExport")
	private WebElement numofPunchtoExportDD;

	@FindBy(id = "chkisSpFunction")
	private WebElement exportSpFMarkingChk;

	@FindBy(id = "btnmpuExport_btnExportPunches")
	private WebElement exportBtn;

	@FindBy(id = "FileUploader")
	private WebElement chooseBtn;

	@FindBy(id = "btnImportDataFiles_uploadFile")
	private WebElement uploadButton;

	@FindBy(id = "cmbImportDataFiles_ddlFileFormate")
	private WebElement fileFormatDrop;

	@FindBy(id = "btnImportDataFiles_Ok")
	private WebElement processButton;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table//tbody//tr//td[not(@hidden)][1]")
	private List<WebElement> descriptionTable;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@class=\"pagination-next\"]")
	private List<WebElement> processTablePaginationXpath;
	
	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@class=\"pagination-next\"]")
	private WebElement processTablePaginationClick;
	
	@FindBy(xpath = "//*[@id=\"ImportDataFiles_message\"]/div//label")
	private WebElement importPageValMsg;

	@FindBy(xpath = "//*[@class=\"manage-atd-div-btn-right\"]//*[@id='btnImportDataFiles_Cancel']")
	private WebElement importCancelBtn;
	
	@FindBy(xpath = "//*[@class=\"current\"]")
	private WebElement prcsTble1stPgPaginationClick;

	@FindBy(xpath = "//*[@class=\"current\"]")
	private List<WebElement> paginationCount;
	
	@FindBy(xpath = "//*[@key=\"divDownload\"]")
	private WebElement importHeaderLabel;

	//////////////

	
	public void exceptionSelection() throws InterruptedException {
		element_Click(filterIcon);
		pageLoadWaitng();
		waitForElementVisible(moreFilterLabel);
		Thread.sleep(1000);
		int count = 0;
		do {
			Thread.sleep(1000);
			if (count != 0) {
				element_Click(paginationClick);
				Thread.sleep(1000);
			}
			if (element_isSelected(tblHeaderCheckbox) != true) {
				element_Click(tblHeaderCheckbox);
			}
			Thread.sleep(500);

			count++;
			Thread.sleep(1000);
		} while (paginationXpath.size() != 0);
		Thread.sleep(500);
		element_Click(applyButton);
		Thread.sleep(1000);
		String valMsg = exceptionValMsg.getText();
		Assert.assertEquals(valMsg, "Settings saved successfully");
		element_Click(moreFilterCloseButton);
		Thread.sleep(1500);
	}

	public void atdSummaryOfSingleUsr(String userSelection, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		List<String> headerD = new ArrayList<>();
		List<List<String>> header = dataTable.asLists();
		for (int i = 0; i < 1; i++) {
			for (int j = 0; j < header.get(i).size(); j++) {
				if (header.get(i).get(j).equalsIgnoreCase("FromDate") == false
						&& header.get(i).get(j).equalsIgnoreCase("ToDate") == false
						&& header.get(i).get(j).equalsIgnoreCase("UserID") == false) {
					headerD.add(header.get(i).get(j));
				}
			}
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FromDate: "+data.get("FromDate")+" ToDate: "+data.get("ToDate")+" UserID: "+data.get("UserID"));
			if (userSelection.equalsIgnoreCase("Single User")) {
				if (data.get("FromDate") != null && data.get("ToDate") != null) {
					String fromDate = staticDateOrPlusMinusFromCurrentDate(data.get("FromDate"));
					String toDate = staticDateOrPlusMinusFromCurrentDate(data.get("ToDate"));
					element_Clear(fromDateTxt);
					Thread.sleep(500);
					element_InputTextUsingActionClass(fromDateTxt, fromDate);
					element_TextBoxToClickOnTab(fromDateTxt);
					element_Clear(toDateTxt);
					Thread.sleep(500);
					element_InputTextUsingActionClass(toDateTxt, toDate);
					element_TextBoxToClickOnTab(toDateTxt);
//					exceptionSelection();
					element_Clear(userIdTxt);
					Thread.sleep(500);
					element_InputTextUsingActionClass(userIdTxt, data.get("UserID"));
					element_TextBoxToClickOnTab(userIdTxt);
					element_Click(viewButton);
					Thread.sleep(1000);
				}
			}
			for (int k = 0; k < manageAtdTbl.size(); k++) {
				if (manageAtdTbl.get(k).getText().equalsIgnoreCase(data.get("UserID"))) {
					element_Click(manageAtdTbl.get(k));
					for (int j = 0; j < headerD.size(); j++) {
						for (int i = 0; i < labelsOfAtdSummary.size(); i++) {
							if (headerD.get(j).equalsIgnoreCase(labelsOfAtdSummary.get(i).getText())) {
								if (data.get(headerD.get(j)) != null) {
									Assert.assertEquals(labelsOfAtdSummary.get(i)
											.findElement(By.xpath("following::div/label")).getText(),
											data.get(headerD.get(j)));
								} else {
									String actualV = labelsOfAtdSummary.get(i)
											.findElement(By.xpath("following::div/label")).getText();
									if (actualV.isEmpty() == true) {
										actualV = null;
										Assert.assertEquals(actualV, data.get(headerD.get(j)));
									} else {
										Assert.assertEquals(actualV, data.get(headerD.get(j)));
									}
								}
							}
						}
					}
					break;
				}
			}
		}
	}

	public void userSelection(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String fromDate = staticDateOrPlusMinusFromCurrentDate(data.get("FromDate"));
			String toDate = staticDateOrPlusMinusFromCurrentDate(data.get("ToDate"));
			exceptionSelection();
			element_Clear(fromDateTxt);
			Thread.sleep(500);
			element_InputTextUsingActionClass(fromDateTxt, fromDate);
			element_TextBoxToClickOnTab(fromDateTxt);
			element_Clear(toDateTxt);
			Thread.sleep(500);
			element_InputTextUsingActionClass(toDateTxt, toDate);
			element_TextBoxToClickOnTab(toDateTxt);
			element_Click(filterIcon);
			waitForElementVisible(moreFilterLabel);
			element_Click(userSelectionTab);
			Thread.sleep(700);
			element_DropDownSelectByvisibleText(selectUsersDD, data.get("SelectUsers"));
			Thread.sleep(700);
			if (data.get("SelectUsers").equalsIgnoreCase("User Wise") && data.get("UserID") != null) {
				if (element_isDisplayed(idTxt)) {
					selectUsersOrGroupFromPicklist(data.get("UserID"), idTxt);
				}
			}
			if (data.get("SelectUsers").equalsIgnoreCase("Group Wise") && data.get("SelectGroup") != null
					&& data.get("GroupName") != null) {
				if (element_isDisplayed(idTxt)) {
					selectUsersOrGroupFromPicklist(data.get("GroupName"), groupIdTxt);
				}
			}
			element_Click(applyButton);
			Thread.sleep(1000);
			String valMsg = exceptionValMsg.getText();
			Assert.assertEquals(valMsg, "Settings saved successfully");
			element_Click(moreFilterCloseButton);
			Thread.sleep(1500);
			element_Click(viewButton);
			Thread.sleep(500);
		}
	}

	public void validateAtdException(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		List<String> headerD = new ArrayList<>();
		List<List<String>> header = dataTable.asLists();
		for (int i = 0; i < 1; i++) {
			for (int j = 0; j < header.get(i).size(); j++) {
				headerD.add(header.get(i).get(j));
			}
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			for (int j = 0; j < headerD.size(); j++) {
				for (int i = 0; i < labelsOfAtdException.size(); i++) {
					if (headerD.get(j).equalsIgnoreCase(labelsOfAtdException.get(i).getText())) {
						if (data.get(headerD.get(j)) != null) {
							Assert.assertEquals(labelsOfAtdException.get(i)
									.findElement(By.xpath("following::div/a/label")).getText(),
									data.get(headerD.get(j)));
						} else {
							String actualV = labelsOfAtdException.get(i).findElement(By.xpath("following::div/a/label"))
									.getText();
							if (actualV.isEmpty() == true) {
								actualV = null;
								Assert.assertEquals(actualV, data.get(headerD.get(j)));
							} else {
								Assert.assertEquals(actualV, data.get(headerD.get(j)));
							}
						}
					}
				}
			}
		}
	}

	public void exportManageAtdData(String userSelect, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FileFormat: "+data.get("FileFormat"));
			if (userSelect.equalsIgnoreCase("Single User")) {
				if (data.get("FromDate") != null && data.get("ToDate") != null && data.get("UserID") != null) {
					String fromDate = staticDateOrPlusMinusFromCurrentDate(data.get("FromDate"));
					String toDate = staticDateOrPlusMinusFromCurrentDate(data.get("ToDate"));
					element_Clear(fromDateTxt);
					Thread.sleep(500);
					element_InputTextUsingActionClass(fromDateTxt, fromDate);
					element_TextBoxToClickOnTab(fromDateTxt);
					element_Clear(toDateTxt);
					Thread.sleep(500);
					element_InputTextUsingActionClass(toDateTxt, toDate);
					element_TextBoxToClickOnTab(toDateTxt);
					Thread.sleep(500);
					exceptionSelection();
					element_Clear(userIdTxt);
					Thread.sleep(500);
					element_InputTextUsingActionClass(userIdTxt, data.get("UserID"));
					element_TextBoxToClickOnTab(userIdTxt);
					element_Click(viewButton);
					Thread.sleep(1000);
				}
			}
			element_Click(exportButton);
			Thread.sleep(1500);
			waitForElementVisible(exportExpLbl);
			element_DropDownSelectByvisibleText(fileFormatDD, data.get("FileFormat"));
			element_DropDownSelectByvisibleText(numofPunchtoExportDD, data.get("NumofPunchestoExport"));
			if (data.get("ExportSpFMarking") != null) {
				boolean exportSpFMarkingBool = Boolean.parseBoolean(data.get("ExportSpFMarking"));
				if (exportSpFMarkingBool == true) {
					if (element_isSelected(exportSpFMarkingChk) != true) {
						element_Click(exportSpFMarkingChk);
					}
				} else {
					if (element_isSelected(exportSpFMarkingChk) == true) {
						element_Click(exportSpFMarkingChk);
					}
				}
			}
			Thread.sleep(700);
			element_Click(exportBtn);
			Thread.sleep(1000);
			reloadPageButtonClick();
		}
	}

	public void importManageAtdData(String fileFormat, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		String filePath = null;
		element_Click(importButton);
		pageLoadWaitng();
		
		if (fileFormat.equalsIgnoreCase("XLS")) {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		} else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\Attendance Exception.csv";
		}
		Thread.sleep(500);
		element_DropDownSelectByvisibleText(fileFormatDrop, fileFormat);
		Thread.sleep(700);
		element_InputText(chooseBtn, filePath);
		Thread.sleep(2000);
		element_Click(uploadButton);
		Thread.sleep(1000);
		Assert.assertEquals(importPageValMsg.getText(), "File saved successfully");
		Thread.sleep(1500);
		element_ClickUsingJS(processButton);
		pageLoadWaitng();
		waitForElementVisible(importHeaderLabel);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: " + data.get("UserID") + " Success: " + data.get("Success"));
			String attendanceDate = staticDateOrPlusMinusFromCurrentDate(data.get("AttendanceDate"));
			String userID = data.get("UserID");
			String success = data.get("Success");
			String description = data.get("ErrorDescription");
			String actResult = null;
			String actDescription = null;
			int count = 0;
			int j = 0;
			do {
				if(paginationCount.size() > 0) {
					element_Click(prcsTble1stPgPaginationClick);
					Thread.sleep(1000);
				}
				if (count != 0) {
					element_Click(processTablePaginationClick);
					Thread.sleep(1000);
				}
				for (int i = 0; i < descriptionTable.size(); i++) {
					String getAtdDate = descriptionTable.get(i).getText();
					String getUserId = descriptionTable.get(i).findElement(By.xpath("following-sibling::td[1]")).getText();
					if (getAtdDate.equalsIgnoreCase(attendanceDate)&& getUserId.toUpperCase().equalsIgnoreCase(userID.toUpperCase())) {
						actResult = descriptionTable.get(i).findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]")).getText();
						actDescription = descriptionTable.get(i).findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()]")).getText();
						j++;
						break;
					}
				}
				if(j==1) {
					break;
				}
				Thread.sleep(500);
				count++;
			} while (processTablePaginationXpath.size() != 0);
			Thread.sleep(700);
			Assert.assertEquals(actResult, success);
			if(actDescription.isEmpty() == true) {
				actDescription = null;
			}
			Assert.assertEquals(actDescription, description);
		}
		Thread.sleep(700);
		element_Click(importCancelBtn);
		Thread.sleep(1000);
	}
}
