package PageObject.AdminModule;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class TaskSchedulerPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(TaskSchedulerPO.class);
	
	public TaskSchedulerPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
		
	}
	
	// Elements //
	
	@FindBy(id = "TaskName")
	private WebElement taskSchedulerName;
	
	@FindBy(id = "chkActive")
	private WebElement activeFlag;
	
	@FindBy(id = "cboTaskList")
	private WebElement schedulerListDD;
	
	@FindBy(id = "txtDBbkupPath")
	private WebElement dbBackupPath;
	
	@FindBy(id = "cboRundays")
	private WebElement runScheduleDD;
	
	@FindBy(id = "ddlEvery")
	private WebElement dayOfMonth; 
	
	@FindBy(id = "cboMonForYear")
	private WebElement monForYearDD; 
	
	@FindBy(xpath = "//*[@class='fieldset_width']//*[@class='checkbox-inline checkbox-inline-width']/input[contains(@id,'chkgrpActdays')]")
	private List<WebElement> scheduleDays;
	
	@FindBy(id = "txtSchRunTime")
	private WebElement scheduleRunTimetext;
	
	// For Delete
	
	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[3]")
	private List<WebElement> schedulerNames;
	
	@FindBy(id = "ok")
	private WebElement popupOkBtn; 
	
	@FindBy(xpath = "//*[@title='About']")
	private WebElement aboutIcon;
	
	@FindBy(xpath = "//*[@default='Close']")
	private WebElement closeBtn;
	
	@FindBy(xpath = "(//*[@class='col-md-5 col-sm-4']/label)[2]")
	private WebElement productVarient;
	
	@FindBy(id="System Utilities")
	private WebElement systemUtilitiesTab;
	
	@FindBy(id="1017")
	private WebElement taskSchedulerPage;
	
	@FindBy(xpath = "//*[@class='anchorclick']//*[@default='Task Parameters']")
	private List<WebElement> taskParametersPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@default='Task Parameters']")
	private WebElement taskParametersPanel;
	
	@FindBy(xpath = "//*[@class='anchorclick']//*[@default='Filter']")
	private List<WebElement> filterPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@default='Filter']")
	private WebElement filterPanel;
	
	@FindBy(id = "rdbPeriod")
	private WebElement processingPeriodDD;
	
	@FindBy(id = "grpddl")
	private WebElement selectUsersDD;
	
	@FindBy(id = "ID")
	private WebElement userIDTxt;
	
	@FindBy(xpath = "//*[@name='grpdd2']")
	private WebElement selectGroupsDD;
	
	@FindBy(id = "grpname")
	private WebElement groupNameTxt;
	
	// Leave Credit
	@FindBy(id = "cboCreditMethod")
	private WebElement creditMethodDD;
	
	@FindBy(id = "ddlLeave")
	private WebElement leaveTypeDD;
	
	@FindBy(id = "txtDays")
	private WebElement noOfDays;
	
	@FindBy(id = "chkProRata")
	private WebElement proRataFlag;
	
	@FindBy(id = "LeavePolicyName")
	private WebElement leavePolicyNameTxt;
	
	@FindBy(xpath = "//*[@id='txtDays']//input")
	private List<WebElement> hoursMins;
	
	//Relieving User Schedule
	@FindBy(id = "ddlUserProcess")
	private WebElement userProcessDD;
	
	@FindBy(id = "chkRevokeDevice")
	private WebElement revokeDeviceFlag;
	
	@FindBy(xpath = "//*[@class='form-group'][not(@hidden)]//*[@id='ddlRunProcessFor']")
	private WebElement runProcessForDD;
	
	@FindBy(xpath = "//*[@name='cosecForm']//*[@class='fieldset_width']//input[contains(@id,'chkgrpActdays')]")
	private List<WebElement> weeklyDays;
	
	// Cafeteria
	@FindBy(id = "txtRecharge")
	private WebElement rechargeAmmountTxt;
	
	// Validity / Expiry Date Checking
	@FindBy(id = "Visa")
	private WebElement visaFlag;
	
	@FindBy(id = "Driving License")
	private WebElement drivingLicenseFlag;
	
	@FindBy(id = "Passport")
	private WebElement passportFlag;
	
	// Continuous Presense Absense
	@FindBy(id = "txtCheckForDays")
	private WebElement checkForDaysTxt;
	
	@FindBy(id = "chkHalfAsFull")
	private WebElement halfAsFullFlag;
	
	@FindBy(xpath = "//*[@id='collapseOne']//*[@class='col-md-7']//input[@type='checkbox']")
	private List<WebElement> allDays;
	
	@FindBy(id = "ShiftPickListName")
	private WebElement shiftNameTxt;
	
	@FindBy(id = "cboCalculationBasisList")
	private WebElement calculationBasisDD;
	
	@FindBy(id = "cboFirstDayWeekList")
	private WebElement firstDayOfWeekDD;
	
	@FindBy(id = "txtWeeklyTargetHrs_1")
	private WebElement weeklyTargetHrTxt;
	
	@FindBy(id = "txtWeeklyTargetHrs_2")
	private WebElement weeklyTargetMinTxt;
	
	@FindBy(id = "cboWrkHrsCalcBaseOnList")
	private WebElement wrkHrsCalbasedOnDD;
	
	@FindBy(id = "chkInclABHrs")
	private WebElement abFlag;
	
	@FindBy(id = "ContABPRCustomABFlg")
	private WebElement abDD;
	
	@FindBy(id = "txtCustomABHrs")
	private WebElement abHrs;
	
	@FindBy(id = "chkInclLVHrs")
	private WebElement leaveFlag;
	
	@FindBy(id = "ContABPRCustomLVFlg")
	private WebElement leaveDD;
	
	@FindBy(id = "txtCustomLVHrs")
	private WebElement leaveHrs;
	
	@FindBy(id = "chkInclTRHrs")
	private WebElement tourFlag;
	
	@FindBy(id = "ContABPRCustomTRFlg")
	private WebElement tourDD;
	
	@FindBy(id = "txtCustomTRHrs")
	private WebElement tourHrs;
	
	@FindBy(id = "chkInclWOHrs")
	private WebElement woFlag;
	
	@FindBy(id = "ContABPRCustomWOFlg")
	private WebElement woDD;
	
	@FindBy(id = "txtCustomWOHrs")
	private WebElement woHrs;
	
	@FindBy(id = "chkInclPHHrs")
	private WebElement phFlag;
	
	@FindBy(id = "ContABPRCustomPHFlg")
	private WebElement phDD;
	
	@FindBy(id = "txtCustomPHHrs")
	private WebElement phHrs;
	
	@FindBy(id = "chkInclFBHrs")
	private WebElement fbFlag;
	
	@FindBy(id = "ContABPRCustomFBFlg")
	private WebElement fbDD;
	
	@FindBy(id = "txtCustomFBHrs")
	private WebElement fbHrs;
	
	@FindBy(id = "chkInclRDHrs")
	private WebElement rdFlag;
	
	@FindBy(id = "ContABPRCustomRDFlg")
	private WebElement rdDD;
	
	@FindBy(id = "txtCustomRDHrs")
	private WebElement rdHrs;
	
	@FindBy(id = "chkInclSingleINHrs")
	private WebElement inFlag;
	
	@FindBy(id = "ContABPRCustomSingleINFlg")
	private WebElement inDD;
	
	@FindBy(id = "txtCustomSingleINHrs")
	private WebElement inHrs;
	
	@FindBy(id = "ActionOnReachMaxDaysFlg")
	private WebElement actionOnUserDD;
	
	@FindBy(id = "txtAutoWeekOffAssig")
	private WebElement autoWOassignTxt;
	
	@FindBy(id = "chkDeductNAFlg")
	private WebElement deductNAFlag;
	
	@FindBy(id = "txtDeductCusNAHrs")
	private WebElement deductNAhrs;
	

	
	
	
	
	
	
	
	
	
	
	// Visitor Pass Surrender
	@FindBy(id = "txtDurationAfterPassExpiry")
	private WebElement durationAfterPassExpiryTxt;
	
	//*************************************ALL FUNCTIONS***************************************
	public String getCOSECProductVarient() throws InterruptedException {
		Thread.sleep(2000);
		element_Click(aboutIcon);
		Thread.sleep(2000);
		String product = productVarient.getText();
		Thread.sleep(2000);
		element_Click(closeBtn);
		return product;
	}
	
	public void goToTaskScheduler() {
		element_Click(systemUtilitiesTab);
		element_Click(taskSchedulerPage);
	}
	
	public void createTaskSchedulerMainMethod(String taskScheduler,   Map<String, String> data) throws InterruptedException {
		switch (taskScheduler) {
		//Mayank
		case "Database Backup":
			AbstractMethod.taskSchedulerName = "Database Backup";
			AbstractMethod.product = getCOSECProductVarient();
			if (product.contains("CENTRA") || product.contains("EVERTECT")) {
				goToTaskScheduler();
				String actual1 = databaseBackup(taskScheduler, data.get("SchedulerName"), data.get("RunSchedule"),data.get("EveryDayOfTheMonth"), data.get("ScheduleRunTime"));
				Assert.assertEquals(actual1, "Saved Successfully");

			} else {
				logger.info("COSEC VYOM is installed so Database Backup Task Scheduler is not supported.");
			}
			
			break;
		
		// Mayank
		case "Monthly Shift Schedule":
			String actual2 = shiftScheduleAtdProcessLeaveProcess(taskScheduler, data);
			Assert.assertEquals(actual2, "Saved Successfully");
			break;
			
		case "Monthly Attendance Process":
			String actual3 = shiftScheduleAtdProcessLeaveProcess(taskScheduler, data);
			Assert.assertEquals(actual3, "Saved Successfully");
			break;
			
		case "Leave Credit Schedule":
			String actual4 = leaveCredit(taskScheduler, data);
			Assert.assertEquals(actual4, "Saved Successfully");
			break;
			
		case "Relieving User Schedule":
			String actual5 = relievingUserScheduleValidityExpiryDateChecking(taskScheduler, data);
			Assert.assertEquals(actual5, "Saved Successfully");
			break;
			
		case "Cafeteria Auto-Recharge":
			String actual6 = cafeteriaRechargePaymentProcess(taskScheduler, data);
			Assert.assertEquals(actual6, "Saved Successfully");
			break;
			
		case "Cafeteria Payment Process":
			String actual7 = cafeteriaRechargePaymentProcess(taskScheduler, data);
			Assert.assertEquals(actual7, "Saved Successfully");
			break;
			
		case "Leave Balance Process":
			String actual8 = shiftScheduleAtdProcessLeaveProcess(taskScheduler, data);
			Assert.assertEquals(actual8, "Saved Successfully");
			break;
			
		case "Validity / Expiry Date Checking":
			String actual9 = relievingUserScheduleValidityExpiryDateChecking(taskScheduler, data);
			Assert.assertEquals(actual9, "Saved Successfully");
			break;
			
		case "Continuous Presence Check":
			String actual10 = continousPresenseAbsense(taskScheduler, data);
			Assert.assertEquals(actual10, "Saved Successfully");
			break;
			
		case "Continuous Absence Check":
			String actual11 = continousPresenseAbsense(taskScheduler, data);
			Assert.assertEquals(actual11, "Saved Successfully");
			break;
			
		case "Visitor Pass Surrender":
			String actual12 = visitorPassSurrender(taskScheduler, data);
			Assert.assertEquals(actual12, "Saved Successfully");
			break;
			
		default:
			logger.info(
					"Task Scheduler Configuration is pending or Task Scheduler Name is incorrect --Mayank");
			break;
		}
	}
	
	// Created by Mayank
	public String databaseBackup(String taskScheduler,String schedulerName, String runSchedule, String everyDayOfTheMonth, String scheduleRunTime) throws InterruptedException {
		Thread.sleep(1000);
		addButtonClick();
		Thread.sleep(500);
		element_Clear(taskSchedulerName);
		element_InputTextUsingActionClass(taskSchedulerName, schedulerName);
		if (!activeFlag.isSelected()) {
			element_Click(activeFlag);
		}
		element_DropDownSelectByvisibleText(schedulerListDD, taskScheduler);
		String path = System.getProperty("user.dir")+"/src/test/resources/TestDataExports";
		element_Clear(dbBackupPath);
		element_InputTextUsingActionClass(dbBackupPath, path);
		element_DropDownSelectByvisibleText(runScheduleDD, runSchedule);
		if (runSchedule.equalsIgnoreCase("Weekly")) {
			for (int i = 0; i < scheduleDays.size(); i++) {
				WebElement ele = scheduleDays.get(i);
				if (!ele.isSelected()) {
					element_Click(ele);
				}
			}
		}
		else {
			String day = getDayInD(everyDayOfTheMonth);
			element_DropDownSelectByvisibleText(dayOfMonth, day);
		}
		String time = changeHoursMinutes(scheduleRunTime);
		element_Clear(scheduleRunTimetext);
		element_inputTextUsingActionClassCharacterOneByOne(scheduleRunTimetext, time);
		Thread.sleep(1000);
		saveButtonClick();
	    String val = validationMessage();
		return val;
	}
	
	// Created by Mayank
	public void deleteTaskScheduler(String schedulerName) throws InterruptedException {
		Thread.sleep(2000);
		if (searchTextBoxTitleBar.isEnabled()) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, schedulerName);
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			String valMsg = null;
			ArrayList<String> list = new ArrayList<String>();
			if (schedulerNames.size() > 0) {
				for (int i = 0; i < schedulerNames.size(); i++) {
					list.add(schedulerNames.get(i).getText());
					if (schedulerNames.get(i).getText().equalsIgnoreCase(schedulerName)) {
						schedulerNames.get(i).click();
						Thread.sleep(1000);
						deleteButtonClick();
						Thread.sleep(500);
						element_Click(popupOkBtn);
						valMsg = validationMessage();
						Assert.assertEquals(valMsg, "Deleted Successfully");
					}
				}
			}
			
		}
	}
	
	
	public String shiftScheduleAtdProcessLeaveProcess(String taskScheduler, Map<String, String> data) throws InterruptedException {
		// Delete Task Scheduler if any
		deleteTaskScheduler(data.get("SchedulerName"));
		// Add Task Scheduler
		Thread.sleep(1000);
		addButtonClick();
		Thread.sleep(500);
		element_Clear(taskSchedulerName);
		element_InputTextUsingActionClass(taskSchedulerName, data.get("SchedulerName"));
		if (!activeFlag.isSelected()) {
			element_Click(activeFlag);
		}
		element_DropDownSelectByvisibleText(schedulerListDD, taskScheduler);
		//Main Parameteres
		if (data.get("RunSchedule") != null) {
			element_DropDownSelectByvisibleText(runScheduleDD, data.get("RunSchedule"));
		}
		if (data.get("EveryDayOfTheMonth") != null) {
			String day = getDayInD(data.get("EveryDayOfTheMonth"));
			element_DropDownSelectByvisibleText(dayOfMonth, day);
		}
		Thread.sleep(1000);
		//Task Parameters Panel
		if (taskParametersPanelOpenOrNot.size()==0) {
			element_Click(taskParametersPanel);
		}
		if (data.get("ProcessingPeriod") != null) {
			element_DropDownSelectByvisibleText(processingPeriodDD, data.get("ProcessingPeriod"));
		}
		Thread.sleep(1000);
		//Filter Panel
		if (filterPanelOpenOrNot.size()==0) {
			element_Click(filterPanel);
		}
		if (data.get("SelectUsers") != null) {
			element_DropDownSelectByvisibleText(selectUsersDD, data.get("SelectUsers"));
			if (!data.get("SelectUsers").equalsIgnoreCase("All")) {
				if (data.get("User") != null) {
					element_InputTextUsingActionClass(userIDTxt, data.get("User"));
					element_TextBoxToClickOnTab(userIDTxt);
				}
			}
		}
		//Footer
		if (data.get("ScheduleRunTime") != null) {
			String time = changeHoursMinutes(data.get("ScheduleRunTime"));
			element_inputTextUsingActionClassCharacterOneByOne(scheduleRunTimetext, time);
		}
		Thread.sleep(1000);
		saveButtonClick();
	    String val = validationMessage();
		return val;
	}
	
	public String leaveCredit(String taskScheduler, Map<String, String> data) throws InterruptedException {
		// Delete Task Scheduler if any
		deleteTaskScheduler(data.get("SchedulerName"));
		// Add Task Scheduler
		Thread.sleep(1000);
		addButtonClick();
		Thread.sleep(500);
		element_Clear(taskSchedulerName);
		element_InputTextUsingActionClass(taskSchedulerName, data.get("SchedulerName"));
		if (!activeFlag.isSelected()) {
			element_Click(activeFlag);
		}
		element_DropDownSelectByvisibleText(schedulerListDD, taskScheduler);
		//Main Parameteres
		if (data.get("RunSchedule") != null) {
			element_DropDownSelectByvisibleText(runScheduleDD, data.get("RunSchedule"));
		}
		if (data.get("EveryDayOfTheMonth") != null) {
			String day = getDayInD(data.get("EveryDayOfTheMonth"));
			element_DropDownSelectByvisibleText(dayOfMonth, day);
		}
		if (data.get("RunSchedule").equalsIgnoreCase("Yearly")) {
			if (data.get("MonthForYearlyCredit") != null) {
				element_DropDownSelectByvisibleText(monForYearDD, data.get("MonthForYearlyCredit"));
			}
		}
		Thread.sleep(1000);
		//Task Parameters Panel
		if (taskParametersPanelOpenOrNot.size()==0) {
			element_Click(taskParametersPanel);
		}
		if (data.get("CreditMethod") != null) {
			element_DropDownSelectByvisibleText(creditMethodDD, data.get("CreditMethod"));
			element_DropDownSelectByvisibleText(leaveTypeDD, data.get("LeaveName"));
			if (data.get("CreditMethod").equalsIgnoreCase("Fixed")) {
				if (hoursMins.size()>0) {
					String hrs = data.get("NumberOfHours").substring(0, 3);
					String min = data.get("NumberOfHours").substring(3, 5);
					for (int j = 0; j < hoursMins.size(); j++) {
						WebElement ele = hoursMins.get(j);
						if (j==0) {
							element_InputTextUsingActionClass(ele, hrs);}
						else if (j==1) {
							element_InputTextUsingActionClass(ele, min);}
					}
				}
				else {
					element_Clear(noOfDays);
					element_InputTextUsingActionClass(noOfDays, data.get("NumberOfDays"));
				}
			}
			else {
				element_InputTextUsingActionClass(leavePolicyNameTxt, data.get("LeavePolicyName"));
				element_TextBoxToClickOnTab(leavePolicyNameTxt);
			}
		}
		if (data.get("ProcessingPeriod") != null) {
			element_DropDownSelectByvisibleText(processingPeriodDD, data.get("ProcessingPeriod"));
		}
		Thread.sleep(1000);
		//Filter Panel
		if (filterPanelOpenOrNot.size()==0) {
			element_Click(filterPanel);
		}
		if (data.get("SelectUsers") != null) {
			element_DropDownSelectByvisibleText(selectUsersDD, data.get("SelectUsers"));
			if (!data.get("SelectUsers").equalsIgnoreCase("All")) {
				if (data.get("User") != null) {
					element_InputTextUsingActionClass(userIDTxt, data.get("User"));
					element_TextBoxToClickOnTab(userIDTxt);
				}
			}
		}
		//Footer
		if (data.get("ScheduleRunTime") != null) {
			String time = changeHoursMinutes(data.get("ScheduleRunTime"));
			element_inputTextUsingActionClassCharacterOneByOne(scheduleRunTimetext, time);
		}
		Thread.sleep(1000);
		saveButtonClick();
	    String val = validationMessage();
		return val;
	}
	
	public String relievingUserScheduleValidityExpiryDateChecking(String taskScheduler, Map<String, String> data) throws InterruptedException {
		// Delete Task Scheduler if any
		deleteTaskScheduler(data.get("SchedulerName"));
		// Add Task Scheduler
		Thread.sleep(1000);
		addButtonClick();
		Thread.sleep(500);
		element_Clear(taskSchedulerName);
		element_InputTextUsingActionClass(taskSchedulerName, data.get("SchedulerName"));
		if (!activeFlag.isSelected()) {
			element_Click(activeFlag);
		}
		element_DropDownSelectByvisibleText(schedulerListDD, taskScheduler);
		//Main Parameteres
		if (data.get("RunSchedule") != null) {
			element_DropDownSelectByvisibleText(runScheduleDD, data.get("RunSchedule"));
		}
		if (data.get("RunSchedule").equalsIgnoreCase("Monthly")) {
			if (data.get("EveryDayOfTheMonth") != null) {
				String day = getDayInD(data.get("EveryDayOfTheMonth"));
				element_DropDownSelectByvisibleText(dayOfMonth, day);
			}
		}
		if (data.get("RunSchedule").equalsIgnoreCase("Weekly")) {
				for (WebElement ele : weeklyDays) {
					if (!ele.isSelected()) {
						element_Click(ele);
					}
				}
		}
		Thread.sleep(1000);
		//Task Parameters Panel
		if (taskParametersPanelOpenOrNot.size()==0) {
			element_Click(taskParametersPanel);
		}
		if (data.get("Process") != null) {
			element_DropDownSelectByvisibleText(userProcessDD, data.get("Process"));
			Thread.sleep(2000);
			if (data.get("Process").equalsIgnoreCase("Delete User")) {
				logger.debug("RunProcessFor=all");
				element_DropDownSelectByvisibleText(runProcessForDD, data.get("RunProcessFor"));
			}
		}
		if (data.get("RevokeAssignedDevices") != null) {
			if (revokeDeviceFlag.isEnabled()) {
				Boolean RevokeAssignedDevices1 = Boolean.parseBoolean(data.get("RevokeAssignedDevices"));
				if (RevokeAssignedDevices1==true) {
					if (!revokeDeviceFlag.isSelected()) {
						element_Click(revokeDeviceFlag);
					}
				}
				else {
					if (revokeDeviceFlag.isSelected()) {
						element_Click(revokeDeviceFlag);
					}
				}
			}
		}
		// For Validity / Expiry Date Checking
		Thread.sleep(1500);
		if (data.get("Visa") != null) {
			Boolean visa1 = Boolean.parseBoolean(data.get("Visa"));
			if (visa1==true) {
				if (!visaFlag.isSelected()) {
					element_Click(visaFlag);
				}
			}
			else {
				if (visaFlag.isSelected()) {
					element_Click(visaFlag);
				}
			}
		}
		if (data.get("Driving License") != null) {
			Boolean drivinglicense1 = Boolean.parseBoolean(data.get("Driving License"));
			if (drivinglicense1==true) {
				if (!drivingLicenseFlag.isSelected()) {
					element_Click(drivingLicenseFlag);
				}
			}
			else {
				if (drivingLicenseFlag.isSelected()) {
					element_Click(drivingLicenseFlag);
				}
			}
		}
		if (data.get("Passport") != null) {
			Boolean passport1 = Boolean.parseBoolean(data.get("Passport"));
			if (passport1==true) {
				if (!passportFlag.isSelected()) {
					element_Click(passportFlag);
				}
			}
			else {
				if (passportFlag.isSelected()) {
					element_Click(passportFlag);
				}
			}
		}
		Thread.sleep(1000);
		//Footer
		if (data.get("ScheduleRunTime") != null) {
			String time = changeHoursMinutes(data.get("ScheduleRunTime"));
			element_inputTextUsingActionClassCharacterOneByOne(scheduleRunTimetext, time);
		}
		Thread.sleep(1000);
		saveButtonClick();
	    String val = validationMessage();
		return val;
	}
	
	public String cafeteriaRechargePaymentProcess(String taskScheduler, Map<String, String> data) throws InterruptedException {
		// Delete Task Scheduler if any
		deleteTaskScheduler(data.get("SchedulerName"));
		// Add Task Scheduler
		Thread.sleep(1000);
		addButtonClick();
		Thread.sleep(500);
		element_Clear(taskSchedulerName);
		element_InputTextUsingActionClass(taskSchedulerName, data.get("SchedulerName"));
		if (!activeFlag.isSelected()) {
			element_Click(activeFlag);
		}
		element_DropDownSelectByvisibleText(schedulerListDD, taskScheduler);
		//Main Parameteres
		if (data.get("RunSchedule") != null) {
			if (taskScheduler.equalsIgnoreCase("Cafeteria Auto-Recharge")) {
				element_DropDownSelectByvisibleText(runScheduleDD, data.get("RunSchedule"));
				if (data.get("RunSchedule").equalsIgnoreCase("Weekly")) {
					for (WebElement ele : weeklyDays) {
						if (!ele.isSelected()) {
							element_Click(ele);
						}
					}
				}
			}
		}
		if (data.get("RunSchedule").equalsIgnoreCase("Monthly")) {
			if (data.get("EveryDayOfTheMonth") != null) {
				String day = getDayInD(data.get("EveryDayOfTheMonth"));
				element_DropDownSelectByvisibleText(dayOfMonth, day);
			}
		}
		Thread.sleep(1000);
		//Task Parameters Panel
		if (taskParametersPanelOpenOrNot.size()==0) {
			element_Click(taskParametersPanel);
		}
		//Recharge
		if (data.get("RechargeAmount") != null) {
			element_Clear(rechargeAmmountTxt);
			element_InputTextUsingActionClass(rechargeAmmountTxt, data.get("RechargeAmount"));
		}
		// Payment Process
		if (data.get("ProcessingPeriod") != null) {
			element_DropDownSelectByvisibleText(processingPeriodDD, data.get("ProcessingPeriod"));
		}
		Thread.sleep(1000);
		//Filter Panel
		if (filterPanelOpenOrNot.size()==0) {
			element_Click(filterPanel);
		}
		if (data.get("SelectUsers") != null) {
			element_DropDownSelectByvisibleText(selectUsersDD, data.get("SelectUsers"));
			if (!data.get("SelectUsers").equalsIgnoreCase("All")) {
				if (data.get("User") != null) {
					element_InputTextUsingActionClass(userIDTxt, data.get("User"));
					element_TextBoxToClickOnTab(userIDTxt);
				}
			}
		}
		//Footer
		if (data.get("ScheduleRunTime") != null) {
			String time = changeHoursMinutes(data.get("ScheduleRunTime"));
			element_inputTextUsingActionClassCharacterOneByOne(scheduleRunTimetext, time);
		}
		Thread.sleep(1000);
		saveButtonClick();
	    String val = validationMessage();
		return val;
	}

	public String continousPresenseAbsense(String taskScheduler, Map<String, String> data) throws InterruptedException {
		// Delete Task Scheduler if any
		deleteTaskScheduler(data.get("SchedulerName"));
		// Add Task Scheduler
		Thread.sleep(1000);
		addButtonClick();
		Thread.sleep(500);
		element_Clear(taskSchedulerName);
		element_InputTextUsingActionClass(taskSchedulerName, data.get("SchedulerName"));
		if (!activeFlag.isSelected()) {
			element_Click(activeFlag);
		}
		element_DropDownSelectByvisibleText(schedulerListDD, taskScheduler);
		//Main Parameteres
		
		if (taskScheduler.equalsIgnoreCase("Continuous Presence Check")) {
			if (data.get("CalculationBasis") != null) {
				element_DropDownSelectByvisibleText(calculationBasisDD, data.get("CalculationBasis"));
			}
		}
		if ((taskScheduler.equalsIgnoreCase("Continuous Presence Check") && element_DropDownFirstSelectedValue(calculationBasisDD).equalsIgnoreCase("Days")) || taskScheduler.equalsIgnoreCase("Continuous Absence Check")) {
			if (data.get("CheckForDays") != null) {
				element_Clear(checkForDaysTxt);
				element_InputTextUsingActionClass(checkForDaysTxt, data.get("CheckForDays"));
			}
		}
		if (taskScheduler.equalsIgnoreCase("Continuous Presence Check") && element_DropDownFirstSelectedValue(calculationBasisDD).equalsIgnoreCase("Weekly Hours")) {
			if (data.get("FirstDayOfWeek") != null) {
				String day = staticDayOrPlusMinusFromCurrentDay(data.get("FirstDayOfWeek"));
				element_DropDownSelectByvisibleText(firstDayOfWeekDD, day);
			}
			if (data.get("WeeklyTargetHours") != null) {
				String[] commaSeparatedValues = data.get("WeeklyTargetHours").split(":");
				//element_Click(weeklyTargetHrTxt);
				element_InputTextUsingActionClass(weeklyTargetHrTxt, commaSeparatedValues[0]);
				//element_Click(weeklyTargetMinTxt);
				element_InputTextUsingActionClass(weeklyTargetMinTxt, commaSeparatedValues[1]);
			}
			if (data.get("WorkHrsCalBasedOn") != null) {
				element_DropDownSelectByvisibleText(wrkHrsCalbasedOnDD, data.get("WorkHrsCalBasedOn"));
			}
		}	
		Thread.sleep(1000);
		//Task Parameters Panel
		if (taskParametersPanelOpenOrNot.size()==0) {
			element_Click(taskParametersPanel);
		}
		// Days
		if ((taskScheduler.equalsIgnoreCase("Continuous Presence Check") && element_DropDownFirstSelectedValue(calculationBasisDD).equalsIgnoreCase("Days")) || taskScheduler.equalsIgnoreCase("Continuous Absence Check")) {
			if (data.get("ProcessingPeriod") != null) {
				element_DropDownSelectByvisibleText(processingPeriodDD, data.get("ProcessingPeriod"));
			}
			if (data.get("ConsiderHalfDayPRAsFullDayPR") != null) {
				Boolean considerHalfDayPRAsFullDayPR1 = Boolean.parseBoolean(data.get("ConsiderHalfDayPRAsFullDayPR"));
				if (considerHalfDayPRAsFullDayPR1==true) {
					if (!halfAsFullFlag.isSelected()) {
						element_Click(halfAsFullFlag);
					}
				}
				else {
					if (halfAsFullFlag.isSelected()) {
						element_Click(halfAsFullFlag);
					}
				}
			}
			if (data.get("Days") != null) {
				Boolean days1 = Boolean.parseBoolean(data.get("Days"));
				if (days1==true) {
					for (WebElement ele : allDays) {
						if (!ele.isSelected()) {
							element_Click(ele);
						}
					}
				}
				else {
					for (WebElement ele : allDays) {
						if (ele.isSelected()) {
							element_Click(ele);
						}
					}
				}
			}
			Thread.sleep(1000);
			if (data.get("AB") != null) {
				String[] commaSeparatedValues = data.get("AB").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!abFlag.isSelected()) {
						element_Click(abFlag);
					}
					element_DropDownSelectByvisibleText(abDD, commaSeparatedValues[1]);
					if (abHrs.isEnabled()) {
						element_inputTextUsingActionClassCharacterOneByOne(abHrs, commaSeparatedValues[2]);
					}
				}
				else {
					if (abFlag.isSelected()) {
						element_Click(abFlag);
					}
				}
			}
			if (data.get("Leave") != null) {
				String[] commaSeparatedValues = data.get("Leave").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!leaveFlag.isSelected()) {
						element_Click(leaveFlag);
					}
					element_DropDownSelectByvisibleText(leaveDD, commaSeparatedValues[1]);
					if (leaveHrs.isEnabled()) {
						element_inputTextUsingActionClassCharacterOneByOne(leaveHrs, commaSeparatedValues[2]);
					}
				}
				else {
					if (leaveFlag.isSelected()) {
						element_Click(leaveFlag);
					}
				}
			}
			if (data.get("Tour") != null) {
				String[] commaSeparatedValues = data.get("Tour").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!tourFlag.isSelected()) {
						element_Click(tourFlag);
					}
					element_DropDownSelectByvisibleText(tourDD, commaSeparatedValues[1]);
					if (tourHrs.isEnabled()) {
						element_inputTextUsingActionClassCharacterOneByOne(tourHrs, commaSeparatedValues[2]);
					}
				}
				else {
					if (tourFlag.isSelected()) {
						element_Click(tourFlag);
					}
				}
			}
			if (data.get("WO") != null) {
				String[] commaSeparatedValues = data.get("WO").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!woFlag.isSelected()) {
						element_Click(woFlag);
					}
					element_DropDownSelectByvisibleText(woDD, commaSeparatedValues[1]);
					if (woHrs.isEnabled()) {
						element_inputTextUsingActionClassCharacterOneByOne(woHrs, commaSeparatedValues[2]);
					}
				}
				else {
					if (woFlag.isSelected()) {
						element_Click(woFlag);
					}
				}
			}
			if (data.get("PH") != null) {
				String[] commaSeparatedValues = data.get("PH").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!phFlag.isSelected()) {
						element_Click(phFlag);
					}
					element_DropDownSelectByvisibleText(phDD, commaSeparatedValues[1]);
					if (phHrs.isEnabled()) {
						element_inputTextUsingActionClassCharacterOneByOne(phHrs, commaSeparatedValues[2]);
					}
				}
				else {
					if (phFlag.isSelected()) {
						element_Click(phFlag);
					}
				}
			}
			if (data.get("FB") != null) {
				String[] commaSeparatedValues = data.get("FB").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!fbFlag.isSelected()) {
						element_Click(fbFlag);
					}
					element_DropDownSelectByvisibleText(fbDD, commaSeparatedValues[1]);
					if (fbHrs.isEnabled()) {
						element_inputTextUsingActionClassCharacterOneByOne(fbHrs, commaSeparatedValues[2]);
					}
				}
				else {
					if (fbFlag.isSelected()) {
						element_Click(fbFlag);
					}
				}
			}
			if (data.get("RD") != null) {
				String[] commaSeparatedValues = data.get("RD").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!rdFlag.isSelected()) {
						element_Click(rdFlag);
					}
					element_DropDownSelectByvisibleText(rdDD, commaSeparatedValues[1]);
					if (rdHrs.isEnabled()) {
						element_inputTextUsingActionClassCharacterOneByOne(rdHrs, commaSeparatedValues[2]);
					}
				}
				else {
					if (rdFlag.isSelected()) {
						element_Click(rdFlag);
					}
				}
			}
			if (data.get("IN") != null) {
				String[] commaSeparatedValues = data.get("IN").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!inFlag.isSelected()) {
						element_Click(inFlag);
					}
					element_DropDownSelectByvisibleText(inDD, commaSeparatedValues[1]);
					if (inHrs.isEnabled()) {
						element_inputTextUsingActionClassCharacterOneByOne(inHrs, commaSeparatedValues[2]);
					}
				}
				else {
					if (inFlag.isSelected()) {
						element_Click(inFlag);
					}
				}
			}
		}
		if (taskScheduler.equalsIgnoreCase("Continuous Presence Check") && element_DropDownFirstSelectedValue(calculationBasisDD).equalsIgnoreCase("Days")) {
			if (data.get("AutoWoAssign") != null) {
				element_Clear(autoWOassignTxt);
				element_InputTextUsingActionClass(autoWOassignTxt, data.get("AutoWoAssign"));
			}
		}
		// Weekly
		if (taskScheduler.equalsIgnoreCase("Continuous Presence Check") && element_DropDownFirstSelectedValue(calculationBasisDD).equalsIgnoreCase("Weekly Hours")) {
			if (data.get("DeductLeave") != null) {
				String[] commaSeparatedValues = data.get("DeductLeave").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!leaveFlag.isSelected()) {
						element_Click(leaveFlag);
					}
					element_inputTextUsingActionClassCharacterOneByOne(leaveHrs, commaSeparatedValues[1]);
				}
				else {
					if (leaveFlag.isSelected()) {
						element_Click(leaveFlag);
					}
				}
			}
			if (data.get("DeductTour") != null) {
				String[] commaSeparatedValues = data.get("DeductTour").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!tourFlag.isSelected()) {
						element_Click(tourFlag);
					}
					element_inputTextUsingActionClassCharacterOneByOne(tourHrs, commaSeparatedValues[1]);
				}
				else {
					if (tourFlag.isSelected()) {
						element_Click(tourFlag);
					}
				}
			}
			if (data.get("DeductWO") != null) {
				String[] commaSeparatedValues = data.get("DeductWO").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!woFlag.isSelected()) {
						element_Click(woFlag);
					}
					element_inputTextUsingActionClassCharacterOneByOne(woHrs, commaSeparatedValues[1]);
				}
				else {
					if (woFlag.isSelected()) {
						element_Click(woFlag);
					}
				}
			}
			if (data.get("DeductPH") != null) {
				String[] commaSeparatedValues = data.get("DeductPH").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!phFlag.isSelected()) {
						element_Click(phFlag);
					}
					element_inputTextUsingActionClassCharacterOneByOne(phHrs, commaSeparatedValues[1]);
				}
				else {
					if (phFlag.isSelected()) {
						element_Click(phFlag);
					}
				}
			}
			if (data.get("DeductFB") != null) {
				String[] commaSeparatedValues = data.get("DeductFB").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!fbFlag.isSelected()) {
						element_Click(fbFlag);
					}
					element_inputTextUsingActionClassCharacterOneByOne(fbHrs, commaSeparatedValues[1]);
				}
				else {
					if (fbFlag.isSelected()) {
						element_Click(fbFlag);
					}
				}
			}
			if (data.get("DeductRD") != null) {
				String[] commaSeparatedValues = data.get("DeductRD").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!rdFlag.isSelected()) {
						element_Click(rdFlag);
					}
					element_inputTextUsingActionClassCharacterOneByOne(rdHrs, commaSeparatedValues[1]);
				}
				else {
					if (rdFlag.isSelected()) {
						element_Click(rdFlag);
					}
				}
			}
			if (data.get("DeductNAday") != null) {
				String[] commaSeparatedValues = data.get("DeductNAday").split(",");
				Boolean flag = Boolean.parseBoolean(commaSeparatedValues[0]);
				if (flag==true) {
					if (!deductNAFlag.isSelected()) {
						element_Click(deductNAFlag);
					}
					element_inputTextUsingActionClassCharacterOneByOne(deductNAhrs, commaSeparatedValues[1]);
				}
				else {
					if (deductNAFlag.isSelected()) {
						element_Click(deductNAFlag);
					}
				}
			}
		}
		if (data.get("ActionOnUser") != null) {
			element_DropDownSelectByvisibleText(actionOnUserDD, data.get("ActionOnUser"));
		}
		
		//Filter Panel
		if (filterPanelOpenOrNot.size()==0) {
			element_Click(filterPanel);
		}
		if (data.get("SelectUsers") != null) {
			element_DropDownSelectByvisibleText(selectUsersDD, data.get("SelectUsers"));
			if (data.get("SelectUsers").equalsIgnoreCase("User Wise")) {
				selectUsersOrGroupFromPicklist(data.get("User"), userIDTxt);
			}
			else if (data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
				element_DropDownSelectByvisibleText(selectGroupsDD, data.get("SelectGroups"));
				selectUsersOrGroupFromPicklist(data.get("GroupIDs"), groupNameTxt);
			}
		}
		if ((taskScheduler.equalsIgnoreCase("Continuous Presence Check") && element_DropDownFirstSelectedValue(calculationBasisDD).equalsIgnoreCase("Days")) || taskScheduler.equalsIgnoreCase("Continuous Absence Check")) {
			if (data.get("SelectShift") != null) {
				String[] commaSeparatedValues = data.get("SelectShift").split(",");
				for (int i = 0; i < commaSeparatedValues.length; i++) {
					element_Clear(shiftNameTxt);
					element_dynamicDDSelect(shiftNameTxt, commaSeparatedValues[i]);
//					element_InputTextUsingActionClass(shiftNameTxt, commaSeparatedValues[i]);
//					element_TextBoxToClickOnTab(shiftNameTxt);
				}
			}
		}
		//Footer
		if (data.get("ScheduleRunTime") != null) {
			String time = changeHoursMinutes(data.get("ScheduleRunTime"));
			element_inputTextUsingActionClassCharacterOneByOne(scheduleRunTimetext, time);
		}
		Thread.sleep(1000);
		saveButtonClick();
	    String val = validationMessage();
		return val;
	}

	public String visitorPassSurrender(String taskScheduler, Map<String, String> data) throws InterruptedException {
		// Delete Task Scheduler if any
		deleteTaskScheduler(data.get("SchedulerName"));
		// Add Task Scheduler
		Thread.sleep(1000);
		addButtonClick();
		Thread.sleep(500);
		element_Clear(taskSchedulerName);
		element_InputTextUsingActionClass(taskSchedulerName, data.get("SchedulerName"));
		if (!activeFlag.isSelected()) {
			element_Click(activeFlag);
		}
		element_DropDownSelectByvisibleText(schedulerListDD, taskScheduler);
		//Main Parameteres
		if (data.get("RunSchedule") != null) {
			element_DropDownSelectByvisibleText(runScheduleDD, data.get("RunSchedule"));
		}
		if (data.get("EveryDayOfTheMonth") != null) {
			String day = getDayInD(data.get("EveryDayOfTheMonth"));
			element_DropDownSelectByvisibleText(dayOfMonth, day);
		}
		Thread.sleep(1000);
		//Task Parameters Panel
		if (taskParametersPanelOpenOrNot.size()==0) {
			element_Click(taskParametersPanel);
		}
		if (data.get("DurationAfterPassExpiry") != null) {
			element_Clear(durationAfterPassExpiryTxt);
			element_InputTextUsingActionClass(durationAfterPassExpiryTxt, data.get("DurationAfterPassExpiry"));
		}
		Thread.sleep(1000);
		//Footer
		if (data.get("ScheduleRunTime") != null) {
			String time = changeHoursMinutes(data.get("ScheduleRunTime"));
			element_inputTextUsingActionClassCharacterOneByOne(scheduleRunTimetext, time);
		}
		Thread.sleep(1000);
		saveButtonClick();
	    String val = validationMessage();
		return val;
	}
}