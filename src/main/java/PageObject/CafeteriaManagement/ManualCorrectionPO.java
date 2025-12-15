package PageObject.CafeteriaManagement;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class ManualCorrectionPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(ManualCorrectionPO.class);

	public ManualCorrectionPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "AutoUserID")
	private WebElement userIdTxt;
	
	@FindBy(xpath = "//html")
	private WebElement blank;
	
	@FindBy(id = "_txtDate")
	private WebElement dateTxt;
	
	@FindBy(id = "txtTime")
	private WebElement timeTxt;
	
	@FindBy(id = "AutoCntnDoorName")
	private WebElement deviceNameTxt;
	
	@FindBy(id = "AutoMenuPlstName")
	private WebElement menuNameTxt;
	
	@FindBy(id = "AutoItemPlstName")
	private WebElement itemNameTxt;
	
	@FindBy(id = "txtApplyQuantity")
	private WebElement newQunTxt;
	
	@FindBy(xpath = "//*[@name='cmnTxtSearch']")
	private WebElement searchBar;
	
	@FindBy(xpath = "//*[@class='table-responsive']//tbody/tr[not (@hidden)]/td[not (@hidden)][6]/img")
	private WebElement appStatus;
	
	// Code
	public void manualCorrection(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (data.get("UserId") != null) {
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, data.get("UserId"));
			element_Click(blank);
			Thread.sleep(500);
		}
		addButtonClick();
		Thread.sleep(1000);
		if (data.get("TrnDate") != null) {
			String tdate = staticDateOrPlusMinusFromCurrentDate(data.get("TrnDate"));
			element_Clear(dateTxt);
			element_InputTextUsingActionClass(dateTxt, tdate);
			Thread.sleep(500);
		}
		if (data.get("TrnTime") != null) {
			String tTime = staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("TrnTime"));
			element_Clear(timeTxt);
			element_inputTextUsingActionClassCharacterOneByOne(timeTxt, tTime);
			Thread.sleep(500);
		}
		if (data.get("DeviceName") != null) {
			element_Clear(deviceNameTxt);
			element_InputTextUsingActionClass(deviceNameTxt, data.get("DeviceName"));
			element_Click(blank);
			Thread.sleep(500);
		}
		if (data.get("MenuName") != null) {
			element_Clear(menuNameTxt);
			element_InputTextUsingActionClass(menuNameTxt, data.get("MenuName"));
			Thread.sleep(500);
			element_Click(blank);
			Thread.sleep(500);
		}
		if (data.get("ItemName") != null) {
			element_Clear(itemNameTxt);
			element_InputTextUsingActionClass(itemNameTxt, data.get("ItemName"));
			Thread.sleep(500);
			element_Click(blank);
			Thread.sleep(500);
		}
		if (data.get("NewQuantity") != null) {
			element_Clear(newQunTxt);
			element_InputTextUsingActionClass(newQunTxt, data.get("NewQuantity"));
			Thread.sleep(500);
		}
		saveButtonClick();
		Assert.assertEquals(validationMessage(), data.get("Validation"));
		if (!validationMessage().equalsIgnoreCase("Saved Successfully")) {
			cancelButtonClick();
			Thread.sleep(500);
		}
	}
	
	public void VerifyApplicationStatus(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (data.get("UserId") != null) {
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, data.get("UserId"));
			element_Click(blank);
			Thread.sleep(500);
		}
		String[] dateTimeSaperate = data.get("TrnDateTime").split("&");
		String date = staticDateOrPlusMinusFromCurrentDate(dateTimeSaperate[0]);
		String time = staticTimeOrPlusMinusMinutesFromCurrentTime(dateTimeSaperate[1]);
		String dateTime = date + " " + time;
		logger.info(dateTime);	
		element_Clear(searchBar);
		element_InputTextUsingActionClass(searchBar, dateTime);
		element_TextBoxToClickOnEnter(searchBar);
		Thread.sleep(500);
		String actualStatus = appStatus.getAttribute("key");
		Assert.assertEquals(actualStatus, data.get("Status"));
	}

}
