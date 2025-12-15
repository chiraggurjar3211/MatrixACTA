package PageObject.AdminPortal;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class ApChangePasswordPO extends AbstractMethod {
	WebDriver driver;

	public ApChangePasswordPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(xpath = "//*[@title='Reset Q&A']")
	private WebElement resetSecurityQABtn;
	
	@FindBy(xpath = "//*[@title='Reset Q&A']")
	private List<WebElement> resetSecurityQABtnCheck;
	
	@FindBy(id = "txtSecurityQue")
	private WebElement securityQuestionTxt;
	
	@FindBy(id = "txtSecurityAns")
	private WebElement securityAnswerTxt;
	
	@FindBy(id = "txtConfirmSecurityAns")
	private WebElement confirmSecurityAnswerTxt;
	
	@FindBy(id = "txtCurrentPwd")
	private WebElement currentPwdTxt;
	
	@FindBy(xpath = "//*[@id='divChangePwd']//*[@default='Save']")
	private WebElement resetSecurityQASaveBtn;
	
	@FindBy(xpath = "//*[@id='divChangePwd']//*[@default='Cancel']")
	private WebElement cancelBtn;
	
	//Functions
	public void resetSecurityQA(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(resetSecurityQABtn);
		Thread.sleep(1000);
		if (data.get("SecurityQuestion") != null) {
			element_Clear(securityQuestionTxt);
			element_InputText(securityQuestionTxt, data.get("SecurityQuestion"));
		}
		if (data.get("SecurityAnswer") != null) {
			element_Clear(securityAnswerTxt);
			element_InputText(securityAnswerTxt, data.get("SecurityAnswer"));
		}
		if (data.get("ConfirmSecurityAnswer") != null) {
			element_Clear(confirmSecurityAnswerTxt);
			element_InputText(confirmSecurityAnswerTxt, data.get("ConfirmSecurityAnswer"));
		}
		if (data.get("CurrentPassword") != null) {
			element_Clear(currentPwdTxt);
			element_InputText(currentPwdTxt, data.get("CurrentPassword"));
		}
		Thread.sleep(1000);
		element_Click(resetSecurityQASaveBtn);
		String val = validationMessage();
		if (resetSecurityQABtnCheck.size()==0) {
			element_Click(cancelBtn);
		}
		Assert.assertEquals(val, data.get("Validation"));
		
		
	}
	
}
