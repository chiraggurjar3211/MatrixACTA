package PageObject.AccessControlModule;

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


public class TwoPersonGroupPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(TwoPersonGroupPO.class);
	
	public TwoPersonGroupPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "TwoPGroupName")
	private WebElement nameTxt;
	
	@FindBy(id = "P2PGrpAllUsersID")
	private WebElement useridTxt;
	

	// Code
	// Max 9999
	public void createMaxGroups(Map<String, String> data, String formattedI) throws InterruptedException, IOException {
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(nameTxt);
			element_InputTextUsingActionClass(nameTxt, "2PrsonGroup"+formattedI);
			Thread.sleep(1000);
			//element_InputTextUsingActionClass(useridTxt, "2Puser"+formattedI);
			element_InputTextUsingActionClass(useridTxt, "2PersonGroup");
			Thread.sleep(1000);
			element_Click(driver.findElement(By.xpath("//html")));
			Thread.sleep(1000);
			saveButtonClick();
			Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	

}
