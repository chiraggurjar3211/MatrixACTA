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

public class PanelElevatorFloorGroupPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(PanelElevatorFloorGroupPO.class);
	
	public PanelElevatorFloorGroupPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "Add")
	private WebElement add;

	@FindBy(id = "config-frame")
	private WebElement configframe;

	@FindBy(id = "grpName")
	private WebElement grpName;

	@FindBy(id = "elevatoropenDoorPopUp")
	private WebElement elevatoropenDoorPopUp;

	@FindBy(id = "elevatorsearchQury")
	private WebElement elevatorsearchQury;

	@FindBy(xpath = "//*[@class=\"list-table\"]/tbody/tr[contains(@id,'elevatorpopuprow') and not(@class)]/td[2]/a")
	private List<WebElement> selectElevatorName;

	@FindBy(id = "flooropenDoorPopUp")
	private WebElement flooropenDoorPopUp;

	@FindBy(id = "floorsearchQury")
	private WebElement floorsearchQury;

	@FindBy(xpath = "//*[@class=\"list-table\"]/tbody/tr[contains(@id,'floorpopuprow') and not(@class)]/td[2]/a")
	private List<WebElement> selectFloorName;

	@FindBy(id = "updateBtn")
	private WebElement updateBtn;

	@FindBy(id = "saveBtn")
	private WebElement saveBtn;
	
	@FindBy(xpath = "//*[@class=\"msg_div\"]")
	private WebElement validation;
	
	@FindBy(id="listBtn")
	private WebElement listBtn;
	
	@FindBy(id = "elevatorbtnsearch")
	private WebElement elevatorsearchBtn;
	
	@FindBy(id = "floorbtnsearch")
	private WebElement floorbtnsearch;

//	public void elevatorFloorGroup(DataTable data) throws InterruptedException {
//		driver.switchTo().frame(configframe);
//		for (Map<String, String> dataT : data.asMaps(String.class, String.class)) {
//			String groupName = dataT.get("GroupName");
//			String elevator = dataT.get("Elevator");
//			String floor = dataT.get("Floor");
//			String val = dataT.get("validation");
//
//			waitForElementVisible(add);
//			element_Click(add);
//			waitForElementVisible(grpName);
//			element_Clear(grpName);
//			element_InputTextUsingActionClass(grpName, groupName);
//			element_Click(elevatoropenDoorPopUp);
//			waitForElementVisible(elevatorsearchQury);
//			element_Clear(elevatorsearchQury);
//			element_InputTextUsingActionClass(elevatorsearchQury, elevator);
//			element_TextBoxToClickOnEnter(elevatorsearchQury);
//			for(int i=0;i<selectElevatorName.size();i++) {
//				if(selectElevatorName.get(i).getText().equalsIgnoreCase(elevator)) {
//					selectElevatorName.get(i).click();
//					break;
//				}
//			}
//			element_Click(flooropenDoorPopUp);
//			waitForElementVisible(floorsearchQury);
//			element_Clear(floorsearchQury);
//			element_InputTextUsingActionClass(floorsearchQury, floor);
//			element_TextBoxToClickOnEnter(floorsearchQury);
//			for(int i=0;i<selectFloorName.size();i++) {
//				if(selectFloorName.get(i).getText().equalsIgnoreCase(elevator)) {
//					selectFloorName.get(i).click();
//					break;
//				}
//			}
//			Thread.sleep(1000);
//			element_Click(updateBtn);
//			Thread.sleep(1000);
//			element_Click(saveBtn);
//			Assert.assertEquals(element_GetText(validation), val);
//			Thread.sleep(1500);
//			element_Click(listBtn);
//		}
//		driver.switchTo().defaultContent();
//	}
	
	public void elevatorFloorGroupfetchinfFromExcel(DataTable data) throws InterruptedException, IOException {
		driver.switchTo().frame(configframe);
		String[][] dataE = Panel200HomePO.excelData("D_ElevatorFlrGrp");
		System.out.println(dataE[1][1]);
		
		for (int i = 1; i < dataE.length; i++) {
			for (Map<String, String> dataT : data.asMaps(String.class, String.class)) {
				logger.info("GroupName: "+dataT.get("GroupName")+" Elevator: "+dataT.get("Elevator"));
				int groupName = Integer.parseInt(dataT.get("GroupName"));
				int elevator = Integer.parseInt(dataT.get("Elevator"));
				int floor = Integer.parseInt(dataT.get("Floor"));
				int val = Integer.parseInt(dataT.get("validation"));
				waitForElementVisible(add);
				element_Click(add);
				waitForElementVisible(grpName);
				element_Clear(grpName);
				element_InputTextUsingActionClass(grpName, dataE[i][groupName]);
				String[][] dataSub = Panel200HomePO.excelData("D_ElevatorFlrGrpwithELFL");
				
				int count = 0;
				for (int j = 1; j < dataSub.length; j++) {
					if (dataSub[j][groupName].equalsIgnoreCase(dataE[i][groupName])) {
						element_Click(elevatoropenDoorPopUp);
						waitForElementVisible(elevatorsearchQury);
						element_Clear(elevatorsearchQury);
						element_InputTextUsingActionClass(elevatorsearchQury, dataSub[j][elevator]);
						element_Click(elevatorsearchBtn);
						for(int x=0;x<selectElevatorName.size();x++) {
							if(selectElevatorName.get(x).getText().equalsIgnoreCase(dataSub[j][elevator])) {
								selectElevatorName.get(x).click();
								break;
							}
						}
						element_Click(flooropenDoorPopUp);
						waitForElementVisible(floorsearchQury);
						element_Clear(floorsearchQury);
						element_InputTextUsingActionClass(floorsearchQury, dataSub[j][floor]);
						//element_TextBoxToClickOnEnter(floorsearchQury);
						element_Click(floorbtnsearch);
						for(int y=0;y<selectFloorName.size();y++) {
							if(selectFloorName.get(y).getText().equalsIgnoreCase(dataSub[j][floor])) {
								selectFloorName.get(y).click();
								break;
							}
						}
						Thread.sleep(1000);
						element_Click(updateBtn);
						count++;
					}
				}
				
//				element_Click(elevatoropenDoorPopUp);
//				waitForElementVisible(elevatorsearchQury);
//				element_Clear(elevatorsearchQury);
//				element_InputTextUsingActionClass(elevatorsearchQury, dataE[i][elevator]);
//				//element_TextBoxToClickOnEnter(elevatorsearchQury);
//				element_Click(elevatorsearchBtn);
//				for(int x=0;x<selectElevatorName.size();x++) {
//					if(selectElevatorName.get(x).getText().equalsIgnoreCase(dataE[i][elevator])) {
//						selectElevatorName.get(x).click();
//						break;
//					}
//				}
//				element_Click(flooropenDoorPopUp);
//				waitForElementVisible(floorsearchQury);
//				element_Clear(floorsearchQury);
//				element_InputTextUsingActionClass(floorsearchQury, dataE[i][floor]);
//				//element_TextBoxToClickOnEnter(floorsearchQury);
//				element_Click(floorbtnsearch);
//				for(int y=0;y<selectFloorName.size();y++) {
//					if(selectFloorName.get(y).getText().equalsIgnoreCase(dataE[i][floor])) {
//						selectFloorName.get(y).click();
//						break;
//					}
//				}
//				Thread.sleep(1000);
//				element_Click(updateBtn);
				Thread.sleep(1000);
				element_Click(saveBtn);
				Assert.assertEquals(element_GetText(validation), dataE[i][val]);
				Thread.sleep(1500);
				element_Click(listBtn);
			}
		}
		driver.switchTo().defaultContent();
	}
	
}
