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


public class AccessSchedulesPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AccessSchedulesPO.class);
	
	public AccessSchedulesPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// ELements
	@FindBy(id = "AccessScheduleName")
	private WebElement nameTxt;
	
	@FindBy(id = "TimeFrameData1ID")
	private WebElement timeFrameIdTxt;
	
	
	// Code
	public void createMaxAccessSchedules(Map<String, String> data) throws InterruptedException{
		pageLoadWaitng();
		int maxAccessScheduleCount = Integer.parseInt(data.get("AccessScheduleCount"));
		for (int i = 1; i < maxAccessScheduleCount+1; i++) {
			addButtonClick();
			Thread.sleep(1000);
			String formattedI = String.format("%02d", i);
			element_Clear(nameTxt);
			element_InputTextUsingActionClass(nameTxt, "AccessSchedul"+formattedI);
			Thread.sleep(500);
			if (i==1) {
				for (int j = 1; j <= 32; j++) {
					element_InputTextUsingActionClass(timeFrameIdTxt, String.valueOf(j));
					Thread.sleep(300);
					element_Click(driver.findElement(By.xpath("//html")));
					Thread.sleep(300);
				}
			} else if (i==maxAccessScheduleCount) {
				for (int j = 68; j <= 99; j++) {
					element_InputTextUsingActionClass(timeFrameIdTxt, String.valueOf(j));
					Thread.sleep(300);
					element_Click(driver.findElement(By.xpath("//html")));
					Thread.sleep(300);
				}
			} else {
				element_InputTextUsingActionClass(timeFrameIdTxt, "1");
				Thread.sleep(300);
				element_Click(driver.findElement(By.xpath("//html")));
			}
			Thread.sleep(1000);
			saveButtonClick();
			Assert.assertEquals(validationMessage(), "Saved Successfully");
			Thread.sleep(1000);
		}
	}

}
