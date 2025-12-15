package PageObject.TimeAndAttendance;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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
import groovy.transform.Final;
import io.cucumber.datatable.DataTable;

public class ManualStatusCorrectionPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ManualStatusCorrectionPO.class);
	public ManualStatusCorrectionPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "_txtFromDt")
	private WebElement fromDtTxt;
	
	@FindBy(id = "_txtToDt")
	private WebElement toDtTxt;
	
	@FindBy(id = "cboManABPRMrk")
	private WebElement manualStatusMarkingDD;
	
	@FindBy(id = "txtRemark")
	private WebElement remarkTxt;
	
	@FindBy(xpath = "//*[@id='grpddl']")
	private WebElement selectUsersDD;
	
	@FindBy(id = "ID")
	private WebElement userIDTxt;
	
	@FindBy(xpath = "//*[@id='grpddl' and @class=\"form-control mx-input-theme ng-untouched ng-pristine ng-valid\"]")
	private WebElement groupDD;
	
	@FindBy(id = "grpname")
	private WebElement groupNameTxt;
	
	@FindBy(xpath = "//*[@default='Process']")
	private WebElement processBtn;
	
	@FindBy(xpath = "//*[@class='panel-group']")
	private List<WebElement> errorListTable;
	
	@FindBy(xpath = "//*[@default='Error List']")
	private WebElement errorListPanel;
	
	@FindBy(xpath = "//*[@default=\"Error List\"]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> errorListPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@class=\"panel-body no-padding\"]//table//tbody/tr/td[2]")
	private List<WebElement> manualCorrectionErrorRowsUserid;
	
	
	
	
	
	//*******************************************************************
	// Functions
	//************************************************************************
	public void manualStatusCorrection(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (data.get("FromDt") != null) {
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("FromDt"));
			element_Clear(fromDtTxt);
			element_InputTextUsingActionClass(fromDtTxt, date);
		}
		if (data.get("ToDt") != null) {
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("ToDt"));
			element_Clear(toDtTxt);
			element_InputTextUsingActionClass(toDtTxt, date);
		}
		Thread.sleep(1000);
		if (data.get("ManualStatusMarking") != null) {
			element_DropDownSelectByvisibleText(manualStatusMarkingDD, data.get("ManualStatusMarking"));
		}
		if (data.get("Remark") != null) {
			element_Clear(remarkTxt);
			element_InputTextUsingActionClass(remarkTxt, data.get("Remark"));
		}
		Thread.sleep(500);
		if (data.get("SelectUsers") != null) {
			element_DropDownSelectByvisibleText(selectUsersDD, data.get("SelectUsers"));
		}
		if (data.get("UserIDs") != null) {
			selectUsersOrGroupFromPicklist(data.get("UserIDs"), userIDTxt);
		}
		if (data.get("SelectGroup") != null) {
			element_DropDownSelectByvisibleText(groupDD, data.get("SelectGroup"));
		}
		if (data.get("GroupIDs") != null) {
			selectUsersOrGroupFromPicklist(data.get("GroupIDs"), userIDTxt);
		}
		Thread.sleep(500);
		element_Click(processBtn);
		element_DynamicwaitPerElement(validationMessageCloseButton, 120);
	}
	
	public void validateManualStatusCorrection(DataTable dataTable) throws InterruptedException {
		if (errorListTable.size()==0) {
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String msg = validationMessage();
				Assert.assertEquals(msg, data.get("Validation"));
			}
		} else {
			if (errorListPanelOpenOrNot.size()>0) {
				element_Click(errorListPanel);
			}
			Thread.sleep(1000);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("UserId: "+data.get("UserId"));
				String useridcheck = data.get("UserId");
				String validation = data.get("Validation");
//				if (validation.contains("This User's data is closed to be processed on ")) {
//					validation="This User's data is closed to be processed on "+staticDateOrPlusMinusFromCurrentDate("0");
//					logger.info(validation);
//				}
				ArrayList<String> errorUserList = new ArrayList<String>();
				for (int j = 0; j < manualCorrectionErrorRowsUserid.size(); j++) {
					String userid = manualCorrectionErrorRowsUserid.get(j).getText();
					errorUserList.add(userid);
					if (userid.equalsIgnoreCase(useridcheck)) {
						String val = manualCorrectionErrorRowsUserid.get(j).findElement(By.xpath("following-sibling::td[3]")).getText();
						Assert.assertEquals(val, validation);
					}
				}
				if (!errorUserList.contains(useridcheck)) {
					String val = "Process Completed";
					Assert.assertEquals(val, validation);
				}
			}
		}
	}

}
