package PageObject.TimeAndAttendance;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class OvertimePolicyPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(OvertimePolicyPO.class);

	public OvertimePolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(xpath = "//*[@class=\"col-xs-12 col-sm-12 col-lg-4 grid\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement searchBox;

	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> overtimePlcName;

	@FindBy(id = "OverTimePolicyID")
	private WebElement plcIdtext;

	@FindBy(id = "OverTimePolicyName")
	private WebElement plcNametext;

	@FindBy(id = "NetWorkHoursName")
	private WebElement netWorkHoursNametxt;

	@FindBy(id = "ChkWeekday")
	private WebElement calOnWOPHFBRDWeekDay;

	@FindBy(id = "cboCalcRestrictHolidayPH")
	private WebElement calOnResHoliDayAsPerPH;

	// *******************************************************
	// Overtime Configuration Panel Elements
	// *******************************************************
	//
	@FindBy(xpath = "//*[@default=\"Overtime Configuration\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> overtimeConfigurationPanelOpenOrNot;

	@FindBy(xpath = "//*[@default='Overtime Configuration']")
	private WebElement overtimeConfigurationPanel;

	@FindBy(id = "chkEnblOTCal")
	private WebElement enableOTCalculationFlag;

	@FindBy(xpath = "//*[@id=\"collapseTwo\"]//*[@class=\"form-group\"][2]//*[@class=\"checkbox-inline checkbox-inline-width\"]")
	private List<WebElement> dailyOTdays;

	@FindBy(xpath = "//*[@id=\"collapseTwo\"]//*[@class=\"form-group\"][3]//*[@class=\"checkbox-inline checkbox-inline-width\"]")
	private List<WebElement> wklyMnthlyOTdays;

	@FindBy(id = "chkEnblOTCal1")
	private WebElement enableOTRoundingForFracOfAnHrFlag;

	// Overtime Rounding For Fraction Of An Hour grid
	@FindBy(id = "grdEnblOTCaladdBtn")
	private WebElement roundingGridAddBtn;

	@FindBy(id = "RndFrom")
	private WebElement roundRangeFrom;

	@FindBy(id = "RndUpTo")
	private WebElement roundRangeTo;

	@FindBy(id = "FixedFlg")
	private WebElement considerValueAsDD;

	@FindBy(id = "RNDValue")
	private WebElement roundReplaceValue;

	@FindBy(xpath = "//*[contains(@id,'grdEnblOTCalrow')]//*[@title='Delete']")
	private List<WebElement> roundgridDeleteBtns;

	@FindBy(xpath = "//*[@id='grdEnblOTCalrow0']//*[@title='Delete']")
	private WebElement roundgridDeleteBtn;

	// *******************************************************
	// Daily Overtime Panel Elements
	// *******************************************************

	@FindBy(xpath = "//*[@default=\"Daily Overtime\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> dailyOvertimePanelOpenOrNot;

	@FindBy(xpath = "//*[@default='Daily Overtime' and @class=\"control-label mx-input-theme label-text\"]")
	private WebElement dailyOvertimePanel;

	@FindBy(id = "cboOTDaily")
	private WebElement overtimeCalculationDD;

	@FindBy(id = "chkOTAUTHFLG")
	private WebElement dailyAutoAuthOTComponentflag;

	@FindBy(id = "chkDailyAuthReqLateIN")
	private WebElement dailyAuthReqLateInflag;

	@FindBy(id = "chkallowoverlapping")
	private WebElement dailyAllowOverlappingWorkComponentsflag;

	@FindBy(id = "txtspecialOTtrangefrom")
	private WebElement dailySpecialOTTimeRangefrom;

	@FindBy(id = "txtspecialOTtimerangeto")
	private WebElement dailySpecialOTTimeRangeto;

	// Work Component Grid
	@FindBy(id = "grdDailyDaysaddBtn")
	private WebElement grdDailyDaysaddBtn;

	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[contains(@id,'RangeFrom')]")
	private List<WebElement> nwRangeFrom;

	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[contains(@id,'RangeTo')]")
	private List<WebElement> nwRangeTo;

	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[contains(@id,'MinDurationReq')]")
	private List<WebElement> minDurationReq;

	@FindBy(id = "ConsiderAs")
	private WebElement considerAsDD;

	@FindBy(id = "Factor_txt")
	private WebElement factortxt;

	@FindBy(id = "OTAssignAsPer")
	private WebElement otAssignAsPerDD;

	@FindBy(id = "ApplicableDays")
	private WebElement applicableDays;

	@FindBy(xpath = "//*[@aria-labelledby='dropdownMenu']/li[not(@class=\"divider\")]")
	private List<WebElement> appDaysSelectionForDaily1;

	@FindBy(xpath = "//*[@id='savebtn' and not(@hidden)]")
	private WebElement gridSaveBtn;

	@FindBy(id = "WorkComponent")
	private WebElement workComponentDD;

	@FindBy(id = "RangeFrom")
	private WebElement rangeFromtxt;

	@FindBy(id = "RangeTo")
	private WebElement rangeTotxt;

	@FindBy(id = "MinDurationReq")
	private WebElement minDurationReqtxt;

	@FindBy(xpath = "//*[contains(@id,'grdDailyDaysrow')]//*[@title='Delete']")
	private List<WebElement> gridDeleteBtns;

	@FindBy(xpath = "//*[@id='grdDailyDaysrow0']//*[@title='Delete']")
	private WebElement gridDeleteBtn;

	@FindBy(xpath = "//*[@id=\"collapseThree\"]//*[@class=\"pagination-next\"]")
	private List<WebElement> gridPaginationSize;

	@FindBy(xpath = "//*[@id=\"collapseThree\"]//*[@class=\"pagination-next\"]")
	private WebElement gridPaginationClick;

	// *******************************************************
	// Weekly/Monthly Overtime Panel Elements
	// *******************************************************

	@FindBy(xpath = "//*[@default=\"Weekly/Monthly Overtime\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> weeklyMonthlyOvertimePanelOpenOrNot;

	@FindBy(xpath = "//*[@default='Weekly/Monthly Overtime' and @class=\"control-label mx-input-theme label-text\"]")
	private WebElement weeklyMonthlyOvertimePanel;

	@FindBy(id = "WeeklyOTCal")
	private WebElement weeklyOTCalculationDD;

	@FindBy(xpath = "//*[@id='collapseFour']//*[@id='cboWeekStartDay']")
	private WebElement weeklyOTstartDayDD;

	@FindBy(id = "chkOTAUTHFLGWeekly")
	private WebElement weeklyAutoAuthOTComponentflag;

	@FindBy(id = "chkWeekAuthReqLateIN")
	private WebElement weeklyAuthReqLateInflag;

	@FindBy(id = "chkWeekOffs")
	private WebElement weeklyCheckWeekOffflag;

	@FindBy(id = "WeeklyCustomWOHrsFlag")
	private WebElement weeklyCustomWOHrsDD;

	@FindBy(id = "txtCustomWOHrs")
	private WebElement txtCustomWOHrs;

	@FindBy(id = "chkHoliday")
	private WebElement weeklyCheckHolidayflag;

	@FindBy(id = "WeeklyCustomPHHrsFlag")
	private WebElement weeklyCustomPHHrsDD;

	@FindBy(id = "txtCustomPHHrs")
	private WebElement txtCustomPHHrs;

	@FindBy(id = "chkPaidLeaves")
	private WebElement weeklyCheckPaidLvflag;

	@FindBy(id = "WeeklyCustomLVHrsFlag")
	private WebElement weeklyCustomLVHrsDD;

	@FindBy(id = "txtCustomLVHrs")
	private WebElement txtCustomLVHrs;

	@FindBy(id = "chkNonApplicableDay")
	private WebElement weeklyCheckNotAppDaysflag;

	@FindBy(id = "txtCustomNAHrs")
	private WebElement weeklyCustomNAHrstxt;

	@FindBy(id = "chkConsiderWorkDoneOnWOPHPL")
	private WebElement weeklyConsWorkDoneonWOPHPaidLvFlag;

	// Work Component Grid
	@FindBy(id = "grdDailyOTaddBtn")
	private WebElement grdweeklyaddBtn;

	@FindBy(xpath = "//*[contains(@id,'grdDailyOTrow')]//*[@title='Delete']")
	private List<WebElement> gridweeklyDeleteBtns;

	@FindBy(xpath = "//*[@id='grdDailyOTrow0']//*[@title='Delete']")
	private WebElement gridweeklyDeleteBtn;

	// *******************************************************
	// Overtime Limit for Alert Message Panel Elements
	// *******************************************************

	@FindBy(xpath = "//*[@default=\"Overtime Limit for Alert Message\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> otLimitAlertMessagePanelOpenOrNot;

	@FindBy(xpath = "//*[@default='Overtime Limit for Alert Message']")
	private WebElement otLimitAlertMessagePanel;

	@FindBy(id = "cboOvertimeAlertCalculation")
	private WebElement OvertimeAlertCalculationDD;

	@FindBy(id = "txtDailyOTMaxLimit")
	private WebElement dailyOTmaxLimittxt;

	@FindBy(xpath = "//*[@id='txtWeeklyOTMaxLimit']//input")
	private List<WebElement> weeklyOTMaxLimittxt;

	@FindBy(xpath = "//*[@id='txtMonthlyOTMaxLimit']//input")
	private List<WebElement> monthlyOTMaxLimittxt;

	@FindBy(id = "cboOTLimitAlertWeekStartDay")
	private WebElement weekStartDayDD;

	@FindBy(id = "txtWeeklyOTMaxLimit_1")
	private WebElement weeklyOtLimitForCustm1;

	@FindBy(id = "txtWeeklyOTMaxLimit_2")
	private WebElement weeklyOtLimitForCustm2;

	@FindBy(id = "txtMonthlyOTMaxLimit_1")
	private WebElement monthlyOtLimitForCustm1;

	@FindBy(id = "txtMonthlyOTMaxLimit_2")
	private WebElement monthlyOtLimitForCustm2;

	@FindBy(xpath = "//*[@default=\"Overtime Limit for Alert Message\"]/ancestor::a[@class=\"anchorclick\"][1]")
	private List<WebElement> overtimeLimitAlertOpenOrNot;
	
	@FindBy(xpath = "//html")
	private WebElement blankSpace;

	public static Map<String, String> getOvertimeLimitCustomAlert = new HashMap<String, String>();
	// Function

	// **********************************************************
	// Overtime Policy Create ( General Parameters except Grids)
	// **********************************************************
	// Created By Mayank
	public void createOvertimePolicy(Map<String, String> data) throws InterruptedException {
		String msg = null;
		waitForElementVisible(plcNametext);
		if (element_isEnabled(searchBox)) {
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, data.get("PlcName"));
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (overtimePlcName.size() > 0) {
				for (int j = 0; j < overtimePlcName.size(); j++) {
					String plcname1 = overtimePlcName.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(data.get("PlcName"))) {
						overtimePlcName.get(j).click();
//						deleteButtonClick();
//						Thread.sleep(1000);
//						driver.switchTo().alert().accept();
//						Thread.sleep(1000);
//						// String val = element_GetText(valMsg);
//						String val = validationMessage();
//						Thread.sleep(1000);
//						Assert.assertEquals(val, "Deleted Successfully");
//						Thread.sleep(1000);
						break;
					}
				}
			}
			logger.info(ar);
			if (!ar.contains(data.get("PlcName"))) {
				addButtonClick();
			}
		}
		element_Clear(plcNametext);
		element_InputTextUsingActionClass(plcNametext, data.get("PlcName"));
		element_Clear(netWorkHoursNametxt);
		element_dynamicDDSelect(netWorkHoursNametxt, data.get("NetWorkPlcName"));
		element_Click(blankSpace);
		if (data.get("CalOnAsPerWeekDay") != null) {
			Boolean calOnAsPerWeekDay = Boolean.parseBoolean(data.get("CalOnAsPerWeekDay"));
			if (calOnAsPerWeekDay == true) {
				if (!calOnWOPHFBRDWeekDay.isSelected()) {
					element_Click(calOnWOPHFBRDWeekDay);
				}
			} else {
				if (calOnWOPHFBRDWeekDay.isSelected()) {
					element_Click(calOnWOPHFBRDWeekDay);
				}
			}
		}
		if (data.get("CalOnResHolasperPH") != null) {
			Boolean calOnResHolasperPH = Boolean.parseBoolean(data.get("CalOnResHolasperPH"));
			if (calOnResHolasperPH == true) {
				if (!calOnResHoliDayAsPerPH.isSelected()) {
					element_Click(calOnResHoliDayAsPerPH);
				}
			} else {
				if (calOnResHoliDayAsPerPH.isSelected()) {
					element_Click(calOnResHoliDayAsPerPH);
				}
			}
		}

		// *************************************
		// Overtime Configuration Panel
		// *************************************
		if (data.get("EnblOTCal") != null || data.get("DailyOT") != null || data.get("WklyMthlyOT") != null) {
			if (overtimeConfigurationPanelOpenOrNot.size() > 0) {
				element_Click(overtimeConfigurationPanel);
			}
			if (data.get("EnblOTCal") != null) {
				Boolean enblOTCal1 = Boolean.parseBoolean(data.get("EnblOTCal"));
				if (enblOTCal1 == true) {
					if (!enableOTCalculationFlag.isSelected()) {
						element_Click(enableOTCalculationFlag);
					}
				} else {
					if (enableOTCalculationFlag.isSelected()) {
						element_Click(enableOTCalculationFlag);
					}
				}
			}
			if (data.get("DailyOT") != null) {
				if (data.get("DailyOT").equalsIgnoreCase("ALL")) {
					for (int i = 0; i < dailyOTdays.size(); i++) {
						if (dailyOTdays.get(i).findElement(By.xpath("child::input")).isEnabled()) {
							if (!dailyOTdays.get(i).findElement(By.xpath("child::input")).isSelected()) {
								dailyOTdays.get(i).findElement(By.xpath("child::input")).click();
								Thread.sleep(700);
							}
						}
					}
				} else {
					String[] dailyOtDaysSplitwithcomma = data.get("DailyOT").split(",");
					for (int j = 0; j < dailyOtDaysSplitwithcomma.length; j++) {
						for (int i = 0; i < dailyOTdays.size(); i++) {
							if (dailyOTdays.get(i).getText().equalsIgnoreCase(dailyOtDaysSplitwithcomma[j])) {
								if (dailyOTdays.get(i).findElement(By.xpath("child::input")).isEnabled()) {
									if (!dailyOTdays.get(i).findElement(By.xpath("child::input")).isSelected()) {
										dailyOTdays.get(i).findElement(By.xpath("child::input")).click();
									}
									break;
								}
							}
							Thread.sleep(700);
						}
					}
				}

			}
			if (data.get("WklyMthlyOT") != null) {
				if (data.get("WklyMthlyOT").equalsIgnoreCase("ALL")) {
					for (int i = 0; i < wklyMnthlyOTdays.size(); i++) {
						if (wklyMnthlyOTdays.get(i).findElement(By.xpath("child::input")).isEnabled()) {
							if (!wklyMnthlyOTdays.get(i).findElement(By.xpath("child::input")).isSelected()) {
								wklyMnthlyOTdays.get(i).findElement(By.xpath("child::input")).click();
								Thread.sleep(700);
							}
						}
					}
				} else {
					String[] wkmnthOtDaysSplitwithcomma = data.get("WklyMthlyOT").split(",");
					for (int j = 0; j < wkmnthOtDaysSplitwithcomma.length; j++) {
						for (int i = 0; i < wklyMnthlyOTdays.size(); i++) {
							if (wklyMnthlyOTdays.get(i).getText().equalsIgnoreCase(wkmnthOtDaysSplitwithcomma[j])) {
								if (wklyMnthlyOTdays.get(i).findElement(By.xpath("child::input")).isEnabled()) {
									if (!wklyMnthlyOTdays.get(i).findElement(By.xpath("child::input")).isSelected()) {
										wklyMnthlyOTdays.get(i).findElement(By.xpath("child::input")).click();
									}
									break;
								}
							}
							Thread.sleep(700);
						}
					}
				}

			}
			if (data.get("OTR4FracEnable") != null) {
				if (data.get("OTR4FracEnable").equalsIgnoreCase("true")) {
					if (!enableOTRoundingForFracOfAnHrFlag.isSelected()) {
						element_Click(enableOTRoundingForFracOfAnHrFlag);
					}
				} else {
					if (enableOTRoundingForFracOfAnHrFlag.isSelected()) {
						element_Click(enableOTRoundingForFracOfAnHrFlag);
					}
				}
			}
		}
		// *************************************
		// Daily Overtime Panel
		// *************************************
		if (data.get("DailyOTCal") != null || data.get("DailyAutoAuthOT") != null
				|| data.get("DailyAuthReqForLateIN") != null || data.get("DailyAlwOvrlpgWrkComp") != null
				|| data.get("DailySpecOTRangeFrom") != null || data.get("DailySpecOTRangeTo") != null) {
			if (dailyOvertimePanelOpenOrNot.size() > 0) {
				element_Click(dailyOvertimePanel);
			}
			waitForElementVisible(overtimeCalculationDD);
			if (data.get("DailyOTCal") != null) {
				element_DropDownSelectByvisibleText(overtimeCalculationDD, data.get("DailyOTCal"));
			}
			if (data.get("DailyAutoAuthOT") != null) {
				Boolean dailyAutoAuthOT1 = Boolean.parseBoolean(data.get("DailyAutoAuthOT"));
				if (dailyAutoAuthOTComponentflag.isEnabled()) { // if overtime calculation disabled then flag disabled
																// so
					if (dailyAutoAuthOT1 == true) {
						if (!dailyAutoAuthOTComponentflag.isSelected()) {
							element_Click(dailyAutoAuthOTComponentflag);
						}
					} else {
						if (dailyAutoAuthOTComponentflag.isSelected()) {
							element_Click(dailyAutoAuthOTComponentflag);
						}
					}
				}
			}
			if (data.get("DailyAuthReqForLateIN") != null) {
				Boolean dailyAuthReqForLateIN1 = Boolean.parseBoolean(data.get("DailyAuthReqForLateIN"));
				if (dailyAutoAuthOTComponentflag.isSelected()) { // if daily auto auth unchecked then flag disabled so
					if (dailyAuthReqForLateIN1 == true) {
						if (!dailyAuthReqLateInflag.isSelected()) {
							element_Click(dailyAuthReqLateInflag);
						}
					} else {
						if (dailyAuthReqLateInflag.isSelected()) {
							element_Click(dailyAuthReqLateInflag);
						}
					}
				}
			}
			if (data.get("DailyAlwOvrlpgWrkComp") != null) {
				Boolean dailyAlwOvrlpgWrkComp1 = Boolean.parseBoolean(data.get("DailyAlwOvrlpgWrkComp"));
				Thread.sleep(1000);
				String overtimeCalculationDDvalue = dropDownSelectedValue(overtimeCalculationDD);
				if (overtimeCalculationDDvalue.equalsIgnoreCase("Daily 2")) {
					if (dailyAllowOverlappingWorkComponentsflag.isEnabled()) {
						if (dailyAlwOvrlpgWrkComp1 == true) {
							if (!dailyAllowOverlappingWorkComponentsflag.isSelected()) {
								element_Click(dailyAllowOverlappingWorkComponentsflag);
							}
						} else {
							if (dailyAllowOverlappingWorkComponentsflag.isSelected()) {
								element_Click(dailyAllowOverlappingWorkComponentsflag);
							}
						}
					}
				}
			}
			if (data.get("DailySpecOTRangeFrom") != null) {
				String overtimeCalculationDDvalue = dropDownSelectedValue(overtimeCalculationDD);
				if (overtimeCalculationDDvalue.equalsIgnoreCase("Daily 2")) {
					if (dailySpecialOTTimeRangefrom.isEnabled()) {
						element_inputTextUsingActionClassCharacterOneByOne(dailySpecialOTTimeRangefrom, data.get("DailySpecOTRangeFrom"));
					}
				}
			}
			if (data.get("DailySpecOTRangeTo") != null) {
				String overtimeCalculationDDvalue = dropDownSelectedValue(overtimeCalculationDD);
				if (overtimeCalculationDDvalue.equalsIgnoreCase("Daily 2")) {
					if (dailySpecialOTTimeRangeto.isEnabled()) {
						element_inputTextUsingActionClassCharacterOneByOne(dailySpecialOTTimeRangeto, data.get("DailySpecOTRangeTo"));
						
					}
				}
			}
		}
		// *************************************
		// Weekly/Monthly Overtime Panel
		// *************************************
		if (data.get("WklyMthlyOTCal") != null || data.get("WeekStartDay") != null
				|| data.get("WklyMthlyAutoAuthOT") != null || data.get("WklyMthlyAuthReqForLateIN") != null
				|| data.get("WklyMthlyWeekOffsFlag") != null || data.get("WklyMthlyWeekOffsHrsCal") != null
				|| data.get("WklyMthlyWeekOffsHrs") != null || data.get("WklyMthlyHolidaysFlag") != null
				|| data.get("WklyMthlyHolidaysHrsCal") != null || data.get("WklyMthlyHolidaysHrs") != null
				|| data.get("WklyMthlyPLFlag") != null || data.get("WklyMthlyPLHrsCal") != null
				|| data.get("WklyMthlyPLHrs") != null || data.get("WklyMthlyNAFlag") != null
				|| data.get("WklyMthlyNAHrs") != null || data.get("ConsWorkDoneonWOPHPL") != null) {
			Thread.sleep(1000);
			element_Click(weeklyMonthlyOvertimePanel);
			if (data.get("WklyMthlyOTCal") != null) {
				element_DropDownSelectByvisibleText(weeklyOTCalculationDD, data.get("WklyMthlyOTCal"));
			}
			if (data.get("WeekStartDay") != null) {
				String selectWeekD = data.get("WeekStartDay");
				if (selectWeekD.length() == 1) {
					LocalDateTime now = LocalDateTime.now();
					int dete = Integer.parseInt(data.get("WeekStartDay"));
					LocalDateTime nextdate = now.plusDays(dete);
					String dayName = nextdate.getDayOfWeek().toString();
					String dayFind = dayName.substring(0, 1) + dayName.substring(1, dayName.length()).toLowerCase();
					selectWeekD = dayFind;
				}
				if (dropDownSelectedValue(weeklyOTCalculationDD).equalsIgnoreCase("Weekly")) {
					element_DropDownSelectByvisibleText(weeklyOTstartDayDD, selectWeekD);
				}
			}
			Thread.sleep(1000);
			if (data.get("WklyMthlyAutoAuthOT") != null) {
				Boolean wklyMthlyAutoAuthOT1 = Boolean.parseBoolean(data.get("WklyMthlyAutoAuthOT"));
				if (weeklyAutoAuthOTComponentflag.isEnabled()) { // if overtime calculation disabled then flag disabled
																	// so
					if (wklyMthlyAutoAuthOT1 == true) {
						if (!weeklyAutoAuthOTComponentflag.isSelected()) {
							element_Click(weeklyAutoAuthOTComponentflag);
						}
					} else {
						if (weeklyAutoAuthOTComponentflag.isSelected()) {
							element_Click(weeklyAutoAuthOTComponentflag);
						}
					}
				}
			}
			Thread.sleep(1000);
			if (data.get("WklyMthlyAuthReqForLateIN") != null) {
				Boolean wklyMthlyAuthReqForLateIN1 = Boolean.parseBoolean(data.get("WklyMthlyAuthReqForLateIN"));
				if (weeklyAutoAuthOTComponentflag.isSelected()) { // if daily auto auth unchecked then flag disabled so
					if (wklyMthlyAuthReqForLateIN1 == true) {
						if (!weeklyAuthReqLateInflag.isSelected()) {
							element_Click(weeklyAuthReqLateInflag);
						}
					} else {
						if (weeklyAuthReqLateInflag.isSelected()) {
							element_Click(weeklyAuthReqLateInflag);
						}
					}
				}
			}
			// Consider In Net Work Hours
			if (data.get("WklyMthlyWeekOffsFlag") != null) {
				Boolean wklyMthlyWeekOffsFlag1 = Boolean.parseBoolean(data.get("WklyMthlyWeekOffsFlag"));
				if (wklyMthlyWeekOffsFlag1 == true) {
					if (!weeklyCheckWeekOffflag.isSelected()) {
						element_Click(weeklyCheckWeekOffflag);
					}
				} else {
					if (weeklyCheckWeekOffflag.isSelected()) {
						element_Click(weeklyCheckWeekOffflag);
					}
				}
			}
			if (data.get("WklyMthlyWeekOffsHrsCal") != null) {
				if (weeklyCheckWeekOffflag.isSelected()) {
					element_DropDownSelectByvisibleText(weeklyCustomWOHrsDD, data.get("WklyMthlyWeekOffsHrsCal"));
				}
			}
			if (data.get("WklyMthlyWeekOffsHrs") != null) {
				if (weeklyCheckWeekOffflag.isSelected()
						&& dropDownSelectedValue(weeklyCustomWOHrsDD).equalsIgnoreCase("Custom Hours")) {
					element_Clear(txtCustomWOHrs);
					element_inputTextUsingActionClassCharacterOneByOne(txtCustomWOHrs, data.get("WklyMthlyWeekOffsHrs"));
				}
			}
			if (data.get("WklyMthlyHolidaysFlag") != null) {
				Boolean wklyMthlyHolidaysFlag1 = Boolean.parseBoolean(data.get("WklyMthlyHolidaysFlag"));
				if (wklyMthlyHolidaysFlag1 == true) {
					if (!weeklyCheckHolidayflag.isSelected()) {
						element_Click(weeklyCheckHolidayflag);
					}
				} else {
					if (weeklyCheckHolidayflag.isSelected()) {
						element_Click(weeklyCheckHolidayflag);
					}
				}
			}
			if (data.get("WklyMthlyHolidaysHrsCal") != null) {
				if (weeklyCheckHolidayflag.isSelected()) {
					element_DropDownSelectByvisibleText(weeklyCustomPHHrsDD, data.get("WklyMthlyHolidaysHrsCal"));
				}
			}
			if (data.get("WklyMthlyHolidaysHrs") != null) {
				if (weeklyCheckHolidayflag.isSelected()
						&& dropDownSelectedValue(weeklyCustomPHHrsDD).equalsIgnoreCase("Custom Hours")) {
					element_Clear(txtCustomPHHrs);
					element_inputTextUsingActionClassCharacterOneByOne(txtCustomPHHrs, data.get("WklyMthlyHolidaysHrs"));
				}
			}
			if (data.get("WklyMthlyPLFlag") != null) {
				Boolean wklyMthlyPLFlag1 = Boolean.parseBoolean(data.get("WklyMthlyPLFlag"));
				if (wklyMthlyPLFlag1 == true) {
					if (!weeklyCheckPaidLvflag.isSelected()) {
						element_Click(weeklyCheckPaidLvflag);
					}
				} else {
					if (weeklyCheckPaidLvflag.isSelected()) {
						element_Click(weeklyCheckPaidLvflag);
					}
				}
			}
			if (data.get("WklyMthlyPLHrsCal") != null) {
				if (weeklyCheckPaidLvflag.isSelected()) {
					element_DropDownSelectByvisibleText(weeklyCustomLVHrsDD, data.get("WklyMthlyPLHrsCal"));
				}
			}
			if (data.get("WklyMthlyPLHrs") != null) {
				if (weeklyCheckPaidLvflag.isSelected()
						&& dropDownSelectedValue(weeklyCustomLVHrsDD).equalsIgnoreCase("Custom Hours")) {
					element_Clear(txtCustomLVHrs);
					element_inputTextUsingActionClassCharacterOneByOne(txtCustomLVHrs, data.get("WklyMthlyPLHrs"));
				}
			}
			if (data.get("WklyMthlyNAFlag") != null) {
				Boolean wklyMthlyNAFlag1 = Boolean.parseBoolean(data.get("WklyMthlyNAFlag"));
				if (wklyMthlyNAFlag1 == true) {
					if (!weeklyCheckNotAppDaysflag.isSelected()) {
						element_Click(weeklyCheckNotAppDaysflag);
					}
				} else {
					if (weeklyCheckNotAppDaysflag.isSelected()) {
						element_Click(weeklyCheckNotAppDaysflag);
					}
				}
			}
			if (data.get("WklyMthlyNAHrs") != null) {
				if (weeklyCheckNotAppDaysflag.isSelected()) {
					element_Clear(weeklyCustomNAHrstxt);
					element_inputTextUsingActionClassCharacterOneByOne(weeklyCustomNAHrstxt, data.get("WklyMthlyNAHrs"));
				}
			}
			if (data.get("ConsWorkDoneonWOPHPL") != null) {
				Boolean consWorkDoneonWOPHPL1 = Boolean.parseBoolean(data.get("ConsWorkDoneonWOPHPL"));
				if (consWorkDoneonWOPHPL1 == true) {
					if (!weeklyConsWorkDoneonWOPHPaidLvFlag.isSelected()) {
						element_Click(weeklyConsWorkDoneonWOPHPaidLvFlag);
					}
				} else {
					if (weeklyConsWorkDoneonWOPHPaidLvFlag.isSelected()) {
						element_Click(weeklyConsWorkDoneonWOPHPaidLvFlag);
					}
				}
			}
		}
		// ****************************************
		// Overtime Limit for Alert Message Panel
		// ****************************************
		if (data.get("OTAlertCal") != null || data.get("DailyOTLimit") != null || data.get("WeeklyOTLimit") != null
				|| data.get("AlrtWeekStartDay") != null || data.get("MnthlyOTLimit") != null) {
			Thread.sleep(1000);
			element_Click(otLimitAlertMessagePanel);
			if (data.get("OTAlertCal") != null) {
				element_DropDownSelectByvisibleText(OvertimeAlertCalculationDD, data.get("OTAlertCal"));
			}
			getOvertimeLimitCustomAlert.put("OTCal", element_DropDownFirstSelectedValue(OvertimeAlertCalculationDD));
			if (data.get("DailyOTLimit") != null) {
				element_Clear(dailyOTmaxLimittxt);
				element_inputTextUsingActionClassCharacterOneByOne(dailyOTmaxLimittxt, data.get("DailyOTLimit"));
			}
			getOvertimeLimitCustomAlert.put("DailyOTLimit", element_getInputControlValue(dailyOTmaxLimittxt));
			if (data.get("WeeklyOTLimit") != null) {
				Thread.sleep(1000);
				String wkLimhrs = data.get("WeeklyOTLimit").substring(0, 3);
				String wkLimmin = data.get("WeeklyOTLimit").substring(3, 5);
				for (int j = 0; j < weeklyOTMaxLimittxt.size(); j++) {
					WebElement ele = weeklyOTMaxLimittxt.get(j);
					if (j == 0) {
						element_Clear(ele);
						element_InputTextUsingActionClass(ele, wkLimhrs);
					} else if (j == 1) {
						element_Clear(ele);
						element_InputTextUsingActionClass(ele, wkLimmin);
					}
				}
			}
			if (data.get("WeeklyOTLimit") != null) {
				if (weekStartDayDD.isEnabled()) {
					element_DropDownSelectByvisibleText(weekStartDayDD, data.get("AlrtWeekStartDay"));
				}
			}
			getOvertimeLimitCustomAlert.put("WeekStartDay", element_DropDownFirstSelectedValue(weekStartDayDD));
			if (data.get("MnthlyOTLimit") != null) {
				Thread.sleep(1000);
				String mnthLimhrs = data.get("MnthlyOTLimit").substring(0, 3);
				String mnthLimmin = data.get("MnthlyOTLimit").substring(3, 5);
				for (int j = 0; j < monthlyOTMaxLimittxt.size(); j++) {
					WebElement ele = monthlyOTMaxLimittxt.get(j);
					if (j == 0) {
						element_Clear(ele);
						element_InputTextUsingActionClass(ele, mnthLimhrs);
					} else if (j == 1) {
						element_Clear(ele);
						element_InputTextUsingActionClass(ele, mnthLimmin);
					}
				}
			}
		}
		saveButtonClick();
		msg = validationMessage();
		if (overtimeLimitAlertOpenOrNot.size() > 0) {
			getOvertimeLimitCustomAlert.put("WeeklyOTLimit", element_getInputControlValue(weeklyOtLimitForCustm1) + ":"
					+ element_getInputControlValue(weeklyOtLimitForCustm2));
			getOvertimeLimitCustomAlert.put("MonthlyOTLimit", element_getInputControlValue(monthlyOtLimitForCustm1)
					+ ":" + element_getInputControlValue(monthlyOtLimitForCustm2));
		}
		Assert.assertEquals(msg, "Saved Successfully");
		//reloadPageButtonClick();
	}

	// ****************************************
	// Daily 2 work components Configuration -- By Mayank
	// ****************************************

	public void daily2ConfigurationOvertimePolicy(String plcName, List<Map<String, String>> data)
			throws InterruptedException {
		waitForElementVisible(plcNametext);
		String msg = null;
		element_Clear(plcNametext);
		element_InputTextUsingActionClass(plcNametext, plcName);
		element_TextBoxToClickOnTab(plcNametext);
		Thread.sleep(1500);
		if (element_isEnabled(plcIdtext)) {
			Thread.sleep(1000);
			msg = "Policy doesn't exist";
		} else {
			if (dailyOvertimePanelOpenOrNot.size() > 0) {
				element_Click(dailyOvertimePanel);
			}
			if (dropDownSelectedValue(overtimeCalculationDD).equalsIgnoreCase("Daily 2")) {
				// Delete already configured grid components for newly updated configuration if
				// any
				while (gridDeleteBtns.size() != 0) {
					element_Click(gridDeleteBtn);
					driver.switchTo().alert().accept();
					Thread.sleep(1000);
				}
				// Add components in grid
				for (int i = 0; i < data.size(); i++) {
					String nwHrsRangeFrom = data.get(i).get("NWHrsRangeFrom");
					String nwHrsRangeTo = data.get(i).get("NWHrsRangeTo");
					String minDurReq = data.get(i).get("MinDurReq");
					String considerAs = data.get(i).get("ConsiderAs");
					String factor = data.get(i).get("Factor");
					String otAssignAsPer = data.get(i).get("OTAssignAsPer");
					element_Click(grdDailyDaysaddBtn);
					String applicableDaysS = data.get(i).get("ApplicableDays");
					Thread.sleep(1000);
					if (nwHrsRangeFrom != null) {
						logger.info("NetworkHrsRangeFrom: " + nwHrsRangeFrom);
						String fromhrs = nwHrsRangeFrom.substring(0, 3);
						String frommin = nwHrsRangeFrom.substring(3, 5);
						for (int j = 0; j < nwRangeFrom.size(); j++) {
							WebElement ele = nwRangeFrom.get(j);
							if (j == 0) {
								element_InputTextUsingActionClass(ele, fromhrs);
								Thread.sleep(250);
							} else if (j == 1) {
								element_InputTextUsingActionClass(ele, frommin);
								Thread.sleep(250);
							}
						}
					}
					if (nwHrsRangeTo != null) {
						logger.info("NetworkHrsRangeTo: " + nwHrsRangeTo);
						String tohrs = nwHrsRangeTo.substring(0, 3);
						String tomin = nwHrsRangeTo.substring(3, 5);
						for (int j = 0; j < nwRangeTo.size(); j++) {
							WebElement ele = nwRangeTo.get(j);
							if (j == 0) {
								element_InputTextUsingActionClass(ele, tohrs);
								Thread.sleep(250);
							} else if (j == 1) {
								element_InputTextUsingActionClass(ele, tomin);
								Thread.sleep(250);
							}
						}
					}
					if (minDurReq != null) {
						String minDurhrs = minDurReq.substring(0, 3);
						String minDurmin = minDurReq.substring(3, 5);
						for (int j = 0; j < minDurationReq.size(); j++) {
							WebElement ele = minDurationReq.get(j);
							if (j == 0) {
								element_InputTextUsingActionClass(ele, minDurhrs);
								Thread.sleep(250);
							} else if (j == 1) {
								element_InputTextUsingActionClass(ele, minDurmin);
								Thread.sleep(250);
							}
						}
					}
					if (considerAs != null) {
						element_DropDownSelectByvisibleText(considerAsDD, considerAs);
					}
					if (applicableDaysS != null) {
						element_Click(applicableDays);
						String[] applicableDaysSSplit = applicableDaysS.split(",");
						for (int j = 0; j < applicableDaysSSplit.length; j++) {
							for (int k = 0; k < appDaysSelectionForDaily1.size(); k++) {
								if (appDaysSelectionForDaily1.get(k).getText()
										.equalsIgnoreCase(applicableDaysSSplit[j])) {
									appDaysSelectionForDaily1.get(k).click();
									break;
								}
							}
						}
					}
					if (factor != null) {
						element_Clear(factortxt);
						element_InputTextUsingActionClass(factortxt, factor);
					}
					if (otAssignAsPer != null) {
						element_DropDownSelectByvisibleText(otAssignAsPerDD, otAssignAsPer);
					}
					Thread.sleep(1000);
					element_Click(gridSaveBtn);
				}
				saveButtonClick();
				Thread.sleep(1000);
				msg = validationMessage();
			} else {
				msg = "Daily Overtime Calculation is set " + dropDownSelectedValue(overtimeCalculationDD);
			}
		}
		Assert.assertEquals(msg, "Saved Successfully");
	}

	// ****************************************
	// Daily 1 work components Configuration -- By Mayank
	// ****************************************
	public void daily1ConfigurationOvertimePolicy(String plcName, List<Map<String, String>> data)
			throws InterruptedException {
		waitForElementVisible(plcNametext);
		String msg = null;
		element_Clear(plcNametext);
		element_dynamicDDSelect(plcNametext, plcName);
		element_Click(overtimeConfigurationPanel);
		if (element_isEnabled(plcIdtext)) {
			Thread.sleep(1000);
			msg = "Policy doesn't exist";
		} else {
			if (dailyOvertimePanelOpenOrNot.size() > 0) {
				element_Click(dailyOvertimePanel);
			}
			Thread.sleep(1000);
			if (dropDownSelectedValue(overtimeCalculationDD).equalsIgnoreCase("Daily 1")) {
				// Delete already configured grid components for newly updated configuration if
				// any
				while (gridDeleteBtns.size() != 0) {
					element_Click(gridDeleteBtn);
					driver.switchTo().alert().accept();
					Thread.sleep(1000);
				}
				// Add components in grid
				for (int i = 0; i < data.size(); i++) {
					String workComponent = data.get(i).get("WorkComponent");
					String rangeFrom = data.get(i).get("RangeFrom");
					String rangeTo = data.get(i).get("RangeTo");
					String minDurReq = data.get(i).get("MinDurReq");
					String considerAs = data.get(i).get("ConsiderAs");
					String factor = data.get(i).get("Factor");
					String applicableDaysS = data.get(i).get("ApplicableDays");
					if (data.size() > 6 && i > 5) { // Changes according to CSR-2881 - FIT 2975
						while (gridPaginationSize.size() > 0) {
							gridPaginationClick.click();
							Thread.sleep(500);
						}
					}
					element_Click(grdDailyDaysaddBtn);
					Thread.sleep(1000);
					if (workComponent != null) {
						logger.info("WorkComponent: " + workComponent);
						element_DropDownSelectByvisibleText(workComponentDD, workComponent);
					}
					if (rangeFrom != null) {
						logger.info("RangeFrom: " + rangeFrom);
						element_Clear(rangeFromtxt);
						element_inputTextUsingActionClassCharacterOneByOne(rangeFromtxt, splitWithColan(rangeFrom));
					}
					if (rangeTo != null) {
						logger.info("RangeTo: " + rangeTo);
						element_Clear(rangeTotxt);
						element_inputTextUsingActionClassCharacterOneByOne(rangeTotxt, splitWithColan(rangeTo));
					}
					if (minDurReq != null) {
						element_Clear(minDurationReqtxt);
						element_inputTextUsingActionClassCharacterOneByOne(minDurationReqtxt, splitWithColan(minDurReq));
					}
					if (considerAs != null) {
						element_DropDownSelectByvisibleText(considerAsDD, considerAs);
					}
					if (applicableDaysS != null) {
						element_Click(applicableDays);
						String[] applicableDaysSSplit = applicableDaysS.split(",");
						for (int j = 0; j < applicableDaysSSplit.length; j++) {
							for (int k = 0; k < appDaysSelectionForDaily1.size(); k++) {
								if (appDaysSelectionForDaily1.get(k).getText()
										.equalsIgnoreCase(applicableDaysSSplit[j])) {
									appDaysSelectionForDaily1.get(k).click();
									break;
								}
							}
						}
					}
					if (factor != null) {
						element_Clear(factortxt);
						element_InputTextUsingActionClass(factortxt, factor);
					}
					Thread.sleep(500);
					element_Click(gridSaveBtn);
				}
				saveButtonClick();
				msg = validationMessage();
			} else {
				msg = "Daily Overtime Calculation is set " + dropDownSelectedValue(overtimeCalculationDD);
			}
		}
		Assert.assertEquals(msg, "Saved Successfully");
	}

	// ****************************************
	// Weekly Monthly work components Configuration -- By Mayank
	// ****************************************
	public void weeklyMonthlyConfigurationOvertimePolicy(String plcName, List<Map<String, String>> data)
			throws InterruptedException {
		String msg = null;
		element_Clear(plcNametext);
		element_InputTextUsingActionClass(plcNametext, plcName);
		Thread.sleep(1000);
		element_Click(overtimeConfigurationPanel);
		Thread.sleep(1500);
		if (element_isEnabled(plcIdtext)) {
			Thread.sleep(1000);
			msg = "Policy doesn't exist";
		} else {
			if (weeklyMonthlyOvertimePanelOpenOrNot.size() > 0) {
				element_Click(weeklyMonthlyOvertimePanel);
			}
			// Delete already configured grid components for newly updated configuration if
			// any
			while (gridweeklyDeleteBtns.size() != 0) {
				element_Click(gridweeklyDeleteBtn);
				driver.switchTo().alert().accept();
				Thread.sleep(1000);
			}
			// Add components in grid
			for (int i = 0; i < data.size(); i++) {
				String nwHrsRangeFrom = data.get(i).get("NWHrsRangeFrom");
				String nwHrsRangeTo = data.get(i).get("NWHrsRangeTo");
				String minDurReq = data.get(i).get("MinDurReq");
				String considerAs = data.get(i).get("ConsiderAs");
				String factor = data.get(i).get("Factor");
				element_Click(grdweeklyaddBtn);
				Thread.sleep(1000);
				if (nwHrsRangeFrom != null) {
					logger.info("NetworkHrsRangeFrom: " + nwHrsRangeFrom);
					String fromhrs = nwHrsRangeFrom.substring(0, 3);
					String frommin = nwHrsRangeFrom.substring(3, 5);
					for (int j = 0; j < nwRangeFrom.size(); j++) {
						WebElement ele = nwRangeFrom.get(j);
						if (j == 0) {
							element_InputTextUsingActionClass(ele, fromhrs);
						} else if (j == 1) {
							element_InputTextUsingActionClass(ele, frommin);
						}
					}
				}
				if (nwHrsRangeTo != null) {
					logger.info("NetworkHrsRangeTo: " + nwHrsRangeTo);
					String tohrs = nwHrsRangeTo.substring(0, 3);
					String tomin = nwHrsRangeTo.substring(3, 5);
					for (int j = 0; j < nwRangeTo.size(); j++) {
						WebElement ele = nwRangeTo.get(j);
						if (j == 0) {
							element_InputTextUsingActionClass(ele, tohrs);
						} else if (j == 1) {
							element_InputTextUsingActionClass(ele, tomin);
						}
					}
				}
				if (minDurReq != null) {
					String minDurhrs = minDurReq.substring(0, 3);
					String minDurmin = minDurReq.substring(3, 5);
					for (int j = 0; j < minDurationReq.size(); j++) {
						WebElement ele = minDurationReq.get(j);
						if (j == 0) {
							element_InputTextUsingActionClass(ele, minDurhrs);
						} else if (j == 1) {
							element_InputTextUsingActionClass(ele, minDurmin);
						}
					}
				}
				if (considerAs != null) {
					element_DropDownSelectByvisibleText(considerAsDD, considerAs);
				}
				if (factor != null) {
					element_Clear(factortxt);
					element_InputTextUsingActionClass(factortxt, factor);
				}
				Thread.sleep(1000);
				element_Click(gridSaveBtn);
			}
			Thread.sleep(1000);
			saveButtonClick();
			Thread.sleep(1000);
			msg = validationMessage();
		}
		Assert.assertEquals(msg, "Saved Successfully");
	}

	// Overtime Rounding For Fraction Of An Hour Configuration -- By Mayank
	public void OTRoundingForFractionOfAnHourOvertimePolicy(String plcName, List<Map<String, String>> data)
			throws InterruptedException {
		String msg = null;
		element_Clear(plcNametext);
		element_InputTextUsingActionClass(plcNametext, plcName);
		element_TextBoxToClickOnTab(plcNametext);
		Thread.sleep(1500);
		if (element_isEnabled(plcIdtext)) {
			Thread.sleep(1000);
			msg = "Policy doesn't exist";
		} else {
			if (overtimeConfigurationPanelOpenOrNot.size() > 0) {
				element_Click(overtimeConfigurationPanel);
			}
//			if (!enableOTRoundingForFracOfAnHrFlag.isSelected()) {
//				element_Click(enableOTRoundingForFracOfAnHrFlag);
//			}
			// Delete already configured grid components for newly updated configuration if
			// any
			while (roundgridDeleteBtns.size() != 0) {
				element_Click(roundgridDeleteBtn);
				driver.switchTo().alert().accept();
				Thread.sleep(1000);
			}
			// Add components in grid
			for (int i = 0; i < data.size(); i++) {
				String rangeFrom = data.get(i).get("RangeFrom");
				String rangeTo = data.get(i).get("RangeTo");
				String considerValueAs = data.get(i).get("ConsiderValueAs");
				String replaceValue = data.get(i).get("ReplaceValue");
				element_Click(roundingGridAddBtn);
				Thread.sleep(1000);
				if (rangeFrom != null) {
					logger.info("RangeFrom: " + rangeFrom);
					element_Clear(roundRangeFrom);
					element_InputTextUsingActionClass(roundRangeFrom, rangeFrom);
				}
				if (rangeTo != null) {
					logger.info("RangeTo: " + rangeTo);
					element_Clear(roundRangeTo);
					element_InputTextUsingActionClass(roundRangeTo, rangeTo);
				}
				if (considerValueAs != null) {
					element_DropDownSelectByvisibleText(considerValueAsDD, considerValueAs);
				}
				if (replaceValue != null) {
					if (roundReplaceValue.isEnabled()) {
						element_Clear(roundReplaceValue);
						element_InputTextUsingActionClass(roundReplaceValue, replaceValue);
					}
				}
				Thread.sleep(1000);
				element_Click(gridSaveBtn);
			}
			saveButtonClick();
			Thread.sleep(1000);
			msg = validationMessage();

		}
		Assert.assertEquals(msg, "Saved Successfully");
	}

	// ****************************************************
	// Delete Policy
	// ***************************************************
	public void deleteOvertimePolicy(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1000);
		if (element_isEnabled(searchBox)) {
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, data.get("Name"));
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			if (overtimePlcName.size() > 0) {
				for (int j = 0; j < overtimePlcName.size(); j++) {
					String plcname1 = overtimePlcName.get(j).getText();
					if (plcname1.equalsIgnoreCase(data.get("Name"))) {
						overtimePlcName.get(j).click();
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						// String val = element_GetText(valMsg);
						String val = validationMessage();
						Thread.sleep(1000);
						Assert.assertEquals(val, "Deleted Successfully");
						Thread.sleep(1000);
						break;
					}
				}
			}
			else {
				Thread.sleep(1000);
				if (addButton.isEnabled()) {
					logger.info("Overtime Policy Not Found");
				}
			}
		}
	}

}
