package PageObject.TimeAndAttendance;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
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
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class AttendancePolicyPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AttendancePolicyPO.class);
	public AttendancePolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@defaultvalue=\"DFLTATDPLC\"]//*[@name='cmnTxtSearch']")
	private WebElement searchBox;

	@FindBy(xpath = "//*[@defaultvalue='DFLTATDPLC']//*[@name='cmnTxtSearch']/ancestor::div[1]/i")
	private WebElement searchButton;

	@FindBy(xpath = "//*[@class=\"col-md-4 col-sm-4 col-xs-12 grid\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]")
	private List<WebElement> atdPlcNames;

	@FindBy(xpath = "//*[@id=\"message\"]/div/label")
	private WebElement valMsg;

	@FindBy(id = "txtPLCID")
	private WebElement plcIdtext;
	
	@FindBy(id="cboStMonth")
	private WebElement startMnth;

	@FindBy(id = "txtPLCName")
	private WebElement plcNametext;

	@FindBy(xpath = "//*[@default='General']")
	private WebElement generalPanel;

	@FindBy(xpath = "//*[@default='Short Leave/Official Hours Restrictions']")
	private WebElement shortLeaveOfficialHoursRestrictionsPanel;
	
	@FindBy(id = "cboATDPRD")
	private WebElement atdPeriodDD;
	
	@FindBy(id = "cboSDay")
	private WebElement monthStartEndDtDD;

	// *******************************************************
	// General Panel Elements
	// *******************************************************

	@FindBy(xpath = "//*[@default=\"General\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> generalPanelOpenOrNot;

	@FindBy(id = "cboMaxATDEVT")
	private WebElement MaxPunchestoconsDD;
	
	@FindBy(id = "cboDeductOutTime")
	private WebElement deductOutTimeDD;
	
	@FindBy(id = "txtDeductMins")
	private WebElement deductOutTimeMinTXT;
	
	@FindBy(id = "txtDUPLPUNCHTime")
	private WebElement dupPunchPrdMinuteTXT;
	
	@FindBy(id = "chkIOFlg")
	private WebElement outPunchFromExitRdrFlag;
	
	@FindBy(id = "chkFirstAsIn")
	private WebElement alwsMark1stPunchAsInPunchFlag;

	@FindBy(id = "chkEventAuthReq")
	private WebElement eventAuthReqflag;

	@FindBy(xpath = "//*[@id='dvEventAuthEventSource']//input")
	private List<WebElement> eventSources;
	
	@FindBy(xpath = "//*[@id='dvEventAuthEventSource']/div/label")
	private List<WebElement> eventSourcesName;

	@FindBy(id = "chkAuthReqForFirstEvent")
	private WebElement authReqforatleastoneEventofthedayflag;
	
	@FindBy(id = "chkATDAUTHFLG")
	private WebElement dailyAtdAuthReqFlag;
	
	@FindBy(id = "chkOTCOCHKFLG")
	private WebElement extraHrsChkwithAuthOTCOffFlag;
	
	@FindBy(id = "chkAutoSFTFlg")
	private WebElement autoShiftCorrectionFlag;
	
	@FindBy(id = "chkPREVATDCHG")
	private WebElement atdCorrectionInClosedPeriodFlag;
	
	@FindBy(id = "chkEnbleAtdCalibration")
	private WebElement atdProcessCalibFlag;
	
	@FindBy(id = "txtMaxEarlyInAllow")
	private WebElement maxEarlyInAllowTxt;
	
	@FindBy(id = "txtMaxLateOutAllow")
	private WebElement maxLateOutAllowTxt;
	
	@FindBy(id = "cboATDPriority")
	private WebElement priorityDD;
	
	@FindBy(id = "txtMaxWorkHrsPerDay")
	private WebElement maxWorkHrsPerDayTxt;
	
	// *******************************************************
	// shortLeave OfficialHours Restrictions Panel elements
	// *******************************************************

	@FindBy(xpath = "//*[@default=\"Short Leave/Official Hours Restrictions\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> shrtLvOffHrsRestPanelOpenOrNot;

	@FindBy(id = "chkPERSAUTHFLG")
	private WebElement shortLeaveAuthReqFlag;

	@FindBy(id = "chkIncludePERS")
	private WebElement addShortLeaveHoursInWorkHoursflag;

	@FindBy(id = "chkIncludeOFCL")
	private WebElement addOfficialHoursInWorkHoursFlag;

	@FindBy(id = "chkOFCLAUTHFLG")
	private WebElement officialINOUTAuthReqFlag;

	@FindBy(id = "chkClubBreakHrs")
	private WebElement clubShortLeaveOfficialWithBreakFlag;
	
	@FindBy(id = "chkMAXPERSCNTCHK")
	private WebElement shrtLvChkInAtdPerFlag;
	
	@FindBy(id = "txtMxPersHrsAld")
	private WebElement shrtLvChkInAtdPerMaxMinutesTxt;
	
	@FindBy(id = "txtMAXPERSCNTALW")
	private WebElement shrtLvChkInAtdPerMaxCountsTxt;
	
	@FindBy(id = "chkMAXPERSCHK")
	private WebElement durChkPerShrtLvEntryFlag;
	
	@FindBy(id = "txtMINPERSALW")
	private WebElement durChkPerShrtLvEntryMinDurTxt;
	
	@FindBy(id = "txtMAXPERSALW")
	private WebElement durChkPerShrtLvEntryMaxDurTxt;
	
	@FindBy(id = "chkPERSGRCShftLateIN")
	private WebElement forShiftLateINFlag;
	
	@FindBy(id = "chkPERSGRCShftEOut")
	private WebElement forShiftEarlyOUTFlag;
	
	@FindBy(id = "chkPERSGRCBrkLateIN")
	private WebElement forBreakLateINFlag;
	
	@FindBy(id = "chkPERSGRCBrkEOut")
	private WebElement forBreakEarlyOUTFlag;
	
	@FindBy(id = "chkEnblRngBaseShortLeave")
	private WebElement rangeBasesShrtLvFlag;
	
	@FindBy(xpath = "//*[contains(@id,'GrdShrtLvRangerow')]//*[@title='Delete']")
	private List<WebElement> rangeShrtLvgridDeleteBtns;

	@FindBy(xpath = "//*[@id='GrdShrtLvRangerow0']//*[@title='Delete']")
	private WebElement rangeShrtLvgridDeleteBtn;
	
	@FindBy(id = "GrdShrtLvRangeaddBtn")
	private WebElement rangeShrtLvGridAddBtn;

	@FindBy(id = "RngFrom")
	private WebElement rangeShrtLvRangeFrom;

	@FindBy(id = "RngTo")
	private WebElement rangeShrtLvRangeTo;
	
	@FindBy(id = "ShortLvCnt")
	private WebElement rangeShrtLvDeduction;
	
	@FindBy(xpath = "//*[@id='savebtn' and not(@hidden)]")
	private WebElement gridSaveBtn;
	
	// *******************************************************
	// Auto Attendance Correction Panel elements
	// *******************************************************
	@FindBy(xpath = "//*[@default=\"Auto Attendance Correction\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> autoAttendanceCorrectionPanelOpenOrNot;

	@FindBy(xpath = "//*[@default='Auto Attendance Correction']")
	private WebElement autoAttendanceCorrectionPanel;

	@FindBy(id = "chkCorrAtdWtLeaves")
	private WebElement enableLeavesFlag;
	
	@FindBy(id = "chkCorrAtdWtOTHrs")
	private WebElement autoAtdCorrectOvertimeFlag;
	
	@FindBy(id = "cmbPrevMnths")
	private WebElement prevMonForOTHrsDD;
	
	@FindBy(id = "chkAtdCorrSrtLvFlg")
	private WebElement enableShrtLvAutoCorrectFlag;
	
	@FindBy(id = "chkAtdCorrOFCLOutFlg")
	private WebElement enableOfficialHrsAutoCorrectFlag;
	
	@FindBy(id = "chkOFCLAtdPeriodCHK")
	private WebElement offcHrsChkInAtdPerFlag;
	
	@FindBy(id = "txtOFCLMAXDURALWD")
	private WebElement offcHrsChkInAtdPerMaxMinutesTxt;
	
	@FindBy(id = "txtOFCLMAXCNTALWD")
	private WebElement offcHrsChkInAtdPerMaxCountsTxt;
	
	@FindBy(id = "chkOFCLDurCHK")
	private WebElement durChkPerOffcHrsEntryFlag;
	
	@FindBy(id = "txtOFCLMINDur")
	private WebElement durChkPerOffcHrsEntryMinDurTxt;
	
	@FindBy(id = "txtOFCLMAXDur")
	private WebElement durChkPerOffcHrsEntryMaxDurTxt;
	
	// *******************************************************
	// Absent Marking Rule Panel elements
	// *******************************************************
	@FindBy(xpath = "//*[@default=\"Absent Marking Rule\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> absentMarkingRulePanelOpenOrNot;

	@FindBy(xpath = "//*[@default='Absent Marking Rule']")
	private WebElement absentMarkingRulePanel;
	
	@FindBy(id = "cmbMarkAbsAsPer")
	private WebElement markAbsentAsPerDD;
	
	@FindBy(id = "cmbAbsMarkingMode")
	private WebElement absentMarkingModeDD;
	
	@FindBy(id = "chkMAXLateCNTCHK")
	private WebElement lateINOccurrenceCheckFlag;
	
	@FindBy(id = "txtMAXLateCNTALW")
	private WebElement lateINMaxCountTxt;
	
	@FindBy(id = "cboABMARKTypeLate")
	private WebElement lateINAbsentMarkingTypeDD;
	
	@FindBy(id = "cboABMARKLate")
	private WebElement lateINMarkAbsentDD;
	
	@FindBy(id = "txtmaxlatein")
	private WebElement lateINMaxDurationTxt;
	
	@FindBy(id = "chkMAXEarlyCNTCHK")
	private WebElement earlyOutOccurrenceCheckFlag;
	
	@FindBy(id = "txtMAXEarlyCNTALW")
	private WebElement earlyOutMaxCountTxt;
	
	@FindBy(id = "cboABMARKTypeEarly")
	private WebElement earlyOutAbsentMarkingTypeDD;
	
	@FindBy(id = "cboABMARKEarly")
	private WebElement earlyOutMarkAbsentDD;
	
	@FindBy(id = "txtMaxEarlyOut")
	private WebElement earlyOutMaxDurationTxt;
	
	@FindBy(id = "txtCombinedCount")
	private WebElement maxLateINEarlyOUTAllowedCountTxt;
	
	@FindBy(id = "cmbAbsMarType")
	private WebElement combinedAbsentMarkingTypeDD;
	
	@FindBy(id = "cboABMARKLate")
	private WebElement combinedLIMarkAbsentDD;
	
	@FindBy(id = "cboABMARKEarly")
	private WebElement combinedEOMarkAbsentDD;
	
	@FindBy(id = "txtMaxlateinallowdmins")
	private WebElement combinedLIEOMaxDurationTxt;
	
	@FindBy(id = "cbolesswrkhour")
	private WebElement lessWorkingHoursCheckFlag;
	
	@FindBy(id = "txtMaxAllowDailyMins")
	private WebElement lessWorkHrsDailyLimitTxt;
	
	@FindBy(id = "cmbMarkAbsentPer")
	private WebElement lessWorkHrsMarkABasPerDD;
	
	@FindBy(id = "txtMonthlyAllowedCount")
	private WebElement lessWorkHrsMonthCountTxt;
	
	@FindBy(id = "txtMaxAllowPerMonthMins")
	private WebElement lessWorkHrsMonthLimitTxt;
	
	@FindBy(id = "lesshrselectmarktype")
	private WebElement lessWorkHrsABmarkTypeDD;
	
	@FindBy(id = "lesshrabsmarktype")
	private WebElement lessWorkHrsMarkAbsentDD;
	
	//**********************************************
	//Flexible Working Settings
	//**********************************************
	@FindBy(xpath = "//*[@default=\"Flexible Working Settings\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> flexibleWorkingSettingPanelOpenOrNot;

	@FindBy(xpath = "//*[@default='Flexible Working Settings']")
	private WebElement flexibleWorkingSettingPanel;
	
	@FindBy(id = "cboConsiderDailyHrs")
	private WebElement considerDailyHrsDD;
	
	@FindBy(id = "txtDailyGraceLimit")
	private WebElement dailyGraceLimitTxt;
	
	@FindBy(id = "txtGraceCountMonthly")
	private WebElement graceCountMonthlyTxt;
	
	@FindBy(id = "cboFlexibleHrsCalculation")
	private WebElement flexibleHrsCalculationDD;
	
	@FindBy(id = "cboFirstDayOfWeek")
	private WebElement firstDayOfWeekDD;
	
	@FindBy(id = "chkApplyDailyWrkLimit")
	private WebElement aplyDailyWrkLmtFlag;
	
	@FindBy(id = "cmbTargetAsPer")
	private WebElement wklyTgtAsPerDD;
	
	@FindBy(id = "txtTarget_1")
	private WebElement tgtHrs1;
	
	@FindBy(id = "txtTarget_2")
	private WebElement tgtHrs2;
	
	@FindBy(id = "txtDailyHours")
	private WebElement tgtDailyHrsTxt;
	
	@FindBy(id = "chkAddGraceHrsForTrgt")
	private WebElement graceHrsFlag;
	
	@FindBy(id = "chkDeductTargetOnLeave")
	private WebElement flagDeductHrsFrTgtLV;
	
	@FindBy(id = "txtDeductTargetOnLeave")
	private WebElement txtDeductHrsFrTgtLV;
	
	@FindBy(id = "chkDeductTargetOnWO")
	private WebElement flagDeductHrsFrTgtWO;
	
	@FindBy(id = "txtDeductTargetOnWO")
	private WebElement txtDeductHrsFrTgtWO;
	
	@FindBy(id = "chkDeductTargetOnPH")
	private WebElement flagDeductHrsFrTgtPH;
	
	@FindBy(id = "txtDeductTargetOnPH")
	private WebElement txtDeductHrsFrTgtPH;
	
	@FindBy(id = "chkDeductTargetOnFBRD")
	private WebElement flagDeductHrsFrTgtFbRd;
	
	@FindBy(id = "txtDeductTargetOnFBRD")
	private WebElement txtDeductHrsFrTgtFbRd;
	
	@FindBy(id = "chkDeductTargetOnNAD")
	private WebElement flagDeductHrsFrTgtNA;
	
	@FindBy(id = "txtDeductTargetOnNAD")
	private WebElement txtDeductHrsFrTgtNA;
	
	@FindBy(id = "txtShortfallHrsDeduction")
	private WebElement shrtfallHrsDeductFullDayHrsTxt;
	
	@FindBy(id = "chkConsiderABIN")
	private WebElement consWrkHrsAbInFlag;
	
	@FindBy(id = "txtConsiderABIN")
	private WebElement consWrkHrsAbInHrsTxt;
	
	@FindBy(id = "chkConsiderWrkHrsOnLeave")
	private WebElement consWrkHrsLvFlag;
	
	@FindBy(id = "txtConsiderWrkHrsOnLeave")
	private WebElement consWrkHrsLvHrsTxt;
	
	@FindBy(id = "chkConsiderWrkHrsOnWO")
	private WebElement consWrkHrsWoFlag;
	
	@FindBy(id = "txtConsiderwrkHrsOnWo")
	private WebElement consWrkHrsWoHrsTxt;
	
	@FindBy(id = "chkConsiderWrkHrsOnPH")
	private WebElement consWrkHrsPhFlag;
	
	@FindBy(id = "txtConsiderWrkHrsOnPH")
	private WebElement consWrkHrsPhHrsTxt;
	
	@FindBy(id = "chkConsiderWrkHrsOnFBRD")
	private WebElement consWrkHrsFbRdFlag;
	
	@FindBy(id = "txtConsiderWrkHrsOnFBRD")
	private WebElement consWrkHrsFbRdHrsTxt;
	
	@FindBy(id = "comboMarkAbsentFor")
	private WebElement flxAbRuleMarkAbForDD;
	
	@FindBy(id = "txtGraceFrShtFall_1")
	private WebElement grcForShrtfallHrs1;
	
	@FindBy(id = "txtGraceFrShtFall_2")
	private WebElement grcForShrtfallHrs2;
	
	@FindBy(id = "txtMarkHlfDyAbsEvry")
	private WebElement flxAbRuleMarkHalfAbForEvryTxt;
	
	
	
	
	
	
	
	//**********************************************
	// Attendance Correction- Short Leave/Official Hours Application Restrictions
	// **********************************************
	@FindBy(xpath = "//*[@default=\"Attendance Correction & Short Leave/Official Hours Application Restrictions\"]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> AtdCorrSlvOffRestPanelOpenOrNot;

	@FindBy(xpath = "//*[@default='Attendance Correction & Short Leave/Official Hours Application Restrictions']")
	private WebElement AtdCorrSlvOffRestPanel;
	
	@FindBy(id = "ApplyToType")
	private WebElement atdCorrSLvOffRestApplyToDD;	
	
	@FindBy(id = "txtRestricMinDays")
	private WebElement atdCorrSLvOffRestMinDaysTxt;	
	
	@FindBy(id = "txtRestricMaxDays")
	private WebElement atdCorrSLvOffRestMaxDaysTxt;	
	
	@FindBy(id = "RestricAtdEnbl")
	private WebElement atdCorrSLvOffRestSpecPeriodFlag;	
	
	@FindBy(id = "RestricType")
	private WebElement atdCorrSLvOffRestTypeDD;	
	
	@FindBy(id = "RestPeriod")
	private WebElement atdCorrSLvOffRestPeriodDD;	
	
	@FindBy(id = "txtRestricPeriodVal")
	private WebElement atdCorrSLvOffRestPeriodCntTxt;	
	
	//*********************************************************************************************
	// Function
	//***********************************************************************************************
	// Created By Mayank
	public void createAttendancePolicy(Map<String, String> data)
			throws InterruptedException {
		String msg = null;
		waitForElementVisible(plcNametext);
		if (element_isEnabled(searchBox)) {
			element_InputText(searchBox, data.get("PlcName"));
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(500);
			if (atdPlcNames.size() > 0) {
				for (int j = 0; j < atdPlcNames.size(); j++) {
					String plcname1 = atdPlcNames.get(j).getText();
					if (plcname1.equalsIgnoreCase(data.get("PlcName"))) {
						atdPlcNames.get(j).click();
						waitForElementClickable(startMnth);
						deleteButtonClick();
						driver.switchTo().alert().accept();
						waitForElementVisible(valMsg);
						String val = element_GetText(valMsg);
						Assert.assertEquals(val, "Deleted Successfully");
						break;
					}
				}
			}
			addButtonClick();
			waitForElementClickableForLoadPage(startMnth);
			WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
			// Custom ExpectedCondition
	        wait.until(new ExpectedCondition<Boolean>() {
	            public Boolean apply(WebDriver driver) {
	                WebElement element = driver.findElement(By.id("txtPLCID"));
	                return !element.isEnabled(); // true when disabled
	            }
	        });
			element_Clear(plcNametext);
			// Custom ExpectedCondition
	        
			element_InputTextUsingActionClass(plcNametext, data.get("PlcName"));
			// logger.info(ar);
			//if (!ar.contains(data.get("PlcName"))) {
				//Thread.sleep(1000);
//				addButtonClick();
//				element_Clear(plcNametext);
//				element_InputTextUsingActionClass(plcNametext, data.get("PlcName"));
			//}
		}
		if (data.get("AtdPeriod") != null) {
			element_DropDownSelectByvisibleText(atdPeriodDD, data.get("AtdPeriod"));
			if (data.get("MonthStartEndDt") != null) {
				if (data.get("AtdPeriod").equalsIgnoreCase("Customized")) {
					element_DropDownSelectByvisibleText(monthStartEndDtDD, data.get("MonthStartEndDt"));
				}
			}
		}
		// **************************************************************
		// *********** General Panel*************************************
		// **************************************************************
		if(data.get("MaxPunchesToCons") != null || data.get("EventAuthReq") != null || data.get("AuthReqforatleastoneEventoftheday") != null || data.get("DeductOutTime") != null || data.get("DeductOutTimeMinutes") != null || data.get("DupPunchPrdMin") != null || data.get("OutPunchFrmExitRdr") != null || data.get("AlwsMrkFirstPunchAsINPunch") != null || data.get("AutoShiftCorr") != null || data.get("AtdProcessCalib") != null || data.get("MaxErlyInAllowHrs") != null || data.get("MaxLateOutAllowHrs") != null || data.get("Priority") != null || data.get("MaxWrkHrsPerDayHrs") != null) {
			if (generalPanelOpenOrNot.size() > 0) {
				element_Click(generalPanel);
			}
			if (data.get("MaxPunchesToCons") != null) {
				element_DropDownSelectByvisibleText(MaxPunchestoconsDD, data.get("MaxPunchesToCons"));
			}
			if (data.get("DeductOutTime") != null) {
				element_DropDownSelectByvisibleText(deductOutTimeDD, data.get("DeductOutTime"));
				if(data.get("DeductOutTimeMinutes") != null) {
					if(element_isEnabled(deductOutTimeMinTXT) == true) {
						element_Clear(deductOutTimeMinTXT);
						element_InputTextUsingActionClass(deductOutTimeMinTXT, data.get("DeductOutTimeMinutes"));
					}
				}
			}
			if (data.get("DupPunchPrdMin") != null) {
				element_Clear(dupPunchPrdMinuteTXT);
				element_InputTextUsingActionClass(dupPunchPrdMinuteTXT, data.get("DupPunchPrdMin"));
			}
			if (data.get("OutPunchFrmExitRdr") != null) {
				Boolean outPunchFrmExitRdr1 = Boolean.parseBoolean(data.get("OutPunchFrmExitRdr"));
				if (outPunchFrmExitRdr1 == true) {
					if (!outPunchFromExitRdrFlag.isSelected()) {
						element_Click(outPunchFromExitRdrFlag);
					}
				} else {
					if (outPunchFromExitRdrFlag.isSelected()) {
						element_Click(outPunchFromExitRdrFlag);
					}
				}
			}
			if (data.get("AlwsMrkFirstPunchAsINPunch") != null) {
				Boolean alwsMrkFirstPunchAsINPunch1 = Boolean.parseBoolean(data.get("AlwsMrkFirstPunchAsINPunch"));
				if (alwsMrkFirstPunchAsINPunch1 == true) {
					if (!alwsMark1stPunchAsInPunchFlag.isSelected()) {
						element_Click(alwsMark1stPunchAsInPunchFlag);
					}
				} else {
					if (alwsMark1stPunchAsInPunchFlag.isSelected()) {
						element_Click(alwsMark1stPunchAsInPunchFlag);
					}
				}
			}
			if (data.get("EventAuthReq") != null) {
				Boolean eventauthreq = Boolean.parseBoolean(data.get("EventAuthReq"));
				if (eventauthreq == true) {
					if (!eventAuthReqflag.isSelected()) {
						element_Click(eventAuthReqflag);
						if (data.get("EventSource").equalsIgnoreCase("All")) {
							for (int i = 0; i < eventSources.size(); i++) {
								WebElement ele = eventSources.get(i);
								if (!ele.isSelected()) {
									ele.click();
								}
							}
						} else {
							String[] commaSeparatedValues = data.get("EventSource").split(",");
							for (int i = 0; i < commaSeparatedValues.length; i++) {
								String eSource = commaSeparatedValues[i].trim();
								for (int j = 0; j < eventSourcesName.size(); j++) {
									if (eventSourcesName.get(j).getText().equalsIgnoreCase(eSource)) {
										eventSourcesName.get(j).click();
										break;
									}
								}
							}
						}
					}
				} else {
					if (eventAuthReqflag.isSelected()) {
						element_Click(eventAuthReqflag);
					}
				}
			}
			Thread.sleep(500);
			if (data.get("AuthReqforatleastoneEventoftheday") != null) {
				Boolean authReqforatleastoneEventoftheday1 = Boolean
						.parseBoolean(data.get("AuthReqforatleastoneEventoftheday"));
				if (eventAuthReqflag.isSelected()) { // flag depends on Event AUth flag
					if (authReqforatleastoneEventoftheday1 == true) {
						if (!authReqforatleastoneEventofthedayflag.isSelected()) {
							element_Click(authReqforatleastoneEventofthedayflag);
						}
					} else {
						if (authReqforatleastoneEventofthedayflag.isSelected()) {
							element_Click(authReqforatleastoneEventofthedayflag);
						}
					}
				}
			}
			Thread.sleep(1000);
			if (data.get("DailyAtdAuthReq") != null) {
				Boolean DailyAtdAuthReq1 = Boolean.parseBoolean(data.get("DailyAtdAuthReq"));
				if (DailyAtdAuthReq1 == true) {
					if (!dailyAtdAuthReqFlag.isSelected()) {
						element_Click(dailyAtdAuthReqFlag);
					}
				} else {
					if (dailyAtdAuthReqFlag.isSelected()) {
						element_Click(dailyAtdAuthReqFlag);
					}
				}
			}
			Thread.sleep(500);
			if (data.get("ExtraHrsChkwithAuthOTCOFF") != null) {
				Boolean extraHrsChkwithAuthOTCOFF1 = Boolean.parseBoolean(data.get("ExtraHrsChkwithAuthOTCOFF"));
				if (extraHrsChkwithAuthOTCOFF1 == true) {
					if (!extraHrsChkwithAuthOTCOffFlag.isSelected()) {
						element_Click(extraHrsChkwithAuthOTCOffFlag);
					}
				} else {
					if (extraHrsChkwithAuthOTCOffFlag.isSelected()) {
						element_Click(extraHrsChkwithAuthOTCOffFlag);
					}
				}
			}
			Thread.sleep(500);
			if (data.get("AutoShiftCorr") != null) {
				Boolean autoShiftCorr1 = Boolean.parseBoolean(data.get("AutoShiftCorr"));
				if (autoShiftCorr1 == true) {
					if (!autoShiftCorrectionFlag.isSelected()) {
						element_Click(autoShiftCorrectionFlag);
					}
				} else {
					if (autoShiftCorrectionFlag.isSelected()) {
						element_Click(autoShiftCorrectionFlag);
					}
				}
			}
			if (data.get("AtdCorrectionInClosedPeriod") != null) {
				Boolean atdCorrectionInClosedPeriod1 = Boolean.parseBoolean(data.get("AtdCorrectionInClosedPeriod"));
				if (atdCorrectionInClosedPeriod1 == true) {
					if (!atdCorrectionInClosedPeriodFlag.isSelected()) {
						element_Click(atdCorrectionInClosedPeriodFlag);
					}
				} else {
					if (atdCorrectionInClosedPeriodFlag.isSelected()) {
						element_Click(atdCorrectionInClosedPeriodFlag);
					}
				}
			}
			if (data.get("AtdProcessCalib") != null) {
				Boolean atdProcessCalib1 = Boolean.parseBoolean(data.get("AtdProcessCalib"));
				if (atdProcessCalib1 == true) {
					if (!atdProcessCalibFlag.isSelected()) {
						element_Click(atdProcessCalibFlag);
					}
				} else {
					if (atdProcessCalibFlag.isSelected()) {
						element_Click(atdProcessCalibFlag);
					}
				}
			}
			if (data.get("MaxErlyInAllowHrs") != null) {
				element_Clear(maxEarlyInAllowTxt);
				element_inputTextUsingActionClassCharacterOneByOne(maxEarlyInAllowTxt, data.get("MaxErlyInAllowHrs"));
			}
			if (data.get("MaxLateOutAllowHrs") != null) {
				element_Clear(maxLateOutAllowTxt);
				element_inputTextUsingActionClassCharacterOneByOne(maxLateOutAllowTxt, data.get("MaxLateOutAllowHrs"));
			}
			if (data.get("Priority") != null) {
				element_DropDownSelectByvisibleText(priorityDD, data.get("Priority"));
			}
			if (data.get("MaxWrkHrsPerDayHrs") != null) {
				element_Clear(maxWorkHrsPerDayTxt);
				element_inputTextUsingActionClassCharacterOneByOne(maxWorkHrsPerDayTxt, data.get("MaxWrkHrsPerDayHrs"));
			}
		}
		// **************************************************************
		// *********** Short Leave/Official Hours Restrictions
		// Panel*************************************
		// **************************************************************
		if(data.get("ShrtLvAuthReq") != null || data.get("AddShrtLvHrsInWrkHrs") != null || data.get("OffiInOutAuthReq") != null || data.get("AddOffiHrsInWrkHrs") != null || data.get("ClubShrtLvOffiWithBrk") != null || data.get("ShrtLvChkInAtdPeriod") != null || data.get("MaxMinutesAlwdInAtdPeriod") != null || data.get("MaxCountsAlwdInAtdPeriod") != null || data.get("DurChkPerShrtLvEntry") != null || data.get("MinDurPerShrtLv") != null || data.get("MaxDurPerShrtLv") != null || data.get("ShrtLvGrcForShiftLI") != null || data.get("ShrtLvGrcForShiftEO") != null || data.get("ShrtLvGrcForShiftBLI") != null || data.get("ShrtLvGrcForShiftBEO") != null) {
			if (shrtLvOffHrsRestPanelOpenOrNot.size() > 0) {
				element_Click(shortLeaveOfficialHoursRestrictionsPanel);
			}
			if (data.get("ShrtLvChkInAtdPeriod") != null) {
				Boolean shrtLvChkInAtdPeriod = Boolean.parseBoolean(data.get("ShrtLvChkInAtdPeriod"));
				if (shrtLvChkInAtdPeriod == true) {
					if (!shrtLvChkInAtdPerFlag.isSelected()) {
						element_Click(shrtLvChkInAtdPerFlag);
					}
				} else {
					if (shrtLvChkInAtdPerFlag.isSelected()) {
						element_Click(shrtLvChkInAtdPerFlag);
					}
				}
			}
			if (data.get("MaxMinutesAlwdInAtdPeriod") != null) {
				if (element_isSelected(shrtLvChkInAtdPerFlag)) {
					element_Clear(shrtLvChkInAtdPerMaxMinutesTxt);
					element_InputTextUsingActionClass(shrtLvChkInAtdPerMaxMinutesTxt, data.get("MaxMinutesAlwdInAtdPeriod"));
				}
			}
			if (data.get("MaxCountsAlwdInAtdPeriod") != null) {
				if (element_isSelected(shrtLvChkInAtdPerFlag)) {
					element_Clear(shrtLvChkInAtdPerMaxCountsTxt);
					element_InputTextUsingActionClass(shrtLvChkInAtdPerMaxCountsTxt, data.get("MaxCountsAlwdInAtdPeriod"));
				}
			}
			if (data.get("DurChkPerShrtLvEntry") != null) {
				Boolean durChkPerShrtLvEntry = Boolean.parseBoolean(data.get("DurChkPerShrtLvEntry"));
				if (durChkPerShrtLvEntry == true) {
					if (!durChkPerShrtLvEntryFlag.isSelected()) {
						element_Click(durChkPerShrtLvEntryFlag);
					}
				} else {
					if (durChkPerShrtLvEntryFlag.isSelected()) {
						element_Click(durChkPerShrtLvEntryFlag);
					}
				}
			}
			if (data.get("MinDurPerShrtLv") != null) {
				if (element_isSelected(durChkPerShrtLvEntryFlag)) {
					element_Clear(durChkPerShrtLvEntryMinDurTxt);
					element_inputTextUsingActionClassCharacterOneByOne(durChkPerShrtLvEntryMinDurTxt, data.get("MinDurPerShrtLv"));
				}
			}
			if (data.get("MaxDurPerShrtLv") != null) {
				if (element_isSelected(durChkPerShrtLvEntryFlag)) {
					element_Clear(durChkPerShrtLvEntryMaxDurTxt);
					element_inputTextUsingActionClassCharacterOneByOne(durChkPerShrtLvEntryMaxDurTxt, data.get("MaxDurPerShrtLv"));
				}
			}
			if (data.get("ShrtLvGrcForShiftLI") != null) {
				Boolean shrtLvGrcForShiftLI = Boolean.parseBoolean(data.get("ShrtLvGrcForShiftLI"));
				if (shrtLvGrcForShiftLI == true) {
					if (!forShiftLateINFlag.isSelected()) {
						element_Click(forShiftLateINFlag);
					}
				} else {
					if (forShiftLateINFlag.isSelected()) {
						element_Click(forShiftLateINFlag);
					}
				}
			}
			if (data.get("ShrtLvGrcForShiftEO") != null) {
				Boolean shrtLvGrcForShiftEO = Boolean.parseBoolean(data.get("ShrtLvGrcForShiftEO"));
				if (shrtLvGrcForShiftEO == true) {
					if (!forShiftEarlyOUTFlag.isSelected()) {
						element_Click(forShiftEarlyOUTFlag);
					}
				} else {
					if (forShiftEarlyOUTFlag.isSelected()) {
						element_Click(forShiftEarlyOUTFlag);
					}
				}
			}
			if (data.get("ShrtLvGrcForShiftBLI") != null) {
				Boolean shrtLvGrcForShiftBLI = Boolean.parseBoolean(data.get("ShrtLvGrcForShiftBLI"));
				if (shrtLvGrcForShiftBLI == true) {
					if (!forBreakLateINFlag.isSelected()) {
						element_Click(forBreakLateINFlag);
					}
				} else {
					if (forBreakLateINFlag.isSelected()) {
						element_Click(forBreakLateINFlag);
					}
				}
			}
			if (data.get("ShrtLvGrcForShiftBEO") != null) {
				Boolean shrtLvGrcForShiftBEO = Boolean.parseBoolean(data.get("ShrtLvGrcForShiftBEO"));
				if (shrtLvGrcForShiftBEO == true) {
					if (!forBreakEarlyOUTFlag.isSelected()) {
						element_Click(forBreakEarlyOUTFlag);
					}
				} else {
					if (forBreakEarlyOUTFlag.isSelected()) {
						element_Click(forBreakEarlyOUTFlag);
					}
				}
			}
			if (data.get("ShrtLvAuthReq") != null) {
				Boolean shrtLvAuthReq1 = Boolean.parseBoolean(data.get("ShrtLvAuthReq"));
				if (shrtLvAuthReq1 == true) {
					if (!shortLeaveAuthReqFlag.isSelected()) {
						element_Click(shortLeaveAuthReqFlag);
					}
				} else {
					if (shortLeaveAuthReqFlag.isSelected()) {
						element_Click(shortLeaveAuthReqFlag);
					}
				}
			}
			if (data.get("AddShrtLvHrsInWrkHrs") != null) {
				Boolean addShrtLvHrsInWrkHrs1 = Boolean.parseBoolean(data.get("AddShrtLvHrsInWrkHrs"));
				if (addShrtLvHrsInWrkHrs1 == true) {
					if (!addShortLeaveHoursInWorkHoursflag.isSelected()) {
						element_Click(addShortLeaveHoursInWorkHoursflag);
					}
				} else {
					if (addShortLeaveHoursInWorkHoursflag.isSelected()) {
						element_Click(addShortLeaveHoursInWorkHoursflag);
					}
				}
			}
			if (data.get("OffiInOutAuthReq") != null) {
				Boolean offiInOutAuthReq1 = Boolean.parseBoolean(data.get("OffiInOutAuthReq"));
				if (offiInOutAuthReq1 == true) {
					if (!officialINOUTAuthReqFlag.isSelected()) {
						element_Click(officialINOUTAuthReqFlag);
					}
				} else {
					if (officialINOUTAuthReqFlag.isSelected()) {
						element_Click(officialINOUTAuthReqFlag);
					}
				}
			}

			if (data.get("AddOffiHrsInWrkHrs") != null) {
				Boolean addOffiHrsInWrkHrs1 = Boolean.parseBoolean(data.get("AddOffiHrsInWrkHrs"));
				if (addOffiHrsInWrkHrs1 == true) {
					if (!addOfficialHoursInWorkHoursFlag.isSelected()) {
						element_Click(addOfficialHoursInWorkHoursFlag);
					}
				} else {
					if (addOfficialHoursInWorkHoursFlag.isSelected()) {
						element_Click(addOfficialHoursInWorkHoursFlag);
					}
				}
			}

			if (data.get("ClubShrtLvOffiWithBrk") != null) {
				Boolean clubShrtLvOffiWithBrk1 = Boolean.parseBoolean(data.get("ClubShrtLvOffiWithBrk"));
				if (clubShrtLvOffiWithBrk1 == true) {
					if (!clubShortLeaveOfficialWithBreakFlag.isSelected()) {
						element_Click(clubShortLeaveOfficialWithBreakFlag);
					}
				} else {
					if (clubShortLeaveOfficialWithBreakFlag.isSelected()) {
						element_Click(clubShortLeaveOfficialWithBreakFlag);
					}
				}
			}
			
		}
		// **************************************************************
		// *********** Auto Attendance Correction
		// Panel*************************************
		// **************************************************************
		if(data.get("AutoAtdCorrectLeave") != null || data.get("AutoAtdCorrectOvertime") != null || data.get("PrevMonForOTHrs") != null || data.get("AutoAtdCorrectShrtLv") != null || data.get("AutoAtdCorrectOfficialHrs") != null || data.get("OffcHrsChkInAtdPeriod") != null || data.get("MaxMinutesAlwdInAtdPeriodOffcHrs") != null || data.get("MaxCountsAlwdInAtdPeriodOffcHrs") != null || data.get("DurChkPerOffcHrsEntry") != null || data.get("MinDurPerOffcHrs") != null || data.get("MaxDurPerOffcHrs") != null) {
			if (autoAttendanceCorrectionPanelOpenOrNot.size() > 0) {
				element_Click(autoAttendanceCorrectionPanel);
			}
			if (data.get("AutoAtdCorrectLeave") != null) {
				Boolean autoAtdCorrectLeave1 = Boolean.parseBoolean(data.get("AutoAtdCorrectLeave"));
				if (autoAtdCorrectLeave1 == true) {
					if (!enableLeavesFlag.isSelected()) {
						element_Click(enableLeavesFlag);
					}
				} else {
					if (enableLeavesFlag.isSelected()) {
						element_Click(enableLeavesFlag);
					}
				}
			}
			if (data.get("AutoAtdCorrectOvertime") != null) {
				Boolean autoAtdCorrectOvertime = Boolean.parseBoolean(data.get("AutoAtdCorrectOvertime"));
				if (autoAtdCorrectOvertime == true) {
					if (!autoAtdCorrectOvertimeFlag.isSelected()) {
						element_Click(autoAtdCorrectOvertimeFlag);
					}
					if (data.get("PrevMonForOTHrs") != null) {
						element_DropDownSelectByvisibleText(prevMonForOTHrsDD, data.get("PrevMonForOTHrs"));
					}
				} else {
					if (autoAtdCorrectOvertimeFlag.isSelected()) {
						element_Click(autoAtdCorrectOvertimeFlag);
					}
				}
			}
			if (data.get("AutoAtdCorrectShrtLv") != null) {
				Boolean autoAtdCorrectShrtLv = Boolean.parseBoolean(data.get("AutoAtdCorrectShrtLv"));
				if (autoAtdCorrectShrtLv == true) {
					if (!enableShrtLvAutoCorrectFlag.isSelected()) {
						element_Click(enableShrtLvAutoCorrectFlag);
					}
				} else {
					if (enableShrtLvAutoCorrectFlag.isSelected()) {
						element_Click(enableShrtLvAutoCorrectFlag);
					}
				}
			}
			if (data.get("AutoAtdCorrectOfficialHrs") != null) {
				Boolean autoAtdCorrectOfficialHrs = Boolean.parseBoolean(data.get("AutoAtdCorrectOfficialHrs"));
				if (autoAtdCorrectOfficialHrs == true) {
					if (!enableOfficialHrsAutoCorrectFlag.isSelected()) {
						element_Click(enableOfficialHrsAutoCorrectFlag);
					}
				} else {
					if (enableOfficialHrsAutoCorrectFlag.isSelected()) {
						element_Click(enableOfficialHrsAutoCorrectFlag);
					}
				}
			}
			if (element_isSelected(enableOfficialHrsAutoCorrectFlag)) {
				Thread.sleep(1000);
				if (data.get("OffcHrsChkInAtdPeriod") != null) {
					Boolean offcHrsChkInAtdPeriod = Boolean.parseBoolean(data.get("OffcHrsChkInAtdPeriod"));
					if (offcHrsChkInAtdPeriod == true) {
						if (!offcHrsChkInAtdPerFlag.isSelected()) {
							element_Click(offcHrsChkInAtdPerFlag);
						}
					} else {
						if (offcHrsChkInAtdPerFlag.isSelected()) {
							element_Click(offcHrsChkInAtdPerFlag);
						}
					}
				}
				if (data.get("MaxMinutesAlwdInAtdPeriodOffcHrs") != null) {
					if (element_isSelected(offcHrsChkInAtdPerFlag)) {
						element_Clear(offcHrsChkInAtdPerMaxMinutesTxt);
						element_inputTextUsingActionClassCharacterOneByOne(offcHrsChkInAtdPerMaxMinutesTxt, data.get("MaxMinutesAlwdInAtdPeriodOffcHrs"));
					}
				}
				if (data.get("MaxCountsAlwdInAtdPeriodOffcHrs") != null) {
					if (element_isSelected(offcHrsChkInAtdPerFlag)) {
						element_Clear(offcHrsChkInAtdPerMaxCountsTxt);
						element_InputTextUsingActionClass(offcHrsChkInAtdPerMaxCountsTxt, data.get("MaxCountsAlwdInAtdPeriodOffcHrs"));
					}
				}
				if (data.get("DurChkPerOffcHrsEntry") != null) {
					Boolean durChkPerOffcHrsEntry = Boolean.parseBoolean(data.get("DurChkPerOffcHrsEntry"));
					if (durChkPerOffcHrsEntry == true) {
						if (!durChkPerOffcHrsEntryFlag.isSelected()) {
							element_Click(durChkPerOffcHrsEntryFlag);
						}
					} else {
						if (durChkPerOffcHrsEntryFlag.isSelected()) {
							element_Click(durChkPerOffcHrsEntryFlag);
						}
					}
				}
				if (data.get("MinDurPerOffcHrs") != null) {
					if (element_isSelected(durChkPerOffcHrsEntryFlag)) {
						element_Clear(durChkPerOffcHrsEntryMinDurTxt);
						element_inputTextUsingActionClassCharacterOneByOne(durChkPerOffcHrsEntryMinDurTxt, data.get("MinDurPerOffcHrs"));
					}
				}
				if (data.get("MaxDurPerOffcHrs") != null) {
					if (element_isSelected(durChkPerOffcHrsEntryFlag)) {
						element_Clear(durChkPerOffcHrsEntryMaxDurTxt);
						element_inputTextUsingActionClassCharacterOneByOne(durChkPerOffcHrsEntryMaxDurTxt, data.get("MaxDurPerOffcHrs"));
					}
				}
			}
		}
		// **************************************************************
		// Absent Marking Rule   --Mayank
		// **************************************************************
		if(data.get("LiEoMarkAbsentAsPer") != null || data.get("LiEoMode") != null  || data.get("LiCheckEnable") != null  || data.get("LiMaxCount") != null  || data.get("LiAbsentMarkType") != null  || data.get("LiMarkAbsent") != null  || data.get("LiMaxDuration") != null  || data.get("EoCheckEnable") != null  || data.get("EoMaxCount") != null  || data.get("EoAbsentMarkType") != null  || data.get("EoMarkAbsent") != null  || data.get("EoMaxDuration") != null  || data.get("LiEoMaxDuration") != null  || data.get("LiEoAbsentMarkType") != null  || data.get("LiEoMarkAbsentForLi") != null  || data.get("LiEoMarkAbsentForEo") != null || data.get("LiEoMaxCount") != null  || data.get("LessWorkHrsCheck") != null  || data.get("LessWorkHrsDailyLimit") != null  || data.get("LessWorkHrsMarkABasPer") != null  || data.get("LessWorkHrsMonthCount") != null  || data.get("LessWorkHrsMonthLimit") != null  || data.get("LessWorkHrsABmarkType") != null  || data.get("LessWorkHrsMarkAbsent") != null) {
			if (absentMarkingRulePanelOpenOrNot.size() > 0) {
				element_Click(absentMarkingRulePanel);
			}
			if (data.get("LiEoMarkAbsentAsPer") != null) {
				element_DropDownSelectByvisibleText(markAbsentAsPerDD, data.get("LiEoMarkAbsentAsPer"));
			}
			if (data.get("LiEoMode") != null) {
				element_DropDownSelectByvisibleText(absentMarkingModeDD, data.get("LiEoMode"));

				if (data.get("LiEoMode").equalsIgnoreCase("Independent")) {
					if (data.get("LiCheckEnable") != null) {
						boolean liCheckEnable = Boolean.parseBoolean(data.get("LiCheckEnable"));
						if (liCheckEnable == true) {
							if (!lateINOccurrenceCheckFlag.isSelected()) {
								element_Click(lateINOccurrenceCheckFlag);
							}
							if (data.get("LiMaxCount") != null) {
								if (data.get("LiEoMarkAbsentAsPer").equalsIgnoreCase("Monthly Count")) {
									element_Clear(lateINMaxCountTxt);
									element_InputTextUsingActionClass(lateINMaxCountTxt, data.get("LiMaxCount"));
								}
							}
							if (data.get("LiMaxDuration") != null) {
								if (data.get("LiEoMarkAbsentAsPer").equalsIgnoreCase("Monthly Duration")) {
									element_Clear(lateINMaxDurationTxt);
									element_InputTextUsingActionClass(lateINMaxDurationTxt, data.get("LiMaxDuration"));
								}
							}
							if (data.get("LiAbsentMarkType") != null) {
								element_DropDownSelectByvisibleText(lateINAbsentMarkingTypeDD,
										data.get("LiAbsentMarkType"));
							}
							if (data.get("LiMarkAbsent") != null) {
								element_DropDownSelectByvisibleText(lateINMarkAbsentDD, data.get("LiMarkAbsent"));
							}
						} else {
							if (lateINOccurrenceCheckFlag.isSelected()) {
								element_Click(lateINOccurrenceCheckFlag);
							}
						}
					}
					if (data.get("EoCheckEnable") != null) {
						boolean eoCheckEnable = Boolean.parseBoolean(data.get("EoCheckEnable"));
						if (eoCheckEnable == true) {
							if (!earlyOutOccurrenceCheckFlag.isSelected()) {
								element_Click(earlyOutOccurrenceCheckFlag);
							}
							if (data.get("EoMaxCount") != null) {
								if (data.get("LiEoMarkAbsentAsPer").equalsIgnoreCase("Monthly Count")) {
									element_Clear(earlyOutMaxCountTxt);
									element_InputTextUsingActionClass(earlyOutMaxCountTxt, data.get("EoMaxCount"));
								}
							}
							if (data.get("EoMaxDuration") != null) {
								if (data.get("LiEoMarkAbsentAsPer").equalsIgnoreCase("Monthly Duration")) {
									element_Clear(earlyOutMaxDurationTxt);
									element_InputTextUsingActionClass(earlyOutMaxDurationTxt, data.get("EoMaxDuration"));
								}
							}
							if (data.get("EoAbsentMarkType") != null) {
								element_DropDownSelectByvisibleText(earlyOutAbsentMarkingTypeDD,
										data.get("EoAbsentMarkType"));
							}
							if (data.get("EoMarkAbsent") != null) {
								element_DropDownSelectByvisibleText(earlyOutMarkAbsentDD, data.get("EoMarkAbsent"));
							}
						} else {
							if (earlyOutOccurrenceCheckFlag.isSelected()) {
								element_Click(earlyOutOccurrenceCheckFlag);
							}
						}
					}
				}
				if (data.get("LiEoMode").equalsIgnoreCase("Combined")) {
					if (data.get("LiEoMaxCount") != null) {
						if (data.get("LiEoMarkAbsentAsPer").equalsIgnoreCase("Monthly Count")) {
							element_Clear(maxLateINEarlyOUTAllowedCountTxt);
							element_InputTextUsingActionClass(maxLateINEarlyOUTAllowedCountTxt, data.get("LiEoMaxCount"));
						}
					}
					if (data.get("LiEoMaxDuration") != null) {
						if (data.get("LiEoMarkAbsentAsPer").equalsIgnoreCase("Monthly Duration")) {
							element_Clear(combinedLIEOMaxDurationTxt);
							element_InputTextUsingActionClass(combinedLIEOMaxDurationTxt, data.get("LiEoMaxDuration"));
						}
					}
					if (data.get("LiEoAbsentMarkType") != null) {
						element_DropDownSelectByvisibleText(combinedAbsentMarkingTypeDD,
								data.get("LiEoAbsentMarkType"));
					}
					if (data.get("LiEoMarkAbsentForLi") != null) {
						element_DropDownSelectByvisibleText(combinedLIMarkAbsentDD, data.get("LiEoMarkAbsentForLi"));
					}
					if (data.get("LiEoMarkAbsentForEo") != null) {
						element_DropDownSelectByvisibleText(combinedEOMarkAbsentDD, data.get("LiEoMarkAbsentForEo"));
					}
				}
			}
			// Less Working Hrs check --Mayank
			if (data.get("LessWorkHrsCheck") != null) {
				Boolean lessWorkHrsCheck = Boolean.parseBoolean(data.get("LessWorkHrsCheck"));
				if (lessWorkHrsCheck==true) {
					if (!lessWorkingHoursCheckFlag.isSelected()) {
						element_Click(lessWorkingHoursCheckFlag);
					}
					if (data.get("LessWorkHrsDailyLimit") != null) {
						element_Clear(lessWorkHrsDailyLimitTxt);
						element_InputTextUsingActionClass(lessWorkHrsDailyLimitTxt, data.get("LessWorkHrsDailyLimit"));
					}
					if (data.get("LessWorkHrsMarkABasPer") != null) {
						element_DropDownSelectByvisibleText(lessWorkHrsMarkABasPerDD, data.get("LessWorkHrsMarkABasPer"));

						if (data.get("LessWorkHrsMarkABasPer").equalsIgnoreCase("Monthly Count") || data.get("LessWorkHrsMarkABasPer").equalsIgnoreCase("Both")) {
							if (data.get("LessWorkHrsMonthCount") != null) {
								element_Clear(lessWorkHrsMonthCountTxt);
								element_InputTextUsingActionClass(lessWorkHrsMonthCountTxt, data.get("LessWorkHrsMonthCount"));
							}
						}
						if (data.get("LessWorkHrsMarkABasPer").equalsIgnoreCase("Monthly Duration") || data.get("LessWorkHrsMarkABasPer").equalsIgnoreCase("Both")) {
							if (data.get("LessWorkHrsMonthLimit") != null) {
								element_Clear(lessWorkHrsMonthLimitTxt);
								element_InputTextUsingActionClass(lessWorkHrsMonthLimitTxt, data.get("LessWorkHrsMonthLimit"));
							}
						}
					}
					if (data.get("LessWorkHrsABmarkType") != null) {
						element_DropDownSelectByvisibleText(lessWorkHrsABmarkTypeDD, data.get("LessWorkHrsABmarkType"));
					}
					if (data.get("LessWorkHrsMarkAbsent") != null) {
						element_DropDownSelectByvisibleText(lessWorkHrsMarkAbsentDD, data.get("LessWorkHrsMarkAbsent"));
					}
				}
				else {
					if (lessWorkingHoursCheckFlag.isSelected()) {
						element_Click(lessWorkingHoursCheckFlag);
					}
				}
			}
		}
		// **************************************************************
				// *********** Flexible Working Settings
				// Panel*************************************
				// **************************************************************
		if(data.get("ConsDailyHrs") != null || data.get("DlyGrcLimitInMinutes") != null || data.get("GrcCountMonthly") != null || data.get("FlexHrsCal") != null ||
				data.get("FirstDayOfWeek") != null || data.get("AplyDailyWrkLmt") != null || data.get("WklyTgtAsPer") != null || data.get("TgtHrs") != null || 
				data.get("TgtDailyHrs") != null || data.get("GraceHrs") != null || data.get("ShrtfallHrsDeductFullDayHrs") != null || data.get("FlxAbRuleMarkAbFor") != null || 
				data.get("GrcForShrtfallHrs") != null || data.get("FlxAbRuleMarkHalfAbForEvry") != null || data.get("DeductHrsFrTgtLV") != null || data.get("DeductHrsFrTgtWO") != null || 
				data.get("DeductHrsFrTgtPH") != null || data.get("DeductHrsFrTgtFbRd") != null || data.get("DeductHrsFrTgtNA") != null || data.get("ConsWrkHrsAbInFlg") != null || 
				data.get("ConsWrkHrsAbInHrs") != null || data.get("ConsWrkHrsLvFlg") != null ||data.get("ConsWrkHrsLvHrs") != null ||data.get("ConsWrkHrsWoFlg") != null ||
				data.get("ConsWrkHrsWoHrs") != null ||data.get("ConsWrkHrsPhFlg") != null ||data.get("ConsWrkHrsPhHrs") != null ||data.get("ConsWrkHrsFbRdFlg") != null ||
				data.get("ConsWrkHrsFbRdHrs") != null  ) {
			if (flexibleWorkingSettingPanelOpenOrNot.size() > 0) {
				element_Click(flexibleWorkingSettingPanel);
			}
			if(data.get("ConsDailyHrs") != null) {
				element_DropDownSelectByvisibleText(considerDailyHrsDD, data.get("ConsDailyHrs"));
				Thread.sleep(500);
			}
			if(data.get("DlyGrcLimitInMinutes") != null) {
				element_Clear(dailyGraceLimitTxt);
				element_InputTextUsingActionClass(dailyGraceLimitTxt, data.get("DlyGrcLimitInMinutes"));
				Thread.sleep(500);
			}
			if(data.get("GrcCountMonthly") != null) {
				element_Clear(graceCountMonthlyTxt);
				element_InputTextUsingActionClass(graceCountMonthlyTxt, data.get("GrcCountMonthly"));
				Thread.sleep(500);
			}
			if(data.get("FlexHrsCal") != null) {
				element_DropDownSelectByvisibleText(flexibleHrsCalculationDD, data.get("FlexHrsCal"));
				Thread.sleep(500);
				if (!data.get("FlexHrsCal").equalsIgnoreCase("None")) {
					if (data.get("FirstDayOfWeek") != null) {
						if (data.get("FlexHrsCal").equalsIgnoreCase("Weekly Basis")) {
							element_DropDownSelectByvisibleText(firstDayOfWeekDD, data.get("FirstDayOfWeek"));
						}
					}
					if (data.get("AplyDailyWrkLmt") != null) {
						boolean aplyDailyWrkLmt= Boolean.parseBoolean(data.get("AplyDailyWrkLmt"));
						if (aplyDailyWrkLmt == true) {
							if (!aplyDailyWrkLmtFlag.isSelected()) {
								element_Click(aplyDailyWrkLmtFlag);
							}
						} else {
							if (aplyDailyWrkLmtFlag.isSelected()) {
								element_Click(aplyDailyWrkLmtFlag);
							}
						}
					}
					if (data.get("WklyTgtAsPer") != null) { // here this is used for both weekly and monthly
						element_DropDownSelectByvisibleText(wklyTgtAsPerDD, data.get("WklyTgtAsPer"));
					}
					if (data.get("TgtHrs") != null) {
						if (dropDownSelectedValue(wklyTgtAsPerDD).equalsIgnoreCase("Fixed Limit")) {
							String tgtHrsVal1 = data.get("TgtHrs").substring(0, 3);
							String tgtHrsVal2 = data.get("TgtHrs").substring(data.get("TgtHrs").length() - 2);
							element_Clear(tgtHrs1);
							element_InputTextUsingActionClass(tgtHrs1, tgtHrsVal1);
							element_TextBoxToClickOnTab(tgtHrs1);
							element_Clear(tgtHrs2);
							element_InputTextUsingActionClass(tgtHrs2, tgtHrsVal2);
							element_TextBoxToClickOnTab(tgtHrs2);
						}
					}
					if (data.get("TgtDailyHrs") != null) {
						if (dropDownSelectedValue(wklyTgtAsPerDD).equalsIgnoreCase("Days In A Week")) {
							element_Clear(tgtDailyHrsTxt);
							element_inputTextUsingActionClassCharacterOneByOne(tgtDailyHrsTxt, data.get("TgtDailyHrs"));
						}
					}
					if (data.get("GraceHrs") != null) {
						boolean graceHrs= Boolean.parseBoolean(data.get("GraceHrs"));
						if (graceHrs == true) {
							if (!graceHrsFlag.isSelected()) {
								element_Click(graceHrsFlag);
							}
						} else {
							if (graceHrsFlag.isSelected()) {
								element_Click(graceHrsFlag);
							}
						}
					}
				}
			}
			// Deduct Hours From Target
			if (data.get("DeductHrsFrTgtLV") != null) {
				if (!flagDeductHrsFrTgtLV.isSelected()) {
					element_Click(flagDeductHrsFrTgtLV);
				}
				element_Clear(txtDeductHrsFrTgtLV);
				element_inputTextUsingActionClassCharacterOneByOne(txtDeductHrsFrTgtLV, data.get("DeductHrsFrTgtLV"));
			}
			if (data.get("DeductHrsFrTgtWO") != null) {
				if (!flagDeductHrsFrTgtWO.isSelected()) {
					element_Click(flagDeductHrsFrTgtWO);
				}
				element_Clear(txtDeductHrsFrTgtWO);
				element_inputTextUsingActionClassCharacterOneByOne(txtDeductHrsFrTgtWO, data.get("DeductHrsFrTgtWO"));
			}
			if (data.get("DeductHrsFrTgtPH") != null) {
				if (!flagDeductHrsFrTgtPH.isSelected()) {
					element_Click(flagDeductHrsFrTgtPH);
				}
				element_Clear(txtDeductHrsFrTgtPH);
				element_inputTextUsingActionClassCharacterOneByOne(txtDeductHrsFrTgtPH, data.get("DeductHrsFrTgtPH"));
			}
			if (data.get("DeductHrsFrTgtFbRd") != null) {
				if (!flagDeductHrsFrTgtFbRd.isSelected()) {
					element_Click(flagDeductHrsFrTgtFbRd);
				}
				element_Clear(txtDeductHrsFrTgtFbRd);
				element_inputTextUsingActionClassCharacterOneByOne(txtDeductHrsFrTgtFbRd, data.get("DeductHrsFrTgtFbRd"));
			}
			if (data.get("DeductHrsFrTgtNA") != null) {
				if (!flagDeductHrsFrTgtNA.isSelected()) {
					element_Click(flagDeductHrsFrTgtNA);
				}
				element_Clear(txtDeductHrsFrTgtNA);
				element_inputTextUsingActionClassCharacterOneByOne(txtDeductHrsFrTgtNA, data.get("DeductHrsFrTgtNA"));
			}
			// Shortfall Hours Deduction
			if (data.get("ShrtfallHrsDeductFullDayHrs") != null) {
				element_Clear(shrtfallHrsDeductFullDayHrsTxt);
				element_inputTextUsingActionClassCharacterOneByOne(shrtfallHrsDeductFullDayHrsTxt, splitWithColan(data.get("ShrtfallHrsDeductFullDayHrs")) );
			}
			// Consider Work Hours
			if (data.get("ConsWrkHrsAbInFlg") != null) {
				boolean consWrkHrsAbInFlg= Boolean.parseBoolean(data.get("ConsWrkHrsAbInFlg"));
				if (consWrkHrsAbInFlg == true) {
					if (!consWrkHrsAbInFlag.isSelected()) {
						element_Click(consWrkHrsAbInFlag);
					}
				} else {
					if (consWrkHrsAbInFlag.isSelected()) {
						element_Click(consWrkHrsAbInFlag);
					}
				}
			}
			if (data.get("ConsWrkHrsAbInHrs") != null) {
				element_Clear(consWrkHrsAbInHrsTxt);
				element_inputTextUsingActionClassCharacterOneByOne(consWrkHrsAbInHrsTxt, data.get("ConsWrkHrsAbInHrs"));
			}
			if (data.get("ConsWrkHrsLvFlg") != null) {
				boolean consWrkHrsLvFlg= Boolean.parseBoolean(data.get("ConsWrkHrsLvFlg"));
				if (consWrkHrsLvFlg == true) {
					if (!consWrkHrsLvFlag.isSelected()) {
						element_Click(consWrkHrsLvFlag);
					}
				} else {
					if (consWrkHrsLvFlag.isSelected()) {
						element_Click(consWrkHrsLvFlag);
					}
				}
			}
			if (data.get("ConsWrkHrsLvHrs") != null) {
				element_Clear(consWrkHrsLvHrsTxt);
				element_inputTextUsingActionClassCharacterOneByOne(consWrkHrsLvHrsTxt, data.get("ConsWrkHrsLvHrs"));
			}
			if (data.get("ConsWrkHrsWoFlg") != null) {
				boolean consWrkHrsWoFlg= Boolean.parseBoolean(data.get("ConsWrkHrsWoFlg"));
				if (consWrkHrsWoFlg == true) {
					if (!consWrkHrsWoFlag.isSelected()) {
						element_Click(consWrkHrsWoFlag);
					}
				} else {
					if (consWrkHrsWoFlag.isSelected()) {
						element_Click(consWrkHrsWoFlag);
					}
				}
			}
			if (data.get("ConsWrkHrsWoHrs") != null) {
				element_Clear(consWrkHrsWoHrsTxt);
				element_inputTextUsingActionClassCharacterOneByOne(consWrkHrsWoHrsTxt, data.get("ConsWrkHrsWoHrs"));
			}
			if (data.get("ConsWrkHrsPhFlg") != null) {
				boolean consWrkHrsPhFlg= Boolean.parseBoolean(data.get("ConsWrkHrsPhFlg"));
				if (consWrkHrsPhFlg == true) {
					if (!consWrkHrsPhFlag.isSelected()) {
						element_Click(consWrkHrsPhFlag);
					}
				} else {
					if (consWrkHrsPhFlag.isSelected()) {
						element_Click(consWrkHrsPhFlag);
					}
				}
			}
			if (data.get("ConsWrkHrsPhHrs") != null) {
				element_Clear(consWrkHrsPhHrsTxt);
				element_inputTextUsingActionClassCharacterOneByOne(consWrkHrsPhHrsTxt, data.get("ConsWrkHrsPhHrs"));
			}
			if (data.get("ConsWrkHrsFbRdFlg") != null) {
				boolean consWrkHrsFbRdFlg= Boolean.parseBoolean(data.get("ConsWrkHrsFbRdFlg"));
				if (consWrkHrsFbRdFlg == true) {
					if (!consWrkHrsFbRdFlag.isSelected()) {
						element_Click(consWrkHrsFbRdFlag);
					}
				} else {
					if (consWrkHrsFbRdFlag.isSelected()) {
						element_Click(consWrkHrsFbRdFlag);
					}
				}
			}
			if (data.get("ConsWrkHrsFbRdHrs") != null) {
				element_Clear(consWrkHrsFbRdHrsTxt);
				element_inputTextUsingActionClassCharacterOneByOne(consWrkHrsFbRdHrsTxt, data.get("ConsWrkHrsFbRdHrs"));
			}
			//Absent Marking Mode
			if (data.get("FlxAbRuleMarkAbFor") != null) {
				element_DropDownSelectByvisibleText(flxAbRuleMarkAbForDD, data.get("FlxAbRuleMarkAbFor"));
			}
			if (data.get("GrcForShrtfallHrs") != null) {
				if (dropDownSelectedValue(flxAbRuleMarkAbForDD).equalsIgnoreCase("Custom Shortfall Hours")) {
					String grcForShrtfallHrsVal1 = data.get("GrcForShrtfallHrs").substring(0, 3);
					String grcForShrtfallHrsVal2 = data.get("GrcForShrtfallHrs").substring(data.get("GrcForShrtfallHrs").length() - 2);
					element_Clear(grcForShrtfallHrs1);
					element_InputTextUsingActionClass(grcForShrtfallHrs1, grcForShrtfallHrsVal1);
					element_Clear(grcForShrtfallHrs2);
					element_InputTextUsingActionClass(grcForShrtfallHrs2, grcForShrtfallHrsVal2);
				}
			}
			if (data.get("FlxAbRuleMarkHalfAbForEvry") != null) {
				if (dropDownSelectedValue(flxAbRuleMarkAbForDD).equalsIgnoreCase("Custom Shortfall Hours")) {
					element_Clear(flxAbRuleMarkHalfAbForEvryTxt);
					element_inputTextUsingActionClassCharacterOneByOne(flxAbRuleMarkHalfAbForEvryTxt, data.get("FlxAbRuleMarkHalfAbForEvry"));
				}
			}
			
			
		}
		// **************************************************************
		// *********** Attendance Correction- Short Leave/Official Hours Application Restrictions Panel*************************************
		// **************************************************************
		if(data.get("AtdCorrSLvOffRestApplyTo") != null || data.get("AtdCorrSLvOffRestMinDays") != null || data.get("AtdCorrSLvOffRestMaxDays") != null || data.get("AtdCorrSLvOffRestSpecPeriod") != null || data.get("AtdCorrSLvOffRestType") != null || data.get("AtdCorrSLvOffRestPeriod") != null || data.get("AtdCorrSLvOffRestPeriodCnt") != null) {
			if (AtdCorrSlvOffRestPanelOpenOrNot.size() > 0) {
				element_Click(AtdCorrSlvOffRestPanel);
			}
			if (data.get("AtdCorrSLvOffRestApplyTo") != null ) {
				element_DropDownSelectByvisibleText(atdCorrSLvOffRestApplyToDD, data.get("AtdCorrSLvOffRestApplyTo"));
			}
			if (data.get("AtdCorrSLvOffRestMinDays") != null) {
				element_Clear(atdCorrSLvOffRestMinDaysTxt);
				element_InputTextUsingActionClass(atdCorrSLvOffRestMinDaysTxt, data.get("AtdCorrSLvOffRestMinDays"));
			}
			if (data.get("AtdCorrSLvOffRestMaxDays") != null) {
				element_Clear(atdCorrSLvOffRestMaxDaysTxt);
				element_InputTextUsingActionClass(atdCorrSLvOffRestMaxDaysTxt, data.get("AtdCorrSLvOffRestMaxDays"));
			}
			if (data.get("AtdCorrSLvOffRestSpecPeriod") != null) {
				Boolean atdCorrSLvOffRestSpecPeriod = Boolean.parseBoolean(data.get("AtdCorrSLvOffRestSpecPeriod"));
				if (atdCorrSLvOffRestSpecPeriod == true) {
					if (!atdCorrSLvOffRestSpecPeriodFlag.isSelected()) {
						element_Click(atdCorrSLvOffRestSpecPeriodFlag);
					}
				} else {
					if (atdCorrSLvOffRestSpecPeriodFlag.isSelected()) {
						element_Click(atdCorrSLvOffRestSpecPeriodFlag);
					}
				}
			}
			if (data.get("AtdCorrSLvOffRestType") != null) {
				if (atdCorrSLvOffRestSpecPeriodFlag.isSelected()) {
					element_DropDownSelectByvisibleText(atdCorrSLvOffRestTypeDD, data.get("AtdCorrSLvOffRestType"));
				}
			}
			if (data.get("AtdCorrSLvOffRestPeriod") != null) {
				if (atdCorrSLvOffRestSpecPeriodFlag.isSelected()) {
					if (data.get("AtdCorrSLvOffRestType").equalsIgnoreCase("Restrict w.r.t Joining Date")) {
						element_DropDownSelectByvisibleText(atdCorrSLvOffRestPeriodDD, data.get("AtdCorrSLvOffRestPeriod"));
					}
				}
			}
			if (data.get("AtdCorrSLvOffRestPeriodCnt") != null) {
				if (atdCorrSLvOffRestSpecPeriodFlag.isSelected()) {
					if (data.get("AtdCorrSLvOffRestType").equalsIgnoreCase("Restrict w.r.t Joining Date")) {
						element_Clear(atdCorrSLvOffRestPeriodCntTxt);
						element_InputTextUsingActionClass(atdCorrSLvOffRestPeriodCntTxt, data.get("AtdCorrSLvOffRestPeriodCnt"));
					}
				}
			}
		}
		///////////
		saveButtonClick();
		waitForElementVisible(valMsg);
		msg = element_GetText(valMsg);
		Assert.assertEquals(msg, "Saved Successfully");
	}
	
	
	// Mayank
	public void rangeBasedShortLeaveConfig(String atdPlcName, List<Map<String, String>> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		if (element_isEnabled(searchBox)) {
			element_InputTextUsingActionClass(searchBox, atdPlcName);
			element_Click(searchButton);
			// element_TextBoxToClickOnEnter(searchBox);
			ArrayList<String> ar = new ArrayList<>();
			if (atdPlcNames.size() > 0) {
				for (int j = 0; j < atdPlcNames.size(); j++) {
					String plcname1 = atdPlcNames.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(atdPlcName)) {
						logger.debug("Attendance Plc found, Name = "+atdPlcName);
						atdPlcNames.get(j).click();
						Thread.sleep(1000);
						if (shrtLvOffHrsRestPanelOpenOrNot.size() > 0) {
							element_Click(shortLeaveOfficialHoursRestrictionsPanel);
						}
						Thread.sleep(1000);
						if (element_isSelected(shrtLvChkInAtdPerFlag) && element_isSelected(durChkPerShrtLvEntryFlag)) {
							if (!element_isSelected(rangeBasesShrtLvFlag)) {
								element_Click(rangeBasesShrtLvFlag);
							}
							logger.debug("Already config rows deletion started");
							// Delete already configured grid components for newly updated configuration if any
							while (rangeShrtLvgridDeleteBtns.size() != 0) {
								element_Click(rangeShrtLvgridDeleteBtn);
								driver.switchTo().alert().accept();
								Thread.sleep(1000);
							}
							// Add components in grid
							logger.debug("Range Based Short Leave rows configuration started");
							for (int i = 0; i < data.size(); i++) {
								String rangeFrom = data.get(i).get("RangeFrom");
								String rangeTo = data.get(i).get("RangeTo");
								String deduction = data.get(i).get("Deduction");
								logger.debug("Range From = "+rangeFrom+" , Range To = "+rangeTo+" & Deduction = "+deduction);
								element_Click(rangeShrtLvGridAddBtn);
								Thread.sleep(1000);
								if (rangeFrom != null) {
									element_Clear(rangeShrtLvRangeFrom);
									element_InputTextUsingActionClass(rangeShrtLvRangeFrom, rangeFrom);
								}
								if (rangeTo != null) {
									element_Clear(rangeShrtLvRangeTo);
									element_InputTextUsingActionClass(rangeShrtLvRangeTo, rangeTo);
								}
								if (deduction != null) {
									element_Clear(rangeShrtLvDeduction);
									element_InputTextUsingActionClass(rangeShrtLvDeduction, deduction);
								}
								Thread.sleep(1000);
								element_Click(gridSaveBtn);
								Thread.sleep(1000);
							}
							Thread.sleep(1000);
							saveButtonClick();
							val= validationMessage();
						} else {
							val = "Range based short leave flag is uneditable";
							logger.debug("Range based short leave flag is uneditable");
						}
						Thread.sleep(1000);
						break;
					}
				}
			}
			if (!ar.contains(atdPlcName)) {
				Thread.sleep(1000);
				val = "Defined Policy doesn't exist";
				logger.debug("Defined Policy doesn't exist");
			}
		}
		Assert.assertEquals(val, "Saved Successfully");
	}
	
	
}
