package PageObject.ShiftAndSchedule;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;

public class ChangeWeekOffPO extends AbstractMethod{
	WebDriver driver;
	public ChangeWeekOffPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//********************************************************************************
	//***********************ELEMENTS***********************************************
	//********************************************************************************
	@FindBy(id = "_woDate")
	private WebElement curremtWOTxt;
	
	@FindBy(id = "_toDate")
	private WebElement newWOTxt;
	
	@FindBy(id = "grpddl")
	private WebElement selectUsersDD;
	
	@FindBy(id = "ID")
	private WebElement userIdTxt;
	
	@FindBy(xpath = "//*[@default='Apply']")
	private WebElement applyBtn;
	
	
	//********************************************************************************
	// ***********************FUNCTIONS***********************************************
	// ********************************************************************************
	public void changeWeekOffOfUser(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (data.get("CurrentWeekOffDate") != null) {
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("CurrentWeekOffDate"));
			element_Clear(curremtWOTxt);
			element_InputTextUsingActionClass(curremtWOTxt, date);
		}
		if (data.get("NewWeekOffDate") != null) {
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("NewWeekOffDate"));
			element_Clear(newWOTxt);
			element_InputTextUsingActionClass(newWOTxt, date);
		}
		if (data.get("SelectUsers") != null) {
			element_DropDownSelectByvisibleText(selectUsersDD, data.get("SelectUsers"));
		}
		if (data.get("UserIDs") != null) {
			selectUsersOrGroupFromPicklist(data.get("UserIDs"), userIdTxt);
		}
		Thread.sleep(1000);
		element_Click(applyBtn);
		element_DynamicwaitPerElement(validationMessageCloseButton, 120);
		Assert.assertEquals(validationMessage(), data.get("validation"));
	}
}
