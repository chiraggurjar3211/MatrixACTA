package PageObject.DeviceModule;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class DeviceGroupPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(DeviceGroupPO.class);

	public DeviceGroupPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "DeviceGroupName")
	private WebElement deviceGroupNameTxt;

	@FindBy(id = "cboDestiServer")
	private WebElement typeDD;

	@FindBy(xpath = "//*[@id=\"accordion_master\"]/div[1]//*[@class=\"anchorclick\"]")
	private List<WebElement> assignDevicesPanelSize;

	@FindBy(xpath = "//*[@default='Assign Devices']")
	private WebElement assignDevicesPanel;

	@FindBy(id = "AssignDeviceGroupName")
	private WebElement deviceNameTxt;

	@FindBy(xpath = "//*[@id=\"accordion_master\"]/div[2]//*[@class=\"anchorclick\"]")
	private List<WebElement> assignUsersPanelSize;

	@FindBy(xpath = "//*[text()='Assign Users']")
	private WebElement assignUsersPanel;

	@FindBy(xpath = "//*[@class=\"user-selection\"]//*[@id='grpddl']")
	private WebElement selectUsersDD;

	@FindBy(id = "ID")
	private WebElement userIdTxt;

	@FindBy(xpath = "(//*[@id=\"grpddl\"])[2]")
	private WebElement selectGroupDD;

	@FindBy(id = "grpname")
	private WebElement groupNameTxt;
	
	@FindBy(id = "DeviceGroupID")
	private WebElement deviceGroupIdTxt;
	
	@FindBy(xpath = "//*[@gridname=\"gvDeviceGroup\"]//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> deviceGroupNames;

	public static Map<String, String> panelAndDeviceIds = new HashMap<String, String>() ;
	
	public void createDeviceGroup(String deviceGroupName, String type, String deviceName, String validation)
			throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(deviceGroupNameTxt);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, deviceGroupName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (deviceGroupNames.size() > 0) {
				for (int j = 0; j < deviceGroupNames.size(); j++) {
					String plcname1 = deviceGroupNames.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(deviceGroupName)) {
						deviceGroupNames.get(j).click();
						Thread.sleep(1000);
					}
				}
			}
			//logger.info(ar);
			if (!ar.contains(deviceGroupName)) {
				Thread.sleep(1000);
				addButtonClick();
			}
		} else {
			Thread.sleep(1000);
			addButtonClick();
		}
		Thread.sleep(1000);
		element_Clear(deviceGroupNameTxt);
		element_InputTextUsingActionClass(deviceGroupNameTxt, deviceGroupName);
		//element_InputTextUsingActionClass(deviceGroupNameTxt, deviceGroupName);
		Thread.sleep(700);
		if (type != null) {
			element_DropDownSelectByvisibleText(typeDD, type);
		}
		if (assignDevicesPanelSize.size() == 0) {
			element_Click(assignDevicesPanel);
		}
		Thread.sleep(1000);
		selectUsersOrGroupFromPicklist(deviceName, deviceNameTxt);
		Thread.sleep(500);
		saveButtonClick();
		Thread.sleep(1000);
		String valMsg = validationMessage();
		Assert.assertEquals(valMsg, validation);
		Thread.sleep(1000);
		panelAndDeviceIds.put(deviceGroupName, deviceGroupIdTxt.getAttribute("value"));
		Thread.sleep(700);
		reloadPageButtonClick();
	}

	public void assignUsersToDeviceGroup(String deviceGroupName, String selectUsers, String userId, String selectGroup,
			String groupName, String validation) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(deviceGroupNameTxt);
		element_InputTextUsingActionClass(deviceGroupNameTxt, deviceGroupName);
		//element_InputTextUsingActionClass(deviceGroupNameTxt, deviceGroupName);
		element_TextBoxToClickOnTab(deviceGroupNameTxt);
		Thread.sleep(500);
		if (!element_getInputControlValue(deviceGroupNameTxt).isBlank() || !element_getInputControlValue(deviceGroupNameTxt).isEmpty()) {
			if (assignUsersPanelSize.size() == 0) {
				element_Click(assignUsersPanel);
			}
			element_DropDownSelectByvisibleText(selectUsersDD, selectUsers);
			if (selectUsers.equalsIgnoreCase("User Wise")) {
				selectUsersOrGroupFromPicklist(userId, userIdTxt);
			}
			if (selectUsers.equalsIgnoreCase("Group Wise")) {
				if (selectGroup != null) {
					element_DropDownSelectByvisibleText(selectGroupDD, selectGroup);
					Thread.sleep(500);
				}
				selectUsersOrGroupFromPicklist(groupName, groupNameTxt);
			}
			Thread.sleep(700);
			saveButtonClick();
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Assert.assertEquals(valMsg, validation);
			Thread.sleep(500);
			reloadPageButtonClick();
		}else{
			//logger.info(deviceGroupName+" Not Found");
			Assert.assertEquals(deviceGroupName+"Not Found", validation);
		}
	}
	
	public void deleteDeviceGroup(String deviceGroupName, String validation) throws InterruptedException {
		String valMsg= null;
		pageLoadWaitng();
		waitForElementVisible(deviceGroupNameTxt);
		element_InputTextUsingActionClass(deviceGroupNameTxt, deviceGroupName);
		element_TextBoxToClickOnTab(deviceGroupNameTxt);
		Thread.sleep(1000);
		if (!element_getInputControlValue(deviceGroupNameTxt).isBlank() || !element_getInputControlValue(deviceGroupNameTxt).isEmpty()) {
			deleteButtonClick();
			Thread.sleep(1000);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
			valMsg = validationMessage();
			Assert.assertEquals(valMsg, validation);
		}else{
			logger.info(deviceGroupName+" Not Found");
		}
	}
	
	public void assignDeviceGrpToVisitorProfileAPI(List<String> apiParameter, Map<String, String> data) {
		if (data.get("id") != null) {
			apiParameter.add("id=" + data.get("id"));
		}
		if (data.get("device-group") != null) {
			apiParameter.add("device-group-id=" + panelAndDeviceIds.get(data.get("device-group")));

		}
	}
	
	public void assignDeviceGrpToUserAPI(List<String> apiParameter, Map<String, String> data) {
		if (data.get("id") != null) {
			apiParameter.add("id=" + data.get("id"));
		}
		if (data.get("device-group") != null) {
			apiParameter.add("device-group-id=" + panelAndDeviceIds.get(data.get("device-group")));

		}
	}
	
	public void revokeDeviceGrpAPI(List<String> apiParameter, Map<String, String> data) {
		if (data.get("device-group") != null) {
			apiParameter.add("device=g_" + panelAndDeviceIds.get(data.get("device-group")));
		}
		if (data.get("id") != null) {
			apiParameter.add("id=" + data.get("id"));
		}
	}

}
