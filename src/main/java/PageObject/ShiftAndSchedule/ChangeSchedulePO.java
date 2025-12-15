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

public class ChangeSchedulePO extends AbstractMethod{
	WebDriver driver;
	public ChangeSchedulePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//********************************************************************************
	//***********************ELEMENTS***********************************************
	//********************************************************************************
	@FindBy(id = "cmbSchChgType")
	private WebElement changeTypeDD;
	
	@FindBy(id = "_calFromDate1")
	private WebElement fromDateTxt;
	
	@FindBy(id = "_calToDate1")
	private WebElement toDateTxt;
	
	@FindBy(id = "AutoScheduleName")
	private WebElement scheduleNameTxt;
	
	@FindBy(id = "AutoStartShiftID")
	private WebElement startShiftIdTxt;
	
	@FindBy(id = "grpddl")
	private WebElement selectUsersDD;
	
	@FindBy(id = "ID")
	private WebElement userIdTxt;
	
	@FindBy(xpath = "//*[@default='Apply']")
	private WebElement applyBtn;
	
	
	//********************************************************************************
	// ***********************FUNCTIONS***********************************************
	// ********************************************************************************
	public void changeScheduleOfUser(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (data.get("ChangeType") != null) {
			element_DropDownSelectByvisibleText(changeTypeDD, data.get("ChangeType"));
		}
		if (data.get("FromDate") != null) {
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("FromDate"));
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, date);
		}
		if (data.get("ToDate") != null) {
			if (toDateTxt.isEnabled()) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("ToDate"));
				element_Clear(toDateTxt);
				element_InputTextUsingActionClass(toDateTxt, date);
			}
		}
		if (data.get("ScheduleName") != null) {
			element_Clear(scheduleNameTxt);
			element_dynamicDDSelect(scheduleNameTxt, data.get("ScheduleName"));
			element_TextBoxToClickOnTab(scheduleNameTxt);
			Thread.sleep(1000);
		}
		if (data.get("StartShiftID") != null) {
			element_Clear(startShiftIdTxt);
			element_dynamicDDSelect(startShiftIdTxt, data.get("StartShiftID"));
			element_TextBoxToClickOnTab(startShiftIdTxt);
			Thread.sleep(1000);
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
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
}
