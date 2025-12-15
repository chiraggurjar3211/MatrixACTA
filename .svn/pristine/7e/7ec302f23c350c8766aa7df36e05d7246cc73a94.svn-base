package PageObject.AdminModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class SMSConfigurationPO extends AbstractMethod {
	WebDriver driver;

	public SMSConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "UserName")
	private WebElement username;
	
	@FindBy(id = "Pwd")
	private WebElement password;
	
	@FindBy(id = "SenderID")
	private WebElement senderID;
	
	@FindBy(id = "btnSave")
	private WebElement saveBtn;
	
	@FindBy(id = "IsActive")
	private WebElement activeFlag;
	
	
	
	// Created by Mayank
	public void setSMSConfiguration() throws InterruptedException {
		pageLoadWaitng();
		String val=username.getAttribute("value");
		if(val.isEmpty() || val.isBlank() ) {
			waitForElementVisible(username);
			Thread.sleep(1000);
			if (!activeFlag.isSelected()) {
				element_Click(activeFlag);
			}
			element_Clear(username);
			element_InputTextUsingActionClass(username, "mayankvishnoriya");
			element_Clear(password);
			element_InputTextUsingActionClass(password, "mayank167");
			element_Clear(senderID);
			element_InputTextUsingActionClass(senderID, "mayank");
			Thread.sleep(1000);
			element_Click(saveBtn);
			String validationmsg = validationMessage();
			Assert.assertEquals(validationmsg, "Saved Successfully");
		}
	}
	
}
