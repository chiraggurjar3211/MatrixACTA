package PageObject.JobProcessingCosting;

import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import PageObject.UserModule.UserConfigurationPO;
import io.cucumber.datatable.DataTable;

public class JobSchedulerPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(JobSchedulerPO.class);
	
	public JobSchedulerPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//Elements
	@FindBy(id = "JobSchedulerName")
	private WebElement jobScedulerNameTxt;
	
	@FindBy(id = "mdok")
	private WebElement confirmDeleteOkBtn;
	
	@FindBy(id = "_SchFromDt")
	private WebElement schStartDateTxt;
	
	@FindBy(id = "_SchToDt")
	private WebElement schEndDateTxt;
	
	@FindBy(id = "SchEnbl")
	private WebElement activeCheckbox;
	
	@FindBy(id = "cboRundays")
	private WebElement scheduleTypeDD;
	
	@FindBy(id = "SchRunOnDay")
	private WebElement everyDayOfMonthDD;
	
	@FindBy(id = "SchRunTime")
	private WebElement scheduleRunTimeTxt;
	
	@FindBy(id = "SchRunForMth")
	private WebElement processingPeriodDD;
	
	@FindBy(xpath = "//*[@class='anchorclick']//*[text()='Job Parameters']")
	private List<WebElement> jobParameterPanelXpath;
	
	@FindBy(xpath = "//*[text()='Job Parameters']")
	private WebElement jobParameterPanel;
	
	@FindBy(id = "JPCActiveAndExpiredJobs2Name")
	private WebElement jobNameTxt;
	
	@FindBy(id = "JPCActiveAndExpiredJobs3Name")
	private WebElement weeklyMonthlyJobNameTxt;
	
	@FindBy(id = "RepeatDays")
	private WebElement repeatDaysTxt;
	
	@FindBy(id = "Active")
	private WebElement activeJobCheckbox;
	
	@FindBy(id = "savebtn")
	private WebElement gridSaveBtn;
	
	@FindBy(xpath = "//*[@class='anchorclick']//*[text()='Select Users']")
	private List<WebElement> selectUsersPanelXpath;
	
	@FindBy(xpath = "//*[@class='panel-heading accordion-heading']//*[text()='Select Users']")
	private WebElement selectUsersPanel;
	
	@FindBy(id = "cboUser")
	private WebElement selectUsersDD;
	
	@FindBy(id = "AllUserWithFilterID")
	private WebElement userIdTxt;
	
	@FindBy(xpath = "//*[@id='txtdefaultname']")
	private WebElement selectGroupDD;
	
	@FindBy(id = "grpname")
	private WebElement groupNameTxt;
	
	@FindBy(id = "Preview")
	private WebElement previewScheduleBtn;
	
	@FindBy(xpath = "//*[@id='WeekOfMonth']")
	private WebElement weekOfMonthDD;
	
	@FindBy(xpath = "//*[@class=\"btn-group open\"]//*[contains(text(),'Check All')]")
	private WebElement commonCheckALlXpath;
	
	@FindBy(xpath = "//*[@class=\"btn-group open\"]//li/a[not(contains(text(),'Check All'))]")
	private List<WebElement> commonSelectionXpath;
	
	@FindBy(xpath = "//*[@id='DaysOfWeek']")
	private WebElement daysOfWeekDD;
	
	@FindBy(xpath = "//*[@id='MonthOfYear']")
	private WebElement monthofYearDD;
	
	@FindBy(id = "FromDOM")
	private WebElement fromDayOfMonthTxt;
	
	@FindBy(id = "ToDOM")
	private WebElement toDayOfMonthTxt;
	
	@FindBy(xpath = "//*[@class='col-md-4 col-sm-4 col-xs-12 grid']//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> jobSchedulerNames;
	
	@FindBy(id = "grdJobSchedulerDetailsaddBtn")
	private WebElement plusButton;
	
	@FindBy(xpath = "//*[@id='div_grd_grdJobSchedulerDetails']//*[@title='Delete'][not(@hidden)]")
	private List<WebElement> allGridDeleteButtons;
	
	@FindBy(xpath = "//*[@id='div_grd_grdJobSchedulerDetails']//*[@title='Delete'][not(@hidden)]")
	private WebElement gridDeleteButton;
	
	@FindBy(xpath = "//*[@role='grid']/tbody//tbody/tr/td//*[@class='fc-daygrid-day-number']")
	private List<WebElement> calendarDateXpath;
	
	@FindBy(xpath = "//*[@role='grid']/tbody//tbody/tr/td//div[contains(@class,'fc-daygrid-day-events')]")
	private List<WebElement> calendarJobCodeXpath;
	
	@FindBy(xpath = "//*[@class='modal-content']//*[@class='close']")
	private WebElement previewSchedulePageCancelBtn;
	
	@FindBy(xpath = "//*[@id='div_grd_grdJobSchedulerDetails']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> assignJobTable; 
	
	@FindBy(xpath = "//*[@id='div_grd_grdJobSchedulerDetails']//*[@name='cmnTxtSearch']")
	private WebElement jobParametersSearch;
	
	@FindBy(xpath = "//*[@class='fc-icon fc-icon-chevron-right']")
	private WebElement btnNext;
	
	////////////
	public void deleteJobScheduler(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(jobScedulerNameTxt);
		if (element_isEnabled(searchTextBoxTitleBar))
		{
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("SchedulerName"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allprojectNames = new ArrayList<>();
			if (jobSchedulerNames.size() > 0) {
				for (int j = 0; j < jobSchedulerNames.size(); j++) {
					String actualSchedulerName = jobSchedulerNames.get(j).getText();
					allprojectNames.add(data.get("SchedulerName"));
					if (actualSchedulerName.equalsIgnoreCase(data.get("SchedulerName"))) {
						jobSchedulerNames.get(j).click();
						Thread.sleep(1500);
						deleteButtonClick();
						Thread.sleep(2000);
						element_Click(confirmDeleteOkBtn);
						Thread.sleep(2000);
						String valMsg = validationMessage();
						Assert.assertEquals(valMsg, data.get("Validation"));
						break;
					}
				}
			}
			if (!allprojectNames.contains(data.get("SchedulerName"))) {
				logger.info("Scheduler not found");
			}
		}
		else {
			logger.info("Scheduler not found");
		}
	}
	
	public void createJobScheduler(Map<String, String> data) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(jobScedulerNameTxt);
		String valMsg = null;
		if (element_isEnabled(searchTextBoxTitleBar))
		{
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("JobSchedulerName"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allprojectNames = new ArrayList<>();
			if (jobSchedulerNames.size() > 0) {
				for (int j = 0; j < jobSchedulerNames.size(); j++) {
					String actualSchedulerName = jobSchedulerNames.get(j).getText();
					allprojectNames.add(data.get("JobSchedulerName"));
					if (actualSchedulerName.equalsIgnoreCase(data.get("JobSchedulerName"))) {
						jobSchedulerNames.get(j).click();
						Thread.sleep(1500);
						break;
					}
				}
			}
			if (!allprojectNames.contains(data.get("JobSchedulerName"))) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(jobScedulerNameTxt);
				element_InputTextUsingActionClass(jobScedulerNameTxt, data.get("JobSchedulerName"));
			}
		}
		else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(jobScedulerNameTxt);
			element_InputTextUsingActionClass(jobScedulerNameTxt, data.get("JobSchedulerName"));
		}
		if(data.get("Active") != null) {
			Boolean active = Boolean.parseBoolean(data.get("Active"));
			if (active ==true) {
				if (!activeCheckbox.isSelected()) {
					element_Click(activeCheckbox);
				}
			}
			else {
				if (activeCheckbox.isSelected()) {
					element_Click(activeCheckbox);
				}
			}
			Thread.sleep(500);
		}
		//Scheduler StartDate and EndDate Logic
		if(data.get("ScheduleType")!=null) {
			String currentMonth = integerMonthSelected("0");
			String currentYear = integerYearSelected("0");
			if (data.get("StartDate") != null) {
				int startDateValue = Integer.parseInt(data.get("StartDate"));
				if(startDateValue < 1) {
					String fDate = staticDateOrPlusMinusFromCurrentDate(data.get("StartDate"));
					element_Clear(schStartDateTxt);
					element_InputTextUsingActionClass(schStartDateTxt, fDate);
					element_TextBoxToClickOnTab(schStartDateTxt);
				}else if(startDateValue > 31) {
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
					LocalDate lt = LocalDate.now();
					LocalDate nextMonthStartDate = LocalDate.of(lt.getYear(), lt.getMonthValue()+1, 01);
					element_Clear(schStartDateTxt);
				    element_InputTextUsingActionClass(schStartDateTxt, nextMonthStartDate.format(formatter));
					element_TextBoxToClickOnTab(schStartDateTxt);
				}else {
				if (data.get("StartDate").length() == 1) {
					String startDt1 = "0" + data.get("StartDate") + "/" + currentMonth + "/" + currentYear;
					element_Clear(schStartDateTxt);
					element_InputTextUsingActionClass(schStartDateTxt, startDt1);
					element_TextBoxToClickOnTab(schStartDateTxt);
				} else {
					String startDt2 = data.get("StartDate") + "/" + currentMonth + "/" + currentYear;
					element_Clear(schStartDateTxt);
					element_InputTextUsingActionClass(schStartDateTxt, startDt2);
					element_TextBoxToClickOnTab(schStartDateTxt);
				}
				}
			}
			if(data.get("EndDate") != null) {
				int endDateValue = Integer.parseInt(data.get("EndDate"));
				if(endDateValue > 31) {
				if(data.get("ProcessingPeriod").equalsIgnoreCase("Next")) {
					String nextMonth = integerMonthSelected("1");
					String year = staticYearOrPlusMinusYearFromCurrentYear("1","0");
					String eDate = "30"+"/"+nextMonth+"/"+year;
					element_Clear(schEndDateTxt);
				    element_InputTextUsingActionClass(schEndDateTxt, eDate);
					element_TextBoxToClickOnTab(schEndDateTxt);
				}else {
					String toDate = staticDateOrPlusMinusFromCurrentDate(data.get("EndDate"));
					element_Clear(schEndDateTxt);
					element_InputTextUsingActionClass(schEndDateTxt, toDate);
					element_TextBoxToClickOnTab(schEndDateTxt);
				}
				}else if(endDateValue == 31) {
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
					LocalDate lt = LocalDate.now();
					LocalDate currentMonthLastDate=LocalDate.of(lt.getYear(), lt.getMonthValue(), lt.lengthOfMonth());
					element_Clear(schEndDateTxt);
					element_InputTextUsingActionClass(schEndDateTxt, currentMonthLastDate.format(formatter));
					element_TextBoxToClickOnTab(schEndDateTxt);
				}
				else {
					if (data.get("EndDate").length() == 1) {
						String endDt1 = "0" + data.get("EndDate") + "/" + currentMonth + "/" + currentYear;
						element_Clear(schEndDateTxt);
						element_InputTextUsingActionClass(schEndDateTxt, endDt1);
						element_TextBoxToClickOnTab(schEndDateTxt);
					} else {
						String endDt2 = data.get("EndDate") + "/" + currentMonth + "/" + currentYear;
						element_Clear(schEndDateTxt);
						element_InputTextUsingActionClass(schEndDateTxt, endDt2);
						element_TextBoxToClickOnTab(schEndDateTxt);
					}
				}
			}
			element_DropDownSelectByvisibleText(scheduleTypeDD, data.get("ScheduleType"));
			Thread.sleep(500);
		}
		if(data.get("EveryDayOftheMonth") != null) {
			String day = getDayInD(data.get("EveryDayOftheMonth"));
			element_DropDownSelectByvisibleText(everyDayOfMonthDD, day);
			Thread.sleep(500);
		}
		if(data.get("ScheduleRunTime") != null) {
			String scheduleRunTime = staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("ScheduleRunTime"));
			element_Clear(scheduleRunTimeTxt);
			Thread.sleep(500);
			element_inputTextUsingActionClassCharacterOneByOne(scheduleRunTimeTxt, scheduleRunTime);
		}
		if(data.get("ProcessingPeriod") != null) {
			element_DropDownSelectByvisibleText(processingPeriodDD, data.get("ProcessingPeriod"));
			Thread.sleep(500);
		}
		if(data.get("Job") != null || data.get("RepeatDays") != null || data.get("RepeatDays") != null || data.get("ActiveJob") != null || data.get("WeekofMonth") != null || data.get("DaysOfWeek") != null || data.get("MonthOfYear") != null || data.get("FromDayOfMonth") != null || data.get("ToDayOfMonth") != null) {
			if(jobParameterPanelXpath.size() == 0) {
				element_Click(jobParameterPanel);
				Thread.sleep(1500);
			}
			element_Click(plusButton);
			Thread.sleep(500);
			if(data.get("Job") != null) {
				if(element_DropDownFirstSelectedValue(scheduleTypeDD).equalsIgnoreCase("Daily")) {
					//element_InputDataUsingJS(jobNameTxt, data.get("Job"));
					element_InputTextUsingActionClass(jobNameTxt, data.get("Job"));
					Thread.sleep(700);
					element_TextBoxToClickOnTab(jobNameTxt);
					Thread.sleep(500);
				}else {
					//element_InputDataUsingJS(weeklyMonthlyJobNameTxt, data.get("Job"));
					//Thread.sleep(500);
					element_InputTextUsingActionClass(weeklyMonthlyJobNameTxt, data.get("Job"));
					Thread.sleep(700);
					element_TextBoxToClickOnTab(weeklyMonthlyJobNameTxt);
					Thread.sleep(500);
				}
			}
			if(data.get("RepeatDays") != null) {
				element_Clear(repeatDaysTxt);
				element_InputTextUsingActionClass(repeatDaysTxt, data.get("RepeatDays"));
			}
			if(data.get("WeekofMonth") != null) {
				element_Click(weekOfMonthDD);
				Thread.sleep(700);
				if(data.get("WeekofMonth").equalsIgnoreCase("Check All")) {
					element_Click(commonCheckALlXpath);
					Thread.sleep(1000);
				}else {
					String[] commaSeperatedWeeksOfMonth = data.get("WeekofMonth").split(",");
					for(int i=0; i<commaSeperatedWeeksOfMonth.length; i++) {
						for(int j=0; j<commonSelectionXpath.size(); j++) {
							String actualWeekOfMonth = commonSelectionXpath.get(j).getText();
							if(actualWeekOfMonth.equalsIgnoreCase(commaSeperatedWeeksOfMonth[i])) {
								element_Click(commonSelectionXpath.get(j));
								break;
							}
						}
					}
				}
			}
			if(data.get("DaysOfWeek") != null) {
				element_Click(daysOfWeekDD);
				Thread.sleep(700);
				if(data.get("DaysOfWeek").equalsIgnoreCase("CheckAll")) {
					element_Click(commonCheckALlXpath);
					Thread.sleep(1000);
				}else {
					String[] commaSeperatedDaysOfWeek = data.get("DaysOfWeek").split(",");
					for(int i=0; i<commaSeperatedDaysOfWeek.length; i++) {
						for(int j=0; j<commonSelectionXpath.size(); j++) {
							String actualDay = commonSelectionXpath.get(j).getText();
							if(actualDay.equalsIgnoreCase(commaSeperatedDaysOfWeek[i].trim())) {
								element_Click(commonSelectionXpath.get(j));
								break;
							}
						}
					}
				}
			}
			if(data.get("MonthOfYear") != null) {
				element_Click(monthofYearDD);
				Thread.sleep(700);
				if(data.get("MonthOfYear").equalsIgnoreCase("Check All")) {
					element_Click(commonCheckALlXpath);
					Thread.sleep(1000);
				}else{
					String [] commaSeperatedMonth = data.get("MonthOfYear").split(",");
					for(int i= 0; i<commaSeperatedMonth.length; i++) {
						if(commaSeperatedMonth[i].trim().length() == 3){
							for(int j=0; j<commonSelectionXpath.size(); j++) {
								String actualMonth = commonSelectionXpath.get(j).getText();
								if(actualMonth.equalsIgnoreCase(commaSeperatedMonth[i].trim())) {
									element_Click(commonSelectionXpath.get(j));
									break;
								}
							}
						}else {
							String monthName = getfullMonthName(commaSeperatedMonth[i].trim());
							String threeCharMonth = monthName.substring(0, 3);
							for(int j=0; j<commonSelectionXpath.size(); j++) {
								String actualMonth = commonSelectionXpath.get(j).getText();
								if(actualMonth.equalsIgnoreCase(threeCharMonth)) {
									element_Click(commonSelectionXpath.get(j));
									break;
								}
							}
						}
					}
				}
			}
			if(data.get("FromDayOfMonth") != null) {
				element_Clear(fromDayOfMonthTxt);
				element_InputTextUsingActionClass(fromDayOfMonthTxt, data.get("FromDayOfMonth"));
				Thread.sleep(500);
			}
			if(data.get("ToDayOfMonth") != null) {
				element_Clear(toDayOfMonthTxt);
				element_InputTextUsingActionClass(toDayOfMonthTxt, data.get("ToDayOfMonth"));
				Thread.sleep(500);
			}
			if(data.get("ActiveJob") != null) {
				Boolean activeJob = Boolean.parseBoolean(data.get("ActiveJob"));
				if (activeJob==true) {
					if (!activeJobCheckbox.isSelected()) {
						element_Click(activeJobCheckbox);
					}
				}
				else {
					if (activeJobCheckbox.isSelected()) {
						element_Click(activeJobCheckbox);
					}
				}
				Thread.sleep(500);
			}
			element_Click(gridSaveBtn);
			Thread.sleep(1000);
		}
		if(data.get("SelectUsers") != null || data.get("UserID") != null || data.get("SelectGroup") != null || data.get("GroupName") != null) {
			if(selectUsersPanelXpath.size() == 0) {
				element_Click(selectUsersPanel);
				Thread.sleep(1500);
			}
			if(data.get("SelectUsers") != null) {
				if(data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
					WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
					wait.until(ExpectedConditions.visibilityOf(selectUsersDD));
					Select select = new Select(selectUsersDD);
					select.selectByValue("G");
				}else {
					element_DropDownSelectByvisibleText(selectUsersDD, data.get("SelectUsers"));
				}
				Thread.sleep(500);
			}
			if(data.get("UserID") != null) {
				selectUsersOrGroupFromPicklist(data.get("UserID"), userIdTxt);
			}
			if(data.get("SelectGroup") != null) {
				element_DropDownSelectByvisibleText(selectGroupDD, data.get("SelectGroup"));
				Thread.sleep(500);
			}
			if(data.get("GroupName") != null) {
				selectUsersOrGroupFromPicklist(data.get("GroupName"), groupNameTxt);
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(1000);
		valMsg = validationMessage();
		Assert.assertEquals(valMsg, data.get("Validation"));
		Thread.sleep(500);
		reloadPageButtonClick();
	}
	
	public void configureJob(String schedulerName, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(jobScedulerNameTxt);
		String valMsg  = null; 
		element_Clear(jobScedulerNameTxt);
		Thread.sleep(500);
		element_InputTextUsingActionClass(jobScedulerNameTxt, schedulerName);
		element_TextBoxToClickOnTab(jobScedulerNameTxt);
		Thread.sleep(1000);
		if (!element_getInputControlValue(jobScedulerNameTxt).isBlank() || !element_getInputControlValue(jobScedulerNameTxt).isEmpty()) {
			if(jobParameterPanelXpath.size() == 0) {
				element_Click(jobParameterPanel);
				Thread.sleep(1500);
			}
			while (allGridDeleteButtons.size() != 0) {
				element_Click(gridDeleteButton);
				Thread.sleep(1000);
				driver.switchTo().alert().accept();
				Thread.sleep(700);
			}
			for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("JobName: "+data.get("JobName"));
					element_Click(plusButton);
					Thread.sleep(500);
					if(data.get("JobName") != null) {
						if(element_DropDownFirstSelectedValue(scheduleTypeDD).equalsIgnoreCase("Daily")) {
							//element_Clear(jobNameTxt);
							element_InputTextUsingActionClass(jobNameTxt, data.get("JobName"));
							Thread.sleep(500);
							element_TextBoxToClickOnTab(jobNameTxt);
							Thread.sleep(500);
						}else {
							//element_Clear(weeklyMonthlyJobNameTxt);
							element_InputTextUsingActionClass(weeklyMonthlyJobNameTxt, data.get("JobName"));
							Thread.sleep(500);
							element_TextBoxToClickOnTab(weeklyMonthlyJobNameTxt);
							Thread.sleep(500);
						}
					}
					if(data.get("RepeatDays") != null) {
						element_Clear(repeatDaysTxt);
						element_InputTextUsingActionClass(repeatDaysTxt, data.get("RepeatDays"));
					}
					if(data.get("WeekofMonth") != null) {
						element_Click(weekOfMonthDD);
						Thread.sleep(700);
						if(data.get("WeekofMonth").equalsIgnoreCase("Check All")) {
							element_Click(commonCheckALlXpath);
							Thread.sleep(1000);
						}else {
							String[] commaSeperatedWeeksOfMonth = data.get("WeekofMonth").split(",");
							for(int i=0; i<commaSeperatedWeeksOfMonth.length; i++) {
								for(int j=0; j<commonSelectionXpath.size(); j++) {
									String actualWeekOfMonth = commonSelectionXpath.get(j).getText();
									if(actualWeekOfMonth.equalsIgnoreCase(commaSeperatedWeeksOfMonth[i].trim())) {
										element_Click(commonSelectionXpath.get(j));
										break;
									}
								}
							}
						}
					}
					if(data.get("DaysOfWeek") != null) {
						element_Click(daysOfWeekDD);
						Thread.sleep(700);
						if(data.get("DaysOfWeek").equalsIgnoreCase("CheckAll")) {
							element_Click(commonCheckALlXpath);
							Thread.sleep(1000);
						}else {
							String[] commaSeperatedDaysOfWeek = data.get("DaysOfWeek").split(",");
							for(int i=0; i<commaSeperatedDaysOfWeek.length; i++) {
								for(int j=0; j<commonSelectionXpath.size(); j++) {
									String actualDay = commonSelectionXpath.get(j).getText();
									if(actualDay.equalsIgnoreCase(commaSeperatedDaysOfWeek[i].trim())) {
										element_Click(commonSelectionXpath.get(j));
										break;
									}
								}
							}
						}
					}
					if(data.get("MonthOfYear") != null) {
						element_Click(monthofYearDD);
						Thread.sleep(700);
						if(data.get("MonthOfYear").equalsIgnoreCase("Check All")) {
							element_Click(commonCheckALlXpath);
							Thread.sleep(1000);
						}else{
							String [] commaSeperatedMonth = data.get("MonthOfYear").split(",");
							for(int i= 0; i<commaSeperatedMonth.length; i++) {
								if(commaSeperatedMonth[i].trim().length() == 3){
									for(int j=0; j<commonSelectionXpath.size(); j++) {
										String actualMonth = commonSelectionXpath.get(j).getText();
										if(actualMonth.equalsIgnoreCase(commaSeperatedMonth[i].trim())) {
											element_Click(commonSelectionXpath.get(j));
											break;
										}
									}
								}else {
									String monthName = getfullMonthName(commaSeperatedMonth[i].trim());
									String threeCharMonth = monthName.substring(0, 3);
									for(int j=0; j<commonSelectionXpath.size(); j++) {
										String actualMonth = commonSelectionXpath.get(j).getText();
										if(actualMonth.equalsIgnoreCase(threeCharMonth)) {
											element_Click(commonSelectionXpath.get(j));
											break;
										}
									}
								}
							}
						}
					}
					if(data.get("FromDayOfMonth") != null) {
						element_Clear(fromDayOfMonthTxt);
						element_InputTextUsingActionClass(fromDayOfMonthTxt, data.get("FromDayOfMonth"));
						Thread.sleep(500);
					}
					if(data.get("ToDayOfMonth") != null) {
						element_Clear(toDayOfMonthTxt);
						element_InputTextUsingActionClass(toDayOfMonthTxt, data.get("ToDayOfMonth"));
						Thread.sleep(500);
					}
					if(data.get("Active") != null) {
						Boolean active1 = Boolean.parseBoolean(data.get("Active"));
						if (active1==true) {
							if (!activeJobCheckbox.isSelected()) {
								element_Click(activeJobCheckbox);
							}
						}
						else {
							if (activeJobCheckbox.isSelected()) {
								element_Click(activeJobCheckbox);
							}
						}
						Thread.sleep(500);
					}
					element_Click(gridSaveBtn);
					Thread.sleep(1000);
				}
			saveButtonClick();
			Thread.sleep(1000);
			valMsg = validationMessage();
			Assert.assertEquals(valMsg, "Saved Successfully");
		}else {
			Assert.assertEquals(valMsg, "Saved Successfully");
		}
	}
	
	public void previewSchedule(String schedulerName, String processingPeriod, List<Map<String, String>> data) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(jobScedulerNameTxt);
		if (element_isEnabled(searchTextBoxTitleBar))
		{
			element_InputTextUsingActionClass(searchTextBoxTitleBar, schedulerName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allprojectNames = new ArrayList<>();
			if (jobSchedulerNames.size() > 0) {
				for (int j = 0; j < jobSchedulerNames.size(); j++) {
					String actualSchedulerName = jobSchedulerNames.get(j).getText();
					allprojectNames.add(schedulerName);
					if (actualSchedulerName.equalsIgnoreCase(schedulerName)) {
						jobSchedulerNames.get(j).click();
						Thread.sleep(1500);
						element_Click(previewScheduleBtn);
						pageLoadWaitng();
						Thread.sleep(1000);
						if(processingPeriod.equalsIgnoreCase("Next")) {
							element_Click(btnNext);
							Thread.sleep(1500);
						}
						//////////////////
						String month = null;
						String year = null;
						if(processingPeriod.equalsIgnoreCase("Current")) {
							month = integerMonthSelected("0");
							year = integerYearSelected("0");
						}else {
							month = integerMonthSelected("1");
							year = staticYearOrPlusMinusYearFromCurrentYear("1","0");
						}
						List<String> daysList = getDays(Integer.parseInt(year), Integer.parseInt(month));
						Map<String, String> allDates = new HashMap<String, String>();
						for (int i = 0; i < daysList.size(); i++) {
							if(data.get(i).get("Date").equalsIgnoreCase(daysList.get(i))) {
								allDates.put(data.get(i).get("Date"), data.get(i).get("JobCode"));
							}
						}
						System.out.println("allDates= "+allDates);
						Map<String, String> actualDatesAndJobs = new HashMap<String, String>();
						for (int i = 0; i < calendarDateXpath.size(); i++) {
							String actualDate = calendarDateXpath.get(i).getText();
							String actualJobCode = calendarJobCodeXpath.get(i).getText();
							System.out.println(actualDate+"=="+actualJobCode);
							if (actualJobCode.equalsIgnoreCase("")) {
								actualDatesAndJobs.put(actualDate, null);
							}else {
								actualDatesAndJobs.put(actualDate, actualJobCode);
							}
						}
						actualDatesAndJobs.remove("");		// to remove extra element
						System.out.println("ActualDatesAndJobs= "+actualDatesAndJobs);
						boolean expRes= true;
						for (int k = 0; k < allDates.size(); k++) {
							if (actualDatesAndJobs.equals(allDates)) {
								Assert.assertEquals(true, expRes);
							} else {
								Assert.assertEquals(false, expRes);
							}
						}
						//////////////
						element_Click(previewSchedulePageCancelBtn);
						Thread.sleep(1500);
					}
				}
			}
			if (!allprojectNames.contains(schedulerName)) {
				Assert.assertEquals("Job Scheduler Not Found", schedulerName);
			}
		}
		else {
			Assert.assertEquals("Job Scheduler Not Found", schedulerName);
		}
	}
	
	public void updateJob(String jobSchedulerName, String scheduleRunTime, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(jobScedulerNameTxt);
		String valMsg  = null; 
		element_Clear(jobScedulerNameTxt);
		Thread.sleep(500);
		element_InputTextUsingActionClass(jobScedulerNameTxt, jobSchedulerName);
		element_TextBoxToClickOnTab(jobScedulerNameTxt);
		Thread.sleep(1000);
		if(!element_getInputControlValue(jobScedulerNameTxt).isBlank() || !element_getInputControlValue(jobScedulerNameTxt).isEmpty()) {
			String scheduleRunTime1 = staticTimeOrPlusMinusMinutesFromCurrentTime(scheduleRunTime);
			element_Clear(scheduleRunTimeTxt);
			Thread.sleep(500);
			element_inputTextUsingActionClassCharacterOneByOne(scheduleRunTimeTxt, scheduleRunTime1);
			for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				if(jobParameterPanelXpath.size() == 0) {
					element_Click(jobParameterPanel);
					Thread.sleep(1500);
				}
				if (assignJobTable.size() > 0) {
					element_Clear(jobParametersSearch);
					element_InputTextUsingActionClass(jobParametersSearch, data.get("JobName"));
					element_TextBoxToClickOnEnter(jobParametersSearch);
					Thread.sleep(500);
					for (int i = 0; i < assignJobTable.size(); i++) {
						String actualJob = assignJobTable.get(i).getText();
						if(data.get("JobSchedulerType").equalsIgnoreCase("Daily")) {
							String getRepeatDays = assignJobTable.get(i).findElement(By.xpath(
									"following-sibling::td[1]"))
									.getText();
							// in below line verified ActualFromDayOfMonth and ActualToDayOfMonth because multiple same jobs with different dates can be available here
							if (actualJob.equalsIgnoreCase(data.get("JobName")) && getRepeatDays.equalsIgnoreCase(data.get("ActualRepeatDays"))) {
								WebElement editBtn = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[4]/i[@title='Edit']"));
								element_Click(editBtn);
								Thread.sleep(500);
							}
						}else if(data.get("JobSchedulerType").equalsIgnoreCase("Weekly")) {
							String getActualWeekofMonth = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[1]")).getText();
							String getActualDaysofWeek = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[2]/label")).getText();
							System.out.println("getActualWeekofMonth"+getActualWeekofMonth);
							System.out.println("getActualDaysofWeek"+getActualDaysofWeek);
							if (actualJob.equalsIgnoreCase(data.get("JobName")) && getActualWeekofMonth.equalsIgnoreCase(data.get("ActualWeekofMonth")) && getActualDaysofWeek.equalsIgnoreCase(data.get("ActualDaysOfWeek"))) {
								WebElement editBtn = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[5]/i[@title='Edit']"));
								element_Click(editBtn);
								Thread.sleep(500);
							}
						}else if(data.get("JobSchedulerType").equalsIgnoreCase("Monthly")) {
							System.out.println("Hello");
							String getActualFDt = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[2]")).getText();
							String getActualTDt = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[3]")).getText();
							System.out.println(getActualFDt+" "+getActualTDt);
							if (actualJob.equalsIgnoreCase(data.get("JobName")) && getActualFDt.equalsIgnoreCase(data.get("ActualFromDayOfMonth")) && getActualTDt.equalsIgnoreCase(data.get("ActualToDayOfMonth"))) {
								System.out.println("Hello11");
								WebElement editBtn = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[6]/i[@title='Edit']"));
								element_Click(editBtn);
								Thread.sleep(500);
							}
						}
						if(data.get("NewRepeatDays") != null) {
							//WebElement repeatDaysText = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[contains(@class,'ng-scope') and not (contains(@class,'ng-hide'))][2]"));
								element_Clear(repeatDaysTxt);
								element_InputTextUsingActionClass(repeatDaysTxt, data.get("NewRepeatDays"));
							}
							if(data.get("NewWeekofMonth") != null) {
								element_Click(weekOfMonthDD);
								Thread.sleep(700);
								if(data.get("NewWeekofMonth").equalsIgnoreCase("Check All")) {
									element_Click(commonCheckALlXpath);
									Thread.sleep(1000);
								}else {
									String[] commaSeperatedWeeksOfMonth = data.get("NewWeekofMonth").split(",");
									for(int k=0; k<commaSeperatedWeeksOfMonth.length; k++) {
										for(int j=0; j<commonSelectionXpath.size(); j++) {
											String actualWeekOfMonth = commonSelectionXpath.get(j).getText();
											if(actualWeekOfMonth.equalsIgnoreCase(commaSeperatedWeeksOfMonth[k].trim())) {
												element_Click(commonSelectionXpath.get(j));
												break;
											}
										}
									}
								}
							}
							if(data.get("NewDaysOfWeek") != null) {
								element_Click(daysOfWeekDD);
								Thread.sleep(700);
								element_Click(commonCheckALlXpath);
								Thread.sleep(500);
								if(data.get("NewDaysOfWeek").equalsIgnoreCase("CheckAll")) {
									element_Click(commonCheckALlXpath);
									Thread.sleep(1000);
								}else {
									String[] commaSeperatedDaysOfWeek = data.get("NewDaysOfWeek").split(",");
									for(int k=0; k<commaSeperatedDaysOfWeek.length; k++) {
										for(int j=0; j<commonSelectionXpath.size(); j++) {
											String actualDay = commonSelectionXpath.get(j).getText();
											if(actualDay.equalsIgnoreCase(commaSeperatedDaysOfWeek[k].trim())) {
												element_Click(commonSelectionXpath.get(j));
												break;
											}
										}
									}
								}
							}
							if(data.get("NewMonthOfYear") != null) {
								WebElement monthOfYearDD1 = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[2]"));
								element_Click(monthOfYearDD1);
								Thread.sleep(700);
								WebElement checkUncheckAllXpath = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[1]//*[@class=\"btn-group open\"]//*[contains(text(),'Check All') or contains(text(),'Uncheck All')]"));
								element_Click(checkUncheckAllXpath);
								Thread.sleep(700);
								if(data.get("NewMonthOfYear").equalsIgnoreCase("Check All")) {
									element_Click(checkUncheckAllXpath);
									Thread.sleep(1000);
								}else{
									String [] commaSeperatedMonth = data.get("NewMonthOfYear").split(",");
									for(int k= 0; k<commaSeperatedMonth.length; k++) {
										if(commaSeperatedMonth[k].trim().length() == 3){
											for(int j=0; j<commonSelectionXpath.size(); j++) {
												String actualMonth = commonSelectionXpath.get(j).getText();
												if(actualMonth.equalsIgnoreCase(commaSeperatedMonth[k].trim())) {
													element_Click(commonSelectionXpath.get(j));
													break;
												}
											}
										}else {
											String monthName = getfullMonthName(commaSeperatedMonth[i].trim());
											String threeCharMonth = monthName.substring(0, 3);
											for(int j=0; j<commonSelectionXpath.size(); j++) {
												String actualMonth = commonSelectionXpath.get(j).getText();
												if(actualMonth.equalsIgnoreCase(threeCharMonth)) {
													element_Click(commonSelectionXpath.get(j));
													break;
												}
											}
										}
									}
								}
							}
							if (data.get("NewFromDayOfMonth") != null) {
								WebElement fDtTxt = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[2]"));
								element_Clear(fDtTxt);
								Thread.sleep(500);
								element_InputTextUsingActionClass(fDtTxt, data.get("NewFromDayOfMonth"));
								element_TextBoxToClickOnTab(fDtTxt);
							}
							if (data.get("NewToDayOfMonth") != null) {
								WebElement tDtTxt = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[3]"));
								element_Clear(tDtTxt);
								Thread.sleep(500);
								element_InputTextUsingActionClass(tDtTxt, data.get("NewToDayOfMonth"));
								element_TextBoxToClickOnTab(tDtTxt);
							}
							if(data.get("Active") != null) {
								WebElement activeChk = null;
								if(data.get("JobSchedulerType").equalsIgnoreCase("Daily")) {
									activeChk = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[2]/input"));
								}else if(data.get("JobSchedulerType").equalsIgnoreCase("Weekly")) {
									activeChk = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[3]/input"));
								}else if(data.get("JobSchedulerType").equalsIgnoreCase("Monthly")){
									activeChk = assignJobTable.get(i).findElement(By.xpath("following-sibling::td[4]/input"));
								}
								Boolean active1 = Boolean.parseBoolean(data.get("Active"));
								if (active1==true) {
									if (!activeChk.isSelected()) {
										element_Click(activeChk);
									}
								}
								else {
									if (activeChk.isSelected()) {
										element_Click(activeChk);
									}
								}
								Thread.sleep(500);
							}
					}
				}
				element_Click(gridSaveBtn);
				Thread.sleep(1000);
			}
			saveButtonClick();
			Thread.sleep(1000);
			valMsg = validationMessage();
			Assert.assertEquals(valMsg, "Saved Successfully");
		}else {
			Assert.assertEquals("Job Scheduler Not Found", "Saved Successfully");
		}
		
		
	}
}
