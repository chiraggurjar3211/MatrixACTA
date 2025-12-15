package PageObject.AdminModule;

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


public class EnterpriseProfilePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EnterpriseProfilePO.class);
	
	public EnterpriseProfilePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "txtCompanyName")
	private WebElement companyNameTxt;
	
	// Functions
	public String getCompanyName() throws InterruptedException {
		pageLoadWaitng();
		return companyNameTxt.getAttribute("value");
	}

}
