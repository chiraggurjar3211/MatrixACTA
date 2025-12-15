package PageObject.DeviceModule;

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


public class TimeFramesPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(TimeFramesPO.class);
	
	public TimeFramesPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	
	// Elements
	@FindBy(id = "TimeFramesName")
	private WebElement nameTxt;
	
	
	
	// Code
	
	public void createMaxTimeframes(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		int maxTimeframesCount = Integer.parseInt(data.get("TimeFrameCount"));
		for (int i = 1; i < maxTimeframesCount+1; i++) {
			addButtonClick();
			Thread.sleep(500);
			String formattedI = String.format("%02d", i);
			element_Clear(nameTxt);
			element_InputTextUsingActionClass(nameTxt, "TimeFrameTime"+formattedI);
			Thread.sleep(500);
			saveButtonClick();
			Assert.assertEquals(validationMessage(), "Saved Successfully");
		}
	}

}
