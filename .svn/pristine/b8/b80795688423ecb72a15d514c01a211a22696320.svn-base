package PageObject.AccessControlModule;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import PageObject.Panel200.Panel200HomePO;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.it.Ma;

public class ElevatorConfigurationPO extends AbstractMethod{
	WebDriver driver;
	public ElevatorConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//****************************************************
	//ELEMENTS
	//***************************************************
	@FindBy(id = "ElevatorAllowedAccessPanelLiteV2Name")
	private WebElement panelNameTxt;
	
	@FindBy(id = "ElevatorsName")
	private WebElement elevatorsNameTxt;
	
	@FindBy(id = "ElevatorAllowedAccessPanelDoorsName")
	private WebElement authdeviceTxt;
	
	@FindBy(id = "txtACSDur")
	private WebElement accessDurTxt;
	
	@FindBy(id = "grdFloorElevatorWiseaddBtn")
	private WebElement addButton;
	
	@FindBy(id = "FloorName")
	private WebElement floorNameTxt;
	
	@FindBy(id = "ElevatorAllowedAccessARCIO800Name")
	private WebElement ioControlNameTxt;
	
	@FindBy(id = "CustOutputPort")
	private WebElement portDD;
	
	@FindBy(id = "savebtn")
	private WebElement gridSave;
	
	
	
	//***************************************************
	//FUNCTIONS
	//***************************************************
	
	public void createElevator(DataTable data, String panel) throws InterruptedException, IOException {
		pageLoadWaitng();
		element_Clear(panelNameTxt);
		element_InputTextUsingActionClass(panelNameTxt, panel);
		element_TextBoxToClickOnTab(panelNameTxt);
		Thread.sleep(1000);
		String[][] dataE = AccessControlPO.excelDataElevator("S_Elevator");
		for (int i = 1; i < dataE.length; i++) {
			for (Map<String, String> dataT : data.asMaps(String.class, String.class)) {
				int elevatorN = Integer.parseInt(dataT.get("ElevatorName")); // 0
				int authD = Integer.parseInt(dataT.get("AuthenticationDevice")); // 1
				int acsDu4Flrs = Integer.parseInt(dataT.get("AccessDurationForFloors")); // 2
				int val = Integer.parseInt(dataT.get("validation")); // 3
				int flrName = Integer.parseInt(dataT.get("FloorName"));// 1
				int iOCntrlName = Integer.parseInt(dataT.get("IOController"));// 2
				
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(elevatorsNameTxt);
				element_InputTextUsingActionClass(elevatorsNameTxt, dataE[i][elevatorN]);
				Thread.sleep(1000);
				element_Clear(authdeviceTxt);
				Thread.sleep(1000);
				element_InputTextUsingActionClass(authdeviceTxt, dataE[i][authD]);
				Thread.sleep(1000);
				element_TextBoxToClickOnTab(authdeviceTxt);
				Thread.sleep(1000);
				element_Clear(accessDurTxt);
				element_InputTextUsingActionClass(accessDurTxt, dataE[i][acsDu4Flrs]);
				Thread.sleep(500);

				String[][] dataSub = AccessControlPO.excelDataElevator("S_ElevatorFloor");
				int count = 0;
				for (int j = 1; j < dataSub.length; j++) {
					if (dataSub[j][elevatorN].equalsIgnoreCase(dataE[i][elevatorN])) {
						element_Click(addButton);
						element_Clear(floorNameTxt);
						element_InputTextUsingActionClass(floorNameTxt, dataSub[j][flrName]);
						element_Clear(ioControlNameTxt);
						element_InputTextUsingActionClass(ioControlNameTxt, dataSub[j][iOCntrlName]);
						element_TextBoxToClickOnTab(ioControlNameTxt);
						element_DropDownSelectByvisibleText(portDD, "Aux. Output 1");
						element_Click(gridSave);
						Thread.sleep(1000);
						count++;
					}
				}
				saveButtonClick();
				Assert.assertEquals(validationMessage(), dataE[i][val]);
			}
		}	
	}

}
