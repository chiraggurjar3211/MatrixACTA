package PageObject.AccessControlModule;

import java.util.ArrayList;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class AccessProfilePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AccessProfilePO.class);
	
	public AccessProfilePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "AccessProfileName")
	private WebElement accessProfileNameTxt;
	
	@FindBy(xpath = "//*[@name=\"cmnTxtSearch\" and @class=\"form-control grdSearhIcon ng-untouched ng-pristine ng-valid\"]")
	private WebElement searchBox;
	
	@FindBy(id = "cmbWrkAccessLvl")
	private WebElement workHrsDD;
	
	@FindBy(id = "cmbBrkAccessLvl")
	private WebElement breakHrsDD;
	
	@FindBy(id = "cmbNWrkAccessLvl")
	private WebElement nonWorkingHrsDD;
	
	////////////
	public void deleteAccessProfile(String acsProflName) throws InterruptedException {
		String valMsg = null;
		pageLoadWaitng();
		waitForElementVisible(accessProfileNameTxt);
		element_Clear(accessProfileNameTxt);
		element_InputText(accessProfileNameTxt, acsProflName);
		element_TextBoxToClickOnTab(accessProfileNameTxt);
		Thread.sleep(1500);
		if (!element_getInputControlValue(accessProfileNameTxt).isBlank() || !element_getInputControlValue(accessProfileNameTxt).isEmpty()) {
			deleteButtonClick();
			Thread.sleep(1000);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
			valMsg = validationMessage();
			Assert.assertEquals(valMsg, "Deleted Successfully");
		}else {
			logger.info(acsProflName+" Not Found");
		}
	//	reloadPageButtonClick();
	}
	
	public void createAccessProfile(String acsProflName, String workHrs, String breakHrs, String nonWorkingHrs, String validation) throws InterruptedException {
		String valMsg = null;
		pageLoadWaitng();
		waitForElementVisible(accessProfileNameTxt);
		//Thread.sleep(1500);
		element_Clear(accessProfileNameTxt);
		element_InputTextUsingActionClass(accessProfileNameTxt, acsProflName);
		Thread.sleep(500);
		element_TextBoxToClickOnTab(accessProfileNameTxt);
		Thread.sleep(1500);
		if (element_getInputControlValue(accessProfileNameTxt).isBlank() || element_getInputControlValue(accessProfileNameTxt).isEmpty()) {
			addButtonClick();
			element_Clear(accessProfileNameTxt);
			element_InputTextUsingActionClass(accessProfileNameTxt, acsProflName);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(accessProfileNameTxt);
		}	
		if(workHrs != null) {
			element_DropDownSelectByvisibleText(workHrsDD, workHrs);
		}
		if(breakHrs != null) {
			element_DropDownSelectByvisibleText(breakHrsDD, breakHrs);
		}
		if(nonWorkingHrs != null) {
			element_DropDownSelectByvisibleText(nonWorkingHrsDD, nonWorkingHrs);
		}
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(1000);
		valMsg = validationMessage();
		Assert.assertEquals(valMsg, validation);
	}

}
