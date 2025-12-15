package PageObject.TimeAndAttendance;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class ChangePolicyPO extends AbstractMethod {
	WebDriver driver;

	public ChangePolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "AutoUserID")
	private WebElement useridTxt;
	
	@FindBy(id = "PolicyType")
	private WebElement changePlcDD;
	
	@FindBy(id = "_SFromDate")
	private WebElement fromDtTxt;
	
	@FindBy(id = "_SToDate")
	private WebElement toDtTxt;
	
	@FindBy(xpath = "//mx-pick-list-button[not(@hidden)]//*[@role=\"combobox\" and @placeholder=\"Name\" and not(starts-with(@id,'Mul'))]")
	private WebElement newPlcNameTxt;
	
	@FindBy(id = "Remark")
	private WebElement remarkTxt;
	
	@FindBy(id = "btnSave")
	private WebElement applyBtn;
	
	//Multiple user
	@FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]/li[2]/a")
	private WebElement multiuserTab;
	
	@FindBy(id = "MPolicyType")
	private WebElement mChangePlcDD;
	
	@FindBy(id = "_MFromDate")
	private WebElement mFromDtTxt;
	
	@FindBy(id = "_MToDate")
	private WebElement mToDtTxt;
	
	@FindBy(xpath = "//mx-pick-list-button[not(@hidden)]//*[@role=\"combobox\" and @placeholder=\"Name\" and (starts-with(@id,'MultiAutoPickLst'))]")
	private WebElement mNewPlcNameTxt;
	
	@FindBy(id = "MRemark")
	private WebElement mRemarkTxt;
	
	@FindBy(id = "btnMultiSave")
	private WebElement mApplyBtn;
	
	@FindBy(id = "ID")
	private WebElement mUserId;
	
	@FindBy(xpath = "//html")
	private WebElement blankSpace;
	
	
	
	//*************************************************************
	//Functions
	//****************************************************************
	
	// Single User
	public void changePolicy(Map<String, String> data) throws InterruptedException {
		waitForElementVisible(useridTxt);
		if (data.get("UserId") != null) {
			element_Clear(useridTxt);
			element_dynamicDDSelect(useridTxt, data.get("UserId"));
			element_TextBoxToClickOnTab(useridTxt);
		}
		Thread.sleep(1000);
		if (data.get("Policy") != null) {
			element_DropDownSelectByvisibleText(changePlcDD, data.get("Policy"));
		}
		Thread.sleep(1000);
		if (data.get("StartDate") != null) {
			String sDt = staticDateOrPlusMinusFromCurrentDate(data.get("StartDate"));
			element_Clear(fromDtTxt);
			element_InputTextUsingActionClass(fromDtTxt, sDt);
		}
		if (data.get("EndDate") != null) {
			String eDt = staticDateOrPlusMinusFromCurrentDate(data.get("EndDate"));
			element_Clear(toDtTxt);
			element_InputTextUsingActionClass(toDtTxt, eDt);
		}
		Thread.sleep(1000);
		if (data.get("NewPolicyName") != null) {
			element_Clear(newPlcNameTxt);
			element_dynamicDDSelect(newPlcNameTxt, data.get("NewPolicyName"));
			//element_TextBoxToClickOnTab(newPlcNameTxt);
			element_Click(blankSpace);
		}
		if (data.get("Remark") != null) {
			element_Clear(remarkTxt);
			element_InputTextUsingActionClass(remarkTxt, data.get("Remark"));
		}
		Thread.sleep(1000);
		element_Click(applyBtn);
		element_DynamicwaitPerElement(validationMessageCloseButton, 300);
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	// Multiple User
	public void changePolicyMultipleUser(Map<String, String> data) throws InterruptedException {
		element_Click(multiuserTab);
		Thread.sleep(1000);
		if (data.get("Policy") != null) {
			element_DropDownSelectByvisibleText(mChangePlcDD, data.get("Policy"));
		}
		Thread.sleep(1000);
		if (data.get("StartDate") != null) {
			String sDt = staticDateOrPlusMinusFromCurrentDate(data.get("StartDate"));
			element_Clear(mFromDtTxt);
			element_InputTextUsingActionClass(mFromDtTxt, sDt);
		}
		if (data.get("EndDate") != null) {
			String eDt = staticDateOrPlusMinusFromCurrentDate(data.get("EndDate"));
			element_Clear(mToDtTxt);
			element_InputTextUsingActionClass(mToDtTxt, eDt);
		}
		Thread.sleep(1000);
		if (data.get("NewPolicyName") != null) {
			Thread.sleep(500);
			element_Clear(mNewPlcNameTxt);
			element_dynamicDDSelect(mNewPlcNameTxt, data.get("NewPolicyName"));
			//element_TextBoxToClickOnTab(mNewPlcNameTxt);
			element_Click(blankSpace);
		}
		if (data.get("Remark") != null) {
			element_Clear(mRemarkTxt);
			element_InputTextUsingActionClass(mRemarkTxt, data.get("Remark"));
		}
		Thread.sleep(300);
		selectUsersOrGroupFromPicklist(data.get("UserId"), mUserId);
		element_Click(mApplyBtn);
		waitForElementClickable(validationMessageCloseButton, 1);
		String val=validationMessage();
		Assert.assertEquals(val, "Saved Successfully");
	}

}
