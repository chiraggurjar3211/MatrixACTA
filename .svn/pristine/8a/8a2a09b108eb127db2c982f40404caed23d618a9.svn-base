package PageObject;

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
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class LoginPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(LoginPO.class);

	public LoginPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@id ='loginid']")
	private WebElement loginid;

	@FindBy(id = "pwd")
	private WebElement password;

	@FindBy(id = "btnlogin")
	private WebElement loginButton;

	@FindBy(id = "btnlogin")
	private List<WebElement> loginButtoncheck;

	@FindBy(id = "lblSendOTPMsgESS")
	private WebElement otpMsgESS;

	@FindBy(id = "lblSendOTPMsgESS")
	private List<WebElement> checkOTPMsgESS;

	@FindBy(id = "msg")
	private List<WebElement> checkInvalidLoginValidation;

	@FindBy(id = "msg")
	private WebElement invalidLoginValidation;

	@FindBy(id = "btnSendOTPESS")
	private WebElement sendOTPButton;

	@FindBy(id = "txtVerifyOTP")
	private WebElement textVerifyOTP;

	@FindBy(id = "btnVerifyOTP")
	private WebElement verifyButton;

	@FindBy(id = "lblSetPwd")
	private WebElement setPasswordHeader;

	@FindBy(id = "btnToogleOTP")
	private WebElement loginWithOTPtoggle;

	@FindBy(id = "IconPwd")
	private WebElement resendOTP;

	@FindBy(id = "toogle-switch")
	private List<WebElement> pwdOTPtogglecheck;

	// ******************************************************************************
	// ************************Set password Page************************
	// ******************************************************************************
	@FindBy(id = "txtNewPassword")
	private WebElement newPassword;

	@FindBy(id = "txtConfirmNewPassword")
	private WebElement confirmNewPassword;

	@FindBy(id = "lblSetPwd")
	private List<WebElement> setPwdLabelcheck;

	@FindBy(id = "btnOk")
	private WebElement setButton;
	// ******************************************************************************
	// ************************System Admin Set Password
	// Page************************
	// ******************************************************************************
	@FindBy(xpath = "lblResetPwd")
	private WebElement welcomeSystemAdminLabel;

	@FindBy(id = "lblResetPwd")
	private List<WebElement> checkWelcomeSystemAdminLabel;

	@FindBy(id = "txtNewPassword")
	private WebElement saNewPassword;

	@FindBy(id = "txtConfirmNewPassword")
	private WebElement saConfirmPassword;

	@FindBy(id = "txtSecurityQue")
	private WebElement saSecurityQuestion;

	@FindBy(id = "txtSecurityQue")
	private List<WebElement> saSecurityQuestionSize;

	@FindBy(id = "txtSecurityAns")
	private WebElement saSecurityQuestionAns;

	@FindBy(id = "chkTerms")
	private WebElement saAgreeSetPwd;

	@FindBy(xpath = "//*[@id='chkTerms' and @onchange='EnableBtn()']")
	private List<WebElement> saAgreeSetPwdsize;

	@FindBy(id = "SAReset")
	private WebElement saSetPwdButton;

	// Forget password
	@FindBy(xpath = "//*[@class='forgot-password-login']")
	private WebElement forgetPasswordLink;

	@FindBy(id = "lblForgetPwd")
	private List<WebElement> forgetPwdLabelcheck;

	@FindBy(id = "rbtnSendOTP")
	private WebElement forgetPwdSendOTPradioBtn;

	@FindBy(id = "rbtnSecQuestion")
	private WebElement forgetPwdSecurityAnsRadioBtn;

	@FindBy(xpath = "//button[contains(text(),'Send') or contains(text(),'Next') or contains(text(),'NEXT') or contains(text(),'Verify')]")
	private WebElement sendNextVerifyBtn;

	@FindBy(id = "lblSecurityQue")
	private List<WebElement> securityQuestionLabelcheck;

	@FindBy(id = "VerifytxtSecurityAns")
	private WebElement securityAnswerTxt;
	

	@FindBy(xpath = "//*[@default=\"Logout\" or text()=\"Tenants\" or text()=\"Profile\"]")
	public List<WebElement> logOutsize;

	// ******************************************************************************
	// Last changes by Mayank (Put get title condition first so if login
	// successfully then more time is not taken)
	public String credential(String uname, String psw) throws Exception {
		String title = null;
		element_Clear(loginid);
		element_InputText(loginid, uname);

		if (psw != null) {
			element_Clear(password);
			element_InputText(password, psw);
		}
		element_Click(loginButton);
	
//		Thread.sleep(2000);
//		pageLoadWaitng();
		if (logOutsize.size() > 0) {
				if (driver.getTitle().contains("Welcome")) {
				title = driver.getTitle();
	
			}
		} else if (checkOTPMsgESS.size() > 0) {
			title = element_GetText(otpMsgESS);
		} else if (checkWelcomeSystemAdminLabel.size() > 0) {
			element_InputText(saNewPassword, psw);
			element_InputText(saConfirmPassword, psw);
			if (saSecurityQuestionSize.size() > 0) {
				element_InputText(saSecurityQuestion, psw);
				element_InputText(saSecurityQuestionAns, psw);

				Thread.sleep(1000);
				if (saAgreeSetPwdsize.size() > 0) // Change by Mayank - For CENTRA & VYOM
				{
					element_Click(saAgreeSetPwd);
				}
			}
			element_Click(saSetPwdButton);
			Thread.sleep(1500);
			title = element_GetText(loginButton);
		} else if (checkInvalidLoginValidation.size() > 0) {
			System.out.println("Value of :" + checkInvalidLoginValidation.get(0).getText());
			Thread.sleep(1000);
			title = checkInvalidLoginValidation.get(0).getText();
			if (title.isEmpty()) {
				title = element_GetText(setPasswordHeader);
			}
		}
		return title;
	}

	public void clickOnSendButton() {
		element_Click(sendOTPButton);

	}

	public String enterOTP(String otp) throws InterruptedException {
		String validation = null;
		logger.info(otp);
		element_InputDataUsingJS(textVerifyOTP, otp);
		// element_InputText(textVerifyOTP, otp);
		element_Click(verifyButton);
		Thread.sleep(1500);
		if (element_AlertIsPresent() == true) {
			Thread.sleep(1000);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
			validation = element_GetText(setPasswordHeader);
		} else {
			validation = element_GetText(invalidLoginValidation);
		}
		return validation;
	}

	public String setPassword(String newPass, String conNewPass) throws InterruptedException {
		element_InputText(newPassword, newPass);
		element_InputText(confirmNewPassword, conNewPass);
		element_Click(setButton);
		String loginTextValue = element_GetText(loginButton);
		return loginTextValue;
	}

	// Created by Mayank
	public String setUserPassword(String userID, String newPwd, String cnfmPwd) throws InterruptedException {
		String valmsg = null;
		element_Clear(loginid);
		element_InputText(loginid, userID);
		element_Clear(password);
		element_InputText(password, "admin");
		element_Click(loginButton);
		if (setPwdLabelcheck.size() > 0) { // Element present or not on page
			element_Clear(newPassword);
			element_InputText(newPassword, newPwd);
			Thread.sleep(1000);
			element_Clear(confirmNewPassword);
			element_InputText(confirmNewPassword, cnfmPwd);
			Thread.sleep(1000);
			element_Click(setButton);
			Thread.sleep(1000);
			if (loginButtoncheck.size() > 0) {
				valmsg = loginButton.getText();
			} else {
				String valmsg1 = invalidLoginValidation.getText();
				if (valmsg1.contains("Mandatory characters are : 1 Uppercase")) {
					valmsg = valmsg1.substring(0, 97);
				} else {
					valmsg = valmsg1;
				}
			}
		} else {
			if (invalidLoginValidation.getText().equalsIgnoreCase("")) {
				logger.info("Password is already Set");
				valmsg = loginButton.getText();
			} else {
				valmsg = invalidLoginValidation.getText();
			}
		}
		return valmsg;
	}

	// Created by Mayank
	public void enterCredentialsAndClickOnOTP(String credential) throws InterruptedException {
		element_Clear(loginid);
		element_InputText(loginid, credential);
		Thread.sleep(1000);
		element_Click(loginWithOTPtoggle);
		pageLoadWaitng();
		logger.info(invalidLoginValidation.getText());
		Thread.sleep(1000);
	}

	// Created by Mayank
	public void clickOnResendOTP(int resendCount) throws InterruptedException {
		waitForElementVisible(resendOTP);
		Thread.sleep(1000);
		for (int i = 0; i < resendCount; i++) {
			element_Click(resendOTP);
			logger.info("Resend Click " + i + " time");
			Thread.sleep(1000);
			pageLoadWaitng();
		}
	}

	public String validateMessage() {
		String valmsg = null;
		String valmsg1 = invalidLoginValidation.getText();
		if (valmsg1.contains("mins) has been sent to your registered")) {
			valmsg = valmsg1.substring(0, 55);
		} else {
			valmsg = valmsg1;
		}
		return valmsg;
	}

	// Created by Mayank
	public void enterUseridPasswordAndClickOnNext(String userID, String pwd) throws InterruptedException {
		waitForElementVisible(loginid);
		element_Clear(loginid);
		element_InputText(loginid, userID);
		element_Clear(password);
		element_InputText(password, pwd);
		Thread.sleep(500);
		element_Click(loginButton); // Next Button
		String msg = validateMessage();
		logger.info(msg);
		Thread.sleep(1000);
	}

	// Created by Mayank
	public String enterOTPandClickOnLogin(String OTP) throws InterruptedException {
		waitForElementVisible(password);
		Thread.sleep(1000);
		String title = null;
		// int OTP1 = Integer.parseInt(OTP);
		element_Clear(password);
		element_InputDataUsingJS(password, OTP);
		Thread.sleep(500);
		element_Click(loginButton); // Next Button
		Thread.sleep(1000);
		if (checkInvalidLoginValidation.size() > 0) {
			title = element_GetText(invalidLoginValidation);
			if (title.isEmpty()) {
				title = element_GetText(setPasswordHeader);
			}
		} else {
			Thread.sleep(2000);
			title = driver.getTitle();
		}
		return title;
	}

	// Created by Mayank
	public void passwordOTPtoggleDisplayedOrNot(boolean validate) throws InterruptedException {
		waitForElementVisible(loginid);
		Thread.sleep(1000);
		if (validate == true) {
			if (pwdOTPtogglecheck.size() > 0) {
				logger.info("Pass: Password or OTP toggle is displayed");
			} else {
				logger.info("Failed: Password or OTP toggle is not displayed");
			}
		} else {
			if (pwdOTPtogglecheck.size() > 0) {
				logger.info("Failed: Password or OTP toggle is displayed");
			} else {
				logger.info("Pass: Password or OTP toggle is not displayed");
			}
		}

	}

	// Created by Mayank
	public String enterCredentialsClickOnOTPEnterOTPAndClickOnLogin(String userID, String OTP)
			throws InterruptedException {
		waitForElementVisible(loginid);
		Thread.sleep(1000);
//		element_Clear(loginid);
		element_InputText(loginid, userID);
		Thread.sleep(1000);
		element_Click(loginWithOTPtoggle);
		Thread.sleep(1000);
		String message = enterOTPandClickOnLogin(OTP);
		pageRefresh();
		return message;
	}

	// Created by Mayank
	public String setPasswordAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data) {
		String apiPar = null;

		if (columnHeader.contains("Action")) {
			apiParameter.add("Action=" + data.get("Action"));
		}
		if (columnHeader.contains("Userid")) {
			apiParameter.add("Userid=" + data.get("Userid"));
		}
		if (columnHeader.contains("user-verified-for-password")) {
			apiParameter.add("user-verified-for-password=" + data.get("user-verified-for-password"));
		}
		if (columnHeader.contains("new-password")) {
			apiParameter.add("new-password=" + data.get("new-password"));
		}
		if (columnHeader.contains("type")) {
			apiParameter.add("type=" + data.get("type"));
		}
		return apiPar;
	}

	// Mayank
	public void enterUseridAndClickForgetPwd(String userId) throws InterruptedException {
		element_Clear(loginid);
		element_InputText(loginid, userId);
		Thread.sleep(1000);
		element_Click(forgetPasswordLink);
		String val = null;
		if (forgetPwdLabelcheck.size() > 0) {
			val = "Forget Password popup opened";
		} else {
			val = invalidLoginValidation.getText();
		}
		Assert.assertEquals(val, "Forget Password popup opened");
	}

	// Mayank
	public void selectForgetPwdOptions(String forgetPwdOption) throws InterruptedException {
		if (forgetPwdOption.equalsIgnoreCase("Send OTP")) {
			element_Click(forgetPwdSendOTPradioBtn);
		} else if (forgetPwdOption.equalsIgnoreCase("Security Question")) {
			element_Click(forgetPwdSecurityAnsRadioBtn);
		} else {
			logger.info("Option invalid");
		}
		element_Click(sendNextVerifyBtn);
		Thread.sleep(1000);
		String val = null;
		if (securityQuestionLabelcheck.size() > 0) {
			val = "Security Question popup opened";
		} else if (forgetPwdLabelcheck.size() > 0) {
			val = "Forget Password popup opened";
		} else {
			val = invalidLoginValidation.getText();
		}
		Assert.assertEquals(val, "Security Question popup opened");
	}

	// Mayank
	public void EnterSecAnsAndSetPwd(Map<String, String> data) throws InterruptedException {
		element_InputText(securityAnswerTxt, data.get("SecurityAnswer"));
		element_Click(sendNextVerifyBtn);
		String val = null;
		if (setPwdLabelcheck.size() > 0) {
			val = "Set password popup opened";
		} else if (securityQuestionLabelcheck.size() > 0) {
			val = "Security Question popup opened";
		} else {
			val = invalidLoginValidation.getText();
		}
		Assert.assertEquals(val, "Set password popup opened");
		element_InputText(newPassword, data.get("NewPassword"));
		element_InputText(confirmNewPassword, data.get("ConfirmPassword"));
		element_Click(setButton);
		String val1 = null;
		if (loginButtoncheck.size() > 0) {
			val1 = element_GetText(loginButton);
		} else {
			val1 = invalidLoginValidation.getText();
		}
		Assert.assertEquals(val1, data.get("Validation"));
	}

}
