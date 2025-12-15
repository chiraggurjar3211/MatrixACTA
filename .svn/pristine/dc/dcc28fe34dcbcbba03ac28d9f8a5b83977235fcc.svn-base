package PageObject.AccessControlModule;

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
import PageObject.DeviceModule.DeviceConfigurationPO;

public class ElevatorFacilityConfigurationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(ElevatorFacilityConfigurationPO.class);
	public ElevatorFacilityConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "ElevFacilityName")
	private WebElement elevFacilityName;

	@FindBy(xpath = "//*[contains(@id,'txtIPAddress')]")
	private List<WebElement> ipAddress;

	@FindBy(xpath = "//*[@id=\"collapseOne\" and not(contains(@class,'show'))]/ancestor::div[1]/a")
	private WebElement configureDeviceTab;

	@FindBy(xpath = "//*[@id=\\\"collapseOne\\\" and not(contains(@class,'show'))]/ancestor::div[1]/a")
	private List<WebElement> configureDeviceTabsize;

	@FindBy(id = "ElevatorFacilityAllowedDevicesName")
	private WebElement deviceName;

	@FindBy(xpath = "//*[@id=\"collapseTwo\" and not(contains(@class,'show'))]/ancestor::div[1]/a")
	private WebElement floorConfigurationTab;

	@FindBy(xpath = "//*[@id=\"collapseTwo\" and not(contains(@class,'show'))]/ancestor::div[1]/a")
	private List<WebElement> floorConfigurationTabsize;

	@FindBy(id = "lstTerminalID_grdCfgDevAdd_0")
	private WebElement terminalID;

	@FindBy(id = "grdFloorCfgaddBtn")
	private WebElement flooraddbutton;

	@FindBy(id = "FloorName")
	private WebElement floorName;

	@FindBy(id = "ElevatorFloorAllowedDevicesName")
	private WebElement elevatorFloorAllowedDevicesName;

	@FindBy(xpath = "//*[@class=\"grid-raw-size cursor grd-prevent-rtl\"]//a[@id=\"savebtn\" and not(@hidden)]/i")
	private WebElement floorSaveB;

	@FindBy(xpath = "//*[@id=\"collapseOne\"]//*[@class=\"input-group-btn\"]")
	private WebElement deviceOpenPopup;

	@FindBy(xpath = "//*[@class=\"row isselected-grid\"]//input")
	private WebElement selectAllDevice;

	@FindBy(xpath = "//input[@value=\"OK\"]")
	private WebElement clikONOK;

	@FindBy(xpath = "//*[contains(@id,\"lstTerminalID_grdCfgDevAdd\")]")
	private List<WebElement> terminalIDs;

	@FindBy(xpath = "//*[@id=\"collapseOne\"]//*[@class=\"pagination-next\"]")
	private WebElement clickonA;

	@FindBy(xpath = "//*[@id=\"collapseOne\"]//*[@class=\"pagination-next\"]")
	private List<WebElement> clickonASize;
	
	@FindBy(id="FloorNo")
	private WebElement floorNumber;
	
	@FindBy(id = "loading-overlay")
	private List<WebElement> pageOnLoad;

	public void addElevatorFacilityConfiguration(Map<String, String> data) throws InterruptedException {
//		int deviceEnd = 0;
//		int valueE = 0;
//		int deviceStart = 1;
//		int valueS = 1;
		int configNo = Integer.parseInt(data.get("ConfigNO"));
		for (int i = 1; i <= configNo; i++) {
			int deviceEnd = 127 * i;
			int valueE = 127 * i;
			int	deviceStart = deviceEnd - 126;
			int	valueS = valueE - 126;
			System.out.println("**************Device Start :" + deviceStart + "  Device End :" + deviceEnd);
			System.out.println("Value Start :" + valueS + "  Value End :" + valueE);
			logger.info("********************************Device Start :" + deviceStart + "  Device End :" + deviceEnd);
			logger.info("Value Start :" + valueS + "  Value End :" + valueE);
			pageLoadWaitng();
			waitForElementVisible(elevFacilityName);
			Thread.sleep(1000);
			reloadPageButtonClick();
			Thread.sleep(1000);
			addButtonClick();
			if(i == 33) {
				String val = validationMessage();
				Assert.assertEquals(val, "System cannot support any more Elevator Facility");
				break;
			}
			Thread.sleep(1000);
			waitForElementVisible(elevFacilityName);
			String fullElevatorFacilityName = data.get("ElevatorFacilityName") + i;
			element_Clear(elevFacilityName);
			element_InputTextUsingActionClass(elevFacilityName, fullElevatorFacilityName);
			Thread.sleep(1000);
			String[] ipSplit = data.get("ElevatorTerminalIPAddress").split("\\.");
			System.out.println(ipSplit.length);
			System.out.println(ipSplit[0]);
			System.out.println(ipAddress.size());
			logger.info(ipSplit.length);
			logger.info(ipSplit[0]);
			logger.info(ipAddress.size());
			for (int j = 0; j < ipAddress.size(); j++) {
				ipAddress.get(j).clear();
				ipAddress.get(j).sendKeys(ipSplit[j]);
				Thread.sleep(500);
			}
			// Device Configuration Tab
//			if (i == 31) {
//				if (configureDeviceTabsize.size() > 0) {
//					element_Click(configureDeviceTab);
//				}
//				Thread.sleep(1000);
//				element_Click(deviceOpenPopup);
//				Thread.sleep(1000);
//				element_Click(selectAllDevice);
//				Thread.sleep(2000);
//				element_Click(clikONOK);
//				Thread.sleep(2000);
//				int sum = 0;
//				do {
//					if (sum != 0) {
//						if (clickonA.isEnabled()) {
//							element_Click(clickonA);
//						}
//					}
//					Thread.sleep(500);
//					System.out.println(sum);
//					for (int p = 0; p < terminalIDs.size(); p++) {
//						int terminalIDadd = (p + sum + 1);
//						terminalIDs.get(p).sendKeys(String.valueOf(terminalIDadd));
//					}
//					sum = sum + 10;
//				} while (clickonASize.size() > 0);
//			}
			Thread.sleep(1000);
			element_Click(configureDeviceTab);
			Thread.sleep(1000);
			for (int x = deviceStart; x <= deviceEnd; x++) {
				Thread.sleep(1000);
				String deviceNameC = data.get("DeviceName") + x;
				System.out.println("Device Name :" + deviceNameC);
				element_Clear(deviceName);
				element_InputText(deviceName, deviceNameC);
				element_TextBoxToClickOnEnter(deviceName);
			}
			Thread.sleep(2000);
			int sum = 0;
			do {
				if (sum != 0) {
					if (clickonA.isEnabled()) {
						element_Click(clickonA);
					}
				}
				Thread.sleep(500);
				System.out.println(sum);
				for (int p = 0; p < terminalIDs.size(); p++) {
					int terminalIDadd = (p + sum + 1);
					terminalIDs.get(p).sendKeys(String.valueOf(terminalIDadd));
				}
				sum = sum + 10;
			} while (clickonASize.size() > 0);
//				element_InputTextUsingActionClass(deviceName, data.get("DeviceName"));
//				element_TextBoxToClickOnTab(deviceName);
//				Thread.sleep(500);
//				element_InputTextUsingActionClass(terminalID, "1");

			Thread.sleep(1000);
			if (floorConfigurationTabsize.size() > 0) {
				element_Click(floorConfigurationTab);
			}
			Thread.sleep(1000);
			for (int x = 1; x <= Integer.parseInt(data.get("FloorGroupNo")); x++) {
				Thread.sleep(500);
				waitForElementClickable(flooraddbutton,2);
				element_Click(flooraddbutton);
				waitForElementVisible_TimeinMinutes(floorName,2);
				Thread.sleep(500);
				 String flName=String.valueOf(x);
				 waitForElementClickable(floorNumber,2);
				element_InputText(floorNumber, flName);
				Thread.sleep(200);
				String floorNameAdd = data.get("FloorGroupName") + x;
				System.out.println(floorNameAdd);
				logger.info(floorNameAdd);
				 waitForElementClickable(floorName,2);
				element_InputText(floorName, floorNameAdd);
				Thread.sleep(200);
				if (x > 128) {
					String deviceNameAdds = data.get("DeviceName") + valueS;
					System.out.println("device Name added in floor : " + deviceNameAdds);
					logger.info("device Name added in floor : " + deviceNameAdds);
//					element_dynamicDDSelect(elevatorFloorAllowedDevicesName, deviceNameAdds);
					element_InputText(elevatorFloorAllowedDevicesName, deviceNameAdds);
					element_TextBoxToClickOnTab(elevatorFloorAllowedDevicesName);
					Thread.sleep(500);
					valueS++;
				}
				Thread.sleep(200);
				waitForElementClickable(floorSaveB,2);
				element_Click(floorSaveB);
				Thread.sleep(200);
			}
			saveButtonClick();
			String val = validationMessage();
			Assert.assertEquals(val, "Saved Successfully");
			System.out.println("Device Start :" + deviceStart + "  Device End :" + deviceEnd);
			logger.info("Device Start :" + deviceStart + "  Device End :" + deviceEnd);
			
			System.out.println("Value Start :" + valueS + "  Value End :" + valueE);
			logger.info("Value Start :" + valueS + "  Value End :" + valueE);

		}

	}

}
