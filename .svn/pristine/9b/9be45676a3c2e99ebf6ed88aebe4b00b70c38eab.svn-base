package PageObject.DeviceModule;

import static org.testng.Assert.assertEquals;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.formula.atp.Switch;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import com.google.gson.Gson;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class DeviceConfigurationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(DeviceConfigurationPO.class);

	public DeviceConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(xpath = "//*[@id='AutoPanelName' or @id='txtSDCName']")
	private WebElement deviceNameTxt;

	@FindBy(id = "txtSDCID")
	private WebElement deviceID;

	@FindBy(xpath = "//*[@title='Panel200']")
	private WebElement panel200icon;

	@FindBy(xpath = "//*[@title='Panel Door']")
	private WebElement panelDooricon;

	@FindBy(xpath = "//*[@title='Panel Lite']")
	private WebElement panelLiteIcon;

	@FindBy(id = "cboPanels")
	private WebElement panelNameDD;

	@FindBy(id = "cboGatePanelDoors")
	private WebElement panelDoorTypeDD;

	@FindBy(id = "btnContinue")
	private WebElement deviceContinue;

	@FindBy(id = "AutoPanelName")
	private WebElement panelNameTxt;

	@FindBy(id = "txtSDCName")
	private WebElement doorNameTxt;

	@FindBy(xpath = "//input[contains(@id,'txtIPAddress_')]")
	private List<WebElement> ipAddressTxt;

	@FindBy(xpath = "//input[contains(@id,'txtMACAddress_')]")
	private List<WebElement> panelmacAddressTxt;

	@FindBy(xpath = "//input[contains(@id,'txtMACAdd_')]")
	private List<WebElement> doormacAddressTxt;

	@FindBy(xpath = "//table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]")
	private List<WebElement> deviceListTable;

	@FindBy(id = "cmnBtnTxtSearch")
	private WebElement deviceListSearch;

	@FindBy(id = "AutoPanelID")
	private WebElement panelIdTxt;

	@FindBy(xpath = "//*[text()='Assign Users']")
	private WebElement assignUsersTab;

	@FindBy(id = "userID")
	private WebElement usrIdTxt;

	@FindBy(xpath = "//*[@name=\"cosecForm\"]//*[@default=\"Save\"]")
	private WebElement saveBtnAssignUsers;

	@FindBy(xpath = "//*[@title='ARGO']")
	private WebElement argoIcon;

	@FindBy(xpath = "//*[@title=\"Path Controller\"]")
	private WebElement pathControllerX;

	@FindBy(xpath = "//*[@id=\"cboPathDoor\"]")
	private WebElement pathControllerDD;

	@FindBy(xpath = "//*[text()='Enrollment']")
	private WebElement enrollmentTab;

	@FindBy(xpath = "//*[text()='Temporary User']")
	private WebElement temporaryUserTab;

	@FindBy(id = "ddlTmpUsrDrpdwn")
	private WebElement tempAddOfUnknownUserDD;

	@FindBy(id = "UserIDTextArea")
	private WebElement idFormatTxt;

	@FindBy(id = "idTmpUserIDLength")
	private WebElement numValLengthTxt;

	@FindBy(id = "UserNameTextArea")
	private WebElement nameFormatTxt;

	@FindBy(xpath = "//*[@title='ARGO FACE']")
	private WebElement argoFaceIcon;

	@FindBy(id = "cboApp")
	private WebElement applicationDD;

	@FindBy(xpath = "//*[@class=\"modal-header\"]")
	private WebElement selectDeviceTypeBeAddedpopUp;

	@FindBy(xpath = "//*[@class=\"gridRightLine device-type-imglst\"]//*[@title]")
	private List<WebElement> selectDeviceTypeToBeAdded;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//label[@class=\"lblDeviceName\"]")
	private WebElement deviceNameOfPopUp;

	/////////////////

	public void verifyDevice(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(deviceNameTxt);
		boolean expRes = true;
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("DeviceId: " + data.get("DeviceId"));
			String deviceIdInput = data.get("DeviceId");
			boolean actRes = false;
			// element_Clear(deviceID);
			element_InputTextUsingActionClass(deviceID, deviceIdInput);
			element_TextBoxToClickOnTab(deviceID);
			pageLoadWaitng();
			if (element_AlertIsPresent() == true) {
				actRes = false;
				driver.switchTo().alert().dismiss();
				Thread.sleep(1000);
			} else {
				Thread.sleep(2000);
				if (deviceID.isEnabled() == false) {
					String deviceGetID = deviceID.getAttribute("value");
					if (deviceGetID.equalsIgnoreCase(deviceIdInput)) {
						actRes = true;
						reloadPageButtonClick();
						Thread.sleep(3000);
					} else {
						actRes = false;
						reloadPageButtonClick();
						Thread.sleep(3000);
					}
				} else {
					actRes = false;
					reloadPageButtonClick();
					Thread.sleep(3000);
				}
			}
			Thread.sleep(1000);
			Assert.assertEquals(actRes, expRes);
		}
	}

	public void addDeviceMainFunc(Map<String, String> data) throws InterruptedException {
		String deviceType = data.get("DeviceType");
		String panelName = data.get("PanelName");
		String panelDoorType = data.get("PanelDoorType");
		String pathController = data.get("PathController");

		switch (deviceType) {
		case "Panel200":
			element_Click(panel200icon);
			element_Click(deviceContinue);
			break;

		case "PanelDoor":
			waitForElementVisible_TimeinMinutes(panelDooricon, 2);
			element_Click(panelDooricon);
			waitForElementVisible_TimeinMinutes(panelNameDD, 2);
			element_DropDownSelectByvisibleText(panelNameDD, panelName);
			Thread.sleep(1000);
			waitForElementVisible(panelDoorTypeDD);
			element_DropDownSelectByvisibleText(panelDoorTypeDD, panelDoorType);
			Thread.sleep(500);
			element_Click(deviceContinue);
			break;

		case "PanelLite":
			element_Click(panelLiteIcon);
			element_Click(deviceContinue);
			break;

		case "ARGO":
			element_Click(argoIcon);
			element_Click(deviceContinue);
			break;

		case "Path Controller":
			element_Click(pathControllerX);
			Thread.sleep(2000);
			element_DropDownSelectByvisibleText(pathControllerDD, pathController);
			element_Click(deviceContinue);
			break;

		case "ARGO FACE":
			element_Click(argoFaceIcon);
			element_Click(deviceContinue);
			break;

		default:
			break;
		}
	}

	public static Map<String, String> panelAndDeviceIds = new HashMap<String, String>();

	public void addDevice(Map<String, String> data) throws InterruptedException {
		if (data.get("PathNo") == null) {
			Thread.sleep(1000);
			waitForElementVisible(deviceNameTxt);
			addButtonClick();
			waitForElementVisible_TimeinMinutes(selectDeviceTypeBeAddedpopUp, 2);
			addDeviceMainFunc(data);
			pageLoadWaitng();
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt, 1);
			if (data.get("DeviceName") != null) {
				WebElement devienameTxt = null;
				if (data.get("DeviceType").equalsIgnoreCase("Panel200")
						|| data.get("DeviceType").equalsIgnoreCase("PanelLite")) {
					devienameTxt = panelNameTxt;
					panelAndDeviceIds.put(data.get("DeviceName"), panelIdTxt.getAttribute("value"));
				} else {
					devienameTxt = doorNameTxt;
					panelAndDeviceIds.put(data.get("DeviceName"), deviceID.getAttribute("value"));
				}
				element_Clear(devienameTxt);
				element_InputTextUsingActionClass(devienameTxt, data.get("DeviceName"));
			}

			if (data.get("IPAddress") != null) {
				String[] ips = data.get("IPAddress").split("\\.");
				for (int i = 0; i < ipAddressTxt.size(); i++) {
					ipAddressTxt.get(i).sendKeys(ips[i]);
				}
			}
			Thread.sleep(1000);
			if (data.get("MACAddress") != null) {
				List<WebElement> macAddressTxt = null;
				if (data.get("DeviceType").equalsIgnoreCase("Panel200")
						|| data.get("DeviceType").equalsIgnoreCase("PanelLite")) {
					macAddressTxt = panelmacAddressTxt;
				} else {
					macAddressTxt = doormacAddressTxt;
				}
				String[] macs = data.get("MACAddress").split(":");
				for (int i = 0; i < macAddressTxt.size(); i++) {
					macAddressTxt.get(i).sendKeys(macs[i]);
				}
			}
			Thread.sleep(1000);
			if (data.get("Application") != null) {
				element_DropDownSelectByvisibleText(applicationDD, data.get("Application"));
			}
			if (data.get("TempAddOfUnknownUser") != null) {
				element_Click(enrollmentTab);
				Thread.sleep(1000);
				if (data.get("TempAddOfUnknownUser") != null) {
					element_Click(temporaryUserTab);
					Thread.sleep(1000);
					element_DropDownSelectByvisibleText(tempAddOfUnknownUserDD, data.get("TempAddOfUnknownUser"));
					Thread.sleep(500);
					element_Clear(idFormatTxt);
					element_InputTextUsingActionClass(idFormatTxt, data.get("IDFormat"));
					Thread.sleep(500);
					if (data.get("NumericValueLength") != null) {
						element_Clear(numValLengthTxt);
						element_InputTextUsingActionClass(numValLengthTxt, data.get("NumericValueLength"));
						Thread.sleep(500);
					}
					element_Clear(nameFormatTxt);
					element_InputTextUsingActionClass(nameFormatTxt, data.get("NameFormat"));
					Thread.sleep(500);
				}
			}
			if (data.get("DeviceName") != null) {
				element_Clear(deviceNameTxt);
				Thread.sleep(250);
				element_InputTextUsingActionClass(deviceNameTxt, data.get("DeviceName"));
			}
			saveButtonClick();
			Assert.assertEquals(validationMessage(), "Saved Successfully");
			// logger.info("Data = "+panelAndDeviceIds.get(data.get("DeviceName")));
			Thread.sleep(5000);
			reloadPageButtonClick();
			Thread.sleep(500);
		} else {
			for (int o = 0; o < Integer.parseInt(data.get("PathNo")); o++) {

				waitForElementVisible(deviceNameTxt);
				Thread.sleep(5000);
				addButtonClick();
				Thread.sleep(2000);
				addDeviceMainFunc(data);
				// pageLoadWaitng();
				Thread.sleep(6000);
				if (data.get("DeviceName") != null) {
					WebElement devienameTxt = null;
					if (data.get("DeviceType").equalsIgnoreCase("Panel200")
							|| data.get("DeviceType").equalsIgnoreCase("PanelLite")) {
						devienameTxt = panelNameTxt;
						panelAndDeviceIds.put(data.get("DeviceName"), panelIdTxt.getAttribute("value"));
					} else {
						devienameTxt = doorNameTxt;
						panelAndDeviceIds.put(data.get("DeviceName"), deviceID.getAttribute("value"));
					}
					element_Clear(devienameTxt);
					String deviceNameAdded = data.get("DeviceName") + (o + 1);
					element_InputTextUsingActionClass(devienameTxt, deviceNameAdded);
				}
				if (data.get("IPAddress") != null) {
					String[] ips = data.get("IPAddress").split("\\.");
					for (int i = 0; i < ipAddressTxt.size(); i++) {
						ipAddressTxt.get(i).sendKeys(ips[i]);
					}
				}
				if (data.get("MACAddress") == null) {
					String formatedNumber = String.format("%012d", o);
					String fir0 = formatedNumber.substring(0, 2);
					String fir1 = formatedNumber.substring(2, 4);
					String fir2 = formatedNumber.substring(4, 6);
					String fir3 = formatedNumber.substring(6, 8);
					String fir4 = formatedNumber.substring(8, 10);
					String fir5 = formatedNumber.substring(10, 12);
					for (int i = 0; i < doormacAddressTxt.size(); i++) {
						if (i == 0) {
							doormacAddressTxt.get(i).sendKeys(fir0);
						} else if (i == 1) {
							doormacAddressTxt.get(i).sendKeys(fir1);
						} else if (i == 2) {
							doormacAddressTxt.get(i).sendKeys(fir2);
						} else if (i == 3) {
							doormacAddressTxt.get(i).sendKeys(fir3);
						} else if (i == 4) {
							doormacAddressTxt.get(i).sendKeys(fir4);
						} else if (i == 5) {
							doormacAddressTxt.get(i).sendKeys(fir5);
						}

					}
				} else {
					List<WebElement> macAddressTxt = null;
					if (data.get("DeviceType").equalsIgnoreCase("Panel200")
							|| data.get("DeviceType").equalsIgnoreCase("PanelLite")) {
						macAddressTxt = panelmacAddressTxt;
					} else {
						macAddressTxt = doormacAddressTxt;
					}
					String[] macs = data.get("MACAddress").split(":");
					for (int i = 0; i < macAddressTxt.size(); i++) {
						macAddressTxt.get(i).sendKeys(macs[i]);
					}
				}
				if (data.get("TempAddOfUnknownUser") != null) {
					element_Click(enrollmentTab);
					Thread.sleep(1000);
					if (data.get("TempAddOfUnknownUser") != null) {
						element_Click(temporaryUserTab);
						Thread.sleep(1000);
						element_DropDownSelectByvisibleText(tempAddOfUnknownUserDD, data.get("TempAddOfUnknownUser"));
						Thread.sleep(500);
						element_Clear(idFormatTxt);
						element_InputTextUsingActionClass(idFormatTxt, data.get("IDFormat"));
						Thread.sleep(500);
						if (data.get("NumericValueLength") != null) {
							element_Clear(numValLengthTxt);
							element_InputTextUsingActionClass(numValLengthTxt, data.get("NumericValueLength"));
							Thread.sleep(500);
						}
						element_Clear(nameFormatTxt);
						element_InputTextUsingActionClass(nameFormatTxt, data.get("NameFormat"));
						Thread.sleep(500);
					}
				}
				Thread.sleep(1000);
				saveButtonClick();
				Thread.sleep(2500);
				Assert.assertEquals(validationMessage(), "Saved Successfully");
				// logger.info("Data = "+panelAndDeviceIds.get(data.get("DeviceName")));
				Thread.sleep(2000);
				reloadPageButtonClick();
				Thread.sleep(500);
			}
		}
	}

	public void deleteDevice(String deviceName) throws InterruptedException {
		String valMsg = null;
		pageLoadWaitng();
		// Thread.sleep(2000);
		waitForElementVisible(deviceListSearch);
		element_Clear(deviceListSearch);
		element_InputTextUsingActionClass(deviceListSearch, deviceName);
		element_TextBoxToClickOnEnter(deviceListSearch);
		Thread.sleep(1000);
		if (deviceListTable.size() > 0) {
			for (int i = 0; i < deviceListTable.size(); i++) {
				String actualDeviceName = deviceListTable.get(i).getText();
				if (actualDeviceName.equalsIgnoreCase(deviceName)) {
					element_Click(deviceListTable.get(i));
					// pageLoadWaitng();
					Thread.sleep(5000);
					break;
				}
			}
			Thread.sleep(2000);
			deleteButtonClick();
			Thread.sleep(1000);
			driver.switchTo().alert().accept();
			Thread.sleep(2500);
			valMsg = validationMessage();
			Thread.sleep(700);
			Assert.assertEquals(valMsg, "Deleted Successfully");
			Thread.sleep(700);
		} else {
			logger.info(deviceName + " Not Found");
		}
		// reloadPageButtonClick();
	}

	public void assignDeviceAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data) {
		if (columnHeader.contains("device")) {
			if (data.get("device") != null || data.get("Panel") != null) {
				if (data.get("DeviceType").equalsIgnoreCase("Panel200")
						|| data.get("DeviceType").equalsIgnoreCase("PanelLite")
						|| data.get("DeviceType").equalsIgnoreCase("Panel")) {
					apiParameter.add("device=p_" + panelAndDeviceIds.get(data.get("Panel")));
				} else if (data.get("DeviceType").equalsIgnoreCase("PanelDoor") && data.get("Panel") != null) {
					apiParameter.add("device=pd_" + panelAndDeviceIds.get(data.get("Panel")) + "_"
							+ panelAndDeviceIds.get(data.get("device")));
				} else {
					apiParameter.add("device=d_" + panelAndDeviceIds.get(data.get("device")));
				}
			}
		}
		if (columnHeader.contains("id")) {
			if (data.get("id") != null) {
				apiParameter.add("id=" + data.get("id"));
			}
		}
	}

	public void revokeDeviceAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data) {
		if (columnHeader.contains("device")) {
			if (data.get("device") != null || data.get("Panel") != null) {
				if (data.get("DeviceType").equalsIgnoreCase("Panel200")
						|| data.get("DeviceType").equalsIgnoreCase("PanelLite")
						|| data.get("DeviceType").equalsIgnoreCase("Panel")) {
					apiParameter.add("device=p_" + panelAndDeviceIds.get(data.get("Panel")));
				} else if (data.get("DeviceType").equalsIgnoreCase("PanelDoor") && data.get("Panel") != null) {
					apiParameter.add("device=pd_" + panelAndDeviceIds.get(data.get("Panel")) + "_"
							+ panelAndDeviceIds.get(data.get("device")));
				} else {
					apiParameter.add("device=d_" + panelAndDeviceIds.get(data.get("device")));
				}
			}
		}
		if (columnHeader.contains("id")) {
			if (data.get("id") != null) {
				apiParameter.add("id=" + data.get("id"));
			}
		}
	}

	public void assignUsers(String deviceName, String userId) throws InterruptedException {
		String valMsg = null;
		pageLoadWaitng();
		// Thread.sleep(2000);
		waitForElementVisible(deviceListSearch);
		element_Clear(deviceListSearch);
		element_InputTextUsingActionClass(deviceListSearch, deviceName);
		element_TextBoxToClickOnEnter(deviceListSearch);
		Thread.sleep(1000);
		if (deviceListTable.size() > 0) {
			for (int i = 0; i < deviceListTable.size(); i++) {
				String actualDeviceName = deviceListTable.get(i).getText();
				if (actualDeviceName.equalsIgnoreCase(deviceName)) {
					element_Click(deviceListTable.get(i));
					// pageLoadWaitng();
					Thread.sleep(5000);
					break;
				}
			}
			Thread.sleep(1500);
			element_Click(assignUsersTab);
			Thread.sleep(1000);
			selectUsersOrGroupFromPicklist(userId, usrIdTxt);
			Thread.sleep(500);
			element_Click(saveBtnAssignUsers);
			Thread.sleep(1500);
			saveButtonClick();
			Thread.sleep(1500);
			valMsg = validationMessage();
			Assert.assertEquals(valMsg, "Saved Successfully");
			Thread.sleep(2000);
		} else {
			logger.info(deviceName + " Not Found");
			Assert.assertEquals(deviceName + " Not Found", "Saved Successfully");
		}
	}

	public void addTempUserAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data) {
		if (columnHeader.contains("temporary-addition-of-unknown-user")) {
			if (data.get("temporary-addition-of-unknown-user") != null) {
				apiParameter
						.add("temporary-addition-of-unknown-user=" + data.get("temporary-addition-of-unknown-user"));
			}
		}
		if (columnHeader.contains("device-type")) {
			if (data.get("device-type") != null) {
				apiParameter.add("device-type=" + data.get("device-type"));
				if (data.get("device-type").equalsIgnoreCase("9") || data.get("device-type").equalsIgnoreCase("18")
						|| data.get("device-type").equalsIgnoreCase("20")
						|| data.get("device-type").equalsIgnoreCase("21")) {
					apiParameter.add("device-id=" + panelAndDeviceIds.get(data.get("DeviceName")));
				}
			}
		}
		if (columnHeader.contains("credential-type")) {
			if (data.get("credential-type") != null) {
				apiParameter.add("credential-type=" + data.get("credential-type"));
			}
		}
	}

	@FindBy(xpath = "//*[@id=\"txtSDCID\"]/ancestor::div[@class=\"form-group\"]//mx-label")
	private WebElement deviceidNameLabel;

	@FindBy(xpath = "//input[contains(@id,'txtMACAdd_1')]/ancestor::div[@class='form-group']//mx-label")
	private WebElement macAddressNameLabel;

	@FindBy(xpath = "//*[@id='chkStatus']/ancestor::div[@class='form-group']//label")
	private WebElement activeControlLabel;

	@FindBy(id = "chkStatus")
	private WebElement active;

	@FindBy(id = "DevicePageLoader")
	private WebElement loadingPng;

	@FindBy(xpath = "//*[@key=\"Optional\"]/label")
	private WebElement basic_optional_Tab;

	@FindBy(xpath = "//*[@key=\"Optional\"]/ancestor::a[1]")
	private WebElement basic_optional_Tab_OpenOrClose;

	@FindBy(id = "profGenModelSiteID")
	private WebElement basic_optional_Tab_siteId;

	@FindBy(id = "profGenModelSiteName")
	private WebElement basic_optional_Tab_siteName;

	@FindBy(xpath = "//*[@id=\"profGenModelSiteID\"]/ancestor::div[@class='form-group']//label")
	private WebElement basic_optional_Tab_siteLabel;

	@FindBy(xpath = "//*[@id=\"profGenModelSiteName\"]/following-sibling::span[1]//i")
	private WebElement multiplesiteButtonInBasicLabel;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@class=\"mx-input-theme label-bold label-text\"]")
	private WebElement basic_Site_Popup_Label;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement basic_Site_Popup_search;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@name=\"cmnTxtSearch\"]//ancestor::div[1]/i")
	private WebElement basic_Site_Popup_search_Button;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/thead//label")
	private List<WebElement> basic_Site_Popup_table_header;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/tbody//tr")
	private List<WebElement> basic_Site_Popup_table_Row;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@key=\"No Data Found\"]/label")
	private WebElement basic_Site_Popup_table_No_Data;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/tbody//tr/td[@class=\"cursor label-text\"][2]/label")
	private List<WebElement> basic_Site_Popup_table_Row_ValueSelect;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@key=\"Cancel\"]")
	private WebElement basic_Site_Popup_CancelButton;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@class=\"close\"]")
	private WebElement basic_Site_Popup_CloseButton;

	@FindBy(id = "cboApp")
	private WebElement basic_Optional_Application;

	@FindBy(id = "cboApp")
	private List<WebElement> basic_Optional_Application_size;

	@FindBy(xpath = "//*[@id=\"cboApp\"]/ancestor::div[@class='form-group']//label")
	private WebElement basic_Optional_ApplicationLabel;

	@FindBy(id = "cboAccessMode")
	private WebElement basic_Optional_UserAccessMode;

	@FindBy(id = "cboAccessMode")
	private List<WebElement> basic_Optional_UserAccessMode_Size;

	@FindBy(xpath = "//*[@id=\"cboAccessMode\"]/ancestor::div[@class='form-group']//label")
	private WebElement basic_Optional_UserAccessModeLabel;

	@FindBy(id = "cmbVisAccMode")
	private WebElement basic_Optional_VisitorAccessMode;

	@FindBy(id = "cmbVisAccMode")
	private List<WebElement> basic_Optional_VisitorAccessMode_Size;

	@FindBy(xpath = "//*[@id=\"cmbVisAccMode\"]/ancestor::div[@class='form-group']//label")
	private WebElement basic_Optional_VisitorAccessModeLabel;

	@FindBy(id = "chkAlertMessages")
	private WebElement basic_Optional_AlertMessages;

	@FindBy(xpath = "//*[@id=\"chkAlertMessages\"]/ancestor::div[@class='form-group']//label")
	private WebElement basic_Optional_AlertMessagesLabel;

	@FindBy(id = "chkForVisPassSurr")
	private WebElement basic_Optional_ConsiderForVisitorPassSurrender;

	@FindBy(xpath = "//*[@id=\"chkForVisPassSurr\"]/ancestor::div[@class='form-group']//label")
	private WebElement basic_Optional_ConsiderForVisitorPassSurrenderLabel;

	@FindBy(id = "chkAttendance")
	private WebElement basic_Optional_ConsiderForAttendance;

	@FindBy(xpath = "//*[@id=\"chkAttendance\"]/ancestor::div[@class='form-group']//label")
	private WebElement basic_Optional_ConsiderForAttendanceLabel;

	@FindBy(id = "GenEvent")
	private WebElement basic_Optional_GenerateEvents;

	@FindBy(xpath = "//*[@id=\"GenEvent\"]/ancestor::div[@class='form-group']//label")
	private WebElement basic_Optional_GenerateEventsLabel;

	@FindBy(id = "cmbCafeFaceAccMode")
	private WebElement basic_Optional_CafeteriaFaceAccessMode;

	@FindBy(id = "cmbCafeFaceAccMode")
	private List<WebElement> basic_Optional_CafeteriaFaceAccessMode_Size;

	@FindBy(xpath = "//*[@id=\"cmbCafeFaceAccMode\"]/ancestor::div[@class='form-group']//label")
	private WebElement basic_Optional_CafeteriaFaceAccessModeLabel;

	public void deviceUIControlValidation_Basic(List<Map<String, String>> data, String sheetName) throws Exception {
		for (int i = 0; i < data.size(); i++) {
			eachRowStatus = false;
			String valMsg = null;
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			Map<String, String> excelFileDataRecord = data.get(i);
			logger.info("***********************************Excel Data Record Picked : Row Number = " + i + " Data is ="
					+ excelFileDataRecord);
			int rowNumber = Integer.parseInt(excelFileDataRecord.get("RowNumber"));
			addButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			waitForElementVisible_TimeinMinutes(selectDeviceTypeBeAddedpopUp, 2);
			for (int j = 0; j < selectDeviceTypeToBeAdded.size(); j++) {
				String title = selectDeviceTypeToBeAdded.get(j).getAttribute("title");
				if (title.equalsIgnoreCase(excelFileDataRecord.get("DeviceType"))) {
					selectDeviceTypeToBeAdded.get(j).click();
					Thread.sleep(500);
					waitForElementClickable(deviceContinue);
					element_Click(deviceContinue);
					Thread.sleep(500);
					break;
				}
			}
			Thread.sleep(500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementClickable(active, 1);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			System.out.println(" *******************Basic Tab Start*******************");
			// *******************Start Device Id Label And Control*******************
			String deviceLab = excelFileDataRecord.get("Device_label").trim();
			String deviceTy = excelFileDataRecord.get("Device_Type").trim();
			String deviceVi = excelFileDataRecord.get("Device_Visibility").trim();
			String deviceP = excelFileDataRecord.get("Device_Placeholder").trim();
			textBox_Control_Check_UIValidation("Device Id", rowNumber, sheetName, deviceidNameLabel, deviceID,
					deviceLab, deviceTy, deviceVi, deviceP, "", "", "");

			// *******************Start Device Name Textbox And Control*******************

			String deviceNameTy = excelFileDataRecord.get("DeviceName_Type").trim();
			String deviceNameVi = excelFileDataRecord.get("DeviceName_Visibility").trim();
			String deviceNameP = excelFileDataRecord.get("DeviceName_Placeholder").trim();
			String deviceNameV = excelFileDataRecord.get("DeviceName_Value").trim();
			textBox_Control_Check_UIValidation("Device Name", rowNumber, sheetName, deviceidNameLabel, deviceNameTxt,
					"", deviceNameTy, deviceNameVi, deviceNameP, "", deviceNameV, "");

			// *******************Start Mac Address Textbox And Control*******************
			String macAddressLab = excelFileDataRecord.get("MacAddress_label").trim();
			if (!macAddressLab.isBlank() && !macAddressLab.isEmpty()) {
				assertEquals(macAddressNameLabel.getText(), macAddressLab, "Mac Address Control Label Comparision",
						true, rowNumber, sheetName);
			}
			String macAddressTy = excelFileDataRecord.get("MacAddress_Type").trim();
			if (!macAddressTy.isBlank() && !macAddressTy.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				for (int x = 0; x < macAddressTxt.size(); x++) {
					System.out.println("Element Attribute :" + element_GetAttributeValue(macAddressTxt.get(x), "type"));
					assertEquals(element_GetAttributeValue(macAddressTxt.get(x), "type"), macAddressTy,
							"Mac Address Control Type Comparison for box " + x, true, rowNumber, sheetName);
					Thread.sleep(250);
				}
			}
			String macAddressVi = excelFileDataRecord.get("MacAddress_Visibility").trim();
			if (!macAddressVi.isBlank() && !macAddressVi.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				for (int x = 0; x < macAddressTxt.size(); x++) {
					System.out.println("Element Attribute :" + element_isEnabledOrDisabled(macAddressTxt.get(x)));
					assertEquals(element_isEnabledOrDisabled(macAddressTxt.get(x)), macAddressVi,
							"Mac Address Control Enable/disabled Comparison for box " + x, true, rowNumber, sheetName);
					Thread.sleep(250);
				}
			}
			String macAddressV = excelFileDataRecord.get("MacAddress_Value").trim();
			if (!macAddressV.isBlank() && !macAddressV.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				String[] macs = macAddressV.split(":");
				for (int x = 0; x < macAddressTxt.size(); x++) {
					macAddressTxt.get(x).sendKeys(macs[x]);
				}
			}

			// *******************Start Active check box Control*******************
			String activeLab = excelFileDataRecord.get("Active_label").trim();
			String activeTy = excelFileDataRecord.get("Active_Type").trim();
			String activeVi = excelFileDataRecord.get("Active_Visibility").trim();
			String active_default = excelFileDataRecord.get("Active_Default_Value").trim();
			String activeV = excelFileDataRecord.get("Active_Value").trim();
			checkbox_Check_UIValidation("Active Control", rowNumber, sheetName, activeControlLabel, active, activeLab,
					activeTy, activeVi, active_default, activeV);

			// *******************Start Optional Tab Control*******************
			String optionalTabLab = excelFileDataRecord.get("Optionaltab_label").trim();
			String optionalTabOpen = excelFileDataRecord.get("Optionaltab_Default").trim();
			tab_Control_Check_UIValidation("Optional Tab", rowNumber, sheetName, basic_optional_Tab,
					basic_optional_Tab_OpenOrClose, optionalTabLab, optionalTabOpen, "");
			// *******************Start Site selection Control*******************
			// *******************Start Site Id Label And Control*******************
			String siteIdLab = excelFileDataRecord.get("SiteId_label").trim();
			String siteIdInBasicTy = excelFileDataRecord.get("SiteId_Type").trim();
			String siteIdInBasicVi = excelFileDataRecord.get("SiteId_Visibility").trim();
			String siteIdInBasicP = excelFileDataRecord.get("SiteId_Placeholder").trim();
			String siteIdInBasic_default = excelFileDataRecord.get("SiteId_Default_Value").trim();
			String siteIdInBasicV = excelFileDataRecord.get("SiteId_Value").trim();
			String siteIdInBasicNegative = excelFileDataRecord.get("SiteId_Negative").trim();
			textBox_Control_Check_UIValidation("Site Id", rowNumber, sheetName, basic_optional_Tab_siteLabel,
					basic_optional_Tab_siteId, siteIdLab, siteIdInBasicTy, siteIdInBasicVi, siteIdInBasicP,
					siteIdInBasic_default, siteIdInBasicV, siteIdInBasicNegative);
			// *******************Start Site Name Label And Control*******************

			String siteNameInBasicTy = excelFileDataRecord.get("SiteName_Type").trim();
			String siteNameInBasicVi = excelFileDataRecord.get("SiteName_Visibility").trim();
			String siteNameInBasicP = excelFileDataRecord.get("SiteName_Placeholder").trim();
			String siteNameInBasic_default = excelFileDataRecord.get("SiteName_Default_Value").trim();
			String siteNameInBasicV = excelFileDataRecord.get("SiteName_Value").trim();
			String siteNameInBasicNegative = excelFileDataRecord.get("SiteName_Negative").trim();
			textBox_Control_Check_UIValidation("Site Name", rowNumber, sheetName, basic_optional_Tab_siteLabel,
					basic_optional_Tab_siteName, "", siteNameInBasicTy, siteNameInBasicVi, siteNameInBasicP,
					siteNameInBasic_default, siteNameInBasicV, siteNameInBasicNegative);

			// *******************Start Site Pop Up Button And Control*******************
			String sitePopUp_LabelBasicV = excelFileDataRecord.get("SitePopUp_Label").trim();
			String sitePopUpSearch_Type = excelFileDataRecord.get("SitePopUpSearch_Type").trim();
			String sitePopUpSearch_Placeholder = excelFileDataRecord.get("SitePopUpSearch_Placeholder").trim();
			String sitePopUpSearch_Value = excelFileDataRecord.get("SitePopUpSearch_Value").trim();
			String sitePopUp_Default_Table_Header_Value = excelFileDataRecord
					.get("SitePopUp_Default_Table_Header_Value").trim();
			String sitePopUp_Default_Table_Row_Value = excelFileDataRecord.get("SitePopUp_Default_Table_Row_Value")
					.trim();
			String sitePopUp_Default_Table_No_Data_Value = excelFileDataRecord
					.get("SitePopUp_Default_Table_No_Data_Value").trim();
			String sitePopUp_Default_Table_Row_Value_Select = excelFileDataRecord
					.get("SitePopUp_Default_Table_Row_Value_Select").trim();
			String sitePopUpCancel_Type = excelFileDataRecord.get("SitePopUpCancel_Type").trim();
			String sitePopUpCancel_Default_Value = excelFileDataRecord.get("SitePopUpCancel_Default_Value").trim();
			String sitePopUpClose_Type = excelFileDataRecord.get("SitePopUpClose_Type").trim();
			if (!sitePopUp_LabelBasicV.isBlank() || !sitePopUpSearch_Type.isBlank()
					|| !sitePopUpSearch_Placeholder.isBlank() || !sitePopUpSearch_Value.isBlank()
					|| !sitePopUp_Default_Table_Header_Value.isBlank() || !sitePopUp_Default_Table_Row_Value.isBlank()
					|| !sitePopUp_Default_Table_No_Data_Value.isBlank() || !sitePopUpCancel_Type.isBlank()
					|| !sitePopUpCancel_Default_Value.isBlank() || !sitePopUpClose_Type.isBlank()
					|| !sitePopUp_Default_Table_Row_Value_Select.isBlank()) {
				System.out.println("I am in Site PopUp");
				element_Click(multiplesiteButtonInBasicLabel);
				waitForElementVisible(basic_Site_Popup_Label);
				// Pop up Open
				if (!sitePopUp_LabelBasicV.isBlank() && !sitePopUp_LabelBasicV.isEmpty()) {
					System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
					assertEquals(basic_Site_Popup_Label.getText(), sitePopUp_LabelBasicV,
							"Site Pop Up Label Comparision", true, rowNumber, sheetName);
				}
				// Start Search Box
				if (!sitePopUpSearch_Placeholder.isBlank() && !sitePopUpSearch_Placeholder.isEmpty()) {
					System.out.println("Element PlaceHolder :"
							+ element_GetAttributeValue(basic_Site_Popup_search, "placeholder"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_search, "placeholder"),
							sitePopUpSearch_Placeholder, "Site Pop Up -> SearchBox PlaceHolder Comparison", true,
							rowNumber, sheetName);
				}
				if (!sitePopUpSearch_Type.isBlank() && !sitePopUpSearch_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_search, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_search, "type"), sitePopUpSearch_Type,
							"Site Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
				}
				if (!sitePopUpSearch_Value.isBlank() && !sitePopUpSearch_Value.isEmpty()) {
					element_InputText(basic_Site_Popup_search, sitePopUpSearch_Value);
					Thread.sleep(250);
					element_Click(basic_Site_Popup_search_Button);
					Thread.sleep(250);
				}
				// Table Header Value Checked
				tableHeader_Control_Check_UIValidation("Site Pop Up", rowNumber, sheetName,
						basic_Site_Popup_table_header, sitePopUp_Default_Table_Header_Value);
				Thread.sleep(250);
//				// Table Row Data Value Checked
//				if ((!sitePopUp_Default_Table_Row_Value.isBlank() && !sitePopUp_Default_Table_Row_Value.isEmpty())
//						|| (!sitePopUp_Default_Table_No_Data_Value.isBlank()
//								&& !sitePopUp_Default_Table_No_Data_Value.isEmpty())) {
//					if (basic_Site_Popup_table_Row.size() > 0) {
//						List<List<String>> row_data = new ArrayList<List<String>>();
//						System.out.println("Table Row" + basic_Site_Popup_table_Row.size());
//						for (int x = 0; x < basic_Site_Popup_table_Row.size(); x++) {
//							List<String> rowsD = new ArrayList<String>();
//							rowsD.clear();
//							List<WebElement> actualRD = basic_Site_Popup_table_Row.get(x)
//									.findElements(By.xpath("td[@class=\"cursor label-text\"]/label"));
//							for (int y = 0; y < actualRD.size(); y++) {
//								String dataV = actualRD.get(y).getText();
//								System.out.println("Row Data : " + dataV);
//								rowsD.add(dataV);
//							}
//							System.out.println("Print rows:" + rowsD);
//							row_data.add(rowsD);
//
//						}
//						Gson gson = new Gson();
//						String result = gson.toJson(row_data);
//						System.out.println("Row Data Actual Displayed :" + result);
//						assertEquals(result, sitePopUp_Default_Table_Row_Value, "Site Pop Up Table Row Comparison",
//								true, rowNumber, sheetName);
//					} else {
//						// No Data sitePopUp_Default_Table_No_Data_Value
//						if (!sitePopUp_Default_Table_No_Data_Value.isBlank()
//								&& !sitePopUp_Default_Table_No_Data_Value.isEmpty()) {
//							System.out.println(
//									"Element default Value :" + element_GetText(basic_Site_Popup_table_No_Data));
//							assertEquals(element_GetText(basic_Site_Popup_table_No_Data),
//									sitePopUp_Default_Table_No_Data_Value,
//									"Site Pop Up ->Row No Data Value default value Comparison", true, rowNumber,
//									sheetName);
//						}
//					}
//				}
				tableRow_Control_Check_UIValidation("Site Pop Up Table Row", rowNumber, sheetName,
						basic_Site_Popup_table_Row, "td[@class=\"cursor label-text\"]/label",
						basic_Site_Popup_table_No_Data, sitePopUp_Default_Table_Row_Value,
						sitePopUp_Default_Table_No_Data_Value);

				// Cancel Button
				if (!sitePopUpCancel_Type.isBlank() && !sitePopUpCancel_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CancelButton, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CancelButton, "type"), sitePopUpCancel_Type,
							"Site Pop Up -> Cencel Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!sitePopUpCancel_Default_Value.isBlank() && !sitePopUpCancel_Default_Value.isEmpty()) {
					System.out.println("Element default Value :"
							+ element_GetAttributeValue(basic_Site_Popup_CancelButton, "value"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CancelButton, "value"),
							sitePopUpCancel_Default_Value, "Site Pop Up -> Cencel Button default value Comparison",
							true, rowNumber, sheetName);
				}
				// Close button
				if (!sitePopUpClose_Type.isBlank() && !sitePopUpClose_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"), sitePopUpClose_Type,
							"Site Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!sitePopUp_Default_Table_Row_Value_Select.isBlank()
						&& !sitePopUp_Default_Table_Row_Value_Select.isEmpty()) {
					for (int aa = 0; aa < basic_Site_Popup_table_Row_ValueSelect.size(); aa++) {
						System.out.println(basic_Site_Popup_table_Row_ValueSelect.get(aa).getText());
						if (basic_Site_Popup_table_Row_ValueSelect.get(aa).getText()
								.equalsIgnoreCase(sitePopUp_Default_Table_Row_Value_Select)) {
							basic_Site_Popup_table_Row_ValueSelect.get(aa).click();
							Thread.sleep(250);
							break;
						}
					}

				} else {
					element_Click(basic_Site_Popup_CloseButton);
				}
			}

			// Start Application control and UI
			String application_label = excelFileDataRecord.get("Application_label").trim();
			String application_Type = excelFileDataRecord.get("Application_Type").trim();
			String application_Visibility = excelFileDataRecord.get("Application_Visibility").trim();
			String application_Default_Value = excelFileDataRecord.get("Application_Default_Value").trim();
			String application_Select_Values = excelFileDataRecord.get("Application_Select_Values").trim();
			String application_Values = excelFileDataRecord.get("Application_Values").trim();
			dropDown_Check_UIValidation("Application", rowNumber, sheetName, basic_Optional_ApplicationLabel,
					basic_Optional_Application, basic_Optional_Application_size, application_label, application_Type,
					application_Visibility, application_Default_Value, application_Select_Values, application_Values,
					"");

			// User Access Mode Control
			String userAccessMode_label = excelFileDataRecord.get("UserAccessMode_label").trim();
			String userAccessMode_Type = excelFileDataRecord.get("UserAccessMode_Type").trim();
			String userAccessMode_Visibility = excelFileDataRecord.get("UserAccessMode_Visibility").trim();
			String userAccessMode_Default_Value = excelFileDataRecord.get("UserAccessMode_Default_Value").trim();
			String userAccessMode_Select_Values = excelFileDataRecord.get("UserAccessMode_Select_Values").trim();
			String userAccessMode_Values = excelFileDataRecord.get("UserAccessMode_Values").trim();
			dropDown_Check_UIValidation("User Access Mode", rowNumber, sheetName, basic_Optional_UserAccessModeLabel,
					basic_Optional_UserAccessMode, basic_Optional_UserAccessMode_Size, userAccessMode_label,
					userAccessMode_Type, userAccessMode_Visibility, userAccessMode_Default_Value,
					userAccessMode_Select_Values, userAccessMode_Values, "");

			// User Access Mode Control
			String visitorAccessMode_label = excelFileDataRecord.get("VisitorAccessMode_label").trim();
			String visitorAccessMode_Type = excelFileDataRecord.get("VisitorAccessMode_Type").trim();
			String visitorAccessMode_Visibility = excelFileDataRecord.get("VisitorAccessMode_Visibility").trim();
			String visitorAccessMode_Default_Value = excelFileDataRecord.get("VisitorAccessMode_Default_Value").trim();
			String visitorAccessMode_Values = excelFileDataRecord.get("VisitorAccessMode_Values").trim();
			String visitorAccessMode_Select_Values = excelFileDataRecord.get("VisitorAccessMode_Select_Values").trim();
			dropDown_Check_UIValidation("Visitor Access Mode", rowNumber, sheetName,
					basic_Optional_VisitorAccessModeLabel, basic_Optional_VisitorAccessMode,
					basic_Optional_VisitorAccessMode_Size, visitorAccessMode_label, visitorAccessMode_Type,
					visitorAccessMode_Visibility, visitorAccessMode_Default_Value, visitorAccessMode_Select_Values,
					visitorAccessMode_Values, "");

			// Alert Messages Control
			String alertMessages_label = excelFileDataRecord.get("AlertMessages_label").trim();
			String alertMessages_Type = excelFileDataRecord.get("AlertMessages_Type").trim();
			String alertMessages_Visibility = excelFileDataRecord.get("AlertMessages_Visibility").trim();
			String alertMessages_Default_Value = excelFileDataRecord.get("AlertMessages_Default_Value").trim();
			String alertMessages_Value = excelFileDataRecord.get("AlertMessages_Value").trim();
			checkbox_Check_UIValidation("Alert Messages", rowNumber, sheetName, basic_Optional_AlertMessagesLabel,
					basic_Optional_AlertMessages, alertMessages_label, alertMessages_Type, alertMessages_Visibility,
					alertMessages_Default_Value, alertMessages_Value);

			// Consider For Visitor Pass Surrender Control
			String considerForVisitorPassSurrender_label = excelFileDataRecord
					.get("ConsiderForVisitorPassSurrender_label").trim();
			String considerForVisitorPassSurrender_Type = excelFileDataRecord
					.get("ConsiderForVisitorPassSurrender_Type").trim();
			String considerForVisitorPassSurrender_Visibility = excelFileDataRecord
					.get("ConsiderForVisitorPassSurrender_Visibility").trim();
			String considerForVisitorPassSurrender_Default_Value = excelFileDataRecord
					.get("ConsiderForVisitorPassSurrender_Default_Value").trim();
			String considerForVisitorPassSurrender_Value = excelFileDataRecord
					.get("ConsiderForVisitorPassSurrender_Value").trim();
			checkbox_Check_UIValidation("Consider For Visitor Pass Surrender", rowNumber, sheetName,
					basic_Optional_ConsiderForVisitorPassSurrenderLabel, basic_Optional_ConsiderForVisitorPassSurrender,
					considerForVisitorPassSurrender_label, considerForVisitorPassSurrender_Type,
					considerForVisitorPassSurrender_Visibility, considerForVisitorPassSurrender_Default_Value,
					considerForVisitorPassSurrender_Value);

			// Consider For Attendance Control
			String considerForAttendance_label = excelFileDataRecord.get("ConsiderForAttendance_label").trim();
			String considerForAttendance_Type = excelFileDataRecord.get("ConsiderForAttendance_Type").trim();
			String considerForAttendance_Visibility = excelFileDataRecord.get("ConsiderForAttendance_Visibility")
					.trim();
			String considerForAttendance_Default_Value = excelFileDataRecord.get("ConsiderForAttendance_Default_Value")
					.trim();
			String considerForAttendance_Value = excelFileDataRecord.get("ConsiderForAttendance_Value").trim();
			checkbox_Check_UIValidation("Consider For Attendance", rowNumber, sheetName,
					basic_Optional_ConsiderForAttendanceLabel, basic_Optional_ConsiderForAttendance,
					considerForAttendance_label, considerForAttendance_Type, considerForAttendance_Visibility,
					considerForAttendance_Default_Value, considerForAttendance_Value);

			// Generate Events Control
			String generateEvents_label = excelFileDataRecord.get("GenerateEvents_label").trim();
			String generateEvents_Type = excelFileDataRecord.get("GenerateEvents_Type").trim();
			String generateEvents_Visibility = excelFileDataRecord.get("GenerateEvents_Visibility").trim();
			String generateEvents_Default_Value = excelFileDataRecord.get("GenerateEvents_Default_Value").trim();
			String generateEvents_Value = excelFileDataRecord.get("GenerateEvents_Value").trim();
			checkbox_Check_UIValidation("Generate Events", rowNumber, sheetName, basic_Optional_GenerateEventsLabel,
					basic_Optional_GenerateEvents, generateEvents_label, generateEvents_Type, generateEvents_Visibility,
					generateEvents_Default_Value, generateEvents_Value);

			// Cafeteria Face Access Mode Control
			Thread.sleep(500);
			String cafeteriaFaceAccessMode_label = excelFileDataRecord.get("CafeteriaFaceAccessMode_label").trim();
			String cafeteriaFaceAccessMode_Type = excelFileDataRecord.get("CafeteriaFaceAccessMode_Type").trim();
			String cafeteriaFaceAccessMode_Visibility = excelFileDataRecord.get("CafeteriaFaceAccessMode_Visibility")
					.trim();
			String cafeteriaFaceAccessMode_Default_Value = excelFileDataRecord
					.get("CafeteriaFaceAccessMode_Default_Value").trim();
			String cafeteriaFaceAccessMode_Values = excelFileDataRecord.get("CafeteriaFaceAccessMode_Values").trim();
			String cafeteriaFaceAccessMode_Select_Values = excelFileDataRecord
					.get("CafeteriaFaceAccessMode_Select_Values").trim();
			dropDown_Check_UIValidation("Cafeteria Face Access Mode", rowNumber, sheetName,
					basic_Optional_CafeteriaFaceAccessModeLabel, basic_Optional_CafeteriaFaceAccessMode,
					basic_Optional_CafeteriaFaceAccessMode_Size, cafeteriaFaceAccessMode_label,
					cafeteriaFaceAccessMode_Type, cafeteriaFaceAccessMode_Visibility,
					cafeteriaFaceAccessMode_Default_Value, cafeteriaFaceAccessMode_Select_Values,
					cafeteriaFaceAccessMode_Values, "");

			// Save button then checked main validation
			saveButtonClick();
			valMsg = validationMessage();
			String excelVal = excelFileDataRecord.get("Validation").trim();
			if (!excelVal.isBlank() && !excelVal.isEmpty()) {
				assertEquals(valMsg, excelFileDataRecord.get("Validation").trim(),
						"Main Validation on Save button Comparison", true, rowNumber, sheetName);
			}
			Thread.sleep(1500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			reloadPageButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));

		}

	}

	@FindBy(xpath = "//label[text()=\"Readers\"]")
	private WebElement readersTabControl;

	@FindBy(xpath = "//label[text()=\"Readers\"]/ancestor::li[1]")
	private WebElement readersTabControlActiveOrNot;

	@FindBy(id = "chkDoorModeSel")
	private WebElement readers_DoorModeSelection;

	@FindBy(xpath = "//*[@id='chkDoorModeSel']/ancestor::div[@class='form-group']//label")
	private WebElement readers_DoorModeSelection_Label;

	@FindBy(id = "chkPromSpFun")
	private WebElement readers_PromptSpecialFunction;

	@FindBy(xpath = "//*[@id='chkPromSpFun']/ancestor::div[@class='form-group']//label")
	private WebElement readers_PromptSpecialFunction_Label;

	@FindBy(id = "chkAccessCntrlOnExit")
	private WebElement readers_AccessControlOnExitMode;

	@FindBy(xpath = "//*[@id='chkAccessCntrlOnExit']/ancestor::div[@class='form-group']//label")
	private WebElement readers_AccessControlOnExitMode_Label;

	@FindBy(id = "chkAutoDetectRdrs")
	private WebElement readers_AutoDetectReaders;

	@FindBy(xpath = "//*[@id='chkAutoDetectRdrs']/ancestor::div[@class='form-group']//label")
	private WebElement readers_AutoDetectReaders_Label;

	@FindBy(xpath = "//*[text()=\"Internal Readers\"]")
	private WebElement readers_InternalReaders_Tab;

	@FindBy(xpath = "//*[text()=\"Internal Readers\"]/ancestor::a[1]")
	private WebElement readers_InternalReaders_Tab_OpenOrClose;

	@FindBy(xpath = "//*[text()=\"External Readers\"]")
	private WebElement readers_ExternalReaders_Tab;

	@FindBy(xpath = "//*[text()=\"External Readers\"]/ancestor::a[1]")
	private WebElement readers_ExternalReaders_Tab_OpenOrClose;

	@FindBy(xpath = "//*[@id=\"cboCaRdrMode\"]//ancestor::div[2]//label")
	private WebElement readers_InternalReaders_Tab_Mode_Label;

	@FindBy(id = "cboCaRdrMode")
	private WebElement readers_InternalReaders_Tab_Mode;

	@FindBy(id = "cboCaRdrMode")
	private List<WebElement> readers_InternalReaders_Tab_Mode_Size;

	@FindBy(xpath = "//*[@id=\"cboCaRdrType\"]//ancestor::div[2]//label")
	private WebElement readers_InternalReaders_Tab_CardReaderType_Label;

	@FindBy(id = "cboCaRdrType")
	private WebElement readers_InternalReaders_Tab_CardReaderType;

	@FindBy(id = "cboCaRdrType")
	private List<WebElement> readers_InternalReaders_Tab_CardReaderType_Size;

	@FindBy(id = "chkEnblSchedule")
	private WebElement readers_InternalReaders_EnableScheduling;

	@FindBy(xpath = "//*[@id='chkEnblSchedule']/ancestor::div[@class='form-group']//label[normalize-space()='Enable Scheduling']")
	private WebElement readers_InternalReaders_EnableScheduling_Label;

	// Reader Mode Schedule locators
	@FindBy(id = "AutoRdrModeSchduleID")
	private WebElement readers_InternalReaders_ReaderModeScheduleID;

	@FindBy(id = "AutoRdrModeSchduleName")
	private WebElement readers_InternalReaders_ReaderModeScheduleName;

	@FindBy(xpath = "//*[@id='AutoRdrModeSchduleID']/ancestor::div[@class='form-group']//label[normalize-space()='Reader Mode Schedule']")
	private WebElement readers_InternalReaders_ReaderModeSchedule_label;

	@FindBy(id = "chkAlwBLE")
	private WebElement readers_InternalReaders_AdvertiseBluetooth;

	@FindBy(xpath = "//*[@id='chkAlwBLE']/ancestor::div[@class='form-group']//label[normalize-space()='Advertise Bluetooth']")
	private WebElement readers_InternalReaders_AdvertiseBluetooth_Label;

	@FindBy(id = "txtAdvBLEName")
	private WebElement readers_InternalReaders_BluetoothName;

	@FindBy(xpath = "//*[@id='txtAdvBLEName']/ancestor::div[@class='form-group']//label[normalize-space()='Bluetooth Name']")
	private WebElement readers_InternalReaders_BluetoothName_Label;

	@FindBy(id = "cmbAdvBLERange")
	private WebElement readers_InternalReaders_BluetoothRange;

	@FindBy(id = "cmbAdvBLERange")
	private List<WebElement> readers_InternalReaders_BluetoothRange_Size;

	@FindBy(xpath = "//*[@id='cmbAdvBLERange']/ancestor::div[@class='form-group']//label[normalize-space()='Bluetooth Range']")
	private WebElement readers_InternalReaders_BluetoothRange_Label;

	@FindBy(id = "txtCustBLE")
	private WebElement readers_InternalReaders_CustomBluetoothRange;

	@FindBy(xpath = "//*[@id='txtCustBLE']/ancestor::div[@class='form-group']//label[normalize-space()='Custom Bluetooth Range (dBm)']")
	private WebElement readers_InternalReaders_CustomBluetoothRange_Label;

	@FindBy(xpath = "//*[@title=\"Lower values indicate shorter Bluetooth range.\"]")
	private WebElement readers_InternalReaders_CustomBluetoothRange_InfoIcon;

	@FindBy(xpath = "//*[@id=\"AutoRdrModeSchduleName\"]/following-sibling::span[1]//i")
	private WebElement readers_InternalReaders_ReaderModeSchedule_picklistBtn;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@class=\"mx-input-theme label-bold label-text\"]")
	private WebElement readers_InternalReaders_ReaderModeSchedule_Popup_Label;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement readers_InternalReaders_ReaderModeSchedule_Popup_search;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@name=\"cmnTxtSearch\"]//ancestor::div[1]/i")
	private WebElement readers_InternalReaders_ReaderModeSchedule_Popup_search_Button;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/thead//label")
	private List<WebElement> readers_InternalReaders_ReaderModeSchedule_Popup_table_header;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/tbody//tr")
	private List<WebElement> readers_InternalReaders_ReaderModeSchedule_Popup_table_Row;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@key=\"No Data Found\"]/label")
	private WebElement readers_InternalReaders_ReaderModeSchedule_Popup_table_No_Data;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/tbody//tr/td[@class=\"cursor label-text\"][2]/label")
	private List<WebElement> readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@key=\"Cancel\"]")
	private WebElement readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@key=\"OK\"]")
	private WebElement readers_InternalReaders_ReaderModeSchedule_Popup_OkButton;

	@FindBy(xpath = "(//*[@name=\"cmnTxtSearch\"]//ancestor::div[1]/i)[1]")
	private WebElement internalReaders_SearchBtn;

	@FindBy(xpath = "(//*[@name=\"cmnTxtSearch\"]//ancestor::div[1]/i)[2]")
	private WebElement externalReaders_SearchBtn;

	// external readers elements
	@FindBy(id = "cboExtRdrMode")
	private WebElement readers_ExternalReaders_Mode;

	@FindBy(id = "cboExtRdrMode")
	private List<WebElement> readers_ExternalReaders_Mode_Size;

	@FindBy(xpath = "//*[@id='cboExtRdrMode']/ancestor::div[@class='form-group']//label[normalize-space()='Mode']")
	private WebElement readers_ExternalReaders_Mode_Label;

	@FindBy(id = "cboExtRdrType")
	private WebElement readers_ExternalReaders_ExternalReaderType;

	@FindBy(id = "cboExtRdrType")
	private List<WebElement> readers_ExternalReaders_ExternalReaderType_Size;

	@FindBy(xpath = "//*[@id='cboExtRdrType']/ancestor::div[@class='form-group']//label[normalize-space()='External Reader Type']")
	private WebElement readers_ExternalReaders_ExternalReaderType_Label;

	@FindBy(id = "chkExitSw")
	private WebElement readers_ExternalReaders_ExitSwitch;

	@FindBy(xpath = "//*[@id='chkExitSw']/ancestor::div[@class='form-group']//label[normalize-space()='Exit Switch']")
	private WebElement readers_ExternalReaders_ExitSwitch_Label;

	@FindBy(id = "cboAccessModes")
	private WebElement readers_ExternalReaders_UserAccessMode;

	@FindBy(id = "cboAccessModes")
	private List<WebElement> readers_ExternalReaders_UserAccessMode_Size;

	@FindBy(xpath = "//*[@id='cboAccessModes']/ancestor::div[@class='form-group']//label[normalize-space()='User Access Mode']")
	private WebElement readers_ExternalReaders_UserAccessMode_Label;

	@FindBy(id = "cmbVisAccModes")
	private WebElement readers_ExternalReaders_VisitorAccessMode;

	@FindBy(id = "cmbVisAccModes")
	private List<WebElement> readers_ExternalReaders_VisitorAccessMode_Size;

	@FindBy(xpath = "//*[@id='cmbVisAccModes']/ancestor::div[@class='form-group']//label[normalize-space()='Visitor Access Mode']")
	private WebElement readers_ExternalReaders_VisitorAccessMode_Label;

	@FindBy(name = "cmnTxtSearch")
	private WebElement searchBoxElement;

	@FindBy(xpath = "//*[@id='div_grd_grdMultiCardFormatExport']//*[@name=\"cmnTxtSearch\"]")
	private WebElement externalReaders_searchBoxElement;

	private WebElement searchBoxLabelElement = null;

	@FindBy(id = "grdMultiCardFormatImportaddBtn")
	private WebElement internalReaders_AddButton;

	@FindBy(id = "grdMultiCardFormatExportaddBtn")
	private WebElement externalReaders_AddButton;

	private WebElement internalReaders_AddButton_Label = null;

	@FindBy(xpath = "(//*[@id=\"grid1\"]//tr)[1]//*[@class=\"mx-input-theme grid-header-font label-text\"]")
	private List<WebElement> internalReaders_TableHeader;

	@FindBy(xpath = "(//*[@id=\"grid1\"]//tr)[4]//*[@class='mx-input-theme grid-header-font label-text']//label")
	private List<WebElement> externalReaders_TableHeader;

	@FindBy(xpath = "//*[@id=\"div_grd_grdMultiCardFormatImport\"]//table/tbody//tr[not(@hidden)]")
	private List<WebElement> internalReaders_TableRowData;

	@FindBy(xpath = "(//*[@id=\"grid1\"]//tr)[5]//label[text()[normalize-space()]]")
	private List<WebElement> externalReaders_TableRowData;

	@FindBy(xpath = "//*[contains(text(), 'No Data Found')]")
	private WebElement internalReaders_NoDataFound;

	public void deviceUIControlValidation_Readers(List<Map<String, String>> data, String sheetName) throws Exception {
		for (int i = 0; i < data.size(); i++) {
			eachRowStatus = false;
			String valMsg = null;
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			Map<String, String> excelFileDataRecord = data.get(i);
			logger.info("***********************************Excel Data Record Picked : Row Number = " + i + " Data is ="
					+ excelFileDataRecord);
			int rowNumber = Integer.parseInt(excelFileDataRecord.get("RowNumber"));
			addButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			waitForElementVisible_TimeinMinutes(selectDeviceTypeBeAddedpopUp, 2);
			for (int j = 0; j < selectDeviceTypeToBeAdded.size(); j++) {
				String title = selectDeviceTypeToBeAdded.get(j).getAttribute("title");
				if (title.equalsIgnoreCase(excelFileDataRecord.get("DeviceType"))) {
					selectDeviceTypeToBeAdded.get(j).click();
					Thread.sleep(500);
					waitForElementClickable(deviceContinue);
					element_Click(deviceContinue);
					Thread.sleep(500);
					break;
				}
			}
			Thread.sleep(500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementClickable(active, 1);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			// *******************Start Device Name Textbox And Control*******************

			String deviceNameV = excelFileDataRecord.get("DeviceName_Value").trim();
			textBox_Control_Check_UIValidation("Device Name", rowNumber, sheetName, deviceidNameLabel, deviceNameTxt,
					"", "", "", "", "", deviceNameV, "");

			// *******************Start Mac Address Textbox And Control*******************
			String macAddressV = excelFileDataRecord.get("MacAddress_Value").trim();
			if (!macAddressV.isBlank() && !macAddressV.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				String[] macs = macAddressV.split(":");
				for (int x = 0; x < macAddressTxt.size(); x++) {
					macAddressTxt.get(x).sendKeys(macs[x]);
				}
			}
			// **********************Start Readers Tab***********************************
			String readers_label = excelFileDataRecord.get("Readers_label").trim();
			String readers_Default = excelFileDataRecord.get("Readers_Default").trim();
			String readers_Select = excelFileDataRecord.get("Readers_Select").trim();
			if (!readers_label.isBlank() && !readers_label.isEmpty()) {
				assertEquals(readersTabControl.getText(), readers_label, "Readers Tab Control Label Comparision", true,
						rowNumber, sheetName);
			}
			if (!readers_Select.isBlank() && !readers_Select.isEmpty()) {
				element_Click(readersTabControl);
				Thread.sleep(250);
			}
			if (!readers_Default.isBlank() && !readers_Default.isEmpty()) {
				String deviceGetID = readersTabControlActiveOrNot.getAttribute("class");
				String value = null;
				if (deviceGetID.toLowerCase().contains("tab-active")) {
					value = "tab-active";
				} else {
					value = "tab-non-active";
				}
				assertEquals(value, readers_Default, "Readers Tab Control Label Comparision", true, rowNumber,
						sheetName);
			}

			// aagam code start
			// *****Door Mode Selection - checkbox****
			String doormodeselectionLab = excelFileDataRecord.get("DoorModeSelection_label").trim();
			String doormodeselectionTy = excelFileDataRecord.get("DoorModeSelection_Type").trim();
			String doormodeselectionVi = excelFileDataRecord.get("DoorModeSelection_Visibility").trim();
			String doormodeselection_default = excelFileDataRecord.get("DoorModeSelection_Default_Value").trim();
			String doormodeselectionV = excelFileDataRecord.get("DoorModeSelection_Value").trim();
			checkbox_Check_UIValidation("Door Mode Selection", rowNumber, sheetName, readers_DoorModeSelection_Label,
					readers_DoorModeSelection, doormodeselectionLab, doormodeselectionTy, doormodeselectionVi,
					doormodeselection_default, doormodeselectionV);

			// *****Prompt Special Function - checkbox****
			String promptspecialfunctionLab = excelFileDataRecord.get("PromptSpecialFunction_label").trim();
			String promptspecialfunctionTy = excelFileDataRecord.get("PromptSpecialFunction_Type").trim();
			String promptspecialfunctionVi = excelFileDataRecord.get("PromptSpecialFunction_Visibility").trim();
			String promptspecialfunction_default = excelFileDataRecord.get("PromptSpecialFunction_Default_Value")
					.trim();
			String promptspecialfunctionV = excelFileDataRecord.get("PromptSpecialFunction_Value").trim();
			checkbox_Check_UIValidation("Prompt Special Function", rowNumber, sheetName,
					readers_PromptSpecialFunction_Label, readers_PromptSpecialFunction, promptspecialfunctionLab,
					promptspecialfunctionTy, promptspecialfunctionVi, promptspecialfunction_default,
					promptspecialfunctionV);

			// *****Auto Detect Readers - checkbox****
			String autodetectreadersLab = excelFileDataRecord.get("AutoDetectReaders_label").trim();
			String autodetectreadersTy = excelFileDataRecord.get("AutoDetectReaders_Type").trim();
			String autodetectreadersVi = excelFileDataRecord.get("AutoDetectReaders_Visibility").trim();
			String autodetectreaders_default = excelFileDataRecord.get("AutoDetectReaders_Default_Value").trim();
			String autodetectreadersV = excelFileDataRecord.get("AutoDetectReaders_Value").trim();
			checkbox_Check_UIValidation("Auto Detect Readers", rowNumber, sheetName, readers_AutoDetectReaders_Label,
					readers_AutoDetectReaders, autodetectreadersLab, autodetectreadersTy, autodetectreadersVi,
					autodetectreaders_default, autodetectreadersV);

			// *******************Internal Readers Tab Control*******************
			String internalreadersTabLab = excelFileDataRecord.get("InternalReaderstab_label").trim();
			String internalreadersTabOpen = excelFileDataRecord.get("InternalReaderstab_Default").trim();
			String internalreadersTabValue = excelFileDataRecord.get("InternalReaderstab_Value").trim();

			tab_Control_Check_UIValidation("Internal Readers", rowNumber, sheetName, readers_InternalReaders_Tab,
					readers_InternalReaders_Tab_OpenOrClose, internalreadersTabLab, internalreadersTabOpen,
					internalreadersTabValue);

			// *******************Internal Readers Tab > Mode Control*******************
			String internalreaderstabMode_label = excelFileDataRecord.get("InternalReaderstab_Mode_label").trim();
			String internalreaderstabMode_Type = excelFileDataRecord.get("InternalReaderstab_Mode_Type").trim();
			String internalreaderstabMode_Visibility = excelFileDataRecord.get("InternalReaderstab_Mode_Visibility")
					.trim();
			String internalreaderstabMode_Default_Value = excelFileDataRecord
					.get("InternalReaderstab_Mode_Default_Value").trim();
			String internalreaderstabMode_Values = excelFileDataRecord.get("InternalReaderstab_Mode_Values").trim();
			String internalreaderstabMode_Select_Values = excelFileDataRecord
					.get("InternalReaderstab_Mode_Select_Values").trim();
			String internalreaderstabMode_visibleOrNot = excelFileDataRecord.get("InternalReaderstab_Mode_visibleOrNot")
					.trim();
			dropDown_Check_UIValidation("Mode", rowNumber, sheetName, readers_InternalReaders_Tab_Mode_Label,
					readers_InternalReaders_Tab_Mode, readers_InternalReaders_Tab_Mode_Size,
					internalreaderstabMode_label, internalreaderstabMode_Type, internalreaderstabMode_Visibility,
					internalreaderstabMode_Default_Value, internalreaderstabMode_Select_Values,
					internalreaderstabMode_Values, internalreaderstabMode_visibleOrNot);

			// *******************Internal Readers Tab > Card Reader Type
			// Control*******************
			String internalreaderstabcardreadertype_label = excelFileDataRecord
					.get("InternalReaderstab_CardReaderType_label").trim();
			String internalreaderstabcardreadertype_Type = excelFileDataRecord
					.get("InternalReaderstab_CardReaderType_Type").trim();
			String internalreaderstabcardreadertype_Visibility = excelFileDataRecord
					.get("InternalReaderstab_CardReaderType_Visibility").trim();
			String internalreaderstabcardreadertype_Default_Value = excelFileDataRecord
					.get("InternalReaderstab_CardReaderType_Default_Value").trim();
			String internalreaderstabcardreadertype_Values = excelFileDataRecord
					.get("InternalReaderstab_CardReaderType_Values").trim();
			String internalreaderstabcardreadertype_Select_Values = excelFileDataRecord
					.get("InternalReaderstab_CardReaderType_Select_Values").trim();
			String internalreaderstabcardreadertype_visibleOrNot = excelFileDataRecord
					.get("InternalReaderstab_CardReaderType_visibleOrNot").trim();
			dropDown_Check_UIValidation("Card Reader Type", rowNumber, sheetName,
					readers_InternalReaders_Tab_CardReaderType_Label, readers_InternalReaders_Tab_CardReaderType,
					readers_InternalReaders_Tab_CardReaderType_Size, internalreaderstabcardreadertype_label,
					internalreaderstabcardreadertype_Type, internalreaderstabcardreadertype_Visibility,
					internalreaderstabcardreadertype_Default_Value, internalreaderstabcardreadertype_Select_Values,
					internalreaderstabcardreadertype_Values, internalreaderstabcardreadertype_visibleOrNot);

			String internalReaders_SearchBox_lbl = excelFileDataRecord.get("InternalReaders_SearchBox_label").trim();
			String internalReaders_SearchBox_t = excelFileDataRecord.get("InternalReaders_SearchBox_type").trim();
			String internalReaders_SearchBox_v = excelFileDataRecord.get("InternalReaders_SearchBox_visibility").trim();
			String internalReaders_SearchBox_p = excelFileDataRecord.get("InternalReaders_SearchBox_placeholder")
					.trim();
			String internalReaders_SearchBox_d = excelFileDataRecord.get("InternalReaders_SearchBox_default").trim();
			String internalReaders_SearchBox_val = excelFileDataRecord.get("InternalReaders_SearchBox_value").trim();

			if (!excelFileDataRecord.get("InternalReaders_SearchBox_label").isBlank()
					|| !excelFileDataRecord.get("InternalReaders_SearchBox_type").isBlank()
					|| !excelFileDataRecord.get("InternalReaders_SearchBox_visibility").isBlank()
					|| !excelFileDataRecord.get("InternalReaders_SearchBox_placeholder").isBlank()
					|| !excelFileDataRecord.get("InternalReaders_SearchBox_default").isBlank()
					|| !excelFileDataRecord.get("InternalReaders_SearchBox_value").isBlank()
					|| !excelFileDataRecord.get("InternalReaders_AddButton_label").isBlank()
					|| !excelFileDataRecord.get("InternalReaders_AddButton_type").isBlank()
					|| !excelFileDataRecord.get("InternalReaders_AddButton_visibility").isBlank()
					|| !excelFileDataRecord.get("InternalReaders_Table_Header_Values").isBlank()
					|| !excelFileDataRecord.get("InternalReaders_Table_Row_Values").isBlank()
					|| !excelFileDataRecord.get("InternalReaders_Table_NoData_Value").isBlank()) {

				System.out.println("I am in Internal Readers Section");

				if (!internalReaders_SearchBox_lbl.isBlank() && !internalReaders_SearchBox_lbl.isEmpty()) {
					System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
					assertEquals(searchBoxLabelElement.getText(), internalReaders_SearchBox_lbl,
							"Site Pop Up Label Comparision", true, rowNumber, sheetName);
				}
				// Start Search Box
				if (!internalReaders_SearchBox_p.isBlank() && !internalReaders_SearchBox_p.isEmpty()) {
					System.out.println(
							"Element PlaceHolder :" + element_GetAttributeValue(searchBoxElement, "placeholder"));
					assertEquals(element_GetAttributeValue(searchBoxElement, "placeholder"),
							internalReaders_SearchBox_p, "Site Pop Up -> SearchBox PlaceHolder Comparison", true,
							rowNumber, sheetName);
				}
				if (!internalReaders_SearchBox_t.isBlank() && !internalReaders_SearchBox_t.isEmpty()) {
					System.out.println("Element Attribute :" + element_GetAttributeValue(searchBoxElement, "type"));
					assertEquals(element_GetAttributeValue(searchBoxElement, "type"), internalReaders_SearchBox_t,
							"Site Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
				}
				if (!internalReaders_SearchBox_val.isBlank() && !internalReaders_SearchBox_val.isEmpty()) {
					element_InputText(searchBoxElement, internalReaders_SearchBox_val);
					Thread.sleep(250);
//									element_Click(internalReaders_SearchBtn);
				}

				// Add Button Validation
				button_Check_UIValidation("Add Button", rowNumber, sheetName, internalReaders_AddButton_Label,
						internalReaders_AddButton, excelFileDataRecord.get("InternalReaders_AddButton_label").trim(),
						excelFileDataRecord.get("InternalReaders_AddButton_type").trim(),
						excelFileDataRecord.get("InternalReaders_AddButton_visibility").trim());

				// Table Header Validation
				tableHeader_Control_Check_UIValidation("Internal Readers Table", rowNumber, sheetName,
						internalReaders_TableHeader,
						excelFileDataRecord.get("InternalReaders_Table_Header_Values").trim());

				// Table Row Validation
				tableRow_Control_Check_UIValidation("Internal Readers Table", rowNumber, sheetName,
						internalReaders_TableRowData, "td[not(@hidden)]//label", internalReaders_NoDataFound,
						excelFileDataRecord.get("InternalReaders_Table_Row_Values").trim(),
						excelFileDataRecord.get("InternalReaders_Table_NoData_Value").trim());
			}

			// *****Enable Scheduling - checkbox****
			String enableschedulingLab = excelFileDataRecord.get("EnableScheduling_label").trim();
			String enableschedulingTy = excelFileDataRecord.get("EnableScheduling_Type").trim();
			String enableschedulingVi = excelFileDataRecord.get("EnableScheduling_Visibility").trim();
			String enablescheduling_default = excelFileDataRecord.get("EnableScheduling_Default_Value").trim();
			String enableschedulingV = excelFileDataRecord.get("EnableScheduling_Value").trim();
			checkbox_Check_UIValidation("Enable Scheduling", rowNumber, sheetName,
					readers_InternalReaders_EnableScheduling_Label, readers_InternalReaders_EnableScheduling,
					enableschedulingLab, enableschedulingTy, enableschedulingVi, enablescheduling_default,
					enableschedulingV);

			// *******************Start Reader Mode Schedule Id Label And
			// Control*******************
			String readerModeScheduleIdLab = excelFileDataRecord.get("ReaderModeScheduleId_label").trim();
			String readerModeScheduleIdTy = excelFileDataRecord.get("ReaderModeScheduleId_Type").trim();
			String readerModeScheduleIdVi = excelFileDataRecord.get("ReaderModeScheduleId_Visibility").trim();
			String readerModeScheduleIdP = excelFileDataRecord.get("ReaderModeScheduleId_Placeholder").trim();
			String readerModeScheduleId_default = excelFileDataRecord.get("ReaderModeScheduleId_Default_Value").trim();
			String readerModeScheduleIdV = excelFileDataRecord.get("ReaderModeScheduleId_Value").trim();
			String readerModeScheduleIdNegative = excelFileDataRecord.get("ReaderModeScheduleId_Negative").trim();
			textBox_Control_Check_UIValidation("Reader Mode Schedule Id", rowNumber, sheetName,
					readers_InternalReaders_ReaderModeSchedule_label, readers_InternalReaders_ReaderModeScheduleID,
					readerModeScheduleIdLab, readerModeScheduleIdTy, readerModeScheduleIdVi, readerModeScheduleIdP,
					readerModeScheduleId_default, readerModeScheduleIdV, readerModeScheduleIdNegative);
			// *******************Start Reader Mode Schedule Name Label And
			// Control*******************

			String readerModeScheduleNameTy = excelFileDataRecord.get("ReaderModeScheduleName_Type").trim();
			String readerModeScheduleNameVi = excelFileDataRecord.get("ReaderModeScheduleName_Visibility").trim();
			String readerModeScheduleNameP = excelFileDataRecord.get("ReaderModeScheduleName_Placeholder").trim();
			String readerModeScheduleName_default = excelFileDataRecord.get("ReaderModeScheduleName_Default_Value")
					.trim();
			String readerModeScheduleNameV = excelFileDataRecord.get("ReaderModeScheduleName_Value").trim();
			String readerModeScheduleNameNegative = excelFileDataRecord.get("ReaderModeScheduleName_Negative").trim();
			textBox_Control_Check_UIValidation("Reader Mode Schedule Name", rowNumber, sheetName,
					readers_InternalReaders_ReaderModeSchedule_label, readers_InternalReaders_ReaderModeScheduleName,
					"", readerModeScheduleNameTy, readerModeScheduleNameVi, readerModeScheduleNameP,
					readerModeScheduleName_default, readerModeScheduleNameV, readerModeScheduleNameNegative);

			// *******************Start Reader Mode Schedule Pop Up Button And
			// Control*******************
			String readerModeSchedulePopUp_LabelBasicV = excelFileDataRecord.get("ReaderModeSchedulePopUp_Label")
					.trim();
			String readerModeSchedulePopUpSearch_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Type")
					.trim();
			String readerModeSchedulePopUpSearch_Placeholder = excelFileDataRecord
					.get("ReaderModeSchedulePopUpSearch_Placeholder").trim();
			String readerModeSchedulePopUpSearch_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Value")
					.trim();
			String readerModeSchedulePopUp_Default_Table_Header_Value = excelFileDataRecord
					.get("ReaderModeSchedulePopUp_Default_Table_Header_Value").trim();
			String readerModeSchedulePopUp_Default_Table_Row_Value = excelFileDataRecord
					.get("ReaderModeSchedulePopUp_Default_Table_Row_Value").trim();
			String readerModeSchedulePopUp_Default_Table_No_Data_Value = excelFileDataRecord
					.get("ReaderModeSchedulePopUp_Default_Table_No_Data_Value").trim();
			String readerModeSchedulePopUp_Default_Table_Row_Value_Select = excelFileDataRecord
					.get("ReaderModeSchedulePopUp_Default_Table_Row_Value_Select").trim();
			String readerModeSchedulePopUpCancel_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Type")
					.trim();
			String readerModeSchedulePopUpCancel_Default_Value = excelFileDataRecord
					.get("ReaderModeSchedulePopUpCancel_Default_Value").trim();
			String readerModeSchedulePopUpOK_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpOK_Type").trim();
			String readerModeSchedulePopUpOK_Default_Value = excelFileDataRecord
					.get("ReaderModeSchedulePopUpOk_Default_Value").trim();
			String readerModeSchedulePopUpClose_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpClose_Type")
					.trim();
			if (!readerModeSchedulePopUp_LabelBasicV.isBlank() || !readerModeSchedulePopUpSearch_Type.isBlank()
					|| !readerModeSchedulePopUpSearch_Placeholder.isBlank()
					|| !readerModeSchedulePopUpSearch_Value.isBlank()
					|| !readerModeSchedulePopUp_Default_Table_Header_Value.isBlank()
					|| !readerModeSchedulePopUp_Default_Table_Row_Value.isBlank()
					|| !readerModeSchedulePopUp_Default_Table_No_Data_Value.isBlank()
					|| !readerModeSchedulePopUpCancel_Type.isBlank()
					|| !readerModeSchedulePopUpCancel_Default_Value.isBlank()
					|| !readerModeSchedulePopUpOK_Type.isBlank() || !readerModeSchedulePopUpOK_Default_Value.isBlank()
					|| !readerModeSchedulePopUp_Default_Table_Row_Value_Select.isBlank()
					|| !readerModeSchedulePopUpClose_Type.isBlank()) {
				System.out.println("I am in Site PopUp");
				element_Click(readers_InternalReaders_ReaderModeSchedule_picklistBtn);
				waitForElementVisible(readers_InternalReaders_ReaderModeSchedule_Popup_Label);
				// Pop up Open
				if (!readerModeSchedulePopUp_LabelBasicV.isBlank() && !readerModeSchedulePopUp_LabelBasicV.isEmpty()) {
					System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
					assertEquals(readers_InternalReaders_ReaderModeSchedule_Popup_Label.getText(),
							readerModeSchedulePopUp_LabelBasicV, "Site Pop Up Label Comparision", true, rowNumber,
							sheetName);
				}
				// Start Search Box
				if (!readerModeSchedulePopUpSearch_Placeholder.isBlank()
						&& !readerModeSchedulePopUpSearch_Placeholder.isEmpty()) {
					System.out.println("Element PlaceHolder :" + element_GetAttributeValue(
							readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"));
					assertEquals(
							element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search,
									"placeholder"),
							readerModeSchedulePopUpSearch_Placeholder,
							"Site Pop Up -> SearchBox PlaceHolder Comparison", true, rowNumber, sheetName);
				}
				if (!readerModeSchedulePopUpSearch_Type.isBlank() && !readerModeSchedulePopUpSearch_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_search, "type"));
					assertEquals(
							element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "type"),
							readerModeSchedulePopUpSearch_Type, "Site Pop Up -> SearchBox Type Comparison", true,
							rowNumber, sheetName);
				}
				if (!readerModeSchedulePopUpSearch_Value.isBlank() && !readerModeSchedulePopUpSearch_Value.isEmpty()) {
					element_InputText(readers_InternalReaders_ReaderModeSchedule_Popup_search,
							readerModeSchedulePopUpSearch_Value);
					Thread.sleep(250);
					element_Click(basic_Site_Popup_search_Button);
					Thread.sleep(250);
				}
				// Table Header Value Checked
				tableHeader_Control_Check_UIValidation("Picklist For Reader Mode Schedules", rowNumber, sheetName,
						readers_InternalReaders_ReaderModeSchedule_Popup_table_header,
						readerModeSchedulePopUp_Default_Table_Header_Value);
				Thread.sleep(250);
				tableRow_Control_Check_UIValidation("Reader Mode Schedule Pop Up Table Row", rowNumber, sheetName,
						readers_InternalReaders_ReaderModeSchedule_Popup_table_Row,
						"td[@class=\"cursor label-text\"]/label",
						readers_InternalReaders_ReaderModeSchedule_Popup_table_No_Data,
						readerModeSchedulePopUp_Default_Table_Row_Value,
						readerModeSchedulePopUp_Default_Table_No_Data_Value);

				// Cancel Button
				if (!readerModeSchedulePopUpCancel_Type.isBlank() && !readerModeSchedulePopUpCancel_Type.isEmpty()) {
					System.out.println("Element Attribute :" + element_GetAttributeValue(
							readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"));
					assertEquals(
							element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton,
									"type"),
							readerModeSchedulePopUpCancel_Type,
							"Reader Mode Schedule Pop Up -> Cencel Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!readerModeSchedulePopUpCancel_Default_Value.isBlank()
						&& !readerModeSchedulePopUpCancel_Default_Value.isEmpty()) {
					System.out.println("Element default Value :" + element_GetAttributeValue(
							readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"));
					assertEquals(
							element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton,
									"value"),
							readerModeSchedulePopUpCancel_Default_Value,
							"Reader Mode Schedule Pop Up -> Cencel Button default value Comparison", true, rowNumber,
							sheetName);
				}
				// OK button
				if (!readerModeSchedulePopUpOK_Type.isBlank() && !readerModeSchedulePopUpOK_Type.isEmpty()) {
					System.out.println("Element Attribute :" + element_GetAttributeValue(
							readers_InternalReaders_ReaderModeSchedule_Popup_OkButton, "type"));
					assertEquals(
							element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_OkButton,
									"type"),
							readerModeSchedulePopUpOK_Type, "Reader Mode Schedule Pop Up -> OK Button Type Comparison",
							true, rowNumber, sheetName);
				}
				if (!readerModeSchedulePopUpOK_Default_Value.isBlank()
						&& !readerModeSchedulePopUpOK_Default_Value.isEmpty()) {
					System.out.println("Element default Value :" + element_GetAttributeValue(
							readers_InternalReaders_ReaderModeSchedule_Popup_OkButton, "value"));
					assertEquals(
							element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_OkButton,
									"value"),
							readerModeSchedulePopUpOK_Default_Value,
							"Reader Mode Schedule Pop Up -> Ok Button default value Comparison", true, rowNumber,
							sheetName);
				}
				// Close button
				if (!readerModeSchedulePopUpClose_Type.isBlank() && !readerModeSchedulePopUpClose_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"),
							readerModeSchedulePopUpClose_Type, "Site Pop Up -> Close Button Type Comparison", true,
							rowNumber, sheetName);
				}
				if (!readerModeSchedulePopUp_Default_Table_Row_Value_Select.isBlank()
						&& !readerModeSchedulePopUp_Default_Table_Row_Value_Select.isEmpty()) {
					for (int aa = 0; aa < readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
							.size(); aa++) {
						System.out.println(readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
								.get(aa).getText());
						if (readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.get(aa).getText()
								.equalsIgnoreCase(readerModeSchedulePopUp_Default_Table_Row_Value_Select)) {
							readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.get(aa).click();
							Thread.sleep(250);
							break;
						}
					}

				} else {
					element_Click(basic_Site_Popup_CloseButton);
				}
			}

			// *****Advertise Bluetooth - checkbox****
			String advertisebluetoothLab = excelFileDataRecord.get("AdvertiseBluetooth_label").trim();
			String advertisebluetoothTy = excelFileDataRecord.get("AdvertiseBluetooth_Type").trim();
			String advertisebluetoothVi = excelFileDataRecord.get("AdvertiseBluetooth_Visibility").trim();
			String advertisebluetooth_default = excelFileDataRecord.get("AdvertiseBluetooth_Default_Value").trim();
			String advertisebluetoothV = excelFileDataRecord.get("AdvertiseBluetooth_Value").trim();
			checkbox_Check_UIValidation("Advertise Bluetooth", rowNumber, sheetName,
					readers_InternalReaders_AdvertiseBluetooth_Label, readers_InternalReaders_AdvertiseBluetooth,
					advertisebluetoothLab, advertisebluetoothTy, advertisebluetoothVi, advertisebluetooth_default,
					advertisebluetoothV);

			// *******************Bluetooth Name - Textbox*******************
			String bluetoothNameLab = excelFileDataRecord.get("BluetoothName_Label").trim();
			String bluetoothNameTy = excelFileDataRecord.get("BluetoothName_Type").trim();
			String bluetoothNameVi = excelFileDataRecord.get("BluetoothName_Visibility").trim();
			String bluetoothNameP = excelFileDataRecord.get("BluetoothName_Placeholder").trim();
			String bluetoothNameV = excelFileDataRecord.get("BluetoothName_Value").trim();
			textBox_Control_Check_UIValidation("Bluetooth Name", rowNumber, sheetName,
					readers_InternalReaders_BluetoothName_Label, readers_InternalReaders_BluetoothName,
					bluetoothNameLab, bluetoothNameTy, bluetoothNameVi, bluetoothNameP, "", bluetoothNameV, "");

			// *******************Bluetooth Range - Dropdown*******************
			String internalreaderstabBluetoothRange_label = excelFileDataRecord
					.get("InternalReaderstab_BluetoothRange_label").trim();
			String internalreaderstabBluetoothRange_Type = excelFileDataRecord
					.get("InternalReaderstab_BluetoothRange_Type").trim();
			String internalreaderstabBluetoothRange_Visibility = excelFileDataRecord
					.get("InternalReaderstab_BluetoothRange_Visibility").trim();
			String internalreaderstabBluetoothRange_Default_Value = excelFileDataRecord
					.get("InternalReaderstab_BluetoothRange_Default_Value").trim();
			String internalreaderstabBluetoothRange_Values = excelFileDataRecord
					.get("InternalReaderstab_BluetoothRange_Values").trim();
			String internalreaderstabBluetoothRange_Select_Values = excelFileDataRecord
					.get("InternalReaderstab_BluetoothRange_Select_Values").trim();
			dropDown_Check_UIValidation("Bluetooth Range", rowNumber, sheetName,
					readers_InternalReaders_BluetoothRange_Label, readers_InternalReaders_BluetoothRange,
					readers_InternalReaders_BluetoothRange_Size, internalreaderstabBluetoothRange_label,
					internalreaderstabBluetoothRange_Type, internalreaderstabBluetoothRange_Visibility,
					internalreaderstabBluetoothRange_Default_Value, internalreaderstabBluetoothRange_Select_Values,
					internalreaderstabBluetoothRange_Values, "");

			// *******************Custom Bluetooth Range (dBm) - Textbox*******************
			String custombluetoothNameTy = excelFileDataRecord.get("CustomBluetoothName_Type").trim();
			String custombluetoothNameVi = excelFileDataRecord.get("CustomBluetoothName_Visibility").trim();
			String custombluetoothNameP = excelFileDataRecord.get("CustomBluetoothName_Placeholder").trim();
			String custombluetoothNameV = excelFileDataRecord.get("CustomBluetoothName_Value").trim();
			textBox_Control_Check_UIValidation("Custom Bluetooth Range (dBm)", rowNumber, sheetName,
					readers_InternalReaders_CustomBluetoothRange_Label, readers_InternalReaders_CustomBluetoothRange,
					"", custombluetoothNameTy, custombluetoothNameVi, custombluetoothNameP, "", custombluetoothNameV,
					"");

			// *******************Custom Bluetooth Range (dBm) Info Icon - Info
			// Icon*******************
			String infoIconVisibility = excelFileDataRecord.get("CustomBluetooth_InfoIcon_Visibility").trim();
			String infoIconTooltip = excelFileDataRecord.get("CustomBluetooth_InfoIcon_Tooltip").trim();

			infoIcon_UIValidation("Custom Bluetooth Range (dBm)", rowNumber, sheetName,
					readers_InternalReaders_CustomBluetoothRange_InfoIcon, infoIconVisibility, infoIconTooltip);

			// *******************External Readers Tab Control*******************
			String externalreadersTabLab = excelFileDataRecord.get("ExternalReaderstab_label").trim();
			String externalreadersTabTabOpen = excelFileDataRecord.get("External Readerstab_Default").trim();
			String externalreadersTabValue = excelFileDataRecord.get("ExternalReaderstab_Value").trim();
			tab_Control_Check_UIValidation("External Readers", rowNumber, sheetName, readers_ExternalReaders_Tab,
					readers_ExternalReaders_Tab_OpenOrClose, externalreadersTabLab, externalreadersTabTabOpen,
					externalreadersTabValue);

			// *******************External Readers Tab > Mode Control*******************
			String externalreaderstabMode_label = excelFileDataRecord.get("ExternalReaderstab_Mode_label").trim();
			String externalreaderstabMode_Type = excelFileDataRecord.get("ExternalReaderstab_Mode_Type").trim();
			String externalreaderstabMode_Visibility = excelFileDataRecord.get("ExternalReaderstab_Mode_Visibility")
					.trim();
			String externalreaderstabMode_Default_Value = excelFileDataRecord
					.get("ExternalReaderstab_Mode_Default_Value").trim();
			String externalreaderstabMode_Values = excelFileDataRecord.get("ExternalReaderstab_Mode_Values").trim();
			String externalreaderstabMode_Select_Values = excelFileDataRecord
					.get("ExternalReaderstab_Mode_Select_Values").trim();
			String externalreaderstabMode_visibleOrNot = excelFileDataRecord.get("ExternalReaderstab_Mode_visibleOrNot")
					.trim();
			dropDown_Check_UIValidation("Mode", rowNumber, sheetName, readers_ExternalReaders_Mode_Label,
					readers_ExternalReaders_Mode, readers_ExternalReaders_Mode_Size, externalreaderstabMode_label,
					externalreaderstabMode_Type, externalreaderstabMode_Visibility,
					externalreaderstabMode_Default_Value, externalreaderstabMode_Select_Values,
					externalreaderstabMode_Values, externalreaderstabMode_visibleOrNot);

			// *******************External Readers Tab > External Reader Type
			// Control*******************
			String externalreaderstabexternalreadertype_label = excelFileDataRecord
					.get("ExternalReaderstab_ExternalReaderType_label").trim();
			String externalreaderstabexternalreadertype_Type = excelFileDataRecord
					.get("ExternalReaderstab_ExternalReaderType_Type").trim();
			String externalreaderstabexternalreadertype_Visibility = excelFileDataRecord
					.get("ExternalReaderstab_ExternalReaderType_Visibility").trim();
			String externalreaderstabexternalreadertype_Default_Value = excelFileDataRecord
					.get("ExternalReaderstab_ExternalReaderType_Default_Value").trim();
			String externalreaderstabexternalreadertype_Values = excelFileDataRecord
					.get("ExternalReaderstab_ExternalReaderType_Values").trim();
			String externalreaderstabexternalreadertype_Select_Values = excelFileDataRecord
					.get("ExternalReaderstab_ExternalReaderType_Select_Values").trim();
			String externalreaderstabexternalreadertype_visibleOrNot = excelFileDataRecord
					.get("ExternalReaderstab_ExternalReaderType_visibleOrNot").trim();
			dropDown_Check_UIValidation("External Reader Type", rowNumber, sheetName,
					readers_ExternalReaders_ExternalReaderType_Label, readers_ExternalReaders_ExternalReaderType,
					readers_ExternalReaders_ExternalReaderType_Size, externalreaderstabexternalreadertype_label,
					externalreaderstabexternalreadertype_Type, externalreaderstabexternalreadertype_Visibility,
					externalreaderstabexternalreadertype_Default_Value,
					externalreaderstabexternalreadertype_Select_Values, externalreaderstabexternalreadertype_Values,
					externalreaderstabexternalreadertype_visibleOrNot);

			String externalReaders_SearchBox_lbl = excelFileDataRecord.get("ExternalReaders_SearchBox_label").trim();
			String externalReaders_SearchBox_t = excelFileDataRecord.get("ExternalReaders_SearchBox_type").trim();
			String externalReaders_SearchBox_v = excelFileDataRecord.get("ExternalReaders_SearchBox_visibility").trim();
			String externalReaders_SearchBox_p = excelFileDataRecord.get("ExternalReaders_SearchBox_placeholder")
					.trim();
			String externalReaders_SearchBox_d = excelFileDataRecord.get("ExternalReaders_SearchBox_default").trim();
			String externalReaders_SearchBox_val = excelFileDataRecord.get("ExternalReaders_SearchBox_value").trim();

			if (!excelFileDataRecord.get("ExternalReaders_SearchBox_label").isBlank()
					|| !excelFileDataRecord.get("ExternalReaders_SearchBox_type").isBlank()
					|| !excelFileDataRecord.get("ExternalReaders_SearchBox_visibility").isBlank()
					|| !excelFileDataRecord.get("ExternalReaders_SearchBox_placeholder").isBlank()
					|| !excelFileDataRecord.get("ExternalReaders_SearchBox_default").isBlank()
					|| !excelFileDataRecord.get("ExternalReaders_SearchBox_value").isBlank()
					|| !excelFileDataRecord.get("ExternalReaders_AddButton_label").isBlank()
					|| !excelFileDataRecord.get("ExternalReaders_AddButton_type").isBlank()
					|| !excelFileDataRecord.get("ExternalReaders_AddButton_visibility").isBlank()
					|| !excelFileDataRecord.get("ExternalReaders_Table_Header_Values").isBlank()
					|| !excelFileDataRecord.get("ExternalReaders_Table_Row_Values").isBlank()
					|| !excelFileDataRecord.get("ExternalReaders_Table_NoData_Value").isBlank()) {

				System.out.println("I am in External Readers Section");

				if (!externalReaders_SearchBox_lbl.isBlank() && !externalReaders_SearchBox_lbl.isEmpty()) {
					System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
					assertEquals(searchBoxLabelElement.getText(), externalReaders_SearchBox_lbl,
							"External Readers Label Comparision", true, rowNumber, sheetName);
				}
				// Start Search Box
				if (!externalReaders_SearchBox_p.isBlank() && !externalReaders_SearchBox_p.isEmpty()) {
					System.out.println("Element PlaceHolder :"
							+ element_GetAttributeValue(externalReaders_searchBoxElement, "placeholder"));
					assertEquals(element_GetAttributeValue(externalReaders_searchBoxElement, "placeholder"),
							externalReaders_SearchBox_p, "Site Pop Up -> SearchBox PlaceHolder Comparison", true,
							rowNumber, sheetName);
				}
				if (!externalReaders_SearchBox_t.isBlank() && !externalReaders_SearchBox_t.isEmpty()) {
					System.out.println("Element Attribute :"
							+ element_GetAttributeValue(externalReaders_searchBoxElement, "type"));
					assertEquals(element_GetAttributeValue(externalReaders_searchBoxElement, "type"),
							externalReaders_SearchBox_t, "Site Pop Up -> SearchBox Type Comparison", true, rowNumber,
							sheetName);
				}
				if (!externalReaders_SearchBox_val.isBlank() && !externalReaders_SearchBox_val.isEmpty()) {
					element_InputText(externalReaders_searchBoxElement, externalReaders_SearchBox_val);
//						Thread.sleep(250);
//						element_Click(externalReaders_SearchBtn);
				}

				// Add Button Validation
				button_Check_UIValidation("Add Button", rowNumber, sheetName, internalReaders_AddButton_Label,
						internalReaders_AddButton, excelFileDataRecord.get("InternalReaders_AddButton_label").trim(),
						excelFileDataRecord.get("InternalReaders_AddButton_type").trim(),
						excelFileDataRecord.get("InternalReaders_AddButton_visibility").trim());

				// Table Header Validation
				tableHeader_Control_Check_UIValidation("Internal Readers Table", rowNumber, sheetName,
						internalReaders_TableHeader,
						excelFileDataRecord.get("InternalReaders_Table_Header_Values").trim());

				// Table Row Validation
				tableRow_Control_Check_UIValidation("Internal Readers Table", rowNumber, sheetName,
						internalReaders_TableRowData, "td[not(@hidden)]//label", internalReaders_NoDataFound,
						excelFileDataRecord.get("InternalReaders_Table_Row_Values").trim(),
						excelFileDataRecord.get("InternalReaders_Table_NoData_Value").trim());
			}

			// *****Exit Switch - checkbox****
			String externalreaderstabexitswitch_label = excelFileDataRecord.get("ExternalReaderstab_ExitSwitch_label")
					.trim();
			String externalreaderstabexitswitchTy = excelFileDataRecord.get("ExternalReaderstab_ExitSwitch_Type")
					.trim();
			String externalreaderstabexitswitchVi = excelFileDataRecord.get("ExternalReaderstab_ExitSwitch_Visibility")
					.trim();
			String externalreaderstabexitswitch_default = excelFileDataRecord
					.get("ExternalReaderstab_ExitSwitch_Default_Value").trim();
			String externalreaderstabexitswitchV = excelFileDataRecord.get("ExternalReaderstab_ExitSwitch_Value")
					.trim();
			checkbox_Check_UIValidation("Exit Switch", rowNumber, sheetName, readers_ExternalReaders_ExitSwitch_Label,
					readers_ExternalReaders_ExitSwitch, externalreaderstabexitswitch_label,
					externalreaderstabexitswitchTy, externalreaderstabexitswitchVi,
					externalreaderstabexitswitch_default, externalreaderstabexitswitchV);

			// *******************External Readers Tab > User Access Mode
			// Control*******************
			String externalreaderstabuserAccessMode_label = excelFileDataRecord
					.get("ExternalReaderstab_UserAccessMode_label").trim();
			String externalreaderstabuserAccessMode_Type = excelFileDataRecord
					.get("ExternalReaderstab_UserAccessMode_Type").trim();
			String externalreaderstabuserAccessMode_Visibility = excelFileDataRecord
					.get("ExternalReaderstab_UserAccessMode_Visibility").trim();
			String externalreaderstabuserAccessMode_Default_Value = excelFileDataRecord
					.get("ExternalReaderstab_UserAccessMode_Default_Value").trim();
			String externalreaderstabuserAccessMode_Values = excelFileDataRecord
					.get("ExternalReaderstab_UserAccessMode_Values").trim();
			String externalreaderstabuserAccessMode_Select_Values = excelFileDataRecord
					.get("ExternalReaderstab_UserAccessMode_Select_Values").trim();
			dropDown_Check_UIValidation("User Access Mode", rowNumber, sheetName,
					readers_ExternalReaders_UserAccessMode_Label, readers_ExternalReaders_UserAccessMode,
					readers_ExternalReaders_UserAccessMode_Size, externalreaderstabuserAccessMode_label,
					externalreaderstabuserAccessMode_Type, externalreaderstabuserAccessMode_Visibility,
					externalreaderstabuserAccessMode_Default_Value, externalreaderstabuserAccessMode_Select_Values,
					externalreaderstabuserAccessMode_Values, "");

			// *******************External Readers Tab > Visitor Access Mode
			// Control*******************
			String externalreaderstabvisitorAccessMode_label = excelFileDataRecord
					.get("ExternalReaderstab_VisitorAccessMode_label").trim();
			String externalreaderstabvisitorAccessMode_Type = excelFileDataRecord
					.get("ExternalReaderstab_VisitorAccessMode_Type").trim();
			String externalreaderstabvisitorAccessMode_Visibility = excelFileDataRecord
					.get("ExternalReaderstab_VisitorAccessMode_Visibility").trim();
			String externalreaderstabvisitorAccessMode_Default_Value = excelFileDataRecord
					.get("ExternalReaderstab_VisitorAccessMode_Default_Value").trim();
			String externalreaderstabvisitorAccessMode_Values = excelFileDataRecord
					.get("ExternalReaderstab_VisitorAccessMode_Values").trim();
			String externalreaderstabvisitorAccessMode_Select_Values = excelFileDataRecord
					.get("ExternalReaderstab_VisitorAccessMode_Select_Values").trim();
			dropDown_Check_UIValidation("Visitor Access Mode", rowNumber, sheetName,
					readers_ExternalReaders_VisitorAccessMode_Label, readers_ExternalReaders_VisitorAccessMode,
					readers_ExternalReaders_VisitorAccessMode_Size, externalreaderstabvisitorAccessMode_label,
					externalreaderstabvisitorAccessMode_Type, externalreaderstabvisitorAccessMode_Visibility,
					externalreaderstabvisitorAccessMode_Default_Value,
					externalreaderstabvisitorAccessMode_Select_Values, externalreaderstabvisitorAccessMode_Values, "");

			// *****Access Control On Exit Mode - checkbox****
			String accesscontrolonexitmodeLab = excelFileDataRecord.get("AccessControlOnExitMode_label").trim();
			String accesscontrolonexitmodeTy = excelFileDataRecord.get("AccessControlOnExitMode_Type").trim();
			String accesscontrolonexitmodeVi = excelFileDataRecord.get("AccessControlOnExitMode_Visibility").trim();
			String accesscontrolonexitmode_default = excelFileDataRecord.get("AccessControlOnExitMode_Default_Value")
					.trim();
			String accesscontrolonexitmodeV = excelFileDataRecord.get("AccessControlOnExitMode_Value").trim();
			checkbox_Check_UIValidation("Access Control On Exit Mode", rowNumber, sheetName,
					readers_AccessControlOnExitMode_Label, readers_AccessControlOnExitMode, accesscontrolonexitmodeLab,
					accesscontrolonexitmodeTy, accesscontrolonexitmodeVi, accesscontrolonexitmode_default,
					accesscontrolonexitmodeV);

			// aagam code end

			// Save button then checked main validation
			saveButtonClick();
			valMsg = validationMessage();
			String excelVal = excelFileDataRecord.get("Validation").trim();
			if (!excelVal.isBlank() && !excelVal.isEmpty()) {
				assertEquals(valMsg, excelFileDataRecord.get("Validation").trim(),
						"Main Validation on Save button Comparison", true, rowNumber, sheetName);
			}
			Thread.sleep(1500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			reloadPageButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));

		}
	}

//	Profile_General Tab Locators
	// ********************************************General
	// Tab********************************************
	// Xpath***********************************************
	@FindBy(xpath = "//label[text()=\"General\"]")
	private WebElement profile_GeneralTabControl;

	@FindBy(xpath = "//label[text()=\"General\"]/ancestor::li[1]")
	private WebElement profile_GeneralTabControlActiveOrNot;

	@FindBy(id = "chkMuteBuzzer")
	private WebElement profile_General_MuteDeviceAudio;

	@FindBy(xpath = "//*[@id='chkMuteBuzzer']/ancestor::div[@class='form-group']//label")
	private WebElement profile_General_MuteDeviceAudio_Label;

	@FindBy(xpath = "//*[text()=\"Allowed Acknowledgement\"]")
	private WebElement profile_General_AllowedAcknowledgement_Label;

	@FindBy(id = "txtAlwdDisplayDur")
	private WebElement profile_General_DisplayDuration;

	@FindBy(xpath = "//*[@id='txtAlwdDisplayDur']/ancestor::div[@class='form-group']//label")
	private WebElement profile_General_DisplayDuration_Label;

	@FindBy(id = "cboBuzzerDuration")
	private WebElement profile_General_LEDBuzzerDuration;

	@FindBy(id = "cboBuzzerDuration")
	private List<WebElement> profile_General_LEDBuzzerDuration_Size;

	@FindBy(xpath = "//*[@id='cboBuzzerDuration']/ancestor::div[@class='form-group']/div/mx-label/label")
	private WebElement profile_General_LEDBuzzerDuration_Label;

	@FindBy(xpath = "//*[@id='cboBuzzerDuration']/ancestor::div[@class='form-group']/div[3]/label")
	private WebElement profile_General_LEDBuzzerDuration_info;

	@FindBy(xpath = "//*[text()=\"Denied Acknowledgement\"]")
	private WebElement profile_General_DeniedAcknowledgement_Label;

	@FindBy(id = "txtDeniedDisplayDur")
	private WebElement profile_General_Denied_DisplayDuration;

	@FindBy(xpath = "//*[@id='txtDeniedDisplayDur']/ancestor::div[@class='form-group']//label")
	private WebElement profile_General_Denied_DisplayDuration_Label;

	@FindBy(id = "BuzzerDurDenied")
	private WebElement profile_General_Denied_LEDBuzzerDuration;

	@FindBy(id = "BuzzerDurDenied")
	private List<WebElement> profile_General_Denied_LEDBuzzerDuration_Size;

	@FindBy(xpath = "//*[@id='BuzzerDurDenied']/ancestor::div[@class='form-group']/div/mx-label/label")
	private WebElement profile_General_DeniedLEDBuzzerDuration_Label;

	@FindBy(xpath = "//*[@id='BuzzerDurDenied']/ancestor::div[@class='form-group']/div[3]/label")
	private WebElement profile_General_Denied_LEDBuzzerDuration_info;

	@FindBy(id = "chkDisplayGreeting")
	private WebElement profile_General_EnableDisplayMessages;

	@FindBy(xpath = "//*[@id='chkDisplayGreeting']/ancestor::div[@class='form-group']//label")
	private WebElement profile_General_General_EnableDisplayMessages_Label;

	@FindBy(id = "txtBirthdayMessage")
	private WebElement profile_General_CustomBirthdayMessage;

	@FindBy(xpath = "//*[@id='txtBirthdayMessage']/ancestor::div[@class='form-group']//label")
	private WebElement profile_General_CustomBirthdayMessage_Label;

//		######################Display Message 1
	@FindBy(id = "chkGreeting1")
	private WebElement profile_General_DisplayMessage1;

	@FindBy(xpath = "//*[@id='chkGreeting1']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_profile_General_DisplayMessage1_Label;

	@FindBy(id = "txtFromGreeting1")
	private WebElement profile_General_Schedule1_From;

	@FindBy(xpath = "//*[@id='txtFromGreeting1']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_profile_General_Schedule1_Label;

	@FindBy(id = "txtToGreeting1")
	private WebElement profile_General_Schedule1_To;

	@FindBy(id = "txtMsgGreeting1")
	private WebElement profile_General_Message1;

	@FindBy(xpath = "//*[@id='txtMsgGreeting1']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_Message1_Label;

//		######################Display Message 2
	@FindBy(id = "chkGreeting2")
	private WebElement profile_General_DisplayMessage2;

	@FindBy(xpath = "//*[@id='chkGreeting2']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_profile_General_DisplayMessage2_Label;

	@FindBy(id = "txtFromGreeting2")
	private WebElement profile_General_Schedule2_From;

	@FindBy(xpath = "//*[@id='txtFromGreeting2']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_profile_General_Schedule2_Label;

	@FindBy(id = "txtToGreeting2")
	private WebElement profile_General_Schedule2_To;

	@FindBy(id = "txtMsgGreeting2")
	private WebElement profile_General_Message2;

	@FindBy(xpath = "//*[@id='txtMsgGreeting2']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_Message2_Label;

//		######################Display Message 3
	@FindBy(id = "chkGreeting3")
	private WebElement profile_General_DisplayMessage3;

	@FindBy(xpath = "//*[@id='chkGreeting3']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_profile_General_DisplayMessage3_Label;

	@FindBy(id = "txtFromGreeting3")
	private WebElement profile_General_Schedule3_From;

	@FindBy(xpath = "//*[@id='txtFromGreeting3']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_profile_General_Schedule3_Label;

	@FindBy(id = "txtToGreeting3")
	private WebElement profile_General_Schedule3_To;

	@FindBy(id = "txtMsgGreeting3")
	private WebElement profile_General_Message3;

	@FindBy(xpath = "//*[@id='txtMsgGreeting3']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_Message3_Label;

//		######################Display Message 4
	@FindBy(id = "chkGreeting4")
	private WebElement profile_General_DisplayMessage4;

	@FindBy(xpath = "//*[@id='chkGreeting4']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_profile_General_DisplayMessage4_Label;

	@FindBy(id = "txtFromGreeting4")
	private WebElement profile_General_Schedule4_From;

	@FindBy(xpath = "//*[@id='txtFromGreeting4']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_profile_General_Schedule4_Label;

	@FindBy(id = "txtToGreeting4")
	private WebElement profile_General_Schedule4_To;

	@FindBy(id = "txtMsgGreeting4")
	private WebElement profile_General_Message4;

	@FindBy(xpath = "//*[@id='txtMsgGreeting4']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_Message4_Label;

	@FindBy(xpath = "//*[@id='chkMultiLngSp']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_General_MultiLanguageSupport_Label;

	@FindBy(id = "chkMultiLngSp")
	private WebElement profile_General_MultiLanguageSupport;

//	Profile_General Tab	
	public void deviceUIControlValidation_General(List<Map<String, String>> data, String sheetName) throws Exception {
		for (int i = 0; i < data.size(); i++) {
			eachRowStatus = false;
			String valMsg = null;
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			Map<String, String> excelFileDataRecord = data.get(i);
			logger.info("***********************************Excel Data Record Picked : Row Number = " + i + " Data is ="
					+ excelFileDataRecord);
			int rowNumber = Integer.parseInt(excelFileDataRecord.get("RowNumber"));
			addButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			waitForElementVisible_TimeinMinutes(selectDeviceTypeBeAddedpopUp, 2);
			for (int j = 0; j < selectDeviceTypeToBeAdded.size(); j++) {
				String title = selectDeviceTypeToBeAdded.get(j).getAttribute("title");
				if (title.equalsIgnoreCase(excelFileDataRecord.get("DeviceType"))) {
					selectDeviceTypeToBeAdded.get(j).click();
					Thread.sleep(500);
					waitForElementClickable(deviceContinue);
					element_Click(deviceContinue);
					Thread.sleep(500);
					break;
				}
			}
			Thread.sleep(500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementClickable(active, 1);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			// *******************Start Device Name Textbox And Control*******************

			String deviceNameV = excelFileDataRecord.get("DeviceName_Value").trim();
			textBox_Control_Check_UIValidation("Device Name", rowNumber, sheetName, deviceidNameLabel, deviceNameTxt,
					"", "", "", "", "", deviceNameV, "");

			// *******************Start Mac Address Textbox And Control*******************
			String macAddressV = excelFileDataRecord.get("MacAddress_Value").trim();
			if (!macAddressV.isBlank() && !macAddressV.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				String[] macs = macAddressV.split(":");
				for (int x = 0; x < macAddressTxt.size(); x++) {
					macAddressTxt.get(x).sendKeys(macs[x]);
				}
			}
			// **********************Start General Tab***********************************
			String general_label = excelFileDataRecord.get("General_label").trim();
			String general_Default = excelFileDataRecord.get("General_Default").trim();
			String general_Select = excelFileDataRecord.get("General_Select").trim();
			if (!general_label.isBlank() && !general_label.isEmpty()) {
				assertEquals(profile_GeneralTabControl.getText(), general_label,
						"General Tab Control Label Comparision", true, rowNumber, sheetName);
			}
			if (!general_Select.isBlank() && !general_Select.isEmpty()) {
				element_Click(profile_GeneralTabControl);
				Thread.sleep(250);
			}
			if (!general_Default.isBlank() && !general_Default.isEmpty()) {
				String deviceGetID = profile_GeneralTabControlActiveOrNot.getAttribute("class");
				String value = null;
				if (deviceGetID.toLowerCase().contains("tab-active")) {
					value = "tab-active";
				} else {
					value = "tab-non-active";
				}
				assertEquals(value, general_Default, "General Tab Control Label Comparision", true, rowNumber,
						sheetName);
			}
			// Start Code

			// *****Mute Device Audio - checkbox****
			String general_MuteDeviceAudioLab = excelFileDataRecord.get("General_MuteDeviceAudio_label").trim();
			String general_MuteDeviceAudioTy = excelFileDataRecord.get("General_MuteDeviceAudio_Type").trim();
			String general_MuteDeviceAudioVi = excelFileDataRecord.get("General_MuteDeviceAudio_Visibility").trim();
			String general_MuteDeviceAudio_default = excelFileDataRecord.get("General_MuteDeviceAudio_Default_Value")
					.trim();
			String general_MuteDeviceAudioV = excelFileDataRecord.get("General_MuteDeviceAudio_Value").trim();
			checkbox_Check_UIValidation("Mute Device Audio", rowNumber, sheetName,
					profile_General_MuteDeviceAudio_Label, profile_General_MuteDeviceAudio, general_MuteDeviceAudioLab,
					general_MuteDeviceAudioTy, general_MuteDeviceAudioVi, general_MuteDeviceAudio_default,
					general_MuteDeviceAudioV);

			// Allowed Acknowledgement -> Display Duration (ms) - textbox
			String general_AllowedAcknowledgement_DisplayDurationLab = excelFileDataRecord
					.get("General_AllowedAcknowledgement_DisplayDuration_Label").trim();
			String general_AllowedAcknowledgement_DisplayDurationTy = excelFileDataRecord
					.get("General_AllowedAcknowledgement_DisplayDuration_Type").trim();
			String general_AllowedAcknowledgement_DisplayDurationVi = excelFileDataRecord
					.get("General_AllowedAcknowledgement_DisplayDuration_Visibility").trim();
			String general_AllowedAcknowledgement_DisplayDurationP = excelFileDataRecord
					.get("General_AllowedAcknowledgement_DisplayDuration_Placeholder").trim();
			String general_AllowedAcknowledgement_DisplayDuration_default = excelFileDataRecord
					.get("General_AllowedAcknowledgement_DisplayDuration_Default_Value").trim();
			String general_AllowedAcknowledgement_DisplayDurationV = excelFileDataRecord
					.get("General_AllowedAcknowledgement_DisplayDuration_Value").trim();
			String general_AllowedAcknowledgement_DisplayDurationNegativeVal = excelFileDataRecord
					.get("General_AllowedAcknowledgement_DisplayDuration_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Display Duration (ms)", rowNumber, sheetName,
					profile_General_DisplayDuration_Label, profile_General_DisplayDuration,
					general_AllowedAcknowledgement_DisplayDurationLab, general_AllowedAcknowledgement_DisplayDurationTy,
					general_AllowedAcknowledgement_DisplayDurationVi, general_AllowedAcknowledgement_DisplayDurationP,
					general_AllowedAcknowledgement_DisplayDuration_default,
					general_AllowedAcknowledgement_DisplayDurationV,
					general_AllowedAcknowledgement_DisplayDurationNegativeVal);

			// *******************Allowed Acknowledgement -> LED - Buzzer
			// Duration*******************
			String general_AllowedAcknowledgement_LEDBuzzerDuration_label = excelFileDataRecord
					.get("General_AllowedAcknowledgement_LEDBuzzerDuration_label").trim();
			String general_AllowedAcknowledgement_LEDBuzzerDuration_Type = excelFileDataRecord
					.get("General_AllowedAcknowledgement_LEDBuzzerDuration_Type").trim();
			String general_AllowedAcknowledgement_LEDBuzzerDuration_Visibility = excelFileDataRecord
					.get("General_AllowedAcknowledgement_LEDBuzzerDuration_Visibility").trim();
			String general_AllowedAcknowledgement_LEDBuzzerDuration_Default_Value = excelFileDataRecord
					.get("General_AllowedAcknowledgement_LEDBuzzerDuration_Default_Value").trim();
			String general_AllowedAcknowledgement_LEDBuzzerDuration_Values = excelFileDataRecord
					.get("General_AllowedAcknowledgement_LEDBuzzerDuration_Values").trim();
			String general_AllowedAcknowledgement_LEDBuzzerDuration_Select_Values = excelFileDataRecord
					.get("General_AllowedAcknowledgement_LEDBuzzerDuration_Select_Values").trim();
			String general_AllowedAcknowledgement_LEDBuzzerDuration_visibleOrNot = excelFileDataRecord
					.get("General_AllowedAcknowledgement_LEDBuzzerDuration_visibleOrNot").trim();
			dropDown_Check_UIValidation("LED - Buzzer Duration", rowNumber, sheetName,
					profile_General_LEDBuzzerDuration_Label, profile_General_LEDBuzzerDuration,
					profile_General_LEDBuzzerDuration_Size, general_AllowedAcknowledgement_LEDBuzzerDuration_label,
					general_AllowedAcknowledgement_LEDBuzzerDuration_Type,
					general_AllowedAcknowledgement_LEDBuzzerDuration_Visibility,
					general_AllowedAcknowledgement_LEDBuzzerDuration_Default_Value,
					general_AllowedAcknowledgement_LEDBuzzerDuration_Select_Values,
					general_AllowedAcknowledgement_LEDBuzzerDuration_Values,
					general_AllowedAcknowledgement_LEDBuzzerDuration_visibleOrNot);

			// *******************LED - Buzzer Duration Info Icon - Info
			// Icon*******************
			String infoIconVisibility = excelFileDataRecord
					.get("General_AllowedAcknowledgement_LEDBuzzerDuration_InfoIcon_Visibility").trim();
			String infoIconTooltip = excelFileDataRecord
					.get("General_AllowedAcknowledgement_LEDBuzzerDuration_InfoIcon_Tooltip").trim();

			infoIcon_UIValidation("LED - Buzzer Duration", rowNumber, sheetName, profile_General_LEDBuzzerDuration_info,
					infoIconVisibility, infoIconTooltip);

			// Denied Acknowledgement -> Display Duration (ms) - textbox
			String general_DeniedAcknowledgement_DisplayDurationLab = excelFileDataRecord
					.get("General_DeniedAcknowledgement_DisplayDuration_Label").trim();
			String general_DeniedAcknowledgement_DisplayDurationTy = excelFileDataRecord
					.get("General_DeniedAcknowledgement_DisplayDuration_Type").trim();
			String general_DeniedAcknowledgement_DisplayDurationVi = excelFileDataRecord
					.get("General_DeniedAcknowledgement_DisplayDuration_Visibility").trim();
			String general_DeniedAcknowledgement_DisplayDurationP = excelFileDataRecord
					.get("General_DeniedAcknowledgement_DisplayDuration_Placeholder").trim();
			String general_DenieddAcknowledgement_DisplayDuration_default = excelFileDataRecord
					.get("General_DeniedAcknowledgement_DisplayDuration_Default_Value").trim();
			String general_DeniedAcknowledgement_DisplayDurationV = excelFileDataRecord
					.get("General_DeniedAcknowledgement_DisplayDuration_Value").trim();
			String general_DeniedAcknowledgement_DisplayDurationNegativeVal = excelFileDataRecord
					.get("General_DeniedAcknowledgement_DisplayDuration_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Display Duration (ms)", rowNumber, sheetName,
					profile_General_Denied_DisplayDuration_Label, profile_General_Denied_DisplayDuration,
					general_DeniedAcknowledgement_DisplayDurationLab, general_DeniedAcknowledgement_DisplayDurationTy,
					general_DeniedAcknowledgement_DisplayDurationVi, general_DeniedAcknowledgement_DisplayDurationP,
					general_DenieddAcknowledgement_DisplayDuration_default,
					general_DeniedAcknowledgement_DisplayDurationV,
					general_DeniedAcknowledgement_DisplayDurationNegativeVal);

			// *******************Denied Acknowledgement -> LED - Buzzer
			// Duration*******************
			String general_DeniedAcknowledgement_LEDBuzzerDuration_label = excelFileDataRecord
					.get("General_DeniedAcknowledgement_LEDBuzzerDuration_label").trim();
			String general_DeniedAcknowledgement_LEDBuzzerDuration_Type = excelFileDataRecord
					.get("General_DeniedAcknowledgement_LEDBuzzerDuration_Type").trim();
			String general_DeniedAcknowledgement_LEDBuzzerDuration_Visibility = excelFileDataRecord
					.get("General_DeniedAcknowledgement_LEDBuzzerDuration_Visibility").trim();
			String general_DeniedAcknowledgement_LEDBuzzerDuration_Default_Value = excelFileDataRecord
					.get("General_DeniedAcknowledgement_LEDBuzzerDuration_Default_Value").trim();
			String general_DeniedAcknowledgement_LEDBuzzerDuration_Values = excelFileDataRecord
					.get("General_DeniedAcknowledgement_LEDBuzzerDuration_Values").trim();
			String general_DeniedAcknowledgement_LEDBuzzerDuration_Select_Values = excelFileDataRecord
					.get("General_DeniedAcknowledgement_LEDBuzzerDuration_Select_Values").trim();
			String general_DeniedAcknowledgement_LEDBuzzerDuration_visibleOrNot = excelFileDataRecord
					.get("General_DeniedAcknowledgement_LEDBuzzerDuration_visibleOrNot").trim();
			dropDown_Check_UIValidation("LED - Buzzer Duration", rowNumber, sheetName,
					profile_General_DeniedLEDBuzzerDuration_Label, profile_General_Denied_LEDBuzzerDuration,
					profile_General_Denied_LEDBuzzerDuration_Size,
					general_DeniedAcknowledgement_LEDBuzzerDuration_label,
					general_DeniedAcknowledgement_LEDBuzzerDuration_Type,
					general_DeniedAcknowledgement_LEDBuzzerDuration_Visibility,
					general_DeniedAcknowledgement_LEDBuzzerDuration_Default_Value,
					general_DeniedAcknowledgement_LEDBuzzerDuration_Select_Values,
					general_DeniedAcknowledgement_LEDBuzzerDuration_Values,
					general_DeniedAcknowledgement_LEDBuzzerDuration_visibleOrNot);

			// *******************LED - Buzzer Duration Info Icon - Info
			// Icon*******************
			String infoIconVisibility_1 = excelFileDataRecord
					.get("General_DeniedAcknowledgement_LEDBuzzerDuration_InfoIcon_Visibility").trim();
			String infoIconTooltip_1 = excelFileDataRecord
					.get("General_DeniedAcknowledgement_LEDBuzzerDuration_InfoIcon_Tooltip").trim();

			infoIcon_UIValidation("LED - Buzzer Duration", rowNumber, sheetName, profile_General_LEDBuzzerDuration_info,
					infoIconVisibility_1, infoIconTooltip_1);

			// *****Enable Display Messages - checkbox****
			String general_EnableDisplayMessagesLab = excelFileDataRecord.get("General_EnableDisplayMessages_label")
					.trim();
			String general_EnableDisplayMessagesTy = excelFileDataRecord.get("General_EnableDisplayMessages_Type")
					.trim();
			String general_EnableDisplayMessagesVi = excelFileDataRecord.get("General_EnableDisplayMessages_Visibility")
					.trim();
			String general_EnableDisplayMessages_default = excelFileDataRecord
					.get("General_EnableDisplayMessages_Default_Value").trim();
			String general_EnableDisplayMessagesV = excelFileDataRecord.get("General_EnableDisplayMessages_Value")
					.trim();
			checkbox_Check_UIValidation("Enable Display Messages", rowNumber, sheetName,
					profile_General_General_EnableDisplayMessages_Label, profile_General_EnableDisplayMessages,
					general_EnableDisplayMessagesLab, general_EnableDisplayMessagesTy, general_EnableDisplayMessagesVi,
					general_EnableDisplayMessages_default, general_EnableDisplayMessagesV);

			// Custom Birthday Message - textbox
			String general_CustomBirthdayMessageLab = excelFileDataRecord.get("General_CustomBirthdayMessage_Label")
					.trim();
			String general_CustomBirthdayMessageTy = excelFileDataRecord.get("General_CustomBirthdayMessage_Type")
					.trim();
			String general_CustomBirthdayMessageVi = excelFileDataRecord.get("General_CustomBirthdayMessage_Visibility")
					.trim();
			String general_CustomBirthdayMessageP = excelFileDataRecord.get("General_CustomBirthdayMessage_Placeholder")
					.trim();
			String general_CustomBirthdayMessage_default = excelFileDataRecord
					.get("General_CustomBirthdayMessage_Default_Value").trim();
			String general_CustomBirthdayMessageV = excelFileDataRecord.get("General_CustomBirthdayMessage_Value")
					.trim();
			String general_CustomBirthdayMessageNegativeVal = excelFileDataRecord
					.get("General_CustomBirthdayMessage_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Custom Birthday Message", rowNumber, sheetName,
					profile_General_CustomBirthdayMessage_Label, profile_General_CustomBirthdayMessage,
					general_CustomBirthdayMessageLab, general_CustomBirthdayMessageTy, general_CustomBirthdayMessageVi,
					general_CustomBirthdayMessageP, general_CustomBirthdayMessage_default,
					general_CustomBirthdayMessageV, general_CustomBirthdayMessageNegativeVal);

			// *****Display Message 1 - checkbox****
			String general_DisplayMessage1Lab = excelFileDataRecord.get("General_DisplayMessage1_label").trim();
			String general_DisplayMessage1Ty = excelFileDataRecord.get("General_DisplayMessage1_Type").trim();
			String general_DisplayMessage1Vi = excelFileDataRecord.get("General_DisplayMessage1_Visibility").trim();
			String general_DisplayMessage1_default = excelFileDataRecord.get("General_DisplayMessage1_Default_Value")
					.trim();
			String general_DisplayMessage1V = excelFileDataRecord.get("General_DisplayMessage1_Value").trim();
			checkbox_Check_UIValidation("Display Message 1", rowNumber, sheetName,
					profile_General_profile_General_DisplayMessage1_Label, profile_General_DisplayMessage1,
					general_DisplayMessage1Lab, general_DisplayMessage1Ty, general_DisplayMessage1Vi,
					general_DisplayMessage1_default, general_DisplayMessage1V);

			// Display Message 1 > Schedule From - textbox
			String general_DisplayMessage1_FromLab = excelFileDataRecord.get("General_DisplayMessage1_From_Label")
					.trim();
			String general_DisplayMessage1_FromTy = excelFileDataRecord.get("General_DisplayMessage1_From_Type").trim();
			String general_DisplayMessage1_FromVi = excelFileDataRecord.get("General_DisplayMessage1_From_Visibility")
					.trim();
			String general_DisplayMessage1_FromP = excelFileDataRecord.get("General_DisplayMessage1_From_Placeholder")
					.trim();
			String general_DisplayMessage1_From_default = excelFileDataRecord
					.get("General_DisplayMessage1_From_Default_Value").trim();
			String general_DisplayMessage1_FromV = excelFileDataRecord.get("General_DisplayMessage1_From_Value").trim();
			String general_DisplayMessage1_FromNegativeVal = excelFileDataRecord
					.get("General_DisplayMessage1_From_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Schedule", rowNumber, sheetName,
					profile_General_profile_General_Schedule1_Label, profile_General_Schedule1_From,
					general_DisplayMessage1_FromLab, general_DisplayMessage1_FromTy, general_DisplayMessage1_FromVi,
					general_DisplayMessage1_FromP, general_DisplayMessage1_From_default, general_DisplayMessage1_FromV,
					general_DisplayMessage1_FromNegativeVal);

			// Display Message 1 > Schedule To - textbox
			String general_DisplayMessage1_ToLab = excelFileDataRecord.get("General_DisplayMessage1_To_Label").trim();
			String general_DisplayMessage1_ToTy = excelFileDataRecord.get("General_DisplayMessage1_To_Type").trim();
			String general_DisplayMessage1_ToVi = excelFileDataRecord.get("General_DisplayMessage1_To_Visibility")
					.trim();
			String general_DisplayMessage1_ToP = excelFileDataRecord.get("General_DisplayMessage1_To_Placeholder")
					.trim();
			String general_DisplayMessage1_To_default = excelFileDataRecord
					.get("General_DisplayMessage1_To_Default_Value").trim();
			String general_DisplayMessage1_ToV = excelFileDataRecord.get("General_DisplayMessage1_To_Value").trim();
			String general_DisplayMessage1_ToNegativeVal = excelFileDataRecord
					.get("General_DisplayMessage1_To_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Schedule", rowNumber, sheetName,
					profile_General_profile_General_Schedule1_Label, profile_General_Schedule1_To,
					general_DisplayMessage1_ToLab, general_DisplayMessage1_ToTy, general_DisplayMessage1_ToVi,
					general_DisplayMessage1_ToP, general_DisplayMessage1_To_default, general_DisplayMessage1_ToV,
					general_DisplayMessage1_ToNegativeVal);

			// Display Message 1 > Message - textbox
			String general_DisplayMessage1_message_Lab = excelFileDataRecord
					.get("General_DisplayMessage1_message_Label").trim();
			String general_DisplayMessage1_message_Ty = excelFileDataRecord.get("General_DisplayMessage1_message_Type")
					.trim();
			String general_DisplayMessage1_message_Vi = excelFileDataRecord
					.get("General_DisplayMessage1_message_Visibility").trim();
			String general_DisplayMessage1_message_P = excelFileDataRecord
					.get("General_DisplayMessage1_message_Placeholder").trim();
			String general_DisplayMessage1_message_default = excelFileDataRecord
					.get("General_DisplayMessage1_message_Default_Value").trim();
			String general_DisplayMessage1_message_V = excelFileDataRecord.get("General_DisplayMessage1_message_Value")
					.trim();
			String general_DisplayMessage1_message_NegativeVal = excelFileDataRecord
					.get("General_DisplayMessage1_message_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Message", rowNumber, sheetName, profile_General_Message1_Label,
					profile_General_Message1, general_DisplayMessage1_message_Lab, general_DisplayMessage1_message_Ty,
					general_DisplayMessage1_message_Vi, general_DisplayMessage1_message_P,
					general_DisplayMessage1_message_default, general_DisplayMessage1_message_V,
					general_DisplayMessage1_message_NegativeVal);

			// *****Display Message 2 - checkbox****
			String general_DisplayMessage2Lab = excelFileDataRecord.get("General_DisplayMessage2_label").trim();
			String general_DisplayMessage2Ty = excelFileDataRecord.get("General_DisplayMessage2_Type").trim();
			String general_DisplayMessage2Vi = excelFileDataRecord.get("General_DisplayMessage2_Visibility").trim();
			String general_DisplayMessage2_default = excelFileDataRecord.get("General_DisplayMessage2_Default_Value")
					.trim();
			String general_DisplayMessage2V = excelFileDataRecord.get("General_DisplayMessage2_Value").trim();
			checkbox_Check_UIValidation("Display Message 2", rowNumber, sheetName,
					profile_General_profile_General_DisplayMessage2_Label, profile_General_DisplayMessage2,
					general_DisplayMessage2Lab, general_DisplayMessage2Ty, general_DisplayMessage2Vi,
					general_DisplayMessage2_default, general_DisplayMessage2V);

			// Display Message 2 > Schedule From - textbox
			String general_DisplayMessage2_FromLab = excelFileDataRecord.get("General_DisplayMessage2_From_Label")
					.trim();
			String general_DisplayMessage2_FromTy = excelFileDataRecord.get("General_DisplayMessage2_From_Type").trim();
			String general_DisplayMessage2_FromVi = excelFileDataRecord.get("General_DisplayMessage2_From_Visibility")
					.trim();
			String general_DisplayMessage2_FromP = excelFileDataRecord.get("General_DisplayMessage2_From_Placeholder")
					.trim();
			String general_DisplayMessage2_From_default = excelFileDataRecord
					.get("General_DisplayMessage2_From_Default_Value").trim();
			String general_DisplayMessage2_FromV = excelFileDataRecord.get("General_DisplayMessage2_From_Value").trim();
			String general_DisplayMessage2_FromNegativeVal = excelFileDataRecord
					.get("General_DisplayMessage2_From_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Schedule", rowNumber, sheetName,
					profile_General_profile_General_Schedule2_Label, profile_General_Schedule2_From,
					general_DisplayMessage2_FromLab, general_DisplayMessage2_FromTy, general_DisplayMessage2_FromVi,
					general_DisplayMessage2_FromP, general_DisplayMessage2_From_default, general_DisplayMessage2_FromV,
					general_DisplayMessage2_FromNegativeVal);

			// Display Message 2 > Schedule To - textbox
			String general_DisplayMessage2_ToLab = excelFileDataRecord.get("General_DisplayMessage2_To_Label").trim();
			String general_DisplayMessage2_ToTy = excelFileDataRecord.get("General_DisplayMessage2_To_Type").trim();
			String general_DisplayMessage2_ToVi = excelFileDataRecord.get("General_DisplayMessage2_To_Visibility")
					.trim();
			String general_DisplayMessage2_ToP = excelFileDataRecord.get("General_DisplayMessage2_To_Placeholder")
					.trim();
			String general_DisplayMessage2_To_default = excelFileDataRecord
					.get("General_DisplayMessage2_To_Default_Value").trim();
			String general_DisplayMessage2_ToV = excelFileDataRecord.get("General_DisplayMessage2_To_Value").trim();
			String general_DisplayMessage2_ToNegativeVal = excelFileDataRecord
					.get("General_DisplayMessage2_To_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Schedule", rowNumber, sheetName,
					profile_General_profile_General_Schedule2_Label, profile_General_Schedule2_To,
					general_DisplayMessage2_ToLab, general_DisplayMessage2_ToTy, general_DisplayMessage2_ToVi,
					general_DisplayMessage2_ToP, general_DisplayMessage2_To_default, general_DisplayMessage2_ToV,
					general_DisplayMessage2_ToNegativeVal);

			// Display Message 2 > Message - textbox
			String general_DisplayMessage2_message_Lab = excelFileDataRecord
					.get("General_DisplayMessage2_message_Label").trim();
			String general_DisplayMessage2_message_Ty = excelFileDataRecord.get("General_DisplayMessage2_message_Type")
					.trim();
			String general_DisplayMessage2_message_Vi = excelFileDataRecord
					.get("General_DisplayMessage2_message_Visibility").trim();
			String general_DisplayMessage2_message_P = excelFileDataRecord
					.get("General_DisplayMessage2_message_Placeholder").trim();
			String general_DisplayMessage2_message_default = excelFileDataRecord
					.get("General_DisplayMessage2_message_Default_Value").trim();
			String general_DisplayMessage2_message_V = excelFileDataRecord.get("General_DisplayMessage2_message_Value")
					.trim();
			String general_DisplayMessage2_message_NegativeVal = excelFileDataRecord
					.get("General_DisplayMessage2_message_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Message", rowNumber, sheetName, profile_General_Message2_Label,
					profile_General_Message2, general_DisplayMessage2_message_Lab, general_DisplayMessage2_message_Ty,
					general_DisplayMessage2_message_Vi, general_DisplayMessage2_message_P,
					general_DisplayMessage2_message_default, general_DisplayMessage2_message_V,
					general_DisplayMessage2_message_NegativeVal);

			// *****Display Message 3 - checkbox****
			String general_DisplayMessage3Lab = excelFileDataRecord.get("General_DisplayMessage3_label").trim();
			String general_DisplayMessage3Ty = excelFileDataRecord.get("General_DisplayMessage3_Type").trim();
			String general_DisplayMessage3Vi = excelFileDataRecord.get("General_DisplayMessage3_Visibility").trim();
			String general_DisplayMessage3_default = excelFileDataRecord.get("General_DisplayMessage3_Default_Value")
					.trim();
			String general_DisplayMessage3V = excelFileDataRecord.get("General_DisplayMessage3_Value").trim();
			checkbox_Check_UIValidation("Display Message 3", rowNumber, sheetName,
					profile_General_profile_General_DisplayMessage3_Label, profile_General_DisplayMessage3,
					general_DisplayMessage3Lab, general_DisplayMessage3Ty, general_DisplayMessage3Vi,
					general_DisplayMessage3_default, general_DisplayMessage3V);

			// Display Message 3 > Schedule From - textbox
			String general_DisplayMessage3_FromLab = excelFileDataRecord.get("General_DisplayMessage3_From_Label")
					.trim();
			String general_DisplayMessage3_FromTy = excelFileDataRecord.get("General_DisplayMessage3_From_Type").trim();
			String general_DisplayMessage3_FromVi = excelFileDataRecord.get("General_DisplayMessage3_From_Visibility")
					.trim();
			String general_DisplayMessage3_FromP = excelFileDataRecord.get("General_DisplayMessage3_From_Placeholder")
					.trim();
			String general_DisplayMessage3_From_default = excelFileDataRecord
					.get("General_DisplayMessage3_From_Default_Value").trim();
			String general_DisplayMessage3_FromV = excelFileDataRecord.get("General_DisplayMessage3_From_Value").trim();
			String general_DisplayMessage3_FromNegativeVal = excelFileDataRecord
					.get("General_DisplayMessage3_From_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Schedule", rowNumber, sheetName,
					profile_General_profile_General_Schedule3_Label, profile_General_Schedule3_From,
					general_DisplayMessage3_FromLab, general_DisplayMessage3_FromTy, general_DisplayMessage3_FromVi,
					general_DisplayMessage3_FromP, general_DisplayMessage3_From_default, general_DisplayMessage3_FromV,
					general_DisplayMessage3_FromNegativeVal);

			// Display Message 3 > Schedule To - textbox
			String general_DisplayMessage3_ToLab = excelFileDataRecord.get("General_DisplayMessage3_To_Label").trim();
			String general_DisplayMessage3_ToTy = excelFileDataRecord.get("General_DisplayMessage3_To_Type").trim();
			String general_DisplayMessage3_ToVi = excelFileDataRecord.get("General_DisplayMessage3_To_Visibility")
					.trim();
			String general_DisplayMessage3_ToP = excelFileDataRecord.get("General_DisplayMessage3_To_Placeholder")
					.trim();
			String general_DisplayMessage3_To_default = excelFileDataRecord
					.get("General_DisplayMessage3_To_Default_Value").trim();
			String general_DisplayMessage3_ToV = excelFileDataRecord.get("General_DisplayMessage3_To_Value").trim();
			String general_DisplayMessage3_ToNegativeVal = excelFileDataRecord
					.get("General_DisplayMessage3_To_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Schedule", rowNumber, sheetName,
					profile_General_profile_General_Schedule3_Label, profile_General_Schedule3_To,
					general_DisplayMessage3_ToLab, general_DisplayMessage3_ToTy, general_DisplayMessage3_ToVi,
					general_DisplayMessage3_ToP, general_DisplayMessage3_To_default, general_DisplayMessage3_ToV,
					general_DisplayMessage3_ToNegativeVal);

			// Display Message 3 > Message - textbox
			String general_DisplayMessage3_message_Lab = excelFileDataRecord
					.get("General_DisplayMessage3_message_Label").trim();
			String general_DisplayMessage3_message_Ty = excelFileDataRecord.get("General_DisplayMessage3_message_Type")
					.trim();
			String general_DisplayMessage3_message_Vi = excelFileDataRecord
					.get("General_DisplayMessage3_message_Visibility").trim();
			String general_DisplayMessage3_message_P = excelFileDataRecord
					.get("General_DisplayMessage3_message_Placeholder").trim();
			String general_DisplayMessage3_message_default = excelFileDataRecord
					.get("General_DisplayMessage3_message_Default_Value").trim();
			String general_DisplayMessage3_message_V = excelFileDataRecord.get("General_DisplayMessage3_message_Value")
					.trim();
			String general_DisplayMessage3_message_NegativeVal = excelFileDataRecord
					.get("General_DisplayMessage3_message_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Message", rowNumber, sheetName, profile_General_Message3_Label,
					profile_General_Message3, general_DisplayMessage3_message_Lab, general_DisplayMessage3_message_Ty,
					general_DisplayMessage3_message_Vi, general_DisplayMessage3_message_P,
					general_DisplayMessage3_message_default, general_DisplayMessage3_message_V,
					general_DisplayMessage3_message_NegativeVal);

			// *****Display Message 4 - checkbox****
			String general_DisplayMessage4Lab = excelFileDataRecord.get("General_DisplayMessage4_label").trim();
			String general_DisplayMessage4Ty = excelFileDataRecord.get("General_DisplayMessage4_Type").trim();
			String general_DisplayMessage4Vi = excelFileDataRecord.get("General_DisplayMessage4_Visibility").trim();
			String general_DisplayMessage4_default = excelFileDataRecord.get("General_DisplayMessage4_Default_Value")
					.trim();
			String general_DisplayMessage4V = excelFileDataRecord.get("General_DisplayMessage4_Value").trim();
			checkbox_Check_UIValidation("Display Message 4", rowNumber, sheetName,
					profile_General_profile_General_DisplayMessage4_Label, profile_General_DisplayMessage4,
					general_DisplayMessage4Lab, general_DisplayMessage4Ty, general_DisplayMessage4Vi,
					general_DisplayMessage4_default, general_DisplayMessage4V);

			// Display Message 4 > Schedule From - textbox
			String general_DisplayMessage4_FromLab = excelFileDataRecord.get("General_DisplayMessage4_From_Label")
					.trim();
			String general_DisplayMessage4_FromTy = excelFileDataRecord.get("General_DisplayMessage4_From_Type").trim();
			String general_DisplayMessage4_FromVi = excelFileDataRecord.get("General_DisplayMessage4_From_Visibility")
					.trim();
			String general_DisplayMessage4_FromP = excelFileDataRecord.get("General_DisplayMessage4_From_Placeholder")
					.trim();
			String general_DisplayMessage4_From_default = excelFileDataRecord
					.get("General_DisplayMessage4_From_Default_Value").trim();
			String general_DisplayMessage4_FromV = excelFileDataRecord.get("General_DisplayMessage4_From_Value").trim();
			String general_DisplayMessage4_FromNegativeVal = excelFileDataRecord
					.get("General_DisplayMessage4_From_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Schedule", rowNumber, sheetName,
					profile_General_profile_General_Schedule4_Label, profile_General_Schedule4_From,
					general_DisplayMessage4_FromLab, general_DisplayMessage4_FromTy, general_DisplayMessage4_FromVi,
					general_DisplayMessage4_FromP, general_DisplayMessage4_From_default, general_DisplayMessage4_FromV,
					general_DisplayMessage4_FromNegativeVal);

			// Display Message 4 > Schedule To - textbox
			String general_DisplayMessage4_ToLab = excelFileDataRecord.get("General_DisplayMessage4_To_Label").trim();
			String general_DisplayMessage4_ToTy = excelFileDataRecord.get("General_DisplayMessage4_To_Type").trim();
			String general_DisplayMessage4_ToVi = excelFileDataRecord.get("General_DisplayMessage4_To_Visibility")
					.trim();
			String general_DisplayMessage4_ToP = excelFileDataRecord.get("General_DisplayMessage4_To_Placeholder")
					.trim();
			String general_DisplayMessage4_To_default = excelFileDataRecord
					.get("General_DisplayMessage4_To_Default_Value").trim();
			String general_DisplayMessage4_ToV = excelFileDataRecord.get("General_DisplayMessage4_To_Value").trim();
			String general_DisplayMessage4_ToNegativeVal = excelFileDataRecord
					.get("General_DisplayMessage4_To_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Schedule", rowNumber, sheetName,
					profile_General_profile_General_Schedule4_Label, profile_General_Schedule4_To,
					general_DisplayMessage4_ToLab, general_DisplayMessage4_ToTy, general_DisplayMessage4_ToVi,
					general_DisplayMessage4_ToP, general_DisplayMessage4_To_default, general_DisplayMessage4_ToV,
					general_DisplayMessage4_ToNegativeVal);

			// Display Message 4 > Message - textbox
			String general_DisplayMessage4_message_Lab = excelFileDataRecord
					.get("General_DisplayMessage4_message_Label").trim();
			String general_DisplayMessage4_message_Ty = excelFileDataRecord.get("General_DisplayMessage4_message_Type")
					.trim();
			String general_DisplayMessage4_message_Vi = excelFileDataRecord
					.get("General_DisplayMessage4_message_Visibility").trim();
			String general_DisplayMessage4_message_P = excelFileDataRecord
					.get("General_DisplayMessage4_message_Placeholder").trim();
			String general_DisplayMessage4_message_default = excelFileDataRecord
					.get("General_DisplayMessage4_message_Default_Value").trim();
			String general_DisplayMessage4_message_V = excelFileDataRecord.get("General_DisplayMessage4_message_Value")
					.trim();
			String general_DisplayMessage4_message_NegativeVal = excelFileDataRecord
					.get("General_DisplayMessage4_message_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Message", rowNumber, sheetName, profile_General_Message4_Label,
					profile_General_Message4, general_DisplayMessage4_message_Lab, general_DisplayMessage4_message_Ty,
					general_DisplayMessage4_message_Vi, general_DisplayMessage4_message_P,
					general_DisplayMessage4_message_default, general_DisplayMessage4_message_V,
					general_DisplayMessage4_message_NegativeVal);

			// *****Multi-Language Support - checkbox****
			String general_MultiLanguageSupportLab = excelFileDataRecord.get("General_MultiLanguageSupport_label")
					.trim();
			String general_MultiLanguageSupportTy = excelFileDataRecord.get("General_MultiLanguageSupport_Type").trim();
			String general_MultiLanguageSupportVi = excelFileDataRecord.get("General_MultiLanguageSupport_Visibility")
					.trim();
			String general_MultiLanguageSupport_default = excelFileDataRecord
					.get("General_MultiLanguageSupport_Default_Value").trim();
			String general_MultiLanguageSupportV = excelFileDataRecord.get("General_MultiLanguageSupport_Value").trim();
			checkbox_Check_UIValidation("Multi-Language Support", rowNumber, sheetName,
					profile_General_MultiLanguageSupport_Label, profile_General_MultiLanguageSupport,
					general_MultiLanguageSupportLab, general_MultiLanguageSupportTy, general_MultiLanguageSupportVi,
					general_MultiLanguageSupport_default, general_MultiLanguageSupportV);

			// Save button then checked main validation
			Thread.sleep(500);
			saveButtonClick();
			valMsg = validationMessage();
			String excelVal = excelFileDataRecord.get("Validation").trim();
			if (!excelVal.isBlank() && !excelVal.isEmpty()) {
				assertEquals(valMsg, excelFileDataRecord.get("Validation").trim(),
						"Main Validation on Save button Comparison", true, rowNumber, sheetName);
			}
			Thread.sleep(1500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			reloadPageButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));

		}
	}

	// Profile_AccessSettings Locators
	// ********************************************Access
	// Setting********************************************
	// Access Settings Xpath
	@FindBy(xpath = "//label[text()=\"Access Settings\"]")
	private WebElement profile_AccessSettingsTabControl;

	@FindBy(xpath = "//label[text()=\"Access Settings\"]/ancestor::li[1]")
	private WebElement profile_AccessSettingsTabControlActiveOrNot;

	@FindBy(id = "cboUTimeZone")
	private WebElement profile_AccessSettings_UniversalTimeZone;

	@FindBy(id = "cboUTimeZone")
	private List<WebElement> profile_AccessSettings_UniversalTimeZone_Size;

	@FindBy(xpath = "//*[@id='cboUTimeZone']/ancestor::div[@class='form-group']//label")
	private WebElement profile_AccessSettings_UniversalTimeZoneLabel;

	@FindBy(id = "cboTimeFmt")
	private WebElement profile_AccessSettings_TimeFormat;

	@FindBy(id = "cboTimeFmt")
	private List<WebElement> profile_AccessSettings_TimeFormat_Size;

	@FindBy(xpath = "//*[@id='cboTimeFmt']/ancestor::div[@class='form-group']//label")
	private WebElement profile_AccessSettings_TimeFormatlabel;

	@FindBy(id = "chkautosyncwithNTP")
	private WebElement profile_AccessSettings_AutoSynchronizewithNTP;

	@FindBy(xpath = "//*[@id='chkautosyncwithNTP']/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement profile_AccessSettings_AutoSynchronizewithNTPLabel;

	@FindBy(id = "txtNTPAdd")
	private WebElement profile_AccessSettings_PreferredNTPServer;

	@FindBy(xpath = "//*[@id='txtNTPAdd']/ancestor::div[@class='form-group']//label")
	private WebElement profile_AccessSettings_PreferredNTPServerLabel;

	@FindBy(xpath = "//*[contains(@id,'chkActiveDays')]/ancestor::label[1]")
	private List<WebElement> profile_AccessSettings_WorkingDays;

	@FindBy(xpath = "//*[@id='chkActiveDays0']/ancestor::div[@class='form-group']/div/mx-label/label")
	private WebElement profile_AccessSettings_WorkingDaysLabel;

	@FindBy(id = "txtWokFrmHHMM")
	private WebElement profile_AccessSettings_WorkingHoursFrom;

	@FindBy(id = "txtWokToHHMM")
	private WebElement profile_AccessSettings_WorkingHoursTo;

	@FindBy(xpath = "//*[@id='txtWokFrmHHMM']/ancestor::div[@class='form-group']//label")
	private WebElement profile_AccessSettings_WorkingHoursFromLabel;

	@FindBy(id = "HLDSch1ID")
	private WebElement profile_AccessSettings_HolidaySchedule1_Id;

	@FindBy(id = "HLDSch1Name")
	private WebElement profile_AccessSettings_HolidaySchedule1_Name;

	@FindBy(xpath = "//*[@id='HLDSch1ID']/ancestor::div[@class='form-group']//label")
	private WebElement profile_AccessSettings_HolidaySchedule1Label;

	@FindBy(id = "HLDSch2ID")
	private WebElement profile_AccessSettings_HolidaySchedule2_Id;

	@FindBy(id = "HLDSch2Name")
	private WebElement profile_AccessSettings_HolidaySchedule2_Name;

	@FindBy(xpath = "//*[@id='HLDSch2ID']/ancestor::div[@class='form-group']//label")
	private WebElement profile_AccessSettings_HolidaySchedule2Label;

	@FindBy(id = "HLDSch3ID")
	private WebElement profile_AccessSettings_HolidaySchedule3_Id;

	@FindBy(id = "HLDSch3Name")
	private WebElement profile_AccessSettings_HolidaySchedule3_Name;

	@FindBy(xpath = "//*[@id='HLDSch3ID']/ancestor::div[@class='form-group']//label")
	private WebElement profile_AccessSettings_HolidaySchedule3Label;

	@FindBy(id = "HLDSch4ID")
	private WebElement profile_AccessSettings_HolidaySchedule4_Id;

	@FindBy(id = "HLDSch4Name")
	private WebElement profile_AccessSettings_HolidaySchedule4_Name;

	@FindBy(xpath = "//*[@id='HLDSch4ID']/ancestor::div[@class='form-group']//label")
	private WebElement profile_AccessSettings_HolidaySchedule4Label;

	@FindBy(id = "cboDeviceAccessSchedule")
	private WebElement profile_AccessSettings_DeviceAccessSchedule;

	@FindBy(id = "cboDeviceAccessSchedule")
	private List<WebElement> profile_AccessSettings_DeviceAccessSchedule_Size;

	@FindBy(xpath = "//*[@key='lblDeviceAccessSchedule']")
	private WebElement profile_AccessSettings_DeviceAccessScheduleLabel;

	@FindBy(xpath = "//*[@id='cboDeviceAccessSchedule']/ancestor::div[@class='form-group']/div[3]/label")
	private WebElement profile_AccessSettings_DeviceAccessScheduleLabelInfoIcon;

	@FindBy(xpath = "//*[@id=\"HLDSch1Name\"]/following-sibling::span[1]//i")
	private WebElement HolidaySchedule1PopupOpenBtn;

	@FindBy(xpath = "//*[@id=\"HLDSch2Name\"]/following-sibling::span[1]//i")
	private WebElement HolidaySchedule2PopupOpenBtn;

	@FindBy(xpath = "//*[@id=\"HLDSch3Name\"]/following-sibling::span[1]//i")
	private WebElement HolidaySchedule3PopupOpenBtn;

	@FindBy(xpath = "//*[@id=\"HLDSch4Name\"]/following-sibling::span[1]//i")
	private WebElement HolidaySchedule4PopupOpenBtn;

//	Profile_AccessSettings Tab	
	public void deviceUIControlValidation_AccessSettings(List<Map<String, String>> data, String sheetName)
			throws Exception {
		for (int i = 0; i < data.size(); i++) {
			eachRowStatus = false;
			String valMsg = null;
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			Map<String, String> excelFileDataRecord = data.get(i);
			logger.info("***********************************Excel Data Record Picked : Row Number = " + i + " Data is ="
					+ excelFileDataRecord);
			int rowNumber = Integer.parseInt(excelFileDataRecord.get("RowNumber"));
			addButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			waitForElementVisible_TimeinMinutes(selectDeviceTypeBeAddedpopUp, 2);
			for (int j = 0; j < selectDeviceTypeToBeAdded.size(); j++) {
				String title = selectDeviceTypeToBeAdded.get(j).getAttribute("title");
				if (title.equalsIgnoreCase(excelFileDataRecord.get("DeviceType"))) {
					selectDeviceTypeToBeAdded.get(j).click();
					Thread.sleep(500);
					waitForElementClickable(deviceContinue);
					element_Click(deviceContinue);
					Thread.sleep(500);
					break;
				}
			}
			Thread.sleep(500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementClickable(active, 1);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			// *******************Start Device Name Textbox And Control*******************

			String deviceNameV = excelFileDataRecord.get("DeviceName_Value").trim();
			textBox_Control_Check_UIValidation("Device Name", rowNumber, sheetName, deviceidNameLabel, deviceNameTxt,
					"", "", "", "", "", deviceNameV, "");

			// *******************Start Mac Address Textbox And Control*******************
			String macAddressV = excelFileDataRecord.get("MacAddress_Value").trim();
			if (!macAddressV.isBlank() && !macAddressV.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				String[] macs = macAddressV.split(":");
				for (int x = 0; x < macAddressTxt.size(); x++) {
					macAddressTxt.get(x).sendKeys(macs[x]);
				}
			}
			// **********************Start AccessSettings
			// Tab***********************************
			String accessSettings_label = excelFileDataRecord.get("AccessSettings_label").trim();
			String accessSettings_Default = excelFileDataRecord.get("AccessSettings_Default").trim();
			String accessSettings_Select = excelFileDataRecord.get("AccessSettings_Select").trim();
			if (!accessSettings_label.isBlank() && !accessSettings_label.isEmpty()) {
				assertEquals(profile_AccessSettingsTabControl.getText(), accessSettings_label,
						"AccessSettings Tab Control Label Comparision", true, rowNumber, sheetName);
			}
			if (!accessSettings_Select.isBlank() && !accessSettings_Select.isEmpty()) {
				element_Click(profile_AccessSettingsTabControl);
				Thread.sleep(250);
			}
			if (!accessSettings_Default.isBlank() && !accessSettings_Default.isEmpty()) {
				String deviceGetID = profile_AccessSettingsTabControlActiveOrNot.getAttribute("class");
				String value = null;
				if (deviceGetID.toLowerCase().contains("tab-active")) {
					value = "tab-active";
				} else {
					value = "tab-non-active";
				}
				assertEquals(value, accessSettings_Default, "Access Settings Tab Control Label Comparision", true,
						rowNumber, sheetName);
			}

			// main code start
			// Universal Time Zone - dropdown
			String accessSettings_UniversalTimeZone_label = excelFileDataRecord
					.get("AccessSettings_UniversalTimeZone_label").trim();
			String accessSettings_UniversalTimeZone_Type = excelFileDataRecord
					.get("AccessSettings_UniversalTimeZone_Type").trim();
			String accessSettings_UniversalTimeZone_Visibility = excelFileDataRecord
					.get("AccessSettings_UniversalTimeZone_Visibility").trim();
			String accessSettings_UniversalTimeZone_Default_Value = excelFileDataRecord
					.get("AccessSettings_UniversalTimeZone_Default_Value").trim();
			String accessSettings_UniversalTimeZone_Values = excelFileDataRecord
					.get("AccessSettings_UniversalTimeZone_Values").trim();
			String accessSettings_UniversalTimeZone_Select_Values = excelFileDataRecord
					.get("AccessSettings_UniversalTimeZone_Select_Values").trim();
			String accessSettings_UniversalTimeZone_visibleOrNot = excelFileDataRecord
					.get("AccessSettings_UniversalTimeZone_visibleOrNot").trim();
			dropDown_Check_UIValidation("Universal Time Zone", rowNumber, sheetName,
					profile_AccessSettings_UniversalTimeZoneLabel, profile_AccessSettings_UniversalTimeZone,
					profile_AccessSettings_UniversalTimeZone_Size, accessSettings_UniversalTimeZone_label,
					accessSettings_UniversalTimeZone_Type, accessSettings_UniversalTimeZone_Visibility,
					accessSettings_UniversalTimeZone_Default_Value, accessSettings_UniversalTimeZone_Select_Values,
					accessSettings_UniversalTimeZone_Values, accessSettings_UniversalTimeZone_visibleOrNot);

			// Time Format - dropdown
			String accessSettings_TimeFormat_label = excelFileDataRecord.get("AccessSettings_TimeFormat_label").trim();
			String accessSettings_TimeFormat_Type = excelFileDataRecord.get("AccessSettings_TimeFormat_Type").trim();
			String accessSettings_TimeFormat_Visibility = excelFileDataRecord
					.get("AccessSettings_TimeFormat_Visibility").trim();
			String accessSettings_TimeFormat_Default_Value = excelFileDataRecord
					.get("AccessSettings_TimeFormat_Default_Value").trim();
			String accessSettings_TimeFormat_Values = excelFileDataRecord.get("AccessSettings_TimeFormat_Values")
					.trim();
			String accessSettings_TimeFormat_Select_Values = excelFileDataRecord
					.get("AccessSettings_TimeFormat_Select_Values").trim();
			String accessSettings_TimeFormat_visibleOrNot = excelFileDataRecord
					.get("AccessSettings_TimeFormat_visibleOrNot").trim();
			dropDown_Check_UIValidation("Time Format", rowNumber, sheetName, profile_AccessSettings_TimeFormatlabel,
					profile_AccessSettings_TimeFormat, profile_AccessSettings_TimeFormat_Size,
					accessSettings_TimeFormat_label, accessSettings_TimeFormat_Type,
					accessSettings_TimeFormat_Visibility, accessSettings_TimeFormat_Default_Value,
					accessSettings_TimeFormat_Select_Values, accessSettings_TimeFormat_Values,
					accessSettings_TimeFormat_visibleOrNot);

			// *****Auto Synchronize with NTP - checkbox****
			String accessSettings_AutoSynchronizewithNTPLab = excelFileDataRecord
					.get("AccessSettings_AutoSynchronizewithNTP_label").trim();
			String accessSettings_AutoSynchronizewithNTPTy = excelFileDataRecord
					.get("AccessSettings_AutoSynchronizewithNTP_Type").trim();
			String accessSettings_AutoSynchronizewithNTPVi = excelFileDataRecord
					.get("AccessSettings_AutoSynchronizewithNTP_Visibility").trim();
			String accessSettings_AutoSynchronizewithNTP_default = excelFileDataRecord
					.get("AccessSettings_AutoSynchronizewithNTP_Default_Value").trim();
			String accessSettings_AutoSynchronizewithNTPV = excelFileDataRecord
					.get("AccessSettings_AutoSynchronizewithNTP_Value").trim();
			checkbox_Check_UIValidation("Auto Synchronize with NTP", rowNumber, sheetName,
					profile_AccessSettings_AutoSynchronizewithNTPLabel, profile_AccessSettings_AutoSynchronizewithNTP,
					accessSettings_AutoSynchronizewithNTPLab, accessSettings_AutoSynchronizewithNTPTy,
					accessSettings_AutoSynchronizewithNTPVi, accessSettings_AutoSynchronizewithNTP_default,
					accessSettings_AutoSynchronizewithNTPV);

			// Preferred NTP Server - textbox
			String accessSettings_PreferredNTPServer_Lab = excelFileDataRecord
					.get("AccessSettings_PreferredNTPServer_Label").trim();
			String accessSettings_PreferredNTPServer_Ty = excelFileDataRecord
					.get("AccessSettings_PreferredNTPServer_Type").trim();
			String accessSettings_PreferredNTPServer_Vi = excelFileDataRecord
					.get("AccessSettings_PreferredNTPServer_Visibility").trim();
			String accessSettings_PreferredNTPServer_P = excelFileDataRecord
					.get("AccessSettings_PreferredNTPServer_Placeholder").trim();
			String accessSettings_PreferredNTPServer_default = excelFileDataRecord
					.get("AccessSettings_PreferredNTPServer_Default_Value").trim();
			String accessSettings_PreferredNTPServer_V = excelFileDataRecord
					.get("AccessSettings_PreferredNTPServer_Value").trim();
			String accessSettings_PreferredNTPServer_NegativeVal = excelFileDataRecord
					.get("AccessSettings_PreferredNTPServer_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Preferred NTP Server", rowNumber, sheetName,
					profile_AccessSettings_PreferredNTPServerLabel, profile_AccessSettings_PreferredNTPServer,
					accessSettings_PreferredNTPServer_Lab, accessSettings_PreferredNTPServer_Ty,
					accessSettings_PreferredNTPServer_Vi, accessSettings_PreferredNTPServer_P,
					accessSettings_PreferredNTPServer_default, accessSettings_PreferredNTPServer_V,
					accessSettings_PreferredNTPServer_NegativeVal);

			// Working Hours (HH:MM) From - textbox
			String accessSettings_WorkingHours_FromLab = excelFileDataRecord
					.get("AccessSettings_WorkingHours_From_Label").trim();
			String accessSettings_WorkingHours_FromTy = excelFileDataRecord.get("AccessSettings_WorkingHours_From_Type")
					.trim();
			String accessSettings_WorkingHours_FromVi = excelFileDataRecord
					.get("AccessSettings_WorkingHours_From_Visibility").trim();
			String accessSettings_WorkingHours_FromP = excelFileDataRecord
					.get("AccessSettings_WorkingHours_From_Placeholder").trim();
			String accessSettings_WorkingHours_From_default = excelFileDataRecord
					.get("AccessSettings_WorkingHours_From_Default_Value").trim();
			String accessSettings_WorkingHours_FromV = excelFileDataRecord.get("AccessSettings_WorkingHours_From_Value")
					.trim();
			String accessSettings_WorkingHours_FromNegativeVal = excelFileDataRecord
					.get("AccessSettings_WorkingHours_From_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Working Hours (HH:MM)", rowNumber, sheetName,
					profile_AccessSettings_WorkingHoursFromLabel, profile_AccessSettings_WorkingHoursFrom,
					accessSettings_WorkingHours_FromLab, accessSettings_WorkingHours_FromTy,
					accessSettings_WorkingHours_FromVi, accessSettings_WorkingHours_FromP,
					accessSettings_WorkingHours_From_default, accessSettings_WorkingHours_FromV,
					accessSettings_WorkingHours_FromNegativeVal);

			// Working Hours (HH:MM) To - textbox
			String accessSettings_WorkingHours_ToLab = excelFileDataRecord.get("AccessSettings_WorkingHours_To_Label")
					.trim();
			String accessSettings_WorkingHours_ToTy = excelFileDataRecord.get("AccessSettings_WorkingHours_To_Type")
					.trim();
			String accessSettings_WorkingHours_ToVi = excelFileDataRecord
					.get("AccessSettings_WorkingHours_To_Visibility").trim();
			String accessSettings_WorkingHours_ToP = excelFileDataRecord
					.get("AccessSettings_WorkingHours_To_Placeholder").trim();
			String accessSettings_WorkingHours_To_default = excelFileDataRecord
					.get("AccessSettings_WorkingHours_To_Default_Value").trim();
			String accessSettings_WorkingHours_ToV = excelFileDataRecord.get("AccessSettings_WorkingHours_To_Value")
					.trim();
			String accessSettings_WorkingHours_ToNegativeVal = excelFileDataRecord
					.get("AccessSettings_WorkingHours_To_Negative_Validation").trim();
			textBox_Control_Check_UIValidation("Working Hours (HH:MM)", rowNumber, sheetName,
					profile_AccessSettings_WorkingHoursFromLabel, profile_AccessSettings_WorkingHoursTo,
					accessSettings_WorkingHours_ToLab, accessSettings_WorkingHours_ToTy,
					accessSettings_WorkingHours_ToVi, accessSettings_WorkingHours_ToP,
					accessSettings_WorkingHours_To_default, accessSettings_WorkingHours_ToV,
					accessSettings_WorkingHours_ToNegativeVal);

			// Holiday Schedule 1 Code Start
			// *******************Holiday Schedule 1 Label And Control*******************
			String accessSettings_HolidaySchedule1Lab = excelFileDataRecord.get("AccessSettings_HolidaySchedule1_label")
					.trim();
			String accessSettings_HolidaySchedule1Ty = excelFileDataRecord.get("AccessSettings_HolidaySchedule1_Type")
					.trim();
			String accessSettings_HolidaySchedule1Vi = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Visibility").trim();
			String accessSettings_HolidaySchedule1P = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Placeholder").trim();
			String accessSettings_HolidaySchedule1_default = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Default_Value").trim();
			String accessSettings_HolidaySchedule1V = excelFileDataRecord.get("AccessSettings_HolidaySchedule1_Value")
					.trim();
			String accessSettings_HolidaySchedule1Negative = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Negative").trim();
			textBox_Control_Check_UIValidation("Holiday Schedule 1", rowNumber, sheetName,
					profile_AccessSettings_HolidaySchedule1Label, profile_AccessSettings_HolidaySchedule1_Id,
					accessSettings_HolidaySchedule1Lab, accessSettings_HolidaySchedule1Ty,
					accessSettings_HolidaySchedule1Vi, accessSettings_HolidaySchedule1P,
					accessSettings_HolidaySchedule1_default, accessSettings_HolidaySchedule1V,
					accessSettings_HolidaySchedule1Negative);
			// *******************Holiday Schedule 1 Name Label And
			// Control*******************

			String accessSettings_HolidaySchedule1_NameTy = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Name_Type").trim();
			String accessSettings_HolidaySchedule1_NameVi = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Name_Visibility").trim();
			String accessSettings_HolidaySchedule1_NameP = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Name_Placeholder").trim();
			String accessSettings_HolidaySchedule1_Name_default = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Name_Default_Value").trim();
			String accessSettings_HolidaySchedule1_NameV = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Name_Value").trim();
			String accessSettings_HolidaySchedule1_NameNegative = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Name_Negative").trim();
			textBox_Control_Check_UIValidation("Holiday Schedule 1", rowNumber, sheetName,
					profile_AccessSettings_HolidaySchedule1Label, profile_AccessSettings_HolidaySchedule1_Name, "",
					accessSettings_HolidaySchedule1_NameTy, accessSettings_HolidaySchedule1_NameVi,
					accessSettings_HolidaySchedule1_NameP, accessSettings_HolidaySchedule1_Name_default,
					accessSettings_HolidaySchedule1_NameV, accessSettings_HolidaySchedule1_NameNegative);

			// *******************Start Holiday Schedule 1 Pop Up Button And
			// Control*******************
			String accessSettings_HolidaySchedule1_Popup_LabelBasicV = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Popup_Label").trim();
			String accessSettings_HolidaySchedule1_PopupSearch_Type = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_PopUpSearch_Type").trim();
			String accessSettings_HolidaySchedule1_PopupSearch_Placeholder = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_PopupSearch_Placeholder").trim();
			String accessSettings_HolidaySchedule1_PopupSearch_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_PopupSearch_Value").trim();
			String accessSettings_HolidaySchedule1_Popup_Default_Table_Header_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Popup_Default_Table_Header_Value").trim();
			String accessSettings_HolidaySchedule1_Popup_Default_Table_Row_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Popup_Default_Table_Row_Value").trim();
			String accessSettings_HolidaySchedule1_Popup_Default_Table_No_Data_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Popup_Default_Table_No_Data_Value").trim();
			String accessSettings_HolidaySchedule1_Popup_Default_Table_Row_Value_Select = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_Popup_Default_Table_Row_Value_Select").trim();
			String accessSettings_HolidaySchedule1_PopupCancel_Type = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_PopupCancel_Type").trim();
			String accessSettings_HolidaySchedule1_PopupCancel_Default_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule1_PopupCancel_Default_Value").trim();
			String accessSettings_HolidaySchedule1_PopupClose_Type = excelFileDataRecord
					.get("accessSettings_HolidaySchedule1_PopupClose_Type").trim();
			if (!accessSettings_HolidaySchedule1_Popup_LabelBasicV.isBlank()
					|| !accessSettings_HolidaySchedule1_PopupSearch_Type.isBlank()
					|| !accessSettings_HolidaySchedule1_PopupSearch_Placeholder.isBlank()
					|| !accessSettings_HolidaySchedule1_PopupSearch_Value.isBlank()
					|| !accessSettings_HolidaySchedule1_Popup_Default_Table_Header_Value.isBlank()
					|| !accessSettings_HolidaySchedule1_Popup_Default_Table_Row_Value.isBlank()
					|| !accessSettings_HolidaySchedule1_Popup_Default_Table_No_Data_Value.isBlank()
					|| !accessSettings_HolidaySchedule1_PopupCancel_Type.isBlank()
					|| !accessSettings_HolidaySchedule1_PopupCancel_Default_Value.isBlank()
					|| !accessSettings_HolidaySchedule1_PopupClose_Type.isBlank()
					|| !accessSettings_HolidaySchedule1_Popup_Default_Table_Row_Value_Select.isBlank()) {
				System.out.println("I am in Holiday Schedule 1 PopUp");
				element_Click(HolidaySchedule1PopupOpenBtn);
				waitForElementVisible(basic_Site_Popup_Label);
				// Pop up Open
				if (!accessSettings_HolidaySchedule1_Popup_LabelBasicV.isBlank()
						&& !accessSettings_HolidaySchedule1_Popup_LabelBasicV.isEmpty()) {
					System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
					assertEquals(basic_Site_Popup_Label.getText(), accessSettings_HolidaySchedule1_Popup_LabelBasicV,
							"Holiday Schedule 1 Pop Up Label Comparision", true, rowNumber, sheetName);
				}
				// Start Search Box
				if (!accessSettings_HolidaySchedule1_PopupSearch_Placeholder.isBlank()
						&& !accessSettings_HolidaySchedule1_PopupSearch_Placeholder.isEmpty()) {
					System.out.println("Element PlaceHolder :"
							+ element_GetAttributeValue(basic_Site_Popup_search, "placeholder"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_search, "placeholder"),
							accessSettings_HolidaySchedule1_PopupSearch_Placeholder,
							"Holiday Schedule 1 Pop Up -> SearchBox PlaceHolder Comparison", true, rowNumber,
							sheetName);
				}
				if (!accessSettings_HolidaySchedule1_PopupSearch_Type.isBlank()
						&& !accessSettings_HolidaySchedule1_PopupSearch_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_search, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_search, "type"),
							accessSettings_HolidaySchedule1_PopupSearch_Type,
							"Holiday Schedule 1 Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule1_PopupSearch_Value.isBlank()
						&& !accessSettings_HolidaySchedule1_PopupSearch_Value.isEmpty()) {
					element_InputText(basic_Site_Popup_search, accessSettings_HolidaySchedule1_PopupSearch_Value);
					Thread.sleep(250);
					element_Click(basic_Site_Popup_search_Button);
					Thread.sleep(250);
				}
				// Table Header Value Checked
				tableHeader_Control_Check_UIValidation("Holiday Schedule 1 Pop Up", rowNumber, sheetName,
						basic_Site_Popup_table_header,
						accessSettings_HolidaySchedule1_Popup_Default_Table_Header_Value);
				Thread.sleep(250);
				// Table Row Value Checked
				tableRow_Control_Check_UIValidation("Holiday Schedule 1 Pop Up Table Row", rowNumber, sheetName,
						basic_Site_Popup_table_Row, "td[@class=\"cursor label-text\"]/label",
						basic_Site_Popup_table_No_Data, accessSettings_HolidaySchedule1_Popup_Default_Table_Row_Value,
						accessSettings_HolidaySchedule1_Popup_Default_Table_No_Data_Value);

				// Cancel Button
				if (!accessSettings_HolidaySchedule1_PopupCancel_Type.isBlank()
						&& !accessSettings_HolidaySchedule1_PopupCancel_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CancelButton, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CancelButton, "type"),
							accessSettings_HolidaySchedule1_PopupCancel_Type,
							"Holiday Schedule 1 Pop Up -> Cencel Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule1_PopupCancel_Default_Value.isBlank()
						&& !accessSettings_HolidaySchedule1_PopupCancel_Default_Value.isEmpty()) {
					System.out.println("Element default Value :"
							+ element_GetAttributeValue(basic_Site_Popup_CancelButton, "value"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CancelButton, "value"),
							accessSettings_HolidaySchedule1_PopupCancel_Default_Value,
							"Holiday Schedule 1 Pop Up -> Cencel Button default value Comparison", true, rowNumber,
							sheetName);
				}
				// Close button
				if (!accessSettings_HolidaySchedule1_PopupClose_Type.isBlank()
						&& !accessSettings_HolidaySchedule1_PopupClose_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"),
							accessSettings_HolidaySchedule1_PopupClose_Type,
							"Holiday Schedule 1 Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule1_Popup_Default_Table_Row_Value_Select.isBlank()
						&& !accessSettings_HolidaySchedule1_Popup_Default_Table_Row_Value_Select.isEmpty()) {
					for (int aa = 0; aa < basic_Site_Popup_table_Row_ValueSelect.size(); aa++) {
						System.out.println(basic_Site_Popup_table_Row_ValueSelect.get(aa).getText());
						if (basic_Site_Popup_table_Row_ValueSelect.get(aa).getText().equalsIgnoreCase(
								accessSettings_HolidaySchedule1_Popup_Default_Table_Row_Value_Select)) {
							basic_Site_Popup_table_Row_ValueSelect.get(aa).click();
							Thread.sleep(250);
							break;
						}
					}

				} else {
					element_Click(basic_Site_Popup_CloseButton);
				}
			}
			// Holiday Schedule 1 Code End

			// Holiday Schedule 2 Code Start
			// *******************Holiday Schedule 1 Label And Control*******************
			String accessSettings_HolidaySchedule2Lab = excelFileDataRecord.get("AccessSettings_HolidaySchedule2_label")
					.trim();
			String accessSettings_HolidaySchedule2Ty = excelFileDataRecord.get("AccessSettings_HolidaySchedule2_Type")
					.trim();
			String accessSettings_HolidaySchedule2Vi = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Visibility").trim();
			String accessSettings_HolidaySchedule2P = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Placeholder").trim();
			String accessSettings_HolidaySchedule2_default = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Default_Value").trim();
			String accessSettings_HolidaySchedule2V = excelFileDataRecord.get("AccessSettings_HolidaySchedule2_Value")
					.trim();
			String accessSettings_HolidaySchedule2Negative = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Negative").trim();
			textBox_Control_Check_UIValidation("Holiday Schedule 2", rowNumber, sheetName,
					profile_AccessSettings_HolidaySchedule2Label, profile_AccessSettings_HolidaySchedule2_Id,
					accessSettings_HolidaySchedule2Lab, accessSettings_HolidaySchedule2Ty,
					accessSettings_HolidaySchedule2Vi, accessSettings_HolidaySchedule2P,
					accessSettings_HolidaySchedule2_default, accessSettings_HolidaySchedule2V,
					accessSettings_HolidaySchedule2Negative);
			// *******************Holiday Schedule 2 Name Label And
			// Control*******************

			String accessSettings_HolidaySchedule2_NameTy = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Name_Type").trim();
			String accessSettings_HolidaySchedule2_NameVi = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Name_Visibility").trim();
			String accessSettings_HolidaySchedule2_NameP = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Name_Placeholder").trim();
			String accessSettings_HolidaySchedule2_Name_default = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Name_Default_Value").trim();
			String accessSettings_HolidaySchedule2_NameV = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Name_Value").trim();
			String accessSettings_HolidaySchedule2_NameNegative = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Name_Negative").trim();
			textBox_Control_Check_UIValidation("Holiday Schedule 2", rowNumber, sheetName,
					profile_AccessSettings_HolidaySchedule2Label, profile_AccessSettings_HolidaySchedule2_Name, "",
					accessSettings_HolidaySchedule2_NameTy, accessSettings_HolidaySchedule2_NameVi,
					accessSettings_HolidaySchedule2_NameP, accessSettings_HolidaySchedule2_Name_default,
					accessSettings_HolidaySchedule2_NameV, accessSettings_HolidaySchedule2_NameNegative);

			// *******************Start Holiday Schedule 2 Pop Up Button And
			// Control*******************
			String accessSettings_HolidaySchedule2_Popup_LabelBasicV = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Popup_Label").trim();
			String accessSettings_HolidaySchedule2_PopupSearch_Type = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_PopUpSearch_Type").trim();
			String accessSettings_HolidaySchedule2_PopupSearch_Placeholder = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_PopupSearch_Placeholder").trim();
			String accessSettings_HolidaySchedule2_PopupSearch_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_PopupSearch_Value").trim();
			String accessSettings_HolidaySchedule2_Popup_Default_Table_Header_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Popup_Default_Table_Header_Value").trim();
			String accessSettings_HolidaySchedule2_Popup_Default_Table_Row_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Popup_Default_Table_Row_Value").trim();
			String accessSettings_HolidaySchedule2_Popup_Default_Table_No_Data_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Popup_Default_Table_No_Data_Value").trim();
			String accessSettings_HolidaySchedule2_Popup_Default_Table_Row_Value_Select = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_Popup_Default_Table_Row_Value_Select").trim();
			String accessSettings_HolidaySchedule2_PopupCancel_Type = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_PopupCancel_Type").trim();
			String accessSettings_HolidaySchedule2_PopupCancel_Default_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule2_PopupCancel_Default_Value").trim();
			String accessSettings_HolidaySchedule2_PopupClose_Type = excelFileDataRecord
					.get("accessSettings_HolidaySchedule2_PopupClose_Type").trim();
			if (!accessSettings_HolidaySchedule2_Popup_LabelBasicV.isBlank()
					|| !accessSettings_HolidaySchedule2_PopupSearch_Type.isBlank()
					|| !accessSettings_HolidaySchedule2_PopupSearch_Placeholder.isBlank()
					|| !accessSettings_HolidaySchedule2_PopupSearch_Value.isBlank()
					|| !accessSettings_HolidaySchedule2_Popup_Default_Table_Header_Value.isBlank()
					|| !accessSettings_HolidaySchedule2_Popup_Default_Table_Row_Value.isBlank()
					|| !accessSettings_HolidaySchedule2_Popup_Default_Table_No_Data_Value.isBlank()
					|| !accessSettings_HolidaySchedule2_PopupCancel_Type.isBlank()
					|| !accessSettings_HolidaySchedule2_PopupCancel_Default_Value.isBlank()
					|| !accessSettings_HolidaySchedule2_PopupClose_Type.isBlank()
					|| !accessSettings_HolidaySchedule2_Popup_Default_Table_Row_Value_Select.isBlank()) {
				System.out.println("I am in Holiday Schedule 2 PopUp");
				element_Click(HolidaySchedule2PopupOpenBtn);
				waitForElementVisible(basic_Site_Popup_Label);
				// Pop up Open
				if (!accessSettings_HolidaySchedule2_Popup_LabelBasicV.isBlank()
						&& !accessSettings_HolidaySchedule2_Popup_LabelBasicV.isEmpty()) {
					System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
					assertEquals(basic_Site_Popup_Label.getText(), accessSettings_HolidaySchedule2_Popup_LabelBasicV,
							"Holiday Schedule 2 Pop Up Label Comparision", true, rowNumber, sheetName);
				}
				// Start Search Box
				if (!accessSettings_HolidaySchedule2_PopupSearch_Placeholder.isBlank()
						&& !accessSettings_HolidaySchedule2_PopupSearch_Placeholder.isEmpty()) {
					System.out.println("Element PlaceHolder :"
							+ element_GetAttributeValue(basic_Site_Popup_search, "placeholder"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_search, "placeholder"),
							accessSettings_HolidaySchedule2_PopupSearch_Placeholder,
							"Holiday Schedule 2 Pop Up -> SearchBox PlaceHolder Comparison", true, rowNumber,
							sheetName);
				}
				if (!accessSettings_HolidaySchedule2_PopupSearch_Type.isBlank()
						&& !accessSettings_HolidaySchedule2_PopupSearch_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_search, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_search, "type"),
							accessSettings_HolidaySchedule2_PopupSearch_Type,
							"Holiday Schedule 2 Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule2_PopupSearch_Value.isBlank()
						&& !accessSettings_HolidaySchedule2_PopupSearch_Value.isEmpty()) {
					element_InputText(basic_Site_Popup_search, accessSettings_HolidaySchedule2_PopupSearch_Value);
					Thread.sleep(250);
					element_Click(basic_Site_Popup_search_Button);
					Thread.sleep(250);
				}
				// Table Header Value Checked
				tableHeader_Control_Check_UIValidation("Holiday Schedule 2 Pop Up", rowNumber, sheetName,
						basic_Site_Popup_table_header,
						accessSettings_HolidaySchedule2_Popup_Default_Table_Header_Value);
				Thread.sleep(250);
				// Table Row Value Checked
				tableRow_Control_Check_UIValidation("Holiday Schedule 2 Pop Up Table Row", rowNumber, sheetName,
						basic_Site_Popup_table_Row, "td[@class=\"cursor label-text\"]/label",
						basic_Site_Popup_table_No_Data, accessSettings_HolidaySchedule2_Popup_Default_Table_Row_Value,
						accessSettings_HolidaySchedule2_Popup_Default_Table_No_Data_Value);

				// Cancel Button
				if (!accessSettings_HolidaySchedule2_PopupCancel_Type.isBlank()
						&& !accessSettings_HolidaySchedule2_PopupCancel_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CancelButton, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CancelButton, "type"),
							accessSettings_HolidaySchedule2_PopupCancel_Type,
							"Holiday Schedule 2 Pop Up -> Cencel Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule2_PopupCancel_Default_Value.isBlank()
						&& !accessSettings_HolidaySchedule2_PopupCancel_Default_Value.isEmpty()) {
					System.out.println("Element default Value :"
							+ element_GetAttributeValue(basic_Site_Popup_CancelButton, "value"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CancelButton, "value"),
							accessSettings_HolidaySchedule2_PopupCancel_Default_Value,
							"Holiday Schedule 2 Pop Up -> Cencel Button default value Comparison", true, rowNumber,
							sheetName);
				}
				// Close button
				if (!accessSettings_HolidaySchedule2_PopupClose_Type.isBlank()
						&& !accessSettings_HolidaySchedule2_PopupClose_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"),
							accessSettings_HolidaySchedule2_PopupClose_Type,
							"Holiday Schedule 2 Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule2_Popup_Default_Table_Row_Value_Select.isBlank()
						&& !accessSettings_HolidaySchedule2_Popup_Default_Table_Row_Value_Select.isEmpty()) {
					for (int aa = 0; aa < basic_Site_Popup_table_Row_ValueSelect.size(); aa++) {
						System.out.println(basic_Site_Popup_table_Row_ValueSelect.get(aa).getText());
						if (basic_Site_Popup_table_Row_ValueSelect.get(aa).getText().equalsIgnoreCase(
								accessSettings_HolidaySchedule2_Popup_Default_Table_Row_Value_Select)) {
							basic_Site_Popup_table_Row_ValueSelect.get(aa).click();
							Thread.sleep(250);
							break;
						}
					}

				} else {
					element_Click(basic_Site_Popup_CloseButton);
				}
			}

			// Holiday Schedule 3
			// Holiday Schedule 3 Code Start
			// *******************Holiday Schedule 3 Label And Control*******************
			String accessSettings_HolidaySchedule3Lab = excelFileDataRecord.get("AccessSettings_HolidaySchedule3_label")
					.trim();
			String accessSettings_HolidaySchedule3Ty = excelFileDataRecord.get("AccessSettings_HolidaySchedule3_Type")
					.trim();
			String accessSettings_HolidaySchedule3Vi = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Visibility").trim();
			String accessSettings_HolidaySchedule3P = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Placeholder").trim();
			String accessSettings_HolidaySchedule3_default = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Default_Value").trim();
			String accessSettings_HolidaySchedule3V = excelFileDataRecord.get("AccessSettings_HolidaySchedule3_Value")
					.trim();
			String accessSettings_HolidaySchedule3Negative = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Negative").trim();
			textBox_Control_Check_UIValidation("Holiday Schedule 3", rowNumber, sheetName,
					profile_AccessSettings_HolidaySchedule3Label, profile_AccessSettings_HolidaySchedule3_Id,
					accessSettings_HolidaySchedule3Lab, accessSettings_HolidaySchedule3Ty,
					accessSettings_HolidaySchedule3Vi, accessSettings_HolidaySchedule3P,
					accessSettings_HolidaySchedule3_default, accessSettings_HolidaySchedule3V,
					accessSettings_HolidaySchedule3Negative);
			// *******************Holiday Schedule 3 Name Label And
			// Control*******************

			String accessSettings_HolidaySchedule3_NameTy = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Name_Type").trim();
			String accessSettings_HolidaySchedule3_NameVi = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Name_Visibility").trim();
			String accessSettings_HolidaySchedule3_NameP = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Name_Placeholder").trim();
			String accessSettings_HolidaySchedule3_Name_default = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Name_Default_Value").trim();
			String accessSettings_HolidaySchedule3_NameV = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Name_Value").trim();
			String accessSettings_HolidaySchedule3_NameNegative = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Name_Negative").trim();
			textBox_Control_Check_UIValidation("Holiday Schedule 3", rowNumber, sheetName,
					profile_AccessSettings_HolidaySchedule3Label, profile_AccessSettings_HolidaySchedule3_Name, "",
					accessSettings_HolidaySchedule3_NameTy, accessSettings_HolidaySchedule3_NameVi,
					accessSettings_HolidaySchedule3_NameP, accessSettings_HolidaySchedule3_Name_default,
					accessSettings_HolidaySchedule3_NameV, accessSettings_HolidaySchedule3_NameNegative);

			// *******************Start Holiday Schedule 3 Pop Up Button And
			// Control*******************
			String accessSettings_HolidaySchedule3_Popup_LabelBasicV = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Popup_Label").trim();
			String accessSettings_HolidaySchedule3_PopupSearch_Type = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_PopUpSearch_Type").trim();
			String accessSettings_HolidaySchedule3_PopupSearch_Placeholder = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_PopupSearch_Placeholder").trim();
			String accessSettings_HolidaySchedule3_PopupSearch_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_PopupSearch_Value").trim();
			String accessSettings_HolidaySchedule3_Popup_Default_Table_Header_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Popup_Default_Table_Header_Value").trim();
			String accessSettings_HolidaySchedule3_Popup_Default_Table_Row_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Popup_Default_Table_Row_Value").trim();
			String accessSettings_HolidaySchedule3_Popup_Default_Table_No_Data_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Popup_Default_Table_No_Data_Value").trim();
			String accessSettings_HolidaySchedule3_Popup_Default_Table_Row_Value_Select = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_Popup_Default_Table_Row_Value_Select").trim();
			String accessSettings_HolidaySchedule3_PopupCancel_Type = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_PopupCancel_Type").trim();
			String accessSettings_HolidaySchedule3_PopupCancel_Default_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule3_PopupCancel_Default_Value").trim();
			String accessSettings_HolidaySchedule3_PopupClose_Type = excelFileDataRecord
					.get("accessSettings_HolidaySchedule3_PopupClose_Type").trim();
			if (!accessSettings_HolidaySchedule3_Popup_LabelBasicV.isBlank()
					|| !accessSettings_HolidaySchedule3_PopupSearch_Type.isBlank()
					|| !accessSettings_HolidaySchedule3_PopupSearch_Placeholder.isBlank()
					|| !accessSettings_HolidaySchedule3_PopupSearch_Value.isBlank()
					|| !accessSettings_HolidaySchedule3_Popup_Default_Table_Header_Value.isBlank()
					|| !accessSettings_HolidaySchedule3_Popup_Default_Table_Row_Value.isBlank()
					|| !accessSettings_HolidaySchedule3_Popup_Default_Table_No_Data_Value.isBlank()
					|| !accessSettings_HolidaySchedule3_PopupCancel_Type.isBlank()
					|| !accessSettings_HolidaySchedule3_PopupCancel_Default_Value.isBlank()
					|| !accessSettings_HolidaySchedule3_PopupClose_Type.isBlank()
					|| !accessSettings_HolidaySchedule3_Popup_Default_Table_Row_Value_Select.isBlank()) {
				System.out.println("I am in Holiday Schedule 3 PopUp");
				element_Click(HolidaySchedule3PopupOpenBtn);
				waitForElementVisible(basic_Site_Popup_Label);
				// Pop up Open
				if (!accessSettings_HolidaySchedule3_Popup_LabelBasicV.isBlank()
						&& !accessSettings_HolidaySchedule3_Popup_LabelBasicV.isEmpty()) {
					System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
					assertEquals(basic_Site_Popup_Label.getText(), accessSettings_HolidaySchedule3_Popup_LabelBasicV,
							"Holiday Schedule 3 Pop Up Label Comparision", true, rowNumber, sheetName);
				}
				// Start Search Box
				if (!accessSettings_HolidaySchedule3_PopupSearch_Placeholder.isBlank()
						&& !accessSettings_HolidaySchedule3_PopupSearch_Placeholder.isEmpty()) {
					System.out.println("Element PlaceHolder :"
							+ element_GetAttributeValue(basic_Site_Popup_search, "placeholder"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_search, "placeholder"),
							accessSettings_HolidaySchedule3_PopupSearch_Placeholder,
							"Holiday Schedule 3 Pop Up -> SearchBox PlaceHolder Comparison", true, rowNumber,
							sheetName);
				}
				if (!accessSettings_HolidaySchedule3_PopupSearch_Type.isBlank()
						&& !accessSettings_HolidaySchedule3_PopupSearch_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_search, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_search, "type"),
							accessSettings_HolidaySchedule3_PopupSearch_Type,
							"Holiday Schedule 3 Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule3_PopupSearch_Value.isBlank()
						&& !accessSettings_HolidaySchedule3_PopupSearch_Value.isEmpty()) {
					element_InputText(basic_Site_Popup_search, accessSettings_HolidaySchedule3_PopupSearch_Value);
					Thread.sleep(250);
					element_Click(basic_Site_Popup_search_Button);
					Thread.sleep(250);
				}
				// Table Header Value Checked
				tableHeader_Control_Check_UIValidation("Holiday Schedule 3 Pop Up", rowNumber, sheetName,
						basic_Site_Popup_table_header,
						accessSettings_HolidaySchedule3_Popup_Default_Table_Header_Value);
				Thread.sleep(250);
				// Table Row Value Checked
				tableRow_Control_Check_UIValidation("Holiday Schedule 3 Pop Up Table Row", rowNumber, sheetName,
						basic_Site_Popup_table_Row, "td[@class=\"cursor label-text\"]/label",
						basic_Site_Popup_table_No_Data, accessSettings_HolidaySchedule3_Popup_Default_Table_Row_Value,
						accessSettings_HolidaySchedule3_Popup_Default_Table_No_Data_Value);

				// Cancel Button
				if (!accessSettings_HolidaySchedule3_PopupCancel_Type.isBlank()
						&& !accessSettings_HolidaySchedule3_PopupCancel_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CancelButton, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CancelButton, "type"),
							accessSettings_HolidaySchedule3_PopupCancel_Type,
							"Holiday Schedule 3 Pop Up -> Cencel Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule3_PopupCancel_Default_Value.isBlank()
						&& !accessSettings_HolidaySchedule3_PopupCancel_Default_Value.isEmpty()) {
					System.out.println("Element default Value :"
							+ element_GetAttributeValue(basic_Site_Popup_CancelButton, "value"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CancelButton, "value"),
							accessSettings_HolidaySchedule3_PopupCancel_Default_Value,
							"Holiday Schedule 3 Pop Up -> Cencel Button default value Comparison", true, rowNumber,
							sheetName);
				}
				// Close button
				if (!accessSettings_HolidaySchedule3_PopupClose_Type.isBlank()
						&& !accessSettings_HolidaySchedule3_PopupClose_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"),
							accessSettings_HolidaySchedule3_PopupClose_Type,
							"Holiday Schedule 3 Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule3_Popup_Default_Table_Row_Value_Select.isBlank()
						&& !accessSettings_HolidaySchedule3_Popup_Default_Table_Row_Value_Select.isEmpty()) {
					for (int aa = 0; aa < basic_Site_Popup_table_Row_ValueSelect.size(); aa++) {
						System.out.println(basic_Site_Popup_table_Row_ValueSelect.get(aa).getText());
						if (basic_Site_Popup_table_Row_ValueSelect.get(aa).getText().equalsIgnoreCase(
								accessSettings_HolidaySchedule3_Popup_Default_Table_Row_Value_Select)) {
							basic_Site_Popup_table_Row_ValueSelect.get(aa).click();
							Thread.sleep(250);
							break;
						}
					}

				} else {
					element_Click(basic_Site_Popup_CloseButton);
				}
			}

			// Holiday Schedule 4 Code Start
			// *******************Holiday Schedule 4 Label And Control*******************
			String accessSettings_HolidaySchedule4Lab = excelFileDataRecord.get("AccessSettings_HolidaySchedule4_label")
					.trim();
			String accessSettings_HolidaySchedule4Ty = excelFileDataRecord.get("AccessSettings_HolidaySchedule4_Type")
					.trim();
			String accessSettings_HolidaySchedule4Vi = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Visibility").trim();
			String accessSettings_HolidaySchedule4P = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Placeholder").trim();
			String accessSettings_HolidaySchedule4_default = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Default_Value").trim();
			String accessSettings_HolidaySchedule4V = excelFileDataRecord.get("AccessSettings_HolidaySchedule4_Value")
					.trim();
			String accessSettings_HolidaySchedule4Negative = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Negative").trim();
			textBox_Control_Check_UIValidation("Holiday Schedule 4", rowNumber, sheetName,
					profile_AccessSettings_HolidaySchedule4Label, profile_AccessSettings_HolidaySchedule4_Id,
					accessSettings_HolidaySchedule4Lab, accessSettings_HolidaySchedule4Ty,
					accessSettings_HolidaySchedule4Vi, accessSettings_HolidaySchedule4P,
					accessSettings_HolidaySchedule4_default, accessSettings_HolidaySchedule4V,
					accessSettings_HolidaySchedule4Negative);
			// *******************Holiday Schedule 4 Name Label And
			// Control*******************

			String accessSettings_HolidaySchedule4_NameTy = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Name_Type").trim();
			String accessSettings_HolidaySchedule4_NameVi = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Name_Visibility").trim();
			String accessSettings_HolidaySchedule4_NameP = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Name_Placeholder").trim();
			String accessSettings_HolidaySchedule4_Name_default = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Name_Default_Value").trim();
			String accessSettings_HolidaySchedule4_NameV = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Name_Value").trim();
			String accessSettings_HolidaySchedule4_NameNegative = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Name_Negative").trim();
			textBox_Control_Check_UIValidation("Holiday Schedule 4", rowNumber, sheetName,
					profile_AccessSettings_HolidaySchedule4Label, profile_AccessSettings_HolidaySchedule4_Name, "",
					accessSettings_HolidaySchedule4_NameTy, accessSettings_HolidaySchedule4_NameVi,
					accessSettings_HolidaySchedule4_NameP, accessSettings_HolidaySchedule4_Name_default,
					accessSettings_HolidaySchedule4_NameV, accessSettings_HolidaySchedule4_NameNegative);

			// *******************Start Holiday Schedule 4 Pop Up Button And
			// Control*******************
			String accessSettings_HolidaySchedule4_Popup_LabelBasicV = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Popup_Label").trim();
			String accessSettings_HolidaySchedule4_PopupSearch_Type = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_PopUpSearch_Type").trim();
			String accessSettings_HolidaySchedule4_PopupSearch_Placeholder = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_PopupSearch_Placeholder").trim();
			String accessSettings_HolidaySchedule4_PopupSearch_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_PopupSearch_Value").trim();
			String accessSettings_HolidaySchedule4_Popup_Default_Table_Header_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Popup_Default_Table_Header_Value").trim();
			String accessSettings_HolidaySchedule4_Popup_Default_Table_Row_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Popup_Default_Table_Row_Value").trim();
			String accessSettings_HolidaySchedule4_Popup_Default_Table_No_Data_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Popup_Default_Table_No_Data_Value").trim();
			String accessSettings_HolidaySchedule4_Popup_Default_Table_Row_Value_Select = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_Popup_Default_Table_Row_Value_Select").trim();
			String accessSettings_HolidaySchedule4_PopupCancel_Type = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_PopupCancel_Type").trim();
			String accessSettings_HolidaySchedule4_PopupCancel_Default_Value = excelFileDataRecord
					.get("AccessSettings_HolidaySchedule4_PopupCancel_Default_Value").trim();
			String accessSettings_HolidaySchedule4_PopupClose_Type = excelFileDataRecord
					.get("accessSettings_HolidaySchedule4_PopupClose_Type").trim();
			if (!accessSettings_HolidaySchedule4_Popup_LabelBasicV.isBlank()
					|| !accessSettings_HolidaySchedule4_PopupSearch_Type.isBlank()
					|| !accessSettings_HolidaySchedule4_PopupSearch_Placeholder.isBlank()
					|| !accessSettings_HolidaySchedule4_PopupSearch_Value.isBlank()
					|| !accessSettings_HolidaySchedule4_Popup_Default_Table_Header_Value.isBlank()
					|| !accessSettings_HolidaySchedule4_Popup_Default_Table_Row_Value.isBlank()
					|| !accessSettings_HolidaySchedule4_Popup_Default_Table_No_Data_Value.isBlank()
					|| !accessSettings_HolidaySchedule4_PopupCancel_Type.isBlank()
					|| !accessSettings_HolidaySchedule4_PopupCancel_Default_Value.isBlank()
					|| !accessSettings_HolidaySchedule4_PopupClose_Type.isBlank()
					|| !accessSettings_HolidaySchedule4_Popup_Default_Table_Row_Value_Select.isBlank()) {
				System.out.println("I am in Holiday Schedule 4 PopUp");
				element_Click(HolidaySchedule4PopupOpenBtn);
				waitForElementVisible(basic_Site_Popup_Label);
				// Pop up Open
				if (!accessSettings_HolidaySchedule4_Popup_LabelBasicV.isBlank()
						&& !accessSettings_HolidaySchedule4_Popup_LabelBasicV.isEmpty()) {
					System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
					assertEquals(basic_Site_Popup_Label.getText(), accessSettings_HolidaySchedule4_Popup_LabelBasicV,
							"Holiday Schedule 4 Pop Up Label Comparision", true, rowNumber, sheetName);
				}
				// Start Search Box
				if (!accessSettings_HolidaySchedule4_PopupSearch_Placeholder.isBlank()
						&& !accessSettings_HolidaySchedule4_PopupSearch_Placeholder.isEmpty()) {
					System.out.println("Element PlaceHolder :"
							+ element_GetAttributeValue(basic_Site_Popup_search, "placeholder"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_search, "placeholder"),
							accessSettings_HolidaySchedule4_PopupSearch_Placeholder,
							"Holiday Schedule 4 Pop Up -> SearchBox PlaceHolder Comparison", true, rowNumber,
							sheetName);
				}
				if (!accessSettings_HolidaySchedule4_PopupSearch_Type.isBlank()
						&& !accessSettings_HolidaySchedule4_PopupSearch_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_search, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_search, "type"),
							accessSettings_HolidaySchedule4_PopupSearch_Type,
							"Holiday Schedule 4 Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule4_PopupSearch_Value.isBlank()
						&& !accessSettings_HolidaySchedule4_PopupSearch_Value.isEmpty()) {
					element_InputText(basic_Site_Popup_search, accessSettings_HolidaySchedule4_PopupSearch_Value);
					Thread.sleep(250);
					element_Click(basic_Site_Popup_search_Button);
					Thread.sleep(250);
				}
				// Table Header Value Checked
				tableHeader_Control_Check_UIValidation("Holiday Schedule 4 Pop Up", rowNumber, sheetName,
						basic_Site_Popup_table_header,
						accessSettings_HolidaySchedule4_Popup_Default_Table_Header_Value);
				Thread.sleep(250);
				// Table Row Value Checked
				tableRow_Control_Check_UIValidation("Holiday Schedule 4 Pop Up Table Row", rowNumber, sheetName,
						basic_Site_Popup_table_Row, "td[@class=\"cursor label-text\"]/label",
						basic_Site_Popup_table_No_Data, accessSettings_HolidaySchedule4_Popup_Default_Table_Row_Value,
						accessSettings_HolidaySchedule4_Popup_Default_Table_No_Data_Value);

				// Cancel Button
				if (!accessSettings_HolidaySchedule4_PopupCancel_Type.isBlank()
						&& !accessSettings_HolidaySchedule4_PopupCancel_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CancelButton, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CancelButton, "type"),
							accessSettings_HolidaySchedule4_PopupCancel_Type,
							"Holiday Schedule 4 Pop Up -> Cencel Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule4_PopupCancel_Default_Value.isBlank()
						&& !accessSettings_HolidaySchedule4_PopupCancel_Default_Value.isEmpty()) {
					System.out.println("Element default Value :"
							+ element_GetAttributeValue(basic_Site_Popup_CancelButton, "value"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CancelButton, "value"),
							accessSettings_HolidaySchedule4_PopupCancel_Default_Value,
							"Holiday Schedule 4 Pop Up -> Cencel Button default value Comparison", true, rowNumber,
							sheetName);
				}
				// Close button
				if (!accessSettings_HolidaySchedule4_PopupClose_Type.isBlank()
						&& !accessSettings_HolidaySchedule4_PopupClose_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
					assertEquals(element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"),
							accessSettings_HolidaySchedule4_PopupClose_Type,
							"Holiday Schedule 4 Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!accessSettings_HolidaySchedule4_Popup_Default_Table_Row_Value_Select.isBlank()
						&& !accessSettings_HolidaySchedule4_Popup_Default_Table_Row_Value_Select.isEmpty()) {
					for (int aa = 0; aa < basic_Site_Popup_table_Row_ValueSelect.size(); aa++) {
						System.out.println(basic_Site_Popup_table_Row_ValueSelect.get(aa).getText());
						if (basic_Site_Popup_table_Row_ValueSelect.get(aa).getText().equalsIgnoreCase(
								accessSettings_HolidaySchedule4_Popup_Default_Table_Row_Value_Select)) {
							basic_Site_Popup_table_Row_ValueSelect.get(aa).click();
							Thread.sleep(250);
							break;
						}
					}

				} else {
					element_Click(basic_Site_Popup_CloseButton);
				}
			}

			// Device Access Schedule - dropdown
			String accessSettings_DeviceAccessSchedule_label = excelFileDataRecord
					.get("AccessSettings_DeviceAccessSchedule_label").trim();
			String accessSettings_DeviceAccessSchedule_Type = excelFileDataRecord
					.get("AccessSettings_DeviceAccessSchedule_Type").trim();
			String accessSettings_DeviceAccessSchedule_Visibility = excelFileDataRecord
					.get("AccessSettings_DeviceAccessSchedule_Visibility").trim();
			String accessSettings_DeviceAccessSchedule_Default_Value = excelFileDataRecord
					.get("AccessSettings_DeviceAccessSchedule_Default_Value").trim();
			String accessSettings_DeviceAccessSchedule_Values = excelFileDataRecord
					.get("AccessSettings_DeviceAccessSchedule_Values").trim();
			String accessSettings_DeviceAccessSchedule_Select_Values = excelFileDataRecord
					.get("AccessSettings_DeviceAccessSchedule_Select_Values").trim();
			String accessSettings_DeviceAccessSchedule_visibleOrNot = excelFileDataRecord
					.get("AccessSettings_DeviceAccessSchedule_visibleOrNot").trim();
			dropDown_Check_UIValidation("Device Access Schedule", rowNumber, sheetName,
					profile_AccessSettings_DeviceAccessScheduleLabel, profile_AccessSettings_DeviceAccessSchedule,
					profile_AccessSettings_DeviceAccessSchedule_Size, accessSettings_DeviceAccessSchedule_label,
					accessSettings_DeviceAccessSchedule_Type, accessSettings_DeviceAccessSchedule_Visibility,
					accessSettings_DeviceAccessSchedule_Default_Value,
					accessSettings_DeviceAccessSchedule_Select_Values, accessSettings_DeviceAccessSchedule_Values,
					accessSettings_DeviceAccessSchedule_visibleOrNot);

			// *******************Device Access Schedule Info Icon - Info
			// Icon*******************
			String infoIconVisibility = excelFileDataRecord.get("DeviceAccessSchedule_InfoIcon_Visibility").trim();
			String infoIconTooltip = excelFileDataRecord.get("DeviceAccessSchedule_InfoIcon_Tooltip").trim();

			infoIcon_UIValidation("Device Access Schedule", rowNumber, sheetName,
					profile_AccessSettings_DeviceAccessScheduleLabelInfoIcon, infoIconVisibility, infoIconTooltip);

			// Working Days Checkbox
			for (WebElement parent : profile_AccessSettings_WorkingDays) {
				WebElement checkbox = parent.findElement(By.xpath(".//input[contains(@id,'chkActiveDays')]"));
				String dayText = parent.findElement(By.xpath(".//label")).getText().trim();

				String labelKey = "WorkingDay_" + dayText + "_label";
				String typeKey = "WorkingDay_" + dayText + "_type";
				String visibilityKey = "WorkingDay_" + dayText + "_visibility";
				String defaultValueKey = "WorkingDay_" + dayText + "_default";
				String valueKey = "WorkingDay_" + dayText + "_value";

				String dayLabel = excelFileDataRecord.containsKey(labelKey) ? excelFileDataRecord.get(labelKey).trim()
						: "";
				String dayType = excelFileDataRecord.containsKey(typeKey) ? excelFileDataRecord.get(typeKey).trim()
						: "";
				String dayVisibility = excelFileDataRecord.containsKey(visibilityKey)
						? excelFileDataRecord.get(visibilityKey).trim()
						: "";
				String dayDefault = excelFileDataRecord.containsKey(defaultValueKey)
						? excelFileDataRecord.get(defaultValueKey).trim()
						: "";
				String dayValue = excelFileDataRecord.containsKey(valueKey) ? excelFileDataRecord.get(valueKey).trim()
						: "";

				checkbox_Check_UIValidation("Working Day - " + dayText, rowNumber, sheetName,
						parent.findElement(By.xpath(".//label")), checkbox, dayLabel, dayType, dayVisibility,
						dayDefault, dayValue);

			}

			// Save button then checked main validation
			Thread.sleep(500);
			saveButtonClick();
			valMsg = validationMessage();
			String excelVal = excelFileDataRecord.get("Validation").trim();
			if (!excelVal.isBlank() && !excelVal.isEmpty()) {
				assertEquals(valMsg, excelFileDataRecord.get("Validation").trim(),
						"Main Validation on Save button Comparison", true, rowNumber, sheetName);
			}
			Thread.sleep(1500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			reloadPageButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));

		}
	}

	// ******************* Enrollment Tab *********************

	@FindBy(xpath = "//label[text()=\"Enrollment\"]")
	private WebElement enrollment_Tab_Control;

	@FindBy(xpath = "//label[text()=\"Enrollment\"]/ancestor::li[1]")
	private WebElement enrollment_Tab_Control_ActiveOrNot;

	@FindBy(xpath = "//label[text()=\"Settings\"]")
	private WebElement enrollmentTab_Settings_SubTab;

	@FindBy(xpath = "//label[text()=\"Settings\"]/ancestor::li[1]")
	private WebElement enrollmentTab_Settings_SubTab_ActiveOrNot;

	@FindBy(name = "chkdfltEnrlMode")
	private WebElement enrollmentTab_Settings_SubTab_EnrollfromDevice;

	@FindBy(xpath = "//*[@name=\"chkdfltEnrlMode\"]/ancestor::div[@class='form-group']//mx-label")
	private WebElement enrollmentTab_Settings_SubTab_EnrollfromDevice_Label;

	@FindBy(id = "cboEnrolMode")
	private WebElement enrollmentTab_Settings_SubTab_EnrollmentMode;

	@FindBy(xpath = "//*[@name=\"cboEnrolMode\"]/ancestor::div[@class='form-group']//mx-label")
	private WebElement enrollmentTab_Settings_SubTab_EnrollmentMode_Label;

	@FindBy(id = "cboNoofCards")
	private WebElement enrollmentTab_Settings_SubTab_NumberofCards;

	@FindBy(xpath = "//*[@name=\"cboNoofCards\"]/ancestor::div[@class='form-group']//mx-label")
	private WebElement enrollmentTab_Settings_SubTab_NumberofCards_Label;

	@FindBy(xpath = "//label[text()=\"Temporary User\"]")
	private WebElement enrollmentTab_TemporaryUser_SubTab;

	@FindBy(xpath = "//label[text()=\"Temporary User\"]/ancestor::li[1]")
	private WebElement enrollmentTab_TemporaryUser_SubTab_ActiveOrNot;

	@FindBy(id = "ddlTmpUsrDrpdwn")
	private WebElement enrollmentTab_TemporaryUser_SubTab_TemporaryAdditionofUnknownUser;

	@FindBy(xpath = "//*[@name=\"ddlTmpUsrDrpdwn\"]/ancestor::div[@class='form-group']//mx-label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_NumberofCards_Label;

	@FindBy(xpath = "//*[@name=\"ddlTmpUsrDrpdwn\"]/ancestor::div[@class='form-group']/label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_NumberofCards_Info;

	@FindBy(name = "TmpUserConfirmFlg")
	private WebElement enrollmentTab_TemporaryUser_SubTab_ConfirmbeforeaddingTemporaryUser;

	@FindBy(xpath = "//*[@name='TmpUserConfirmFlg']/ancestor::div[@class='form-group']//mx-label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_ConfirmbeforeaddingTemporaryUser_Label;

	@FindBy(id = "TmpUsrSkillID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_skillId;

	@FindBy(xpath = "(//*[@id=\"ddlTmpUsrDrpdwn\"]/ancestor::div[@class=\"form-group\"]/following-sibling::div//fieldset)[2]/div[not(@hidden)]")
	private List<WebElement> enrollmentTab_TemporaryUser_SubTab_skillId_Size;

	@FindBy(id = "TmpUsrSkillName")
	private WebElement enrollmentTab_TemporaryUser_SubTab_skillName;

	@FindBy(xpath = "//*[@id=\"TmpUsrSkillID\"]/ancestor::div[@class='form-group']//label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_skillLabel;

	@FindBy(xpath = "//*[@id='TmpUsrSkillName']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_skill_multiplesiteButton;

	@FindBy(id = "TmpUsrContractorID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_ContractorId;

	@FindBy(id = "TmpUsrContractorName")
	private WebElement enrollmentTab_TemporaryUser_SubTab_ContractorName;

	@FindBy(xpath = "//*[@id=\"TmpUsrContractorID\"]/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_ContractorLabel;

	@FindBy(xpath = "//*[@id=\"TmpUsrContractorID\"]/ancestor::div[@class='form-group']/label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_ContractorLabel_info;

	@FindBy(xpath = "//*[@id='TmpUsrContractorName']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_Contractor_multiplesiteButton;

	@FindBy(id = "TmpUsrWorkOrderID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_WorkOrderId;

	@FindBy(id = "TmpUsrWorkOrderName")
	private WebElement enrollmentTab_TemporaryUser_SubTab_WorkOrderName;

	@FindBy(xpath = "//*[@id=\"TmpUsrWorkOrderID\"]/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_WorkOrderLabel;

	@FindBy(xpath = "//*[@id=\"TmpUsrWorkOrderID\"]/ancestor::div[@class='form-group']/label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_WorkOrderLabel_info;

	@FindBy(xpath = "//*[@id='TmpUsrWorkOrderName']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_WorkOrder_multiplesiteButton;

	@FindBy(id = "_TxtAssignmentStartDate")
	private WebElement enrollmentTab_TemporaryUser_SubTab_AssignmentPeriodFrom;

	@FindBy(id = "_TxtAssignmentEndDate")
	private WebElement enrollmentTab_TemporaryUser_SubTab_AssignmentPeriodTo;

	@FindBy(xpath = "//*[@id=\"_TxtAssignmentStartDate\"]/ancestor::div[@class='form-group']//mx-label/label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_AssignmentPeriodFromLabel;

	@FindBy(xpath = "//*[@id=\"_TxtAssignmentStartDate\"]/ancestor::div[@class='form-group']/label")
	private WebElement enrollmentTab_TemporaryUser_SubTabAssignmentPeriodFromLabel_info;

	// Auto Generate ID
	@FindBy(xpath = "//*[text()='Auto Generate ID']")
	private WebElement enrollmentTab_TemporaryUser_SubTab_AutoGenerateID_Label;

	@FindBy(id = "UserIDTextArea")
	private WebElement enrollmentTab_TemporaryUser_SubTab_IDFormat;

	@FindBy(xpath = "//*[@name='TmpUserIDFormat']/ancestor::div[@class='form-group']//mx-label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_IDFormat_Label;

	@FindBy(xpath = "//*[@name='TmpUserIDFormat']/ancestor::div[@class='form-group']/div[3]/label[1]")
	private WebElement enrollmentTab_TemporaryUser_SubTab_IDFormat_CopyButton;

	@FindBy(xpath = "//*[@name='TmpUserIDFormat']/ancestor::div[@class='form-group']/div[3]/label[2]")
	private WebElement enrollmentTab_TemporaryUser_SubTab_IDFormat_Info;

	@FindBy(xpath = "//*[@id='ngb-typeahead-5']/button/ngb-highlight")
	private WebElement enrollmentTab_TemporaryUser_SubTab_IDFormat_suggestionDD;

	@FindBy(id = "idTmpUserIDLength")
	private WebElement enrollmentTab_TemporaryUser_SubTab_NumericValueLength;

	@FindBy(xpath = "//*[@id='idTmpUserIDLength']/ancestor::div[@class='form-group']//mx-label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_NumericValueLength_Label;

	@FindBy(name = "TmpUserIDZeroPaddFlg")
	private WebElement enrollmentTab_TemporaryUser_SubTab_ZeroPaddingrequired;

	@FindBy(xpath = "//*[@name='TmpUserIDZeroPaddFlg']/ancestor::div[@class='form-group']//mx-label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_ZeroPaddingrequired_Label;

	// Auto Generate Name
	@FindBy(xpath = "//*[text()='Auto Generate Name']")
	private WebElement enrollmentTab_TemporaryUser_SubTab_AutoGenerateName_Label;

	@FindBy(name = "TmpUserNameViaDeviceFlg")
	private WebElement enrollmentTab_TemporaryUser_SubTab_AddNameviaDevice;

	@FindBy(xpath = "//*[@name='TmpUserNameViaDeviceFlg']/ancestor::div[@class='form-group']//mx-label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_AddNameviaDevice_Label;

	@FindBy(id = "UserNameTextArea")
	private WebElement enrollmentTab_TemporaryUser_SubTab_NameFormat;

	@FindBy(xpath = "//*[@id='UserNameTextArea']/ancestor::div[@class='form-group']//mx-label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_NameFormat_Label;

	@FindBy(xpath = "//*[@id='UserNameTextArea']/ancestor::div[@class='form-group']/div[3]/label[1]")
	private WebElement enrollmentTab_TemporaryUser_SubTab_NameFormat_CopyButton;

	@FindBy(xpath = "//*[@id='UserNameTextArea']/ancestor::div[@class='form-group']/div[3]/label[2]")
	private WebElement enrollmentTab_TemporaryUser_SubTab_NameFormat_Info;

	@FindBy(xpath = "//*[@id='ngb-typeahead-6']/button/ngb-highlight")
	private WebElement enrollmentTab_TemporaryUser_SubTab_NameFormat_suggestionDD;

	// Group
	@FindBy(xpath = "//*[text()='Group']")
	private WebElement enrollmentTab_TemporaryUser_SubTab_Group_Label;

	@FindBy(id = "orgID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_OrganizationId;

	@FindBy(id = "orgName")
	private WebElement enrollmentTab_TemporaryUser_SubTab_OrganizationName;

	@FindBy(xpath = "//*[@id=\"orgID\"]/ancestor::div[@class='form-group']//label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_OrganizationLabel;

	@FindBy(xpath = "//*[@id='orgName']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_Organization_multiplesiteButton;

	@FindBy(id = "branchID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_BranchId;

	@FindBy(id = "branchName")
	private WebElement enrollmentTab_TemporaryUser_SubTab_BranchName;

	@FindBy(xpath = "//*[@id=\"branchID\"]/ancestor::div[@class='form-group']//label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_BranchLabel;

	@FindBy(xpath = "//*[@id='branchName']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_Branch_multiplesiteButton;

	@FindBy(id = "deptID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_DepartmentId;

	@FindBy(id = "deptName")
	private WebElement enrollmentTab_TemporaryUser_SubTab_DepartmentName;

	@FindBy(xpath = "//*[@id=\"deptID\"]/ancestor::div[@class='form-group']//label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_DepartmentLabel;

	@FindBy(xpath = "//*[@id='deptName']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_Department_multiplesiteButton;

	@FindBy(id = "secID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_SectionId;

	@FindBy(id = "secName")
	private WebElement enrollmentTab_TemporaryUser_SubTab_SectionName;

	@FindBy(xpath = "//*[@id=\"secID\"]/ancestor::div[@class='form-group']//label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_SectionLabel;

	@FindBy(xpath = "//*[@id='secName']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_Section_multiplesiteButton;

	@FindBy(id = "catID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CategoryId;

	@FindBy(id = "catName")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CategoryName;

	@FindBy(xpath = "//*[@id=\"catID\"]/ancestor::div[@class='form-group']//label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CategoryLabel;

	@FindBy(xpath = "//*[@id='catName']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_Category_multiplesiteButton;

	@FindBy(id = "gradeID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_GradeId;

	@FindBy(id = "gradeName")
	private WebElement enrollmentTab_TemporaryUser_SubTab_GradeName;

	@FindBy(xpath = "//*[@id=\"gradeID\"]/ancestor::div[@class='form-group']//label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_GradeLabel;

	@FindBy(xpath = "//*[@id='gradeName']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_Grade_multiplesiteButton;

	@FindBy(id = "desgID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_DesignationId;

	@FindBy(id = "desgName")
	private WebElement enrollmentTab_TemporaryUser_SubTab_DesignationName;

	@FindBy(xpath = "//*[@id=\"desgID\"]/ancestor::div[@class='form-group']//label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_DesignationLabel;

	@FindBy(xpath = "//*[@id='desgName']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_Designation_multiplesiteButton;

	@FindBy(id = "cg1ID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup1Id;

	@FindBy(id = "cg1Name")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup1Name;

	@FindBy(xpath = "//*[@id=\"cg1ID\"]/ancestor::div[@class='form-group']//label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup1Label;

	@FindBy(xpath = "//*[@id='cg1Name']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup1_multiplesiteButton;

	@FindBy(id = "cg2ID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup2Id;

	@FindBy(id = "cg2Name")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup2Name;

	@FindBy(xpath = "//*[@id=\"cg2ID\"]/ancestor::div[@class='form-group']//label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup2Label;

	@FindBy(xpath = "//*[@id='cg2Name']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup2_multiplesiteButton;

	@FindBy(id = "cg3ID")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup3Id;

	@FindBy(id = "cg3Name")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup3Name;

	@FindBy(xpath = "//*[@id=\"cg3ID\"]/ancestor::div[@class='form-group']//label")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup3Label;

	@FindBy(xpath = "//*[@id='cg3Name']/following-sibling::span[1]//i")
	private WebElement enrollmentTab_TemporaryUser_SubTab_CustomGroup3_multiplesiteButton;

	// Pop Up common Xpath start
	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@class=\"mx-input-theme label-bold label-text\"]")
	private WebElement common_Popup_Label;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement common_Popup_search;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@name=\"cmnTxtSearch\"]//ancestor::div[1]/i")
	private WebElement common_Popup_search_Button;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/thead//label")
	private List<WebElement> common_Popup_table_header;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/tbody//tr")
	private List<WebElement> common_Popup_table_Row;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@key=\"No Data Found\"]/label")
	private WebElement common_Popup_table_No_Data;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/tbody//tr/td[@class=\"cursor label-text\"][2]/label")
	private List<WebElement> common_Popup_table_Row_ValueSelect;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@key=\"Cancel\"]")
	private WebElement common_Popup_CancelButton;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@class=\"close\"]")
	private WebElement common_Popup_CloseButton;
	// Pop Up common Xpath End

	public void deviceUIControlValidation_Enrollment(List<Map<String, String>> data, String sheetName)
			throws Exception {
		for (int i = 0; i < data.size(); i++) {
			eachRowStatus = false;
			String valMsg = null;
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			Map<String, String> excelFileDataRecord = data.get(i);
			logger.info("***********************************Excel Data Record Picked : Row Number = " + i + " Data is ="
					+ excelFileDataRecord);
			int rowNumber = Integer.parseInt(excelFileDataRecord.get("RowNumber"));
			addButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			waitForElementVisible_TimeinMinutes(selectDeviceTypeBeAddedpopUp, 2);
			for (int j = 0; j < selectDeviceTypeToBeAdded.size(); j++) {
				String title = selectDeviceTypeToBeAdded.get(j).getAttribute("title");
				if (title.equalsIgnoreCase(excelFileDataRecord.get("DeviceType"))) {
					selectDeviceTypeToBeAdded.get(j).click();
					Thread.sleep(500);
					waitForElementClickable(deviceContinue);
					element_Click(deviceContinue);
					Thread.sleep(500);
					break;
				}
			}
			Thread.sleep(500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementClickable(active, 1);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			// *******************Start Device Name Textbox And Control*******************

			String deviceNameV = excelFileDataRecord.get("DeviceName_Value").trim();
			textBox_Control_Check_UIValidation("Device Name", rowNumber, sheetName, deviceidNameLabel, deviceNameTxt,
					"", "", "", "", "", deviceNameV, "");

			// *******************Start Mac Address Textbox And Control*******************
			String macAddressV = excelFileDataRecord.get("MacAddress_Value").trim();
			if (!macAddressV.isBlank() && !macAddressV.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				String[] macs = macAddressV.split(":");
				for (int x = 0; x < macAddressTxt.size(); x++) {
					macAddressTxt.get(x).sendKeys(macs[x]);
				}
			}

			// **********************Start Enrollment Tab***********************************
			String enrollment_label = excelFileDataRecord.get("Enrollment_label").trim();
			String enrollment_Default = excelFileDataRecord.get("Enrollment_Default").trim();
			String enrollment_Select = excelFileDataRecord.get("Enrollment_Select").trim();
			if (!enrollment_label.isBlank() && !enrollment_label.isEmpty()) {
				assertEquals(enrollment_Tab_Control.getText(), enrollment_label,
						"Enrollment Tab Control Label Comparision", true, rowNumber, sheetName);
			}
			if (!enrollment_Select.isBlank() && !enrollment_Select.isEmpty()) {
				element_Click(enrollment_Tab_Control);
				Thread.sleep(250);
			}
			if (!enrollment_Default.isBlank() && !enrollment_Default.isEmpty()) {
				String deviceGetID = enrollment_Tab_Control_ActiveOrNot.getAttribute("class");
				String value = null;
				if (deviceGetID.toLowerCase().contains("tab-active")) {
					value = "tab-active";
				} else {
					value = "tab-non-active";
				}
				assertEquals(value, enrollment_Default, "Enrollment Tab Control Label Comparision", true, rowNumber,
						sheetName);
			}

			// **********************Start Enrollment -Setting
			// subTab***********************************
			String settings_label = excelFileDataRecord.get("Settings_label").trim();
			String settings_Default = excelFileDataRecord.get("Settings_Default").trim();
			if (!settings_label.isBlank() && !settings_label.isEmpty()) {
				assertEquals(enrollmentTab_Settings_SubTab.getText(), settings_label,
						"Enrollment Tab-> Setting Sub tab Control Label Comparision", true, rowNumber, sheetName);
			}
			if (!settings_Default.isBlank() && !settings_Default.isEmpty()) {
				String deviceGetID = enrollmentTab_Settings_SubTab_ActiveOrNot.getAttribute("class");
				String value = null;
				if (deviceGetID.toLowerCase().contains("tab-active")) {
					value = "tab-active";
				} else {
					value = "tab-non-active";
				}
				assertEquals(value, settings_Default, "Enrollment Tab-> Setting Sub tab Control Label Comparision",
						true, rowNumber, sheetName);
			}

			// Enroll from Device control
			String enrollfromDevice_label = excelFileDataRecord.get("EnrollfromDevice_label").trim();
			String enrollfromDevice_Type = excelFileDataRecord.get("EnrollfromDevice_Type").trim();
			String enrollfromDevice_Visibility = excelFileDataRecord.get("EnrollfromDevice_Visibility").trim();
			String enrollfromDevice_Default_Value = excelFileDataRecord.get("EnrollfromDevice_Default_Value").trim();
			String enrollfromDevice_Value = excelFileDataRecord.get("EnrollfromDevice_Value").trim();
			checkbox_Check_UIValidation("Enroll from Device Control", rowNumber, sheetName,
					enrollmentTab_Settings_SubTab_EnrollfromDevice_Label,
					enrollmentTab_Settings_SubTab_EnrollfromDevice, enrollfromDevice_label, enrollfromDevice_Type,
					enrollfromDevice_Visibility, enrollfromDevice_Default_Value, enrollfromDevice_Value);

			// Start Enrollment Mode control and UI
			String enrollmentMode_label = excelFileDataRecord.get("EnrollmentMode_label").trim();
			String enrollmentMode_Type = excelFileDataRecord.get("EnrollmentMode_Type").trim();
			String enrollmentMode_Visibility = excelFileDataRecord.get("EnrollmentMode_Visibility").trim();
			String enrollmentMode_Default_Value = excelFileDataRecord.get("EnrollmentMode_Default_Value").trim();
			String enrollmentMode_Select_Values = excelFileDataRecord.get("EnrollmentMode_Select_Values").trim();
			String enrollmentMode_Values = excelFileDataRecord.get("EnrollmentMode_Values").trim();
			dropDown_Check_UIValidation("Enrollment Mode", rowNumber, sheetName,
					enrollmentTab_Settings_SubTab_EnrollmentMode_Label, enrollmentTab_Settings_SubTab_EnrollmentMode,
					basic_Optional_Application_size, enrollmentMode_label, enrollmentMode_Type,
					enrollmentMode_Visibility, enrollmentMode_Default_Value, enrollmentMode_Select_Values,
					enrollmentMode_Values, "");

			// Start Number of Cards control and UI
			String numberofCards_label = excelFileDataRecord.get("NumberofCards_label").trim();
			String numberofCards_Type = excelFileDataRecord.get("NumberofCards_Type").trim();
			String numberofCards_Visibility = excelFileDataRecord.get("NumberofCards_Visibility").trim();
			String numberofCards_Default_Value = excelFileDataRecord.get("NumberofCards_Default_Value").trim();
			String numberofCards_Select_Values = excelFileDataRecord.get("NumberofCards_Select_Values").trim();
			String numberofCards_Values = excelFileDataRecord.get("NumberofCards_Values").trim();
			dropDown_Check_UIValidation("Number of Cards", rowNumber, sheetName,
					enrollmentTab_Settings_SubTab_NumberofCards_Label, enrollmentTab_Settings_SubTab_NumberofCards,
					basic_Optional_Application_size, numberofCards_label, numberofCards_Type, numberofCards_Visibility,
					numberofCards_Default_Value, numberofCards_Select_Values, numberofCards_Values, "");

			// **********************Start Enrollment Tab-> Temporary User
			// Control***********************************
			String temporaryUser_label = excelFileDataRecord.get("TemporaryUser_label").trim();
			String temporaryUser_Default = excelFileDataRecord.get("TemporaryUser_Default").trim();
			String temporaryUser_Select = excelFileDataRecord.get("TemporaryUser_Select").trim();
			if (!temporaryUser_label.isBlank() && !temporaryUser_label.isEmpty()) {
				assertEquals(enrollmentTab_TemporaryUser_SubTab.getText(), temporaryUser_label,
						"Enrollment Tab-> Temporary User Control Label Comparision", true, rowNumber, sheetName);
			}
			if (!temporaryUser_Select.isBlank() && !temporaryUser_Select.isEmpty()) {
				element_Click(enrollmentTab_TemporaryUser_SubTab);
				Thread.sleep(250);
			}
			if (!temporaryUser_Default.isBlank() && !temporaryUser_Default.isEmpty()) {
				String deviceGetID = enrollmentTab_TemporaryUser_SubTab_ActiveOrNot.getAttribute("class");
				String value = null;
				if (deviceGetID.toLowerCase().contains("tab-active")) {
					value = "tab-active";
				} else {
					value = "tab-non-active";
				}
				assertEquals(value, temporaryUser_Default,
						"Enrollment Tab-> Temporary User Sub Control Label Comparision", true, rowNumber, sheetName);
			}

			// Start Temporary Addition of Unknown User control and UI
			String temporaryAdditionofUnknownUser_label = excelFileDataRecord
					.get("TemporaryAdditionofUnknownUser_label").trim();
			String temporaryAdditionofUnknownUser_Type = excelFileDataRecord.get("TemporaryAdditionofUnknownUser_Type")
					.trim();
			String temporaryAdditionofUnknownUser_Visibility = excelFileDataRecord
					.get("TemporaryAdditionofUnknownUser_Visibility").trim();
			String temporaryAdditionofUnknownUser_Default_Value = excelFileDataRecord
					.get("TemporaryAdditionofUnknownUser_Default_Value").trim();
			String temporaryAdditionofUnknownUser_Select_Values = excelFileDataRecord
					.get("TemporaryAdditionofUnknownUser_Select_Values").trim();
			String temporaryAdditionofUnknownUser_Values = excelFileDataRecord
					.get("TemporaryAdditionofUnknownUser_Values").trim();
			dropDown_Check_UIValidation("Temporary Addition of Unknown User DropDown", rowNumber, sheetName,
					enrollmentTab_TemporaryUser_SubTab_NumberofCards_Label,
					enrollmentTab_TemporaryUser_SubTab_TemporaryAdditionofUnknownUser, basic_Optional_Application_size,
					temporaryAdditionofUnknownUser_label, temporaryAdditionofUnknownUser_Type,
					temporaryAdditionofUnknownUser_Visibility, temporaryAdditionofUnknownUser_Default_Value,
					temporaryAdditionofUnknownUser_Select_Values, temporaryAdditionofUnknownUser_Values, "");
			String temporaryAdditionofUnknownUser_Select_info = excelFileDataRecord
					.get("TemporaryAdditionofUnknownUser_Select_info").trim();
			if (!temporaryAdditionofUnknownUser_Select_info.isBlank()
					&& !temporaryAdditionofUnknownUser_Select_info.isEmpty()) {
				String title = enrollmentTab_TemporaryUser_SubTab_NumberofCards_Info.getAttribute("title");
				assertEquals(title, temporaryAdditionofUnknownUser_Select_info,
						"Enrollment Tab-> Temporary User Sub Control Temporary Addition of Unknown User DropDown Label Comparision",
						true, rowNumber, sheetName);
			}

			// Start Skill control
			// *******************Start Skill Id Label And Control*******************
			String skillid_visibleOrNot = excelFileDataRecord.get("Skillid_visibleOrNot").trim();
			String skillid_label = excelFileDataRecord.get("Skillid_label").trim();
			String skillId_Type = excelFileDataRecord.get("SkillId_Type").trim();
			String skillId_Visibility = excelFileDataRecord.get("SkillId_Visibility").trim();
			String skillId_Placeholder = excelFileDataRecord.get("SkillId_Placeholder").trim();
			String skillId_Default_Value = excelFileDataRecord.get("SkillId_Default_Value").trim();
			String skillId_Value = excelFileDataRecord.get("SkillId_Value").trim();
			String skillId_Negative = excelFileDataRecord.get("SkillId_Negative").trim();
			textBox_Control_Check_UIValidation("Skill Id", rowNumber, sheetName,
					enrollmentTab_TemporaryUser_SubTab_skillLabel, enrollmentTab_TemporaryUser_SubTab_skillId,
					skillid_label, skillId_Type, skillId_Visibility, skillId_Placeholder, skillId_Default_Value,
					skillId_Value, skillId_Negative);
			// *******************Start Site Id Control Visible or Not*******************
			if (!skillid_visibleOrNot.isBlank() && !skillid_visibleOrNot.isEmpty()) {
				String sizeOfControl = String.valueOf(enrollmentTab_TemporaryUser_SubTab_skillId_Size.size());
				assertEquals(sizeOfControl, skillid_visibleOrNot, "Skill Id Control Visible or not", true, rowNumber,
						sheetName);
			}

			// *******************Start Site Name Label And Control*******************

			String skillName_Type = excelFileDataRecord.get("SkillName_Type").trim();
			String skillName_Visibility = excelFileDataRecord.get("SkillName_Visibility").trim();
			String skillName_Placeholder = excelFileDataRecord.get("SkillName_Placeholder").trim();
			String skillName_Default_Value = excelFileDataRecord.get("SkillName_Default_Value").trim();
			String skillName_Value = excelFileDataRecord.get("SkillName_Value").trim();
			String skillName_Negative = excelFileDataRecord.get("SkillName_Negative").trim();
			textBox_Control_Check_UIValidation("Site Name", rowNumber, sheetName,
					enrollmentTab_TemporaryUser_SubTab_skillLabel, enrollmentTab_TemporaryUser_SubTab_skillName, "",
					skillName_Type, skillName_Visibility, skillName_Placeholder, skillName_Default_Value,
					skillName_Value, skillName_Negative);

			// *******************Start Site Pop Up Button And Control*******************
			String skillPopUp_Label = excelFileDataRecord.get("SkillPopUp_Label").trim();
			String skillPopUpSearch_Type = excelFileDataRecord.get("SkillPopUpSearch_Type").trim();
			String skillPopUpSearch_Placeholder = excelFileDataRecord.get("SkillPopUpSearch_Placeholder").trim();
			String skillPopUpSearch_Value = excelFileDataRecord.get("SkillPopUpSearch_Value").trim();
			String skillPopUp_Default_Table_Header_Value = excelFileDataRecord
					.get("SkillPopUp_Default_Table_Header_Value").trim();
			String skillPopUp_Default_Table_Row_Value = excelFileDataRecord.get("SkillPopUp_Default_Table_Row_Value")
					.trim();
			String skillPopUp_Default_Table_No_Data_Value = excelFileDataRecord
					.get("SkillPopUp_Default_Table_No_Data_Value").trim();
			String skillPopUp_Default_Table_Row_Value_Select = excelFileDataRecord
					.get("SkillPopUp_Default_Table_Row_Value_Select").trim();
			String skillPopUpCancel_Type = excelFileDataRecord.get("SkillPopUpCancel_Type").trim();
			String skillPopUpCancel_Default_Value = excelFileDataRecord.get("SkillPopUpCancel_Default_Value").trim();
			String skillPopUpClose_Type = excelFileDataRecord.get("SkillPopUpClose_Type").trim();
			if (!skillPopUp_Label.isBlank() || !skillPopUpSearch_Type.isBlank()
					|| !skillPopUpSearch_Placeholder.isBlank() || !skillPopUpSearch_Value.isBlank()
					|| !skillPopUp_Default_Table_Header_Value.isBlank() || !skillPopUp_Default_Table_Row_Value.isBlank()
					|| !skillPopUp_Default_Table_No_Data_Value.isBlank()
					|| !skillPopUp_Default_Table_Row_Value_Select.isBlank() || !skillPopUpCancel_Default_Value.isBlank()
					|| !skillPopUpClose_Type.isBlank() || !skillPopUp_Default_Table_Row_Value_Select.isBlank()) {
				System.out.println("I am in Skill PopUp");
				element_Click(enrollmentTab_TemporaryUser_SubTab_skill_multiplesiteButton);
				waitForElementVisible(common_Popup_Label);
				// Pop up Open
				if (!skillPopUp_Label.isBlank() && !skillPopUp_Label.isEmpty()) {
					System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
					assertEquals(common_Popup_Label.getText(), skillPopUp_Label, "Site Pop Up Label Comparision", true,
							rowNumber, sheetName);
				}
				// Start Search Box
				if (!skillPopUpSearch_Placeholder.isBlank() && !skillPopUpSearch_Placeholder.isEmpty()) {
					System.out.println(
							"Element PlaceHolder :" + element_GetAttributeValue(common_Popup_search, "placeholder"));
					assertEquals(element_GetAttributeValue(common_Popup_search, "placeholder"),
							skillPopUpSearch_Placeholder, "SKill Pop Up -> SearchBox PlaceHolder Comparison", true,
							rowNumber, sheetName);
				}
				if (!skillPopUpSearch_Type.isBlank() && !skillPopUpSearch_Type.isEmpty()) {
					System.out.println("Element Attribute :" + element_GetAttributeValue(common_Popup_search, "type"));
					assertEquals(element_GetAttributeValue(common_Popup_search, "type"), skillPopUpSearch_Type,
							"SKill Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
				}
				if (!skillPopUpSearch_Value.isBlank() && !skillPopUpSearch_Value.isEmpty()) {
					element_InputText(common_Popup_search, skillPopUpSearch_Value);
					Thread.sleep(250);
					element_Click(common_Popup_search_Button);
					Thread.sleep(250);
				}
				// Table Header Value Checked
				tableHeader_Control_Check_UIValidation("SKill Pop Up", rowNumber, sheetName, common_Popup_table_header,
						skillPopUp_Default_Table_Header_Value);
				Thread.sleep(250);
				tableRow_Control_Check_UIValidation("Skill Pop Up Table Row", rowNumber, sheetName,
						common_Popup_table_Row, "td[@class=\"cursor label-text\"]/label", common_Popup_table_No_Data,
						skillPopUp_Default_Table_Row_Value, skillPopUp_Default_Table_No_Data_Value);

				// Cancel Button
				if (!skillPopUpCancel_Type.isBlank() && !skillPopUpCancel_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(common_Popup_CancelButton, "type"));
					assertEquals(element_GetAttributeValue(common_Popup_CancelButton, "type"), skillPopUpCancel_Type,
							"Skill Pop Up -> Cencel Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!skillPopUpCancel_Default_Value.isBlank() && !skillPopUpCancel_Default_Value.isEmpty()) {
					System.out.println(
							"Element default Value :" + element_GetAttributeValue(common_Popup_CancelButton, "value"));
					assertEquals(element_GetAttributeValue(common_Popup_CancelButton, "value"),
							skillPopUpCancel_Default_Value, "Skill Pop Up -> Cencel Button default value Comparison",
							true, rowNumber, sheetName);
				}
				// Close button
				if (!skillPopUpClose_Type.isBlank() && !skillPopUpClose_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(common_Popup_CloseButton, "type"));
					assertEquals(element_GetAttributeValue(common_Popup_CloseButton, "type"), skillPopUpClose_Type,
							"Skill Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!skillPopUp_Default_Table_Row_Value_Select.isBlank()
						&& !skillPopUp_Default_Table_Row_Value_Select.isEmpty()) {
					for (int aa = 0; aa < common_Popup_table_Row_ValueSelect.size(); aa++) {
						System.out.println(common_Popup_table_Row_ValueSelect.get(aa).getText());
						if (common_Popup_table_Row_ValueSelect.get(aa).getText()
								.equalsIgnoreCase(skillPopUp_Default_Table_Row_Value_Select)) {
							common_Popup_table_Row_ValueSelect.get(aa).click();
							Thread.sleep(250);
							break;
						}
					}

				} else {
					element_Click(common_Popup_CloseButton);
				}
			}

			// Start Contractor control
			// *******************Start Contractor Id Label And Control*******************
			String contractorid_visibleOrNot = excelFileDataRecord.get("Contractorid_visibleOrNot").trim();
			String contractorlid_label = excelFileDataRecord.get("Contractorlid_label").trim();
			String contractorId_Type = excelFileDataRecord.get("ContractorId_Type").trim();
			String contractorId_Visibility = excelFileDataRecord.get("ContractorId_Visibility").trim();
			String contractorId_Placeholder = excelFileDataRecord.get("ContractorId_Placeholder").trim();
			String contractorId_Default_Value = excelFileDataRecord.get("ContractorId_Default_Value").trim();
			String contractorId_Value = excelFileDataRecord.get("ContractorId_Value").trim();
			String contractorId_Negative = excelFileDataRecord.get("ContractorId_Negative").trim();
			String contractorPopUpClose_info = excelFileDataRecord.get("ContractorPopUpClose_info").trim();
			textBox_Control_Check_UIValidation("Contractor Id", rowNumber, sheetName,
					enrollmentTab_TemporaryUser_SubTab_ContractorLabel, enrollmentTab_TemporaryUser_SubTab_ContractorId,
					contractorlid_label, contractorId_Type, contractorId_Visibility, contractorId_Placeholder,
					contractorId_Default_Value, contractorId_Value, contractorId_Negative);
			// *******************Start Contractor Id Control Visible or
			// Not*******************
			if (!contractorid_visibleOrNot.isBlank() && !contractorid_visibleOrNot.isEmpty()) {
				String sizeOfControl = String.valueOf(enrollmentTab_TemporaryUser_SubTab_skillId_Size.size());
				assertEquals(sizeOfControl, contractorid_visibleOrNot, "Contractor Id Control Visible or not", true,
						rowNumber, sheetName);
			}
			// *******************Start Contractor info Control *******************
			if (!contractorPopUpClose_info.isBlank() && !contractorPopUpClose_info.isEmpty()) {
				System.out.println("Element Attribute :"
						+ element_GetAttributeValue(enrollmentTab_TemporaryUser_SubTab_ContractorLabel_info, "title"));
				assertEquals(
						element_GetAttributeValue(enrollmentTab_TemporaryUser_SubTab_ContractorLabel_info, "title"),
						contractorPopUpClose_info, "Contractor Control Info title", true, rowNumber, sheetName);
			}

			// *******************Start Contractor Name Label And Control*******************

			String contractorName_Type = excelFileDataRecord.get("ContractorName_Type").trim();
			String contractorName_Visibility = excelFileDataRecord.get("ContractorName_Visibility").trim();
			String contractorName_Placeholder = excelFileDataRecord.get("ContractorName_Placeholder").trim();
			String contractorName_Default_Value = excelFileDataRecord.get("ContractorName_Default_Value").trim();
			String contractorName_Value = excelFileDataRecord.get("ContractorName_Value").trim();
			String contractorName_Negative = excelFileDataRecord.get("ContractorName_Negative").trim();
			textBox_Control_Check_UIValidation("Contractor Name", rowNumber, sheetName,
					enrollmentTab_TemporaryUser_SubTab_skillLabel, enrollmentTab_TemporaryUser_SubTab_ContractorName,
					"", contractorName_Type, contractorName_Visibility, contractorName_Placeholder,
					contractorName_Default_Value, contractorName_Value, contractorName_Negative);

			// *******************Start Contractor Pop Up Button And
			// Control*******************
			String contractorPopUp_Label = excelFileDataRecord.get("ContractorPopUp_Label").trim();
			String contractorPopUpSearch_Type = excelFileDataRecord.get("ContractorPopUpSearch_Type").trim();
			String contractorPopUpSearch_Placeholder = excelFileDataRecord.get("ContractorPopUpSearch_Placeholder")
					.trim();
			String contractorPopUpSearch_Value = excelFileDataRecord.get("ContractorPopUpSearch_Value").trim();
			String contractorPopUp_Default_Table_Header_Value = excelFileDataRecord
					.get("ContractorPopUp_Default_Table_Header_Value").trim();
			String contractorPopUp_Default_Table_Row_Value = excelFileDataRecord
					.get("ContractorPopUp_Default_Table_Row_Value").trim();
			String contractorPopUp_Default_Table_No_Data_Value = excelFileDataRecord
					.get("ContractorPopUp_Default_Table_No_Data_Value").trim();
			String contractorPopUp_Default_Table_Row_Value_Select = excelFileDataRecord
					.get("ContractorPopUp_Default_Table_Row_Value_Select").trim();
			String contractorPopUpCancel_Type = excelFileDataRecord.get("ContractorPopUpCancel_Type").trim();
			String contractorPopUpCancel_Default_Value = excelFileDataRecord.get("ContractorPopUpCancel_Default_Value")
					.trim();
			String contractorPopUpClose_Type = excelFileDataRecord.get("ContractorPopUpClose_Type").trim();
			if (!contractorPopUp_Label.isBlank() || !contractorPopUpSearch_Type.isBlank()
					|| !contractorPopUpSearch_Placeholder.isBlank() || !contractorPopUpSearch_Value.isBlank()
					|| !contractorPopUp_Default_Table_Header_Value.isBlank()
					|| !contractorPopUp_Default_Table_Row_Value.isBlank()
					|| !contractorPopUp_Default_Table_No_Data_Value.isBlank()
					|| !contractorPopUp_Default_Table_Row_Value_Select.isBlank()
					|| !contractorPopUpCancel_Default_Value.isBlank() || !contractorPopUpClose_Type.isBlank()
					|| !contractorPopUpCancel_Type.isBlank()) {
				System.out.println("I am in Contractor PopUp");
				element_Click(enrollmentTab_TemporaryUser_SubTab_Contractor_multiplesiteButton);
				waitForElementVisible(common_Popup_Label);
				// Pop up Open
				if (!contractorPopUp_Label.isBlank() && !contractorPopUp_Label.isEmpty()) {
					System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
					assertEquals(common_Popup_Label.getText(), contractorPopUp_Label,
							"Contractor Pop Up Label Comparision", true, rowNumber, sheetName);
				}
				// Start Search Box
				if (!contractorPopUpSearch_Placeholder.isBlank() && !contractorPopUpSearch_Placeholder.isEmpty()) {
					System.out.println(
							"Element PlaceHolder :" + element_GetAttributeValue(common_Popup_search, "placeholder"));
					assertEquals(element_GetAttributeValue(common_Popup_search, "placeholder"),
							contractorPopUpSearch_Placeholder, "Contractor Pop Up -> SearchBox PlaceHolder Comparison",
							true, rowNumber, sheetName);
				}
				if (!contractorPopUpSearch_Type.isBlank() && !contractorPopUpSearch_Type.isEmpty()) {
					System.out.println("Element Attribute :" + element_GetAttributeValue(common_Popup_search, "type"));
					assertEquals(element_GetAttributeValue(common_Popup_search, "type"), contractorPopUpSearch_Type,
							"Contractor Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
				}
				if (!contractorPopUpSearch_Value.isBlank() && !contractorPopUpSearch_Value.isEmpty()) {
					element_InputText(common_Popup_search, contractorPopUpSearch_Value);
					Thread.sleep(250);
					element_Click(common_Popup_search_Button);
					Thread.sleep(250);
				}
				// Table Header Value Checked
				tableHeader_Control_Check_UIValidation("Contractor Pop Up", rowNumber, sheetName,
						common_Popup_table_header, contractorPopUp_Default_Table_Header_Value);
				Thread.sleep(250);
				tableRow_Control_Check_UIValidation("Contractor Pop Up Table Row", rowNumber, sheetName,
						common_Popup_table_Row, "td[@class=\"cursor label-text\"]/label", common_Popup_table_No_Data,
						contractorPopUp_Default_Table_Row_Value, contractorPopUp_Default_Table_No_Data_Value);

				// Cancel Button
				if (!contractorPopUpCancel_Type.isBlank() && !contractorPopUpCancel_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(common_Popup_CancelButton, "type"));
					assertEquals(element_GetAttributeValue(common_Popup_CancelButton, "type"),
							contractorPopUpCancel_Type, "Contractor Pop Up -> Cencel Button Type Comparison", true,
							rowNumber, sheetName);
				}
				if (!contractorPopUpCancel_Default_Value.isBlank() && !contractorPopUpCancel_Default_Value.isEmpty()) {
					System.out.println(
							"Element default Value :" + element_GetAttributeValue(common_Popup_CancelButton, "value"));
					assertEquals(element_GetAttributeValue(common_Popup_CancelButton, "value"),
							contractorPopUpCancel_Default_Value,
							"Contractor Pop Up -> Cencel Button default value Comparison", true, rowNumber, sheetName);
				}
				// Close button
				if (!contractorPopUpClose_Type.isBlank() && !contractorPopUpClose_Type.isEmpty()) {
					System.out.println(
							"Element Attribute :" + element_GetAttributeValue(common_Popup_CloseButton, "type"));
					assertEquals(element_GetAttributeValue(common_Popup_CloseButton, "type"), contractorPopUpClose_Type,
							"Contractor Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
				}
				if (!contractorPopUp_Default_Table_Row_Value_Select.isBlank()
						&& !contractorPopUp_Default_Table_Row_Value_Select.isEmpty()) {
					for (int aa = 0; aa < common_Popup_table_Row_ValueSelect.size(); aa++) {
						System.out.println(common_Popup_table_Row_ValueSelect.get(aa).getText());
						if (common_Popup_table_Row_ValueSelect.get(aa).getText()
								.equalsIgnoreCase(contractorPopUp_Default_Table_Row_Value_Select)) {
							common_Popup_table_Row_ValueSelect.get(aa).click();
							Thread.sleep(250);
							break;
						}
					}

				} else {
					element_Click(common_Popup_CloseButton);
				}
			}

			// Save button then checked main validation
			saveButtonClick();
			valMsg = validationMessage();
			String excelVal = excelFileDataRecord.get("Validation").trim();
			if (!excelVal.isBlank() && !excelVal.isEmpty()) {
				assertEquals(valMsg, excelFileDataRecord.get("Validation").trim(),
						"Main Validation on Save button Comparison", true, rowNumber, sheetName);
			}
			Thread.sleep(1500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			reloadPageButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
		}
	}
	
	@FindBy(xpath = "//label[text()=\"Voice Guidance\"]")
	private WebElement voiceGuidance_TabBtn;

	@FindBy(xpath = "//label[text()=\"Voice Guidance\"]/ancestor::li[1]")
	private WebElement voiceGuidanceTabControlActiveOrNot;

	@FindBy(id = "btnEdit")
	private WebElement editBtn;

	@FindBy(id = "chkVoiceGuidanceActive")
	private WebElement voiceGuidanceActive_Chkbox;

	@FindBy(xpath = "//*[@id='chkVoiceGuidanceActive']/ancestor::div[@class='form-group']//label")
	private WebElement voiceGuidanceActive_label;

	@FindBy(xpath = "//*[text()=\"Acknowledgements\"]")
	private WebElement Acknowledgements__Tab;

	@FindBy(xpath = "//*[text()=\"Acknowledgements\"]/ancestor::a[1]")
	private WebElement Acknowledgements__Tab_OpenOrClose;

	@FindBy(xpath = "//*[text()=\"User Interaction\"]")
	private WebElement UserInteraction__Tab;

	@FindBy(xpath = "//*[text()=\"User Interaction\"]/ancestor::a[1]")
	private WebElement UserInteraction__Tab_OpenOrClose;

	@FindBy(xpath = "//*[@id='accordion_master']//*[text()=\"Enrollment\"]")
	private WebElement Enrollment__Tab;

	@FindBy(xpath = "//*[@id='accordion_master']//*[text()=\"Enrollment\"]/ancestor::a[1]")
	private WebElement Enrollment__Tab_OpenOrClose;

	@FindBy(xpath = "//*[@id='accordion_master']//*[text()=\"Cafeteria\"]")
	private WebElement Cafeteria__Tab;

	@FindBy(xpath = "//*[@id='accordion_master']//*[text()=\"Cafeteria\"]/ancestor::a[1]")
	private WebElement Cafeteria__Tab_OpenOrClose;

	@FindBy(xpath = "//*[text()=\"Alarms\"]")
	private WebElement Alarms__Tab;

	@FindBy(xpath = "//*[text()=\"Alarms\"]/ancestor::a[1]")
	private WebElement Alarms__Tab_OpenOrClose;

	@FindBy(xpath = "//*[@key='btnSDCVGSave']")
	private WebElement VoiceGuidancePgSaveBtn;

	@FindBy(xpath = "//*[@id='div_grd_VGAudioAcknowledgements']//thead//label")
	private List<WebElement> Acknowledgements_TableHeader;

	@FindBy(xpath = "//*[@id='div_grd_VGAudioAcknowledgements']//tbody//tr[not(@hidden)]")
	private List<WebElement> Acknowledgements_TableData;

	@FindBy(xpath = "//*[@id='div_grd_VGAudioAcknowledgements']//tbody//tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> Acknowledgements_TableData_Identifier;
	
	@FindBy(xpath = "//*[@id=\"div_grd_VGAudioAcknowledgements\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)]//*[self::input or self::select or self::label][not(@hidden)]")
	private List<WebElement> Acknowledgements_TableData_All_Fields;
	

	@FindBy(id = "btnVGCopyToDeviceList")
	private WebElement copyBtn;

	@FindBy(xpath = "//*[@title=\"Copy Configurations To\"]")
	private WebElement copyBtn_InfoIcon;

	public void deviceUIControlValidation_VoiceGuidance(List<Map<String, String>> data, String sheetName)
			throws Exception {
		for (int i = 0; i < data.size(); i++) {
			eachRowStatus = false;
			String valMsg = null;
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			Map<String, String> excelFileDataRecord = data.get(i);
			logger.info("***********************************Excel Data Record Picked : Row Number = " + i + " Data is ="
					+ excelFileDataRecord);
			int rowNumber = Integer.parseInt(excelFileDataRecord.get("RowNumber"));
			addButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			waitForElementVisible_TimeinMinutes(selectDeviceTypeBeAddedpopUp, 2);
			for (int j = 0; j < selectDeviceTypeToBeAdded.size(); j++) {
				String title = selectDeviceTypeToBeAdded.get(j).getAttribute("title");
				if (title.equalsIgnoreCase(excelFileDataRecord.get("DeviceType"))) {
					selectDeviceTypeToBeAdded.get(j).click();
					Thread.sleep(500);
					waitForElementClickable(deviceContinue);
					element_Click(deviceContinue);
					Thread.sleep(500);
					break;
				}
			}
			Thread.sleep(500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementClickable(active, 1);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			// *******************Start Device Name Textbox And Control*******************

			String deviceNameV = excelFileDataRecord.get("DeviceName_Value").trim();
			textBox_Control_Check_UIValidation("Device Name", rowNumber, sheetName, deviceidNameLabel, deviceNameTxt,
					"", "", "", "", "", deviceNameV, "");

			// *******************Start Mac Address Textbox And Control*******************
			String macAddressV = excelFileDataRecord.get("MacAddress_Value").trim();
			if (!macAddressV.isBlank() && !macAddressV.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				String[] macs = macAddressV.split(":");
				for (int x = 0; x < macAddressTxt.size(); x++) {
					macAddressTxt.get(x).sendKeys(macs[x]);
				}
			}

			// Save button then checked main validation
			saveButtonClick();
			valMsg = validationMessage();
			String excelVal = excelFileDataRecord.get("Validation").trim();
			if (!excelVal.isBlank() && !excelVal.isEmpty()) {
				assertEquals(valMsg, "Saved Successfully", "Main Validation on Save button Comparison", true, rowNumber,
						sheetName);
			}
			Thread.sleep(1500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));

			// code start for Voice Guidance Page
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementClickable(editBtn);
			element_Click(editBtn);
			Thread.sleep(500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			// **********************Start Voice Guidance
			// Tab***********************************
			String voiceGuidance_label = excelFileDataRecord.get("VoiceGuidance_label").trim();
			String voiceGuidance_Default = excelFileDataRecord.get("VoiceGuidance_Default").trim();
			String voiceGuidance_Select = excelFileDataRecord.get("VoiceGuidance_Select").trim();
			if (!voiceGuidance_label.isBlank() && !voiceGuidance_label.isEmpty()) {
				assertEquals(voiceGuidance_TabBtn.getText(), voiceGuidance_label,
						"Voice Guidance Tab Control Label Comparision", true, rowNumber, sheetName);
			}
			if (!voiceGuidance_Select.isBlank() && !voiceGuidance_Select.isEmpty()) {
				element_Click(voiceGuidance_TabBtn);
				Thread.sleep(250);
			}
			if (!voiceGuidance_Default.isBlank() && !voiceGuidance_Default.isEmpty()) {
				String deviceGetID = voiceGuidanceTabControlActiveOrNot.getAttribute("class");
				String value = null;
				if (deviceGetID.toLowerCase().contains("tab-active")) {
					value = "tab-active";
				} else {
					value = "tab-non-active";
				}
				assertEquals(value, voiceGuidance_Default, "Voice Guidance Tab Control Label Comparision", true,
						rowNumber, sheetName);
			}

			// *****Voice Guidance - checkbox****
			String voiceGuidanceLab = excelFileDataRecord.get("VoiceGuidance_CheckBox_label").trim();
			String voiceGuidanceTy = excelFileDataRecord.get("VoiceGuidance_CheckBox_Type").trim();
			String voiceGuidanceVi = excelFileDataRecord.get("VoiceGuidance_CheckBox_Visibility").trim();
			String voiceGuidance_default = excelFileDataRecord.get("VoiceGuidance_CheckBox_Default_Value").trim();
			String voiceGuidanceV = excelFileDataRecord.get("VoiceGuidance_CheckBox_Value").trim();
			checkbox_Check_UIValidation("Voice Guidance", rowNumber, sheetName, voiceGuidanceActive_label,
					voiceGuidanceActive_Chkbox, voiceGuidanceLab, voiceGuidanceTy, voiceGuidanceVi,
					voiceGuidance_default, voiceGuidanceV);

			// Info icon - copy icon*******************
			String infoIconVisibility = excelFileDataRecord.get("CopyBtn_InfoIcon_Visibility").trim();
			String infoIconTooltip = excelFileDataRecord.get("CopyBtn_InfoIcon_Tooltip").trim();

			infoIcon_UIValidation("Voice Guidance", rowNumber, sheetName, copyBtn_InfoIcon, infoIconVisibility,
					infoIconTooltip);

			// *******************Acknowledgements Tab Control*******************
			String acknowledgementsTabLab = excelFileDataRecord.get("Acknowledgementstab_label").trim();
			String acknowledgementsTabOpen = excelFileDataRecord.get("Acknowledgementstab_Default").trim();
			String acknowledgementsTabValue = excelFileDataRecord.get("Acknowledgementstab_Value").trim();

			tab_Control_Check_UIValidation("Acknowledgements", rowNumber, sheetName, Acknowledgements__Tab,
					Acknowledgements__Tab_OpenOrClose, acknowledgementsTabLab, acknowledgementsTabOpen,
					acknowledgementsTabValue);

			// Table Header Value Checked
			String acknowledgements_TableHeader_Value = excelFileDataRecord.get("Acknowledgements_TableHeader_Value")
					.trim();
			tableHeader_Control_Check_UIValidation("Acknowledgements", rowNumber, sheetName,
					Acknowledgements_TableHeader, acknowledgements_TableHeader_Value);
			Thread.sleep(250);

			// Table Default Row fetching
			String acknowledgements_Table_Row_Values = excelFileDataRecord.get("Acknowledgements_Table_Row_Values")
					.trim();
			String relatedX = "td[not(@hidden)]//*[self::input or self::select or self::label][not(@hidden)]";
			fetching_default_TableData_multipleType("Acknowledgements Default Row", rowNumber, sheetName,
					Acknowledgements_TableData, relatedX, acknowledgements_Table_Row_Values);

			// Table Data Edit
			String feature = excelFileDataRecord.get("Acknowledgements_Feature").trim();
			String feature_Data = excelFileDataRecord.get("Acknowledgements_Feature_UpdateData").trim();
			String identifierPath = "//*[@id='div_grd_VGAudioAcknowledgements']//tbody//tr[not(@hidden)]/td[not(@hidden)][1]";
			tableData_Updated("Acknowledgements Row Data Updated", rowNumber, sheetName,
					Acknowledgements_TableData_Identifier, identifierPath, relatedX, feature, feature_Data);

			// Table Data Default Values 
			String acknowledgements_FeatureTable_DefaultDataChecked = excelFileDataRecord.get("Acknowledgements_FeatureTable_DefaultDataChecked").trim();
			String actualtableData=tableData_Elements_TypeAndDefaultAndValues(Acknowledgements_TableData_All_Fields);
			assertEquals(actualtableData, acknowledgements_FeatureTable_DefaultDataChecked,
					"Acknowledgements table default webelements checked", true, rowNumber, sheetName);
			
			

			
			// final save button after editing voice guidance page
			// Save button then checked main validation
			saveButtonClick();
			valMsg = validationMessage();
			String excelVal2 = excelFileDataRecord.get("Validation").trim();
			if (!excelVal2.isBlank() && !excelVal2.isEmpty()) {
				assertEquals(valMsg, excelFileDataRecord.get("Validation").trim(),
						"Main Validation on Save button Comparison", true, rowNumber, sheetName);
			}
			Thread.sleep(1500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			reloadPageButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
		}

	}
	
	@FindBy(xpath = "//label[text()=\"Advanced\"]")
	private WebElement advancedTabControl;

	@FindBy(xpath = "//label[text()=\"Advanced\"]/ancestor::li[1]")
	private WebElement advancedTabControlActiveOrNot;
	
	@FindBy(xpath = "//label[text()=\"Settings\"]")
	private WebElement settingsTabControl;

	@FindBy(xpath = "//label[text()=\"Settings\"]/ancestor::li[1]")
	private WebElement settingsTabControlActiveOrNot;
	
	@FindBy(id = "chkGenExtSwtchEvt")
	private WebElement advanced_settings_GenerateExitSwitchEvents_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkGenExtSwtchEvt']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_GenerateExitSwitchEvents_Chkbox_Label;
	
	@FindBy(id = "chkGenInVldUsrEvt")
	private WebElement advanced_settings_GenerateInvalidUserEvents_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkGenInVldUsrEvt']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_GenerateInvalidUserEvents_Chkbox_Label;
	
	@FindBy(id = "chkSeqInOutEVT")
	private WebElement advanced_settings_GenerateSequentialINOUTEvents_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkSeqInOutEVT']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_GenerateSequentialINOUTEvents_Chkbox_Label;
	
	@FindBy(id = "chkShowPin")
	private WebElement advanced_settings_ShowPIN_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkShowPin']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_ShowPIN_Chkbox_Label;
	
	@FindBy(id = "chkAlwExtDLock")
	private WebElement advanced_settings_AllowExitwhenDoorLock_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkAlwExtDLock']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_AllowExitwhenDoorLock_Chkbox_Label;
	
	@FindBy(id = "chkAutoRlck")
	private WebElement advanced_settings_AutoRelock_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkAutoRlck']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_AutoRelock_Chkbox_Label;
	
	@FindBy(id = "txtAutoRelockTimer")
	private WebElement advanced_settings_AutoRelockTimer_Txtbox;
	
	@FindBy(xpath = "//*[@id='txtAutoRelockTimer']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_AutoRelockTimer_Txtbox_Label;
	
	@FindBy(id = "chkAddSec")
	private WebElement advanced_settings_EnableAdditionalSecurity_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkAddSec']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_EnableAdditionalSecurity_Chkbox_Label;
	
	@FindBy(id = "txtAddSec")
	private WebElement advanced_settings_AdditionalSecurityCode_Textbox;
	
	@FindBy(xpath = "//*[@id='txtAddSec']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_AdditionalSecurityCode_Textbox_Label;
	
	@FindBy(id = "txtAddSecReEntr")
	private WebElement advanced_settings_ReenterCode_Textbox;
	
	@FindBy(xpath = "//*[@id='txtAddSecReEntr']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_ReenterCode_Textbox_Label;
	
	@FindBy(id = "btnDefault")
	private WebElement advanced_settings_Default_Btn;
	
	@FindBy(id = "chkSI")
	private WebElement advanced_settings_EnableSmartIdentification_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkSI']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_EnableSmartIdentification_Chkbox_Label;
	
	@FindBy(id = "cboAccessLevel")
	private WebElement advanced_settings_AccessLevel_Dropdown;
	
	@FindBy(id = "cboAccessLevel")
	private List<WebElement> advanced_settings_AccessLevel_Dropdown_Size;
	
	@FindBy(xpath = "//*[@id='cboAccessLevel']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_AccessLevel_Dropdown_Label;
	
	@FindBy(id = "cboSIAccessModeAdv")
	private WebElement advanced_settings_AccessMode_Dropdown;
	
	@FindBy(id = "cboSIAccessModeAdv")
	private List<WebElement> advanced_settings_AccessMode_Dropdown_Size;
	
	@FindBy(xpath = "//*[@id='cboSIAccessModeAdv']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_AccessMode_Dropdown_Label;
	
	@FindBy(id = "chkAutoAlarmsAcknowledge")
	private WebElement advanced_settings_AutoAcknowledgeAlarm_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkAutoAlarmsAcknowledge']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_AutoAcknowledgeAlarm_Chkbox_Label;
	
	@FindBy(id = "txtAutoAlarmsTimer")
	private WebElement advanced_settings_AutoAcknowledgeAlarm_Txtbox;
	
	@FindBy(xpath = "//*[@id='txtAutoAlarmsTimer']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_AutoAcknowledgeAlarm_Txtbox_Label;
	
	@FindBy(id = "txtFacilityCode")
	private WebElement advanced_settings_FacilityCode_Txtbox;
	
	@FindBy(xpath = "//*[@id='txtFacilityCode']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_FacilityCode_Txtbox_Label;
	
	@FindBy(id = "chkAlwDoorAcsAPI")
	private WebElement advanced_settings_AllowAccessThroughMobile_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkAlwDoorAcsAPI']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_AllowAccessThroughMobile_Chkbox_Label;
	
	@FindBy(id = "cboEntryAcsMode")
	private WebElement advanced_settings_MobileEntryAccessMode_Dropdown;
	
	@FindBy(id = "cboEntryAcsMode")
	private List<WebElement> advanced_settings_MobileEntryAccessMode_Dropdown_Size;
	
	@FindBy(xpath = "(//*[@id='cboEntryAcsMode']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_settings_MobileEntryAccessMode_Dropdown_Label;
	
	@FindBy(xpath = "(//*[@id='cboEntryAcsMode']/ancestor::div[@class='form-group']//label)[2]")
	private WebElement advanced_settings_MobileEntryAccessMode_Dropdown_InfoIcon;
	
	@FindBy(id = "cboExitAcsMode")
	private WebElement advanced_settings_MobileExitAccessMode_Dropdown;
	
	@FindBy(id = "cboExitAcsMode")
	private List<WebElement> advanced_settings_MobileExitAccessMode_Dropdown_Size;
	
	@FindBy(xpath = "(//*[@title=\"Mobile then PIN applicable only for APTA (Bluetooth Scan), ACS Application and MODE\"])[1]")
	private WebElement advanced_settings_MobileEntryAccessMode_InfoIcon;
	
	@FindBy(xpath = "(//*[@title=\"Mobile then PIN applicable only for APTA (Bluetooth Scan), ACS Application and MODE\"])[2]")
	private WebElement advanced_settings_MobileExitAccessMode_InfoIcon;
	
	@FindBy(xpath = "(//*[@id='cboExitAcsMode']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_settings_MobileExitAccessMode_Dropdown_Label;
	
	@FindBy(xpath = "(//*[@id='cboExitAcsMode']/ancestor::div[@class='form-group']//label)[2]")
	private WebElement advanced_settings_MobileExitAccessMode_Dropdown_InfoIcon;
	
	@FindBy(id = "chkATDDetails")
	private WebElement advanced_settings_ShowAttendanceDetails_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkATDDetails']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_ShowAttendanceDetails_Chkbox_Label;
	
	@FindBy(id = "ATDDetailsDuration")
	private WebElement advanced_settings_AttendanceDisplayDuration_Txtbox;
	
	@FindBy(xpath = "//*[@id='ATDDetailsDuration']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_AttendanceDisplayDuration_Label;
	
	@FindBy(id = "txtDuplicatePunchInterval")
	private WebElement advanced_settings_DuplicateAccessTimeInterval_Txtbox;
	
	@FindBy(xpath = "//*[@id='txtDuplicatePunchInterval']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_settings_DuplicateAccessTimeInterval_Label;
	
	@FindBy(id = "EnblFaceMask")
	private WebElement advanced_settings_FaceMaskEnable_Chkbox;
	
	@FindBy(xpath = "(//*[@id='EnblFaceMask']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_settings_FaceMaskEnable_Chkbox_Label;
	
	@FindBy(xpath = "(//*[@id='EnblFaceMask']/ancestor::div[@class='form-group']//label)[2]")
	private WebElement advanced_settings_FaceMaskEnable_Chkbox_InfoIcon;
	
	@FindBy(id = "txtCameraWaitTimer")
	private WebElement advanced_settings_ApproachtoCameraWaitTimer_Txtbox;
	
	@FindBy(xpath = "//*[@id='txtCameraWaitTimer']/ancestor::div[@class='form-group']//label[1]")
	private WebElement advanced_settings_ApproachtoCameraWaitTimer_Txtbox_Label;
	
	@FindBy(id = "txtMaskDetectTimeOut")
	private WebElement advanced_settings_MaskDetectionTimeOut_Txtbox;
	
	@FindBy(xpath = "//*[@id='txtMaskDetectTimeOut']/ancestor::div[@class='form-group']//label[1]")
	private WebElement advanced_settings_MaskDetectionTimeOut_Txtbox_Label;
	
	@FindBy(id = "cmbFaceMaskRestrictionType")
	private WebElement advanced_settings_RestrictionType_Dropdown;
	
	@FindBy(id = "cmbFaceMaskRestrictionType")
	private List<WebElement> advanced_settings_RestrictionType_Dropdown_Size;
	
	@FindBy(xpath = "//*[@id='cmbFaceMaskRestrictionType']/ancestor::div[@class='form-group']//label[1]")
	private WebElement advanced_settings_RestrictionType_Dropdown_Label;
	
	public void deviceUIControlValidation_Advanced_Settings(List<Map<String, String>> data, String sheetName) throws Exception {
		for (int i = 0; i < data.size(); i++) {
			eachRowStatus = false;
			String valMsg = null;
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			Map<String, String> excelFileDataRecord = data.get(i);
			logger.info("***********************************Excel Data Record Picked : Row Number = " + i + " Data is ="
					+ excelFileDataRecord);
			int rowNumber = Integer.parseInt(excelFileDataRecord.get("RowNumber"));
			addButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			waitForElementVisible_TimeinMinutes(selectDeviceTypeBeAddedpopUp, 2);
			for (int j = 0; j < selectDeviceTypeToBeAdded.size(); j++) {
				String title = selectDeviceTypeToBeAdded.get(j).getAttribute("title");
				if (title.equalsIgnoreCase(excelFileDataRecord.get("DeviceType"))) {
					selectDeviceTypeToBeAdded.get(j).click();
					Thread.sleep(500);
					waitForElementClickable(deviceContinue);
					element_Click(deviceContinue);
					Thread.sleep(500);
					break;
				}
			}
			Thread.sleep(500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementClickable(active, 1);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			// *******************Start Device Name Textbox And Control*******************

			String deviceNameV = excelFileDataRecord.get("DeviceName_Value").trim();
			textBox_Control_Check_UIValidation("Device Name", rowNumber, sheetName, deviceidNameLabel, deviceNameTxt,
					"", "", "", "", "", deviceNameV, "");

			// *******************Start Mac Address Textbox And Control*******************
			String macAddressV = excelFileDataRecord.get("MacAddress_Value").trim();
			if (!macAddressV.isBlank() && !macAddressV.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				String[] macs = macAddressV.split(":");
				for (int x = 0; x < macAddressTxt.size(); x++) {
					macAddressTxt.get(x).sendKeys(macs[x]);
				}
			}
			Thread.sleep(500);
			// **********************Start Advanced Tab***********************************
			String advanced_label = excelFileDataRecord.get("Advanced_label").trim();
			String advanced_Default = excelFileDataRecord.get("Advanced_Default").trim();
			String advanced_Select = excelFileDataRecord.get("Advanced_Select").trim();
			if (!advanced_label.isBlank() && !advanced_label.isEmpty()) {
				assertEquals(advancedTabControl.getText(), advanced_label, "Advanced Tab Control Label Comparision", true,
						rowNumber, sheetName);
			}
			if (!advanced_Select.isBlank() && !advanced_Select.isEmpty()) {
				element_Click(advancedTabControl);
				Thread.sleep(250);
			}
			if (!advanced_Default.isBlank() && !advanced_Default.isEmpty()) {
				String deviceGetID = advancedTabControlActiveOrNot.getAttribute("class");
				String value = null;
				if (deviceGetID.toLowerCase().contains("tab-active")) {
					value = "tab-active";
				} else {
					value = "tab-non-active";
				}
				assertEquals(value, advanced_Default, "Advanced Tab Control Label Comparision", true, rowNumber,
						sheetName);
			}
			
			// **********************Start Settings Tab***********************************
						String settings_label = excelFileDataRecord.get("Settings_label").trim();
						String settings_Default = excelFileDataRecord.get("Settings_Default").trim();
						String settings_Select = excelFileDataRecord.get("Settings_Select").trim();
						if (!settings_label.isBlank() && !settings_label.isEmpty()) {
							assertEquals(settingsTabControl.getText(), settings_label, "Settings Tab Control Label Comparision", true,
									rowNumber, sheetName);
						}
						if (!settings_Select.isBlank() && !settings_Select.isEmpty()) {
							element_Click(settingsTabControl);
							Thread.sleep(250);
						}
						if (!settings_Default.isBlank() && !settings_Default.isEmpty()) {
							String deviceGetID = settingsTabControlActiveOrNot.getAttribute("class");
							String value = null;
							if (deviceGetID.toLowerCase().contains("tab-active")) {
								value = "tab-active";
							} else {
								value = "tab-non-active";
							}
							assertEquals(value, settings_Default, "Settings Tab Control Label Comparision", true, rowNumber,
									sheetName);
						}
						
			// *****Generate Exit Switch Events - checkbox****
			String generateExitSwitchEventsLab = excelFileDataRecord.get("GenerateExitSwitchEvents_label").trim();
			String generateExitSwitchEventsTy = excelFileDataRecord.get("GenerateExitSwitchEvents_Type").trim();
			String generateExitSwitchEventsVi = excelFileDataRecord.get("GenerateExitSwitchEvents_Visibility").trim();
			String generateExitSwitchEvents_default = excelFileDataRecord.get("GenerateExitSwitchEvents_Default_Value").trim();
			String generateExitSwitchEventsV = excelFileDataRecord.get("GenerateExitSwitchEvents_Value").trim();
			checkbox_Check_UIValidation("Generate Exit Switch Events", rowNumber, sheetName, advanced_settings_GenerateExitSwitchEvents_Chkbox_Label,
					advanced_settings_GenerateExitSwitchEvents_Chkbox, generateExitSwitchEventsLab, generateExitSwitchEventsTy, generateExitSwitchEventsVi,
					generateExitSwitchEvents_default, generateExitSwitchEventsV);
			
			// *****Generate Invalid User Events - checkbox****
						String generateInvalidUserEventsLab = excelFileDataRecord.get("GenerateInvalidUserEvents_label").trim();
						String generateInvalidUserEventsTy = excelFileDataRecord.get("GenerateInvalidUserEvents_Type").trim();
						String generateInvalidUserEventsVi = excelFileDataRecord.get("GenerateInvalidUserEvents_Visibility").trim();
						String generateInvalidUserEvents_default = excelFileDataRecord.get("GenerateInvalidUserEvents_Default_Value").trim();
						String generateInvalidUserEventsV = excelFileDataRecord.get("GenerateInvalidUserEvents_Value").trim();
						checkbox_Check_UIValidation("Generate Invalid User Events", rowNumber, sheetName, advanced_settings_GenerateInvalidUserEvents_Chkbox_Label,
								advanced_settings_GenerateInvalidUserEvents_Chkbox, generateInvalidUserEventsLab, generateInvalidUserEventsTy, generateInvalidUserEventsVi,
								generateInvalidUserEvents_default, generateInvalidUserEventsV);
						
						// *****Generate Sequential IN-OUT Events - checkbox****
						String generateSequentialINOUTEventsLab = excelFileDataRecord.get("GenerateSequentialINOUTEvents_label").trim();
						String generateSequentialINOUTEventsTy = excelFileDataRecord.get("GenerateSequentialINOUTEvents_Type").trim();
						String generateSequentialINOUTEventsVi = excelFileDataRecord.get("GenerateSequentialINOUTEvents_Visibility").trim();
						String generateSequentialINOUTEvents_default = excelFileDataRecord.get("GenerateSequentialINOUTEvents_Default_Value").trim();
						String generateSequentialINOUTEventsV = excelFileDataRecord.get("GenerateSequentialINOUTEvents_Value").trim();
						checkbox_Check_UIValidation("Generate Sequential IN-OUT Events", rowNumber, sheetName, advanced_settings_GenerateSequentialINOUTEvents_Chkbox_Label,
								advanced_settings_GenerateSequentialINOUTEvents_Chkbox, generateSequentialINOUTEventsLab, generateSequentialINOUTEventsTy, generateSequentialINOUTEventsVi,
								generateSequentialINOUTEvents_default, generateSequentialINOUTEventsV);
						
						// *****Show PIN - checkbox****
						String showPINLab = excelFileDataRecord.get("ShowPIN_label").trim();
						String showPINTy = excelFileDataRecord.get("ShowPIN_Type").trim();
						String showPINVi = excelFileDataRecord.get("ShowPIN_Visibility").trim();
						String showPIN_default = excelFileDataRecord.get("ShowPIN_Default_Value").trim();
						String showPINV = excelFileDataRecord.get("ShowPIN_Value").trim();
						checkbox_Check_UIValidation("Show PIN", rowNumber, sheetName, advanced_settings_ShowPIN_Chkbox_Label,
								advanced_settings_ShowPIN_Chkbox, showPINLab, showPINTy, showPINVi,
								showPIN_default, showPINV);
						
						// *****Allow Exit when Door Lock - checkbox****
						String allowExitwhenDoorLockLab = excelFileDataRecord.get("AllowExitwhenDoorLock_label").trim();
						String allowExitwhenDoorLockTy = excelFileDataRecord.get("AllowExitwhenDoorLock_Type").trim();
						String allowExitwhenDoorLockVi = excelFileDataRecord.get("AllowExitwhenDoorLock_Visibility").trim();
						String allowExitwhenDoorLock_default = excelFileDataRecord.get("AllowExitwhenDoorLock_Default_Value").trim();
						String allowExitwhenDoorLockV = excelFileDataRecord.get("AllowExitwhenDoorLock_Value").trim();
						checkbox_Check_UIValidation("Allow Exit when Door Lock", rowNumber, sheetName, advanced_settings_AllowExitwhenDoorLock_Chkbox_Label,
								advanced_settings_AllowExitwhenDoorLock_Chkbox, allowExitwhenDoorLockLab, allowExitwhenDoorLockTy, allowExitwhenDoorLockVi,
								allowExitwhenDoorLock_default, allowExitwhenDoorLockV);
						
						// *****Auto Relock - checkbox****
						String autoRelockLab = excelFileDataRecord.get("AutoRelock_label").trim();
						String autoRelockTy = excelFileDataRecord.get("AutoRelock_Type").trim();
						String autoRelockVi = excelFileDataRecord.get("AutoRelock_Visibility").trim();
						String autoRelock_default = excelFileDataRecord.get("AutoRelock_Default_Value").trim();
						String autoRelockV = excelFileDataRecord.get("AutoRelock_Value").trim();
						checkbox_Check_UIValidation("Auto Relock", rowNumber, sheetName, advanced_settings_AutoRelock_Chkbox_Label,
								advanced_settings_AutoRelock_Chkbox, autoRelockLab, autoRelockTy, autoRelockVi,
								autoRelock_default, autoRelockV);
						
						// *******************Start Auto Relock Timer (Sec) - Textbox*******************
						String autoRelockTimerLab = excelFileDataRecord.get("AutoRelockTimer_Label").trim();
						String autoRelockTimerTy = excelFileDataRecord.get("AutoRelockTimer_Type").trim();
						String autoRelockTimerVi = excelFileDataRecord.get("AutoRelockTimer_Visibility").trim();
						String autoRelockTimerP = excelFileDataRecord.get("AutoRelockTimer_Placeholder").trim();
						String autoRelockTimer_default = excelFileDataRecord.get("AutoRelockTimer_Default_Value").trim();
						String autoRelockTimerV = excelFileDataRecord.get("AutoRelockTimer_Value").trim();
						String autoRelockTimerNegative = excelFileDataRecord.get("AutoRelockTimer_Negative").trim();
						textBox_Control_Check_UIValidation("Auto Relock Timer (Sec)", rowNumber, sheetName, advanced_settings_AutoRelockTimer_Txtbox_Label,
								advanced_settings_AutoRelockTimer_Txtbox, autoRelockTimerLab, autoRelockTimerTy, autoRelockTimerVi, autoRelockTimerP,
								autoRelockTimer_default, autoRelockTimerV, autoRelockTimerNegative);
						
						// *****Enable Additional Security - checkbox****
						String enableAdditionalSecurityLab = excelFileDataRecord.get("EnableAdditionalSecurity_label").trim();
						String enableAdditionalSecurityTy = excelFileDataRecord.get("EnableAdditionalSecurity_Type").trim();
						String enableAdditionalSecurityVi = excelFileDataRecord.get("EnableAdditionalSecurity_Visibility").trim();
						String enableAdditionalSecurity_default = excelFileDataRecord.get("EnableAdditionalSecurity_Default_Value").trim();
						String enableAdditionalSecurityV = excelFileDataRecord.get("EnableAdditionalSecurity_Value").trim();
						checkbox_Check_UIValidation("Enable Additional Security", rowNumber, sheetName, advanced_settings_EnableAdditionalSecurity_Chkbox_Label,
								advanced_settings_EnableAdditionalSecurity_Chkbox, enableAdditionalSecurityLab, enableAdditionalSecurityTy, enableAdditionalSecurityVi,
								enableAdditionalSecurity_default, enableAdditionalSecurityV);
						
						// *******************Additional Security Code - Textbox*******************
						String additionalSecurityCodeLab = excelFileDataRecord.get("AdditionalSecurityCode_Label").trim();
						String additionalSecurityCodeTy = excelFileDataRecord.get("AdditionalSecurityCode_Type").trim();
						String additionalSecurityCodeVi = excelFileDataRecord.get("AdditionalSecurityCode_Visibility").trim();
						String additionalSecurityCodeP = excelFileDataRecord.get("AdditionalSecurityCode_Placeholder").trim();
						String additionalSecurityCode_default = excelFileDataRecord.get("AdditionalSecurityCode_Default_Value").trim();
						String additionalSecurityCodeV = excelFileDataRecord.get("AdditionalSecurityCode_Value").trim();
						String additionalSecurityCodeNegative = excelFileDataRecord.get("AdditionalSecurityCode_Negative").trim();
						textBox_Control_Check_UIValidation("Additional Security Code", rowNumber, sheetName, advanced_settings_AdditionalSecurityCode_Textbox_Label,
								advanced_settings_AdditionalSecurityCode_Textbox, additionalSecurityCodeLab, additionalSecurityCodeTy, additionalSecurityCodeVi, additionalSecurityCodeP,
								additionalSecurityCode_default, additionalSecurityCodeV, additionalSecurityCodeNegative);
						
						// *******************Re-enter Code - Textbox*******************
						String reenterCodeLab = excelFileDataRecord.get("ReenterCode_Label").trim();
						String reenterCodeTy = excelFileDataRecord.get("ReenterCode_Type").trim();
						String reenterCodeVi = excelFileDataRecord.get("ReenterCode_Visibility").trim();
						String reenterCodeP = excelFileDataRecord.get("ReenterCode_Placeholder").trim();
						String reenterCode_default = excelFileDataRecord.get("ReenterCode_Default_Value").trim();
						String reenterCodeV = excelFileDataRecord.get("ReenterCode_Value").trim();
						String reenterCodeNegative = excelFileDataRecord.get("ReenterCode_Negative").trim();
						textBox_Control_Check_UIValidation("Re-enter Code", rowNumber, sheetName, advanced_settings_ReenterCode_Textbox_Label,
								advanced_settings_ReenterCode_Textbox, reenterCodeLab, reenterCodeTy, reenterCodeVi, reenterCodeP,
								reenterCode_default, reenterCodeV, reenterCodeNegative);
						
						// *******************Default Button - Button*******************
						String defaultClick = excelFileDataRecord.get("DefaultBtn_Click").trim();
						if(defaultClick!=null || !defaultClick.isEmpty()) {
							if(defaultClick.equalsIgnoreCase("click"))
								element_Click(advanced_settings_Default_Btn);
						}
						
						// *****Enable Smart Identification - checkbox****
						String enableSmartIdentificationLab = excelFileDataRecord.get("EnableSmartIdentification_label").trim();
						String enableSmartIdentificationTy = excelFileDataRecord.get("EnableSmartIdentification_Type").trim();
						String enableSmartIdentificationVi = excelFileDataRecord.get("EnableSmartIdentification_Visibility").trim();
						String enableSmartIdentification_default = excelFileDataRecord.get("EnableSmartIdentification_Default_Value").trim();
						String enableSmartIdentificationV = excelFileDataRecord.get("EnableSmartIdentification_Value").trim();
						checkbox_Check_UIValidation("Enable Smart Identification", rowNumber, sheetName, advanced_settings_EnableSmartIdentification_Chkbox_Label,
								advanced_settings_EnableSmartIdentification_Chkbox, enableSmartIdentificationLab, enableSmartIdentificationTy, enableSmartIdentificationVi,
								enableSmartIdentification_default, enableSmartIdentificationV);
						
						// Access Level - Dropdown
						String accessLevel_label = excelFileDataRecord.get("AccessLevel_label").trim();
						String accessLevel_Type = excelFileDataRecord.get("AccessLevel_Type").trim();
						String accessLevel_Visibility = excelFileDataRecord.get("AccessLevel_Visibility").trim();
						String accessLevel_Default_Value = excelFileDataRecord.get("AccessLevel_Default_Value").trim();
						String accessLevel_Select_Values = excelFileDataRecord.get("AccessLevel_Select_Values").trim();
						String accessLevel_Values = excelFileDataRecord.get("AccessLevel_Values").trim();
						dropDown_Check_UIValidation("Access Level", rowNumber, sheetName, advanced_settings_AccessLevel_Dropdown_Label,
								advanced_settings_AccessLevel_Dropdown, advanced_settings_AccessLevel_Dropdown_Size, accessLevel_label,
								accessLevel_Type, accessLevel_Visibility, accessLevel_Default_Value,
								accessLevel_Select_Values, accessLevel_Values, "");
						
						// Access Mode - Dropdown
						String accessMode_label = excelFileDataRecord.get("AccessMode_label").trim();
						String accessMode_Type = excelFileDataRecord.get("AccessMode_Type").trim();
						String accessMode_Visibility = excelFileDataRecord.get("AccessMode_Visibility").trim();
						String accessMode_Default_Value = excelFileDataRecord.get("AccessMode_Default_Value").trim();
						String accessMode_Select_Values = excelFileDataRecord.get("AccessMode_Select_Values").trim();
						String accessMode_Values = excelFileDataRecord.get("AccessMode_Values").trim();
						dropDown_Check_UIValidation("Access Mode", rowNumber, sheetName, advanced_settings_AccessMode_Dropdown_Label,
								advanced_settings_AccessMode_Dropdown, advanced_settings_AccessMode_Dropdown_Size, accessMode_label,
								accessMode_Type, accessMode_Visibility, accessMode_Default_Value,
								accessMode_Select_Values, accessMode_Values, "");
						
						// *****Auto Acknowledge Alarm - checkbox****
						String autoAcknowledgeAlarmLab = excelFileDataRecord.get("AutoAcknowledgeAlarm_label").trim();
						String autoAcknowledgeAlarmTy = excelFileDataRecord.get("AutoAcknowledgeAlarm_Type").trim();
						String autoAcknowledgeAlarmVi = excelFileDataRecord.get("AutoAcknowledgeAlarm_Visibility").trim();
						String autoAcknowledgeAlarm_default = excelFileDataRecord.get("AutoAcknowledgeAlarm_Default_Value").trim();
						String autoAcknowledgeAlarmV = excelFileDataRecord.get("AutoAcknowledgeAlarm_Value").trim();
						checkbox_Check_UIValidation("Auto Acknowledge Alarm", rowNumber, sheetName, advanced_settings_AutoAcknowledgeAlarm_Chkbox_Label,
								advanced_settings_AutoAcknowledgeAlarm_Chkbox, autoAcknowledgeAlarmLab, autoAcknowledgeAlarmTy, autoAcknowledgeAlarmVi,
								autoAcknowledgeAlarm_default, autoAcknowledgeAlarmV);
						
						// *******************Auto Acknowledge Alarm (Sec) - Textbox*******************
						String autoAcknowledgeAlarmSecLab = excelFileDataRecord.get("AutoAcknowledgeAlarmSec_Label").trim();
						String autoAcknowledgeAlarmSecTy = excelFileDataRecord.get("AutoAcknowledgeAlarmSec_Type").trim();
						String autoAcknowledgeAlarmSecVi = excelFileDataRecord.get("AutoAcknowledgeAlarmSec_Visibility").trim();
						String autoAcknowledgeAlarmSecP = excelFileDataRecord.get("AutoAcknowledgeAlarmSec_Placeholder").trim();
						String autoAcknowledgeAlarmSec_default = excelFileDataRecord.get("AutoAcknowledgeAlarmSec_Default_Value").trim();
						String autoAcknowledgeAlarmSecV = excelFileDataRecord.get("AutoAcknowledgeAlarmSec_Value").trim();
						String autoAcknowledgeAlarmSecNegative = excelFileDataRecord.get("AutoAcknowledgeAlarmSec_Negative").trim();
						textBox_Control_Check_UIValidation("Auto Acknowledge Alarm (Sec)", rowNumber, sheetName, advanced_settings_AutoAcknowledgeAlarm_Txtbox_Label,
								advanced_settings_AutoAcknowledgeAlarm_Txtbox, autoAcknowledgeAlarmSecLab, autoAcknowledgeAlarmSecTy, autoAcknowledgeAlarmSecVi, autoAcknowledgeAlarmSecP,
								autoAcknowledgeAlarmSec_default, autoAcknowledgeAlarmSecV, autoAcknowledgeAlarmSecNegative);
						
						// *******************Facility Code - Textbox*******************
						String facilityCodeLab = excelFileDataRecord.get("FacilityCode_Label").trim();
						String facilityCodeTy = excelFileDataRecord.get("FacilityCode_Type").trim();
						String facilityCodeVi = excelFileDataRecord.get("FacilityCode_Visibility").trim();
						String facilityCodeP = excelFileDataRecord.get("FacilityCode_Placeholder").trim();
						String facilityCode_default = excelFileDataRecord.get("FacilityCode_Default_Value").trim();
						String facilityCodeV = excelFileDataRecord.get("FacilityCode_Value").trim();
						String facilityCodeNegative = excelFileDataRecord.get("FacilityCode_Negative").trim();
						textBox_Control_Check_UIValidation("Facility Code", rowNumber, sheetName, advanced_settings_FacilityCode_Txtbox_Label,
								advanced_settings_FacilityCode_Txtbox, facilityCodeLab, facilityCodeTy, facilityCodeVi, facilityCodeP,
								facilityCode_default, facilityCodeV, facilityCodeNegative);
						
						// *****Allow Access Through Mobile - checkbox****
						String allowAccessThroughMobileLab = excelFileDataRecord.get("AllowAccessThroughMobile_label").trim();
						String allowAccessThroughMobileTy = excelFileDataRecord.get("AllowAccessThroughMobile_Type").trim();
						String allowAccessThroughMobileVi = excelFileDataRecord.get("AllowAccessThroughMobile_Visibility").trim();
						String allowAccessThroughMobile_default = excelFileDataRecord.get("AllowAccessThroughMobile_Default_Value").trim();
						String allowAccessThroughMobileV = excelFileDataRecord.get("AllowAccessThroughMobile_Value").trim();
						checkbox_Check_UIValidation("Allow Access Through Mobile", rowNumber, sheetName, advanced_settings_AllowAccessThroughMobile_Chkbox_Label,
								advanced_settings_AllowAccessThroughMobile_Chkbox, allowAccessThroughMobileLab, allowAccessThroughMobileTy, allowAccessThroughMobileVi,
								allowAccessThroughMobile_default, allowAccessThroughMobileV);
						
						// Mobile Entry Access Mode - Dropdown
						String mobileEntryAccessMode_label = excelFileDataRecord.get("MobileEntryAccessMode_label").trim();
						String mobileEntryAccessMode_Type = excelFileDataRecord.get("MobileEntryAccessMode_Type").trim();
						String mobileEntryAccessMode_Visibility = excelFileDataRecord.get("MobileEntryAccessMode_Visibility").trim();
						String mobileEntryAccessMode_Default_Value = excelFileDataRecord.get("MobileEntryAccessMode_Default_Value").trim();
						String mobileEntryAccessMode_Select_Values = excelFileDataRecord.get("MobileEntryAccessMode_Select_Values").trim();
						String mobileEntryAccessMode_Values = excelFileDataRecord.get("MobileEntryAccessMode_Values").trim();
						dropDown_Check_UIValidation("Mobile Entry Access Mode", rowNumber, sheetName, advanced_settings_MobileEntryAccessMode_Dropdown_Label,
								advanced_settings_MobileEntryAccessMode_Dropdown, advanced_settings_MobileEntryAccessMode_Dropdown_Size, mobileEntryAccessMode_label,
								mobileEntryAccessMode_Type, mobileEntryAccessMode_Visibility, mobileEntryAccessMode_Default_Value,
								mobileEntryAccessMode_Select_Values, mobileEntryAccessMode_Values, "");
						
						// Mobile Exit Access Mode - Dropdown
						String mobileExitAccessMode_label = excelFileDataRecord.get("MobileExitAccessMode_label").trim();
						String mobileExitAccessMode_Type = excelFileDataRecord.get("MobileExitAccessMode_Type").trim();
						String mobileExitAccessMode_Visibility = excelFileDataRecord.get("MobileExitAccessMode_Visibility").trim();
						String mobileExitAccessMode_Default_Value = excelFileDataRecord.get("MobileExitAccessMode_Default_Value").trim();
						String mobileExitAccessMode_Select_Values = excelFileDataRecord.get("MobileExitAccessMode_Select_Values").trim();
						String mobileExitAccessMode_Values = excelFileDataRecord.get("MobileExitAccessMode_Values").trim();
						dropDown_Check_UIValidation("Mobile Exit Access Mode", rowNumber, sheetName, advanced_settings_MobileExitAccessMode_Dropdown_Label,
								advanced_settings_MobileExitAccessMode_Dropdown, advanced_settings_MobileExitAccessMode_Dropdown_Size, mobileExitAccessMode_label,
								mobileExitAccessMode_Type, mobileExitAccessMode_Visibility, mobileExitAccessMode_Default_Value,
								mobileExitAccessMode_Select_Values, mobileExitAccessMode_Values, "");
						
						// *******************Mobile Entry Access Mode - Info Icon*******************
						String infoIconVisibility = excelFileDataRecord.get("MobileEntryAccessMode_InfoIcon_Visibility").trim();
						String infoIconTooltip = excelFileDataRecord.get("MobileEntryAccessMode_InfoIcon_Tooltip").trim();

						infoIcon_UIValidation("Mobile Entry Access Mode", rowNumber, sheetName,
								advanced_settings_MobileEntryAccessMode_Dropdown_InfoIcon, infoIconVisibility, infoIconTooltip);
						
						// *******************Mobile Exit Access Mode - Info Icon*******************
						String infoIconVisibility1 = excelFileDataRecord.get("MobileExitAccessMode_InfoIcon_Visibility").trim();
						String infoIconTooltip1 = excelFileDataRecord.get("MobileExitAccessMode_InfoIcon_Tooltip").trim();

						infoIcon_UIValidation("Mobile Exit Access Mode", rowNumber, sheetName,
								advanced_settings_MobileExitAccessMode_Dropdown_InfoIcon, infoIconVisibility1, infoIconTooltip1);
						
						// *****Show Attendance Details - checkbox****
						String showAttendanceDetailsLab = excelFileDataRecord.get("ShowAttendanceDetails_label").trim();
						String showAttendanceDetailsTy = excelFileDataRecord.get("ShowAttendanceDetails_Type").trim();
						String showAttendanceDetailsVi = excelFileDataRecord.get("ShowAttendanceDetails_Visibility").trim();
						String showAttendanceDetails_default = excelFileDataRecord.get("ShowAttendanceDetails_Default_Value").trim();
						String showAttendanceDetailsV = excelFileDataRecord.get("ShowAttendanceDetails_Value").trim();
						checkbox_Check_UIValidation("Show Attendance Details", rowNumber, sheetName, advanced_settings_ShowAttendanceDetails_Chkbox_Label,
								advanced_settings_ShowAttendanceDetails_Chkbox, showAttendanceDetailsLab, showAttendanceDetailsTy, showAttendanceDetailsVi,
								showAttendanceDetails_default, showAttendanceDetailsV);
						
						// *******************Attendance Display Duration (Sec) - Textbox*******************
						String attendanceDisplayDurationSecLab = excelFileDataRecord.get("AttendanceDisplayDurationSec_Label").trim();
						String attendanceDisplayDurationSecTy = excelFileDataRecord.get("AttendanceDisplayDurationSec_Type").trim();
						String attendanceDisplayDurationSecVi = excelFileDataRecord.get("AttendanceDisplayDurationSec_Visibility").trim();
						String attendanceDisplayDurationSecP = excelFileDataRecord.get("AttendanceDisplayDurationSec_Placeholder").trim();
						String attendanceDisplayDurationSec_default = excelFileDataRecord.get("AttendanceDisplayDurationSec_Default_Value").trim();
						String attendanceDisplayDurationSecV = excelFileDataRecord.get("AttendanceDisplayDurationSec_Value").trim();
						String attendanceDisplayDurationSecNegative = excelFileDataRecord.get("AttendanceDisplayDurationSec_Negative").trim();
						textBox_Control_Check_UIValidation("Attendance Display Duration (Sec)", rowNumber, sheetName, advanced_settings_AttendanceDisplayDuration_Label,
								advanced_settings_AttendanceDisplayDuration_Txtbox, attendanceDisplayDurationSecLab, attendanceDisplayDurationSecTy, attendanceDisplayDurationSecVi, attendanceDisplayDurationSecP,
								attendanceDisplayDurationSec_default, attendanceDisplayDurationSecV, attendanceDisplayDurationSecNegative);
						
						// *******************Duplicate Access Time Interval (Sec) - Textbox*******************
						String duplicateAccessTimeIntervalSecLab = excelFileDataRecord.get("DuplicateAccessTimeIntervalSec_Label").trim();
						String duplicateAccessTimeIntervalSecTy = excelFileDataRecord.get("DuplicateAccessTimeIntervalSec_Type").trim();
						String duplicateAccessTimeIntervalSecVi = excelFileDataRecord.get("DuplicateAccessTimeIntervalSec_Visibility").trim();
						String duplicateAccessTimeIntervalSecP = excelFileDataRecord.get("DuplicateAccessTimeIntervalSec_Placeholder").trim();
						String duplicateAccessTimeIntervalSec_default = excelFileDataRecord.get("DuplicateAccessTimeIntervalSec_Default_Value").trim();
						String duplicateAccessTimeIntervalSecV = excelFileDataRecord.get("DuplicateAccessTimeIntervalSec_Value").trim();
						String duplicateAccessTimeIntervalSecNegative = excelFileDataRecord.get("DuplicateAccessTimeIntervalSec_Negative").trim();
						textBox_Control_Check_UIValidation("Duplicate Access Time Interval (Sec)", rowNumber, sheetName, advanced_settings_DuplicateAccessTimeInterval_Label,
								advanced_settings_DuplicateAccessTimeInterval_Txtbox, duplicateAccessTimeIntervalSecLab, duplicateAccessTimeIntervalSecTy, duplicateAccessTimeIntervalSecVi, duplicateAccessTimeIntervalSecP,
								duplicateAccessTimeIntervalSec_default, duplicateAccessTimeIntervalSecV, duplicateAccessTimeIntervalSecNegative);
						
						// *****Enable Face Mask Compulsion - checkbox****
						String faceMaskCompulsionLab = excelFileDataRecord.get("FaceMaskCompulsion_label").trim();
						String faceMaskCompulsionTy = excelFileDataRecord.get("FaceMaskCompulsion_Type").trim();
						String faceMaskCompulsionVi = excelFileDataRecord.get("FaceMaskCompulsion_Visibility").trim();
						String faceMaskCompulsion_default = excelFileDataRecord.get("FaceMaskCompulsion_Default_Value").trim();
						String faceMaskCompulsionV = excelFileDataRecord.get("FaceMaskCompulsion_Value").trim();
						checkbox_Check_UIValidation("Enable", rowNumber, sheetName, advanced_settings_FaceMaskEnable_Chkbox_Label,
								advanced_settings_FaceMaskEnable_Chkbox, faceMaskCompulsionLab, faceMaskCompulsionTy, faceMaskCompulsionVi,
								faceMaskCompulsion_default, faceMaskCompulsionV);
						
						// *******************Enable Face Mask Compulsion - Info Icon*******************
						String infoIconVisibility2 = excelFileDataRecord.get("FaceMaskEnable_InfoIcon_Visibility").trim();
						String infoIconTooltip2 = excelFileDataRecord.get("FaceMaskEnable_InfoIcon_Tooltip").trim();

						infoIcon_UIValidation("Enable", rowNumber, sheetName,
								advanced_settings_FaceMaskEnable_Chkbox_InfoIcon, infoIconVisibility2, infoIconTooltip2);
						
						// *******************Approach to Camera Wait-Timer (Sec) - Textbox*******************
						String approachtoCameraWaitTimerLab = excelFileDataRecord.get("ApproachtoCameraWaitTimer_Label").trim();
						String approachtoCameraWaitTimerTy = excelFileDataRecord.get("ApproachtoCameraWaitTimer_Type").trim();
						String approachtoCameraWaitTimerVi = excelFileDataRecord.get("ApproachtoCameraWaitTimer_Visibility").trim();
						String approachtoCameraWaitTimerP = excelFileDataRecord.get("ApproachtoCameraWaitTimer_Placeholder").trim();
						String approachtoCameraWaitTimer_default = excelFileDataRecord.get("ApproachtoCameraWaitTimer_Default_Value").trim();
						String approachtoCameraWaitTimerV = excelFileDataRecord.get("ApproachtoCameraWaitTimer_Value").trim();
						String approachtoCameraWaitTimerNegative = excelFileDataRecord.get("ApproachtoCameraWaitTimer_Negative").trim();
						textBox_Control_Check_UIValidation("Approach to Camera Wait-Timer (Sec)", rowNumber, sheetName, advanced_settings_ApproachtoCameraWaitTimer_Txtbox_Label,
								advanced_settings_ApproachtoCameraWaitTimer_Txtbox, approachtoCameraWaitTimerLab, approachtoCameraWaitTimerTy, approachtoCameraWaitTimerVi, approachtoCameraWaitTimerP,
								approachtoCameraWaitTimer_default, approachtoCameraWaitTimerV, approachtoCameraWaitTimerNegative);
						
						// *******************Mask Detection Time Out (Sec) - Textbox*******************
						String maskDetectionTimeOutLab = excelFileDataRecord.get("MaskDetectionTimeOut_Label").trim();
						String maskDetectionTimeOutTy = excelFileDataRecord.get("MaskDetectionTimeOut_Type").trim();
						String maskDetectionTimeOutVi = excelFileDataRecord.get("MaskDetectionTimeOut_Visibility").trim();
						String maskDetectionTimeOutP = excelFileDataRecord.get("MaskDetectionTimeOut_Placeholder").trim();
						String maskDetectionTimeOut_default = excelFileDataRecord.get("MaskDetectionTimeOut_Default_Value").trim();
						String maskDetectionTimeOutV = excelFileDataRecord.get("MaskDetectionTimeOut_Value").trim();
						String maskDetectionTimeOutNegative = excelFileDataRecord.get("MaskDetectionTimeOut_Negative").trim();
						textBox_Control_Check_UIValidation("Mask Detection Time Out (Sec)", rowNumber, sheetName, advanced_settings_MaskDetectionTimeOut_Txtbox_Label,
								advanced_settings_MaskDetectionTimeOut_Txtbox, maskDetectionTimeOutLab, maskDetectionTimeOutTy, maskDetectionTimeOutVi, maskDetectionTimeOutP,
								maskDetectionTimeOut_default, maskDetectionTimeOutV, maskDetectionTimeOutNegative);
						
						// Restriction Type - Dropdown
						String restrictionType_label = excelFileDataRecord.get("RestrictionType_label").trim();
						String restrictionType_Type = excelFileDataRecord.get("RestrictionType_Type").trim();
						String restrictionType_Visibility = excelFileDataRecord.get("RestrictionType_Visibility").trim();
						String restrictionType_Default_Value = excelFileDataRecord.get("RestrictionType_Default_Value").trim();
						String restrictionType_Select_Values = excelFileDataRecord.get("RestrictionType_Select_Values").trim();
						String restrictionType_Values = excelFileDataRecord.get("RestrictionType_Values").trim();
						dropDown_Check_UIValidation("Restriction Type", rowNumber, sheetName, advanced_settings_RestrictionType_Dropdown_Label,
								advanced_settings_RestrictionType_Dropdown, advanced_settings_RestrictionType_Dropdown_Size, restrictionType_label,
								restrictionType_Type, restrictionType_Visibility, restrictionType_Default_Value,
								restrictionType_Select_Values, restrictionType_Values, "");
			
			// Save button then checked main validation
						saveButtonClick();
						valMsg = validationMessage();
						String excelVal = excelFileDataRecord.get("Validation").trim();
						if (!excelVal.isBlank() && !excelVal.isEmpty()) {
							assertEquals(valMsg, excelFileDataRecord.get("Validation").trim(),
									"Main Validation on Save button Comparison", true, rowNumber, sheetName);
						}
						Thread.sleep(1500);
						waitForLocatorInVisible(By.id("DevicePageLoader"));
						reloadPageButtonClick();
						waitForLocatorInVisible(By.id("DevicePageLoader"));

					}
				}
	
	@FindBy(id = "chkTampAlm_2")
	private WebElement advanced_alarms_Tamper_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkTampAlm_2']/ancestor::div[@class='form-group']//label[1]")
	private WebElement advanced_alarms_Tamper_Chkbox_Label;
	
	@FindBy(id = "chkDoorAbnrmlAml")
	private WebElement advanced_alarms_DoorAbnormal_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkDoorAbnrmlAml']/ancestor::div[@class='form-group']//label[1]")
	private WebElement advanced_alarms_DoorAbnormal_Chkbox_Label;
	
	@FindBy(id = "chkDoorForceOpenAlm")
	private WebElement advanced_alarms_DoorForceOpen_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkDoorForceOpenAlm']/ancestor::div[@class='form-group']//label[1]")
	private WebElement advanced_alarms_DoorForceOpen_Chkbox_Label;
	
	@FindBy(id = "chkDoorFaultAlm")
	private WebElement advanced_alarms_DoorFault_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkDoorFaultAlm']/ancestor::div[@class='form-group']//label[1]")
	private WebElement advanced_alarms_DoorFault_Chkbox_Label;
	
	@FindBy(id = "chkPanicAlm")
	private WebElement advanced_alarms_Panic_Chkbox;
	
	@FindBy(xpath = "//*[@id='chkPanicAlm']/ancestor::div[@class='form-group']//label[1]")
	private WebElement advanced_alarms_Panic_Chkbox_Label;
	
	@FindBy(id = "FaceMaskAlarm_1")
	private WebElement advanced_alarms_FaceMaskCompulsion_Chkbox;
	
	@FindBy(xpath = "//*[@id='FaceMaskAlarm_1']/ancestor::div[@class='form-group']//label[1]")
	private WebElement advanced_alarms_FaceMaskCompulsion_Chkbox_Label;
	
	@FindBy(xpath = "(//label[text()=\"Alarms\"])[1]")
	private WebElement alarmsTabControl;

	@FindBy(xpath = "(//label[text()=\"Alarms\"])[1]/ancestor::li[1]")
	private WebElement alarmsTabControlActiveOrNot;
	
	public void deviceUIControlValidation_Advanced_Alarms(List<Map<String, String>> data, String sheetName) throws Exception {
		for (int i = 0; i < data.size(); i++) {
			eachRowStatus = false;
			String valMsg = null;
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			Map<String, String> excelFileDataRecord = data.get(i);
			logger.info("***********************************Excel Data Record Picked : Row Number = " + i + " Data is ="
					+ excelFileDataRecord);
			int rowNumber = Integer.parseInt(excelFileDataRecord.get("RowNumber"));
			addButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			waitForElementVisible_TimeinMinutes(selectDeviceTypeBeAddedpopUp, 2);
			for (int j = 0; j < selectDeviceTypeToBeAdded.size(); j++) {
				String title = selectDeviceTypeToBeAdded.get(j).getAttribute("title");
				if (title.equalsIgnoreCase(excelFileDataRecord.get("DeviceType"))) {
					selectDeviceTypeToBeAdded.get(j).click();
					Thread.sleep(500);
					waitForElementClickable(deviceContinue);
					element_Click(deviceContinue);
					Thread.sleep(500);
					break;
				}
			}
			Thread.sleep(500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementClickable(active, 1);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			// *******************Start Device Name Textbox And Control*******************

			String deviceNameV = excelFileDataRecord.get("DeviceName_Value").trim();
			textBox_Control_Check_UIValidation("Device Name", rowNumber, sheetName, deviceidNameLabel, deviceNameTxt,
					"", "", "", "", "", deviceNameV, "");

			// *******************Start Mac Address Textbox And Control*******************
			String macAddressV = excelFileDataRecord.get("MacAddress_Value").trim();
			if (!macAddressV.isBlank() && !macAddressV.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				String[] macs = macAddressV.split(":");
				for (int x = 0; x < macAddressTxt.size(); x++) {
					macAddressTxt.get(x).sendKeys(macs[x]);
				}
			}
			Thread.sleep(500);
			// **********************Start Advanced Tab***********************************
			String advanced_label = excelFileDataRecord.get("Advanced_label").trim();
			String advanced_Default = excelFileDataRecord.get("Advanced_Default").trim();
			String advanced_Select = excelFileDataRecord.get("Advanced_Select").trim();
			if (!advanced_label.isBlank() && !advanced_label.isEmpty()) {
				assertEquals(advancedTabControl.getText(), advanced_label, "Advanced Tab Control Label Comparision", true,
						rowNumber, sheetName);
			}
			if (!advanced_Select.isBlank() && !advanced_Select.isEmpty()) {
				element_Click(advancedTabControl);
				Thread.sleep(250);
			}
			if (!advanced_Default.isBlank() && !advanced_Default.isEmpty()) {
				String deviceGetID = advancedTabControlActiveOrNot.getAttribute("class");
				String value = null;
				if (deviceGetID.toLowerCase().contains("tab-active")) {
					value = "tab-active";
				} else {
					value = "tab-non-active";
				}
				assertEquals(value, advanced_Default, "Advanced Tab Control Label Comparision", true, rowNumber,
						sheetName);
			}
			
			// **********************Start Alarms Tab***********************************
						String alarms_label = excelFileDataRecord.get("Alarms_label").trim();
						String alarms_Default = excelFileDataRecord.get("Alarms_Default").trim();
						String alarms_Select = excelFileDataRecord.get("Alarms_Select").trim();
						if (!alarms_label.isBlank() && !alarms_label.isEmpty()) {
							assertEquals(alarmsTabControl.getText(), alarms_label, "Alarms Tab Control Label Comparision", true,
									rowNumber, sheetName);
						}
						if (!alarms_Select.isBlank() && !alarms_Select.isEmpty()) {
							element_Click(alarmsTabControl);
							Thread.sleep(250);
						}
						if (!alarms_Default.isBlank() && !alarms_Default.isEmpty()) {
							String deviceGetID = alarmsTabControlActiveOrNot.getAttribute("class");
							String value = null;
							if (deviceGetID.toLowerCase().contains("tab-active")) {
								value = "tab-active";
							} else {
								value = "tab-non-active";
							}
							assertEquals(value, alarms_Default, "Alarms Tab Control Label Comparision", true, rowNumber,
									sheetName);
						}
						
			// *****Tamper - checkbox****
			String tamperLab = excelFileDataRecord.get("Tamper_label").trim();
			String tamperTy = excelFileDataRecord.get("Tamper_Type").trim();
			String tamperVi = excelFileDataRecord.get("Tamper_Visibility").trim();
			String tamper_default = excelFileDataRecord.get("Tamper_Default_Value").trim();
			String tamperV = excelFileDataRecord.get("Tamper_Value").trim();
			checkbox_Check_UIValidation("Tamper", rowNumber, sheetName, advanced_alarms_Tamper_Chkbox_Label,
					advanced_alarms_Tamper_Chkbox, tamperLab, tamperTy, tamperVi,
					tamper_default, tamperV);
			
			// *****Door Abnormal - checkbox****
						String doorAbnormalLab = excelFileDataRecord.get("DoorAbnormal_label").trim();
						String doorAbnormalTy = excelFileDataRecord.get("DoorAbnormal_Type").trim();
						String doorAbnormalVi = excelFileDataRecord.get("DoorAbnormal_Visibility").trim();
						String doorAbnormal_default = excelFileDataRecord.get("DoorAbnormal_Default_Value").trim();
						String doorAbnormalV = excelFileDataRecord.get("DoorAbnormal_Value").trim();
						checkbox_Check_UIValidation("Door Abnormal", rowNumber, sheetName, advanced_alarms_DoorAbnormal_Chkbox_Label,
								advanced_alarms_DoorAbnormal_Chkbox, doorAbnormalLab, doorAbnormalTy, doorAbnormalVi,
								doorAbnormal_default, doorAbnormalV);
						
						// *****Door Force Open - checkbox****
						String doorForceOpenLab = excelFileDataRecord.get("DoorForceOpen_label").trim();
						String doorForceOpenTy = excelFileDataRecord.get("DoorForceOpen_Type").trim();
						String doorForceOpenVi = excelFileDataRecord.get("DoorForceOpen_Visibility").trim();
						String doorForceOpen_default = excelFileDataRecord.get("DoorForceOpen_Default_Value").trim();
						String doorForceOpenV = excelFileDataRecord.get("DoorForceOpen_Value").trim();
						checkbox_Check_UIValidation("Door Force Open", rowNumber, sheetName, advanced_alarms_DoorForceOpen_Chkbox_Label,
								advanced_alarms_DoorForceOpen_Chkbox, doorForceOpenLab, doorForceOpenTy, doorForceOpenVi,
								doorForceOpen_default, doorForceOpenV);
						
						// *****Door Fault- checkbox****
						String doorFaultLab = excelFileDataRecord.get("DoorFault_label").trim();
						String doorFaultTy = excelFileDataRecord.get("DoorFault_Type").trim();
						String doorFaultVi = excelFileDataRecord.get("DoorFault_Visibility").trim();
						String doorFault_default = excelFileDataRecord.get("DoorFault_Default_Value").trim();
						String doorFaultV = excelFileDataRecord.get("DoorFault_Value").trim();
						checkbox_Check_UIValidation("Door Fault", rowNumber, sheetName, advanced_alarms_DoorFault_Chkbox_Label,
								advanced_alarms_DoorFault_Chkbox, doorFaultLab, doorFaultTy, doorFaultVi,
								doorFault_default, doorFaultV);
						
						// *****Panic- checkbox****
						String panicLab = excelFileDataRecord.get("Panic_label").trim();
						String panicTy = excelFileDataRecord.get("Panic_Type").trim();
						String panicVi = excelFileDataRecord.get("Panic_Visibility").trim();
						String panic_default = excelFileDataRecord.get("Panic_Default_Value").trim();
						String panicV = excelFileDataRecord.get("Panic_Value").trim();
						checkbox_Check_UIValidation("Panic", rowNumber, sheetName, advanced_alarms_Panic_Chkbox_Label,
								advanced_alarms_Panic_Chkbox, panicLab, panicTy, panicVi,
								panic_default, panicV);
						
						// *****Face Mask Compulsion- checkbox****
						String faceMaskCompulsionLab = excelFileDataRecord.get("FaceMaskCompulsion_label").trim();
						String faceMaskCompulsionTy = excelFileDataRecord.get("FaceMaskCompulsion_Type").trim();
						String faceMaskCompulsionVi = excelFileDataRecord.get("FaceMaskCompulsion_Visibility").trim();
						String faceMaskCompulsion_default = excelFileDataRecord.get("FaceMaskCompulsion_Default_Value").trim();
						String faceMaskCompulsionV = excelFileDataRecord.get("FaceMaskCompulsion_Value").trim();
						checkbox_Check_UIValidation("Face Mask Compulsion", rowNumber, sheetName, advanced_alarms_FaceMaskCompulsion_Chkbox_Label,
								advanced_alarms_FaceMaskCompulsion_Chkbox, faceMaskCompulsionLab, faceMaskCompulsionTy, faceMaskCompulsionVi,
								faceMaskCompulsion_default, faceMaskCompulsionV);
			
			// Save button then checked main validation
			saveButtonClick();
			valMsg = validationMessage();
			String excelVal = excelFileDataRecord.get("Validation").trim();
			if (!excelVal.isBlank() && !excelVal.isEmpty()) {
				assertEquals(valMsg, excelFileDataRecord.get("Validation").trim(),
						"Main Validation on Save button Comparison", true, rowNumber, sheetName);
			}
			Thread.sleep(1500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			reloadPageButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));

		}
	}
	
	@FindBy(id = "IDWTimer")
	private WebElement advanced_timers_InterDigitWaitTimer_txtbox;
	
	@FindBy(xpath = "(//*[@id='IDWTimer']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_timers_InterDigitWaitTimer_txtbox_Label;
	
	@FindBy(id = "MLTACSTimer")
	private WebElement advanced_timers_MultiInputWaitTimer_txtbox;
	
	@FindBy(xpath = "(//*[@id='MLTACSTimer']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_timers_MultiInputWaitTimer_txtbox_Label;
	
	@FindBy(id = "SDCPulseTime")
	private WebElement advanced_timers_DoorOpenPulseTimer_txtbox;
	
	@FindBy(xpath = "(//*[@id='SDCPulseTime']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_timers_DoorOpenPulseTimer_txtbox_Label;
	
	@FindBy(id = "SDCLateEarlyTimer")
	private WebElement advanced_timers_LateINEarlyOUTActiveTimer_txtbox;
	
	@FindBy(xpath = "(//*[@id='SDCLateEarlyTimer']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_timers_LateINEarlyOUTActiveTimer_txtbox_Label;
	
	@FindBy(xpath = "(//label[text()=\"Timers\"])")
	private WebElement timersTabControl;

	@FindBy(xpath = "(//label[text()=\"Timers\"])[1]/ancestor::li[1]")
	private WebElement timersTabControlActiveOrNot;
	
	public void deviceUIControlValidation_Advanced_Timers(List<Map<String, String>> data, String sheetName) throws Exception {
		for (int i = 0; i < data.size(); i++) {
			eachRowStatus = false;
			String valMsg = null;
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			Map<String, String> excelFileDataRecord = data.get(i);
			logger.info("***********************************Excel Data Record Picked : Row Number = " + i + " Data is ="
					+ excelFileDataRecord);
			int rowNumber = Integer.parseInt(excelFileDataRecord.get("RowNumber"));
			addButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			waitForElementVisible_TimeinMinutes(selectDeviceTypeBeAddedpopUp, 2);
			for (int j = 0; j < selectDeviceTypeToBeAdded.size(); j++) {
				String title = selectDeviceTypeToBeAdded.get(j).getAttribute("title");
				if (title.equalsIgnoreCase(excelFileDataRecord.get("DeviceType"))) {
					selectDeviceTypeToBeAdded.get(j).click();
					Thread.sleep(500);
					waitForElementClickable(deviceContinue);
					element_Click(deviceContinue);
					Thread.sleep(500);
					break;
				}
			}
			Thread.sleep(500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementClickable(active, 1);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			// *******************Start Device Name Textbox And Control*******************

			String deviceNameV = excelFileDataRecord.get("DeviceName_Value").trim();
			textBox_Control_Check_UIValidation("Device Name", rowNumber, sheetName, deviceidNameLabel, deviceNameTxt,
					"", "", "", "", "", deviceNameV, "");

			// *******************Start Mac Address Textbox And Control*******************
			String macAddressV = excelFileDataRecord.get("MacAddress_Value").trim();
			if (!macAddressV.isBlank() && !macAddressV.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				String[] macs = macAddressV.split(":");
				for (int x = 0; x < macAddressTxt.size(); x++) {
					macAddressTxt.get(x).sendKeys(macs[x]);
				}
			}
			Thread.sleep(500);
			// **********************Start Advanced Tab***********************************
			String advanced_label = excelFileDataRecord.get("Advanced_label").trim();
			String advanced_Default = excelFileDataRecord.get("Advanced_Default").trim();
			String advanced_Select = excelFileDataRecord.get("Advanced_Select").trim();
			if (!advanced_label.isBlank() && !advanced_label.isEmpty()) {
				assertEquals(advancedTabControl.getText(), advanced_label, "Advanced Tab Control Label Comparision", true,
						rowNumber, sheetName);
			}
			if (!advanced_Select.isBlank() && !advanced_Select.isEmpty()) {
				element_Click(advancedTabControl);
				Thread.sleep(250);
			}
			if (!advanced_Default.isBlank() && !advanced_Default.isEmpty()) {
				String deviceGetID = advancedTabControlActiveOrNot.getAttribute("class");
				String value = null;
				if (deviceGetID.toLowerCase().contains("tab-active")) {
					value = "tab-active";
				} else {
					value = "tab-non-active";
				}
				assertEquals(value, advanced_Default, "Advanced Tab Control Label Comparision", true, rowNumber,
						sheetName);
			}
			
			// **********************Start Timers Tab***********************************
						String timers_label = excelFileDataRecord.get("Timers_label").trim();
						String timers_Default = excelFileDataRecord.get("Timers_Default").trim();
						String timers_Select = excelFileDataRecord.get("Timers_Select").trim();
						if (!timers_label.isBlank() && !timers_label.isEmpty()) {
							assertEquals(timersTabControl.getText(), timers_label, "Timers Tab Control Label Comparision", true,
									rowNumber, sheetName);
						}
						if (!timers_Select.isBlank() && !timers_Select.isEmpty()) {
							element_Click(timersTabControl);
							Thread.sleep(250);
						}
						if (!timers_Default.isBlank() && !timers_Default.isEmpty()) {
							String deviceGetID = timersTabControlActiveOrNot.getAttribute("class");
							String value = null;
							if (deviceGetID.toLowerCase().contains("tab-active")) {
								value = "tab-active";
							} else {
								value = "tab-non-active";
							}
							assertEquals(value, timers_Default, "timers Tab Control Label Comparision", true, rowNumber,
									sheetName);
						}
						
						// *******************Inter Digit Wait Timer(Sec) - Textbox*******************
						String interDigitWaitTimerLab = excelFileDataRecord.get("InterDigitWaitTimer_Label").trim();
						String interDigitWaitTimerTy = excelFileDataRecord.get("InterDigitWaitTimer_Type").trim();
						String interDigitWaitTimerVi = excelFileDataRecord.get("InterDigitWaitTimer_Visibility").trim();
						String interDigitWaitTimerP = excelFileDataRecord.get("InterDigitWaitTimer_Placeholder").trim();
						String interDigitWaitTimer_default = excelFileDataRecord.get("InterDigitWaitTimer_Default_Value").trim();
						String interDigitWaitTimerV = excelFileDataRecord.get("InterDigitWaitTimer_Value").trim();
						String interDigitWaitTimerNegative = excelFileDataRecord.get("InterDigitWaitTimer_Negative").trim();
						textBox_Control_Check_UIValidation("Inter Digit Wait Timer", rowNumber, sheetName, advanced_timers_InterDigitWaitTimer_txtbox_Label,
								advanced_timers_InterDigitWaitTimer_txtbox, interDigitWaitTimerLab, interDigitWaitTimerTy, interDigitWaitTimerVi, interDigitWaitTimerP,
								interDigitWaitTimer_default, interDigitWaitTimerV, interDigitWaitTimerNegative);
						
						// *******************Multi-Input Wait Timer(Sec) - Textbox*******************
						String multiInputWaitTimerLab = excelFileDataRecord.get("MultiInputWaitTimer_Label").trim();
						String multiInputWaitTimerTy = excelFileDataRecord.get("MultiInputWaitTimer_Type").trim();
						String multiInputWaitTimerVi = excelFileDataRecord.get("MultiInputWaitTimer_Visibility").trim();
						String multiInputWaitTimerP = excelFileDataRecord.get("MultiInputWaitTimer_Placeholder").trim();
						String multiInputWaitTimer_default = excelFileDataRecord.get("MultiInputWaitTimer_Default_Value").trim();
						String multiInputWaitTimerV = excelFileDataRecord.get("MultiInputWaitTimer_Value").trim();
						String multiInputWaitTimerNegative = excelFileDataRecord.get("MultiInputWaitTimer_Negative").trim();
						textBox_Control_Check_UIValidation("Multi-Input Wait Timer", rowNumber, sheetName, advanced_timers_MultiInputWaitTimer_txtbox_Label,
								advanced_timers_MultiInputWaitTimer_txtbox, multiInputWaitTimerLab, multiInputWaitTimerTy, multiInputWaitTimerVi, multiInputWaitTimerP,
								multiInputWaitTimer_default, multiInputWaitTimerV, multiInputWaitTimerNegative);
						
						// *******************Door Open Pulse Timer(Sec) - Textbox*******************
						String doorOpenPulseTimerLab = excelFileDataRecord.get("DoorOpenPulseTimer_Label").trim();
						String doorOpenPulseTimerTy = excelFileDataRecord.get("DoorOpenPulseTimer_Type").trim();
						String doorOpenPulseTimerVi = excelFileDataRecord.get("DoorOpenPulseTimer_Visibility").trim();
						String doorOpenPulseTimerP = excelFileDataRecord.get("DoorOpenPulseTimer_Placeholder").trim();
						String doorOpenPulseTimer_default = excelFileDataRecord.get("DoorOpenPulseTimer_Default_Value").trim();
						String doorOpenPulseTimerV = excelFileDataRecord.get("DoorOpenPulseTimer_Value").trim();
						String doorOpenPulseTimerNegative = excelFileDataRecord.get("DoorOpenPulseTimer_Negative").trim();
						textBox_Control_Check_UIValidation("Door Open Pulse Timer", rowNumber, sheetName, advanced_timers_DoorOpenPulseTimer_txtbox_Label,
								advanced_timers_DoorOpenPulseTimer_txtbox, doorOpenPulseTimerLab, doorOpenPulseTimerTy, doorOpenPulseTimerVi, doorOpenPulseTimerP,
								doorOpenPulseTimer_default, doorOpenPulseTimerV, doorOpenPulseTimerNegative);
						
						// *******************Late-IN Early-OUT Active Timer(Min) - Textbox*******************
						String lateINEarlyOUTActiveTimerLab = excelFileDataRecord.get("LateINEarlyOUTActiveTimer_Label").trim();
						String lateINEarlyOUTActiveTimerTy = excelFileDataRecord.get("LateINEarlyOUTActiveTimer_Type").trim();
						String lateINEarlyOUTActiveTimerVi = excelFileDataRecord.get("LateINEarlyOUTActiveTimer_Visibility").trim();
						String lateINEarlyOUTActiveTimerP = excelFileDataRecord.get("LateINEarlyOUTActiveTimer_Placeholder").trim();
						String lateINEarlyOUTActiveTimer_default = excelFileDataRecord.get("LateINEarlyOUTActiveTimer_Default_Value").trim();
						String lateINEarlyOUTActiveTimerV = excelFileDataRecord.get("LateINEarlyOUTActiveTimer_Value").trim();
						String lateINEarlyOUTActiveTimerNegative = excelFileDataRecord.get("LateINEarlyOUTActiveTimer_Negative").trim();
						textBox_Control_Check_UIValidation("Late-IN Early-OUT Active Timer", rowNumber, sheetName, advanced_timers_LateINEarlyOUTActiveTimer_txtbox_Label,
								advanced_timers_LateINEarlyOUTActiveTimer_txtbox, lateINEarlyOUTActiveTimerLab, lateINEarlyOUTActiveTimerTy, lateINEarlyOUTActiveTimerVi, lateINEarlyOUTActiveTimerP,
								lateINEarlyOUTActiveTimer_default, lateINEarlyOUTActiveTimerV, lateINEarlyOUTActiveTimerNegative);
						
						// Save button then checked main validation
						saveButtonClick();
						valMsg = validationMessage();
						String excelVal = excelFileDataRecord.get("Validation").trim();
						if (!excelVal.isBlank() && !excelVal.isEmpty()) {
							assertEquals(valMsg, excelFileDataRecord.get("Validation").trim(),
									"Main Validation on Save button Comparison", true, rowNumber, sheetName);
						}
						Thread.sleep(1500);
						waitForLocatorInVisible(By.id("DevicePageLoader"));
						reloadPageButtonClick();
						waitForLocatorInVisible(By.id("DevicePageLoader"));

					}
				}
	
	@FindBy(id = "cboWgndIntrfc")
	private WebElement advanced_wiegand_WiegandInterface_dropdown;
	
	@FindBy(id = "cboWgndIntrfc")
	private List<WebElement> advanced_wiegand_WiegandInterface_dropdown_Size;
	
	@FindBy(xpath = "(//*[@id='cboWgndIntrfc']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_WiegandInterface_dropdown_Label;
	
	@FindBy(id = "chkPanelSignal")
	private WebElement advanced_wiegand_WaitForPanelSignal_chkbox;
	
	@FindBy(xpath = "(//*[@id='chkPanelSignal']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_WaitForPanelSignal_chkbox_Label;
	
	@FindBy(id = "txtWgndWaitTimer")
	private WebElement advanced_wiegand_SignalWaitTimer_txtbox;
	
	@FindBy(xpath = "(//*[@id='txtWgndWaitTimer']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_SignalWaitTimer_txtbox_Label;
	
	@FindBy(id = "chkWaitForUserVarification")
	private WebElement advanced_wiegand_WaitForUserVerification_chkbox;
	
	@FindBy(xpath = "(//*[@id='chkWaitForUserVarification']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_WaitForUserVerification_chkbox_Label;
	
	@FindBy(id = "cboWgndOPFormat")
	private WebElement advanced_wiegand_WiegandOutputFormat_dropdown;
	
	@FindBy(id = "cboWgndOPFormat")
	private List<WebElement> advanced_wiegand_WiegandOutputFormat_dropdown_Size;
	
	@FindBy(xpath = "(//*[@id='cboWgndOPFormat']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_WiegandOutputFormat_dropdown_Label;
	
	@FindBy(id = "cboWgndSndFrm")
	private WebElement advanced_wiegand_SendFrom_dropdown;
	
	@FindBy(id = "cboWgndSndFrm")
	private List<WebElement> advanced_wiegand_SendFrom_dropdown_Size;
	
	@FindBy(xpath = "(//*[@id='cboWgndSndFrm']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_SendFrom_dropdown_Label;
	
	@FindBy(xpath = "//label[text()=\"Wiegand\"]")
	private WebElement wiegandTabControl;

	@FindBy(xpath = "//label[text()=\"Wiegand\"]/ancestor::li[1]")
	private WebElement wiegandTabControlActiveOrNot;
	
	@FindBy(id = "autoWFAlwEvtID")
	private WebElement advanced_wiegand_ForAllowedEvents;

	@FindBy(id = "autoWFAlwEvtName")
	private WebElement advanced_wiegand_ForAllowedEventsName;
	
	@FindBy(xpath = "//*[@id=\"autoWFAlwEvtName\"]/following-sibling::span[1]//i")
	private WebElement advanced_wiegand_ForAllowedEventsName_PicklistBtn;
	
	@FindBy(xpath = "//*[@id=\"autoWFIdentifedEvtName\"]/following-sibling::span[1]//i")
	private WebElement advanced_wiegand_ForIdentifiedEvents_PicklistBtn;
	
	@FindBy(xpath = "//*[@id=\"autoWFDeniedBioEvtName\"]/following-sibling::span[1]//i")
	private WebElement advanced_wiegand_ForDeniedWithInvalidBiometricEvents_PicklistBtn;
	
	@FindBy(xpath = "//*[@id=\"autoWFDeniedCardEvtName\"]/following-sibling::span[1]//i")
	private WebElement advanced_wiegand_ForDeniedWithInvalidCardEvents_PicklistBtn;
	
	@FindBy(xpath = "//*[@id=\"autoWFDeniedPINEvtName\"]/following-sibling::span[1]//i")
	private WebElement advanced_wiegand_ForDeniedWithInvalidPINEvents_PicklistBtn;
	
	@FindBy(xpath = "//*[@id=\"autoWFDeniedCredTimeOutEvtName\"]/following-sibling::span[1]//i")
	private WebElement advanced_wiegand_ForDeniedWithCredentialTimeOutEvents_PicklistBtn;

	@FindBy(xpath = "//*[@id='autoWFAlwEvtID']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_wiegand_ForAllowedEventsName_label;
	
	@FindBy(id = "autoWFIdentifedEvtID")
	private WebElement advanced_wiegand_ForIdentifiedEvents;

	@FindBy(id = "autoWFIdentifedEvtName")
	private WebElement advanced_wiegand_ForIdentifiedEventsName;

	@FindBy(xpath = "//*[@id='autoWFIdentifedEvtID']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_wiegand_ForIdentifiedEvents_label;
	
	@FindBy(id = "autoWFDeniedBioEvtID")
	private WebElement advanced_wiegand_ForDeniedWithInvalidBiometricEvents;

	@FindBy(id = "autoWFDeniedBioEvtName")
	private WebElement advanced_wiegand_ForDeniedWithInvalidBiometricEventsName;

	@FindBy(xpath = "//*[@id='autoWFDeniedBioEvtID']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_wiegand_ForDeniedWithInvalidBiometricEvents_label;
	
	@FindBy(id = "autoWFDeniedCardEvtID")
	private WebElement advanced_wiegand_ForDeniedWithInvalidCardEvents;

	@FindBy(id = "autoWFDeniedCardEvtName")
	private WebElement advanced_wiegand_ForDeniedWithInvalidCardEventsName;

	@FindBy(xpath = "//*[@id='autoWFDeniedCardEvtID']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_wiegand_ForDeniedWithInvalidCardEvents_label;
	
	@FindBy(id = "autoWFDeniedPINEvtID")
	private WebElement advanced_wiegand_ForDeniedWithInvalidPINEvents;

	@FindBy(id = "autoWFDeniedPINEvtName")
	private WebElement advanced_wiegand_ForDeniedWithInvalidPINEventsName;

	@FindBy(xpath = "//*[@id='autoWFDeniedPINEvtID']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_wiegand_ForDeniedWithInvalidPINEvents_label;
	
	@FindBy(id = "autoWFDeniedCredTimeOutEvtID")
	private WebElement advanced_wiegand_ForDeniedWithCredentialTimeOutEvents;

	@FindBy(id = "autoWFDeniedCredTimeOutEvtName")
	private WebElement advanced_wiegand_ForDeniedWithCredentialTimeOutEventsName;

	@FindBy(xpath = "//*[@id='autoWFDeniedCredTimeOutEvtID']/ancestor::div[@class='form-group']//label")
	private WebElement advanced_wiegand_ForDeniedWithCredentialTimeOutEvents_label;
	
	@FindBy(id = "txtAllowedCode")
	private WebElement advanced_wiegand_AllowedCode_txtbox;
	
	@FindBy(xpath = "(//*[@id='txtAllowedCode']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_AllowedCode_txtbox_Label;
	
	@FindBy(id = "txtWFIdentifedCode")
	private WebElement advanced_wiegand_IdentifiedCode_txtbox;
	
	@FindBy(xpath = "(//*[@id='txtWFIdentifedCode']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_IdentifiedCode_txtbox_Label;
	
	@FindBy(id = "txtWFDeniedBioCode")
	private WebElement advanced_wiegand_InvalidBiometricCode_txtbox;
	
	@FindBy(xpath = "(//*[@id='txtWFDeniedBioCode']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_InvalidBiometricCode_txtbox_Label;
	
	@FindBy(id = "txtWFDeniedCardCode")
	private WebElement advanced_wiegand_InvalidCardCode_txtbox;
	
	@FindBy(xpath = "(//*[@id='txtWFDeniedCardCode']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_InvalidCardCode_txtbox_Label;
	
	@FindBy(id = "txtWFDeniedPINCode")
	private WebElement advanced_wiegand_InvalidPINCode_txtbox;
	
	@FindBy(xpath = "(//*[@id='txtWFDeniedPINCode']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_InvalidPINCode_txtbox_Label;
	
	@FindBy(id = "txtWFDeniedCredTimeOutCode")
	private WebElement advanced_wiegand_CredentialTimeOutCode_txtbox;
	
	@FindBy(xpath = "(//*[@id='txtWFDeniedCredTimeOutCode']/ancestor::div[@class='form-group']//label)[1]")
	private WebElement advanced_wiegand_CredentialTimeOutCode_txtbox_Label;
	
	
	
	public void deviceUIControlValidation_Advanced_Wiegand(List<Map<String, String>> data, String sheetName) throws Exception {
		for (int i = 0; i < data.size(); i++) {
			eachRowStatus = false;
			String valMsg = null;
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			Map<String, String> excelFileDataRecord = data.get(i);
			logger.info("***********************************Excel Data Record Picked : Row Number = " + i + " Data is ="
					+ excelFileDataRecord);
			int rowNumber = Integer.parseInt(excelFileDataRecord.get("RowNumber"));
			addButtonClick();
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			waitForElementVisible_TimeinMinutes(selectDeviceTypeBeAddedpopUp, 2);
			for (int j = 0; j < selectDeviceTypeToBeAdded.size(); j++) {
				String title = selectDeviceTypeToBeAdded.get(j).getAttribute("title");
				if (title.equalsIgnoreCase(excelFileDataRecord.get("DeviceType"))) {
					selectDeviceTypeToBeAdded.get(j).click();
					Thread.sleep(500);
					waitForElementClickable(deviceContinue);
					element_Click(deviceContinue);
					Thread.sleep(500);
					break;
				}
			}
			Thread.sleep(500);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementClickable(active, 1);
			waitForLocatorInVisible(By.id("DevicePageLoader"));
			waitForElementVisible(deviceNameTxt);
			waitForElementClickable(deviceNameTxt);
			// *******************Start Device Name Textbox And Control*******************

			String deviceNameV = excelFileDataRecord.get("DeviceName_Value").trim();
			textBox_Control_Check_UIValidation("Device Name", rowNumber, sheetName, deviceidNameLabel, deviceNameTxt,
					"", "", "", "", "", deviceNameV, "");

			// *******************Start Mac Address Textbox And Control*******************
			String macAddressV = excelFileDataRecord.get("MacAddress_Value").trim();
			if (!macAddressV.isBlank() && !macAddressV.isEmpty()) {
				List<WebElement> macAddressTxt = doormacAddressTxt;
				String[] macs = macAddressV.split(":");
				for (int x = 0; x < macAddressTxt.size(); x++) {
					macAddressTxt.get(x).sendKeys(macs[x]);
				}
			}
			Thread.sleep(500);
			// **********************Start Advanced Tab***********************************
			String advanced_label = excelFileDataRecord.get("Advanced_label").trim();
			String advanced_Default = excelFileDataRecord.get("Advanced_Default").trim();
			String advanced_Select = excelFileDataRecord.get("Advanced_Select").trim();
			if (!advanced_label.isBlank() && !advanced_label.isEmpty()) {
				assertEquals(advancedTabControl.getText(), advanced_label, "Advanced Tab Control Label Comparision", true,
						rowNumber, sheetName);
			}
			if (!advanced_Select.isBlank() && !advanced_Select.isEmpty()) {
				element_Click(advancedTabControl);
				Thread.sleep(250);
			}
			if (!advanced_Default.isBlank() && !advanced_Default.isEmpty()) {
				String deviceGetID = advancedTabControlActiveOrNot.getAttribute("class");
				String value = null;
				if (deviceGetID.toLowerCase().contains("tab-active")) {
					value = "tab-active";
				} else {
					value = "tab-non-active";
				}
				assertEquals(value, advanced_Default, "Advanced Tab Control Label Comparision", true, rowNumber,
						sheetName);
			}
			
			// **********************Start Wiegand Tab***********************************
						String wiegand_label = excelFileDataRecord.get("Wiegand_label").trim();
						String wiegand_Default = excelFileDataRecord.get("Wiegand_Default").trim();
						String wiegand_Select = excelFileDataRecord.get("Wiegand_Select").trim();
						if (!wiegand_label.isBlank() && !wiegand_label.isEmpty()) {
							assertEquals(wiegandTabControl.getText(), wiegand_label, "wiegand Tab Control Label Comparision", true,
									rowNumber, sheetName);
						}
						if (!wiegand_Select.isBlank() && !wiegand_Select.isEmpty()) {
							element_Click(wiegandTabControl);
							Thread.sleep(250);
						}
						if (!wiegand_Default.isBlank() && !wiegand_Default.isEmpty()) {
							String deviceGetID = wiegandTabControlActiveOrNot.getAttribute("class");
							String value = null;
							if (deviceGetID.toLowerCase().contains("tab-active")) {
								value = "tab-active";
							} else {
								value = "tab-non-active";
							}
							assertEquals(value, wiegand_Default, "wiegand Tab Control Label Comparision", true, rowNumber,
									sheetName);
						}
						
						// Wiegand Interface - Dropdown
						String wiegandInterface_label = excelFileDataRecord.get("WiegandInterface_label").trim();
						String wiegandInterface_Type = excelFileDataRecord.get("WiegandInterface_Type").trim();
						String wiegandInterface_Visibility = excelFileDataRecord.get("WiegandInterface_Visibility").trim();
						String wiegandInterface_Default_Value = excelFileDataRecord.get("WiegandInterface_Default_Value").trim();
						String wiegandInterface_Select_Values = excelFileDataRecord.get("WiegandInterface_Select_Values").trim();
						String wiegandInterface_Values = excelFileDataRecord.get("WiegandInterface_Values").trim();
						dropDown_Check_UIValidation("Wiegand Interface", rowNumber, sheetName, advanced_wiegand_WiegandInterface_dropdown_Label,
								advanced_wiegand_WiegandInterface_dropdown, advanced_wiegand_WiegandInterface_dropdown_Size, wiegandInterface_label, wiegandInterface_Type,
								wiegandInterface_Visibility, wiegandInterface_Default_Value, wiegandInterface_Select_Values, wiegandInterface_Values,"");
						
						// *****Wait For Panel Signal - checkbox****
						String waitForPanelSignalLab = excelFileDataRecord.get("WaitForPanelSignal_label").trim();
						String waitForPanelSignalTy = excelFileDataRecord.get("WaitForPanelSignal_Type").trim();
						String waitForPanelSignalVi = excelFileDataRecord.get("WaitForPanelSignal_Visibility").trim();
						String waitForPanelSignal_default = excelFileDataRecord.get("WaitForPanelSignal_Default_Value").trim();
						String waitForPanelSignalV = excelFileDataRecord.get("WaitForPanelSignal_Value").trim();
						checkbox_Check_UIValidation("Wait For Panel Signal", rowNumber, sheetName, advanced_wiegand_WaitForPanelSignal_chkbox_Label,
								advanced_wiegand_WaitForPanelSignal_chkbox, waitForPanelSignalLab, waitForPanelSignalTy, waitForPanelSignalVi,
								waitForPanelSignal_default, waitForPanelSignalV);
						
						// *******************Start Signal Wait Timer (Sec) - textbox*******************
						String signalWaitTimerLab = excelFileDataRecord.get("SignalWaitTimer_label").trim();
						String signalWaitTimerTy = excelFileDataRecord.get("SignalWaitTimer_Type").trim();
						String signalWaitTimerVi = excelFileDataRecord.get("SignalWaitTimer_Visibility").trim();
						String signalWaitTimerP = excelFileDataRecord.get("SignalWaitTimer_Placeholder").trim();
						String signalWaitTimer_default = excelFileDataRecord.get("SignalWaitTimer_Default_Value").trim();
						String signalWaitTimerV = excelFileDataRecord.get("SignalWaitTimer_Value").trim();
						String signalWaitTimerNegative = excelFileDataRecord.get("SignalWaitTimer_Negative").trim();
						textBox_Control_Check_UIValidation("Signal Wait Timer (Sec)", rowNumber, sheetName, advanced_wiegand_SignalWaitTimer_txtbox_Label,
								advanced_wiegand_SignalWaitTimer_txtbox, signalWaitTimerLab, signalWaitTimerTy, signalWaitTimerVi, signalWaitTimerP,
								signalWaitTimer_default, signalWaitTimerV, signalWaitTimerNegative);
						
						// *****Wait For User Verification - checkbox****
						String waitForUserVerificationLab = excelFileDataRecord.get("WaitForUserVerification_label").trim();
						String waitForUserVerificationTy = excelFileDataRecord.get("WaitForUserVerification_Type").trim();
						String waitForUserVerificationVi = excelFileDataRecord.get("WaitForUserVerification_Visibility").trim();
						String waitForUserVerification_default = excelFileDataRecord.get("WaitForUserVerification_Default_Value").trim();
						String waitForUserVerificationV = excelFileDataRecord.get("WaitForUserVerification_Value").trim();
						checkbox_Check_UIValidation("Wait For User Verification", rowNumber, sheetName, advanced_wiegand_WaitForUserVerification_chkbox_Label,
								advanced_wiegand_WaitForUserVerification_chkbox, waitForUserVerificationLab, waitForUserVerificationTy, waitForUserVerificationVi,
								waitForUserVerification_default, waitForUserVerificationV);
						
						// Wiegand Output Format - Dropdown
						String wiegandOutputFormat_label = excelFileDataRecord.get("WiegandOutputFormat_label").trim();
						String wiegandOutputFormat_Type = excelFileDataRecord.get("WiegandOutputFormat_Type").trim();
						String wiegandOutputFormat_Visibility = excelFileDataRecord.get("WiegandOutputFormat_Visibility").trim();
						String wiegandOutputFormat_Default_Value = excelFileDataRecord.get("WiegandOutputFormat_Default_Value").trim();
						String wiegandOutputFormat_Select_Values = excelFileDataRecord.get("WiegandOutputFormat_Select_Values").trim();
						String wiegandOutputFormat_Values = excelFileDataRecord.get("WiegandOutputFormat_Values").trim();
						dropDown_Check_UIValidation("Wiegand Output Format", rowNumber, sheetName, advanced_wiegand_WiegandOutputFormat_dropdown_Label,
								advanced_wiegand_WiegandOutputFormat_dropdown, advanced_wiegand_WiegandOutputFormat_dropdown_Size, wiegandOutputFormat_label, wiegandOutputFormat_Type,
								wiegandOutputFormat_Visibility, wiegandOutputFormat_Default_Value, wiegandOutputFormat_Select_Values, wiegandOutputFormat_Values,"");
						
						// Send From - Dropdown
						String sendFrom_label = excelFileDataRecord.get("SendFrom_label").trim();
						String sendFrom_Type = excelFileDataRecord.get("SendFrom_Type").trim();
						String sendFrom_Visibility = excelFileDataRecord.get("SendFrom_Visibility").trim();
						String sendFrom_Default_Value = excelFileDataRecord.get("SendFrom_Default_Value").trim();
						String sendFrom_Select_Values = excelFileDataRecord.get("SendFrom_Select_Values").trim();
						String sendFrom_Values = excelFileDataRecord.get("SendFrom_Values").trim();
						dropDown_Check_UIValidation("Send From", rowNumber, sheetName, advanced_wiegand_SendFrom_dropdown_Label,
								advanced_wiegand_SendFrom_dropdown, advanced_wiegand_SendFrom_dropdown_Size, sendFrom_label, sendFrom_Type,
								sendFrom_Visibility, sendFrom_Default_Value, sendFrom_Select_Values, sendFrom_Values,"");
						
						//picklist code start
						// *******************For Allowed Events Id Label And Control*******************
						String forAllowedEventsIdLab = excelFileDataRecord.get("ForAllowedEventsId_label").trim();
						String forAllowedEventsIdTy = excelFileDataRecord.get("ForAllowedEventsId_Type").trim();
						String forAllowedEventsIdVi = excelFileDataRecord.get("ForAllowedEventsId_Visibility").trim();
						String forAllowedEventsIdP = excelFileDataRecord.get("ForAllowedEventsId_Placeholder").trim();
						String forAllowedEventsId_default = excelFileDataRecord.get("ForAllowedEventsId_Default_Value").trim();
						String forAllowedEventsIdV = excelFileDataRecord.get("ForAllowedEventsId_Value").trim();
						String forAllowedEventsIdNegative = excelFileDataRecord.get("ForAllowedEventsId_Negative").trim();
						textBox_Control_Check_UIValidation("For Allowed Events", rowNumber, sheetName,
								advanced_wiegand_ForAllowedEventsName_label, advanced_wiegand_ForAllowedEvents,
								forAllowedEventsIdLab, forAllowedEventsIdTy, forAllowedEventsIdVi, forAllowedEventsIdP,
								forAllowedEventsId_default, forAllowedEventsIdV, forAllowedEventsIdNegative);
						
						// *******************For Allowed Events Label And Control*******************
						String forAllowedEventsNameTy = excelFileDataRecord.get("ForAllowedEventsName_Type").trim();
						String forAllowedEventsNameVi = excelFileDataRecord.get("ForAllowedEventsName_Visibility").trim();
						String forAllowedEventsNameP = excelFileDataRecord.get("ForAllowedEventsName_Placeholder").trim();
						String forAllowedEventsName_default = excelFileDataRecord.get("ForAllowedEventsName_Default_Value").trim();
						String forAllowedEventsNameV = excelFileDataRecord.get("ForAllowedEventsName_Value").trim();
						String forAllowedEventsNameNegative = excelFileDataRecord.get("ForAllowedEventsName_Negative").trim();
						textBox_Control_Check_UIValidation("For Allowed Events", rowNumber, sheetName,
								advanced_wiegand_ForAllowedEventsName_label, advanced_wiegand_ForAllowedEventsName,
								"", forAllowedEventsNameTy, forAllowedEventsNameVi, forAllowedEventsNameP,
								forAllowedEventsName_default, forAllowedEventsNameV, forAllowedEventsNameNegative);

						// *******************For Allowed Events Pop Up Button And Control*******************
						String forAllowedEventsPopUp_LabelBasicV = excelFileDataRecord.get("ReaderModeSchedulePopUp_Label").trim();
						String forAllowedEventsPopUpSearch_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Type").trim();
						String forAllowedEventsPopUpSearch_Placeholder = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Placeholder").trim();
						String forAllowedEventsPopUpSearch_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Value").trim();
						String forAllowedEventsPopUp_Default_Table_Header_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Header_Value").trim();
						String forAllowedEventsPopUp_Default_Table_Row_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value").trim();
						String forAllowedEventsPopUp_Default_Table_No_Data_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_No_Data_Value").trim();
						String forAllowedEventsPopUp_Default_Table_Row_Value_Select = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value_Select").trim();
						String forAllowedEventsPopUpCancel_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Type").trim();
						String forAllowedEventsPopUpCancel_Default_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Default_Value").trim();
						String forAllowedEventsPopUpClose_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpClose_Type").trim();
						if (!forAllowedEventsPopUp_LabelBasicV.isBlank() || !forAllowedEventsPopUpSearch_Type.isBlank()
								|| !forAllowedEventsPopUpSearch_Placeholder.isBlank()
								|| !forAllowedEventsPopUpSearch_Value.isBlank()
								|| !forAllowedEventsPopUp_Default_Table_Header_Value.isBlank()
								|| !forAllowedEventsPopUp_Default_Table_Row_Value.isBlank()
								|| !forAllowedEventsPopUp_Default_Table_No_Data_Value.isBlank()
								|| !forAllowedEventsPopUpCancel_Type.isBlank()
								|| !forAllowedEventsPopUpCancel_Default_Value.isBlank()
								|| !forAllowedEventsPopUp_Default_Table_Row_Value_Select.isBlank()
								|| !forAllowedEventsPopUpClose_Type.isBlank()) {
							System.out.println("I am in For Allowed Events");
							element_Click(advanced_wiegand_ForAllowedEventsName_PicklistBtn);
							waitForElementVisible(readers_InternalReaders_ReaderModeSchedule_Popup_Label);
							// Pop up Open
							if (!forAllowedEventsPopUp_LabelBasicV.isBlank() && !forAllowedEventsPopUp_LabelBasicV.isEmpty()) {
								System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
								assertEquals(readers_InternalReaders_ReaderModeSchedule_Popup_Label.getText(),
										forAllowedEventsPopUp_LabelBasicV, "For Allowed Events Pop Up Label Comparision", true, rowNumber,
										sheetName);
							}
							// Start Search Box
							if (!forAllowedEventsPopUpSearch_Placeholder.isBlank()
									&& !forAllowedEventsPopUpSearch_Placeholder.isEmpty()) {
								System.out.println("Element PlaceHolder :" + element_GetAttributeValue(
										readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"));
								assertEquals(
										element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search,
												"placeholder"),
										forAllowedEventsPopUpSearch_Placeholder,
										"forAllowedEvents -> SearchBox PlaceHolder Comparison", true, rowNumber, sheetName);
							}
							if (!forAllowedEventsPopUpSearch_Type.isBlank() && !forAllowedEventsPopUpSearch_Type.isEmpty()) {
								System.out.println(
										"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_search, "type"));
								assertEquals(
										element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "type"),
										forAllowedEventsPopUpSearch_Type, "Site Pop Up -> SearchBox Type Comparison", true,
										rowNumber, sheetName);
							}
							if (!forAllowedEventsPopUpSearch_Value.isBlank() && !forAllowedEventsPopUpSearch_Value.isEmpty()) {
								element_InputText(readers_InternalReaders_ReaderModeSchedule_Popup_search,
										forAllowedEventsPopUpSearch_Value);
								Thread.sleep(250);
								element_Click(basic_Site_Popup_search_Button);
								Thread.sleep(250);
							}
							// Table Header Value Checked
							tableHeader_Control_Check_UIValidation("Picklist For Reader Mode Schedules", rowNumber, sheetName,
									readers_InternalReaders_ReaderModeSchedule_Popup_table_header,
									forAllowedEventsPopUp_Default_Table_Header_Value);
							Thread.sleep(250);
							tableRow_Control_Check_UIValidation("Reader Mode Schedule Pop Up Table Row", rowNumber, sheetName,
									readers_InternalReaders_ReaderModeSchedule_Popup_table_Row,
									"td[@class=\"cursor label-text\"]/label",
									readers_InternalReaders_ReaderModeSchedule_Popup_table_No_Data,
									forAllowedEventsPopUp_Default_Table_Row_Value,
									forAllowedEventsPopUp_Default_Table_No_Data_Value);

							// Cancel Button
							if (!forAllowedEventsPopUpCancel_Type.isBlank() && !forAllowedEventsPopUpCancel_Type.isEmpty()) {
								System.out.println("Element Attribute :" + element_GetAttributeValue(
										readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"));
								assertEquals(
										element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton,
												"type"),
										forAllowedEventsPopUpCancel_Type,
										"Reader Mode Schedule Pop Up -> Cencel Button Type Comparison", true, rowNumber, sheetName);
							}
							if (!forAllowedEventsPopUpCancel_Default_Value.isBlank()
									&& !forAllowedEventsPopUpCancel_Default_Value.isEmpty()) {
								System.out.println("Element default Value :" + element_GetAttributeValue(
										readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"));
								assertEquals(
										element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton,
												"value"),
										forAllowedEventsPopUpCancel_Default_Value,
										"Reader Mode Schedule Pop Up -> Cencel Button default value Comparison", true, rowNumber,
										sheetName);
							}
							// Close button
							if (!forAllowedEventsPopUpClose_Type.isBlank() && !forAllowedEventsPopUpClose_Type.isEmpty()) {
								System.out.println(
										"Element Attribute :" + element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
								assertEquals(element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"),
										forAllowedEventsPopUpClose_Type, "Site Pop Up -> Close Button Type Comparison", true,
										rowNumber, sheetName);
							}
							if (!forAllowedEventsPopUp_Default_Table_Row_Value_Select.isBlank()
									&& !forAllowedEventsPopUp_Default_Table_Row_Value_Select.isEmpty()) {
								for (int aa = 0; aa < readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
										.size(); aa++) {
									System.out.println(readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
											.get(aa).getText());
									if (readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.get(aa).getText()
											.equalsIgnoreCase(forAllowedEventsPopUp_Default_Table_Row_Value_Select)) {
										readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.get(aa).click();
										Thread.sleep(250);
										break;
									}
								}

							} else {
								element_Click(basic_Site_Popup_CloseButton);
							}
						}
						//picklist code end
						
						// *******************Start Allowed Code - textbox*******************
						String allowedCodeLab = excelFileDataRecord.get("AllowedCode_label").trim();
						String allowedCodeTy = excelFileDataRecord.get("AllowedCode_Type").trim();
						String allowedCodeVi = excelFileDataRecord.get("AllowedCode_Visibility").trim();
						String allowedCodeP = excelFileDataRecord.get("AllowedCode_Placeholder").trim();
						String allowedCode_default = excelFileDataRecord.get("AllowedCode_Default_Value").trim();
						String allowedCodeV = excelFileDataRecord.get("AllowedCode_Value").trim();
						String allowedCodeNegative = excelFileDataRecord.get("AllowedCode_Negative").trim();
						textBox_Control_Check_UIValidation("Allowed Code", rowNumber, sheetName, advanced_wiegand_AllowedCode_txtbox_Label,
								advanced_wiegand_AllowedCode_txtbox, allowedCodeLab, allowedCodeTy, allowedCodeVi, allowedCodeP,
								allowedCode_default, allowedCodeV, allowedCodeNegative);
						
						//picklist code start
						// *******************For Identified Events Id Label And Control*******************
						String forIdentifiedEventsIdLab = excelFileDataRecord.get("ForIdentifiedEventsId_label").trim();
						String forIdentifiedEventsIdTy = excelFileDataRecord.get("ForIdentifiedEventsId_Type").trim();
						String forIdentifiedEventsIdVi = excelFileDataRecord.get("ForIdentifiedEventsId_Visibility").trim();
						String forIdentifiedEventsIdP = excelFileDataRecord.get("ForIdentifiedEventsId_Placeholder").trim();
						String forIdentifiedEventsId_default = excelFileDataRecord.get("ForIdentifiedEventsId_Default_Value").trim();
						String forIdentifiedEventsIdV = excelFileDataRecord.get("ForIdentifiedEventsId_Value").trim();
						String forIdentifiedEventsIdNegative = excelFileDataRecord.get("ForIdentifiedEventsId_Negative").trim();

						textBox_Control_Check_UIValidation("For Identified Events", rowNumber, sheetName,
								advanced_wiegand_ForIdentifiedEvents_label, advanced_wiegand_ForIdentifiedEvents,
						        forIdentifiedEventsIdLab, forIdentifiedEventsIdTy, forIdentifiedEventsIdVi, forIdentifiedEventsIdP,
						        forIdentifiedEventsId_default, forIdentifiedEventsIdV, forIdentifiedEventsIdNegative);

						// *******************For Identified Events Label And Control*******************
						String forIdentifiedEventsNameTy = excelFileDataRecord.get("ForIdentifiedEventsName_Type").trim();
						String forIdentifiedEventsNameVi = excelFileDataRecord.get("ForIdentifiedEventsName_Visibility").trim();
						String forIdentifiedEventsNameP = excelFileDataRecord.get("ForIdentifiedEventsName_Placeholder").trim();
						String forIdentifiedEventsName_default = excelFileDataRecord.get("ForIdentifiedEventsName_Default_Value").trim();
						String forIdentifiedEventsNameV = excelFileDataRecord.get("ForIdentifiedEventsName_Value").trim();
						String forIdentifiedEventsNameNegative = excelFileDataRecord.get("ForIdentifiedEventsName_Negative").trim();

						textBox_Control_Check_UIValidation("For Identified Events", rowNumber, sheetName,
								advanced_wiegand_ForIdentifiedEvents_label, advanced_wiegand_ForIdentifiedEventsName,
						        "", forIdentifiedEventsNameTy, forIdentifiedEventsNameVi, forIdentifiedEventsNameP,
						        forIdentifiedEventsName_default, forIdentifiedEventsNameV, forIdentifiedEventsNameNegative);

						// *******************For Identified Events Pop Up Button And Control*******************
						String forIdentifiedEventsPopUp_LabelBasicV = excelFileDataRecord.get("ReaderModeSchedulePopUp_Label").trim();
						String forIdentifiedEventsPopUpSearch_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Type").trim();
						String forIdentifiedEventsPopUpSearch_Placeholder = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Placeholder").trim();
						String forIdentifiedEventsPopUpSearch_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Value").trim();
						String forIdentifiedEventsPopUp_Default_Table_Header_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Header_Value").trim();
						String forIdentifiedEventsPopUp_Default_Table_Row_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value").trim();
						String forIdentifiedEventsPopUp_Default_Table_No_Data_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_No_Data_Value").trim();
						String forIdentifiedEventsPopUp_Default_Table_Row_Value_Select = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value_Select").trim();
						String forIdentifiedEventsPopUpCancel_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Type").trim();
						String forIdentifiedEventsPopUpCancel_Default_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Default_Value").trim();
						String forIdentifiedEventsPopUpClose_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpClose_Type").trim();

						if (!forIdentifiedEventsPopUp_LabelBasicV.isBlank() || !forIdentifiedEventsPopUpSearch_Type.isBlank()
						        || !forIdentifiedEventsPopUpSearch_Placeholder.isBlank()
						        || !forIdentifiedEventsPopUpSearch_Value.isBlank()
						        || !forIdentifiedEventsPopUp_Default_Table_Header_Value.isBlank()
						        || !forIdentifiedEventsPopUp_Default_Table_Row_Value.isBlank()
						        || !forIdentifiedEventsPopUp_Default_Table_No_Data_Value.isBlank()
						        || !forIdentifiedEventsPopUpCancel_Type.isBlank()
						        || !forIdentifiedEventsPopUpCancel_Default_Value.isBlank()
						        || !forIdentifiedEventsPopUp_Default_Table_Row_Value_Select.isBlank()
						        || !forIdentifiedEventsPopUpClose_Type.isBlank()) {

						    System.out.println("I am in For Identified Events");
						    element_Click(advanced_wiegand_ForIdentifiedEvents_PicklistBtn);
						    waitForElementVisible(readers_InternalReaders_ReaderModeSchedule_Popup_Label);

						    // Pop up Open
						    if (!forIdentifiedEventsPopUp_LabelBasicV.isBlank() && !forIdentifiedEventsPopUp_LabelBasicV.isEmpty()) {
						        System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
						        assertEquals(readers_InternalReaders_ReaderModeSchedule_Popup_Label.getText(),
						                forIdentifiedEventsPopUp_LabelBasicV, "For Identified Events Pop Up Label Comparision", true, rowNumber,
						                sheetName);
						    }

						    // Start Search Box
						    if (!forIdentifiedEventsPopUpSearch_Placeholder.isBlank()
						            && !forIdentifiedEventsPopUpSearch_Placeholder.isEmpty()) {
						        System.out.println("Element PlaceHolder :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"),
						                forIdentifiedEventsPopUpSearch_Placeholder,
						                "forIdentifiedEvents -> SearchBox PlaceHolder Comparison", true, rowNumber, sheetName);
						    }

						    if (!forIdentifiedEventsPopUpSearch_Type.isBlank() && !forIdentifiedEventsPopUpSearch_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(basic_Site_Popup_search, "type"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "type"),
						                forIdentifiedEventsPopUpSearch_Type,
						                "Site Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
						    }

						    if (!forIdentifiedEventsPopUpSearch_Value.isBlank()
						            && !forIdentifiedEventsPopUpSearch_Value.isEmpty()) {
						        element_InputText(readers_InternalReaders_ReaderModeSchedule_Popup_search,
						                forIdentifiedEventsPopUpSearch_Value);
						        Thread.sleep(250);
						        element_Click(basic_Site_Popup_search_Button);
						        Thread.sleep(250);
						    }

						    // Table Header Value Checked
						    tableHeader_Control_Check_UIValidation("Picklist For Reader Mode Schedules", rowNumber, sheetName,
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_header,
						            forIdentifiedEventsPopUp_Default_Table_Header_Value);
						    Thread.sleep(250);

						    tableRow_Control_Check_UIValidation("Reader Mode Schedule Pop Up Table Row", rowNumber, sheetName,
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_Row,
						            "td[@class=\"cursor label-text\"]/label",
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_No_Data,
						            forIdentifiedEventsPopUp_Default_Table_Row_Value,
						            forIdentifiedEventsPopUp_Default_Table_No_Data_Value);

						    // Cancel Button
						    if (!forIdentifiedEventsPopUpCancel_Type.isBlank() && !forIdentifiedEventsPopUpCancel_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"),
						                forIdentifiedEventsPopUpCancel_Type,
						                "Reader Mode Schedule Pop Up -> Cancel Button Type Comparison", true, rowNumber, sheetName);
						    }

						    if (!forIdentifiedEventsPopUpCancel_Default_Value.isBlank()
						            && !forIdentifiedEventsPopUpCancel_Default_Value.isEmpty()) {
						        System.out.println("Element default Value :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"),
						                forIdentifiedEventsPopUpCancel_Default_Value,
						                "Reader Mode Schedule Pop Up -> Cancel Button default value Comparison", true, rowNumber, sheetName);
						    }

						    // Close button
						    if (!forIdentifiedEventsPopUpClose_Type.isBlank() && !forIdentifiedEventsPopUpClose_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
						        assertEquals(
						                element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"),
						                forIdentifiedEventsPopUpClose_Type,
						                "Site Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
						    }

						    if (!forIdentifiedEventsPopUp_Default_Table_Row_Value_Select.isBlank()
						            && !forIdentifiedEventsPopUp_Default_Table_Row_Value_Select.isEmpty()) {

						        for (int aa = 0; aa < readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.size(); aa++) {

						            System.out.println(readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
						                    .get(aa).getText());

						            if (readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
						                    .get(aa).getText().equalsIgnoreCase(
						                            forIdentifiedEventsPopUp_Default_Table_Row_Value_Select)) {

						                readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.get(aa).click();
						                Thread.sleep(250);
						                break;
						            }
						        }

						    } else {
						        element_Click(basic_Site_Popup_CloseButton);
						    }
						}
						//picklist code end

						// *******************Start Identified Code - textbox*******************
						String identifiedCodeLab = excelFileDataRecord.get("IdentifiedCode_label").trim();
						String identifiedCodeTy = excelFileDataRecord.get("IdentifiedCode_Type").trim();
						String identifiedCodeVi = excelFileDataRecord.get("IdentifiedCode_Visibility").trim();
						String identifiedCodeP = excelFileDataRecord.get("IdentifiedCode_Placeholder").trim();
						String identifiedCode_default = excelFileDataRecord.get("IdentifiedCode_Default_Value").trim();
						String identifiedCodeV = excelFileDataRecord.get("IdentifiedCode_Value").trim();
						String identifiedCodeNegative = excelFileDataRecord.get("IdentifiedCode_Negative").trim();
						textBox_Control_Check_UIValidation("Identified Code", rowNumber, sheetName, advanced_wiegand_ForIdentifiedEvents_label,
								advanced_wiegand_IdentifiedCode_txtbox, identifiedCodeLab, identifiedCodeTy, identifiedCodeVi, identifiedCodeP,
								identifiedCode_default, identifiedCodeV, identifiedCodeNegative);
						
						//picklist code start
						// *******************For Denied With Invalid Biometric Events Id Label And Control*******************
						String forDeniedWithInvalidBiometricEventsIdLab = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsId_label").trim();
						String forDeniedWithInvalidBiometricEventsIdTy = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsId_Type").trim();
						String forDeniedWithInvalidBiometricEventsIdVi = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsId_Visibility").trim();
						String forDeniedWithInvalidBiometricEventsIdP = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsId_Placeholder").trim();
						String forDeniedWithInvalidBiometricEventsId_default = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsId_Default_Value").trim();
						String forDeniedWithInvalidBiometricEventsIdV = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsId_Value").trim();
						String forDeniedWithInvalidBiometricEventsIdNegative = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsId_Negative").trim();

						textBox_Control_Check_UIValidation("For Denied With Invalid Biometric Events", rowNumber, sheetName,
						        advanced_wiegand_ForDeniedWithInvalidBiometricEvents_label, advanced_wiegand_ForDeniedWithInvalidBiometricEvents,
						        forDeniedWithInvalidBiometricEventsIdLab, forDeniedWithInvalidBiometricEventsIdTy, forDeniedWithInvalidBiometricEventsIdVi,
						        forDeniedWithInvalidBiometricEventsIdP, forDeniedWithInvalidBiometricEventsId_default,
						        forDeniedWithInvalidBiometricEventsIdV, forDeniedWithInvalidBiometricEventsIdNegative);

						// *******************For Denied With Invalid Biometric Events Label And Control*******************
						String forDeniedWithInvalidBiometricEventsNameTy = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsName_Type").trim();
						String forDeniedWithInvalidBiometricEventsNameVi = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsName_Visibility").trim();
						String forDeniedWithInvalidBiometricEventsNameP = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsName_Placeholder").trim();
						String forDeniedWithInvalidBiometricEventsName_default = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsName_Default_Value").trim();
						String forDeniedWithInvalidBiometricEventsNameV = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsName_Value").trim();
						String forDeniedWithInvalidBiometricEventsNameNegative = excelFileDataRecord.get("ForDeniedWithInvalidBiometricEventsName_Negative").trim();

						textBox_Control_Check_UIValidation("For Denied With Invalid Biometric Events", rowNumber, sheetName,
						        advanced_wiegand_ForDeniedWithInvalidBiometricEvents_label, advanced_wiegand_ForDeniedWithInvalidBiometricEventsName,
						        "", forDeniedWithInvalidBiometricEventsNameTy, forDeniedWithInvalidBiometricEventsNameVi,
						        forDeniedWithInvalidBiometricEventsNameP, forDeniedWithInvalidBiometricEventsName_default,
						        forDeniedWithInvalidBiometricEventsNameV, forDeniedWithInvalidBiometricEventsNameNegative);

						// *******************For Denied With Invalid Biometric Events Pop Up Button And Control*******************
						String forDeniedWithInvalidBiometricEventsPopUp_LabelBasicV = excelFileDataRecord.get("ReaderModeSchedulePopUp_Label").trim();
						String forDeniedWithInvalidBiometricEventsPopUpSearch_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Type").trim();
						String forDeniedWithInvalidBiometricEventsPopUpSearch_Placeholder = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Placeholder").trim();
						String forDeniedWithInvalidBiometricEventsPopUpSearch_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Value").trim();
						String forDeniedWithInvalidBiometricEventsPopUp_Default_Table_Header_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Header_Value").trim();
						String forDeniedWithInvalidBiometricEventsPopUp_Default_Table_Row_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value").trim();
						String forDeniedWithInvalidBiometricEventsPopUp_Default_Table_No_Data_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_No_Data_Value").trim();
						String forDeniedWithInvalidBiometricEventsPopUp_Default_Table_Row_Value_Select = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value_Select").trim();
						String forDeniedWithInvalidBiometricEventsPopUpCancel_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Type").trim();
						String forDeniedWithInvalidBiometricEventsPopUpCancel_Default_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Default_Value").trim();
						String forDeniedWithInvalidBiometricEventsPopUpClose_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpClose_Type").trim();

						if (!forDeniedWithInvalidBiometricEventsPopUp_LabelBasicV.isBlank()
						        || !forDeniedWithInvalidBiometricEventsPopUpSearch_Type.isBlank()
						        || !forDeniedWithInvalidBiometricEventsPopUpSearch_Placeholder.isBlank()
						        || !forDeniedWithInvalidBiometricEventsPopUpSearch_Value.isBlank()
						        || !forDeniedWithInvalidBiometricEventsPopUp_Default_Table_Header_Value.isBlank()
						        || !forDeniedWithInvalidBiometricEventsPopUp_Default_Table_Row_Value.isBlank()
						        || !forDeniedWithInvalidBiometricEventsPopUp_Default_Table_No_Data_Value.isBlank()
						        || !forDeniedWithInvalidBiometricEventsPopUpCancel_Type.isBlank()
						        || !forDeniedWithInvalidBiometricEventsPopUpCancel_Default_Value.isBlank()
						        || !forDeniedWithInvalidBiometricEventsPopUp_Default_Table_Row_Value_Select.isBlank()
						        || !forDeniedWithInvalidBiometricEventsPopUpClose_Type.isBlank()) {

						    System.out.println("I am in For Denied With Invalid Biometric Events");
						    element_Click(advanced_wiegand_ForDeniedWithInvalidBiometricEvents_PicklistBtn);
						    waitForElementVisible(readers_InternalReaders_ReaderModeSchedule_Popup_Label);

						    // Pop up Open
						    if (!forDeniedWithInvalidBiometricEventsPopUp_LabelBasicV.isBlank()
						            && !forDeniedWithInvalidBiometricEventsPopUp_LabelBasicV.isEmpty()) {
						        System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
						        assertEquals(readers_InternalReaders_ReaderModeSchedule_Popup_Label.getText(),
						                forDeniedWithInvalidBiometricEventsPopUp_LabelBasicV,
						                "For Denied With Invalid Biometric Events Pop Up Label Comparision",
						                true, rowNumber, sheetName);
						    }

						    // Start Search Box
						    if (!forDeniedWithInvalidBiometricEventsPopUpSearch_Placeholder.isBlank()
						            && !forDeniedWithInvalidBiometricEventsPopUpSearch_Placeholder.isEmpty()) {
						        System.out.println("Element PlaceHolder :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"),
						                forDeniedWithInvalidBiometricEventsPopUpSearch_Placeholder,
						                "forDeniedWithInvalidBiometricEvents -> SearchBox PlaceHolder Comparison",
						                true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithInvalidBiometricEventsPopUpSearch_Type.isBlank()
						            && !forDeniedWithInvalidBiometricEventsPopUpSearch_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(basic_Site_Popup_search, "type"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "type"),
						                forDeniedWithInvalidBiometricEventsPopUpSearch_Type,
						                "Site Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithInvalidBiometricEventsPopUpSearch_Value.isBlank()
						            && !forDeniedWithInvalidBiometricEventsPopUpSearch_Value.isEmpty()) {
						        element_InputText(readers_InternalReaders_ReaderModeSchedule_Popup_search,
						                forDeniedWithInvalidBiometricEventsPopUpSearch_Value);
						        Thread.sleep(250);
						        element_Click(basic_Site_Popup_search_Button);
						        Thread.sleep(250);
						    }

						    // Table Header Value Checked
						    tableHeader_Control_Check_UIValidation("Picklist For Reader Mode Schedules", rowNumber, sheetName,
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_header,
						            forDeniedWithInvalidBiometricEventsPopUp_Default_Table_Header_Value);

						    Thread.sleep(250);

						    tableRow_Control_Check_UIValidation("Reader Mode Schedule Pop Up Table Row", rowNumber, sheetName,
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_Row,
						            "td[@class=\"cursor label-text\"]/label",
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_No_Data,
						            forDeniedWithInvalidBiometricEventsPopUp_Default_Table_Row_Value,
						            forDeniedWithInvalidBiometricEventsPopUp_Default_Table_No_Data_Value);

						    // Cancel Button
						    if (!forDeniedWithInvalidBiometricEventsPopUpCancel_Type.isBlank()
						            && !forDeniedWithInvalidBiometricEventsPopUpCancel_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"),
						                forDeniedWithInvalidBiometricEventsPopUpCancel_Type,
						                "Reader Mode Schedule Pop Up -> Cancel Button Type Comparison", true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithInvalidBiometricEventsPopUpCancel_Default_Value.isBlank()
						            && !forDeniedWithInvalidBiometricEventsPopUpCancel_Default_Value.isEmpty()) {
						        System.out.println("Element default Value :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"),
						                forDeniedWithInvalidBiometricEventsPopUpCancel_Default_Value,
						                "Reader Mode Schedule Pop Up -> Cancel Button default value Comparison",
						                true, rowNumber, sheetName);
						    }

						    // Close button
						    if (!forDeniedWithInvalidBiometricEventsPopUpClose_Type.isBlank()
						            && !forDeniedWithInvalidBiometricEventsPopUpClose_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
						        assertEquals(
						                element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"),
						                forDeniedWithInvalidBiometricEventsPopUpClose_Type,
						                "Site Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
						    }

						    // Select Row
						    if (!forDeniedWithInvalidBiometricEventsPopUp_Default_Table_Row_Value_Select.isBlank()
						            && !forDeniedWithInvalidBiometricEventsPopUp_Default_Table_Row_Value_Select.isEmpty()) {

						        for (int aa = 0; aa < readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.size(); aa++) {

						            System.out.println(readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
						                    .get(aa).getText());

						            if (readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
						                    .get(aa).getText().equalsIgnoreCase(
						                            forDeniedWithInvalidBiometricEventsPopUp_Default_Table_Row_Value_Select)) {

						                readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.get(aa).click();
						                Thread.sleep(250);
						                break;
						            }
						        }

						    } else {
						        element_Click(basic_Site_Popup_CloseButton);
						    }
						}
						//picklist code end

						// *******************Start Invalid Biometric Code - textbox*******************
						String invalidBiometricCodeLab = excelFileDataRecord.get("InvalidBiometricCode_label").trim();
						String invalidBiometricCodeTy = excelFileDataRecord.get("InvalidBiometricCode_Type").trim();
						String invalidBiometricCodeVi = excelFileDataRecord.get("InvalidBiometricCode_Visibility").trim();
						String invalidBiometricCodeP = excelFileDataRecord.get("InvalidBiometricCode_Placeholder").trim();
						String invalidBiometricCode_default = excelFileDataRecord.get("InvalidBiometricCode_Default_Value").trim();
						String invalidBiometricCodeV = excelFileDataRecord.get("InvalidBiometricCode_Value").trim();
						String invalidBiometricCodeNegative = excelFileDataRecord.get("InvalidBiometricCode_Negative").trim();
						textBox_Control_Check_UIValidation("Invalid Biometric Code", rowNumber, sheetName, advanced_wiegand_InvalidBiometricCode_txtbox_Label,
								advanced_wiegand_InvalidBiometricCode_txtbox, invalidBiometricCodeLab, invalidBiometricCodeTy, invalidBiometricCodeVi, invalidBiometricCodeP,
								invalidBiometricCode_default, invalidBiometricCodeV, invalidBiometricCodeNegative);
						
						//picklist code start
						// *******************For Denied With Invalid Card Events Id Label And Control*******************
						String forDeniedWithInvalidCardEventsIdLab = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsId_label").trim();
						String forDeniedWithInvalidCardEventsIdTy = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsId_Type").trim();
						String forDeniedWithInvalidCardEventsIdVi = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsId_Visibility").trim();
						String forDeniedWithInvalidCardEventsIdP = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsId_Placeholder").trim();
						String forDeniedWithInvalidCardEventsId_default = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsId_Default_Value").trim();
						String forDeniedWithInvalidCardEventsIdV = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsId_Value").trim();
						String forDeniedWithInvalidCardEventsIdNegative = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsId_Negative").trim();

						textBox_Control_Check_UIValidation("For Denied With Invalid Card Events", rowNumber, sheetName,
						        advanced_wiegand_ForDeniedWithInvalidCardEvents_label, advanced_wiegand_ForDeniedWithInvalidCardEvents,
						        forDeniedWithInvalidCardEventsIdLab, forDeniedWithInvalidCardEventsIdTy, forDeniedWithInvalidCardEventsIdVi,
						        forDeniedWithInvalidCardEventsIdP, forDeniedWithInvalidCardEventsId_default,
						        forDeniedWithInvalidCardEventsIdV, forDeniedWithInvalidCardEventsIdNegative);

						// *******************For Denied With Invalid Card Events Label And Control*******************
						String forDeniedWithInvalidCardEventsNameTy = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsName_Type").trim();
						String forDeniedWithInvalidCardEventsNameVi = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsName_Visibility").trim();
						String forDeniedWithInvalidCardEventsNameP = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsName_Placeholder").trim();
						String forDeniedWithInvalidCardEventsName_default = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsName_Default_Value").trim();
						String forDeniedWithInvalidCardEventsNameV = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsName_Value").trim();
						String forDeniedWithInvalidCardEventsNameNegative = excelFileDataRecord.get("ForDeniedWithInvalidCardEventsName_Negative").trim();

						textBox_Control_Check_UIValidation("For Denied With Invalid Card Events", rowNumber, sheetName,
						        advanced_wiegand_ForDeniedWithInvalidCardEvents_label, advanced_wiegand_ForDeniedWithInvalidCardEventsName,
						        "", forDeniedWithInvalidCardEventsNameTy, forDeniedWithInvalidCardEventsNameVi,
						        forDeniedWithInvalidCardEventsNameP, forDeniedWithInvalidCardEventsName_default,
						        forDeniedWithInvalidCardEventsNameV, forDeniedWithInvalidCardEventsNameNegative);

						// *******************For Denied With Invalid Card Events Pop Up Button And Control*******************
						String forDeniedWithInvalidCardEventsPopUp_LabelBasicV = excelFileDataRecord.get("ReaderModeSchedulePopUp_Label").trim();
						String forDeniedWithInvalidCardEventsPopUpSearch_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Type").trim();
						String forDeniedWithInvalidCardEventsPopUpSearch_Placeholder = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Placeholder").trim();
						String forDeniedWithInvalidCardEventsPopUpSearch_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Value").trim();
						String forDeniedWithInvalidCardEventsPopUp_Default_Table_Header_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Header_Value").trim();
						String forDeniedWithInvalidCardEventsPopUp_Default_Table_Row_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value").trim();
						String forDeniedWithInvalidCardEventsPopUp_Default_Table_No_Data_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_No_Data_Value").trim();
						String forDeniedWithInvalidCardEventsPopUp_Default_Table_Row_Value_Select = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value_Select").trim();
						String forDeniedWithInvalidCardEventsPopUpCancel_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Type").trim();
						String forDeniedWithInvalidCardEventsPopUpCancel_Default_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Default_Value").trim();
						String forDeniedWithInvalidCardEventsPopUpClose_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpClose_Type").trim();

						if (!forDeniedWithInvalidCardEventsPopUp_LabelBasicV.isBlank()
						        || !forDeniedWithInvalidCardEventsPopUpSearch_Type.isBlank()
						        || !forDeniedWithInvalidCardEventsPopUpSearch_Placeholder.isBlank()
						        || !forDeniedWithInvalidCardEventsPopUpSearch_Value.isBlank()
						        || !forDeniedWithInvalidCardEventsPopUp_Default_Table_Header_Value.isBlank()
						        || !forDeniedWithInvalidCardEventsPopUp_Default_Table_Row_Value.isBlank()
						        || !forDeniedWithInvalidCardEventsPopUp_Default_Table_No_Data_Value.isBlank()
						        || !forDeniedWithInvalidCardEventsPopUpCancel_Type.isBlank()
						        || !forDeniedWithInvalidCardEventsPopUpCancel_Default_Value.isBlank()
						        || !forDeniedWithInvalidCardEventsPopUp_Default_Table_Row_Value_Select.isBlank()
						        || !forDeniedWithInvalidCardEventsPopUpClose_Type.isBlank()) {

						    System.out.println("I am in For Denied With Invalid Card Events");
						    element_Click(advanced_wiegand_ForDeniedWithInvalidCardEvents_PicklistBtn);
						    waitForElementVisible(readers_InternalReaders_ReaderModeSchedule_Popup_Label);

						    // Pop up Open
						    if (!forDeniedWithInvalidCardEventsPopUp_LabelBasicV.isBlank()
						            && !forDeniedWithInvalidCardEventsPopUp_LabelBasicV.isEmpty()) {
						        System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
						        assertEquals(readers_InternalReaders_ReaderModeSchedule_Popup_Label.getText(),
						                forDeniedWithInvalidCardEventsPopUp_LabelBasicV,
						                "For Denied With Invalid Card Events Pop Up Label Comparision",
						                true, rowNumber, sheetName);
						    }

						    // Start Search Box
						    if (!forDeniedWithInvalidCardEventsPopUpSearch_Placeholder.isBlank()
						            && !forDeniedWithInvalidCardEventsPopUpSearch_Placeholder.isEmpty()) {
						        System.out.println("Element PlaceHolder :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"),
						                forDeniedWithInvalidCardEventsPopUpSearch_Placeholder,
						                "forDeniedWithInvalidCardEvents -> SearchBox PlaceHolder Comparison",
						                true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithInvalidCardEventsPopUpSearch_Type.isBlank()
						            && !forDeniedWithInvalidCardEventsPopUpSearch_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(basic_Site_Popup_search, "type"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "type"),
						                forDeniedWithInvalidCardEventsPopUpSearch_Type,
						                "Site Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithInvalidCardEventsPopUpSearch_Value.isBlank()
						            && !forDeniedWithInvalidCardEventsPopUpSearch_Value.isEmpty()) {
						        element_InputText(readers_InternalReaders_ReaderModeSchedule_Popup_search,
						                forDeniedWithInvalidCardEventsPopUpSearch_Value);
						        Thread.sleep(250);
						        element_Click(basic_Site_Popup_search_Button);
						        Thread.sleep(250);
						    }

						    // Table Header Value Checked
						    tableHeader_Control_Check_UIValidation("Picklist For Reader Mode Schedules", rowNumber, sheetName,
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_header,
						            forDeniedWithInvalidCardEventsPopUp_Default_Table_Header_Value);
						    Thread.sleep(250);

						    tableRow_Control_Check_UIValidation("Reader Mode Schedule Pop Up Table Row", rowNumber, sheetName,
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_Row,
						            "td[@class=\"cursor label-text\"]/label",
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_No_Data,
						            forDeniedWithInvalidCardEventsPopUp_Default_Table_Row_Value,
						            forDeniedWithInvalidCardEventsPopUp_Default_Table_No_Data_Value);

						    // Cancel Button
						    if (!forDeniedWithInvalidCardEventsPopUpCancel_Type.isBlank()
						            && !forDeniedWithInvalidCardEventsPopUpCancel_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"),
						                forDeniedWithInvalidCardEventsPopUpCancel_Type,
						                "Reader Mode Schedule Pop Up -> Cancel Button Type Comparison", true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithInvalidCardEventsPopUpCancel_Default_Value.isBlank()
						            && !forDeniedWithInvalidCardEventsPopUpCancel_Default_Value.isEmpty()) {
						        System.out.println("Element default Value :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"),
						                forDeniedWithInvalidCardEventsPopUpCancel_Default_Value,
						                "Reader Mode Schedule Pop Up -> Cancel Button default value Comparison",
						                true, rowNumber, sheetName);
						    }

						    // Close button
						    if (!forDeniedWithInvalidCardEventsPopUpClose_Type.isBlank()
						            && !forDeniedWithInvalidCardEventsPopUpClose_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
						        assertEquals(
						                element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"),
						                forDeniedWithInvalidCardEventsPopUpClose_Type,
						                "Site Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
						    }

						    // Select Row
						    if (!forDeniedWithInvalidCardEventsPopUp_Default_Table_Row_Value_Select.isBlank()
						            && !forDeniedWithInvalidCardEventsPopUp_Default_Table_Row_Value_Select.isEmpty()) {

						        for (int aa = 0; aa < readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.size(); aa++) {

						            System.out.println(readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
						                    .get(aa).getText());

						            if (readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
						                    .get(aa).getText().equalsIgnoreCase(
						                            forDeniedWithInvalidCardEventsPopUp_Default_Table_Row_Value_Select)) {

						                readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.get(aa).click();
						                Thread.sleep(250);
						                break;
						            }
						        }

						    } else {
						        element_Click(basic_Site_Popup_CloseButton);
						    }
						}
						//picklist code end

						// *******************Start Invalid Card Code - textbox*******************
						String InvalidCardCodeLab = excelFileDataRecord.get("InvalidCardCode_label").trim();
						String InvalidCardCodeTy = excelFileDataRecord.get("InvalidCardCode_Type").trim();
						String InvalidCardCodeVi = excelFileDataRecord.get("InvalidCardCode_Visibility").trim();
						String InvalidCardCodeP = excelFileDataRecord.get("InvalidCardCode_Placeholder").trim();
						String InvalidCardCode_default = excelFileDataRecord.get("InvalidCardCode_Default_Value").trim();
						String InvalidCardCodeV = excelFileDataRecord.get("InvalidCardCode_Value").trim();
						String InvalidCardCodeNegative = excelFileDataRecord.get("InvalidCardCode_Negative").trim();
						textBox_Control_Check_UIValidation("Invalid Card Code", rowNumber, sheetName, advanced_wiegand_InvalidCardCode_txtbox_Label,
								advanced_wiegand_InvalidCardCode_txtbox, InvalidCardCodeLab, InvalidCardCodeTy, InvalidCardCodeVi, InvalidCardCodeP,
								InvalidCardCode_default, InvalidCardCodeV, InvalidCardCodeNegative);
						
						//picklist code start
						// *******************For Denied With Invalid PIN Events Id Label And Control*******************
						String forDeniedWithInvalidPINEventsIdLab = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsId_label").trim();
						String forDeniedWithInvalidPINEventsIdTy = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsId_Type").trim();
						String forDeniedWithInvalidPINEventsIdVi = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsId_Visibility").trim();
						String forDeniedWithInvalidPINEventsIdP = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsId_Placeholder").trim();
						String forDeniedWithInvalidPINEventsId_default = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsId_Default_Value").trim();
						String forDeniedWithInvalidPINEventsIdV = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsId_Value").trim();
						String forDeniedWithInvalidPINEventsIdNegative = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsId_Negative").trim();

						textBox_Control_Check_UIValidation("For Denied With Invalid PIN Events", rowNumber, sheetName,
						        advanced_wiegand_ForDeniedWithInvalidPINEvents_label, advanced_wiegand_ForDeniedWithInvalidPINEvents,
						        forDeniedWithInvalidPINEventsIdLab, forDeniedWithInvalidPINEventsIdTy, forDeniedWithInvalidPINEventsIdVi,
						        forDeniedWithInvalidPINEventsIdP, forDeniedWithInvalidPINEventsId_default,
						        forDeniedWithInvalidPINEventsIdV, forDeniedWithInvalidPINEventsIdNegative);

						// *******************For Denied With Invalid PIN Events Label And Control*******************
						String forDeniedWithInvalidPINEventsNameTy = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsName_Type").trim();
						String forDeniedWithInvalidPINEventsNameVi = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsName_Visibility").trim();
						String forDeniedWithInvalidPINEventsNameP = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsName_Placeholder").trim();
						String forDeniedWithInvalidPINEventsName_default = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsName_Default_Value").trim();
						String forDeniedWithInvalidPINEventsNameV = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsName_Value").trim();
						String forDeniedWithInvalidPINEventsNameNegative = excelFileDataRecord.get("ForDeniedWithInvalidPINEventsName_Negative").trim();

						textBox_Control_Check_UIValidation("For Denied With Invalid PIN Events", rowNumber, sheetName,
						        advanced_wiegand_ForDeniedWithInvalidPINEvents_label, advanced_wiegand_ForDeniedWithInvalidPINEventsName,
						        "", forDeniedWithInvalidPINEventsNameTy, forDeniedWithInvalidPINEventsNameVi,
						        forDeniedWithInvalidPINEventsNameP, forDeniedWithInvalidPINEventsName_default,
						        forDeniedWithInvalidPINEventsNameV, forDeniedWithInvalidPINEventsNameNegative);

						// *******************For Denied With Invalid PIN Events Pop Up Button And Control*******************
						String forDeniedWithInvalidPINEventsPopUp_LabelBasicV = excelFileDataRecord.get("ReaderModeSchedulePopUp_Label").trim();
						String forDeniedWithInvalidPINEventsPopUpSearch_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Type").trim();
						String forDeniedWithInvalidPINEventsPopUpSearch_Placeholder = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Placeholder").trim();
						String forDeniedWithInvalidPINEventsPopUpSearch_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Value").trim();
						String forDeniedWithInvalidPINEventsPopUp_Default_Table_Header_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Header_Value").trim();
						String forDeniedWithInvalidPINEventsPopUp_Default_Table_Row_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value").trim();
						String forDeniedWithInvalidPINEventsPopUp_Default_Table_No_Data_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_No_Data_Value").trim();
						String forDeniedWithInvalidPINEventsPopUp_Default_Table_Row_Value_Select = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value_Select").trim();
						String forDeniedWithInvalidPINEventsPopUpCancel_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Type").trim();
						String forDeniedWithInvalidPINEventsPopUpCancel_Default_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Default_Value").trim();
						String forDeniedWithInvalidPINEventsPopUpClose_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpClose_Type").trim();

						if (!forDeniedWithInvalidPINEventsPopUp_LabelBasicV.isBlank()
						        || !forDeniedWithInvalidPINEventsPopUpSearch_Type.isBlank()
						        || !forDeniedWithInvalidPINEventsPopUpSearch_Placeholder.isBlank()
						        || !forDeniedWithInvalidPINEventsPopUpSearch_Value.isBlank()
						        || !forDeniedWithInvalidPINEventsPopUp_Default_Table_Header_Value.isBlank()
						        || !forDeniedWithInvalidPINEventsPopUp_Default_Table_Row_Value.isBlank()
						        || !forDeniedWithInvalidPINEventsPopUp_Default_Table_No_Data_Value.isBlank()
						        || !forDeniedWithInvalidPINEventsPopUpCancel_Type.isBlank()
						        || !forDeniedWithInvalidPINEventsPopUpCancel_Default_Value.isBlank()
						        || !forDeniedWithInvalidPINEventsPopUp_Default_Table_Row_Value_Select.isBlank()
						        || !forDeniedWithInvalidPINEventsPopUpClose_Type.isBlank()) {

						    System.out.println("I am in For Denied With Invalid PIN Events");
						    element_Click(advanced_wiegand_ForDeniedWithInvalidPINEvents_PicklistBtn);
						    waitForElementVisible(readers_InternalReaders_ReaderModeSchedule_Popup_Label);

						    // Pop up Open
						    if (!forDeniedWithInvalidPINEventsPopUp_LabelBasicV.isBlank()
						            && !forDeniedWithInvalidPINEventsPopUp_LabelBasicV.isEmpty()) {
						        System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
						        assertEquals(readers_InternalReaders_ReaderModeSchedule_Popup_Label.getText(),
						                forDeniedWithInvalidPINEventsPopUp_LabelBasicV,
						                "For Denied With Invalid PIN Events Pop Up Label Comparision",
						                true, rowNumber, sheetName);
						    }

						    // Start Search Box
						    if (!forDeniedWithInvalidPINEventsPopUpSearch_Placeholder.isBlank()
						            && !forDeniedWithInvalidPINEventsPopUpSearch_Placeholder.isEmpty()) {
						        System.out.println("Element PlaceHolder :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"),
						                forDeniedWithInvalidPINEventsPopUpSearch_Placeholder,
						                "forDeniedWithInvalidPINEvents -> SearchBox PlaceHolder Comparison",
						                true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithInvalidPINEventsPopUpSearch_Type.isBlank()
						            && !forDeniedWithInvalidPINEventsPopUpSearch_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(basic_Site_Popup_search, "type"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "type"),
						                forDeniedWithInvalidPINEventsPopUpSearch_Type,
						                "Site Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithInvalidPINEventsPopUpSearch_Value.isBlank()
						            && !forDeniedWithInvalidPINEventsPopUpSearch_Value.isEmpty()) {
						        element_InputText(readers_InternalReaders_ReaderModeSchedule_Popup_search,
						                forDeniedWithInvalidPINEventsPopUpSearch_Value);
						        Thread.sleep(250);
						        element_Click(basic_Site_Popup_search_Button);
						        Thread.sleep(250);
						    }

						    // Table Header Value Checked
						    tableHeader_Control_Check_UIValidation("Picklist For Reader Mode Schedules", rowNumber, sheetName,
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_header,
						            forDeniedWithInvalidPINEventsPopUp_Default_Table_Header_Value);
						    Thread.sleep(250);

						    tableRow_Control_Check_UIValidation("Reader Mode Schedule Pop Up Table Row", rowNumber, sheetName,
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_Row,
						            "td[@class=\"cursor label-text\"]/label",
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_No_Data,
						            forDeniedWithInvalidPINEventsPopUp_Default_Table_Row_Value,
						            forDeniedWithInvalidPINEventsPopUp_Default_Table_No_Data_Value);

						    // Cancel Button
						    if (!forDeniedWithInvalidPINEventsPopUpCancel_Type.isBlank()
						            && !forDeniedWithInvalidPINEventsPopUpCancel_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"),
						                forDeniedWithInvalidPINEventsPopUpCancel_Type,
						                "Reader Mode Schedule Pop Up -> Cancel Button Type Comparison", true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithInvalidPINEventsPopUpCancel_Default_Value.isBlank()
						            && !forDeniedWithInvalidPINEventsPopUpCancel_Default_Value.isEmpty()) {
						        System.out.println("Element default Value :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"),
						                forDeniedWithInvalidPINEventsPopUpCancel_Default_Value,
						                "Reader Mode Schedule Pop Up -> Cancel Button default value Comparison",
						                true, rowNumber, sheetName);
						    }

						    // Close button
						    if (!forDeniedWithInvalidPINEventsPopUpClose_Type.isBlank()
						            && !forDeniedWithInvalidPINEventsPopUpClose_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
						        assertEquals(
						                element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"),
						                forDeniedWithInvalidPINEventsPopUpClose_Type,
						                "Site Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
						    }

						    // Select Row
						    if (!forDeniedWithInvalidPINEventsPopUp_Default_Table_Row_Value_Select.isBlank()
						            && !forDeniedWithInvalidPINEventsPopUp_Default_Table_Row_Value_Select.isEmpty()) {

						        for (int aa = 0; aa < readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.size(); aa++) {

						            System.out.println(readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
						                    .get(aa).getText());

						            if (readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
						                    .get(aa).getText().equalsIgnoreCase(
						                            forDeniedWithInvalidPINEventsPopUp_Default_Table_Row_Value_Select)) {

						                readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.get(aa).click();
						                Thread.sleep(250);
						                break;
						            }
						        }

						    } else {
						        element_Click(basic_Site_Popup_CloseButton);
						    }
						}
						//picklist code end

						// *******************Start Invalid PIN Code - textbox*******************
						String invalidPINCodeLab = excelFileDataRecord.get("InvalidPINCode_label").trim();
						String invalidPINCodeTy = excelFileDataRecord.get("InvalidPINCode_Type").trim();
						String invalidPINCodeVi = excelFileDataRecord.get("InvalidPINCode_Visibility").trim();
						String invalidPINCodeP = excelFileDataRecord.get("InvalidPINCode_Placeholder").trim();
						String invalidPINCode_default = excelFileDataRecord.get("InvalidPINCode_Default_Value").trim();
						String invalidPINCodeV = excelFileDataRecord.get("InvalidPINCode_Value").trim();
						String invalidPINCodeNegative = excelFileDataRecord.get("InvalidPINCode_Negative").trim();
						textBox_Control_Check_UIValidation("Invalid PIN Code", rowNumber, sheetName, advanced_wiegand_InvalidPINCode_txtbox_Label,
								advanced_wiegand_InvalidPINCode_txtbox, invalidPINCodeLab, invalidPINCodeTy, invalidPINCodeVi, invalidPINCodeP,
								invalidPINCode_default, invalidPINCodeV, invalidPINCodeNegative);
						
						//picklist code start
						// *******************For Denied With Credential TimeOut Events Id Label And Control*******************
						String forDeniedWithCredentialTimeOutEventsIdLab = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsId_label").trim();
						String forDeniedWithCredentialTimeOutEventsIdTy = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsId_Type").trim();
						String forDeniedWithCredentialTimeOutEventsIdVi = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsId_Visibility").trim();
						String forDeniedWithCredentialTimeOutEventsIdP = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsId_Placeholder").trim();
						String forDeniedWithCredentialTimeOutEventsId_default = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsId_Default_Value").trim();
						String forDeniedWithCredentialTimeOutEventsIdV = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsId_Value").trim();
						String forDeniedWithCredentialTimeOutEventsIdNegative = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsId_Negative").trim();

						textBox_Control_Check_UIValidation("For Denied With Credential TimeOut Events", rowNumber, sheetName,
						        advanced_wiegand_ForDeniedWithCredentialTimeOutEvents_label, advanced_wiegand_ForDeniedWithCredentialTimeOutEvents,
						        forDeniedWithCredentialTimeOutEventsIdLab, forDeniedWithCredentialTimeOutEventsIdTy, forDeniedWithCredentialTimeOutEventsIdVi,
						        forDeniedWithCredentialTimeOutEventsIdP, forDeniedWithCredentialTimeOutEventsId_default,
						        forDeniedWithCredentialTimeOutEventsIdV, forDeniedWithCredentialTimeOutEventsIdNegative);

						// *******************For Denied With Credential TimeOut Events Label And Control*******************
						String forDeniedWithCredentialTimeOutEventsNameTy = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsName_Type").trim();
						String forDeniedWithCredentialTimeOutEventsNameVi = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsName_Visibility").trim();
						String forDeniedWithCredentialTimeOutEventsNameP = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsName_Placeholder").trim();
						String forDeniedWithCredentialTimeOutEventsName_default = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsName_Default_Value").trim();
						String forDeniedWithCredentialTimeOutEventsNameV = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsName_Value").trim();
						String forDeniedWithCredentialTimeOutEventsNameNegative = excelFileDataRecord.get("ForDeniedWithCredentialTimeOutEventsName_Negative").trim();

						textBox_Control_Check_UIValidation("For Denied With Credential TimeOut Events", rowNumber, sheetName,
						        advanced_wiegand_ForDeniedWithCredentialTimeOutEvents_label, advanced_wiegand_ForDeniedWithCredentialTimeOutEventsName,
						        "", forDeniedWithCredentialTimeOutEventsNameTy, forDeniedWithCredentialTimeOutEventsNameVi,
						        forDeniedWithCredentialTimeOutEventsNameP, forDeniedWithCredentialTimeOutEventsName_default,
						        forDeniedWithCredentialTimeOutEventsNameV, forDeniedWithCredentialTimeOutEventsNameNegative);

						// *******************For Denied With Credential TimeOut Events Pop Up Button And Control*******************
						String forDeniedWithCredentialTimeOutEventsPopUp_LabelBasicV = excelFileDataRecord.get("ReaderModeSchedulePopUp_Label").trim();
						String forDeniedWithCredentialTimeOutEventsPopUpSearch_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Type").trim();
						String forDeniedWithCredentialTimeOutEventsPopUpSearch_Placeholder = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Placeholder").trim();
						String forDeniedWithCredentialTimeOutEventsPopUpSearch_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpSearch_Value").trim();
						String forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_Header_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Header_Value").trim();
						String forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_Row_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value").trim();
						String forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_No_Data_Value = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_No_Data_Value").trim();
						String forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_Row_Value_Select = excelFileDataRecord.get("ReaderModeSchedulePopUp_Default_Table_Row_Value_Select").trim();
						String forDeniedWithCredentialTimeOutEventsPopUpCancel_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Type").trim();
						String forDeniedWithCredentialTimeOutEventsPopUpCancel_Default_Value = excelFileDataRecord.get("ReaderModeSchedulePopUpCancel_Default_Value").trim();
						String forDeniedWithCredentialTimeOutEventsPopUpClose_Type = excelFileDataRecord.get("ReaderModeSchedulePopUpClose_Type").trim();

						if (!forDeniedWithCredentialTimeOutEventsPopUp_LabelBasicV.isBlank()
						        || !forDeniedWithCredentialTimeOutEventsPopUpSearch_Type.isBlank()
						        || !forDeniedWithCredentialTimeOutEventsPopUpSearch_Placeholder.isBlank()
						        || !forDeniedWithCredentialTimeOutEventsPopUpSearch_Value.isBlank()
						        || !forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_Header_Value.isBlank()
						        || !forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_Row_Value.isBlank()
						        || !forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_No_Data_Value.isBlank()
						        || !forDeniedWithCredentialTimeOutEventsPopUpCancel_Type.isBlank()
						        || !forDeniedWithCredentialTimeOutEventsPopUpCancel_Default_Value.isBlank()
						        || !forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_Row_Value_Select.isBlank()
						        || !forDeniedWithCredentialTimeOutEventsPopUpClose_Type.isBlank()) {

						    System.out.println("I am in For Denied With Credential TimeOut Events");
						    element_Click(advanced_wiegand_ForDeniedWithCredentialTimeOutEvents_PicklistBtn);
						    waitForElementVisible(readers_InternalReaders_ReaderModeSchedule_Popup_Label);

						    // Pop up Open
						    if (!forDeniedWithCredentialTimeOutEventsPopUp_LabelBasicV.isBlank()
						            && !forDeniedWithCredentialTimeOutEventsPopUp_LabelBasicV.isEmpty()) {
						        System.out.println("Element Label :" + basic_Site_Popup_Label.getText());
						        assertEquals(readers_InternalReaders_ReaderModeSchedule_Popup_Label.getText(),
						                forDeniedWithCredentialTimeOutEventsPopUp_LabelBasicV,
						                "For Denied With Credential TimeOut Events Pop Up Label Comparision",
						                true, rowNumber, sheetName);
						    }

						    // Start Search Box
						    if (!forDeniedWithCredentialTimeOutEventsPopUpSearch_Placeholder.isBlank()
						            && !forDeniedWithCredentialTimeOutEventsPopUpSearch_Placeholder.isEmpty()) {
						        System.out.println("Element PlaceHolder :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "placeholder"),
						                forDeniedWithCredentialTimeOutEventsPopUpSearch_Placeholder,
						                "forDeniedWithCredentialTimeOutEvents -> SearchBox PlaceHolder Comparison",
						                true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithCredentialTimeOutEventsPopUpSearch_Type.isBlank()
						            && !forDeniedWithCredentialTimeOutEventsPopUpSearch_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(basic_Site_Popup_search, "type"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_search, "type"),
						                forDeniedWithCredentialTimeOutEventsPopUpSearch_Type,
						                "Site Pop Up -> SearchBox Type Comparison", true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithCredentialTimeOutEventsPopUpSearch_Value.isBlank()
						            && !forDeniedWithCredentialTimeOutEventsPopUpSearch_Value.isEmpty()) {
						        element_InputText(readers_InternalReaders_ReaderModeSchedule_Popup_search,
						                forDeniedWithCredentialTimeOutEventsPopUpSearch_Value);
						        Thread.sleep(250);
						        element_Click(basic_Site_Popup_search_Button);
						        Thread.sleep(250);
						    }

						    // Table Header Value Checked
						    tableHeader_Control_Check_UIValidation("Picklist For Reader Mode Schedules", rowNumber, sheetName,
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_header,
						            forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_Header_Value);
						    Thread.sleep(250);

						    tableRow_Control_Check_UIValidation("Reader Mode Schedule Pop Up Table Row", rowNumber, sheetName,
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_Row,
						            "td[@class=\"cursor label-text\"]/label",
						            readers_InternalReaders_ReaderModeSchedule_Popup_table_No_Data,
						            forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_Row_Value,
						            forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_No_Data_Value);

						    // Cancel Button
						    if (!forDeniedWithCredentialTimeOutEventsPopUpCancel_Type.isBlank()
						            && !forDeniedWithCredentialTimeOutEventsPopUpCancel_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "type"),
						                forDeniedWithCredentialTimeOutEventsPopUpCancel_Type,
						                "Reader Mode Schedule Pop Up -> Cancel Button Type Comparison", true, rowNumber, sheetName);
						    }

						    if (!forDeniedWithCredentialTimeOutEventsPopUpCancel_Default_Value.isBlank()
						            && !forDeniedWithCredentialTimeOutEventsPopUpCancel_Default_Value.isEmpty()) {
						        System.out.println("Element default Value :" +
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"));
						        assertEquals(
						                element_GetAttributeValue(readers_InternalReaders_ReaderModeSchedule_Popup_CancelButton, "value"),
						                forDeniedWithCredentialTimeOutEventsPopUpCancel_Default_Value,
						                "Reader Mode Schedule Pop Up -> Cancel Button default value Comparison",
						                true, rowNumber, sheetName);
						    }

						    // Close button
						    if (!forDeniedWithCredentialTimeOutEventsPopUpClose_Type.isBlank()
						            && !forDeniedWithCredentialTimeOutEventsPopUpClose_Type.isEmpty()) {
						        System.out.println("Element Attribute :" +
						                element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"));
						        assertEquals(
						                element_GetAttributeValue(basic_Site_Popup_CloseButton, "type"),
						                forDeniedWithCredentialTimeOutEventsPopUpClose_Type,
						                "Site Pop Up -> Close Button Type Comparison", true, rowNumber, sheetName);
						    }

						    // Select Row
						    if (!forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_Row_Value_Select.isBlank()
						            && !forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_Row_Value_Select.isEmpty()) {

						        for (int aa = 0; aa < readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.size(); aa++) {

						            System.out.println(readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
						                    .get(aa).getText());

						            if (readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect
						                    .get(aa).getText().equalsIgnoreCase(
						                            forDeniedWithCredentialTimeOutEventsPopUp_Default_Table_Row_Value_Select)) {

						                readers_InternalReaders_ReaderModeSchedule_Popup_table_Row_ValueSelect.get(aa).click();
						                Thread.sleep(250);
						                break;
						            }
						        }

						    } else {
						        element_Click(basic_Site_Popup_CloseButton);
						    }
						}
						//picklist code end
						
						// *******************Start Credential Time-Out Code - textbox*******************
						String credentialTimeOutCodeLab = excelFileDataRecord.get("CredentialTimeOutCode_label").trim();
						String credentialTimeOutCodeTy = excelFileDataRecord.get("CredentialTimeOutCode_Type").trim();
						String credentialTimeOutCodeVi = excelFileDataRecord.get("CredentialTimeOutCode_Visibility").trim();
						String credentialTimeOutCodeP = excelFileDataRecord.get("CredentialTimeOutCode_Placeholder").trim();
						String credentialTimeOutCode_default = excelFileDataRecord.get("CredentialTimeOutCode_Default_Value").trim();
						String credentialTimeOutCodeV = excelFileDataRecord.get("CredentialTimeOutCode_Value").trim();
						String credentialTimeOutCodeNegative = excelFileDataRecord.get("CredentialTimeOutCode_Negative").trim();
						textBox_Control_Check_UIValidation("Credential Time-Out Code", rowNumber, sheetName, advanced_wiegand_CredentialTimeOutCode_txtbox_Label,
								advanced_wiegand_CredentialTimeOutCode_txtbox, credentialTimeOutCodeLab, credentialTimeOutCodeTy, credentialTimeOutCodeVi, credentialTimeOutCodeP,
								credentialTimeOutCode_default, credentialTimeOutCodeV, credentialTimeOutCodeNegative);
						
						// Save button then checked main validation
						saveButtonClick();
						valMsg = validationMessage();
						String excelVal = excelFileDataRecord.get("Validation").trim();
						if (!excelVal.isBlank() && !excelVal.isEmpty()) {
							assertEquals(valMsg, excelFileDataRecord.get("Validation").trim(),
									"Main Validation on Save button Comparison", true, rowNumber, sheetName);
						}
						Thread.sleep(1500);
						waitForLocatorInVisible(By.id("DevicePageLoader"));
						reloadPageButtonClick();
						waitForLocatorInVisible(By.id("DevicePageLoader"));

					}
				}
	
}
