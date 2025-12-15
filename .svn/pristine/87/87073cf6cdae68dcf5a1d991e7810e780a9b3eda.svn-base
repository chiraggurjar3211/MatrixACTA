package PageObject.AdminPortal;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class ApSmsConfigurationPO extends AbstractMethod {
	WebDriver driver;

	public ApSmsConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "IsActive")
	private WebElement activeFlag;
	
	@FindBy(id = "UserName")
	private WebElement usertxt;
	
	@FindBy(id = "Pwd")
	private WebElement pwdtxt;
	
	@FindBy(id = "SenderID")
	private WebElement sendertxt;
	
	@FindBy(id = "SMS_btnSave")
	private WebElement saveBtn;
	
	
	// Created by Mayank
	public void setSmsConfiguration() throws InterruptedException {
		pageLoadWaitng();
		String val = usertxt.getAttribute("value");
		if (val.isEmpty() || val.isBlank()) {
			if (!activeFlag.isSelected()) {
				element_Click(activeFlag);
			}
			element_Clear(usertxt);
			element_InputTextUsingActionClass(usertxt, "mayank.vishnoriya");
			element_Clear(pwdtxt);
			element_InputTextUsingActionClass(pwdtxt, "mayank");
			element_Clear(sendertxt);
			element_InputTextUsingActionClass(sendertxt, "mayank");
			Thread.sleep(1000);
			element_Click(saveBtn);
			String validationmsg = validationMessage();
			Assert.assertEquals(validationmsg, "Saved Successfully");
		}
	}
	
	
	
}
