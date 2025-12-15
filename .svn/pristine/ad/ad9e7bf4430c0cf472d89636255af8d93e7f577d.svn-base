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

public class ManualAdjustmentPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(ManualAdjustmentPO.class);

	public ManualAdjustmentPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Element
	@FindBy(id = "AutoPostUserID")
	private WebElement userIdTxt;
	
	@FindBy(id = "RBLstCrDb")
	private WebElement adjustmentTypeDD;
	
	@FindBy(id = "txtPayAmt")
	private WebElement amountTxt;
	
	@FindBy(id = "txtReason")
	private WebElement remarkTxt;
	
	@FindBy(id = "btnProcess")
	private WebElement processBtn;
	
	@FindBy(xpath = "//html")
	private WebElement blank;
	
	
	
	// Code
	public void manualAdjustmentOfUser(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (data.get("UserId") != null) {
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, data.get("UserId"));
			element_Click(blank);
			Thread.sleep(500);
		}
		if (data.get("Adjustment") != null) {
			element_DropDownSelectByvisibleText(adjustmentTypeDD, data.get("Adjustment"));
		}
		if (data.get("Amount") != null) {
			element_Clear(amountTxt);
			element_InputTextUsingActionClass(amountTxt, data.get("Amount"));
		}
		if (data.get("Remark") != null) {
			element_Clear(remarkTxt);
			element_InputTextUsingActionClass(remarkTxt, data.get("Remark"));
		}
		Thread.sleep(500);
		element_Click(processBtn);
		Thread.sleep(1000);
		Assert.assertEquals(validationMessage2(), data.get("Validation"));
	}

}
