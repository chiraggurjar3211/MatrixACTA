package PageObject.AdminPortal;


import java.util.ArrayList;
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
import PageObject.ShiftAndSchedule.WeekOffGroupPO;
import groovy.transform.Final;
import groovyjarjarantlr4.v4.parse.ANTLRParser.throwsSpec_return;

public class ApPasswordPolicyPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ApPasswordPolicyPO.class);

	public ApPasswordPolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements ////////////////////////////


	@FindBy(id = "enblPwdDenyReUseFlg")
	private WebElement denyPasswordReuse;

	@FindBy(id = "txtPwdReUseSys")
	private WebElement reuseCountForSAUsers;

	@FindBy(id = "txtPwdMinChars")
	private WebElement minRequiredChars;

	@FindBy(xpath = "//*[@name='PwdLevel']")
	private WebElement securityLevel;

	@FindBy(id = "txtMaxOTPGenretionCNT")
	private WebElement maxOTPGenretionCNT;

	@FindBy(id = "txtResetOTPAfterMin")
	private WebElement resetOTPAfterMin;

	@FindBy(id = "enblPwdLgnAttemFlg")
	private WebElement lockAccountforInvalidAttempts;

	@FindBy(id = "txtPwdLgnAttemCount")
	private WebElement maximumInvalidAttempts;

	@FindBy(id = "txtPwdUnlockTimer")
	private WebElement autoUnlockTimerMin;

	@FindBy(id = "enblPswSecPly")
	private WebElement passwordSecurityPolicy;

	@FindBy(id = "txtPasswordCHGDAY")
	private WebElement passwordResetPeriodDays;
	
	@FindBy(id = "PP_btnSave")
	private WebElement passwordPlcSaveBtn;
	
	//Functions
	//Mayank
	public void setPasswordPolicyParameters(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		// Password Security Policy
		if (data.get("PwdSecurityPolicy") != null) {
			boolean pwdSecurityPolicy = Boolean.parseBoolean(data.get("PwdSecurityPolicy"));
			if (pwdSecurityPolicy == true) {
				if (!passwordSecurityPolicy.isSelected()) {
					element_Click(passwordSecurityPolicy);
				}
			} else {
				if (passwordSecurityPolicy.isSelected()) {
					element_Click(passwordSecurityPolicy);
				}
			}
		}
		if (data.get("PwdResetPeriodDays") != null) {
			if (passwordSecurityPolicy.isSelected()) {
				Thread.sleep(500);
				element_Clear(passwordResetPeriodDays);
				Thread.sleep(500);
				element_InputText(passwordResetPeriodDays, data.get("PwdResetPeriodDays"));
			}
		}
		// Password Strength
		if (data.get("MinRequiredChar") != null) {
			element_Clear(minRequiredChars);
			element_InputText(minRequiredChars, data.get("MinRequiredChar"));
		}
		if (data.get("SecurityLvl") != null) {
			element_DropDownSelectByvisibleText(securityLevel, data.get("SecurityLvl"));
		}
		// Lock Account for Invalid Attempts
		if (data.get("LockAcForInVldAtmpts") != null) {
			boolean lockAcForInVldAtmpts = Boolean.parseBoolean(data.get("LockAcForInVldAtmpts"));
			if (lockAcForInVldAtmpts == true) {
				if (!lockAccountforInvalidAttempts.isSelected()) {
					element_Click(lockAccountforInvalidAttempts);
				}
			} else {
				if (lockAccountforInvalidAttempts.isSelected()) {
					element_Click(lockAccountforInvalidAttempts);
				}
			}
		}
		if (data.get("MaxInVldAtmpts") != null) {
			if (lockAccountforInvalidAttempts.isSelected()) {
				element_Clear(maximumInvalidAttempts);
				element_InputText(maximumInvalidAttempts, data.get("MaxInVldAtmpts"));
			}
		}
		if (data.get("AutoUnlcTime") != null) {
			if (lockAccountforInvalidAttempts.isSelected()) {
				element_Clear(autoUnlockTimerMin);
				element_InputText(autoUnlockTimerMin, data.get("AutoUnlcTime"));
			}
		}
		//OTP Generation
		if (data.get("MaxOTPgenAtmpts") != null) {
			element_Clear(maxOTPGenretionCNT);
			element_InputText(maxOTPGenretionCNT, data.get("MaxOTPgenAtmpts"));
		}
		if (data.get("ResendOTPafter") != null) {
			element_Clear(resetOTPAfterMin);
			element_InputText(resetOTPAfterMin, data.get("ResendOTPafter"));
		}
		// Deny Password Reuse
		if (data.get("DenyPwdReuse") != null) {
			boolean denyPwdReuse = Boolean.parseBoolean(data.get("DenyPwdReuse"));
			if (denyPwdReuse == true) {
				if (!denyPasswordReuse.isSelected()) {
					element_Click(denyPasswordReuse);
				}
			} else {
				if (denyPasswordReuse.isSelected()) {
					element_Click(denyPasswordReuse);
				}
			}
		}
		if (data.get("ReuseCnt") != null) {
			if (denyPasswordReuse.isSelected()) {
				element_Clear(reuseCountForSAUsers);
				element_InputText(reuseCountForSAUsers, data.get("ReuseCnt"));
			}
		}
		Thread.sleep(1000);
		element_Click(passwordPlcSaveBtn);
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}

}
