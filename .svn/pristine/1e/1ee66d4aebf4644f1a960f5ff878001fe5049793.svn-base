package PageObject.AdminModule;

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
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovyjarjarantlr4.v4.parse.ANTLRParser.throwsSpec_return;

public class GlobalPolicyPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(GlobalPolicyPO.class);
	public static String dateFormatSelected;
	
	public GlobalPolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	// ******************************************************************************
	// ************************Basic Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//li[contains(@class,'tab-items')]//label[text()='Basic']")
	private WebElement basicTab;
	
	@FindBy(id = "sysdateformat")
	private WebElement systemDateFormat;

	// ******************************************************************************
	// ************************Login Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[text()='Login']")
	private WebElement loginTab;

	@FindBy(id = "loginauthddl")
	private WebElement loginAuthenticationModeDD;

	@FindBy(xpath = "//*[@name='ChkActDirFlg']")
	private WebElement activeDirectoryFlg;
	
	@FindBy(id = "TxtActDirSerIP")
	private WebElement ActiveDirectoryServerAddressIP;
	
	@FindBy(id = "TxtPortNum")
	private WebElement ActiveDirectoryServerAddressPort;
	
	@FindBy(id = "TxtDomainName")
	private WebElement ActiveDirectoryServerAddressDomainName;
	// ******************************************************************************
	// ************************Password Policy Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[text()='Password Policy']")
	private WebElement globalPolicyPasswordPolicy;

	@FindBy(xpath = "//*[@name='ChkOTPAuthPass']")
	private WebElement otpAuthenticationForSettingPassword;

	@FindBy(xpath = "//*[@name='ChkSysDenyPwdReuse']")
	private WebElement denyPasswordReuse;

	@FindBy(id = "TxtSysDenyPwdReuseCount")
	private WebElement reuseCountForSAUsers;
	
	@FindBy(id = "TxtEssDenyPwdReuseCount")
	private WebElement reuseCountForESSUsers;

	@FindBy(id = "TxtSysPwdMinChars")
	private WebElement minRequiredChars;

	@FindBy(id = "CboPwdSecurityLevel")
	private WebElement securityLevel;
	
	@FindBy(id = "TxtEssCssPwdMinChars")
	private WebElement minRequiredCharsESS;

	@FindBy(id = "CboEssCssPwdSecurityLevel")
	private WebElement securityLevelESS;

	@FindBy(id = "TxtMaxOTPGenretionCNT")
	private WebElement maxOTPGenretionCNT;

	@FindBy(id = "TxtResetOTPAfterMin")
	private WebElement resetOTPAfterMin;

	@FindBy(xpath = "//*[@name='ChkSysLockInvldAttempt']")
	private WebElement lockAccountforInvalidAttempts;

	@FindBy(id = "TxtSysLockInvldAttemptCount")
	private WebElement maximumInvalidAttempts;

	@FindBy(id = "TxtSysAutoUnlockTimer")
	private WebElement autoUnlockTimerMin;

	@FindBy(xpath = "//*[@name='ChkPwdPLC']")
	private WebElement passwordSecurityPolicy;

	@FindBy(id = "TxtPwdPLCDay")
	private WebElement passwordResetPeriodDays;
	
//	Otp Timer
	@FindBy(id = "TxtOTPValidity_Min")
	private WebElement otpTimer;

	// ******************************************************************************
	// ************************User Tab Element************************
	// ******************************************************************************

	@FindBy(xpath = "//*[text()='User']")
	private WebElement globalPolicyUser;

	@FindBy(xpath = "//*[@key='lblTempandSymptomConfig']")
	private WebElement tempAndSymptomsConfigPanel;

	@FindBy(xpath = "//*[@name='IsTempEnbl']")
	private WebElement tempConfigFlag;

	@FindBy(id = "CmbTempUnitDropDown")
	private WebElement tempUnitDD;

	@FindBy(id = "Temperature")
	private WebElement tempThresholdText;

	@FindBy(xpath = "//*[@name='IsSymptomsEnbl']")
	private WebElement symptomsConfigFlag;

	@FindBy(id = "CmbSymptomsDropDown")
	private WebElement symptomsThresholdDD;

	@FindBy(xpath = "//*[@default='Information']")
	private List<WebElement> informationPopup;

	@FindBy(id = "btnOk")
	private WebElement infoOKBtn;

	@FindBy(xpath = "//*[@name='ChkAutoGenerateUserID']")
	private WebElement autoGenerateUserIDFlag;
	
	@FindBy(id = "UserAutoSearchTxt")
	private WebElement idFormatTxt;
	
	@FindBy(id = "UserNumericValueLength")
	private WebElement numericValueLengthTxt;
	
	@FindBy(xpath = "//*[@name='ChkZeroPaddingRequiredUser']")
	private WebElement zeroPaddingIsRequiredFlag;
	
	// Custom Fields
	@FindBy(xpath = "//*[@id='User']//*[@default='Custom Fields']")
	private WebElement customFieldPanel;
	
	@FindBy(xpath = "//*[@id='div_grd_gvUFields']//*[@id='grid1']/tbody/tr/td[1]")
	private List<WebElement> customFieldTableUsers;
	
	@FindBy(xpath = "//*[@id='div_grd_gvUFields']//*[@class='pagination-next']")
	private WebElement usercustomFieldTableNextBtn;
	
	@FindBy(xpath = "//*[@class='modal-content']")
	private List<WebElement> fieldTypeChangeConfirmationPopup;
	
	@FindBy(id = "btnYes")
	private WebElement fieldTypeChangeConfirmationPopupYesBtn;
	
	// Invite user
	@FindBy(id = "TxtInviteUserLinkExpiry")
	private WebElement linkExpiryDaysTxt;
	
	@FindBy(xpath = "//*[@id='User']//*[@default='Invite User']")
	private WebElement inviteUserPanel;
	  //aagam
	@FindBy(xpath = "//*[@name='isDOBMandatoryForUser']")
	private WebElement dobmandatoryflg;
	
	@FindBy(xpath = "//*[@id='User']//*[@id='MinimumAgeYearRequire']")
	private WebElement minageyears;
	
	@FindBy(xpath = "//*[@id='User']//*[@id='MinimumAgeMonthRequire']")
	private WebElement minagemonths;
	
	@FindBy(xpath = "//*[@name='ChkAadhaarNumberMandatory']")
	private WebElement aadharNoMandatoryFlg;
	

	// ******************************************************************************
	// ************************CWM Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[text()='CWM']")
	private WebElement globalPolicyCWM;

	@FindBy(xpath = "//*[@name='ChkWrkrAsgnmntCSS']")
	private WebElement WorkerAssignmentFromCSSFlag;

	@FindBy(id = "cmbAsgnmntAprvl")
	private WebElement AssignmentApprovalDD;

	@FindBy(id = "cmbAprvlScheme")
	private WebElement ApprovalSchemeDD;

	@FindBy(xpath = "//*[@name='ChkAprvlFr']")
	private WebElement ApprovalReqForExistingWorkersFlag;
	
	@FindBy(xpath = "//*[@name='ChkAutoGenerateWorkerID']")
	private WebElement autoGenerateWorkerIDFlag;
	
	@FindBy(id = "CWMAutoSearchTxt")
	private WebElement workeridFormatTxt;
	
	@FindBy(id = "CWMNumericValueLength")
	private WebElement workernumericValueLengthTxt;
	
	@FindBy(xpath = "//*[@name='ChkZeroPaddingRequiredCWM']")
	private WebElement workerzeroPaddingIsRequiredFlag;
	
	@FindBy(xpath = "//*[@name='txtCWMPreFix']")
	private WebElement workeridRangePrefixTxt;
	
	@FindBy(id = "TxtCWMStart")
	private WebElement workeridRangeStartTxt;
	
	@FindBy(id = "TxtCWMEnd")
	private WebElement workeridRangeEndTxt;
	
	// Custom Fields
		@FindBy(xpath = "//*[@id='CWM']//*[@default='Custom Fields for Contractors']")
		private WebElement customFieldPanelContractor;
		
		@FindBy(xpath = "//*[@id='div_grd_gCWMFields']//table/tbody/tr/td[1]")
		private List<WebElement> customFieldTableContractors;
		
		@FindBy(xpath = "//*[@id='div_grd_gCWMFields']//*[@class='pagination-next']")
		private WebElement contractorCustomFieldTableNextBtn;
	
	// ******************************************************************************
	// ************************Visitor Management Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[text()='Visitor Management']")
	private WebElement globalPolicyVisitorManagement;
	
	@FindBy(id = "AuthVisitorPreRegistrationType")
	private WebElement authForVisitorPreRegistrationDD;
	
	@FindBy(xpath = "//*[@name='EPassSecurityApprv']")
	private WebElement securityApprovalForVisitorEPassFlag;
	
	@FindBy(id = "AuthVisitorInitiatedVisitType")
	private WebElement authForVisitorInitiatedVisitDD;
	
	@FindBy(xpath = "//*[@name='VisAccepReq']")
	private WebElement requiredVisitorAcceptanceFlag;
	
	@FindBy(xpath = "//*[@name='TxtEPassGenDur']")
	private WebElement allowEPassGenerationBeforeDurationTxt;
	
	@FindBy(xpath = "//*[@name='AutoProfileAsnmnt']")
	private WebElement autoProfileAssignmentFlag;
	
	@FindBy(xpath = "//*[@class=\"col-md-3 form-hr list-box mx-gp-mw-180\"]/div/label")
	private List<WebElement> matchingLevelGroupFlags;
	
	@FindBy(id = "ApplyRestrictionOnType")
	private WebElement visitCreationApplyRestrictionOnDD;
	
	// Custom Fields
	@FindBy(xpath = "//*[@id='Visitor Management']//*[@default='Custom Fields']")
	private WebElement customFieldPanelVMS;

	@FindBy(xpath = "//*[@id=\"div_grd_gVisitorFields\"]//table/tbody/tr/td[1]")
	private List<WebElement> customFieldTableVisitors;
	
	// ******************************************************************************
	// ************************ESS Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[text()='ESS']")
	private WebElement globalPolicyESS;
	
	@FindBy(xpath = "//*[@id='ESS']//*[@class='form-group'][3]//following-sibling::*")
	private List<WebElement> SpcFuncConfigs;
	
	
	@FindBy(xpath="//*[@id='ESS']//*[@class='form-group'][3]//following-sibling::div//label")
	private List<WebElement> specialFunctionLabel;
	
	@FindBy(xpath="//*[@id='ESS']//*[@class='form-group'][3]//following-sibling::div//input")
	private List<WebElement> specialFunctionInput;
	
	// ******************************************************************************
	// ************************Report Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[text()='Reports']")
	private WebElement globalPolicyReports;
	
	@FindBy(xpath = "//*[@name='ChkExportOutInPdf']")
	private WebElement reportExportOutputInPDFOnlyFlag;
	
	// ******************************************************************************
		// ************************Job Costing Tab Element************************
		// ******************************************************************************
	@FindBy(xpath = "//*[contains(@class,'tab-items')]//*[text()='Job Costing']")
	private WebElement globalPolicyJobCosting;
	
	@FindBy(id = "cmbMergeConsecutiveJob")
	private WebElement mergeWithConsecutiveJobDD;
	
	
	
	
	
	// ******************************************************************************
	//*********************************FUNCTIONS**************************************
	//**********************************************************************************
	//**********************************************************************************

	public void setLoginAuthenticationMode(String value) throws InterruptedException {
		waitForElementVisible(systemDateFormat);
		element_Click(loginTab);
		waitForElementVisible(loginAuthenticationModeDD);
		element_DropDownSelectByvisibleText(loginAuthenticationModeDD, value);
		saveButtonClickUsingJS();
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		validationMessageCloseButton.click();
	}

	public void selectOTPAuthenticationForSettingPassword(boolean otpAuth) throws InterruptedException {
		waitForElementVisible(systemDateFormat);
		element_Click(globalPolicyPasswordPolicy);
		// check OTP Authentication For Setting Password checkbox checked or not
		if (otpAuth == true) {
			if (element_isSelected(otpAuthenticationForSettingPassword) != true) {
				element_Click(otpAuthenticationForSettingPassword);
			}
		} else {
			if (element_isSelected(otpAuthenticationForSettingPassword) == true) {
				element_Click(otpAuthenticationForSettingPassword);
			}
		}
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		validationMessageCloseButton.click();
	}

	// Created by Mayank
	public void passwordReuse(boolean denyPwdReuse1, String reuseCount) throws InterruptedException {
		waitForElementVisible(systemDateFormat);
		waitForElementVisible(globalPolicyPasswordPolicy);
		element_Click(globalPolicyPasswordPolicy);
		if (denyPwdReuse1 == true) {
			boolean checkflg = denyPasswordReuse.isSelected();
			if (checkflg != true) {
				element_Click(denyPasswordReuse);
			}
		} else {
			boolean checkflg = denyPasswordReuse.isSelected();
			if (checkflg == true) {
				element_Click(denyPasswordReuse);
			}
		}
		if (element_isSelected(denyPasswordReuse)) {
			element_Clear(reuseCountForSAUsers);
			element_InputTextUsingActionClass(reuseCountForSAUsers, reuseCount);
		}
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String valMsg = validationMessage();
		Assert.assertEquals("Saved Successfully", valMsg);
	}

	// Created by Mayank
	public void setMinCharAndSecLvlSA(String minReqChar, String secLvl) throws InterruptedException {
		waitForElementVisible(systemDateFormat);
		waitForElementVisible(globalPolicyPasswordPolicy);
		element_Click(globalPolicyPasswordPolicy);
		element_Clear(minRequiredChars);
		element_InputTextUsingActionClass(minRequiredChars, minReqChar);
		element_DropDownSelectByvisibleText(securityLevel, secLvl);
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String valMsg = validationMessage();
		Assert.assertEquals("Saved Successfully", valMsg);
	}
	
	// Created by Mayank
	public void setMinCharAndSecLvlESS(String minReqChar, String secLvl) throws InterruptedException {
		waitForElementVisible(systemDateFormat);
		waitForElementVisible(globalPolicyPasswordPolicy);
		element_Click(globalPolicyPasswordPolicy);
		element_Clear(minRequiredCharsESS);
		element_InputTextUsingActionClass(minRequiredCharsESS, minReqChar);
		element_DropDownSelectByvisibleText(securityLevelESS, secLvl);
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String valMsg = validationMessage();
		Assert.assertEquals("Saved Successfully", valMsg);
	}

	// Created by Mayank
	public void setMaxOTPGenAtmpAndResendOTPAfterMin(String maxOTPGenAtmp, String reOTPAftMin) throws InterruptedException {
		waitForElementVisible(systemDateFormat);
		waitForElementVisible(globalPolicyPasswordPolicy);
		element_Click(globalPolicyPasswordPolicy);
		element_Clear(maxOTPGenretionCNT);
		element_InputTextUsingActionClass(maxOTPGenretionCNT, maxOTPGenAtmp);
		element_Clear(resetOTPAfterMin);
		element_InputTextUsingActionClass(resetOTPAfterMin, reOTPAftMin);
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String valMsg = validationMessage();
		Assert.assertEquals("Saved Successfully", valMsg);
	}

	// Created by Mayank
	public void setLockAccountforInvalidAtmptsConfig(boolean lockAcforInvalidAtmp1, String maxInvalidAtmp,
			String AutoUnlockTimer) throws InterruptedException {
		waitForElementVisible(systemDateFormat);
		waitForElementVisible(globalPolicyPasswordPolicy);
		element_Click(globalPolicyPasswordPolicy);
		if (lockAcforInvalidAtmp1 == true) {
			boolean checkflg = lockAccountforInvalidAttempts.isSelected();
			if (checkflg != true) {
				element_Click(lockAccountforInvalidAttempts);
			}
		} else {
			boolean checkflg = lockAccountforInvalidAttempts.isSelected();
			if (checkflg == true) {
				element_Click(lockAccountforInvalidAttempts);
			}
		}
		boolean checkflg = lockAccountforInvalidAttempts.isSelected();
		if (checkflg == true) {
			element_Clear(maximumInvalidAttempts);
			element_InputTextUsingActionClass(maximumInvalidAttempts, maxInvalidAtmp);
			element_Clear(autoUnlockTimerMin);
			Thread.sleep(1000);
			element_InputTextUsingActionClass(autoUnlockTimerMin, AutoUnlockTimer);
		}
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String valMsg = validationMessage();
		Assert.assertEquals("Saved Successfully", valMsg);
	}

	// Created by Mayank
	public void setPasswordSecurityPolicyAndPasswordResetPeriodDays(boolean pwdSecPolicy1, String pwdResetPeriod)
			throws InterruptedException {
		waitForElementVisible(systemDateFormat);
		waitForElementVisible(globalPolicyPasswordPolicy);
		element_Click(globalPolicyPasswordPolicy);
		if (pwdSecPolicy1 == true) {
			if (!passwordSecurityPolicy.isSelected()) {
				element_Click(passwordSecurityPolicy);
			}
		} else {
			if (passwordSecurityPolicy.isSelected()) {
				element_Click(passwordSecurityPolicy);
			}
		}
		if (passwordResetPeriodDays.isEnabled()) {
			Thread.sleep(500);
			element_Clear(passwordResetPeriodDays);
			Thread.sleep(500);
			element_InputTextUsingActionClass(passwordResetPeriodDays, pwdResetPeriod);
		}
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String valMsg = validationMessage();
		Assert.assertEquals(valMsg, "Saved Successfully");
	}

	// Created by Mayank
	public String setTemperatureAndSymptomsConfiguration(boolean tempConfig1, String tempUnit, String tempThreshold,
			boolean symptomsConfig1, String symptomsThreshold) throws InterruptedException {
		waitForElementVisible(systemDateFormat);
		waitForElementVisible(globalPolicyUser);
		element_Click(globalPolicyUser);
		element_Click(tempAndSymptomsConfigPanel);
		Thread.sleep(500);
		// Temperature Configuration
		if (tempConfig1 == true) {
			if (!tempConfigFlag.isSelected()) {
				element_Click(tempConfigFlag);
			}
		} else {
			if (tempConfigFlag.isSelected()) {
				element_Click(tempConfigFlag);
			}
		}
		if (tempConfigFlag.isSelected()) // Below parameters are depends on this flag
		{
			// Temp Unit
			element_DropDownSelectByvisibleText(tempUnitDD, tempUnit);
			if (informationPopup.size() > 0) {
				element_Click(infoOKBtn);
			}
			// Temp Threshold
			element_Clear(tempThresholdText);
			Thread.sleep(400);
			element_InputDataUsingJS(tempThresholdText, tempThreshold);
		}
		// Symptoms Configuration
		if (symptomsConfig1 == true) {
			if (!symptomsConfigFlag.isSelected()) {
				element_Click(symptomsConfigFlag);
			}
		} else {
			if (symptomsConfigFlag.isSelected()) {
				element_Click(symptomsConfigFlag);
			}
		}
		if (symptomsConfigFlag.isSelected()) // Below parameters are depends on this flag
		{
			// Symptoms Threshold
			element_DropDownSelectByvisibleText(symptomsThresholdDD, symptomsThreshold);
		}

		Thread.sleep(1000);
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String valMsg = validationMessage();
		return valMsg;
	}

	// Mayank
	// CWM Parameters
	public String cwmParametersInGP(Map<String, String> data) throws InterruptedException {
		waitForElementVisible(systemDateFormat);
		waitForElementVisible(globalPolicyCWM);
		element_Click(globalPolicyCWM);
		Thread.sleep(1000);
		if (data.get("WorkerAssignmentFromCSS") != null) {
			boolean WorkerAssignmentFromCSS1 = Boolean.parseBoolean(data.get("WorkerAssignmentFromCSS"));
			if (WorkerAssignmentFromCSS1 == true) {
				if (!WorkerAssignmentFromCSSFlag.isSelected()) {
					element_Click(WorkerAssignmentFromCSSFlag);
				}
				// Below parameters are depends on above flag
				if (data.get("AssignmentApproval") != null) {
					element_DropDownSelectByvisibleText(AssignmentApprovalDD, data.get("AssignmentApproval"));
				}
				if (data.get("AssignmentApproval").equalsIgnoreCase("Approval Stage")) {
					if (data.get("ApprovalScheme") != null) {
						if (ApprovalSchemeDD.isEnabled()) {
							element_DropDownSelectByvisibleText(ApprovalSchemeDD, data.get("ApprovalScheme"));
						}
					}
				}
				if (data.get("ApprovalRequiredForExistingWorkers") != null) {
					boolean ApprovalRequiredForExistingWorkers1 = Boolean
							.parseBoolean(data.get("ApprovalRequiredForExistingWorkers"));
					if (ApprovalRequiredForExistingWorkers1 == true) {
						if (!ApprovalReqForExistingWorkersFlag.isSelected()) {
							element_Click(ApprovalReqForExistingWorkersFlag);
						}
					} else {
						if (ApprovalReqForExistingWorkersFlag.isSelected()) {
							element_Click(ApprovalReqForExistingWorkersFlag);
						}
					}
				}
			} else {
				if (WorkerAssignmentFromCSSFlag.isSelected()) {
					element_Click(WorkerAssignmentFromCSSFlag);
				}
			}
		}
		Thread.sleep(1000);
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String valMsg = validationMessage();
		return valMsg;
	}

	public String getSystemDateFormat() throws InterruptedException {
		element_DynamicwaitPerElement(basicTab, 60);
		String systemdate = element_DropDownFirstSelectedValue(systemDateFormat);
		return systemdate;
	}

	public String setSystemDateFormat(String value) throws InterruptedException {
		element_DynamicwaitPerElement(basicTab, 60);
		dateFormatSelected=value;
		element_DropDownSelectByvisibleText(systemDateFormat, value);
		Thread.sleep(1000);
		saveButtonClickUsingJS();
//		pageLoadWaitng();
//		Thread.sleep(3000);
		String valMsg = validationMessage();
		return valMsg;
	}
	
	// Mayank
	public void setVisitorManagementTabParameters(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(globalPolicyVisitorManagement);
		waitForElementVisible(authForVisitorPreRegistrationDD);
		if (data.get("AuthForVisitorPreRegistration") != null) {
			if (data.get("AuthForVisitorPreRegistration").equalsIgnoreCase("Visit Outside The Shift")) {
				element_DropDownSelectByvisibleText(authForVisitorPreRegistrationDD, "When Visit Outside The Shift");
			}
			else {
				element_DropDownSelectByvisibleText(authForVisitorPreRegistrationDD, data.get("AuthForVisitorPreRegistration"));
			}
		}
		if (data.get("SecurityApprovalForVisitorEPass") != null) {
			Boolean securityApprovalForVisitorEPass1 = Boolean.parseBoolean(data.get("SecurityApprovalForVisitorEPass"));
			if (securityApprovalForVisitorEPass1==true) {
				if (!securityApprovalForVisitorEPassFlag.isSelected()) {
					element_Click(securityApprovalForVisitorEPassFlag);
				}
			} else {
				if (securityApprovalForVisitorEPassFlag.isSelected()) {
					element_Click(securityApprovalForVisitorEPassFlag);
				}
			}
		}
		if (data.get("AuthForVisitorInitiatedVisit") != null) {
			if (data.get("AuthForVisitorInitiatedVisit").equalsIgnoreCase("Visit Outside The Shift")) {
				element_DropDownSelectByvisibleText(authForVisitorInitiatedVisitDD, "When Visit Outside The Shift");
			}
			else {
				element_DropDownSelectByvisibleText(authForVisitorInitiatedVisitDD, data.get("AuthForVisitorInitiatedVisit"));
			}
		}
		if (data.get("RequiredVisitorAcceptance") != null) {
			Boolean requiredVisitorAcceptance1 = Boolean.parseBoolean(data.get("RequiredVisitorAcceptance"));
			if (requiredVisitorAcceptance1==true) {
				if (!requiredVisitorAcceptanceFlag.isSelected()) {
					element_Click(requiredVisitorAcceptanceFlag);
				}
			} else {
				if (requiredVisitorAcceptanceFlag.isSelected()) {
					element_Click(requiredVisitorAcceptanceFlag);
				}
			}
		}
		if (data.get("AllowEPassGenerationBeforeDuration") != null) {
			element_Clear(allowEPassGenerationBeforeDurationTxt);
			element_InputTextUsingActionClass(allowEPassGenerationBeforeDurationTxt, data.get("AllowEPassGenerationBeforeDuration"));
		}
		if (data.get("AllowEPassGenerationBeforeDuration") == null) {// For set null value
			element_CleardatausingActionClass(allowEPassGenerationBeforeDurationTxt);
			//element_TextBoxToClickOnTab(allowEPassGenerationBeforeDurationTxt);
		}
		if (data.get("VisitCreationRestrictionApplyOn") != null) {
			element_DropDownSelectByvisibleText(visitCreationApplyRestrictionOnDD, data.get("VisitCreationRestrictionApplyOn"));
		}
		if (data.get("AutoProfileAssignment") != null) {
			Boolean autoProfileAssignment1 = Boolean.parseBoolean(data.get("AutoProfileAssignment"));
			if (autoProfileAssignment1==true) {
				if (!autoProfileAssignmentFlag.isSelected()) {
					element_Click(autoProfileAssignmentFlag);
				}
				Thread.sleep(500);
				if (data.get("MatchingLevel") != null) {
					String matchingLevels = data.get("MatchingLevel");
					for(int i=0;i<matchingLevelGroupFlags.size();i++) {
						Thread.sleep(750);
						if (matchingLevelGroupFlags.get(i).findElement(By.xpath("child::input")).isSelected()==true) {
							matchingLevelGroupFlags.get(i).findElement(By.xpath("child::input")).click();
						}
					}
					if (matchingLevels.contains(",")) {
						String[] commaSeparatedValues = matchingLevels.split(",");
						
						Thread.sleep(1000);
						for (int i = 0; i < commaSeparatedValues.length; i++) { //Then enable which is required
							String matchingLevelGroup = commaSeparatedValues[i].trim();
							for (WebElement ele : matchingLevelGroupFlags) {
								Thread.sleep(300);
								String label =  ele.getText().trim();
								System.out.println("Checked Label:"+label);
								System.out.println("Matching Level Label:"+matchingLevelGroup);
								System.out.println("selected or not Label:"+ele.isSelected());
								if (label.equalsIgnoreCase(matchingLevelGroup)) {
									if (ele.isSelected()==false) {
										Thread.sleep(750);
										element_Click(ele);
									}
								}
							}
						}
					}
					else {
						for (WebElement ele : matchingLevelGroupFlags) {
							Thread.sleep(300);
							String label = ele.getText().trim();
							System.out.println(label);
							if (ele.isSelected()) {  // First disable
								element_Click(ele);
							}
							if (label.equalsIgnoreCase(matchingLevels)) {
								if (!ele.isSelected()) { // Then enable if required
									element_Click(ele);
								}
							}
							// For disable other flags, break is not use
						}
					}
				}
			} else {
				if (autoProfileAssignmentFlag.isSelected()) {
					element_Click(autoProfileAssignmentFlag);
				}
			}
		}
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		validationMessageCloseButton.click();
	}
	
	// Mayank
	public void setAutoGenerateUserIDCconfigurations(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(globalPolicyUser);
		waitForElementVisible(autoGenerateUserIDFlag);
		if (data.get("AutoGenerateUserID") != null) {
			Boolean autoGenerateUserID1 = Boolean.parseBoolean(data.get("AutoGenerateUserID"));
			if (autoGenerateUserID1==true) {
				if (!autoGenerateUserIDFlag.isSelected()) {
					element_Click(autoGenerateUserIDFlag);
				}
			} else {
				if (autoGenerateUserIDFlag.isSelected()) {
					element_Click(autoGenerateUserIDFlag);
				}
			}
		}
		if (data.get("IDFormat") != null) {
			if (autoGenerateUserIDFlag.isSelected()) {
				element_Clear(idFormatTxt);
				element_InputTextUsingActionClass(idFormatTxt, data.get("IDFormat"));
			}
		}
		if (data.get("NumValLength") != null) {
			if (autoGenerateUserIDFlag.isSelected()) {
				element_Clear(numericValueLengthTxt);
				element_InputTextUsingActionClass(numericValueLengthTxt, data.get("NumValLength"));
			}
		}
		if (data.get("ZeroPadding") != null) {
			if (autoGenerateUserIDFlag.isSelected()) {
				Boolean zeroPadding1 = Boolean.parseBoolean(data.get("ZeroPadding"));
				if (zeroPadding1==true) {
					if (!zeroPaddingIsRequiredFlag.isSelected()) {
						element_Click(zeroPaddingIsRequiredFlag);
					}
				} else {
					if (zeroPaddingIsRequiredFlag.isSelected()) {
						element_Click(zeroPaddingIsRequiredFlag);
					}
				}
			}
		}
		
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		validationMessageCloseButton.click();
	}
	
	// Mayank
	public void setUserCustomFields(String userType, List<Map<String, String>> data) throws InterruptedException {
		pageLoadWaitng();
		if (userType.equalsIgnoreCase("Users")) {
			element_Click(globalPolicyUser);
			waitForElementVisible(autoGenerateUserIDFlag);
			element_Click(customFieldPanel);
		}
		else if (userType.equalsIgnoreCase("Contractors")) {
			element_Click(globalPolicyCWM);
			waitForElementVisible(autoGenerateWorkerIDFlag);
			element_Click(customFieldPanelContractor);
		}
		else if (userType.equalsIgnoreCase("Visitors")) {
			element_Click(globalPolicyVisitorManagement);
			waitForElementVisible(authForVisitorInitiatedVisitDD);
			element_Click(customFieldPanelVMS);
		}
		Thread.sleep(1000);
		int j=0;  // For fields Table (2 Pages of fields so)
		for (int i = 0; i < data.size(); i++) {
			String active = data.get(i).get("Active");
			String fieldName = data.get(i).get("FieldName");
			String type = data.get(i).get("Type");
			String upload = data.get(i).get("Upload");
			String mandatory = data.get(i).get("Mandatory");
				// For User and COntractor custom fields
				List<WebElement> customFieldTable = null;
				if (userType.equalsIgnoreCase("Users")) {
					customFieldTable = customFieldTableUsers;
				}
				else if (userType.equalsIgnoreCase("Contractors")) {
					customFieldTable = customFieldTableContractors;
				}
				else if (userType.equalsIgnoreCase("Visitors")) {
					customFieldTable = customFieldTableVisitors;
				}
				element_ClickUsingJS(customFieldTable.get(j).findElement(By.xpath("following-sibling::td[7]/i")));
				//customFieldTable.get(j).findElement(By.xpath("following-sibling::td[7]/i")).click();
				if (active != null) {
					logger.info("Active: "+active);
					WebElement eleActive = customFieldTable.get(j).findElement(By.xpath("following-sibling::td[1]/input[contains(@id,'Active')]"));
					Boolean active1 = Boolean.parseBoolean(active);
					if (active1==true) {
						Thread.sleep(1000);
						if (!eleActive.isSelected()) {
							eleActive.click();
							Thread.sleep(500);
						}
					}
					else {
						Thread.sleep(1000);
						if (eleActive.isSelected()) {
							eleActive.click();
							Thread.sleep(500);
						}
					}
				}
				if (fieldName != null) {
					logger.info("FieldName: "+fieldName);
					customFieldTable.get(j).findElement(By.xpath("following-sibling::td[2]//input[contains(@id,'Label')]")).clear();
					customFieldTable.get(j).findElement(By.xpath("following-sibling::td[2]//input[contains(@id,'Label')]")).sendKeys(fieldName);
					Thread.sleep(1000);
				}
				if (type != null) {
					WebElement ele = customFieldTable.get(j).findElement(By.xpath("following-sibling::td[3]//select[contains(@id,'FieldType')]"));
					element_DropDownSelectByvisibleText(ele, type);
				}
				if (upload != null) {
					WebElement eleUpload = customFieldTable.get(j).findElement(By.xpath("following-sibling::td[4]/input[contains(@id,'AllowUpload')]"));
					Boolean upload1 = Boolean.parseBoolean(upload);
					if (upload1==true) {
						if (!eleUpload.isSelected()) {
							eleUpload.click();
						}
					}
					else {
						if (eleUpload.isSelected()) {
							eleUpload.click();
						}
					}
					Thread.sleep(1000);
				}
				if (mandatory != null) {
					WebElement eleMandatory = customFieldTable.get(j).findElement(By.xpath("following-sibling::td[5]/input[contains(@id,'Mandatory')]"));
					Boolean mandatory1 = Boolean.parseBoolean(mandatory);
					if (mandatory1==true) {
						if (!eleMandatory.isSelected()) {
							eleMandatory.click();
						}
					}
					else {
						if (eleMandatory.isSelected()) {
							eleMandatory.click();
						}
					}
					Thread.sleep(1000);
				}
				Thread.sleep(1000);
				customFieldTable.get(j).findElement(By.xpath("following-sibling::td[7]//a[@id='savebtn']")).click();
				Thread.sleep(1000);
				if (fieldTypeChangeConfirmationPopup.size()>0) {
					element_Click(fieldTypeChangeConfirmationPopupYesBtn);
				}
				j++;
				if (i==4 && data.size()>5) { // For Next Page
					if (userType.equalsIgnoreCase("Users")) {
						element_Click(usercustomFieldTableNextBtn);
						j=0;  // On Next Page field row start from 0 so
					}
					else if (userType.equalsIgnoreCase("Contractors")) {
						element_Click(contractorCustomFieldTableNextBtn);
						j=0;  // On Next Page field row start from 0 so
					}
				}
		
		}
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		validationMessageCloseButton.click();
	}
	
	// Mayank
		public String setAutoGenerateWorkerIDCconfigurations(Map<String, String> data) throws InterruptedException {
			pageLoadWaitng();
			element_Click(globalPolicyCWM);
			waitForElementVisible(autoGenerateWorkerIDFlag);
			if (data.get("AutoGenerateWorkerID") != null) {
				Boolean AutoGenerateWorkerID1 = Boolean.parseBoolean(data.get("AutoGenerateWorkerID"));
				if (AutoGenerateWorkerID1==true) {
					if (!autoGenerateWorkerIDFlag.isSelected()) {
						element_Click(autoGenerateWorkerIDFlag);
					}
				} else {
					if (autoGenerateWorkerIDFlag.isSelected()) {
						element_Click(autoGenerateWorkerIDFlag);
					}
				}
			}
			if (data.get("IDFormat") != null) {
				if (autoGenerateWorkerIDFlag.isSelected()) {
					Thread.sleep(2000);
					element_Clear(workeridFormatTxt);
					element_InputTextUsingActionClass(workeridFormatTxt, data.get("IDFormat"));
				}
			}
			if (data.get("NumValLength") != null) {
				if (autoGenerateWorkerIDFlag.isSelected()) {
					element_Clear(workernumericValueLengthTxt);
					element_InputTextUsingActionClass(workernumericValueLengthTxt, data.get("NumValLength"));
				}
			}
			if (data.get("ZeroPadding") != null) {
				if (autoGenerateWorkerIDFlag.isSelected()) {
					Boolean zeroPadding1 = Boolean.parseBoolean(data.get("ZeroPadding"));
					if (zeroPadding1==true) {
						if (!workerzeroPaddingIsRequiredFlag.isSelected()) {
							element_Click(workerzeroPaddingIsRequiredFlag);
						}
					} else {
						if (workerzeroPaddingIsRequiredFlag.isSelected()) {
							element_Click(workerzeroPaddingIsRequiredFlag);
						}
					}
				}
			}
			if (data.get("IDRangePrefix") != null) {
					element_Clear(workeridRangePrefixTxt);
					element_InputTextUsingActionClass(workeridRangePrefixTxt, data.get("IDRangePrefix"));
			}
			if (data.get("FromIDRange") != null) {
				element_Clear(workeridRangeStartTxt);
				element_InputTextUsingActionClass(workeridRangeStartTxt, data.get("FromIDRange"));
			}
			if (data.get("ToIDRange") != null) {
				element_Clear(workeridRangeEndTxt);
				element_InputTextUsingActionClass(workeridRangeEndTxt, data.get("ToIDRange"));
			}
			
			saveButtonClickUsingJS();
			pageLoadWaitng();
			String validationmsg = validationMessage();
			validationMessageCloseButton.click();
			return validationmsg;
			
		}
		
	
	// Mayank
		public void setESSparameteres(Map<String, String> data) throws InterruptedException {
			pageLoadWaitng();
			element_Click(globalPolicyESS);
			Thread.sleep(1000);
			String specialFunction=data.get("SpecialFunction");
			String specialFunctionCheckbox=data.get("Checkbox");
			
			for(int i=0;i<specialFunctionLabel.size();i++ ) {
				if(specialFunctionLabel.get(i).getText().equalsIgnoreCase(specialFunction)) {
					WebElement ele1 = specialFunctionInput.get(i);
					Boolean SpcFunc = Boolean.parseBoolean(specialFunctionCheckbox);
					if (SpcFunc==true) {
						if (!ele1.isSelected()) {
							element_Click(ele1);
						}
					}
					else {
						if (ele1.isSelected()) {
							element_Click(ele1);
						}
					}
				}		
			}
		}

	// Mayank
	public void setReportsparameteres(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(globalPolicyReports);
		Thread.sleep(1000);
		if (data.get("ReportExportOutputInPDFOnly") != null) {
			Boolean reportExportOutputInPDFOnly = Boolean.parseBoolean(data.get("ReportExportOutputInPDFOnly"));
			if (reportExportOutputInPDFOnly == true) {
				if (!reportExportOutputInPDFOnlyFlag.isSelected()) {
					element_Click(reportExportOutputInPDFOnlyFlag);
				}
			} else {
				if (reportExportOutputInPDFOnlyFlag.isSelected()) {
					element_Click(reportExportOutputInPDFOnlyFlag);
				}
			}
		}
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		validationMessageCloseButton.click();

	}
	
	// Mayank
	public void setUserparameteres(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(globalPolicyUser);
		Thread.sleep(1000);
		if (data.get("LinkExpiryDays") != null) {
			element_Click(inviteUserPanel);
			Thread.sleep(1000);
			element_Clear(linkExpiryDaysTxt);
			element_InputTextUsingActionClass(linkExpiryDaysTxt, data.get("LinkExpiryDays"));
		}
		 //		Aagam
		if(data.get("DateofBirthMandatory") != null) {
			if(data.get("DateofBirthMandatory").equalsIgnoreCase("true")) {
				if(dobmandatoryflg.isSelected() == false) {
					element_Click(dobmandatoryflg);
				}
			}else{
				if(dobmandatoryflg.isSelected() == true) {
					element_Click(dobmandatoryflg);
				}
			}
		}
		if(data.get("BirthAge") != null) {
			if(minageyears.isEnabled()) {
				String[] userage=(data.get("BirthAge")).split(",");
				element_Clear(minageyears);
				element_Clear(minagemonths);
				element_InputTextUsingActionClass(minageyears,userage[0]);
				element_InputTextUsingActionClass(minagemonths,userage[1]);
			}
		}
		if(data.get("AadhaarNoMandatory") != null) {
			if(data.get("AadhaarNoMandatory").equalsIgnoreCase("true")) {
				if(aadharNoMandatoryFlg.isSelected() == false) {
					element_Click(aadharNoMandatoryFlg);
				}
			}else{
				if(aadharNoMandatoryFlg.isSelected() == true) {
					element_Click(aadharNoMandatoryFlg);
				}
			}
		}
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		validationMessageCloseButton.click();
	}
	
	
	//aagam
	public void setLoginparameteres(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(loginTab);
		Thread.sleep(3000);
		if (data.get("LoginViaActiveDirectory") != null) {
			if(data.get("LoginViaActiveDirectory").equalsIgnoreCase("true")) {
				if(activeDirectoryFlg.isSelected() == false) {
					element_Click(activeDirectoryFlg);
				}
			}else{
				if(activeDirectoryFlg.isSelected() == true) {
					element_Click(activeDirectoryFlg);
				}
			}
		}

		if (data.get("ActiveDirectoryServerAddress") != null) {
			if(ActiveDirectoryServerAddressIP.isEnabled()) {
				String[] ActiveIP=data.get("ActiveDirectoryServerAddress").split(",");
				element_Clear(ActiveDirectoryServerAddressIP);
				element_Clear(ActiveDirectoryServerAddressPort);
				System.out.println("String1="+ActiveIP[0]);
				System.out.println("String1="+ActiveIP[1]);
				element_Clear(ActiveDirectoryServerAddressDomainName);
				element_InputTextUsingActionClass(ActiveDirectoryServerAddressIP,ActiveIP[0]);
				element_InputTextUsingActionClass(ActiveDirectoryServerAddressPort,ActiveIP[1]);
				element_InputTextUsingActionClass(ActiveDirectoryServerAddressDomainName, data.get("ActiveDirectoryDomainName"));
			}
		}
		
		if (data.get("ActiveDirectoryDomainName") != null) {
			element_Clear(ActiveDirectoryServerAddressDomainName);
			element_InputTextUsingActionClass(ActiveDirectoryServerAddressDomainName, data.get("ActiveDirectoryDomainName"));
		}
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		validationMessageCloseButton.click();
	}
	
	// Created by Mayank
	public void passwordReuseForESS(boolean denyPwdReuse1, String reuseCount) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(globalPolicyPasswordPolicy);
		element_Click(globalPolicyPasswordPolicy);
		if (denyPwdReuse1 == true) {
			boolean checkflg = denyPasswordReuse.isSelected();
			if (checkflg != true) {
				element_Click(denyPasswordReuse);
			}
		} else {
			boolean checkflg = denyPasswordReuse.isSelected();
			if (checkflg == true) {
				element_Click(denyPasswordReuse);
			}
		}
		if (element_isSelected(denyPasswordReuse)) {
			element_Clear(reuseCountForESSUsers);
			element_InputTextUsingActionClass(reuseCountForESSUsers, reuseCount);
		}
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String valMsg = validationMessage();
		Assert.assertEquals("Saved Successfully", valMsg);
	}

	public void setJobCostingParameter(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(globalPolicyJobCosting);
		Thread.sleep(1000);
		if(data.get("MergeWithConsecutiveJob") != null) {
			element_DropDownSelectByvisibleText(mergeWithConsecutiveJobDD, data.get("MergeWithConsecutiveJob"));
		}
	}
	
	//Created by Aagam
	public void setOTPtimer(String otpmin) throws InterruptedException {
		pageLoadWaitng();
		element_Click(globalPolicyPasswordPolicy);
		Thread.sleep(1000);
		element_Clear(otpTimer);
		Thread.sleep(1000);
		element_InputTextUsingActionClass(otpTimer, otpmin);
		saveButtonClickUsingJS();
		pageLoadWaitng();
		String valMsg = validationMessage();
		Assert.assertEquals("Saved Successfully", valMsg);
	}
}
