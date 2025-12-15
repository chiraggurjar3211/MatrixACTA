package PageObject.UserModule;

import static org.testng.Assert.assertEquals;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.tools.ant.filters.LineContains.Contains;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovyjarjarantlr4.v4.parse.ANTLRParser.throwsSpec_return;
import io.cucumber.datatable.DataTable;

public class MultiUserConfigurationPO extends AbstractMethod {
	WebDriver driver;

	public MultiUserConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// ******************************************************************************
	// Elements
	// ********************************************************************************
	// User Selection tab
	@FindBy(xpath = "//*[contains(@class,'tab-items')]//*[text()='User Selection']//ancestor::a")
	private WebElement userSelectionTab;

	@FindBy(id = "ID")
	private WebElement userIDTxt;

	// T&A tab
	@FindBy(xpath = "//*[contains(@class,'tab-items')]//*[text()='T&A']//ancestor::a")
	private WebElement timeattendanceTab;

	@FindBy(id = "ChkSelATDPLC")
	private WebElement attendancePolicyUpdateFlag;

	@FindBy(id = "atdName")
	private WebElement attendancePolicyNameTxt;

	@FindBy(id = "ChkSelLateInPLC")
	private WebElement lateinPolicyUpdateFlag;

	@FindBy(id = "lipName")
	private WebElement lateinPolicyNameTxt;

	@FindBy(id = "ChkSelOTPLC")
	private WebElement overtimePolicyUpdateFlag;

	@FindBy(id = "otpName")
	private WebElement overtimePolicyNameTxt;

	@FindBy(id = "ChkSelABPLC")
	private WebElement absenteePolicyUpdateFlag;

	@FindBy(id = "abpName")
	private WebElement absenteePolicyNameTxt;

	@FindBy(id = "ChkSelEarlyOutPLC")
	private WebElement earlyOutPolicyUpdateFlag;

	@FindBy(id = "eopName")
	private WebElement earlyOutPolicyNameTxt;

	@FindBy(id = "ChkSelCOFFPLC")
	private WebElement cOffPolicyUpdateFlag;

	@FindBy(id = "copName")
	private WebElement cOffPolicyNameTxt;

	// General
	@FindBy(xpath = "//*[@default='Update' and @class=\"btn btn-sm btn-label-modal mx-input-theme ng-scope ng-isolate-scope\"]")
	private WebElement updateBtn;

	// Devices tab
	@FindBy(xpath = "//*[contains(@class,'tab-items')]//*[text()='Devices']//ancestor::a")
	private WebElement devicesTab;

	@FindBy(id = "Revoke")
	private WebElement revokeRadioBtn;

	@FindBy(id = "ChkSelDG")
	private WebElement updateCheckbox;

	@FindBy(id = "deviceSelectionName")
	private WebElement deviceNameTxt;

	@FindBy(id = "deviceName")
	private WebElement deviceGroupNameTxt;

	@FindBy(xpath = "//*[@id='div_grd_deviceselection']//*[@key='Search']")
	private WebElement deviceSearch;

	@FindBy(xpath = "//*[@id=\"div_grd_deviceselection\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> assignDeviceTable;

	@FindBy(xpath = "//*[@class=\"mx-input-theme label-bold label-text\"]")
	private WebElement configurePageLabel;

	@FindBy(id = "cboAGListSelectedValue")
	private WebElement configurePageAcsProfileDD;

	@FindBy(xpath = "//*[@key=\"btnSelOK\"]")
	private WebElement configrePageOKButton;

	// Group Tab
	@FindBy(xpath = "//*[contains(@class,'tab-items')]//*[text()='Group']//ancestor::a")
	private WebElement groupTab;

	@FindBy(id = "ChkSelOrg")
	private WebElement organizationUpdateFlag;

	@FindBy(id = "orgName")
	private WebElement organizationTxt;
	
	@FindBy(xpath="//*[@default=\"C-OFF Policy\"]")
	private WebElement cofP;

	// **********************************************************************************
	// Functions
	// **********************************************************************************

	// Mayank
	public void multiUserConfiguration(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		// User selection tab
		element_Click(userSelectionTab);
		selectUsersOrGroupFromPicklist(data.get("UserID"), userIDTxt);
		Thread.sleep(1000);
		// T&A tab
		if (data.get("AttendancePlc") != null || data.get("AbsenteePlc") != null || data.get("OvertimePlc") != null
				|| data.get("LateInPlc") != null || data.get("EarlyOutPlc") != null || data.get("CoffPlc") != null) {
			element_Click(timeattendanceTab);
			Thread.sleep(1000);
			element_Click(cofP);
			if (data.get("AttendancePlc") != null) {
				element_Click(attendancePolicyUpdateFlag);
				element_Clear(attendancePolicyNameTxt);
				element_InputTextUsingActionClass(attendancePolicyNameTxt, data.get("AttendancePlc"));
				Thread.sleep(1000);
				element_Click(timeattendanceTab);
				Thread.sleep(1000);
			}
			Thread.sleep(500);
			if (data.get("AbsenteePlc") != null) {
				element_Click(absenteePolicyUpdateFlag);
				Thread.sleep(500);
				element_Clear(absenteePolicyNameTxt);
				Thread.sleep(500);
				element_InputTextUsingActionClass(absenteePolicyNameTxt, data.get("AbsenteePlc"));
				Thread.sleep(1000);
				element_Click(timeattendanceTab);
				Thread.sleep(1000);
			}
			Thread.sleep(500);
			if (data.get("OvertimePlc") != null) {
				element_Click(overtimePolicyUpdateFlag);
				element_Clear(overtimePolicyNameTxt);
				element_InputTextUsingActionClass(overtimePolicyNameTxt, data.get("OvertimePlc"));
				Thread.sleep(1000);
				element_Click(timeattendanceTab);
				Thread.sleep(1000);;
			}
			Thread.sleep(500);
			if (data.get("LateInPlc") != null) {
				element_Click(lateinPolicyUpdateFlag);
				element_Clear(lateinPolicyNameTxt);
				element_InputTextUsingActionClass(lateinPolicyNameTxt, data.get("LateInPlc"));
				Thread.sleep(1000);
				element_Click(timeattendanceTab);
				Thread.sleep(1000);
			}
			Thread.sleep(500);
			if (data.get("EarlyOutPlc") != null) {
				element_Click(earlyOutPolicyUpdateFlag);
				element_Clear(earlyOutPolicyNameTxt);
				element_InputTextUsingActionClass(earlyOutPolicyNameTxt, data.get("EarlyOutPlc"));
				Thread.sleep(1000);
				element_Click(timeattendanceTab);
				Thread.sleep(1000);
			}
			Thread.sleep(500);
			if (data.get("CoffPlc") != null) {
				element_Click(cOffPolicyUpdateFlag);
				element_Clear(cOffPolicyNameTxt);
				element_InputTextUsingActionClass(cOffPolicyNameTxt, data.get("CoffPlc"));
				Thread.sleep(1000);
				element_Click(timeattendanceTab);
				Thread.sleep(1000);
			}
			Thread.sleep(500);
		}
		if (data.get("DeviceName") != null || data.get("AccessProfile") != null
				|| data.get("RevokeDevice/DeviceGroup") != null || data.get("Update") != null
				|| data.get("DeviceGroupName") != null) {
			element_Click(devicesTab);
			Thread.sleep(1000);
			if (data.get("RevokeDevice/DeviceGroup") != null) {
				boolean assignDeviceDeviceGroup = Boolean.parseBoolean(data.get("RevokeDevice/DeviceGroup"));
				if (assignDeviceDeviceGroup == true) {
					if (element_isSelected(revokeRadioBtn) != true) {
						element_Click(revokeRadioBtn);
					}
				}
			}
			if (data.get("Update") != null) {
				boolean update1 = Boolean.parseBoolean(data.get("Update"));
				if (update1 == true) {
					if (element_isSelected(updateCheckbox) != true) {
						element_Click(updateCheckbox);
					}
				} else {
					if (element_isSelected(updateCheckbox) == true) {
						element_Click(updateCheckbox);
					}
				}
				Thread.sleep(1000);
			}
			if (data.get("DeviceName") != null) {
				selectUsersOrGroupFromPicklist(data.get("DeviceName"), deviceNameTxt);
				Thread.sleep(1000);
			}
			if (data.get("DeviceGroupName") != null) {
				if (element_isEnabled(deviceGroupNameTxt) == true) {
					selectUsersOrGroupFromPicklist(data.get("DeviceGroupName"), deviceGroupNameTxt);
					Thread.sleep(1000);
				}
			}
			if (data.get("AccessProfile") != null && data.get("DeviceName") != null) {
				if (element_isEnabled(deviceSearch)) {
					element_Clear(deviceSearch);
					element_InputTextUsingActionClass(deviceSearch, data.get("DeviceName"));
					element_TextBoxToClickOnEnter(deviceSearch);
					Thread.sleep(700);
					for (int i = 0; i < assignDeviceTable.size(); i++) {
						String actDeviceName = assignDeviceTable.get(i).getText();
						if (data.get("DeviceName").equalsIgnoreCase(actDeviceName)) {
							WebElement configureIcon = assignDeviceTable.get(i)
									.findElement(By.xpath("following-sibling::td[not(@hidden)][2]/img"));
							element_Click(configureIcon);
							Thread.sleep(2000);
							waitForElementVisible(configurePageLabel);
							if (data.get("AccessProfile") != null) {
								element_DropDownSelectByvisibleText(configurePageAcsProfileDD,
										data.get("AccessProfile"));
							}
						}
					}
					Thread.sleep(1000);
					element_Click(configrePageOKButton);
					Thread.sleep(1500);
				}
			}
		}
		if (data.get("Organization") != null || data.get("Branch") != null || data.get("Department") != null
				|| data.get("Section") != null || data.get("Category") != null || data.get("Grade") != null
				|| data.get("Designation") != null || data.get("Custom Group 1") != null
				|| data.get("Custom Group 2") != null || data.get("Custom Group 3") != null
				|| data.get("Reporting Group") != null || data.get("Approval Policy") != null
				|| data.get("Leave Group") != null || data.get("Week Off Group") != null) {
			element_Click(groupTab);
			Thread.sleep(1000);
			if (data.get("Organization") != null) {
				element_Click(organizationUpdateFlag);
				Thread.sleep(500);
				element_Clear(organizationTxt);
				element_InputTextUsingActionClass(organizationTxt, data.get("Organization"));
				Thread.sleep(1000);
				element_Click(groupTab);
				Thread.sleep(1000);
			}
		}
		Thread.sleep(1000);
		element_ClickUsingJS(updateBtn);
		element_DynamicwaitPerElement(validationMessageCloseButton, 120);
		String val = validationMessage();
		Assert.assertEquals(val, "Process Completed");
		Thread.sleep(1000);
		reloadPageButtonClick();
	}

}
