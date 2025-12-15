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
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;
import io.cucumber.datatable.DataTable;

public class AttendanceCorrectionPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(AttendanceCorrectionPO.class);

	public AttendanceCorrectionPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "AutoAllUsersID")
	private WebElement userIdTxt;

	@FindBy(id = "_txtPDate")
	private WebElement atdDateTxt;

	@FindBy(id = "cmbShift")
	private WebElement shiftDrop;

	@FindBy(id = "cmbStat")
	private WebElement dayDrop;

	@FindBy(id = "cboManABPRMrk")
	private WebElement manualStatusMarkingDD;

	@FindBy(id = "txtRemark")
	private WebElement remarkTxt;

	@FindBy(xpath = "//*[@id=\"collapseTwo\"]//*[@placeholder=\"HH:MM\"]")
	private List<WebElement> timeP;

	@FindBy(xpath = "//*[@class=\"panel-body no-padding\"]//*[contains(@id,\"cboSpFn\")]")
	private List<WebElement> spFunctionsDD;

	@FindBy(xpath = "//*[@class=\"panel-body no-padding\"]//*[contains(@id,\"cboInReason\") or contains(@id,\"cmbFaceManForPunch\") ]")
	private List<WebElement> inOutReasonDD;

	@FindBy(xpath = "//*[@class=\"panel-body no-padding\"]//*[@class=\"ImgEdit\" or @class=\"ToggleBackGround\"]")
	private List<WebElement> editButton;

	@FindBy(xpath = "//*[@class=\"panel-body no-padding\"]//*[contains(@id,\"txtInReason\") or contains(@id,\"txtOutReason\")]")
	private List<WebElement> inOutReasonTextBox;

	@FindBy(xpath = "//*[@default=\"Break Punches\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> breakPunchesPanelClosed;

	@FindBy(xpath = "//*[contains(text(),'Break Punches')]")
	private WebElement breakPunchesPanel;

	@FindBy(id = "BrkStartTime")
	private WebElement breakStartTimeTxt;

	@FindBy(id = "BrkEndTime")
	private WebElement breakEndTimeTxt;

	@FindBy(xpath = "//*[@default=\"Attendance Details\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> atdDetailsPanelClosed;

	@FindBy(xpath = "//*[contains(text(),'Attendance Details')]")
	private WebElement atdDetailsPanel;

	@FindBy(id = "btnAppPunch")
	private WebElement allPunchesBtn;

	@FindBy(xpath = "//*[@key='Punch Details']")
	private WebElement labelPunchDetailsPage;

	@FindBy(id = "npunchgridaddBtn")
	private WebElement plusBtn;

	@FindBy(xpath = "//*[@class=\"modal-footer modal-popup-footer\"]//*[@default='Close']")
	private WebElement closeBtn;

	@FindBy(xpath = "//*[@id='div_grd_npunchgrid']//*[@name='cmnTxtSearch']")
	private WebElement punchDetailsSearch;

	@FindBy(xpath = "//*[@id=\"div_grd_npunchgrid\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]")
	private WebElement punchDetailsTable;

	@FindBy(xpath = "//*[@id=\"div_grd_npunchgrid\"]//table/tbody//*[@id='savebtn' and not(@hidden)]")
	private WebElement saveBtn;

	@FindBy(xpath = "//*[@id=\"div_grd_npunchgrid\"]//table/tbody//*[@title=\"Delete\" and not(@hidden)]")
	private WebElement deleteBtn;

	@FindBy(xpath = "//*[@id=\"div_grd_npunchgrid\"]//table/tbody//*[@title=\"Edit\" and not(@hidden)]")
	private WebElement editBtn;

	@FindBy(id = "Time")
	private WebElement timeTxt;

	@FindBy(id = "SelectedCboSpFn")
	private WebElement npunchSpFunctionDD;

	@FindBy(id = "NpunchReason")
	private WebElement selectReasonDD;

	@FindBy(xpath = "//*[@id=\"div_grd_npunchgrid\"]//table/tbody//img")
	private WebElement reasonImg;

	@FindBy(id = "txtNpunchReason")
	private WebElement reasonTxt;

	@FindBy(id = "NpunchReason")
	private WebElement editReasonDD;

	@FindBy(xpath = "//*[@id=\"div_grd_npunchgrid\"]//table/tbody//a[@id='savebtn' and not(@hidden)]")
	private WebElement okBtn;

	@FindBy(xpath = "//*[@id=\"collapseOne\"]//*[@class=\"panel-body no-padding\"]//*[@class=\"form-group\"]//label")
	private List<WebElement> lablesOfattendanceDetails;

	@FindBy(id = "txtHalf1")
	private WebElement atdStatusTxt1;

	@FindBy(id = "txtHalf2")
	private WebElement atdStatusTxt2;

	@FindBy(id = "txtStatusSmry")
	private WebElement StatusSummaryTxt;

	@FindBy(id = "imbbtnBrkHrsDetail")
	private WebElement breakHrsDetailBtnImg;

	@FindBy(id = "imgbtnLateDetail")
	private WebElement lateInDetailBtnImg;

	@FindBy(id = "imgbtnEarlyOutDetail")
	private WebElement earlyOutDetailBtnImg;

	@FindBy(xpath = "//*[@class=\"modal-body modal-body-ms\"]//label")
	private List<WebElement> labelsDetails;

	@FindBy(xpath = "//*[@class=\"modal-footer modal-popup-footer\"]//*[@default='Close']")
	private WebElement closeButton2;

	@FindBy(id = "imgbtnOTDetail")
	private WebElement imgOTDetails;

	@FindBy(xpath = "//*[contains(text(),'Overtime Summary For')]")
	private WebElement otSumryLabel;

	@FindBy(xpath = "//*[@class=\"modal-body modal-body-md modalWithFooter form-hr\"]//label")
	private List<WebElement> overtimeDetailsLabels;

	@FindBy(id = "BrkStartPunchPos")
	private WebElement breakStartPunchDD;

	@FindBy(id = "BrkEndPunchPos")
	private WebElement breakEndPunchDD;

	@FindBy(id = "txtAdjustWrkHrs")
	private WebElement adjstedWrkHrsTxt;

	@FindBy(id = "btnRemoveAdjHours")
	private WebElement deleteBtnAdjstedWrkHrs;

	@FindBy(id = "btnCancel")
	private WebElement headerCancelBtn;

	@FindBy(xpath = "//*[@key='btnConfirmOk']")
	private WebElement popUpOKButton;

	/////////////
	// Created by Mayank
	public String attendanceCorrectionApplicationAPI(List<String> columnHeader, List<String> apiParameter,
			Map<String, String> data) {
		String apiPar = null;
		
		if (columnHeader.contains("Action")) {
			if (data.get("Action") != null) {
				apiParameter.add("Action=" + data.get("Action"));
			}
		}
		if (columnHeader.contains("userid")) {
			if (data.get("userid") != null) {
				apiParameter.add("userid=" + data.get("userid"));
			}
		}
		if (columnHeader.contains("process-date")) {
			if (data.get("process-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("process-date"));
				String daterange = date.replace("/", "");
				logger.info(daterange);
				// String date=dateSelectedinddMMyyyy(data.get("process-date"));
				apiParameter.add("process-date=" + daterange);
			}
		}
		if (columnHeader.contains("punch1-datetime")) {
			if (data.get("process-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("process-date"));
				String daterange = date.replace("/", "");
				// String date=dateSelectedinddMMyyyy(data.get("process-date"));
				String punch1 = daterange + data.get("punch1-datetime");
				apiParameter.add("punch1-datetime=" + punch1);
			}
		}
		if (columnHeader.contains("punch2-datetime")) {
			if (data.get("process-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("process-date"));
				String daterange = date.replace("/", "");
				// String date=dateSelectedinddMMyyyy(data.get("process-date"));
				String punch2 = daterange + data.get("punch2-datetime");
				apiParameter.add("punch2-datetime=" + punch2);
			}
		}
		if (columnHeader.contains("punch3-datetime")) {
			if (data.get("process-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("process-date"));
				String daterange = date.replace("/", "");
				// String date=dateSelectedinddMMyyyy(data.get("process-date"));
				String punch3 = daterange + data.get("punch3-datetime");
				apiParameter.add("punch3-datetime=" + punch3);
			}
		}
		if (columnHeader.contains("punch4-datetime")) {
			if (data.get("process-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("process-date"));
				String daterange = date.replace("/", "");
				// String date=dateSelectedinddMMyyyy(data.get("process-date"));
				String punch4 = daterange + data.get("punch4-datetime");
				apiParameter.add("punch4-datetime=" + punch4);
			}
		}
		if (columnHeader.contains("punch5-datetime")) {
			if (data.get("process-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("process-date"));
				String daterange = date.replace("/", "");
				// String date=dateSelectedinddMMyyyy(data.get("process-date"));
				String punch5 = daterange + data.get("punch5-datetime");
				apiParameter.add("punch5-datetime=" + punch5);
			}
		}
		if (columnHeader.contains("punch6-datetime")) {
			if (data.get("process-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("process-date"));
				String daterange = date.replace("/", "");
				// String date=dateSelectedinddMMyyyy(data.get("process-date"));
				String punch6 = daterange + data.get("punch6-datetime");
				apiParameter.add("punch6-datetime=" + punch6);
			}
		}
		if (columnHeader.contains("Shift")) {
			if (data.get("Shift") != null) {
				apiParameter.add("Shift=" + data.get("Shift"));
			}
		}

		return apiPar;
	}

	public void attendanceCorrectionFromSA(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(userIdTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: " + data.get("UserID") + " AttendanceDate: " + data.get("AttendanceDate"));
			String userID = data.get("UserID");
			String attendanceDate = staticDateOrPlusMinusFromCurrentDate(data.get("AttendanceDate"));
			String shift = data.get("Shift");
			String day = data.get("Day");
			String manualStatusMarking = data.get("ManualStatusMarking");
			String remark = data.get("Remark");
			String breakStartTime = data.get("BreakStartTime");
			String breakEndTime = data.get("BreakEndTime");
			String breakStartPunch = data.get("BreakStartPunch");
			String breakEndPunch = data.get("BreakEndPunch");
			String validation = data.get("Validation");
			element_Clear(userIdTxt);
			element_dynamicDDSelect(userIdTxt, userID);
			element_TextBoxToClickOnTab(userIdTxt);
			Thread.sleep(1500);
			element_Clear(atdDateTxt);
			element_InputTextUsingActionClass(atdDateTxt, attendanceDate);
			Thread.sleep(2000);
			if (shift != null) {
				element_DropDownSelectByvisibleText(shiftDrop, shift);
				Thread.sleep(500);
			}
			if (day != null) {
				element_DropDownSelectByvisibleText(dayDrop, day);
				Thread.sleep(500);
			}
			if (manualStatusMarking != null) {
				element_DropDownSelectByvisibleText(manualStatusMarkingDD, manualStatusMarking);
				Thread.sleep(500);
			}
			if (remark != null) {
				element_Clear(remarkTxt);
				element_InputTextUsingActionClass(remarkTxt, remark);
				Thread.sleep(500);
			}
			for (int i = 0; i < timeP.size(); i++) {
				String punchTime = "Punch" + (i + 1) + "-Time";
				String spFunc = "SpFunction" + (i + 1);
				String reasonDDCol = "SelectReason" + (i + 1);
				String reasonTxtCol = "CustomReason" + (i + 1);
				if (data.get(punchTime) != null) {
					timeP.get(i).clear();
					//timeP.get(i).sendKeys(data.get(punchTime));
					element_inputTextUsingActionClassCharacterOneByOne(timeP.get(i), data.get(punchTime));
					if (data.get(spFunc) != null) {
						element_DropDownSelectByvisibleText(spFunctionsDD.get(i), data.get(spFunc));
						Thread.sleep(500);
					}
					if (data.get(reasonDDCol) != null) {
						element_DropDownSelectByvisibleText(inOutReasonDD.get(i), data.get(reasonDDCol));
						Thread.sleep(500);
					}
					if (data.get(reasonTxtCol) != null) {
						element_Click(editButton.get(i));
						Thread.sleep(1000);
						element_Clear(inOutReasonTextBox.get(i));
						element_InputTextUsingActionClass(inOutReasonTextBox.get(i), data.get(reasonTxtCol));
						Thread.sleep(500);
					}
				}
			}
			if (breakStartTime != null || breakEndTime != null || breakStartPunch != null || breakEndPunch != null) {
				if (breakPunchesPanelClosed.size() > 0) {
					element_Click(breakPunchesPanel);
					Thread.sleep(1500);
				}
				if (breakStartPunch != null) {
					element_DropDownSelectByvisibleText(breakStartPunchDD, breakStartPunch);
					Thread.sleep(500);
				}
				if (breakEndPunch != null) {
					element_DropDownSelectByvisibleText(breakEndPunchDD, breakEndPunch);
					Thread.sleep(500);
				}
				if (breakStartTime != null) {
					element_Clear(breakStartTimeTxt);
					element_inputTextUsingActionClassCharacterOneByOne(breakStartTimeTxt, breakStartTime);
					element_TextBoxToClickOnTab(breakStartTimeTxt);
				}
				if (breakEndTime != null) {
					element_Clear(breakEndTimeTxt);
					element_inputTextUsingActionClassCharacterOneByOne(breakEndTimeTxt, breakEndTime);
					element_TextBoxToClickOnTab(breakEndTimeTxt);
				}
			}
			saveButtonClick();
			String valMsg = validationMessage();
			Assert.assertEquals(valMsg, validation);
			reloadPageButtonClick();
		}
	}

	public void attendanceCorrectionNPunchUserBySA(String userId, String atdDate, String shift, String day,
			String remark, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(userIdTxt);
		element_Clear(userIdTxt);
		element_dynamicDDSelect(userIdTxt, userId);
		element_TextBoxToClickOnTab(userIdTxt);
		Thread.sleep(1000);
		String attendanceDate = staticDateOrPlusMinusFromCurrentDate(atdDate);
		element_Clear(atdDateTxt);
		element_InputTextUsingActionClass(atdDateTxt, attendanceDate);
		Thread.sleep(2000);
		element_DropDownSelectByvisibleText(shiftDrop, shift);
		Thread.sleep(500);
		element_DropDownSelectByvisibleText(dayDrop, day);
		Thread.sleep(500);
		element_Clear(remarkTxt);
		element_InputTextUsingActionClass(remarkTxt, remark);
		Thread.sleep(1000);
		element_Click(allPunchesBtn);
		pageLoadWaitng();
		waitForElementVisible(labelPunchDetailsPage);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(" Action: " + data.get("Action"));
			String actualTime = data.get("ActualTime");
			String action = data.get("Action");
			String newTime = data.get("NewTime");
			String spFunction = data.get("SpFunction");
			String selectReason = data.get("SelectReason");
			String customReason = data.get("CustomReason");
			if (action != null) {
				if (actualTime != null && action.equalsIgnoreCase("edit") && newTime != null) {
					element_Clear(punchDetailsSearch);
					element_InputTextUsingActionClass(punchDetailsSearch, actualTime);
					element_TextBoxToClickOnEnter(punchDetailsSearch);
					Thread.sleep(1000);
					String getTime = punchDetailsTable.getText();
					if (getTime.equalsIgnoreCase(actualTime)) {
						Thread.sleep(400);
						element_Click(editBtn);
						Thread.sleep(1000);
						element_Clear(timeTxt);
						element_InputTextUsingActionClass(timeTxt, newTime);
						Thread.sleep(1000);
						if (spFunction != null) {
							element_DropDownSelectByvisibleText(npunchSpFunctionDD, spFunction);
							Thread.sleep(1000);
						}
						if (selectReason != null) {
							element_DropDownSelectByvisibleText(editReasonDD, selectReason);
							Thread.sleep(1000);
						}
						if (customReason != null) {
							element_Click(reasonImg);
							Thread.sleep(1000);
							element_Clear(reasonTxt);
							element_InputTextUsingActionClass(reasonTxt, customReason);
							Thread.sleep(1000);
						}
						element_Click(okBtn);
					}
				} else if (action.equalsIgnoreCase("add") && newTime != null) {
					element_Click(plusBtn);
					Thread.sleep(1000);
					element_InputTextUsingActionClass(timeTxt, newTime);
					element_TextBoxToClickOnTab(timeTxt);
					Thread.sleep(1000);
					if (spFunction != null) {
						element_DropDownSelectByvisibleText(npunchSpFunctionDD, spFunction);
						Thread.sleep(500);
					}
					Thread.sleep(1000);
					if (selectReason != null) {
						element_DropDownSelectByvisibleText(selectReasonDD, selectReason);
						Thread.sleep(500);
					}
					Thread.sleep(1000);
					if (customReason != null) {
						element_Click(reasonImg);
						Thread.sleep(500);
						element_Clear(reasonTxt);
						element_InputTextUsingActionClass(reasonTxt, customReason);
						Thread.sleep(500);
					}
					Thread.sleep(1000);
					element_Click(saveBtn);
					Thread.sleep(1000);
				} else if (actualTime != null && action.equalsIgnoreCase("delete")) {
					element_Clear(punchDetailsSearch);
					element_inputTextUsingActionClassCharacterOneByOne(punchDetailsSearch, actualTime);
					element_TextBoxToClickOnEnter(punchDetailsSearch);
					Thread.sleep(1000);
					String getTime = punchDetailsTable.getText();
					if (getTime.equalsIgnoreCase(actualTime)) {
						element_Click(deleteBtn);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
					}
				}
			}
		}
		Thread.sleep(700);
		element_Click(closeBtn);
		Thread.sleep(1500);
		saveButtonClick();
		String valMsg = validationMessage();
		Assert.assertEquals(valMsg, "Saved Successfully");
	}

	public void verifyAtdDetails(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userIdTxt);
		List<String> headerD = new ArrayList<>();
		List<List<String>> header = dataTable.asLists();
		for (int i = 0; i < 1; i++) {
			for (int j = 0; j < header.get(i).size(); j++) {
				if (header.get(i).get(j).equalsIgnoreCase("UserID") == false
						&& header.get(i).get(j).equalsIgnoreCase("AttendanceDate") == false
						&& header.get(i).get(j).equalsIgnoreCase("AttendanceStatus") == false
						&& header.get(i).get(j).equalsIgnoreCase("ManualStatusMarking") == false
						&& header.get(i).get(j).equalsIgnoreCase("StatusSummary") == false
						&& header.get(i).get(j).equalsIgnoreCase("Remark") == false
						&& header.get(i).get(j).equalsIgnoreCase("BreakHoursDetails") == false
						&& header.get(i).get(j).equalsIgnoreCase("Late-INDetails") == false
						&& header.get(i).get(j).equalsIgnoreCase("Early-OUTDetails") == false) {
					headerD.add(header.get(i).get(j));
				}
			}
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: " + data.get("UserID") + " AttendanceDate: " + data.get("AttendanceDate"));
			String userID = data.get("UserID");
			String attendanceDate = staticDateOrPlusMinusFromCurrentDate(data.get("AttendanceDate"));
			String attendanceStatus = data.get("AttendanceStatus");
			String manualStatusMarking = data.get("ManualStatusMarking");
			String statusSummary = data.get("StatusSummary");
			String remark = data.get("Remark");
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, userID);
			element_TextBoxToClickOnTab(userIdTxt);
			Thread.sleep(1500);
			element_Clear(atdDateTxt);
			element_InputTextUsingActionClass(atdDateTxt, attendanceDate);
			Thread.sleep(2000);
			if (attendanceStatus != null) {
				String[] adtStatusAr = attendanceStatus.split("-");
				Assert.assertEquals(atdStatusTxt1.getAttribute("value"), adtStatusAr[0]);
				Assert.assertEquals(atdStatusTxt2.getAttribute("value"), adtStatusAr[1]);
			}
			if (manualStatusMarking != null) {
				Assert.assertEquals(element_DropDownFirstSelectedValue(manualStatusMarkingDD), manualStatusMarking);
			}
			if (statusSummary != null) {
				Assert.assertEquals(StatusSummaryTxt.getAttribute("value"), statusSummary);
			}
			if (remark != null) {
				Assert.assertEquals(remarkTxt.getAttribute("value"), remark);
			}
			if (atdDetailsPanelClosed.size() > 0) {
				element_Click(atdDetailsPanel);
				Thread.sleep(1500);
			}
			// loop to verify attendance details
			for (int j = 0; j < headerD.size(); j++) {
				for (int i = 0; i < lablesOfattendanceDetails.size(); i++) {
					if (headerD.get(j).equalsIgnoreCase(lablesOfattendanceDetails.get(i).getText())) {
						if (data.get(headerD.get(j)) != null) {
							Assert.assertEquals(lablesOfattendanceDetails.get(i)
									.findElement(By.xpath("following::input[@placeholder='HH:MM']"))
									.getAttribute("value"), data.get(headerD.get(j)));
						} else {
							String actualV = lablesOfattendanceDetails.get(i)
									.findElement(By.xpath("following::input[@placeholder='HH:MM']"))
									.getAttribute("value");
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
			if (data.get("BreakHoursDetails") != null) {
				element_Click(breakHrsDetailBtnImg);
				pageLoadWaitng();
				Thread.sleep(1000);
				String[] ArBreakHoursDetails = data.get("BreakHoursDetails").split(",");
				for (int i = 0; i < ArBreakHoursDetails.length; i++) {
					if (ArBreakHoursDetails[i].length() > 0 && ArBreakHoursDetails[i].isEmpty() != true) {
						String actValue = labelsDetails.get(i).findElement(By.xpath("following::input[@type=\"text\"]"))
								.getAttribute("value");
						Assert.assertEquals(actValue, ArBreakHoursDetails[i]);
					}
				}
				Thread.sleep(700);
				element_Click(closeButton2);
				Thread.sleep(1500);
			}
			if (data.get("Late-INDetails") != null) {
				element_Click(lateInDetailBtnImg);
				pageLoadWaitng();
				String[] ArLateINDetails = data.get("Late-INDetails").split(",");
				for (int i = 0; i < ArLateINDetails.length; i++) {
					if (ArLateINDetails[i].length() > 0 && ArLateINDetails[i].isEmpty() != true) {
						String actualValue = labelsDetails.get(i)
								.findElement(By.xpath("following::input[@type=\"text\"]")).getAttribute("value");
						Assert.assertEquals(actualValue, ArLateINDetails[i]);
					}
				}
				Thread.sleep(700);
				element_Click(closeButton2);
				Thread.sleep(1500);
			}
			if (data.get("Early-OUTDetails") != null) {
				element_Click(lateInDetailBtnImg);
				pageLoadWaitng();
				String[] ArEarlyOUTDetails = data.get("Early-OUTDetails").split(",");
				for (int i = 0; i < ArEarlyOUTDetails.length; i++) {
					if (ArEarlyOUTDetails[i].length() > 0 && ArEarlyOUTDetails[i].isEmpty() != true) {
						String actualVal = labelsDetails.get(i)
								.findElement(By.xpath("following::input[@type=\"text\"]")).getAttribute("value");
						Assert.assertEquals(actualVal, ArEarlyOUTDetails[i]);
					}
				}
				Thread.sleep(700);
				element_Click(closeButton2);
				Thread.sleep(1500);
			}
			reloadPageButtonClick();
			Thread.sleep(1000);
		}
	}

	public void verifyAttendanceSummary(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userIdTxt);
		List<String> headerD1 = new ArrayList<>();
		List<List<String>> header1 = dataTable.asLists();
		for (int i = 0; i < 1; i++) {
			for (int j = 0; j < header1.get(i).size(); j++) {
				headerD1.add(header1.get(i).get(j));
			}
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: " + data.get("UserID") + " AttendanceDate: " + data.get("AttendanceDate"));
			String userID = data.get("UserID");
			String attendanceDate = staticDateOrPlusMinusFromCurrentDate(data.get("AttendanceDate"));
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, userID);
			element_TextBoxToClickOnTab(userIdTxt);
			Thread.sleep(1500);
			element_Clear(atdDateTxt);
			element_InputTextUsingActionClass(atdDateTxt, attendanceDate);
			Thread.sleep(2000);
			if (atdDetailsPanelClosed.size() > 0) {
				element_Click(atdDetailsPanel);
				Thread.sleep(1500);
				element_Click(imgOTDetails);
				pageLoadWaitng();
				waitForElementVisible(otSumryLabel);
			}
			for (int j = 0; j < headerD1.size(); j++) {
				for (int i = 0; i < overtimeDetailsLabels.size(); i++) {
					if (headerD1.get(j).equalsIgnoreCase(overtimeDetailsLabels.get(i).getText())) {
						if (data.get(headerD1.get(j)) != null) {
							String actualVal1 = overtimeDetailsLabels.get(i).findElement(By.xpath("following::input"))
									.getAttribute("value");
							Assert.assertEquals(actualVal1, data.get(headerD1.get(j)));
						} else {
							String actualVal2 = overtimeDetailsLabels.get(i).findElement(By.xpath("following::input"))
									.getAttribute("value");
							if (actualVal2.isEmpty() == true) {
								actualVal2 = null;
								Assert.assertEquals(actualVal2, data.get(headerD1.get(j)));
							} else {
								Assert.assertEquals(actualVal2, data.get(headerD1.get(j)));
							}
						}
					}
				}
			}
			Thread.sleep(1000);
			element_Click(closeButton2);
			Thread.sleep(1500);
			reloadPageButtonClick();
			Thread.sleep(1000);
		}
	}

	public void deleteAdjstedWrkHrs(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: " + data.get("UserID") + " AttendanceDate: " + data.get("AttendanceDate"));
			String userID = data.get("UserID");
			String attendanceDate = staticDateOrPlusMinusFromCurrentDate(data.get("AttendanceDate"));
			String adjustedWorkHours = data.get("AdjustedWorkHours");
			String validation = data.get("Validation");
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, userID);
			element_TextBoxToClickOnTab(userIdTxt);
			Thread.sleep(1500);
			element_Clear(atdDateTxt);
			element_InputTextUsingActionClass(atdDateTxt, attendanceDate);
			Thread.sleep(2000);
			if (atdDetailsPanelClosed.size() > 0) {
				element_Click(atdDetailsPanel);
				Thread.sleep(1500);
			}
			String getAdjWrkHrs = adjstedWrkHrsTxt.getAttribute("value");
			if (adjustedWorkHours.equalsIgnoreCase(getAdjWrkHrs)) {
				element_Click(headerCancelBtn);
				Thread.sleep(1000);
				element_Click(deleteBtnAdjstedWrkHrs);
				Thread.sleep(1500);
				element_Click(popUpOKButton);
				Thread.sleep(1000);
				String actValMsg = validationMessage();
				Thread.sleep(1000);
				Assert.assertEquals(actValMsg, validation);
			}
			reloadPageButtonClick();
			Thread.sleep(1000);
		}
	}

}