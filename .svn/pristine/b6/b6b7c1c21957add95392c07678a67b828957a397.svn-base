package PageObject.LeaveManagement;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class LeaveCreditDebitEncashPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(LeaveCreditDebitEncashPO.class);
	
	public LeaveCreditDebitEncashPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "ddlPeriod")
	private WebElement period;

	@FindBy(id = "entryType")
	private WebElement entryType;

	@FindBy(id = "apMonth")
	private WebElement month;

	@FindBy(id = "apYear")
	private WebElement year;

	@FindBy(id = "autoLinkedLeaveID")
	private WebElement leaveID;

	@FindBy(id = "creditMode")
	private WebElement creditMode;

	@FindBy(id = "creditValue")
	private WebElement creditValue;

	@FindBy(id = "creditValue")
	private WebElement debitValue;

	@FindBy(id = "creditValue")
	private WebElement encashValue;

	@FindBy(id = "encashmentMode")
	private WebElement encashMode;

	@FindBy(id = "LeavePolicyName")
	private WebElement accrualPolicy;

	@FindBy(id = "LeavePolicyYearlyName")
	private WebElement accrualPolicyYearlyPrd;

	@FindBy(id = "LeavePolicyHourlyName")
	private WebElement hourlyAccrualPolicyMonthPrdTxt;
	
	@FindBy(id = "LeavePolicyYearlyHourlyName")
	private WebElement hourlyAccrualPolicyYearlyPrdTxt;

	@FindBy(id = "ID")
	private WebElement userid;

	@FindBy(id = "applyProData")
	private WebElement applyProrata;

	@FindBy(id = "btnSave")
	private WebElement applyButton;

	@FindBy(id = "grpddl")
	private WebElement selectUserDrop;

	@FindBy(xpath = "//*[@class='form-control mx-input-theme ng-untouched ng-pristine ng-valid' and @id='grpddl']")
	private WebElement selectGroupDrop;

	@FindBy(id = "grpname")
	private WebElement groupNameTxt;

	@FindBy(id = "txtCreditValue_1")
	private WebElement hhhTxt;

	@FindBy(id = "txtCreditValue_2")
	private WebElement mmTxt;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private WebElement statusColumn;

	// Created by Mayank
	// Leave Credit Debit Encash via API
	public String LeaveCreditDebitEncashAPI(List<String> columnHeader, List<String> apiParameter,
			Map<String, String> data) throws Exception {
		String apiPar = null;

		if (columnHeader.contains("Action")) {
			if (data.get("Action") != null) {
				apiParameter.add("Action=" + data.get("Action"));
			}
		}
		if (columnHeader.contains("userid")) {
			if (data.get("userid") != null) {
				apiParameter.add("userid=" + data.get("userid"));
			}
		}
		if (columnHeader.contains("entry-type")) {
			if (data.get("entry-type") != null) {
				apiParameter.add("entry-type=" + data.get("entry-type"));
			}
		}
		if (columnHeader.contains("credit-mode")) {
			if (data.get("credit-mode") != null) {
				apiParameter.add("credit-mode=" + data.get("credit-mode"));
			}
		}
		if (columnHeader.contains("encashment-type")) {
			if (data.get("encashment-type") != null) {
				apiParameter.add("encashment-type=" + data.get("encashment-type"));
			}
		}
		if (columnHeader.contains("encashment-mode")) {
			if (data.get("encashment-mode") != null) {
				apiParameter.add("encashment-mode=" + data.get("encashment-mode"));
			}
		}
		if (columnHeader.contains("days")) {
			if (data.get("days") != null) {
				apiParameter.add("days=" + data.get("days"));
			}
		}
		if (columnHeader.contains("c-offhrs")) {
			if (data.get("c-offhrs") != null) {
				apiParameter.add("c-offhrs=" + data.get("c-offhrs"));
			}
		}
		if (columnHeader.contains("accrual-policy")) {
			if (data.get("accrual-policy") != null) {
				apiParameter.add("accrual-policy=" + data.get("accrual-policy"));
			}
		}
		if (columnHeader.contains("leave-code")) {
			if (data.get("leave-code") != null) {
				apiParameter.add("leave-code=" + data.get("leave-code"));
			}
		}
		if (columnHeader.contains("period")) {
			if (data.get("period") != null) { // If null then getting error in API res
				apiParameter.add("period=" + data.get("period"));
			}
		}
		if (columnHeader.contains("month")) {
			if (data.get("month") != null) {
				String monthConvert = integerMonthSelected(data.get("month"));
				apiParameter.add("month=" + monthConvert);
			}
		}
		if (columnHeader.contains("year")) {
			if (data.get("year") != null) {
				String yearConvert = integerYearSelected(data.get("year"));
				apiParameter.add("year=" + yearConvert);
			}
		}
		if (columnHeader.contains("pro-rata")) {
			if (data.get("pro-rata") != null) {
				apiParameter.add("pro-rata=" + data.get("pro-rata"));
			}
		}
		if (columnHeader.contains("remark")) {
			if (data.get("remark") != null) {
				apiParameter.add("remark=" + data.get("remark"));
			}
		}
		if (columnHeader.contains("hours")) {
			if (data.get("hours") != null) {
				apiParameter.add("hours=" + data.get("hours"));
			}
		}

		return apiPar;
	}

	// Created by Mitali
	public String crediDebitEncashtLeave(String entType, String prd, String mnth, String yr, String lvID, String crMode,
			String accrlPolicy, String crValue, String dbValue, String encMode, String encValue, Boolean aplyProrata,
			String selectUsers, String userIds, String group, String groupIDs, String timeHHH, String timeMM,
			String status, String hourlyAccrPlcName) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		element_DropDownSelectByvisibleText(period, prd);
		Thread.sleep(500);
		element_DropDownSelectByvisibleText(entryType, entType);
		Thread.sleep(1000);
		if (mnth != null) {
			String selectM = staticMonthOrPlusMinusMonthFromCurrentMonth(mnth);
			element_DropDownSelectByvisibleText(month, selectM);
			Thread.sleep(1000);
		}
		if (yr != null) {
			if (year.isDisplayed()) {
				String selectY = staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(yr);
				element_DropDownSelectByvisibleText(year, selectY);
				Thread.sleep(1000);
			}
		}
		switch (entType) {
		case "Credit":
			element_Clear(leaveID);
			element_InputTextUsingActionClass(leaveID, lvID);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(leaveID);
			
//			element_TextBoxToClickOnEnter(leaveID);
			Thread.sleep(1500);
			if (crMode != null) {
				element_DropDownSelectByvisibleText(creditMode, crMode);
				Thread.sleep(1500);
			}
			if (crValue != null) {
				if (creditValue.isDisplayed()) {
					waitForElementVisible(creditValue);
					element_Clear(creditValue);
					element_InputTextUsingActionClass(creditValue, crValue);
					element_TextBoxToClickOnTab(creditValue);
					Thread.sleep(1000);
				}
			}
			if (timeHHH != null) {
				waitForElementVisible(hhhTxt);
				element_Clear(hhhTxt);
				element_InputTextUsingActionClass(hhhTxt, timeHHH);
				element_TextBoxToClickOnTab(hhhTxt);
				Thread.sleep(1000);
			}
			if (timeMM != null) {
				element_Clear(mmTxt);
				element_InputTextUsingActionClass(mmTxt, timeMM);
				element_TextBoxToClickOnTab(mmTxt);
				Thread.sleep(1000);
			}
			if (accrlPolicy != null) {
				if (prd.equalsIgnoreCase("Monthly")) {
					// waitForElementVisible(accrualPolicy);
					element_InputTextUsingActionClass(accrualPolicy, accrlPolicy);
					Thread.sleep(500);
					element_TextBoxToClickOnTab(accrualPolicy);
					Thread.sleep(1000);
				}
				if (prd.equalsIgnoreCase("Yearly")) {
					// waitForElementVisible(accrualPolicyYearlyPrd);
					element_InputTextUsingActionClass(accrualPolicyYearlyPrd, accrlPolicy);
					Thread.sleep(500);
					element_TextBoxToClickOnTab(accrualPolicyYearlyPrd);
					Thread.sleep(1000);
				}
			}
			if (hourlyAccrPlcName != null) {
				if (prd.equalsIgnoreCase("Monthly")) {
					element_InputTextUsingActionClass(hourlyAccrualPolicyMonthPrdTxt, hourlyAccrPlcName);
					Thread.sleep(500);
					element_TextBoxToClickOnTab(hourlyAccrualPolicyMonthPrdTxt);
					Thread.sleep(1000);
				}
				if(prd.equalsIgnoreCase("Yearly")) {
					element_InputTextUsingActionClass(hourlyAccrualPolicyYearlyPrdTxt, hourlyAccrPlcName);
					Thread.sleep(500);
					element_TextBoxToClickOnTab(hourlyAccrualPolicyYearlyPrdTxt);
					Thread.sleep(1000);
				}
			}
			if (aplyProrata != null) {
				if (aplyProrata == true) {
					if (!applyProrata.isSelected()) {
						element_Click(applyProrata);
						Thread.sleep(1000);
					}
				} else {
					if (applyProrata.isSelected()) {
						element_Click(applyProrata);
						Thread.sleep(1000);
					}
				}
			}
			break;

		case "Debit":
			element_InputTextUsingActionClass(leaveID, lvID);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(leaveID);
//			element_TextBoxToClickOnEnter(leaveID);
			Thread.sleep(1000);
			if (dbValue != null) {
				element_Clear(debitValue);
				element_InputTextUsingActionClass(debitValue, dbValue);
				element_TextBoxToClickOnTab(debitValue);
				Thread.sleep(1000);
			}
			if (timeHHH != null) {
				waitForElementVisible(hhhTxt);
				element_Clear(hhhTxt);
				element_InputTextUsingActionClass(hhhTxt, timeHHH);
				element_TextBoxToClickOnTab(hhhTxt);
				Thread.sleep(1000);
			}
			if (timeMM != null) {
				element_Clear(mmTxt);
				element_InputTextUsingActionClass(mmTxt, timeMM);
				element_TextBoxToClickOnTab(mmTxt);
				Thread.sleep(1000);
			}
			break;

		case "Encashment":
			element_Clear(leaveID);
			element_InputTextUsingActionClass(leaveID, lvID);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(leaveID);
			Thread.sleep(2000);
			if (encMode != null) {
				element_DropDownSelectByvisibleText(encashMode, encMode);
				// Thread.sleep(3000);
				Thread.sleep(1000);
			}
			if (encValue != null) {
				if (encashValue.isEnabled()) {
					element_Clear(encashValue);
					element_InputTextUsingActionClass(encashValue, encValue);
					element_TextBoxToClickOnTab(encashValue);
					Thread.sleep(1000);
				}
			}
			if (timeHHH != null) {
				waitForElementVisible(hhhTxt);
				element_Clear(hhhTxt);
				element_InputTextUsingActionClass(hhhTxt, timeHHH);
				element_TextBoxToClickOnTab(hhhTxt);
				Thread.sleep(1000);
			}
			if (timeMM != null) {
				element_Clear(mmTxt);
				element_InputTextUsingActionClass(mmTxt, timeMM);
				element_TextBoxToClickOnTab(mmTxt);
				Thread.sleep(1000);
			}
			break;

		default:
			logger.debug("No Data Found");
			break;
		}
		if (selectUsers != null) {
			element_DropDownSelectByvisibleText(selectUserDrop, selectUsers);
			Thread.sleep(1000);
		}
		if (userIds != null) {
			selectUsersOrGroupFromPicklist(userIds, userid);
		}
		if (group != null) {
			element_DropDownSelectByvisibleText(selectGroupDrop, group);
			Thread.sleep(500);
		}
		if (groupIDs != null) {
			selectUsersOrGroupFromPicklist(groupIDs, groupNameTxt);
		}
		if (applyButton.isEnabled()) {
			element_Click(applyButton);
			Thread.sleep(1000);
		}
		if (status != null) {
			boolean actual=false;
			String[] statussplit=status.split(",");
			String actStatus = statusColumn.getText();
			Thread.sleep(1000);
			logger.debug("actStatus = " + actStatus);
			if(actStatus.equalsIgnoreCase(statussplit[0]) ||actStatus.equalsIgnoreCase(statussplit[1].trim())) {
				actual=true;
				Assert.assertEquals(actual, true);
			}
			else {
				Assert.assertEquals(actual, true);
			}
		}
		val = validationMessage();
		Thread.sleep(1000);
		reloadPageButtonClick();
		return val;
	}
}
