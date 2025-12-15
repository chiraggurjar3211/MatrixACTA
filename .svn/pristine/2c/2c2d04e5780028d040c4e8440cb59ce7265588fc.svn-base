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
import groovy.transform.Final;


public class RechargePO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(RechargePO.class);
	
	public RechargePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// ELements
	@FindBy(id = "UserID")
	private WebElement userIdTxt;
	
	@FindBy(id = "DeviceName")
	private WebElement deviceNameTxt;
	
	@FindBy(id = "cbProcess")
	private WebElement processDD;
	
	@FindBy(id = "txtAmount")
	private WebElement rechargeAmount;
	
	@FindBy(id = "txtReAmount")
	private WebElement confirmRechargeAmount;
	
	@FindBy(id = "cbResetType")
	private WebElement resetTypeDD;
	
	@FindBy(id = "btnRecharge")
	private WebElement rechargeBtn;
	
	@FindBy(id = "btnReset")
	private WebElement resetBtn;
	
	
	
	// Code
	public void rechargeReset(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (data.get("UserId") != null) {
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, data.get("UserId"));
			element_Click(driver.findElement(By.xpath("//html")));
		}
		Thread.sleep(500);
		if (data.get("DeviceName") != null) {
			if (deviceNameTxt.isEnabled()) {
				element_Clear(deviceNameTxt);
				element_InputTextUsingActionClass(deviceNameTxt, data.get("DeviceName"));
				element_Click(driver.findElement(By.xpath("//html")));
			}
		}
		Thread.sleep(500);
		if (data.get("Process") != null) {
			element_DropDownSelectByvisibleText(processDD, data.get("Process"));
		}
		Thread.sleep(500);
		if (data.get("Process").equalsIgnoreCase("Recharge")) {
			if (data.get("RechargeAmount") != null) {
				element_Clear(rechargeAmount);
				element_InputTextUsingActionClass(rechargeAmount, data.get("RechargeAmount"));
				element_Clear(confirmRechargeAmount);
				element_InputTextUsingActionClass(confirmRechargeAmount, data.get("RechargeAmount"));
			}
			Thread.sleep(500);
			element_Click(rechargeBtn);
			Thread.sleep(500);
			Assert.assertEquals(validationMessage(), data.get("Validation"));
		} else if (data.get("Process").equalsIgnoreCase("Reset")) {
			if (data.get("ResetType") != null) {
				element_DropDownSelectByvisibleText(resetTypeDD, data.get("ResetType"));
			}
			Thread.sleep(500);
			element_Click(resetBtn);
			Thread.sleep(500);
			Assert.assertEquals(validationMessage(), data.get("Validation"));
		}
	}

}
