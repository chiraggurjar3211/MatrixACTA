package PageObject.AdminModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class EmailConfigurationPO extends AbstractMethod {
	WebDriver driver;

	public EmailConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "txtECSmtpSrvr")
	private WebElement smtpServer;
	
	@FindBy(id = "txtECPISrvr")
	private WebElement pop3Server;
	
	@FindBy(id = "txtECPortSrvr")
	private WebElement pop3Port;
	
	@FindBy(id = "txtSndrEmail")
	private WebElement senderEmailID;
	
	@FindBy(id = "txtSndrDisName")
	private WebElement senderDisplayName;
	
	@FindBy(id = "txtUsrName")
	private WebElement username;
	
	@FindBy(id = "txtPass")
	private WebElement password;
	
	@FindBy(id = "txtAleartCycle")
	private WebElement alertCycle;
	
	@FindBy(id = "txtRetryCount")
	private WebElement retryCount;
	
	@FindBy(id = "txtActiveDays")
	private WebElement activeDays;
	
	@FindBy(id = "btnSave")
	private WebElement saveBtn;
	
	// Created by Mayank
	public void setEmailConfiguration() throws InterruptedException {
		pageLoadWaitng();
		String val=smtpServer.getAttribute("value");
		if(val.isEmpty() ||val.isBlank() ) {
		waitForElementVisible(smtpServer);
		Thread.sleep(1000);
		element_Clear(smtpServer);
		element_inputTextUsingActionClassCharacterOneByOne(smtpServer, "192.168.103.10");
		element_Clear(pop3Server);
		element_inputTextUsingActionClassCharacterOneByOne(pop3Server, "192.168.103.10");
		element_TextBoxToClickOnTab(pop3Server);
		element_Clear(pop3Port);
		element_InputTextUsingActionClass(pop3Port, "110");
		element_Clear(senderEmailID);
		element_InputTextUsingActionClass(senderEmailID, "mayank.vishnoriya@matrixrd.org");
		element_Clear(senderDisplayName);
		element_InputTextUsingActionClass(senderDisplayName, "COSECAutomation");
		element_Clear(username);
		element_InputTextUsingActionClass(username, "mayank.vishnoriya");
		element_Clear(password);
		element_InputTextUsingActionClass(password, "Mayank16");
		element_Clear(alertCycle);
		element_InputTextUsingActionClass(alertCycle, "10");
		element_Clear(retryCount);
		element_InputTextUsingActionClass(retryCount, "10");
		element_Clear(activeDays);
		element_InputTextUsingActionClass(activeDays, "10");
		Thread.sleep(1000);
		element_Click(saveBtn);
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		}
	}
	
}
