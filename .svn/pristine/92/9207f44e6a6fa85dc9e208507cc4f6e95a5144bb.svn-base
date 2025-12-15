package PageObject.AdminPortal;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;
import groovyjarjarantlr4.v4.parse.ANTLRParser.throwsSpec_return;

public class AdminPortalPO extends AbstractMethod{
	WebDriver driver;

	public AdminPortalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements ////////////////////////////
	@FindBy(xpath = "//*[@title='Setting']")
	private WebElement settingIcon;
	
	@FindBy(xpath = "//*[@href='#/Menu/2002']")
	private WebElement systemAccountPage;
	
	@FindBy(xpath = "//*[@href='#/Menu/2001']")
	private WebElement systemConfigurationPage;
	
	@FindBy(xpath = "//*[contains(text(),'Password Policy')]")
	private WebElement passwordPolicyPage;
	
	@FindBy(xpath = "//*[contains(text(),'Email Configuration')]")
	private WebElement emailConfigurationPage;
	
	@FindBy(xpath = "//*[@title='Profile']")
	public WebElement profileIconAdminPortal;
	
	@FindBy(xpath = "//*[@href='#/Menu/3002']")
	private WebElement changePasswordPage;
	
	@FindBy(xpath = "//*[contains(text(),'SMS Configuration')]")
	private WebElement smsConfigurationPage;
	
	////////////////////////////////////////
	public void goToAdminPortalSytstemAccountPage() {
		element_Click(settingIcon);
		element_Click(systemAccountPage);
	}
	
	public void goToAdminPortalPasswordPolicyPage() throws InterruptedException {
		element_Click(settingIcon);
		element_Click(systemConfigurationPage);
		Thread.sleep(2000);
		element_Click(passwordPolicyPage);
	}
	
	public void goToAdminPortalEmailConfigurationPage() throws InterruptedException {
		element_Click(settingIcon);
		element_Click(systemConfigurationPage);
		Thread.sleep(2000);
		element_Click(emailConfigurationPage);
	}
	
	public void goToAdminPortalChangePasswordPage() {
		element_Click(profileIconAdminPortal);
		element_Click(changePasswordPage);
	}
	
	public void goToAdminPortalSmsConfigurationPage() throws InterruptedException {
		element_Click(settingIcon);
		element_Click(systemConfigurationPage);
		Thread.sleep(2000);
		element_Click(smsConfigurationPage);
	}
	
}
