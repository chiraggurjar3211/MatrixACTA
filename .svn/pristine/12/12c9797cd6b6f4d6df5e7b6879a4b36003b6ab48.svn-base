package PageObject.ShiftAndSchedule;

import java.awt.Window;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class ShiftConfigurationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(ShiftConfigurationPO.class);

	public ShiftConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "SFTID")
	private WebElement shiftIDTxt;

	@FindBy(id = "SFTName")
	private WebElement shiftName;

	@FindBy(id = "ShiftType")
	private WebElement shiftTypeDD;

	@FindBy(id = "SFTSTTime")
	private WebElement shiftStartTime;

	@FindBy(id = "SFTEDTime")
	private WebElement shiftEndTime;

	@FindBy(id = "MinWrkHrsHDay1")
	private WebElement shiftHalfDay;

	@FindBy(id = "MinWrkHrsFDay")
	private WebElement shiftFullDay;

	@FindBy(id = "mdcancel")
	private WebElement informationCancelButton;

	@FindBy(id = "mdcancel")
	private List<WebElement> checkeleInformationCancelButton;

	@FindBy(xpath = "//*[@class='table-responsive']//tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> shiftIds;

	// Break Details

	@FindBy(xpath = "//*[@default='Break Details']")
	private WebElement breakDetailsPanel;

	@FindBy(xpath = "//*[@id=\"accordion_master\"]/div[1]//*[@class=\"collapsed\"]")
	private List<WebElement> breakDetailsPanelOpenOrNot;

	@FindBy(id = "brksttime")
	private WebElement breakStartTime;

	@FindBy(id = "BRKEDTime")
	private WebElement breakEndTime;

	@FindBy(id = "BRKDeviation")
	private WebElement breakDeviationFlag;

	@FindBy(xpath = "//*[@class=\"cursor fa sftMstClass-1 fa-caret-down\"]")
	private List<WebElement> breakAdvanceDetailsPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(@class,\"cursor fa sftMstClass-1 fa-caret-\")]")
	private WebElement breakAdvanceDetailsPanel;

	@FindBy(id = "IncBrkLate")
	private WebElement addBreakLiInTotalLiFlag;

	@FindBy(id = "IncBrkEarly")
	private WebElement addBreakEoInTotalEoFlag;

	@FindBy(id = "chkDeductBrkDurationFrWrkHr")
	private WebElement deductTypeFor2PunchFlagEle;

	@FindBy(id = "BRKHrsDedTyp")
	private WebElement deductTypeFor2PunchValueDD;

	@FindBy(id = "BRKHrsDed4Pnch")
	private WebElement deductTypeFor2MorePunchFlagEle;

	@FindBy(id = "BRKHrsDed4PnchTyp")
	private WebElement deductTypeFor2MorePunchValueDD;

	// Grace Time Details

	@FindBy(xpath = "//*[@default='Grace Time Details']")
	private WebElement graceTimeDetailsPanel;

	@FindBy(xpath = "//*[@id=\"accordion_master\"]/div[2]//*[@class=\"collapsed\"]")
	private List<WebElement> graceTimeDetailsPanelOpenOrNot;

	@FindBy(id = "IncGraceWrkHrs")
	private WebElement includeGraceTimeInWorkingHoursFlag;

	@FindBy(id = "SFTInGrace")
	private WebElement graceTimeforShiftLateINTxt;

	@FindBy(id = "LateGraceInc")
	private WebElement overlapGraceTimeWithShiftLateINFlag;

	@FindBy(id = "SFTOutGrace")
	private WebElement graceTimeforShiftEarlyOUTTxt;

	@FindBy(id = "EarlyGraceInc")
	private WebElement overlapGraceTimeWithShiftEarlyOUTFlag;

	@FindBy(id = "BRKInGrace")
	private WebElement graceTimeforBreakLateINTxt;

	@FindBy(id = "BRKLateGraceInc")
	private WebElement overlapGraceTimeWithBreakLateINFlag;

	@FindBy(id = "BRKOutGrace")
	private WebElement graceTimeforBreakEarlyOUTTxt;

	@FindBy(id = "BRKEarlyGraceInc")
	private WebElement overlapGraceTimeWithBreakEarlyOUTFlag;

	// CSR-6744 -Mayank
	@FindBy(xpath = "//*[@class='modal-content']")
	private WebElement shiftaddPopupchk;

	@FindBy(xpath = "//*[@class=\"mx-input-theme label-bold\"]")
	private WebElement shiftaddPopupTxt;

	@FindBy(xpath = "//*[@class=\"mx-input-theme ng-binding label-text\"]")
	private List<WebElement> totalShiftCntChk;

	@FindBy(xpath = "//*[@class=\"mx-input-theme ng-binding label-text\"][3]")
	private WebElement totalShiftCnt;

	@FindBy(id = "MinWrkSft")
	private WebElement minWrkSft;

	public String createShift(Map<String, String> data) throws InterruptedException {
		waitForElementVisible(shiftIDTxt);
		// addButtonClick();
		// Thread.sleep(1000);
		String shiftType = data.get("ShiftType");
		String shiftN = data.get("ShiftID");
		String startTime = data.get("StartTime");
		String endTime = data.get("EndTime");
		String halfDay = data.get("HalfDay");
		String fullDay = data.get("FullDay");

		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, shiftN);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(500);
			if (shiftIds.size() > 0) {
				for (int j = 0; j < shiftIds.size(); j++) {
					String shiftid = shiftIds.get(j).getText();
					if (shiftid.equalsIgnoreCase(shiftN)) {
						shiftIds.get(j).click();
						waitForElementDisable(shiftIDTxt);
						waitForElementDisable(shiftTypeDD);
						break;
					}
				}
			}
		}
		// logger.debug(ar);
		if (addButton.isEnabled()) {
			addButtonClick();
			waitForElementDisable(addButton);
			waitForElementClickable(shiftTypeDD);
			element_InputTextUsingActionClass(shiftIDTxt, shiftN);
		}
		
		// logger.debug(ar);
		if (shiftType != null && shiftTypeDD.isEnabled() == true) {
			element_DropDownSelectByvisibleText(shiftTypeDD, shiftType);
		}
		if (startTime != null) {
			Thread.sleep(200);
			element_Clear(shiftStartTime);
			Thread.sleep(100);
			String sTime = staticTimeOrPlusMinusHoursFromCurrentTime(startTime);
			element_inputTextUsingActionClassCharacterOneByOne(shiftStartTime, sTime);
		}
		if (endTime != null) {
			String eTime = staticTimeOrPlusMinusHoursFromCurrentTime(endTime);
			element_Clear(shiftEndTime);
			element_inputTextUsingActionClassCharacterOneByOne(shiftEndTime, eTime);
		}
		if (halfDay != null) {
			element_Clear(shiftHalfDay);
			element_inputTextUsingActionClassCharacterOneByOne(shiftHalfDay, halfDay);
		}
		if (fullDay != null) {
			element_Clear(shiftFullDay);
			element_inputTextUsingActionClassCharacterOneByOne(shiftFullDay, fullDay);
		}

		// Mayank
		// Break Details Panel
		if (data.get("BreakStart") != null || data.get("BreakEnd") != null || data.get("BrkDeviationAllowed") != null
				|| data.get("AddBrkLIinTotalLI") != null || data.get("AddBrkEOinTotalEO") != null
				|| data.get("DeductTypeFor2PunchFlag") != null || data.get("DeductTypeFor2PunchValue") != null
				|| data.get("DeductTypeFor2+PunchFlag") != null || data.get("DeductTypeFor2+PunchValue") != null) {
			if (breakDetailsPanelOpenOrNot.size() > 0) {
				element_Click(breakDetailsPanel);
			}
			if (data.get("BreakStart") != null) {
				String bStartTime = staticTimeOrPlusMinusHoursFromCurrentTime(data.get("BreakStart"));
				element_Clear(breakStartTime);
				element_inputTextUsingActionClassCharacterOneByOne(breakStartTime, bStartTime);
			}
			if (data.get("BreakEnd") != null) {
				String bEndTime = staticTimeOrPlusMinusHoursFromCurrentTime(data.get("BreakEnd"));
				element_Clear(breakEndTime);
				element_inputTextUsingActionClassCharacterOneByOne(breakEndTime, bEndTime);
			}
			if (data.get("BrkDeviationAllowed") != null) {
				Boolean brkDeviationAllowed = Boolean.parseBoolean(data.get("BrkDeviationAllowed"));
				if (brkDeviationAllowed == true) {
					if (!breakDeviationFlag.isSelected()) {
						element_Click(breakDeviationFlag);
					}
				} else {
					if (breakDeviationFlag.isSelected()) {
						element_Click(breakDeviationFlag);
					}
				}
			}
			// Break Advance Details Panel
			if (data.get("AddBrkLIinTotalLI") != null || data.get("AddBrkEOinTotalEO") != null
					|| data.get("DeductTypeFor2PunchFlag") != null || data.get("DeductTypeFor2PunchValue") != null
					|| data.get("DeductTypeFor2+PunchFlag") != null || data.get("DeductTypeFor2+PunchValue") != null) {
				Thread.sleep(1000);
				if (breakAdvanceDetailsPanelOpenOrNot.size() > 0) {
					element_Click(breakAdvanceDetailsPanel);
				}
				Thread.sleep(1000);
				if (data.get("AddBrkLIinTotalLI") != null) {
					if (!breakDeviationFlag.isSelected()) {
						Boolean addBrkLIinTotalLI = Boolean.parseBoolean(data.get("AddBrkLIinTotalLI"));
						if (addBrkLIinTotalLI == true) {
							if (!addBreakLiInTotalLiFlag.isSelected()) {
								element_Click(addBreakLiInTotalLiFlag);
							}
						} else {
							if (addBreakLiInTotalLiFlag.isSelected()) {
								element_Click(addBreakLiInTotalLiFlag);
							}
						}
					}
				}
				if (data.get("AddBrkEOinTotalEO") != null) {
					if (!breakDeviationFlag.isSelected()) {
						Boolean addBrkEOinTotalEO = Boolean.parseBoolean(data.get("AddBrkEOinTotalEO"));
						if (addBrkEOinTotalEO == true) {
							if (!addBreakEoInTotalEoFlag.isSelected()) {
								element_Click(addBreakEoInTotalEoFlag);
							}
						} else {
							if (addBreakEoInTotalEoFlag.isSelected()) {
								element_Click(addBreakEoInTotalEoFlag);
							}
						}
					}
				}
				if (data.get("DeductTypeFor2PunchFlag") != null) {
					Boolean deductTypeFor2PunchFlag = Boolean.parseBoolean(data.get("DeductTypeFor2PunchFlag"));
					if (deductTypeFor2PunchFlag == true) {
						if (!deductTypeFor2PunchFlagEle.isSelected()) {
							element_Click(deductTypeFor2PunchFlagEle);
						}
						if (data.get("DeductTypeFor2PunchValue") != null) {
							element_DropDownSelectByvisibleText(deductTypeFor2PunchValueDD,
									data.get("DeductTypeFor2PunchValue"));
						}
					} else {
						if (deductTypeFor2PunchFlagEle.isSelected()) {
							element_Click(deductTypeFor2PunchFlagEle);
						}
					}
				}
				if (data.get("DeductTypeFor2+PunchFlag") != null) {
					Boolean DeductTypeFor2MorePunchFlag = Boolean.parseBoolean(data.get("DeductTypeFor2+PunchFlag"));
					if (DeductTypeFor2MorePunchFlag == true) {
						if (!deductTypeFor2MorePunchFlagEle.isSelected()) {
							element_Click(deductTypeFor2MorePunchFlagEle);
						}
						if (data.get("DeductTypeFor2+PunchValue") != null) {
							element_DropDownSelectByvisibleText(deductTypeFor2MorePunchValueDD,
									data.get("DeductTypeFor2+PunchValue"));
						}
					} else {
						if (deductTypeFor2MorePunchFlagEle.isSelected()) {
							element_Click(deductTypeFor2MorePunchFlagEle);
						}
					}
				}
			}
		}
		// Grace Time Details Panel
		if (data.get("IncGrcTimeInWrkHrs") != null || data.get("GrcTimeforShiftLateIN") != null
				|| data.get("OverlapShiftLateIn") != null || data.get("GrcTimeforShiftEarlyOUT") != null
				|| data.get("OverlapShiftEarlyOUT") != null || data.get("GrcTimeforBrkLateIN") != null
				|| data.get("OverlapBrkLateIn") != null || data.get("GrcTimeforBrkEarlyOut") != null
				|| data.get("OverlapBrkEarlyOut") != null) {
			if (breakDetailsPanelOpenOrNot.size() == 0) {
				element_Click(breakDetailsPanel);
			}
			if (graceTimeDetailsPanelOpenOrNot.size() > 0) {
				element_Click(graceTimeDetailsPanel);
			}
			if (data.get("IncGrcTimeInWrkHrs") != null) {
				Boolean incGrcTimeInWrkHrs = Boolean.parseBoolean(data.get("IncGrcTimeInWrkHrs"));
				if (incGrcTimeInWrkHrs == true) {
					if (!includeGraceTimeInWorkingHoursFlag.isSelected()) {
						element_Click(includeGraceTimeInWorkingHoursFlag);
					}
				} else {
					if (includeGraceTimeInWorkingHoursFlag.isSelected()) {
						element_Click(includeGraceTimeInWorkingHoursFlag);
					}
				}
			}
			if (data.get("GrcTimeforShiftLateIN") != null) {
				element_Clear(graceTimeforShiftLateINTxt);
				element_InputTextUsingActionClass(graceTimeforShiftLateINTxt, data.get("GrcTimeforShiftLateIN"));
			}
			if (data.get("OverlapShiftLateIn") != null) {
				Boolean overlapShiftLateIn = Boolean.parseBoolean(data.get("OverlapShiftLateIn"));
				if (overlapShiftLateIn == true) {
					if (!overlapGraceTimeWithShiftLateINFlag.isSelected()) {
						element_Click(overlapGraceTimeWithShiftLateINFlag);
					}
				} else {
					if (overlapGraceTimeWithShiftLateINFlag.isSelected()) {
						element_Click(overlapGraceTimeWithShiftLateINFlag);
					}
				}
			}
			if (data.get("GrcTimeforShiftEarlyOUT") != null) {
				element_Clear(graceTimeforShiftEarlyOUTTxt);
				element_InputTextUsingActionClass(graceTimeforShiftEarlyOUTTxt, data.get("GrcTimeforShiftEarlyOUT"));
			}
			if (data.get("OverlapShiftEarlyOUT") != null) {
				Boolean overlapShiftEarlyOUT = Boolean.parseBoolean(data.get("OverlapShiftEarlyOUT"));
				if (overlapShiftEarlyOUT == true) {
					if (!overlapGraceTimeWithShiftEarlyOUTFlag.isSelected()) {
						element_Click(overlapGraceTimeWithShiftEarlyOUTFlag);
					}
				} else {
					if (overlapGraceTimeWithShiftEarlyOUTFlag.isSelected()) {
						element_Click(overlapGraceTimeWithShiftEarlyOUTFlag);
					}
				}
			}
			if (data.get("GrcTimeforBrkLateIN") != null) {
				element_Clear(graceTimeforBreakLateINTxt);
				element_InputTextUsingActionClass(graceTimeforBreakLateINTxt, data.get("GrcTimeforBrkLateIN"));
			}
			if (data.get("OverlapBrkLateIn") != null) {
				Boolean overlapBrkLateIn = Boolean.parseBoolean(data.get("OverlapBrkLateIn"));
				if (overlapBrkLateIn == true) {
					if (!overlapGraceTimeWithBreakLateINFlag.isSelected()) {
						element_Click(overlapGraceTimeWithBreakLateINFlag);
					}
				} else {
					if (overlapGraceTimeWithBreakLateINFlag.isSelected()) {
						element_Click(overlapGraceTimeWithBreakLateINFlag);
					}
				}
			}
			if (data.get("GrcTimeforBrkEarlyOut") != null) {
				element_Clear(graceTimeforBreakEarlyOUTTxt);
				element_InputTextUsingActionClass(graceTimeforBreakEarlyOUTTxt, data.get("GrcTimeforBrkEarlyOut"));
			}
			if (data.get("OverlapBrkEarlyOut") != null) {
				Boolean overlapBrkEarlyOut = Boolean.parseBoolean(data.get("OverlapBrkEarlyOut"));
				if (overlapBrkEarlyOut == true) {
					if (!overlapGraceTimeWithBreakEarlyOUTFlag.isSelected()) {
						element_Click(overlapGraceTimeWithBreakEarlyOUTFlag);
					}
				} else {
					if (overlapGraceTimeWithBreakEarlyOUTFlag.isSelected()) {
						element_Click(overlapGraceTimeWithBreakEarlyOUTFlag);
					}
				}
			}
		}
		if (shiftN != null) {
			if (shiftName.getAttribute("value") == null || shiftName.getAttribute("value").equalsIgnoreCase("")) {
				element_Clear(shiftName);
				element_InputTextUsingActionClass(shiftName, shiftN);
			}

		}
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	public void deleteSchift(String sName) throws InterruptedException {
		logger.info("ShiftID: " + sName);
		waitForElementVisible(shiftIDTxt);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, sName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(400);
			if (shiftIds.size() > 0) {
				for (int j = 0; j < shiftIds.size(); j++) {
					String hsName1 = shiftIds.get(j).getText();
					if (hsName1.equalsIgnoreCase(sName)) {
						shiftIds.get(j).click();
						waitForElementDisable(addButton);
						deleteButtonClick();
						if (element_AlertIsPresent()) {
							driver.switchTo().alert().accept();
						}
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
						logger.info("Shift Deleted Succcessfully");
						break;
					}
				}
			} else {
				logger.info("Shift Not Found");
			}
		} else {
			logger.info("Shift Not Found");
		}

	}

	@FindBy(xpath = "//*[@id='message']/div/label")
	private WebElement validationMessagexpath;

	// CSR-6744 -Mayank
	public void createShiftMaximum(Map<String, String> data) throws InterruptedException {
		// pageLoadWaitng();
		Thread.sleep(3000);
		if (totalShiftCntChk.size() > 0) {
			logger.info("**********Total created Shift Count = " + totalShiftCnt.getText() + "**************");
			if (Integer.parseInt(totalShiftCnt.getText()) >= 999) {
				addButtonClick();
				// Popup remove as per story CSR-8049
//				logger.info("Popup should be displayed");
//				Thread.sleep(1000);
//				String warning = shiftaddPopupTxt.getText();
//				Assert.assertEquals(warning, "Shift above 999 will not be synced to Panel/Panel Lite/Panel 200 and shift based access will not work for this shift.");
//				element_Click(popupOkBtn);
				logger.info("Popup should not be displayed, Total shift count is more than 999");
				Thread.sleep(1000);
			} else {
				addButtonClick();
				logger.info("Popup should not be displayed, Total shift count is less than 999");
				Thread.sleep(1000);
			}
		} else {
			addButtonClick();
			logger.info("Popup should not be displayed, Total Shift count is less or equal 15");
			Thread.sleep(1000);
		}
		element_InputTextUsingActionClass(shiftIDTxt, data.get("ShiftID"));
		element_TextBoxToClickOnTab(shiftIDTxt);
		Thread.sleep(1000);
		if (shiftIDTxt.isEnabled()) {
			element_Clear(shiftName);
			element_InputTextUsingActionClass(shiftName, data.get("ShiftID"));
			element_TextBoxToClickOnTab(shiftName);
			if (data.get("ShiftType") != null) {
				element_DropDownSelectByvisibleText(shiftTypeDD, data.get("ShiftType"));
			}
			if (data.get("StartTime") != null) {
				String sTime = staticTimeOrPlusMinusHoursFromCurrentTime(data.get("StartTime"));
				element_inputTextUsingActionClassCharacterOneByOne(shiftStartTime, sTime);
			}
			if (data.get("EndTime") != null) {
				String eTime = staticTimeOrPlusMinusHoursFromCurrentTime(data.get("EndTime"));
				element_inputTextUsingActionClassCharacterOneByOne(shiftEndTime, eTime);
			}
			if (data.get("HalfDay") != null) {
				element_inputTextUsingActionClassCharacterOneByOne(shiftHalfDay, data.get("HalfDay"));
			}
			if (data.get("FullDay") != null) {
				element_inputTextUsingActionClassCharacterOneByOne(shiftFullDay, data.get("FullDay"));
			}
		}
		saveButtonClick();

		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}

}
