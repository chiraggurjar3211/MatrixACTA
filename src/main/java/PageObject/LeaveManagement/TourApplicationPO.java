package PageObject.LeaveManagement;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class TourApplicationPO extends AbstractMethod {
	WebDriver driver;

	public TourApplicationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "TAUserID")
	private WebElement useridtxt;
	
	@FindBy(id = "cboFromHalf")
	private WebElement fullDayHalfDayDrop1;
	
	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_Todate")
	private WebElement toDateTxt;

	@FindBy(id = "cboLeaveID")
	private WebElement leaveDrop;

	@FindBy(xpath = "//*[@id='btnSave']")
	private WebElement submitBtn;
	
	//Mayank
	public void applyTourApplication(Map<String, String> data) throws InterruptedException {
		waitForElementVisible(useridtxt);
		if (data.get("userid") != null) {
			element_Clear(useridtxt);
			Thread.sleep(1000);
			element_dynamicDDSelect(useridtxt, data.get("userid"));
		}
		Thread.sleep(1000);
		addButtonClick();
		Thread.sleep(2000);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, staticDateOrPlusMinusFromCurrentDate(data.get("FromDate")));
		Thread.sleep(500);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, staticDateOrPlusMinusFromCurrentDate(data.get("ToDate")));
		Thread.sleep(500);
		element_TextBoxToClickOnTab(toDateTxt);
		Thread.sleep(500);
		element_DropDownSelectByvisibleText(leaveDrop, data.get("Leave"));
		Thread.sleep(500);
		element_ClickUsingJS(submitBtn);
		element_ClickUsingJS(submitBtn);
		Thread.sleep(1500);
		Assert.assertEquals(validationMessage(), data.get("Validation"));
	}

}
