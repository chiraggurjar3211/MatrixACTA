package PageObject.AdminPortal;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class ApEmailConfigurationPO extends AbstractMethod {
	WebDriver driver;

	public ApEmailConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "txtECSmtpSrvr")
	private WebElement smtpServer;
	
	@FindBy(id = "txtECSmtpPortSrvr")
	private WebElement smtpPort;
	
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
	
	@FindBy(id = "email_txtRetryCount")
	private WebElement retryCount;
	
	@FindBy(id = "email_txtActiveDays")
	private WebElement activeDays;
	
	@FindBy(id = "EC_btnSave")
	private WebElement emailConfigSaveBtn;
	
	// Created by Mayank
	public void setEmailConfiguration() throws InterruptedException {
		pageLoadWaitng();
		String val=smtpServer.getAttribute("value");
		if(val.isEmpty() ||val.isBlank() ) {
		waitForElementVisible(smtpServer);
		Thread.sleep(1000);
		element_Clear(smtpServer);
		element_InputText(smtpServer, "192.168.103.10");
		element_Clear(smtpPort);
		element_InputText(smtpPort, "25");
		element_Clear(pop3Server);
		element_InputText(pop3Server, "192.168.103.10");
		element_Clear(pop3Port);
		element_InputText(pop3Port, "110");
		element_Clear(senderEmailID);
		element_InputText(senderEmailID, "mayank.vishnoriya@matrixrd.org");
		element_Clear(senderDisplayName);
		element_InputText(senderDisplayName, "COSECAutomation");
		element_Clear(username);
		element_InputText(username, "mayank.vishnoriya");
		element_Clear(password);
		element_InputText(password, "Mayank16");
		element_Clear(alertCycle);
		element_InputText(alertCycle, "10");
		element_Clear(retryCount);
		element_InputText(retryCount, "10");
		element_Clear(activeDays);
		element_InputText(activeDays, "10");
		Thread.sleep(1000);
		element_Click(emailConfigSaveBtn);
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		}
	}

}
