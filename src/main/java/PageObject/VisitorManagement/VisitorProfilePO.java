package PageObject.VisitorManagement;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import PageObject.UserModule.UserConfigurationPO;

public class VisitorProfilePO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(VisitorProfilePO.class);
	public VisitorProfilePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//*******************************************************
	// ELEMENTS
	//********************************************************
	@FindBy(id = "ChkUserEnbl")
	private WebElement active;
	
	@FindBy(id = "AutoUserID")
	private WebElement userId;
	
	@FindBy(id = "AutoUserName")
	private WebElement userName;
	
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='Group']")
	private WebElement groupTab;
	
	@FindBy(id = "UserConfigAutoOrganizationName")
	private WebElement userConfigOrganizationGroupName;

	@FindBy(id = "UserConfigAutoBranchName")
	private WebElement userConfigBranchGroupName;
	
	@FindBy(id = "UserConfigAutoDepartmentName")
	private WebElement userConfigDepartmentGroupName;
	
	@FindBy(id = "UserConfigAutoSectionName")
	private WebElement userConfigSectionGroupName;
	
	@FindBy(id = "UserConfigAutoCategoryName")
	private WebElement userConfigCategoryGroupName;
	
	@FindBy(id = "UserConfigAutoGradeName")
	private WebElement userConfigGradeGroupName;
	
	@FindBy(id = "UserConfigAutoDesignationName")
	private WebElement userConfigDesignationGroupName;
	
	@FindBy(id = "UserConfigAutoCustGRp1Name")
	private WebElement userConfigCustomGroup1GroupName;
	
	@FindBy(id = "UserConfigAutoCustGRp2Name")
	private WebElement userConfigCustomGroup2GroupName;
	
	@FindBy(id = "UserConfigAutoCustGRp3Name")
	private WebElement userConfigCustomGroup3GroupName;
	
	@FindBy(xpath = "//*[text()='Devices']")
	private WebElement deviceTab;
	
	@FindBy(xpath = "//*[text()='Configure']")
	private WebElement configureTab;
	
	@FindBy(xpath = "//*[@class='fieldset_width']//*[@class='tab-fieldset' and not(@hidden)]//*[@default='Device']/ancestor::div[@class='form-group']//select")
	private WebElement deviceDD;
	
	@FindBy(xpath = "//*[@class='fieldset_width']//*[@class='tab-fieldset' and not(@hidden)]//*[@default='Access Profile']/ancestor::div[@class='form-group']//select")
	private WebElement accessProfileDD;
	
	// Mayank
	public String visitorProfileAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data) {
		String apiPar = null;
		if (columnHeader.contains("id")) {
			if (data.get("id") != null) {
				apiParameter.add("id=" + data.get("id"));
			}
		}
		if (columnHeader.contains("name")) {
			if (data.get("name") != null) {
				apiParameter.add("name=" + data.get("name"));
			}
		}
		if (columnHeader.contains("active")) {
			if (data.get("active") != null) {
				apiParameter.add("active=" + data.get("active"));
			}
		}
		return apiPar;
	}
	
	// Mayank
	public String groupAssignToVisitorProfile(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		addButtonClick();
		waitForElementClickable(active);
		element_InputTextUsingActionClass(userId, data.get("ProfileID"));
		element_TextBoxToClickOnTab(userId); // This method use for userid control to click on tab
		waitForElementNotToBeClickable(userId); // This line added by chirag gurjar
		element_Click(groupTab);
		Thread.sleep(1000);
		if (data.get("Organization") != null) { 
			element_Clear(userConfigOrganizationGroupName);
			Thread.sleep(500);
			element_InputTextUsingActionClass(userConfigOrganizationGroupName, data.get("Organization"));
			element_TextBoxToClickOnTab(userConfigOrganizationGroupName);
			Thread.sleep(1000);
		}
		if (data.get("Branch") != null) { 
			element_Clear(userConfigBranchGroupName);
			Thread.sleep(500);
			element_InputTextUsingActionClass(userConfigBranchGroupName, data.get("Branch"));
			element_TextBoxToClickOnTab(userConfigBranchGroupName);
			Thread.sleep(1000);
		}
		if (data.get("Department") != null) { 
			element_Clear(userConfigDepartmentGroupName);
			Thread.sleep(500);
			element_InputTextUsingActionClass(userConfigDepartmentGroupName, data.get("Department"));
			element_TextBoxToClickOnTab(userConfigDepartmentGroupName);
			Thread.sleep(1000);
		}
		if (data.get("Section") != null) { 
			element_Clear(userConfigSectionGroupName);
			Thread.sleep(500);
			element_InputTextUsingActionClass(userConfigSectionGroupName, data.get("Section"));
			element_TextBoxToClickOnTab(userConfigSectionGroupName);
			Thread.sleep(1000);
		}
		if (data.get("Category") != null) { 
			element_Clear(userConfigCategoryGroupName);
			Thread.sleep(500);
			element_InputTextUsingActionClass(userConfigCategoryGroupName, data.get("Category"));
			element_TextBoxToClickOnTab(userConfigCategoryGroupName);
			Thread.sleep(1000);
		}
		if (data.get("Grade") != null) { 
			element_Clear(userConfigGradeGroupName);
			Thread.sleep(500);
			element_InputTextUsingActionClass(userConfigGradeGroupName, data.get("Grade"));
			element_TextBoxToClickOnTab(userConfigGradeGroupName);
			Thread.sleep(1000);
		}
		if (data.get("Designation") != null) { 
			element_Clear(userConfigDesignationGroupName);
			Thread.sleep(500);
			element_InputTextUsingActionClass(userConfigDesignationGroupName, data.get("Designation"));
			element_TextBoxToClickOnTab(userConfigDesignationGroupName);
			Thread.sleep(1000);
		}
		if (data.get("Custom Group 1") != null) { 
			element_Clear(userConfigCustomGroup1GroupName);
			Thread.sleep(500);
			element_InputTextUsingActionClass(userConfigCustomGroup1GroupName, data.get("Custom Group 1"));
			element_TextBoxToClickOnTab(userConfigCustomGroup1GroupName);
			Thread.sleep(1000);
		}
		if (data.get("Custom Group 2") != null) { 
			element_Clear(userConfigCustomGroup2GroupName);
			Thread.sleep(500);
			element_InputTextUsingActionClass(userConfigCustomGroup2GroupName, data.get("Custom Group 2"));
			element_TextBoxToClickOnTab(userConfigCustomGroup2GroupName);
			Thread.sleep(1000);
		}
		if (data.get("Custom Group 3") != null) { 
			element_Clear(userConfigCustomGroup3GroupName);
			Thread.sleep(500);
			element_InputTextUsingActionClass(userConfigCustomGroup3GroupName, data.get("Custom Group 3"));
			element_TextBoxToClickOnTab(userConfigCustomGroup3GroupName);
			Thread.sleep(1000);
		}
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(1000);
		String valmsg = validationMessage();
		return valmsg;

	}
	
	
	public void createVisitorProfile(List<String> columnHeader, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		addButtonClick();
		waitForElementClickable(active);
			element_InputTextUsingActionClass(userId, data.get("ID"));
			element_TextBoxToClickOnTab(userId); // This method use for userid control to click on tab
		pageLoadWaitng();
		Thread.sleep(2000);
		element_Clear(userName);
		element_InputTextUsingActionClass(userName, data.get("ID"));
		// ******************************************
		// ******Basic Tab***************************
		// ******************************************
		if (columnHeader.contains("Active")) {
			if (data.get("Active") != null) {
				boolean activeC = Boolean.parseBoolean(data.get("Active"));
				if (activeC == true) {
					if (element_isSelected(active) != true) {
						element_Click(active);
					}
				} else {
					if (element_isSelected(active) == true) {
						element_Click(active);
					}
				}
			}
		}
		// *****************************************************************
				// ********** Group tab **************************************
				// ****************************************************************
				if (data.get("Organization") != null) {
					Thread.sleep(1000);
					element_Click(groupTab);
					waitForElementVisible(userConfigOrganizationGroupName);
					Thread.sleep(1000);
					if (data.get("Organization") != null) { 
						element_Clear(userConfigOrganizationGroupName);
						Thread.sleep(500);
						element_InputTextUsingActionClass(userConfigOrganizationGroupName, data.get("Organization"));
						element_TextBoxToClickOnTab(userConfigOrganizationGroupName);
						Thread.sleep(1000);
					}
				}
		saveButtonClick();
		Assert.assertEquals(validationMessage(), data.get("Validation"));
	}
	
	public void verifyDeviceConfigurations(String vpId, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userId);
		element_InputTextUsingActionClass(userId, vpId);
		element_TextBoxToClickOnTab(userId); 
		Thread.sleep(3000);
		waitForElementClickable(active);
		if (!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			element_Click(deviceTab);
			Thread.sleep(1000);
			if(data.get("Device") != null) {
				element_Click(configureTab);
				Thread.sleep(1000);
				element_DropDownSelectByvisibleText(deviceDD, data.get("Device"));
				Thread.sleep(1000);
				if(data.get("AccessProfile") != null) {
					String actualValue = element_DropDownFirstSelectedValue(accessProfileDD);
					logger.info("actualValue= "+actualValue);
					Assert.assertEquals(actualValue, data.get("AccessProfile"));
				}
			}
		}else {
			Assert.assertEquals(userName.getAttribute("value"), userName);
			logger.info(vpId+" Not Found");
		}
	}
}
