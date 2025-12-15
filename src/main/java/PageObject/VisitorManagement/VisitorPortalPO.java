package PageObject.VisitorManagement;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.By.ByXPath;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;
import groovyjarjarantlr4.v4.parse.ANTLRParser.throwsSpec_return;

public class VisitorPortalPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(VisitorPortalPO.class);

	public VisitorPortalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	//*****************************************************
	//VisitorPortal
	//*******************************************************
		@FindBy(id = "stationLocation")
		private WebElement stationLocationTxt;
		
		@FindBy(id = "icon-stn")
		private WebElement stationLocationPicklist;
		
		@FindBy(xpath = "//*[@class='form-control form-control-sm']")
		private WebElement stationLocationPicklistSearch;
		
		@FindBy(xpath = "//*[@id='stationList']/tbody/tr")
		private WebElement stationLocationPicklistSelection;
		
		@FindBy(id = "loginid")
		private WebElement uNameTxt;
		
		@FindBy(id = "txtPassword")
		private WebElement passwordTxt;
		
		@FindBy(id = "btnlogin")
		private WebElement loginBtn;
		
		@FindBy(id = "ValidationMsg")
		private List<WebElement> visitorPortalLoginValidation;
		
		@FindBy(id = "ValidationMsg")
		private WebElement visitorPortalValidation;
		
		@FindBy(id = "EmailOrMobile")
		private WebElement emailMobileTxt;
		
		@FindBy(id = "btnEmailOrMobile")
		private WebElement sendOTPbtnVisitorPortal;
		
		@FindBy(xpath = "//*[@key='SKIPTOLOGIN']")
		private WebElement skipToLoginBtn;
	
	@FindBy(id = "txtOTP")
	private WebElement otptxt;
	
	@FindBy(xpath = "//*[@id='txtMobileOTP' or @id='txtEmailOPT']")
	private WebElement emailtxtOTP;
	
	@FindBy(id = "btnVerifyOTP")
	private WebElement emailtxtVerifyBtn;
	
	@FindBy(xpath = "//*[@class='btn btn-cosec-login']")
	private WebElement loginButton;
	
	@FindBy(id = "msg")
	private List<WebElement> checkInvalidLoginValidation;

	@FindBy(id = "msg")
	private WebElement invalidLoginValidation;
	
	@FindBy(xpath = "//*[@id='visitor-profile']//*[@key='Profile']")
	private List<WebElement> checkProfileSection;

	@FindBy(xpath = "//*[@id='visitor-profile']//*[@key='Profile']")
	private WebElement profileSectionName;
	
	@FindBy(xpath = "//*[@default='Create Visit']")
	private List<WebElement> checkCreateVisitSection;

	@FindBy(xpath = "//*[@default='Create Visit']")
	private WebElement createVisitSectionName;
	
	@FindBy(xpath = "//*[@class='nav-container']")
	private List<WebElement> checkVisitSection;
	
	@FindBy(xpath = "//*[@id='NoVisit']")
	private List<WebElement> noVisitSection;
	
	@FindBy(xpath = "//*[@class='fa fa-times']")
	private WebElement cancelBtnInCreateVisitPopup;
	
	@FindBy(xpath = "//*[@class='fa fa-times']")
	private List<WebElement> cancelBtnInCreateVisitPopupCheck;
	
	@FindBy(id = "divVisitorLogin")
	private List<WebElement> sendOTPPopup;
	
	@FindBy(xpath = "//*[@class='modal-body modal-body-lg modal-body-content div-form tnc-popup-form-container']")
	private List<WebElement> checkFormSection;
	
	@FindBy(xpath = "//*[@class='modal-body modal-body-lg modal-body-content div-form tnc-popup-form-container']/*[@class=\"row form-group\"]")
	private List<WebElement> agreementBuilderCheck;
	
	@FindBy(id = "chkTnc")
	private List<WebElement> chkTncInAgreementCheck;
	
	@FindBy(id = "chkTnc")
	private WebElement chkTncInAgreement;
	
	@FindBy(xpath = "//*[@key='ACCEPT']")
	private WebElement agreementAcceptBtn;
	
	@FindBy(xpath = "//*[@key='ACCEPT']")
	private List<WebElement> agreementAcceptBtnCheck;
	
	@FindBy(xpath = "//*[@key='SUBMIT']")
	private WebElement agreementSubmitBtn;
	
	@FindBy(xpath = "//*[@key='SUBMIT']")
	private List<WebElement> agreementSubmitBtnCheck;
	
	@FindBy(xpath = "//*[@class='btn btn-next']//label[contains(text(),'NEXT')]")
	private WebElement agreementNextBtn;
	
	//*****************************************************
	//Create Visit
	//*****************************************************
	@FindBy(xpath = "//*[@class='btn btn-next' or @class='btn btn-add-visit2']")
	private WebElement addVisitBtn;
	
	@FindBy(id = "HostName")
	private WebElement hostname;
	
	@FindBy(id = "_HostName_")
	private WebElement hostnameValidation;
	
	@FindBy(id = "_VisitDate")
	private WebElement startDate;
	
	@FindBy(id = "__VisitDate_")
	private WebElement startDateValidation;
	
	@FindBy(id = "_VisitUntil")
	private WebElement endDate;
	
	@FindBy(id = "__VisitUntil_")
	private WebElement endDateValidation;
	
	@FindBy(id = "VisitStartTime")
	private WebElement startTimeTxt;
	
	@FindBy(id = "_VisitStartTime_")
	private WebElement startTimeValidation;
	
	@FindBy(id = "VisitEndTime")
	private WebElement endTimeTxt;
	
	@FindBy(id = "_VisitEndTime_")
	private WebElement endTimeValidation;
	
	@FindBy(id = "Purpose")
	private WebElement purposeTxt;
	
	@FindBy(id = "_Purpose_")
	private WebElement purposeValidation;
	
	@FindBy(xpath = "(//*[@value='DONE'])[1]")
	private WebElement doneBtnOnCreateVisit;
	
	@FindBy(xpath = "//*[@default='Create Visit']")
	private List<WebElement> createVisitPopup;
	
	@FindBy(xpath = "//*[@class='mx-input-theme label-bold lbl-popups']")
	private List<WebElement> errorMsgPopup;
	
	@FindBy(xpath = "//*[@class='mx-input-theme label-bold lbl-popups']")
	private WebElement errorMsg;
	
	//*****************************************************
	//Profile
	//*****************************************************
	@FindBy(id = "txtName")
	private WebElement nameTxt;
	
	@FindBy(id = "ORGANIZATIONName")
	private WebElement organizationTxt;
	
	@FindBy(id = "txtEmail")
	private WebElement emailTxt;
	
	@FindBy(xpath = "//*[@id='divBasic']//*[@key='NEXT']")
	private WebElement basicPageNextBtn;
	
	@FindBy(xpath = "//*[@id='divPersonal']//*[@key='NEXT']")
	private WebElement personalPageNextBtn;
	
	@FindBy(xpath = "//*[@id='divDocument']//*[@key='NEXT']")
	private WebElement documentPageNextBtn;
	
	@FindBy(xpath = "//*[@id='divAddress']//*[@key='DONE']")
	private WebElement addressPageDoneBtn;
	
	@FindBy(xpath = "//*[@class='success-msg']")
	private List<WebElement> otpverififcationmsgscheck;
	
	@FindBy(xpath = "//*[@class='success-msg']")
	private WebElement otpverififcationmsg;
	
	@FindBy(xpath = "//*[@id='VisitorProfPic']/span")
	private WebElement profilePhotoValidation;
	
	@FindBy(xpath = "//*[@class='fa fa-camera']")
	private WebElement profilePhotoCameraIcon;
	
	@FindBy(xpath = "//*[@title='Browse']")
	private WebElement browseIcon;
	
	@FindBy(xpath = "//*[@class='modal-content']//*[@default='DONE']")
	private WebElement doneBtnBrowsePopup; 
	
	@FindBy(xpath = "//*[@id='VisitorProfPic' and @defaultimage='Visitor']/div")
	private List<WebElement> profilePhotoDisplayedOrnot;
	
	@FindBy(xpath = "(//*[@id=\"divBasic\"]//*[@class=\"col-md-12 form-group col-sm-12\"])[4]//span")
	private WebElement emailValidation;
	
	@FindBy(xpath = "(//*[@id=\"divBasic\"]//*[@class=\"col-md-12 form-group col-sm-12\"])[4]")
	private List<WebElement> emailDisplayedOrnot;
	
	@FindBy(id = "txtMobileNo")
	private WebElement mobileTxt;
	
	@FindBy(xpath = "//*[@idlabel='ORGANIZATION']//span")
	private WebElement organizationValidation;
	
	@FindBy(xpath = "//*[@idlabel='ORGANIZATION']")
	private List<WebElement> organizationDisplayedOrnot;
	
	//*****************************************************
	//Visit
	//*****************************************************
	@FindBy(xpath = "//*[@id='ScheduledVisits']//*[@title='Check-In']")
	private WebElement checkInBtn;
	
	@FindBy(xpath = "//*[@id='ScheduledVisits']//*[@title='Check-Out']")
	private WebElement checkOutBtn;
	
	@FindBy(xpath = "//*[@id='ScheduledVisits']//*[@title='Check-Out']")
	private List<WebElement> checkOutBtns;
	
	@FindBy(xpath = "//*[@key='btnCheckIn']")
	private WebElement checkInDetailsPopupDoneBtn;
	
	@FindBy(xpath = "//*[contains(@id,'chkAnswer_2')]")
	private List<WebElement> ques1Options;
	
	@FindBy(xpath = "//*[@key='SUBMIT']")
	private WebElement formSubmitBtn;
	
	@FindBy(xpath = "//*[@key='SUBMIT']")
	private List<WebElement> formSubmitBtnCheck;
	
	@FindBy(xpath = "//*[@class=\"btn-next\"]")
	private WebElement formNextBtn;
	
	@FindBy(xpath = "//*[@key='Eligibility criteria achieved' or @key='Eligibility criteria not achieved']")
	private WebElement formResultMsg;
	
	@FindBy(xpath = "//*[@key='CONTINUE']")
	private WebElement formResultContinueBtn;
	
	@FindBy(xpath = "//*[@key='CANCEL']")
	private WebElement formResultCancelBtn; 
	
	@FindBy(xpath = "//*[@key='CONTINUE']")
	private List<WebElement> formResultContinueBtnCheck;
	
	@FindBy(xpath = "//*[@key='CANCEL']")
	private List<WebElement> formResultCancelBtnCheck; 
	
	@FindBy(xpath = "//*[@id='ScheduledVisits']//*[@class='row newcarddiv cardnormal']")
	private List<WebElement> scheduledVisits; 
	
	@FindBy(xpath = "//*[@id='ScheduledVisits']//*[@class='row newcarddiv cardnormal']//*[@class='card-lbl-wrap-text card-host-name']")
	private List<WebElement> scheduledVisitHostIds; 
	
	@FindBy(xpath = "//*[@id='ScheduledVisits']//*[@class='row newcarddiv cardnormal']//label[@class='cardapptext']")
	private List<WebElement> scheduledVisitStatuss; 
	
	@FindBy(xpath = "//*[@id='ScheduledVisits']//*[@class='row newcarddiv cardnormal']//label[@class='cardverdicttext']")
	private List<WebElement> scheduledVisitStatuss2; 
	
	@FindBy(xpath = "//*[@id='ScheduledVisits']//*[@class='row newcarddiv cardnormal']//*[@title='Check-In']")
	private List<WebElement> checkInBtns;
	
	@FindBy(xpath = "//*[@id='ScheduledVisits']//*[@class='row newcarddiv cardnormal']//*[@title='Check-Out']")
	private List<WebElement> checkOutBtnsinAllVisits; 
	
	@FindBy(xpath = "//*[@class='modal-content']//label[@class='mx-input-theme label-bold lbl-popups']")
	private WebElement validationMsg; 
	
	@FindBy(xpath = "//*[@class='modal-content']//label[@class='mx-input-theme label-bold lbl-popups']")
	private List<WebElement> validationMsgCheck; 
	
	@FindBy(id = "lnkPastVisits")
	private WebElement visitHistoryPanel;
	
	@FindBy(xpath = "//*[@id='PastVisits']//*[@class='row newcarddiv cardnormal']")
	private List<WebElement> visitHistoryVisits; 
	
	@FindBy(xpath = "//*[@id='PastVisits']//*[@class='row newcarddiv cardnormal']//*[@class='card-lbl-wrap-text card-host-name']")
	private List<WebElement> visitHistoryHostIds; 
	
	@FindBy(xpath = "//*[@id='PastVisits']//*[@class='row newcarddiv cardnormal']//label[@class='cardapptext']")
	private List<WebElement> visitHistoryStatuss; 
	
	@FindBy(xpath = "//*[@id='PastVisits']//*[@class='row newcarddiv cardnormal']//label[@class='cardverdicttext']")
	private List<WebElement> visitHistoryStatuss2;
	
	@FindBy(xpath = "//*[@key='Exit']")
	private WebElement exitBtn;
	
	@FindBy(xpath = "//*[@id='ScheduledVisits']//*[@class='row newcarddiv cardnormal']//*[@title='Accept']")
	private List<WebElement> visitAcceptBtns;
	
	@FindBy(xpath = "//*[@id='ScheduledVisits']//*[@class='row newcarddiv cardnormal']//*[@title='CANCEL']")
	private List<WebElement> visitCancelBtns;
	
	@FindBy(xpath = "//*[@title='Reload Page']")
	private WebElement refreshBtn;
	
	@FindBy(xpath = "//*[@value='Yes']")
	private WebElement confirmYesBtn;
	
	@FindBy(xpath = "//*[@value='Ok']")
	private WebElement popupOkBtn;
	
	@FindBy(id="dialog-message")
	private List<WebElement> warningPopUpList;
	
	@FindBy(xpath="//*[@type=\"button\" and text()=\"OK\"]")
	private WebElement oKButton;
	
	@FindBy(xpath="//*[@id=\"stationList\"]/tbody/tr/td[2]")
	private List<WebElement> stationNamesLis;
	
	//*************************CODE**********************************************
	
	//**************************************************************
	// Main Visitor Portal Login
	//**************************************************************
	public String loginInVisitorPortal(String stationlocation, String uname, String password) throws InterruptedException {
		String title = null;
		waitForElementVisible(stationLocationTxt);
//		if(warningPopUpList.size()>0) {
//			element_Click(oKButton);
//		}
		element_Click(stationLocationPicklist);
		Thread.sleep(1000);
		element_Click(stationLocationPicklistSearch);
		element_InputTextUsingActionClass(stationLocationPicklistSearch, stationlocation);
		Thread.sleep(1000);
		for(int x=0;x<stationNamesLis.size();x++) {
			if(stationNamesLis.get(x).getText().equalsIgnoreCase(stationlocation)) {
				stationNamesLis.get(x).click();
				break;
			}
		}
		Thread.sleep(1000);
		//element_Click(stationLocationPicklistSelection);
		Thread.sleep(1000);
		element_TextBoxToClickOnTab(stationLocationTxt);
		Thread.sleep(1000);
		element_Clear(uNameTxt);
		element_InputTextUsingActionClass(uNameTxt, uname);
		Thread.sleep(1000);
		element_Clear(passwordTxt);
		element_InputTextUsingActionClass(passwordTxt, password);
		Thread.sleep(1000);
		element_Click(loginBtn);
		Thread.sleep(3000);
		pageLoadWaitng();
		if (driver.getTitle().contains("Visitor Portal")) {
			logger.debug("Visitor Portal login successfully");
			title = driver.getTitle();
		}
		else if (visitorPortalLoginValidation.size() > 0) {
			title = element_GetText(visitorPortalValidation);
			logger.debug("Visitor Portal login is not successfully, Validation is "+title);
		}
		return title;
	}
	
	//**************************************************************
	// Login in visitor with SEND OTP
	//**************************************************************
	public String loginWithVisitorWithSendOTP(String mobileEmail) throws InterruptedException {
		String title = null;
		
		waitForElementVisible(emailMobileTxt);
		if (element_isEnabled(emailMobileTxt)) {
			element_Clear(emailMobileTxt);
			element_InputTextUsingActionClass(emailMobileTxt, mobileEmail);
		}
		Thread.sleep(1000);
		element_Click(sendOTPbtnVisitorPortal);
		Thread.sleep(2000);
		if (element_GetText(invalidLoginValidation).contains("OTP (valid for 3 mins) has been sent to your")) {
			title = "OTP (valid for 3 mins) has been sent to your";
			logger.debug("OTP send successfully");
		}
		else {
			title = element_GetText(invalidLoginValidation);
			logger.debug("validation generated = "+element_GetText(invalidLoginValidation));
		}
		return title;
	}
	
	
	// Created by Mayank
	//**************************************************************
	//*************OTP Verification*****************************
	//**************************************************************
		public String enterOTPandClickOnLoginInVisitorPortal(String OTP) throws InterruptedException {
			waitForElementVisible(otptxt);
			Thread.sleep(1000);
			String title = null;
			//int OTP1 = Integer.parseInt(OTP);
			element_Clear(otptxt);
			element_InputTextUsingActionClass(otptxt, OTP);
			element_TextBoxToClickOnTab(otptxt);
			Thread.sleep(2000);
			element_Click(loginButton); // Next Button
			Thread.sleep(1000);
			pageLoadWaitng();
			// Case1 : validation
			if (checkInvalidLoginValidation.size() > 0) {
				title = element_GetText(invalidLoginValidation);
				logger.debug("validation generated = "+title);
			}
			// Case2: Visitor Profile section
			else if(checkProfileSection.size() > 0){
				title = element_GetText(profileSectionName);
				logger.debug("Visitor Profile section opened");
			}
			// Case3: Profile already created then Visit created section or Create visit popup
			else if ((checkVisitSection.size()>0 || noVisitSection.size()>0) && checkFormSection.size()==0 ) {
				if(checkCreateVisitSection.size() > 0){
					title = element_GetText(createVisitSectionName);
					logger.debug("Visit create section opened");
					element_Click(cancelBtnInCreateVisitPopup);
					Thread.sleep(1000);
				}
				else {
					title = "Create Visit";
					logger.debug("Visits section opened");
				}
			}
			// Case4: Visitor Form
			else if (checkFormSection.size()>0) {
				title = "Visitor Form";
				logger.debug("Visitor Form opened");
			}
			return title;
		}
		
	// Created by Mayank
		//**************************************************************
		//***********Email OTP Verification***********************
		//**************************************************************
	public String enterEmailOTPandClickOnVerifyInVisitorPortal(String OTP) throws InterruptedException {
		waitForElementVisible(emailtxtOTP);
		Thread.sleep(1000);
		String title = null;
		//int OTP1 = Integer.parseInt(OTP);
		element_Clear(emailtxtOTP);
		element_InputTextUsingActionClass(emailtxtOTP, OTP);
		element_TextBoxToClickOnTab(emailtxtOTP);
		Thread.sleep(2000);
		element_Click(emailtxtVerifyBtn); // Next Button
		Thread.sleep(1000);
		pageLoadWaitng();
		// Case1: Profile already created then Visit created section or Create visit popup
		if ((checkVisitSection.size()>0 || noVisitSection.size()>0) && checkFormSection.size()==0 ) {
			if(checkCreateVisitSection.size() > 0){
				title = element_GetText(createVisitSectionName);
				logger.debug("Visit create section opened");
				if (cancelBtnInCreateVisitPopupCheck.size()>0) {
					element_Click(cancelBtnInCreateVisitPopup);
				}
				Thread.sleep(1000);
			}
			else {
				title = "Create Visit";
				logger.debug("Visits section opened");
			}
		}
		// Case2: Visitor Form
		else if (checkFormSection.size()>0) {
			title = "Visitor Form";
			logger.debug("Visitor Form opened");
		}
		else {
			title = element_GetText(otpverififcationmsg);
			logger.debug("OTP Verification page opened");
		}
		return title;
	}
	//given below Map use for custom alert 
	//use for blacklisted alert
	public static Map<String, String> visitData=new HashMap<String,String>();	
	//Mayank
	//**************************************************************
	//***********Create Visit******************************
	//**************************************************************
	public String createVisit(Map<String, String> data) throws InterruptedException {
		String val = null;
		if(checkCreateVisitSection.size() == 0){
			element_Click(addVisitBtn);
		}
		pageLoadWaitng();
		Thread.sleep(1000);
		waitForElementVisible(hostname);
		if (data.get("HostId") != null) {
			Thread.sleep(1000);
			element_Clear(hostname);
			Thread.sleep(2000);
			element_InputTextUsingActionClass(hostname, data.get("HostId"));
			Thread.sleep(2000);
			element_TextBoxToClickOnTab(hostname);
			Thread.sleep(2000);
		}
		visitData.put("HostName", element_getInputControlValue(hostname));
		if (data.get("VisitDate") != null) {
			String visitDate=staticDateOrPlusMinusFromCurrentDate(data.get("VisitDate"));
			element_cleardataUsingActionClass(startDate);
			Thread.sleep(1000);
			element_InputTextUsingActionClass(startDate, visitDate);
			Thread.sleep(1000);
		}
		visitData.put("startDate", element_getInputControlValue(startDate));
		if (data.get("UntilDate") != null) {
			String untilDate=staticDateOrPlusMinusFromCurrentDate(data.get("UntilDate"));
			element_cleardataUsingActionClass(endDate);
			Thread.sleep(1000);
			element_InputTextUsingActionClass(endDate, untilDate);
			Thread.sleep(1000);
		}
		visitData.put("endDate", element_getInputControlValue(endDate));
		if (data.get("StartTime") != null) {
			String startTime=staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("StartTime"));
			element_cleardataUsingActionClass(startTimeTxt);
			Thread.sleep(1000);
			element_InputText(startTimeTxt, startTime);
			Thread.sleep(500);
		}
		visitData.put("StartTime", element_getInputControlValue(startTimeTxt));
		if (data.get("EndTime") != null) {
			String endTime=staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("EndTime"));
			element_cleardataUsingActionClass(endTimeTxt);
			Thread.sleep(1000);
			element_InputText(endTimeTxt, endTime);
			Thread.sleep(500);
		}
		visitData.put("EndTime", element_getInputControlValue(endTimeTxt));
		if (data.get("purpose") != null) {
			String purpose = data.get("Purpose");
			element_InputTextUsingActionClass(purposeTxt, purpose);
			Thread.sleep(500);
		}
		Thread.sleep(1000);
		element_Click(doneBtnOnCreateVisit);
		pageLoadWaitng();
		if (createVisitPopup.size()==0) {
			if (errorMsgPopup.size()>0) {
				val = errorMsg.getText();
				logger.debug("Error message generated while create visit");
			}
			else {
				val="Visit Created";
				logger.debug("Visit created successfully");
			}
		}
		else {
			if (!hostnameValidation.getText().equalsIgnoreCase("")) {
				val = hostnameValidation.getText();
				logger.debug("Validation generated = "+val);
			}
			else if (!startDateValidation.getText().equalsIgnoreCase("")) {
				val = startDateValidation.getText();
				logger.debug("Validation generated = "+val);
			}
			else if (!endDateValidation.getText().equalsIgnoreCase("")) {
				val = endDateValidation.getText();
				logger.debug("Validation generated = "+val);
			}
			else if (!startTimeValidation.getText().equalsIgnoreCase("")) {
				val = startTimeValidation.getText();
				logger.debug("Validation generated = "+val);
			}
			else if (!endTimeValidation.getText().equalsIgnoreCase("")) {
				val = endTimeValidation.getText();
				logger.debug("Validation generated = "+val);
			}
			else if (!purposeValidation.getText().equalsIgnoreCase("")) {
				val = purposeValidation.getText();
				logger.debug("Validation generated = "+val);
			}
			else {
				val = "Failed";
				logger.debug("Validation generated = "+val);
			}
		}
		return val;	
	}
	
	//Mayank
	//**************************************************************
	//************Create Profile*********************************
	//**************************************************************
	public String createProfile(Map<String, String> data) throws InterruptedException {
		String val=null;
		logger.debug("Basic page opened");
		if (data.get("Name") != null) {
			element_InputTextUsingActionClass(nameTxt, data.get("Name"));
		}
		if (data.get("Organization") != null) {
			element_InputTextUsingActionClass(organizationTxt, data.get("Organization"));
			element_TextBoxToClickOnTab(organizationTxt);
		}
		if (data.get("Email") != null) {
			element_InputTextUsingActionClass(emailTxt, data.get("Email"));
		}
		if (data.get("Mobile") != null) {
			element_InputTextUsingActionClass(mobileTxt, data.get("Mobile"));
		}
		Thread.sleep(1000);
		element_Click(basicPageNextBtn);
		Thread.sleep(1000);
		logger.debug("Personal page opened");
		element_Click(personalPageNextBtn);
		Thread.sleep(1000);
		logger.debug("Document page opened");
		element_Click(documentPageNextBtn);
		Thread.sleep(1000);
		logger.debug("Address page opened");
		element_Click(addressPageDoneBtn);
		Thread.sleep(1000);
		// Case1: Email OTP verification 
		if (otpverififcationmsgscheck.size()>0) {
			if (element_GetText(otpverififcationmsg).contains("OTP (valid for 3 mins) has been sent to your")) {
				val = "OTP (valid for 3 mins) has been sent to your";
				logger.debug("OTP send successfully");
			}
			else {
				val = element_GetText(otpverififcationmsg);
				logger.debug("OTP verification validation generated = "+val);
			}
		}
		// Case2: Profile save validation 
		else if (checkInvalidLoginValidation.size() > 0) {
			val = element_GetText(invalidLoginValidation);
			logger.debug("Profile save verification generated = "+val);
		}
		// Case3: Profile already created then Visit created section or Create visit popup
		else if ((checkVisitSection.size()>0 || noVisitSection.size()>0) && checkFormSection.size()==0 ) {
			if(checkCreateVisitSection.size() > 0){
				val = element_GetText(createVisitSectionName);
				logger.debug("Create visit section opened");
				if (data.get("Name") != null) { //Mayank
					if (cancelBtnInCreateVisitPopupCheck.size()>0) {
						element_Click(cancelBtnInCreateVisitPopup);
					}
				}
				Thread.sleep(1000);
			}
			else {
				val = "Create Visit";
				logger.debug("Visits section opened");
			}
		}
		// Case4: Visitor Form
		else if (checkFormSection.size()>0) {
			val = "Visitor Form";
			logger.debug("Visitor form opened");
		}
		return val;	
	}
	
	//**************************************************************
	// Login in visitor with SKIP TO LOGIN
	//**************************************************************
		public String loginWithVisitorWithSkipToLogin(String mobileEmail) throws InterruptedException {
			String val = null;
			
			waitForElementVisible(emailMobileTxt);
			element_Clear(emailMobileTxt);
			element_InputTextUsingActionClass(emailMobileTxt, mobileEmail);
			Thread.sleep(1000);
			element_Click(skipToLoginBtn);
			pageLoadWaitng();
			// Case1 : validation
			if (checkInvalidLoginValidation.size() > 0) {
				val = element_GetText(invalidLoginValidation);    //Validation
				logger.debug("SKIP TO LOGIN page validation generated = "+val);
			}
			// Case2: Visitor Profile section
			else if(checkProfileSection.size() > 0){
				val = element_GetText(profileSectionName);     //Profile
				logger.debug("Visitor profile section opened");
			}
			// Case3: Profile already created then Visit created section or Create visit popup
			else if ((checkVisitSection.size()>0 || noVisitSection.size()>0) && checkFormSection.size()==0 ) {
				if(checkCreateVisitSection.size() > 0){
					val = element_GetText(createVisitSectionName);    // Create Visit
					element_Click(cancelBtnInCreateVisitPopup);
					logger.debug("Create visit section opened");
					Thread.sleep(1000);
				}
				else {
					val = "Create Visit";   //Visits
					logger.debug("Visits section opened");
				}
			}
			// Case4: Visitor Form
			else if (checkFormSection.size()>0) {
				val = "Visitor Form";
				logger.debug("Visitor form opened");
			}
			return val;
		}
	
	// Mayank
	// **************************************************************
	// **********CHeck In and Submit Form************************************
	// **************************************************************
	public String checkInVisitAndSubmitForm(Map<String, String> data) throws InterruptedException {
		String val = null;
		refreshVisitList();
		for (int i = 0; i < scheduledVisits.size(); i++) {
			String host = scheduledVisitHostIds.get(i).getText();
			if (host.equalsIgnoreCase(data.get("HostID"))) {
				logger.debug("Visit found with host id = "+data.get("HostID"));
				checkInBtns.get(i).click();
				Thread.sleep(1000);
				element_Click(checkInDetailsPopupDoneBtn);
				pageLoadWaitng();
				// Agreement builder
				if (chkTncInAgreementCheck.size()>0 || agreementAcceptBtnCheck.size()>0) {
					logger.debug("Agreement builder section opened at starting of form execution");
					if (chkTncInAgreementCheck.size()==1) {
						element_Click(chkTncInAgreement);
						element_Click(agreementNextBtn);
					}
					else {
						element_Click(agreementAcceptBtn);
					}
				}
				pageLoadWaitng();
				//Form Answers
				logger.debug("Form section opened");
				if (data.get("Answer1")  != null) {
					for (int j = 1; j <= ques1Options.size()+1; j++) {
						String k = String.valueOf(j);
						if (data.get("Answer1").contains(k)) {
							ques1Options.get(j-1).click();
							break;
						}
						Thread.sleep(2000);
					}
				}
				if (formSubmitBtnCheck.size() == 1) {
					element_Click(formSubmitBtn);
				} else {
					element_Click(formNextBtn);
				}
				pageLoadWaitng();
				// Agreement builder
				if (chkTncInAgreementCheck.size()>0 || agreementAcceptBtnCheck.size()>0) {
					logger.debug("Agreement builder section opened at ending of form execution");
					if (chkTncInAgreementCheck.size()==1) {
						element_Click(chkTncInAgreement);
						element_Click(agreementSubmitBtn);
					}
					else {
						element_Click(agreementAcceptBtn);
					}
				}
				pageLoadWaitng();
				val = element_GetText(formResultMsg);
				logger.debug("Form result is "+val);
				Thread.sleep(1000);
				Assert.assertEquals(val, data.get("validation"));
				if (val.equalsIgnoreCase("Eligibility criteria achieved")) {
					logger.debug("Form Eligibility criteria achieved");
					element_Click(formResultContinueBtn);
					pageLoadWaitng();
					String status1 = scheduledVisitStatuss.get(i).getText();
					String status2 = scheduledVisitStatuss2.get(i).getText();
					String finalstatus = (status1+" "+status2).trim();
					Assert.assertEquals(finalstatus, "Checked-In");
				}
				else if (val.equalsIgnoreCase("Eligibility criteria not achieved")) {
					logger.debug("Form Eligibility criteria not achieved");
					element_Click(formResultCancelBtn);
					pageLoadWaitng();
					String status1 = scheduledVisitStatuss.get(i).getText();
					String status2 = scheduledVisitStatuss2.get(i).getText();
					String finalstatus = (status1+" "+status2).trim();
					Assert.assertEquals(finalstatus, "Accepted");
				}
				Thread.sleep(1000);
				break;
			}
		}
		return val;
		
	}
	
	// **************************************************************
	// **********CHeck Out and Submit Form************************************
	// **************************************************************
	public String checkOutVisitAndSubmitForm(Map<String, String> data) throws InterruptedException {
		String val = null;
		refreshVisitList();
		for (int i = 0; i < scheduledVisits.size(); i++) {
			String host = scheduledVisitHostIds.get(i).getText();
			if (host.equalsIgnoreCase(data.get("HostID"))) {
				logger.debug("Visit found with host id = "+data.get("HostID"));
				checkOutBtnsinAllVisits.get(i).click();
				pageLoadWaitng();
				// Agreement builder
				if (chkTncInAgreementCheck.size()>0 || agreementAcceptBtnCheck.size()>0) {
					logger.debug("Agreement builder section opened at starting of form execution");
					if (chkTncInAgreementCheck.size()==1) {
						element_Click(chkTncInAgreement);
						element_Click(agreementNextBtn);
					}
					else {
						element_Click(agreementAcceptBtn);
					}
				}
				pageLoadWaitng();
				// Form Answers
				logger.debug("Form section opened");
				if (data.get("Answer1") != null) {
					for (int j = 1; j <= ques1Options.size() + 1; j++) {
						String k = String.valueOf(j);
						if (data.get("Answer1").contains(k)) {
							ques1Options.get(j - 1).click();
							break;
						}
						Thread.sleep(2000);
					}
				}
				if (formSubmitBtnCheck.size() == 1) {
					element_Click(formSubmitBtn);
				} else {
					element_Click(formNextBtn);
				}
				pageLoadWaitng();
				// Agreement builder
				if (chkTncInAgreementCheck.size()>0 || agreementAcceptBtnCheck.size()>0) {
					logger.debug("Agreement builder section opened at ending of form execution");
					if (chkTncInAgreementCheck.size()==1) {
						element_Click(chkTncInAgreement);
						element_Click(agreementSubmitBtn);
					}
					else {
						element_Click(agreementAcceptBtn);
					}
				}
				pageLoadWaitng();
				val = element_GetText(formResultMsg);
				Thread.sleep(1000);
				logger.debug("Form result is "+val);
				Assert.assertEquals(val, data.get("validation"));
				if (val.equalsIgnoreCase("Eligibility criteria achieved")) {
					logger.debug("Form Eligibility criteria achieved");
					element_Click(formResultContinueBtn);
					pageLoadWaitng();
					Assert.assertEquals(validationMsg.getText(), "Checked-Out successfully.");
					element_Click(popupOkBtn);
				} else if (val.equalsIgnoreCase("Eligibility criteria not achieved")) {
					logger.debug("Form Eligibility criteria not achieved");
					element_Click(formResultCancelBtn);
					pageLoadWaitng();
					String status1 = scheduledVisitStatuss.get(i).getText();
					String status2 = scheduledVisitStatuss2.get(i).getText();
					String finalstatus = (status1+" "+status2).trim();
					Assert.assertEquals(finalstatus, "Checked-In");
				}
				Thread.sleep(5000);
				
				break;
			}
		}
		return val;
	}
	
	// **************************************************************
	// Submit Form At Login
	// **************************************************************
	public String SubmitFormAtLogin(Map<String, String> data) throws InterruptedException {
		String val = null;
		// Agreement builder
		if (chkTncInAgreementCheck.size()>0 || agreementAcceptBtnCheck.size()>0) {
			logger.debug("Agreement builder section opened at starting of form execution");
			if (chkTncInAgreementCheck.size()==1) {
				element_Click(chkTncInAgreement);
				Thread.sleep(1000);
				element_Click(agreementNextBtn);
			}
			else {
				element_Click(agreementAcceptBtn);
			}
		}
		pageLoadWaitng();
		// Form Answers
		logger.debug("Form section opened");
		if (data.get("Answer1") != null) {
			for (int j = 1; j <= ques1Options.size() + 1; j++) {
				String k = String.valueOf(j);
				if (data.get("Answer1").contains(k)) {
					ques1Options.get(j - 1).click();
					break;
				}
				Thread.sleep(2000);
			}
		}
		if (formSubmitBtnCheck.size() == 1) {
			element_Click(formSubmitBtn);
		} else {
			element_Click(formNextBtn);
		}
		pageLoadWaitng();
		// Agreement builder
		if (chkTncInAgreementCheck.size()>0 || agreementAcceptBtnCheck.size()>0) {
			logger.debug("Agreement builder section opened at ending of form execution");
			if (chkTncInAgreementCheck.size() == 1) {
				element_Click(chkTncInAgreement);
				element_Click(agreementSubmitBtn);
			} else {
				element_Click(agreementAcceptBtn);
			}
		}
		pageLoadWaitng();
		Thread.sleep(1000);
		val = element_GetText(formResultMsg);
		Thread.sleep(1000);
		Assert.assertEquals(val, data.get("validation"));
		if (val.equalsIgnoreCase("Eligibility criteria achieved")) {
			logger.debug("Form Eligibility criteria achieved");
			element_Click(formResultContinueBtn);
		} else if (val.equalsIgnoreCase("Eligibility criteria not achieved")) {
			logger.debug("Form Eligibility criteria not achieved");
			element_Click(formResultCancelBtn);
		}
		Thread.sleep(5000);
		return val;
	}
	
	// Mayank
	//**************************************************************
	//************Visit Status***********************************
	//**************************************************************
	public void verifyVisitStatus(Map<String, String> data) throws InterruptedException {
		refreshVisitList();
		if (data.get("VisitPanel").equalsIgnoreCase("Scheduled Visits")) {
			logger.debug("Scheduled Visits section opened");
			for (int i = 0; i < scheduledVisits.size(); i++) {
				String host = scheduledVisitHostIds.get(i).getText();
				logger.debug("Visit host id = "+host);
				String status1 = null;
				String status2 = null;
				String finalstatus = null;
				if (host.equalsIgnoreCase(data.get("HostId"))) {
					logger.debug("Correct host id found = "+host);
					status1 = scheduledVisitStatuss.get(i).getText();
					status2 = scheduledVisitStatuss2.get(i).getText();
					finalstatus = (status1+" "+status2).trim();
					//System.out.println(finalstatus);
					Assert.assertEquals(finalstatus, data.get("Status"));
					break;
				}
			}
		}
		else if (data.get("VisitPanel").equalsIgnoreCase("Visit History")) {
			element_Click(visitHistoryPanel);
			logger.debug("Visit History section opened");
			Thread.sleep(1000);
			for (int i = 0; i < visitHistoryVisits.size(); i++) {
				String host = visitHistoryHostIds.get(i).getText();
				logger.debug("Visit host id = "+host);
				String status1 = null;
				String status2 = null;
				String finalstatus = null;
				if (host.equalsIgnoreCase(data.get("HostId"))) {
					logger.debug("Correct host id found = "+host);
					status1 = visitHistoryStatuss.get(i).getText();
					status2 = visitHistoryStatuss2.get(i).getText();
					finalstatus = (status1+" "+status2).trim();
					//System.out.println(finalstatus);
					Assert.assertEquals(finalstatus, data.get("Status"));
					break;
				}
			}
		}
		else {
			logger.debug("Define Visit panel is not proper");
		}
	}
	
	// Mayank
	//**************************************************************
	//*****************Check in visit*******************************
	//**************************************************************
	public void checkInVisit(Map<String, String> data) throws InterruptedException {
		refreshVisitList();
		ArrayList<String> allHosts = new ArrayList<>();
		String finalstatus = null;
		for (int i = 0; i < scheduledVisits.size(); i++) {
			String host = scheduledVisitHostIds.get(i).getText();
			logger.debug("Visit host id = "+host);
			allHosts.add(host);
			if (host.equalsIgnoreCase(data.get("HostId"))) {
				logger.debug("Correct host id found = "+host);
				Thread.sleep(1500);
				checkInBtns.get(i).click();
				Thread.sleep(1000);
				element_Click(checkInDetailsPopupDoneBtn);
				pageLoadWaitng();
				if (errorMsgPopup.size()>0) {
					finalstatus = errorMsg.getText();
					logger.debug("On checkIn error generated = "+finalstatus);
				}
				else {
				String status1 = scheduledVisitStatuss.get(i).getText();
				String status2 = scheduledVisitStatuss2.get(i).getText();
				finalstatus  = (status1+" "+status2).trim();
				logger.debug("On checkIn final status is "+finalstatus);
				}
				Assert.assertEquals(finalstatus, data.get("validation"));
				break;
			}
		}
		if (!allHosts.contains(data.get("HostId"))) {
			logger.debug("Any visit for this host is not found, Host id = "+data.get("HostId"));
			Assert.assertEquals("Any visit for this host is not found", "Any visit for this host should be found");
		}
	}
	
	// Mayank
	//**************************************************************
	//**************Check Out Visit***********************************
	//**************************************************************
	public void checkOutVisit(Map<String, String> data) throws InterruptedException {
		refreshVisitList();
		ArrayList<String> allHosts = new ArrayList<>();
		for (int i = 0; i < scheduledVisits.size(); i++) {
			String host = scheduledVisitHostIds.get(i).getText();
			logger.debug("Visit host id = "+host);
			allHosts.add(host);
			if (host.equalsIgnoreCase(data.get("HostId"))) {
				logger.debug("Correct host id found = "+host);
				checkOutBtnsinAllVisits.get(i).click();
				pageLoadWaitng();
				Assert.assertEquals(validationMsg.getText(), data.get("validation"));
				logger.debug("On checkOut message is "+validationMsg.getText());
				element_Click(popupOkBtn);
				break;
			}
		}
		if (!allHosts.contains(data.get("HostId"))) {
			logger.debug("Any visit for this host is not found, Host id = "+data.get("HostId"));
			Assert.assertEquals("Any visit for this host is not found", "Any visit for this host should be found");
		}
	}
	
	//**************************************************************
	//*************Visit Host***********************************
	//**************************************************************
	public void verifyVisitHost(Map<String, String> data) throws InterruptedException {
		refreshVisitList();
		String host = scheduledVisitHostIds.get(0).getText();
		logger.debug("Visit host id = "+host);
		Assert.assertEquals(host, data.get("HostId"));
	}
	
	//**********************************************************
	// Visitor Profile Fields Verification
	//**************************************************************
	public void verifyVisitorProfileFields(Map<String, String> data) throws InterruptedException, IOException {
		if (data.get("FieldName").equalsIgnoreCase("Visitor Photo")) {
			logger.debug("Start verification of Field Name = Visitor Photo");
			// Mandatory
			if (data.get("Mandatory") != null) {
				logger.debug("Start verification of Field Name = Visitor Photo & Mandatory");
				boolean mandatory1 = Boolean.parseBoolean(data.get("Mandatory"));
				Thread.sleep(1000);
				element_Click(basicPageNextBtn);
				String photoVal = profilePhotoValidation.getText();
				System.out.println(photoVal);
				if (mandatory1 == true) {
					Assert.assertEquals(photoVal, "Photo must be entered");
					Thread.sleep(1000);
					element_Click(profilePhotoCameraIcon);
					Thread.sleep(2000);
					driver.switchTo().alert().accept();
					element_Click(browseIcon);
					Thread.sleep(2000);
					String uploadAutoITFilePath = System.getProperty("user.dir")
							+ "\\src\\test\\resources\\AutoITFile\\Fileupload.exe";
					Runtime.getRuntime().exec(uploadAutoITFilePath);
					Thread.sleep(2000);
					element_Click(doneBtnBrowsePopup);
					Thread.sleep(2000);
				} else {
					Assert.assertEquals(photoVal, "");
				}
			}
			// Active
			if (data.get("Active") != null) {
				logger.debug("Start verification of Field Name = Visitor Photo & Active");
				boolean active1 = Boolean.parseBoolean(data.get("Active"));
				if (active1==true) {
					Assert.assertEquals(profilePhotoDisplayedOrnot.size(), 1);
				}
				else {
					Assert.assertEquals(profilePhotoDisplayedOrnot.size(), 0);
				}
			}
		}
		// Email ID
		if (data.get("FieldName").equalsIgnoreCase("Email ID")) {
			logger.debug("Start verification of Field Name = Email ID");
			// Mandatory
			if (data.get("Mandatory") != null) {
				logger.debug("Start verification of Field Name = Email ID & Mandatory");
				boolean mandatory1 = Boolean.parseBoolean(data.get("Mandatory"));
				Thread.sleep(1000);
				element_Clear(emailTxt);
				element_Clear(mobileTxt);
				Thread.sleep(1000);
				element_Click(basicPageNextBtn);
				String emailVal = emailValidation.getText();
				System.out.println(emailVal);
				if (mandatory1 == true) {
					Assert.assertEquals(emailVal, "Email must be entered");
					Thread.sleep(1000);
					element_InputTextUsingActionClass(emailTxt, "test@visitor.com");
					Thread.sleep(1000);
				} else {
					
					Assert.assertEquals(emailVal, "");
				}
			}
			// Active
			if (data.get("Active") != null) {
				logger.debug("Start verification of Field Name = Email ID & Active");
				boolean active1 = Boolean.parseBoolean(data.get("Active"));
				if (active1==true) {
					Assert.assertEquals(emailDisplayedOrnot.size(), 1);
				}
				else {
					Assert.assertEquals(emailDisplayedOrnot.size(), 0);
				}
			}
		}
		// Organization
		if (data.get("FieldName").equalsIgnoreCase("Organization")) {
			logger.debug("Start verification of Field Name = Organization");
			// Mandatory
			if (data.get("Mandatory") != null) {
				logger.debug("Start verification of Field Name = Organization & Mandatory");
				boolean mandatory1 = Boolean.parseBoolean(data.get("Mandatory"));
				Thread.sleep(1000);
				element_Clear(organizationTxt);
				element_Clear(mobileTxt);
				Thread.sleep(1000);
				element_Click(basicPageNextBtn);
				String orgVal = organizationValidation.getText();
				System.out.println(orgVal);
				if (mandatory1 == true) {
					Assert.assertEquals(orgVal, "Visitor Organization should not be blank");
					Thread.sleep(1000);
					element_InputTextUsingActionClass(organizationTxt, "matrix");
					Thread.sleep(1000);
				} else {

					Assert.assertEquals(orgVal, "");
				}
			}
			// Active
			if (data.get("Active") != null) {
				logger.debug("Start verification of Field Name = Organization & Active");
				boolean active1 = Boolean.parseBoolean(data.get("Active"));
				if (active1 == true) {
					Assert.assertEquals(organizationDisplayedOrnot.size(), 1);
				} else {
					Assert.assertEquals(organizationDisplayedOrnot.size(), 0);
				}
			}
		}
	}
	
	//***********************************************************
	//VISIT FIELDS VERIFICATION
	//*********************************************************
	public void verifyVisitFields(List<Map<String, String>> data) throws InterruptedException {
		waitForElementVisible(addVisitBtn);
		element_Click(addVisitBtn);
		Thread.sleep(2000);
		waitForElementVisible(hostname);
		for (int i = 0; i < data.size(); i++) {
		// Host ID
		if (data.get(i).get("FieldName").equalsIgnoreCase("Host ID")) {
			logger.debug("Start verification of Field Name = Host ID");
			// Mandatory
			if (data.get(i).get("Mandatory") != null) {
				logger.debug("Start verification of Field Name = Host ID & Mandatory");
				boolean mandatory1 = Boolean.parseBoolean(data.get(i).get("Mandatory"));
				Thread.sleep(1000);
				element_Click(hostname);
				Thread.sleep(1000);
				element_Clear(hostname);
				Thread.sleep(1000);
				element_Click(doneBtnOnCreateVisit);
				Thread.sleep(3000);
				String hostIDVal = hostnameValidation.getText();
				System.out.println(hostIDVal);
				if (mandatory1 == true) {
					Assert.assertEquals(hostIDVal, "Host must be selected");
					Thread.sleep(1000);
					element_InputTextUsingActionClass(hostname, "VM_41");
					Thread.sleep(1000);
					element_TextBoxToClickOnTab(hostname);
					Thread.sleep(1000);
				} else {

					Assert.assertEquals(hostIDVal, "");
				}
			}
		}
		// StartDate
		if (data.get(i).get("FieldName").equalsIgnoreCase("Start Date")) {
			logger.debug("Start verification of Field Name = Start Date");
			// Mandatory
			if (data.get(i).get("Mandatory") != null) {
				logger.debug("Start verification of Field Name = Start Date & Mandatory");
				boolean mandatory1 = Boolean.parseBoolean(data.get(i).get("Mandatory"));
				Thread.sleep(1000);
				element_Clear(startDate);
				Thread.sleep(1000);
				element_Click(doneBtnOnCreateVisit);
				Thread.sleep(3000);
				String val = startDateValidation.getText();
				System.out.println(val);
				if (mandatory1 == true) {
					Assert.assertEquals(val, "Visit Start Date must be entered");
					Thread.sleep(1000);
					String date = staticDateOrPlusMinusFromCurrentDate("0");
					element_InputTextUsingActionClass(startDate, date);
					Thread.sleep(1000);
				} else {

					Assert.assertEquals(val, "");
				}
			}
		}
		// End Date
		if (data.get(i).get("FieldName").equalsIgnoreCase("End Date")) {
			logger.debug("Start verification of Field Name = End Date");
			// Mandatory
			if (data.get(i).get("Mandatory") != null) {
				logger.debug("Start verification of Field Name = End Date & Mandatory");
				boolean mandatory1 = Boolean.parseBoolean(data.get(i).get("Mandatory"));
				Thread.sleep(1000);
				element_Clear(endDate);
				Thread.sleep(1000);
				element_Click(doneBtnOnCreateVisit);
				Thread.sleep(3000);
				String val = endDateValidation.getText();
				System.out.println(val);
				if (mandatory1 == true) {
					Assert.assertEquals(val, "Visit Until Date must be entered");
					Thread.sleep(1000);
					String date = staticDateOrPlusMinusFromCurrentDate("0");
					element_InputTextUsingActionClass(endDate, date);
					Thread.sleep(1000);
				} else {

					Assert.assertEquals(val, "");
				}
			}
		}
		// Start Time
		if (data.get(i).get("FieldName").equalsIgnoreCase("Start Time")) {
			logger.debug("Start verification of Field Name = Start Time");
			// Mandatory
			if (data.get(i).get("Mandatory") != null) {
				logger.debug("Start verification of Field Name = Start Time & Mandatory");
				boolean mandatory1 = Boolean.parseBoolean(data.get(i).get("Mandatory"));
				Thread.sleep(1000);
				element_Click(startTimeTxt);
				element_cleardataUsingActionClass(startTimeTxt);
				Thread.sleep(1000);
				element_Click(doneBtnOnCreateVisit);
				Thread.sleep(3000);
				String val = startTimeValidation.getText();
				System.out.println(val);
				if (mandatory1 == true) {
					Assert.assertEquals(val, "Visit Start Time must be entered");
					Thread.sleep(1000);
					String time = staticTimeOrPlusMinusMinutesFromCurrentTime("5");
					element_InputText(startTimeTxt, time);
					Thread.sleep(1000);
				} else {

					Assert.assertEquals(val, "");
				}
			}
		}
		// End Time
		if (data.get(i).get("FieldName").equalsIgnoreCase("End Time")) {
			logger.debug("Start verification of Field Name = End Time");
			// Mandatory
			if (data.get(i).get("Mandatory") != null) {
				logger.debug("Start verification of Field Name = End Time & Mandatory");
				boolean mandatory1 = Boolean.parseBoolean(data.get(i).get("Mandatory"));
				Thread.sleep(1000);
				element_Click(endTimeTxt);
				element_cleardataUsingActionClass(endTimeTxt);
				Thread.sleep(1000);
				element_Click(doneBtnOnCreateVisit);
				Thread.sleep(3000);
				String val = endTimeValidation.getText();
				System.out.println(val);
				if (mandatory1 == true) {
					Assert.assertEquals(val, "Visit End Time must be entered");
					Thread.sleep(1000);
					String time = staticTimeOrPlusMinusMinutesFromCurrentTime("10");
					element_InputText(endTimeTxt, time);
					Thread.sleep(1000);
				} else {

					Assert.assertEquals(val, "");
				}
			}
		}
		Thread.sleep(1500);
		// Visit Purpose
		if (data.get(i).get("FieldName").equalsIgnoreCase("Visit Purpose")) {
			logger.debug("Start verification of Field Name = Visit Purpose");
			// Mandatory
			if (data.get(i).get("Mandatory") != null) {
				logger.debug("Start verification of Field Name = Visit Purpose & Mandatory");
				boolean mandatory1 = Boolean.parseBoolean(data.get(i).get("Mandatory"));
				Thread.sleep(1000);
				element_Clear(purposeTxt);
				Thread.sleep(1000);
				element_Click(doneBtnOnCreateVisit);
				Thread.sleep(3000);
				String val = purposeValidation.getText();
				System.out.println(val);
				if (mandatory1 == true) {
					Assert.assertEquals(val, "Visit Purpose must be entered.");
					Thread.sleep(1000);
					element_InputTextUsingActionClass(purposeTxt, "visit");
					Thread.sleep(1000);
				} else {

					Assert.assertEquals(val, "");
				}
			}
		}
		}
	}
	
	//*****************************************************************
	// Exit from visitor login
	//***************************************************************
	public void exitFromVisitorLogin() throws InterruptedException {
		element_Click(exitBtn);
		Thread.sleep(2000);
		String val = null;
		if (sendOTPPopup.size()>0) {
			val = "Exit Successfully";
		}
		else {
			val = "Exit is not Successfully";
		}
		logger.debug(val);
		Assert.assertEquals(val, "Exit Successfully");
	}
	
	//**************************************************************
	// visitor Acceptance
	// **************************************************************
	public void visitorAcceptance(Map<String, String> data) throws InterruptedException {
		refreshVisitList();
		for (int i = 0; i < scheduledVisits.size(); i++) {
			String host = scheduledVisitHostIds.get(i).getText();
			logger.debug("Host id found = "+host);
			if (host.equalsIgnoreCase(data.get("HostID"))) {
				logger.debug("Correct host id found = "+host);
				if (data.get("Approval").equalsIgnoreCase("Approve")) {
					visitAcceptBtns.get(i).click();
				}
				else {
					visitCancelBtns.get(i).click();
					Thread.sleep(2000);
					element_Click(confirmYesBtn);
				}
				pageLoadWaitng();
//				String status1 = scheduledVisitStatuss.get(i).getText();
//				String status2 = scheduledVisitStatuss2.get(i).getText();
//				String finalstatus = (status1 + " " + status2).trim();
//				Assert.assertNotEquals(finalstatus, "Pending (Initiated by Host)");
				break;
			}
		}
		ArrayList<String> hosts = new ArrayList<>();
		for (int i = 0; i < scheduledVisits.size(); i++) {
			String host = scheduledVisitHostIds.get(i).getText();
			logger.debug("Host id found for status verification = "+host);
			String status1 = null;
			String status2 = null;
			String finalstatus = null;
			hosts.add(host);
			if (host.equalsIgnoreCase(data.get("HostId"))) {
				logger.debug("Correct Host id found for status verification = "+host);
				status1 = scheduledVisitStatuss.get(i).getText();
				status2 = scheduledVisitStatuss2.get(i).getText();
				finalstatus = (status1+" "+status2).trim();
				Assert.assertNotEquals(finalstatus, "Pending (Initiated by Host)");
				break;
			}
		}
		if (!hosts.contains(data.get("HostId"))) {
			element_Click(visitHistoryPanel);
			logger.debug("Visit history panel opened for status verification");
			Thread.sleep(1000);
			for (int i = 0; i < visitHistoryVisits.size(); i++) {
				String host = visitHistoryHostIds.get(i).getText();
				logger.debug("Host id found for status verification = "+host);
				String status1 = null;
				String status2 = null;
				String finalstatus = null;
				if (host.equalsIgnoreCase(data.get("HostId"))) {
					logger.debug("Correct Host id found for status verification = "+host);
					status1 = visitHistoryStatuss.get(i).getText();
					status2 = visitHistoryStatuss2.get(i).getText();
					finalstatus = (status1+" "+status2).trim();
					//System.out.println(finalstatus);
					Assert.assertEquals(finalstatus, "Cancelled (by You)");
					break;
				}
			}
		}
	}
	
	//**************************************************************
	// Visit page refresh
	// **************************************************************
	public void refreshVisitList() throws InterruptedException {
		element_Click(refreshBtn);
		logger.debug("Visit page refreshed");
		Thread.sleep(2000);
	}
	
	//**************************************************************
	// Verify Login Successfully Or Not
	//**************************************************************
	public void verifyLoginSuccessfullyOrNot(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		String val2 = null;
		if ((checkVisitSection.size()>0 || noVisitSection.size()>0)) {
			if(checkCreateVisitSection.size() > 0){
				val = element_GetText(createVisitSectionName);    // Create Visit
				logger.debug("Create visit section opened");
				if (cancelBtnInCreateVisitPopupCheck.size()>0) {
					element_Click(cancelBtnInCreateVisitPopup);
				}
				Thread.sleep(1000);
			}
			else {
				val = "Create Visit";   //Visits
				logger.debug("Visits section opened");
			}
			val2 = "YES";
		}
		else if (sendOTPPopup.size()>0) {
			logger.debug("Send OTP page (Visitor Login Screen) opened");
			val = "Visitor Login Screen";
			val2 = "NO";
		}
		String expected = data.get("Login").toUpperCase();
		Assert.assertEquals(val2, expected);
	}
	
	//**************************************************************
	// Verify CheckIn Successfully Or Not
	// **************************************************************
	public void verifyCheckInSuccessfullyOrNot(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		for (int i = 0; i < scheduledVisits.size(); i++) {
			String host = scheduledVisitHostIds.get(i).getText();
			logger.debug("host found = "+host);
			if (host.equalsIgnoreCase(data.get("HostId"))) {
				logger.debug("Correct host found = "+host);
				String status1 = scheduledVisitStatuss.get(i).getText();
				String status2 = scheduledVisitStatuss2.get(i).getText();
				String finalstatus = (status1+" "+status2).trim();
				if (finalstatus.equalsIgnoreCase("Checked-In")) {
					logger.debug("Visit Checked-In successfully");
					val = "YES";
				}
				else {
					logger.debug("Visit is not Checked-In successfully");
					val = "NO";
				}
				String expected = data.get("CheckIn").toUpperCase();
				Assert.assertEquals(val, expected);
				break;
			}
		}
	}
	
	//**************************************************************
	// Verify CheckOut Successfully Or Not
	// **************************************************************
	public void verifyCheckOutSuccessfullyOrNot(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		element_Click(visitHistoryPanel);
		Thread.sleep(1000);
		ArrayList<String> hosts = new ArrayList<>();
		for (int i = 0; i < visitHistoryVisits.size(); i++) {
			String host = visitHistoryHostIds.get(i).getText();
			logger.debug("Host id found = "+host);
			hosts.add(host);
			if (host.equalsIgnoreCase(data.get("HostId"))) {
				logger.debug("Correct Host id found = "+host);
				String status1 = visitHistoryStatuss.get(i).getText();
				String status2 = visitHistoryStatuss2.get(i).getText();
				String finalstatus = (status1+" "+status2).trim();
				if (finalstatus.equalsIgnoreCase("Checked-Out")) {
					logger.debug("Visit Checked-Out successfully");
					val = "YES";
				}
				else {
					logger.debug("Visit is not Checked-Out successfully");
					val = "NO";
				}
				break;
			}
		}
		if (!hosts.contains(data.get("HostId"))) {
			logger.debug("Correct host id is not found so Visit is not Checked-Out successfully");
			val = "NO";
		}
		String expected = data.get("CheckOut").toUpperCase();
		Assert.assertEquals(val, expected);
	}
	
	
	
	// Bulk Data
	public void bulkVisitorLoginWithSkipToLogin(int mobileFrom, int mobileTo) throws InterruptedException {
		for (int i = mobileFrom; i <= mobileTo; i++) {
			waitForElementVisible(emailMobileTxt);
			element_Clear(emailMobileTxt);
			String mobileFrom1 = String.valueOf(i);
			element_InputTextUsingActionClass(emailMobileTxt, mobileFrom1);
			Thread.sleep(1000);
			element_Click(skipToLoginBtn);
			Thread.sleep(1000);
			logger.info(mobileFrom1+" --- Done");
		}
		
		
	}
}
