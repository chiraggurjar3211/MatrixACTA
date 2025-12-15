package PageObject.ESSLogin;

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

public class EssPreOrderMealsPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(EssPreOrderMealsPO.class);

	public EssPreOrderMealsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "AutoMenuPlstName")
	private WebElement manuNameTxt;
	
	@FindBy(id = "AutoItemPlstName")
	private WebElement itemNameTxt;
	
	@FindBy(id = "txtOrderQty")
	private WebElement quantityTxt;
	
	@FindBy(id = "btnADD")
	private WebElement addBtn;
	
	@FindBy(xpath = "//html")
	private WebElement blank;
	
	@FindBy(id = "_txtODate")
	private WebElement dateTxt;
	
	
	
	
	
	// Code
	public void essPreOrderMeal(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (cancelButton.isEnabled()) {
			element_Click(cancelButton);
		}
		Thread.sleep(1000);
		element_Clear(dateTxt);
		element_InputTextUsingActionClass(dateTxt, staticDateOrPlusMinusFromCurrentDate(data.get("Date")));
		Thread.sleep(1000);
		String val = null;
		if (validationMessagexpathsize.size()>0) {
			val = validationMessage();
		} else {
			element_Clear(manuNameTxt);
			element_InputTextUsingActionClass(manuNameTxt, data.get("MenuName"));
			Thread.sleep(500);
			element_Click(blank);
			Thread.sleep(500);
			element_Click(itemNameTxt);
			element_Clear(itemNameTxt);
			Thread.sleep(500);
			element_InputTextUsingActionClass(itemNameTxt, data.get("ItemName"));
			Thread.sleep(500);
			element_Click(blank);
			Thread.sleep(500);
			element_Clear(quantityTxt);
			element_InputTextUsingActionClass(quantityTxt, data.get("Quantity"));
			Thread.sleep(500);
			element_Click(addBtn);
			Thread.sleep(500);
			saveButtonClick();
			Thread.sleep(500);
			val= validationMessage();
		}
		Assert.assertEquals(val, data.get("Validation"));
	}

}
