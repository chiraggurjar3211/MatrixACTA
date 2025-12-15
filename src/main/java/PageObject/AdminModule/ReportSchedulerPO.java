package PageObject.AdminModule;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.formula.atp.Switch;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;

public class ReportSchedulerPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(ReportSchedulerPO.class);

	public ReportSchedulerPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//input[@name=\"cmnTxtSearch\"]")
	private WebElement searchBox;

	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> saNames;

	@FindBy(id = "ok")
	private WebElement okButton;

	@FindBy(id = "cmbTempType")
	private WebElement schedulerType;

	@FindBy(id = "cmbTemp")
	private WebElement exportDataTemplate;

	@FindBy(id = "txtSchName")
	private WebElement schedulerName;

	@FindBy(id = "chkActive")
	private WebElement active;

	@FindBy(id = "ddlReport")
	private WebElement report;

	@FindBy(id = "txtEmail")
	private WebElement emailID;

	@FindBy(id = "ddlRepFormat")
	private WebElement reportFormat;

	@FindBy(id = "txtSchRunTime")
	private WebElement scheduleRunTime;

	@FindBy(id = "cboRundays")
	private WebElement scheduleRunDay;

	@FindBy(id = "ddlEvery")
	private WebElement everyDayOfMonth;

	@FindBy(id = "txtOther")
	private WebElement confirmationPeriod;

	@FindBy(id = "txtSchStartTime")
	private WebElement startDayTime;

	@FindBy(id = "txtSchEndTime")
	private WebElement endDayTime;

	@FindBy(xpath = "//*[@class='panel']//*[text()='Filter']/ancestor::div[@class=\"panel\" and not(@hidden)]")
	private List<WebElement> filterPanelcount;

	@FindBy(xpath = "//*[@default=\"Filter\"]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> filterPanelClosedorNot;

	@FindBy(xpath = "//*[@class='panel']//*[text()='Filter']")
	private WebElement filterPanel;

	@FindBy(xpath = "//*[@class='panel']//*[text()='Report Parameters']")
	private WebElement reportParameterPanel;

	@FindBy(xpath = "//*[@class='panel']//*[text()='Export Parameters']")
	private WebElement exportParameterPanel;

	@FindBy(id = "txtExpStartDays")
	private WebElement exportStartDay;

	@FindBy(id = "txtExpEndDays")
	private WebElement exportEndDay;

	@FindBy(id = "cmbTemp11")
	private WebElement exportFileFmt;

	@FindBy(id = "txtExpFileName")
	private WebElement eportFileName;

	@FindBy(id = "txtStartDate")
	private WebElement startDate;

	@FindBy(id = "txtEndDate")
	private WebElement endDate;

	@FindBy(id = "chkGrpOpt")
	private WebElement groupNeededInReport;

	@FindBy(xpath = "//*[@class=\"col-md-4 col-sm-12 form-hr form-hr-small\" or @class=\"col-md-2 col-sm-12 form-hr form-hr-small\"]//input[@type='checkbox']")
	private List<WebElement> checkboxInPrametersTab;

	@FindBy(id = "cboGrpLvl")
	private WebElement groupBy;

	@FindBy(id = "cboGroupBy")
	private WebElement groupByinOutSummary;

	@FindBy(xpath = "//*[text()=\"Confirm Delete\"]")
	private WebElement confirmPopUp;

	@FindBy(id = "grpddl")
	private WebElement selectUsers;

	@FindBy(xpath = "//*[@class=\"panel\" and not(@hidden)]//*[@class=\"control-label mx-input-theme\" and text()=\"Filter\"]")
	private List<WebElement> filterT;

	public String reportSchedulerConfiguration(String schType, String schName, String act, String rpt, String email,
			String rptFormat, String schTime, String schRunDay, String evryDyOfMnth) throws Exception {
		String valMsg = null;
		AbstractMethod.reportschedulerType = schType;
		waitForElementVisible(schedulerName);
		if (rpt.equalsIgnoreCase("Who is in")) {
			Runtime.getRuntime().exec("cmd /c time 20:30:00.00");
		}
		if (element_isEnabled(searchBox) == true) {
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, schName);
			searchBox.sendKeys(Keys.ENTER);
			Thread.sleep(500);
			for (int i = 0; i < saNames.size(); i++) {
				if (saNames.get(i).getText().equalsIgnoreCase(schName)) {
					saNames.get(i).click();
					deleteButtonClick();
					waitForElementVisible(confirmPopUp);
					element_Click(okButton);
					String val = validationMessage();
					Assert.assertEquals(val, "Deleted Successfully");
					break;
				}
			}
		}
		addButtonClick();
		element_DropDownSelectByvisibleText(schedulerType, schType);
		element_InputTextUsingActionClass(schedulerName, schName);
		Boolean actvCheckbox = Boolean.parseBoolean(act);
		if (actvCheckbox == true) {
			if (element_isSelected(active) != true) {
				element_Click(active);
			}
		} else {
			if (element_isSelected(active) == true) {
				element_Click(active);
			}
		}
		if (schType.equalsIgnoreCase("Reports")) {
			AbstractMethod.fi.add(rpt);
			element_DropDownSelectByvisibleText(report, rpt);
			element_DropDownSelectByvisibleText(reportFormat, rptFormat);
			if (filterT.size() > 0) {
				if (filterPanelcount.size() > 0) {
					element_DropDownSelectByvisibleText(selectUsers, "All");
				} else {
					element_Click(filterPanel);
					element_DropDownSelectByvisibleText(selectUsers, "All");
				}
			}
			if (rpt.equalsIgnoreCase("Muster Summary") || rpt.equalsIgnoreCase("Salary Data")
					|| rpt.equalsIgnoreCase("Attendance Register") || rpt.equalsIgnoreCase("Overtime Register")
					|| rpt.equalsIgnoreCase("Shift schedule") || rpt.equalsIgnoreCase("Muster roll")
					|| rpt.equalsIgnoreCase("Leave Encashment") || rpt.equalsIgnoreCase("Leave Credit/Debit")
					|| rpt.equalsIgnoreCase("Leave Register") || rpt.equalsIgnoreCase("Credit/Debit")
					|| rpt.equalsIgnoreCase("Export Data") || rpt.equalsIgnoreCase("Monthly Details")) {
				element_Click(reportParameterPanel);
				element_Clear(startDate);
				element_InputTextUsingActionClass(startDate, "0");
				if (rpt.equalsIgnoreCase("Leave Register")) {
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, "0");
				}
			}
			if (rpt.equalsIgnoreCase("Pending Confirmations")) {
				element_Click(reportParameterPanel);
				element_Clear(confirmationPeriod);
				element_InputTextUsingActionClass(confirmationPeriod, "1");
			}
			if (rpt.equalsIgnoreCase("Enrollment Info")) {
				element_Click(reportParameterPanel);
				for (int j = 0; j < checkboxInPrametersTab.size(); j++) {
					if (checkboxInPrametersTab.get(j).isSelected() != true) {
						checkboxInPrametersTab.get(j).click();
					}
				}

			}
			if (rpt.equalsIgnoreCase("Elevator Access Report")) {
				element_Click(reportParameterPanel);
				element_Clear(startDayTime);
				element_inputTextUsingActionClassCharacterOneByOne(startDayTime, "00:00");
				element_Clear(endDayTime);
				element_inputTextUsingActionClassCharacterOneByOne(endDayTime, "23:59");
			}
		} else {
			AbstractMethod.fi.add(schName);
			element_DropDownSelectByvisibleText(exportDataTemplate, rpt);
			if (filterT.size() > 0) {
				if (filterPanelcount.size() > 0) {
					element_DropDownSelectByvisibleText(selectUsers, "All");
				} else {
					element_Click(filterPanel);
					element_DropDownSelectByvisibleText(selectUsers, "All");
				}
			}
			element_Click(exportParameterPanel);
			Thread.sleep(1000);
			element_Clear(exportStartDay);
			element_InputTextUsingActionClass(exportStartDay, "0");
			element_Clear(eportFileName);
			element_InputTextUsingActionClass(eportFileName, schName);
			if (!rpt.equalsIgnoreCase("API_Template_Monthly") && !rpt.equalsIgnoreCase("Template_Monthly")) {
				element_Clear(exportEndDay);
				element_InputTextUsingActionClass(exportEndDay, "0");
			}
		}
		element_Clear(emailID);
		element_InputTextUsingActionClass(emailID, email);

		String time = changeHoursMinutes(schTime);
		System.out.println(time);
		element_inputTextUsingActionClassCharacterOneByOne(scheduleRunTime, time);

		element_DropDownSelectByvisibleText(scheduleRunDay, schRunDay);
		element_DropDownSelectByvisibleText(everyDayOfMonth, evryDyOfMnth);

		saveButtonClick();
		valMsg = validationMessage();
		return valMsg;
	}

	public String reportParameterUpdate(String reportSchedulerN, String reportNm, String strtDay, String endDay,
			String grpNeedinrpt, String grpBy, String cfp) throws InterruptedException, IOException {
		waitForElementVisible(schedulerName);
		String valMsg = null;
		Boolean grpneeded = false;
		element_Clear(searchBox);
		element_InputTextUsingActionClass(searchBox, reportNm);
		Thread.sleep(2000);
		searchBox.sendKeys(Keys.ENTER);
		Thread.sleep(2000);
		for (int i = 0; i < saNames.size(); i++) {
			if (saNames.get(i).getText().equalsIgnoreCase(reportNm)) {
				saNames.get(i).click();
				Thread.sleep(3000);

				switch (reportSchedulerN) {
				case "In/Out Event":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					grpneeded = Boolean.parseBoolean(grpNeedinrpt);
					if (grpneeded == true) {
						if (groupNeededInReport.isSelected() != true) {
							element_Click(groupNeededInReport);
						}
					} else {
						if (groupNeededInReport.isSelected() == true) {
							element_Click(groupNeededInReport);
						}
					}
					element_DropDownSelectByvisibleText(groupBy, grpBy);
					break;

				case "InOut Summary":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_DropDownSelectByvisibleText(groupBy, grpNeedinrpt);
					element_DropDownSelectByvisibleText(groupByinOutSummary, grpBy);
					break;

				case "Access Denied":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					for (int j = 0; j < checkboxInPrametersTab.size(); j++) {
						if (checkboxInPrametersTab.get(j).isSelected() != true) {
							checkboxInPrametersTab.get(j).click();
						}
					}
					break;

				case "Late In":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Absentee":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Exception":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					for (int j = 0; j < checkboxInPrametersTab.size(); j++) {
						if (checkboxInPrametersTab.get(j).isSelected() != true) {
							checkboxInPrametersTab.get(j).click();
						}
					}
					break;

				case "Attendance Summary":
					if (element_DropDownFirstSelectedValue(schedulerType).equalsIgnoreCase("Reports")) {
						element_Click(reportParameterPanel);
						element_Clear(startDate);
						element_InputTextUsingActionClass(startDate, strtDay);
						element_Clear(endDate);
						element_InputTextUsingActionClass(endDate, endDay);
						element_DropDownSelectByvisibleText(groupBy, grpBy);
					} else {
						element_Click(exportParameterPanel);
						element_Clear(exportStartDay);
						element_InputTextUsingActionClass(exportStartDay, strtDay);
						element_Clear(exportEndDay);
						element_InputTextUsingActionClass(exportEndDay, endDay);
						element_DropDownSelectByvisibleText(exportFileFmt, grpBy);
					}

					break;

				case "Muster Summary":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "Salary Data":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "Attendance Register":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "Overtime Register":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "Leave Application":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					for (int j = 0; j < checkboxInPrametersTab.size(); j++) {
						if (checkboxInPrametersTab.get(j).isSelected() != true) {
							checkboxInPrametersTab.get(j).click();
						}
					}
					break;

				case "Attendance":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					grpneeded = Boolean.parseBoolean(grpNeedinrpt);
					if (grpneeded == true) {
						if (groupNeededInReport.isSelected() != true) {
							element_Click(groupNeededInReport);
						}
					} else {
						if (groupNeededInReport.isSelected() == true) {
							element_Click(groupNeededInReport);
						}
					}
					break;

				case "Early Out":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Doors Accessed by User":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Pending Confirmations":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					element_Clear(confirmationPeriod);
					element_InputTextUsingActionClass(confirmationPeriod, cfp);
					break;

				case "Out Time":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Invalid Events":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "2-Person Access":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Door Held Open":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Early In":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "N-Punch Work Hours":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Overstay":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Total Headcount and Overtime":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "User Presence and Overtime":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Manual Correction":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Shift schedule":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "Muster roll":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "Leave Encashment":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "Leave Credit/Debit":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "Leave Register":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Expired passes":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Pre-registered visitors":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Visitor headcount":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "User Transactions":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Credit/Debit":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "Sales":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Visitor History":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Head Count":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Export Data":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "Tour Details":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "User Consumption":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Daily Work Hours":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Daily Summary":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Monthly Details":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "Overtime Report":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "User Job Details":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Device-Wise Consumption":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Job Summary":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Project Summary":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Device-Wise Events":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					for (int j = 0; j < checkboxInPrametersTab.size(); j++) {
						if (checkboxInPrametersTab.get(j).isSelected() != true) {
							checkboxInPrametersTab.get(j).click();
						}
					}
					break;

				case "Elevator Access Report":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "Continuous Absence/Presence":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_Clear(endDate);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "API_Template_Daily":
					element_Click(exportParameterPanel);
					element_Clear(exportStartDay);
					element_InputTextUsingActionClass(exportStartDay, strtDay);
					element_Clear(exportEndDay);
					element_InputTextUsingActionClass(exportEndDay, endDay);
					element_DropDownSelectByvisibleText(exportFileFmt, grpBy);
					break;

				case "Template_Daily":
					element_Click(exportParameterPanel);
					element_Clear(exportStartDay);
					element_InputTextUsingActionClass(exportStartDay, strtDay);
					element_Clear(exportEndDay);
					element_InputTextUsingActionClass(exportEndDay, endDay);
					element_DropDownSelectByvisibleText(exportFileFmt, grpBy);
					break;

				case "API_Template_ATDEvents":
					element_Click(exportParameterPanel);
					element_Clear(exportStartDay);
					element_InputTextUsingActionClass(exportStartDay, strtDay);
					element_Clear(exportEndDay);
					element_InputTextUsingActionClass(exportEndDay, endDay);
					element_DropDownSelectByvisibleText(exportFileFmt, grpBy);
					break;

				case "API_Template_ACSEvents":
					element_Click(exportParameterPanel);
					element_Clear(exportStartDay);
					element_InputTextUsingActionClass(exportStartDay, strtDay);
					element_Clear(exportEndDay);
					element_InputTextUsingActionClass(exportEndDay, endDay);
					element_DropDownSelectByvisibleText(exportFileFmt, grpBy);
					break;

				case "Template_ATDEvents":
					element_Click(exportParameterPanel);
					element_Clear(exportStartDay);
					element_InputTextUsingActionClass(exportStartDay, strtDay);
					element_Clear(exportEndDay);
					element_InputTextUsingActionClass(exportEndDay, endDay);
					element_DropDownSelectByvisibleText(exportFileFmt, grpBy);
					break;

				case "Template_ACSEvents":
					element_Click(exportParameterPanel);
					element_Clear(exportStartDay);
					element_InputTextUsingActionClass(exportStartDay, strtDay);
					element_Clear(exportEndDay);
					element_InputTextUsingActionClass(exportEndDay, endDay);
					element_DropDownSelectByvisibleText(exportFileFmt, grpBy);
					break;

				case "API_Template_Monthly":
					element_Click(exportParameterPanel);
					element_Clear(exportStartDay);
					element_InputTextUsingActionClass(exportStartDay, strtDay);
					element_DropDownSelectByvisibleText(exportFileFmt, grpBy);
					break;

				case "Template_Monthly":
					element_Click(exportParameterPanel);
					element_Clear(exportStartDay);
					element_InputTextUsingActionClass(exportStartDay, strtDay);
					element_DropDownSelectByvisibleText(exportFileFmt, grpBy);
					break;

				case "C_Date":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "CDateRange":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_Clear(endDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "CMonth":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "CMonthRange":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_Clear(endDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "EventsDate":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "EventsDateRange":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_Clear(endDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "DailyAtdDetDate":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "DailyAtdDetDateRange":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_Clear(endDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "MonSummaryMonth":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "MonSummaryMonRange":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_Clear(endDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				case "MonDetMonth":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					break;

				case "MonDetMonthRange":
					element_Click(reportParameterPanel);
					element_Clear(startDate);
					element_Clear(endDate);
					element_InputTextUsingActionClass(startDate, strtDay);
					element_InputTextUsingActionClass(endDate, endDay);
					break;

				default:
					logger.debug("Report Scheduler Name Not Found!");
					break;
				}
				saveButtonClick();
				valMsg = validationMessage();
				break;
			}
		}
		return valMsg;
	}

}
