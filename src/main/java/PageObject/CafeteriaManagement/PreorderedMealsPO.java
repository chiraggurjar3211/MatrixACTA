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

public class PreorderedMealsPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(PreorderedMealsPO.class);

	public PreorderedMealsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "_txtDate")
	private WebElement dateTxt;
	
	@FindBy(id = "cboUser")
	private WebElement filterUserDD;
	
	@FindBy(id = "AutoUserID")
	private WebElement userIdTxt;
	
	@FindBy(id = "btnView")
	private WebElement viewBtn;
	
	@FindBy(xpath = "//html")
	private WebElement blank;
	
	@FindBy(xpath = "//*[@class='table-responsive']//tbody/tr/td[not (@hidden)][1]")
	private List<WebElement> rows ;
	
	
	
	// Code
	public void verifyPreOrderedMeals(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Clear(dateTxt);
		element_InputTextUsingActionClass(dateTxt, staticDateOrPlusMinusFromCurrentDate(data.get("Date")));
		Thread.sleep(500);
		element_DropDownSelectByvisibleText(filterUserDD, " Individual ");
		Thread.sleep(500);
		element_Clear(userIdTxt);
		element_InputTextUsingActionClass(userIdTxt, data.get("UserId"));
		Thread.sleep(500);
		element_Click(blank);
		Thread.sleep(500);
		element_Click(viewBtn);
		Thread.sleep(500);
		if (rows.size()>0) {
			for (int i = 0; i < rows.size(); i++) {
				String menuname = rows.get(i).findElement(By.xpath("following-sibling::td[1]")).getText();
				String itemName = rows.get(i).findElement(By.xpath("following-sibling::td[3]")).getText();
				String quantity = rows.get(i).findElement(By.xpath("following-sibling::td[4]")).getText();
				Assert.assertEquals(menuname, data.get("MenuName"));
				Assert.assertEquals(itemName, data.get("ItemName"));
				Assert.assertEquals(quantity, data.get("Quantity"));
			}
		} else {
			Assert.assertEquals("Data not found", "Data should be found");
		}
		
	
	}

}
