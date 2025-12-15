package PageObject.AdminModule;

import static org.testng.AssertJUnit.assertEquals;

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

import com.google.inject.Key;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;
import net.bytebuddy.asm.Advice.Enter;

public class SystemAccountPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(SystemAccountPO.class);

	public SystemAccountPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "txtLoginID")
	private WebElement saID;

	@FindBy(id = "txtLoginName")
	private WebElement saName;

	@FindBy(xpath = "//*[@key='Optional']")
	private WebElement optionalPanel;

	@FindBy(id = "AutoLinkedEssID")
	private WebElement linkedEssID;

	@FindBy(id = "chkAPI")
	private WebElement apiAccessFlag;

	@FindBy(xpath = "//input[@id='cmnBtnTxtSearch']")
	private WebElement searchTextBoxTitleBar;

	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[2]")
	private List<WebElement> saNames;

	@FindBy(id = "btnResetPwd")
	private WebElement resetPwd;

	@FindBy(xpath = "//*[text()='ID']")
	private WebElement labelID;

	@FindBy(id = "cmbRole")
	private WebElement roleName;

	@FindBy(xpath = "//*[@id='cmbRole']/option")
	private List<WebElement> roleNames;

	@FindBy(id = "SelectModule")
	private WebElement moduleDropdown;

	@FindBy(id = "SelectPage")
	private WebElement pageDropdown;

	@FindBy(xpath = "//*[@key='Group-Wise Rights']")
	private WebElement groupWiseRightsPanel;

	@FindBy(xpath = "(//*[@id=\"collapseTwo\"]//*[@id=\"grpddl\"])[1]")
	private WebElement selectUsersDropdown;

	@FindBy(xpath = "(//*[@id=\"collapseTwo\"]//*[@id=\"grpddl\"])[2]")
	private WebElement selectGroupDropdown;

	@FindBy(xpath = "(//*[@id=\"collapseTwo\"]//*[@id=\"grpddl\"])[2]")
	private List<WebElement> selectGroupDropdown1;

	@FindBy(xpath = "//*[@gridname='groupSelectionGrid']//table//tbody/tr")
	private List<WebElement> groupWiseRightGridRow;

	@FindBy(id = "EnblReportExportOutFlg")
	private WebElement reportInPDFChk;

	@FindBy(id = "grpname")
	private WebElement groupNameTxt;

	@FindBy(id = "chkActive")
	private WebElement activeChk;

	@FindBy(xpath = "//*[@id='message']/div/label")
	private List<WebElement> validationMessages;

	@FindBy(id = "chkActive")
	private WebElement activeCheckbox;

	@FindBy(id = "btnResetPwd")
	private WebElement resetBt;

	@FindBy(id = "txtLoginID")
	private WebElement idTxt;

	// Created by Mayank
	// last updated Chhaya
	public String createSystemAccount(String systemAcID, String active, String linkESSUser, String apiAccess,
			String role, String moduleName1, String menuName, String reportInPDF) throws InterruptedException {
		String valMsg = null;
		waitForElementVisible(saName);
		if (element_isEnabled(searchTextBoxTitleBar) == true) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, systemAcID);
			searchTextBoxTitleBar.sendKeys(Keys.ENTER);
			Thread.sleep(500);
			for (int i = 0; i < saNames.size(); i++) {
				if (saNames.get(i).getText().equalsIgnoreCase(systemAcID)) {
					saNames.get(i).click();
					waitForElementDisable(saID);
					break;
				}
			}
			if (addButton.isEnabled()) {
				addButtonClick();
				waitForElementClickable(activeChk);
				Thread.sleep(1000);
				element_InputTextUsingActionClass(saID, systemAcID);
				element_Click(saName);
			}
			element_Click(saName);
			element_Clear(saName);
			element_InputTextUsingActionClass(saName, systemAcID);
			// element_TextBoxToClickOnTab(saName);
			// pageLoadWaitng();
			// Chhaya
			if (role != null) {
				element_Click(roleName);
				for (WebElement mn : roleNames) {
					if (mn.getText().contains(role)) {
						element_Click(mn);
						Thread.sleep(1000);
						break;
					}
				}
			}
			if (active != null) {
				boolean active1 = Boolean.parseBoolean(active);
				if (active1 == true) {
					if (element_isSelected(activeCheckbox) != true) {
						element_Click(activeCheckbox);
					}
				} else {
					if (element_isSelected(activeCheckbox) == true) {
						element_Click(activeCheckbox);
					}
				}
			}
			element_Click(optionalPanel);
			Thread.sleep(1000);
			if (linkESSUser != null) {
				element_Clear(linkedEssID);
				element_dynamicDDSelect(linkedEssID, linkESSUser);

			}
			if (reportInPDF != null) {
				boolean reportInPDF1 = Boolean.parseBoolean(reportInPDF);
				if (reportInPDF1 == true) {
					if (element_isSelected(reportInPDFChk) != true) {
						element_Click(reportInPDFChk);
					}
				} else {
					if (element_isSelected(reportInPDFChk) == true) {
						element_Click(reportInPDFChk);
					}
				}
			}
			if (moduleName1 != null) {
				Thread.sleep(1500);
				element_Click(moduleDropdown);
				element_DropDownSelectByvisibleText(moduleDropdown, moduleName1);
			}
			if (menuName != null) {
				Thread.sleep(500);
				element_Click(pageDropdown);
				element_DropDownSelectByvisibleText(pageDropdown, menuName);
			}
			if (apiAccess != null) {
				Boolean apiAccess1 = Boolean.parseBoolean(apiAccess);
				if (apiAccess1 == true) {
					if (!apiAccessFlag.isSelected()) {
						element_Click(apiAccessFlag);
					}
				} else {
					if (apiAccessFlag.isSelected()) {
						element_Click(apiAccessFlag);
					}
				}
			}
			Thread.sleep(250);
			saveButtonClick();
			if (validationMessages.size() == 0) {
				saveButtonClick();
			}
			valMsg = validationMessage();
			element_Click(optionalPanel);
		}
		return valMsg;
	}

	// Created by Mayank
	public void resetSystemAccountPwd(String systemAcID) throws InterruptedException {
		element_Clear(searchTextBoxTitleBar);
		element_InputTextUsingActionClass(searchTextBoxTitleBar, systemAcID);
		Thread.sleep(1000);
		searchTextBoxTitleBar.sendKeys(Keys.ENTER);
		Thread.sleep(1000);
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < saNames.size(); i++) {
			list.add(saNames.get(i).getText());
			if (saNames.get(i).getText().equalsIgnoreCase(systemAcID)) {
				saNames.get(i).click();
				element_Click(resetPwd);
				String valMsg = validationMessage();
				Assert.assertEquals("Password Reset Successfully", valMsg);
			}
		}
		if (!list.contains(systemAcID)) {
			logger.debug("System Account is not found");
		}

	}

	public String linkESSusertoAlreadyCreateUser(String systemAcID, String linkESSUser) throws InterruptedException {
		Thread.sleep(1500);
		waitForElementVisible(labelID);
		String valMsg = null;
		for (int i = 0; i < saNames.size(); i++) {
			if (saNames.get(i).getText().equalsIgnoreCase(systemAcID)) {
				saNames.get(i).click();
				Thread.sleep(1500);
				element_Click(optionalPanel);
				Thread.sleep(1000);
				element_Clear(linkedEssID);
				Thread.sleep(1000);
				element_InputTextUsingActionClass(linkedEssID, linkESSUser);
				element_TextBoxToClickOnTab(linkedEssID);
				Thread.sleep(1000);
				saveButtonClick();
				valMsg = validationMessage();
			}
		}
		return valMsg;
	}

	// By Chhaya
	public String assignGroupWiseRights(String rights, String saId, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1000);
		addButtonClick();
		Thread.sleep(2500);
		waitForElementClickable(activeChk);
		element_InputTextUsingActionClass(saID, saId);
		Thread.sleep(1000);
		element_Click(saName);
		Thread.sleep(1000);
		element_Click(groupWiseRightsPanel);
		Thread.sleep(1000);
		Thread.sleep(2000);
		element_Click(selectUsersDropdown);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUsersDropdown, rights);
		Thread.sleep(1000);
		// pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Group: " + data.get("Group") + " GroupName: " + data.get("GroupName"));
			String group = data.get("Group");
			String groupName = data.get("GroupName");
			String defaultGroup = data.get("Default");
			element_Click(selectGroupDropdown);
			element_DropDownSelectByvisibleText(selectGroupDropdown, group);
			Thread.sleep(1000);
			element_Clear(groupNameTxt);
			Thread.sleep(500);
			element_InputTextUsingActionClass(groupNameTxt, groupName);
			element_TextBoxToClickOnTab(groupNameTxt);
			Thread.sleep(1000);
			boolean defaultGroup1 = Boolean.parseBoolean(defaultGroup);
			// for default group
			if (defaultGroup != null || defaultGroup1 == true) {
				logger.debug("Default Group Value before for loop = " + defaultGroup);
				Thread.sleep(1000);
				String dynamicRowXpath = "//*[@gridname='groupSelectionGrid']//table//tbody/tr/td[3]";
				List<WebElement> row = driver.findElements(By.xpath(dynamicRowXpath));
				for (int i = 0; i < row.size(); i++) {
					logger.debug(row.get(i).getText());
					if (row.get(i).getText().equalsIgnoreCase(groupName)) {
						logger.debug(row.get(i).findElement(By.xpath("following-sibling::td[2]")).isEnabled());
						if (row.get(i).findElement(By.xpath("following-sibling::td[2]")).isEnabled() == true) {
							row.get(i).findElement(By.xpath("following-sibling::td[2]/input")).click();
							break;
						}
					}
				}
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(1000);
		String validationMsg = validationMessage();
		return validationMsg;
	}

	// by Chhaya
	public void deleteSystemAcountUser(String deleteSystemAccID) throws InterruptedException {
		String valmsg = null;
		waitForElementVisible(saName);
		String valMsg = null;
		waitForElementVisible(saName);
		element_Clear(searchTextBoxTitleBar);
		element_InputTextUsingActionClass(searchTextBoxTitleBar, deleteSystemAccID);
		searchTextBoxTitleBar.sendKeys(Keys.ENTER);
		Thread.sleep(500);
		for (int i = 0; i < saNames.size(); i++) {
			if (saNames.get(i).getText().equalsIgnoreCase(deleteSystemAccID)) {
				saNames.get(i).click();
				waitForElementDisable(saID);
				waitForElementClickable(deleteButton);
				deleteButtonClick();
				if (element_AlertIsPresent()) {
					driver.switchTo().alert().accept();
				}
				valmsg = validationMessage();
				Assert.assertEquals(valmsg, "Deleted Successfully");
				break;
			}
		}
	}

	public void userActiveInactive(String userId, String active) throws InterruptedException {
		String valMsg = null;
		pageLoadWaitng();
		waitForElementVisible(idTxt);
		element_InputTextUsingActionClass(idTxt, userId);
		element_Click(saName);

		Thread.sleep(3000);
		if (!element_getInputControlValue(saName).isBlank() || !element_getInputControlValue(saName).isEmpty()) {
			boolean active1 = Boolean.parseBoolean(active);
			if (active1 == true) {
				if (element_isSelected(activeCheckbox) != true) {
					element_Click(activeCheckbox);
				} else {
					element_Click(resetBt);
				}
			} else {
				if (element_isSelected(activeCheckbox) == true) {
					element_Click(activeCheckbox);
				}
			}
			Thread.sleep(500);
			saveButtonClick();
			Thread.sleep(1500);
			valMsg = validationMessage();
			Assert.assertEquals(valMsg, "Saved Successfully");
		} else {
			Assert.assertEquals("User Not Found", "Saved Successfully");
			Thread.sleep(1000);
		}

	}
}