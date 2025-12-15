package PageObject.Panel200;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class PanelElevatorConfigurationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(PanelElevatorConfigurationPO.class);
	
	public PanelElevatorConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "Add")
	private WebElement add;

	@FindBy(id = "config-frame")
	private WebElement configframe;

	@FindBy(id = "elevatorName")
	private WebElement elevatorName;

	@FindBy(id = "numberOfFloor")
	private WebElement numberOfFloor;

	@FindBy(id = "authDeviceOpenPopUp")
	private WebElement authDeviceOpenPopUp;

	@FindBy(id = "searchQury")
	private WebElement searchQury;

	@FindBy(xpath = "//*[@class=\"list-table\"]/tbody/tr[contains(@id,'doorRow') and not(@class)]/td[2]/a")
	private List<WebElement> panelDoorSelct;

	@FindBy(id = "authDurationFrFloor")
	private WebElement authDurationFrFloor;

	@FindBy(id = "btnsave")
	private WebElement saveBtn;

	@FindBy(xpath = "//*[@class=\"msg_div\"]")
	private WebElement validation;

	@FindBy(id = "floorNameRow0")
	private WebElement floorNameRow0;

	@FindBy(id = "ioOpenPopUpRow0")
	private WebElement ioOpenPopUpRow0;

	@FindBy(id = "listBtn")
	private WebElement listBtn;

	@FindBy(id = "AddorUpdateField")
	private WebElement AddorUpdateField;

//	public void elevatorConfiguration(DataTable data) throws InterruptedException {
//		driver.switchTo().frame(configframe);
//		for (Map<String, String> dataT : data.asMaps(String.class, String.class)) {
//			String elevatorN = dataT.get("ElevatorName");
//			String numberofFlr = dataT.get("NumberofFloors");
//			String authD = dataT.get("AuthenticationDevice");
//			String acsDu4Flrs = dataT.get("AccessDurationForFloors");
//			String val = dataT.get("validation");
//			String doorN = dataT.get("DoorName");
//
//			waitForElementVisible(add);
//			element_Click(add);
//			waitForElementVisible(elevatorName);
//			element_Clear(elevatorName);
//			element_InputTextUsingActionClass(elevatorName, elevatorN);
//			element_Clear(numberOfFloor);
//			element_InputTextUsingActionClass(numberOfFloor, numberofFlr);
//			element_Click(authDeviceOpenPopUp);
//			waitForElementVisible(searchQury);
//			element_Clear(searchQury);
//			element_InputTextUsingActionClass(searchQury, doorN);
//			element_TextBoxToClickOnEnter(searchQury);
//			for (int i = 0; i < panelDoorSelct.size(); i++) {
//				if (panelDoorSelct.get(i).getText().equalsIgnoreCase(doorN)) {
//					panelDoorSelct.get(i).click();
//					break;
//				}
//			}
//			element_Clear(floorNameRow0);
//			element_InputTextUsingActionClass(floorNameRow0, "floor1");
//
//			element_Click(ioOpenPopUpRow0);
//			for (int i = 0; i < panelDoorSelct.size(); i++) {
//				if (panelDoorSelct.get(i).getText().equalsIgnoreCase("ARCAUTO")) {
//					panelDoorSelct.get(i).click();
//					break;
//				}
//			}
//			element_Click(saveBtn);
//			Assert.assertEquals(element_GetText(validation), val);
//			Thread.sleep(1500);
//			element_Click(listBtn);
//		}
//		driver.switchTo().defaultContent();
//	}

	public void elevatorConfigurationfetchinfFromExcel(DataTable data) throws InterruptedException, IOException {
		driver.switchTo().frame(configframe);
		String[][] dataE = Panel200HomePO.excelData("D_Elevator");
		for (int i = 1; i < dataE.length; i++) {
			for (Map<String, String> dataT : data.asMaps(String.class, String.class)) {
				logger.info("ElevatorName: "+dataT.get("ElevatorName"));
				int elevatorN = Integer.parseInt(dataT.get("ElevatorName")); // 0
				int numberofFlr = Integer.parseInt(dataT.get("NumberofFloors")); // 1
				int authD = Integer.parseInt(dataT.get("AuthenticationDevice")); // 2
				int acsDu4Flrs = Integer.parseInt(dataT.get("AccessDurationForFloors")); // 4
				int val = Integer.parseInt(dataT.get("validation")); // 5
				int doorN = Integer.parseInt(dataT.get("DoorName"));// 3
				int flrName = Integer.parseInt(dataT.get("FloorName"));// 1
				int iOCntrlName = Integer.parseInt(dataT.get("IOController"));// 3

				waitForElementVisible(add);
				element_Click(add);
				waitForElementVisible(elevatorName);
				element_Clear(elevatorName);
				element_InputTextUsingActionClass(elevatorName, dataE[i][elevatorN]);
				element_Clear(numberOfFloor);
				element_InputTextUsingActionClass(numberOfFloor, dataE[i][numberofFlr]);
				element_Click(authDeviceOpenPopUp);
				waitForElementVisible(searchQury);
				element_Clear(searchQury);
				element_InputTextUsingActionClass(searchQury, dataE[i][doorN]);
				element_TextBoxToClickOnEnter(searchQury);
				for (int x = 0; x < panelDoorSelct.size(); x++) {
					if (panelDoorSelct.get(x).getText().equalsIgnoreCase(dataE[i][doorN])) {
						panelDoorSelct.get(x).click();
						break;
					}
				}
				element_Click(AddorUpdateField);

				String[][] dataSub = Panel200HomePO.excelData("D_ElevatorFloor");
				int count = 0;
				for (int j = 1; j < dataSub.length; j++) {
					if (dataSub[j][elevatorN].equalsIgnoreCase(dataE[i][elevatorN])) {
						String xpathoffloorNameRow = "floorNameRow" + count;
						String xpathofioOpenPopUpRow = "ioOpenPopUpRow" + count;
						element_Clear(driver.findElement(By.id(xpathoffloorNameRow)));
						element_InputTextUsingActionClass(driver.findElement(By.id(xpathoffloorNameRow)), dataSub[j][flrName]);
						element_Click(driver.findElement(By.id(xpathofioOpenPopUpRow)));
						for (int y = 0; y < panelDoorSelct.size(); y++) {
							if (panelDoorSelct.get(y).getText().equalsIgnoreCase(dataSub[j][iOCntrlName])) {
								panelDoorSelct.get(y).click();
								break;
							}
						}
						count++;
					}
				}

				element_Click(saveBtn);
				Assert.assertEquals(element_GetText(validation), dataE[i][val]);
				Thread.sleep(1500);
				element_Click(listBtn);
			}
		}
		driver.switchTo().defaultContent();
	}

}
