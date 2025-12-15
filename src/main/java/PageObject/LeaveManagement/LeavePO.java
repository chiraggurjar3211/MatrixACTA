package PageObject.LeaveManagement;

import java.util.ArrayList;
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

public class LeavePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(LeavePO.class);

	public LeavePO(WebDriver driver) {

		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> lvids;

	@FindBy(id = "LeaveID")
	private WebElement leaveID;

	@FindBy(id = "LeaveName")
	private WebElement leaveName;

	@FindBy(id = "cbolvType")
	private WebElement leaveType;

	@FindBy(id = "txtMinlv")
	private WebElement minimumAllowedAtATime;

	@FindBy(id = "txtMaxlv")
	private WebElement maximumAllowedLimit;

	@FindBy(id = "cboMaxlvfor")
	private WebElement maximumAllowedLimitFor;

	@FindBy(id = "txtMinlv1")
	private WebElement minAlwDurTxt;

	@FindBy(id = "txtMaxlv1")
	private WebElement MaxAlwDurPerApp;

	@FindBy(id = "txtMaxLvPerDay")
	private WebElement maxAlwDurPerDay;

	// Chhaya
	@FindBy(xpath = "//*[@class='anchorclick']//*[@default='Optional Restrictions']")
	private List<WebElement> optRestriCollaps;

	@FindBy(xpath = "//*[@default='Optional Restrictions']")
	private WebElement optRestriCollapsClick;

	@FindBy(id = "cboMedicalCerty")
	private WebElement mediCertReqDrop;

	@FindBy(id = "txtMedCertLv")
	private WebElement minLvForCertCompTxt;

	@FindBy(id = "txtMedCertLv1_1")
	private WebElement minDurHHHTxt;

	@FindBy(id = "txtMedCertLv1_2")
	private WebElement minDurMMTxt;

	@FindBy(id = "chkAddWorkHour")
	private WebElement addLvHrsInWrkHrsXpath;

	@FindBy(xpath = "//*[@class='anchorclick']//*[@key='cpLeaveClubRule']")
	private List<WebElement> lvClubRuleCollaps;

	@FindBy(xpath = "//*[@key='cpLeaveClubRule']")
	private WebElement lvClubRuleCollapsClick;

	@FindBy(id = "chkALWFlg")
	private WebElement alwWithOtherLvChk;

	@FindBy(xpath = "//*[@class='anchorclick']//*[@default='Leave Balance Check']")
	private List<WebElement> leaveBalCollaps;

	@FindBy(xpath = "//*[@default='Leave Balance Check']")
	private WebElement leaveBalCollapsClick;

	@FindBy(id = "chkBALCF")
	private WebElement carryFrdToNxtYrCheckbox;

	@FindBy(id = "chkMAXACCMChk")
	private WebElement maxAccumCheckXpath;

	@FindBy(id = "txtMAXACCMBAL")
	private WebElement maxBalAlwXpath;

	@FindBy(id = "txtMAXACCMBAL1_1")
	private WebElement maxHHAlwXpath1;

	@FindBy(id = "txtMAXACCMBAL1_2")
	private WebElement maxMMAlwXpath2;

	@FindBy(id = "chkALWENC")
	private WebElement leaveEnchashChk;

	@FindBy(xpath = "//*[@class='anchorclick']//*[@default='Week-Off/Holiday Club-Cover Rule']")
	private List<WebElement> weekOffHldCollaps;

	@FindBy(xpath = "//*[@default='Week-Off/Holiday Club-Cover Rule']")
	private WebElement weekOffHldCollapsClick;

	@FindBy(id = "chkWOClub")
	private WebElement alwSinglSidLvWOChk;

	@FindBy(id = "chkWOCover")
	private WebElement alwBothSidLvWOChk;

	@FindBy(id = "chkPHClub")
	private WebElement alwSinglSidLvHldChk;

	@FindBy(id = "chkPHCover")
	private WebElement alwBothSidLvHldChk;

	@FindBy(id = "chkAtFullDayClubCover")
	private WebElement atLstFullDayClubCoverWOChk;

	@FindBy(id = "chkWOminCheck")
	private WebElement chkWOminCheck;

	@FindBy(id = "txtWOminlimit")
	private WebElement txtWOminlimit;

	@FindBy(id = "chkPhAtFullDayClubCover")
	private WebElement atLstFullDayClubCoverPHChk;

	@FindBy(id = "chkPHmincheck")
	private WebElement chkPHmincheck;

	@FindBy(id = "txtPHminlimit")
	private WebElement txtPHminlimit;

	@FindBy(id = "mdadd")
	private WebElement popUPADDButton;

	@FindBy(id = "mdadd")
	private List<WebElement> popUPADDButtonSize;

	@FindBy(xpath = "//*[@id='collapseTwo']//label[@class='checkbox-label checkbox-inline']/label")
	private List<WebElement> leavesWhCanNtClubCheckboxes;

	@FindBy(xpath = "//*[@class='anchorclick']//*[@key='cpLeaveAppRestriction']")
	private List<WebElement> leaveAppResCollaps;

	@FindBy(xpath = "//*[@key='cpLeaveAppRestriction']")
	private WebElement leaveAppResCollapsClick;

	@FindBy(id = "chkADVLeave")
	private WebElement appAlwB4LvCheckbox;

	@FindBy(id = "txtADVLeaveDays")
	private WebElement minDaysB4LvStartDtTxt;

	@FindBy(id = "txtADVLeaveDays")
	private List<WebElement> minDaysB4LvStartDtTxtSize;

	@FindBy(id = "chkPostLeave")
	private WebElement appAlwAftrLvCheckbox;

	@FindBy(id = "txtPostLeaveDays")
	private WebElement maxDaysAftrLvEndDtTxt;

	@FindBy(id = "chkRAWSP")
	private WebElement resAppWthnSpecPrdCheckbox;

	@FindBy(id = "CboRestType")
	private WebElement resTypeDropdown;

	@FindBy(id = "cboPeriod")
	private WebElement resPrdDropdown;

	@FindBy(id = "txtDays")
	private WebElement resPrdDayOrMonthTxt;

	@FindBy(id = "cboAdvDayOrHour")
	private WebElement minDurB4LvStartDtDrop;

	@FindBy(id = "cboAdvDayOrHour")
	private List<WebElement> minDurB4LvStartDtDropSize;

	@FindBy(id = "txtADVLeaveDays1")
	private WebElement minDurB4LvStartDtTxt;

	@FindBy(id = "txtADVLeaveDays2_1")
	private WebElement minDurB4LvStartHHTxt;

	@FindBy(id = "txtADVLeaveDays2_2")
	private WebElement minDurB4LvStartMMTxt;

	@FindBy(id = "cboPostDayOrHour")
	private WebElement maxDurAftrLvEndDtDrop;

	@FindBy(id = "cboPostDayOrHour")
	private List<WebElement> maxDurAftrLvEndDtDropSize;

	@FindBy(id = "txtPostLeaveDays1")
	private WebElement maxDurAftrLvEndDtTxt;

	@FindBy(id = "txtPostLeaveDays2_1")
	private WebElement maxDurAftrLvEndHHTxt;

	@FindBy(id = "txtPostLeaveDays2_2")
	private WebElement maxDurAftrLvEndMMTxt;

	@FindBy(id = "cboClubWOPH")
	private WebElement checkClbAcrossDD;

	@FindBy(xpath = "//*[text()='Maximum Accumulation Check']")
	private WebElement mxACuCheckLabel;

	///////////////////////////////////////

	public String createLeave(String lvID, String lvName, String lvType, String txtMinlv, String txtMaxlv,
			String Maxlvfor, String minAlwDur, String txtMaxlv1, String txtMaxLvPerDay, String maxAccumCheck,
			String maxBalAlw, String maxHHAlw, String maxMMAlw, String lvEncash, String mediCertReq,
			String minLvForCertComp, String minDurHHH, String minDurMM, String adLvHrsInWrkHrs, String alwWithOthrLv,
			String woAlwSinglSidLv, String woAlwBothSidLv, String hldAlwSinglSidLv, String hldAlwBothSidLv,
			String carryFrdToNxtYr, String woAtlstFullDayLvForClbCvr, String woEnblMinLmtChk, String minLmtAroundWO,
			String hldAtlstFullDayLvForClbCvr, String hldEnblMinLmtChk, String minLmtAroundHld, String appAlwB4Lv,
			String minDaysB4LvStartDt, String appAlwAftrLv, String maxDaysAftrLvEndDt, String resAppWthnSpecPrd,
			String resType, String resPrd, String resPrdDayOrMonth, String minDurB4LvStartDt,
			String minDurB4LvStartDtDays, String minDurB4LvStartDtHrs, String maxDurAftrLvEndDt,
			String maxDurAftrLvEndDtDays, String maxDurAftrLvEndDtHrs, String chkClbAcross)
			throws InterruptedException {
//		pageLoadWaitng();
		waitForElementVisible(leaveID);
		String val = null;
		element_InputTextUsingActionClass(leaveID, lvID);
		element_TextBoxToClickOnTab(leaveID);
		if (popUPADDButtonSize.size() > 0) {
			element_Click(popUPADDButton);
			// -Mayank
//			element_InputText(leaveName, lvName);
//			element_Clear(leaveName);
			waitForElementVisible(leaveType);
			element_Click(leaveName);
			if (leaveType.isEnabled()) {
				element_DropDownSelectByvisibleText(leaveType, lvType);
			}
			element_InputTextUsingActionClass(leaveName, lvName);
			element_TextBoxToClickOnTab(leaveName);
			if (lvType.equalsIgnoreCase("Paid Leave") || lvType.equalsIgnoreCase("Lay off")
					|| lvType.equalsIgnoreCase("Unpaid") || lvType.equalsIgnoreCase("Restricted Holiday")
					|| lvType.equalsIgnoreCase("Compensatory Off")) {
				if (txtMinlv != null) {
					element_Clear(minimumAllowedAtATime);
					element_InputTextUsingActionClass(minimumAllowedAtATime, txtMinlv);
					element_TextBoxToClickOnTab(minimumAllowedAtATime);
				}
				if (txtMaxlv != null) {
					element_Clear(maximumAllowedLimit);
					element_InputTextUsingActionClass(maximumAllowedLimit, txtMaxlv);
					element_TextBoxToClickOnTab(maximumAllowedLimit);
				}
				if (Maxlvfor != null) {
					element_DropDownSelectByvisibleText(maximumAllowedLimitFor, Maxlvfor);
				}
			} else if (lvType.equalsIgnoreCase("Hourly Paid Leave") || lvType.equalsIgnoreCase("Hourly Unpaid Leave")) {
				if (minAlwDur != null) { // by Chhaya
					String convertedTime1 = staticTimeOrPlusMinusHoursFromCurrentTime(minAlwDur);
					element_Clear(minAlwDurTxt);
					element_inputTextUsingActionClassCharacterOneByOne(minAlwDurTxt, convertedTime1);
					element_TextBoxToClickOnTab(minAlwDurTxt);
				}
				if (txtMaxlv1 != null) {
					String convertedTime2 = staticTimeOrPlusMinusHoursFromCurrentTime(txtMaxlv1);
					element_Clear(MaxAlwDurPerApp);
					element_inputTextUsingActionClassCharacterOneByOne(MaxAlwDurPerApp, convertedTime2);
					element_TextBoxToClickOnTab(MaxAlwDurPerApp);
				}
				if (txtMaxLvPerDay != null) {
					String convertedTime3 = staticTimeOrPlusMinusHoursFromCurrentTime(txtMaxLvPerDay);
					element_Clear(maxAlwDurPerDay);
					element_inputTextUsingActionClassCharacterOneByOne(maxAlwDurPerDay, convertedTime3);
					element_TextBoxToClickOnEnter(maxAlwDurPerDay);
				}
			}
			// Chhaya
			////////// Optional Restrictions Parameters//////////////
			if (mediCertReq != null || minLvForCertComp != null || minLvForCertComp != null || minDurHHH != null
					|| minDurMM != null || adLvHrsInWrkHrs != null) {
				if (optRestriCollaps.size() == 0) {
					element_Click(optRestriCollapsClick);
				}
				if (mediCertReq != null) {
					element_DropDownSelectByvisibleText(mediCertReqDrop, mediCertReq);
				}
				if (minLvForCertComp != null) {
					element_Clear(minLvForCertCompTxt);
					element_InputTextUsingActionClass(minLvForCertCompTxt, minLvForCertComp);
				}
				if (minDurHHH != null) {
					element_Clear(minDurHHHTxt);
					element_InputTextUsingActionClass(minDurHHHTxt, minDurHHH);
				}
				if (minDurMM != null) {
					element_Clear(minDurMMTxt);
					element_InputTextUsingActionClass(minDurMMTxt, minDurMM);
				}
				if (adLvHrsInWrkHrs != null) {
					boolean adLvHrsInWrkHrs1 = Boolean.parseBoolean(adLvHrsInWrkHrs);
					if (adLvHrsInWrkHrs1 == true) {
						if (element_isSelected(addLvHrsInWrkHrsXpath) != true) {
							element_Click(addLvHrsInWrkHrsXpath);
						}
					} else {
						if (element_isSelected(addLvHrsInWrkHrsXpath) == true) {
							element_Click(addLvHrsInWrkHrsXpath);
						}
					}
				}
			}
			//////////////////////////

			////////// Leave Club Rule Parameters//////////////
			if (alwWithOthrLv != null || chkClbAcross != null) {
				if (lvClubRuleCollaps.size() == 0) {
					element_Click(lvClubRuleCollapsClick);
				}
				if (alwWithOthrLv != null) {
					boolean alwWithOthrLv1 = Boolean.parseBoolean(alwWithOthrLv);
					if (alwWithOthrLv1 == true) {
						if (element_isSelected(alwWithOtherLvChk) != true) {
							element_Click(alwWithOtherLvChk);
						}
					} else {
						if (element_isSelected(alwWithOtherLvChk) == true) {
							element_Click(alwWithOtherLvChk);
						}
					}
				}

				if (chkClbAcross != null) {
					element_DropDownSelectByvisibleText(checkClbAcrossDD, chkClbAcross);
				}
			}
			/////////////////////////////////////

			////////// Leave Application Restrictions Parameters//////////////
			if (appAlwB4Lv != null || minDaysB4LvStartDt != null || appAlwAftrLv != null || maxDaysAftrLvEndDt != null
					|| resAppWthnSpecPrd != null || resType != null || resPrd != null || resPrdDayOrMonth != null
					|| minDurB4LvStartDt != null || minDurB4LvStartDtDays != null || minDurB4LvStartDtHrs != null
					|| maxDurAftrLvEndDt != null || maxDurAftrLvEndDtDays != null || maxDurAftrLvEndDtHrs != null) {
				if (leaveAppResCollaps.size() == 0) {
					element_Click(leaveAppResCollapsClick);
				}
				if (appAlwB4Lv != null) {
					boolean appAlwB4Lv1 = Boolean.parseBoolean(appAlwB4Lv);
					if (appAlwB4Lv1 == true) {
						if (element_isSelected(appAlwB4LvCheckbox) != true) {
							element_Click(appAlwB4LvCheckbox);
						}
					} else {
						if (element_isSelected(appAlwB4LvCheckbox) == true) {
							element_Click(appAlwB4LvCheckbox);
						}
					}
					Thread.sleep(500);
				}
				if (minDaysB4LvStartDt != null) {
					if (minDaysB4LvStartDtTxtSize.size() > 0) {
						element_InputTextUsingActionClass(minDaysB4LvStartDtTxt, minDaysB4LvStartDt);
						element_TextBoxToClickOnTab(minDaysB4LvStartDtTxt);
					}
				}
				if (minDurB4LvStartDt != null) {
					if (minDurB4LvStartDtDropSize.size() > 0) {
						element_DropDownSelectByvisibleText(minDurB4LvStartDtDrop, minDurB4LvStartDt);
						if (minDurB4LvStartDt.equalsIgnoreCase("Days") && minDurB4LvStartDtDays != null) {
							element_InputTextUsingActionClass(minDurB4LvStartDtTxt, minDurB4LvStartDtDays);
							element_TextBoxToClickOnTab(minDurB4LvStartDtTxt);
						}
						if (minDurB4LvStartDt.equalsIgnoreCase("Hours") && minDurB4LvStartDtHrs != null) {
							String[] minDurB4LvStartDtHrsAr = minDurB4LvStartDtHrs.split(":");
							System.out.println("minDurB4LvStartDtHrsAr = " + minDurB4LvStartDtHrsAr[0]);
							System.out.println("minDurB4LvStartDtHrsAr = " + minDurB4LvStartDtHrsAr[1]);
							element_InputTextUsingActionClass(minDurB4LvStartHHTxt, minDurB4LvStartDtHrsAr[0]);
							element_InputTextUsingActionClass(minDurB4LvStartMMTxt, minDurB4LvStartDtHrsAr[1]);
							element_TextBoxToClickOnTab(minDurB4LvStartMMTxt);
						}
					}
				}
				if (appAlwAftrLv != null) {
					boolean appAlwAftrLv1 = Boolean.parseBoolean(appAlwAftrLv);
					if (appAlwAftrLv1 == true) {
						if (element_isSelected(appAlwAftrLvCheckbox) != true) {
							element_Click(appAlwAftrLvCheckbox);
						}
					} else {
						if (element_isSelected(appAlwAftrLvCheckbox) == true) {
							element_Click(appAlwAftrLvCheckbox);
						}
					}
				}
				if (maxDaysAftrLvEndDt != null) {
					element_Clear(maxDaysAftrLvEndDtTxt);
					element_InputTextUsingActionClass(maxDaysAftrLvEndDtTxt, maxDaysAftrLvEndDt);
					element_TextBoxToClickOnTab(maxDaysAftrLvEndDtTxt);
				}
				if (maxDurAftrLvEndDt != null) {
					if (maxDurAftrLvEndDtDropSize.size() > 0) {
						element_DropDownSelectByvisibleText(maxDurAftrLvEndDtDrop, maxDurAftrLvEndDt);
						if (maxDurAftrLvEndDt.equalsIgnoreCase("Days") && maxDurAftrLvEndDtDays != null) {
							element_InputTextUsingActionClass(maxDurAftrLvEndDtTxt, maxDurAftrLvEndDtDays);
							element_TextBoxToClickOnTab(maxDurAftrLvEndDtTxt);
						}
						if (maxDurAftrLvEndDt.equalsIgnoreCase("Hours") && maxDurAftrLvEndDtHrs != null) {
							String[] maxDurAftrLvEndDtHrsAr = maxDurAftrLvEndDtHrs.split(":");
							element_InputTextUsingActionClass(maxDurAftrLvEndHHTxt, maxDurAftrLvEndDtHrsAr[0]);
							element_InputTextUsingActionClass(maxDurAftrLvEndMMTxt, maxDurAftrLvEndDtHrsAr[1]);
							element_TextBoxToClickOnTab(maxDurAftrLvEndMMTxt);
						}
					}
				}
				if (resAppWthnSpecPrd != null) {
					boolean resAppWthnSpecPrd1 = Boolean.parseBoolean(resAppWthnSpecPrd);
					if (resAppWthnSpecPrd1 == true) {
						if (element_isSelected(resAppWthnSpecPrdCheckbox) != true) {
							element_Click(resAppWthnSpecPrdCheckbox);
						}
					} else {
						if (element_isSelected(resAppWthnSpecPrdCheckbox) == true) {
							element_Click(resAppWthnSpecPrdCheckbox);
						}
					}
				}
				if (resType != null) {
					element_DropDownSelectByvisibleText(resTypeDropdown, resType);
				}
				if (resPrd != null) {
					element_DropDownSelectByvisibleText(resPrdDropdown, resPrd);
				}
				if (resPrdDayOrMonth != null) {
					element_Clear(resPrdDayOrMonthTxt);
					element_InputTextUsingActionClass(resPrdDayOrMonthTxt, resPrdDayOrMonth);
					element_TextBoxToClickOnTab(resPrdDayOrMonthTxt);
				}
			}

			////////////////////////////////////////////

			////////// Leave Balance Check Parameters//////////////
			if (carryFrdToNxtYr != null || maxAccumCheck != null || maxBalAlw != null || maxHHAlw != null
					|| maxMMAlw != null || lvEncash != null) {
				if (leaveBalCollaps.size() == 0) {
					element_Click(leaveBalCollapsClick);
				}
				if (carryFrdToNxtYr != null) {
					boolean carryFrdToNxtYr1 = Boolean.parseBoolean(carryFrdToNxtYr);
					if (carryFrdToNxtYr1 == true) {
						if (element_isSelected(carryFrdToNxtYrCheckbox) != true) {
							element_Click(carryFrdToNxtYrCheckbox);
						}
					} else {
						if (element_isSelected(carryFrdToNxtYrCheckbox) == true) {
							element_Click(carryFrdToNxtYrCheckbox);
						}
					}
				}
				if (maxAccumCheck != null) {
					boolean maxAccumCheck1 = Boolean.parseBoolean(maxAccumCheck);
					if (maxAccumCheck1 == true) {
						if (element_isSelected(maxAccumCheckXpath) != true) {
							element_ClickUsingJS(maxAccumCheckXpath);
							// element_Click(maxAccumCheckXpath);
						}
					} else {
						if (element_isSelected(maxAccumCheckXpath) == true) {
							element_ClickUsingJS(maxAccumCheckXpath);
							// element_Click(maxAccumCheckXpath);
						}
					}
				}
				if (maxBalAlw != null) {
					element_Clear(maxBalAlwXpath);
					// element_InputDataUsingJS(maxBalAlwXpath, maxBalAlw);
					element_inputTextUsingActionClassCharacterOneByOne(maxBalAlwXpath, maxBalAlw);
					element_TextBoxToClickOnTab(maxBalAlwXpath);
				}
				if (maxHHAlw != null) {
					element_Clear(maxHHAlwXpath1);
					element_InputTextUsingActionClass(maxHHAlwXpath1, maxHHAlw);
					// element_InputDataUsingJS(maxHHAlwXpath1, maxHHAlw);
					element_TextBoxToClickOnTab(maxHHAlwXpath1);
				}
				if (maxMMAlw != null) {
					element_Clear(maxMMAlwXpath2);
					// element_InputDataUsingJS(maxMMAlwXpath2, maxMMAlw);
					element_InputTextUsingActionClass(maxMMAlwXpath2, maxMMAlw);
					element_TextBoxToClickOnTab(maxMMAlwXpath2);
				}

				if (lvEncash != null) {
					element_Click(mxACuCheckLabel);
				
					boolean lvEncash1 = Boolean.parseBoolean(lvEncash);
					if (lvEncash1 == true) {
						if (element_isSelected(leaveEnchashChk) != true) {
							element_Click(leaveEnchashChk);
						}
					} else {
						if (element_isSelected(leaveEnchashChk) == true) {
							element_Click(leaveEnchashChk);
						}
					}
				}
			}
			////////////////////////////////////////////

			////////// Week-Off/Holiday Club-Cover Rule Parameters//////////////
			if (woAlwSinglSidLv != null || woAlwBothSidLv != null || hldAlwSinglSidLv != null || hldAlwBothSidLv != null
					|| woAtlstFullDayLvForClbCvr != null || woEnblMinLmtChk != null || minLmtAroundWO != null
					|| hldAtlstFullDayLvForClbCvr != null || hldEnblMinLmtChk != null || minLmtAroundHld != null) {
				if (weekOffHldCollaps.size() == 0) {
					element_Click(weekOffHldCollapsClick);
				}
				if (woAlwSinglSidLv != null) {
					boolean woSinglSidLv1 = Boolean.parseBoolean(woAlwSinglSidLv);
					if (woSinglSidLv1 == true) {
						if (element_isSelected(alwSinglSidLvWOChk) != true) {
							element_Click(alwSinglSidLvWOChk);
						}
					} else {
						if (element_isSelected(alwSinglSidLvWOChk) == true) {
							element_Click(alwSinglSidLvWOChk);
						}
					}
				}
				if (woAlwBothSidLv != null) {
					boolean woBothSidLv1 = Boolean.parseBoolean(woAlwBothSidLv);
					if (woBothSidLv1 == true) {
						if (element_isSelected(alwBothSidLvWOChk) != true) {
							element_Click(alwBothSidLvWOChk);
						}
					} else {
						if (element_isSelected(alwBothSidLvWOChk) == true) {
							element_Click(alwBothSidLvWOChk);
						}
					}
				}
				if (hldAlwSinglSidLv != null) {
					boolean hldSinglSidLv1 = Boolean.parseBoolean(hldAlwSinglSidLv);
					if (hldSinglSidLv1 == true) {
						if (element_isSelected(alwSinglSidLvHldChk) != true) {
							element_Click(alwSinglSidLvHldChk);
						}
					} else {
						if (element_isSelected(alwSinglSidLvHldChk) == true) {
							element_Click(alwSinglSidLvHldChk);
						}
					}
				}
				if (hldAlwBothSidLv != null) {
					boolean hldBothSidLv1 = Boolean.parseBoolean(hldAlwBothSidLv);
					if (hldBothSidLv1 == true) {
						if (element_isSelected(alwBothSidLvHldChk) != true) {
							element_Click(alwBothSidLvHldChk);
						}
					} else {
						if (element_isSelected(alwBothSidLvHldChk) == true) {
							element_Click(alwBothSidLvHldChk);
						}
					}
				}

				if (woAtlstFullDayLvForClbCvr != null) {
					boolean woAtlstFullDayLvForClbCvr1 = Boolean.parseBoolean(woAtlstFullDayLvForClbCvr);
					if (woAtlstFullDayLvForClbCvr1 == true) {
						if (element_isSelected(atLstFullDayClubCoverWOChk) != true) {
							element_Click(atLstFullDayClubCoverWOChk);
						}
					} else {
						if (element_isSelected(atLstFullDayClubCoverWOChk) == true) {
							element_Click(atLstFullDayClubCoverWOChk);
						}
					}
				}
				if (woEnblMinLmtChk != null) {
					boolean woEnblMinLmtChk1 = Boolean.parseBoolean(woEnblMinLmtChk);
					if (woEnblMinLmtChk1 == true) {
						if (element_isSelected(chkWOminCheck) != true) {
							element_Click(chkWOminCheck);
						}
					} else {
						if (element_isSelected(chkWOminCheck) == true) {
							element_Click(chkWOminCheck);
						}
					}
					if (minLmtAroundWO != null) {
						// element_Clear(txtWOminlimit);
						element_InputTextUsingActionClass(txtWOminlimit, minLmtAroundWO);
					}
				}
				if (hldAtlstFullDayLvForClbCvr != null) {
					boolean hldAtlstFullDayLvForClbCvr1 = Boolean.parseBoolean(hldAtlstFullDayLvForClbCvr);
					if (hldAtlstFullDayLvForClbCvr1 == true) {
						if (element_isSelected(atLstFullDayClubCoverPHChk) != true) {
							element_ClickUsingJS(atLstFullDayClubCoverPHChk); // because of scroll bar in UI element
																				// clicked using JS
						}
					} else {
						if (element_isSelected(atLstFullDayClubCoverPHChk) == true) {
							element_ClickUsingJS(atLstFullDayClubCoverPHChk);
						}
					}
				}
				if (hldEnblMinLmtChk != null) {
					boolean hldEnblMinLmtChk1 = Boolean.parseBoolean(hldEnblMinLmtChk);
					if (hldEnblMinLmtChk1 == true) {
						if (element_isSelected(chkPHmincheck) != true) {
							element_ClickUsingJS(chkPHmincheck);
						}
					} else {
						if (element_isSelected(chkPHmincheck) == true) {
							element_ClickUsingJS(chkPHmincheck);
						}
					}
					if (minLmtAroundHld != null) {
						// element_Clear(txtPHminlimit);
						element_InputDataUsingJS(txtPHminlimit, minLmtAroundHld);
					}
				}
			}
			//////////////////////////

			saveButtonClick();
			val = validationMessage();
		} else {
			String getLeaveIDName = leaveID.getAttribute("value");
			if (leaveID.isEnabled() == false) {
				if (getLeaveIDName.equalsIgnoreCase(lvID)) {
					val = "Saved Successfully";
				} else {
					val = getLeaveIDName;
					logger.debug("Leave ID displayed :" + getLeaveIDName);
				}
			} else {
				val = getLeaveIDName;
				logger.debug("Leave ID displayed :" + getLeaveIDName);
			}
		}
		reloadPageButtonClick();
		waitForElementVisible(leaveID);
		return val;
	}

	public void configLeaveWhCanNtClub(String leaveId, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(leaveID);
		element_Clear(leaveID);
		element_InputTextUsingActionClass(leaveID, leaveId);
		element_TextBoxToClickOnTab(leaveID);
		if (lvClubRuleCollaps.size() == 0) {
			element_Click(lvClubRuleCollapsClick);
		}
		if (!element_getInputControlValue(leaveName).isBlank() || !element_getInputControlValue(leaveName).isEmpty()) {
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("LeaveID: " + data.get("LeaveID") + " LeaveName: " + data.get("LeaveName"));
				String leaveName = data.get("LeaveName");
				String enable = data.get("Enable");
				for (int i = 0; i < leavesWhCanNtClubCheckboxes.size(); i++) {
					String getLeaveName = leavesWhCanNtClubCheckboxes.get(i).getText();
					if (getLeaveName.equalsIgnoreCase(leaveName)) {
						WebElement getCheckbox = leavesWhCanNtClubCheckboxes.get(i)
								.findElement(By.xpath("preceding::input[1]"));
						boolean enableChk = Boolean.parseBoolean(enable);
						if (enableChk == true) {
							if (element_isSelected(getCheckbox) != true) {
								element_Click(getCheckbox);
							}
						} else {
							if (element_isSelected(getCheckbox) == true) {
								element_Click(getCheckbox);
							}
						}
						break;
					}
				}
			}
			saveButtonClick();
			String valMsg = validationMessage();
			Assert.assertEquals(valMsg, "Saved Successfully");

		} else {
			logger.debug(leaveId + " Not Exist");
		}
	}
}
