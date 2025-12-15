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

public class ElevatorFloorGroupPO extends AbstractMethod{
	WebDriver driver;
	public ElevatorFloorGroupPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//****************************************************
	//ELEMENTS
	//***************************************************
	@FindBy(id = "FloorGroupName")
	private WebElement floorGroupNameTxt;
	
	@FindBy(id = "grdElFlGrpMembersaddBtn")
	private WebElement addButton;
	
	@FindBy(id = "pkElevatorsName")
	private WebElement elevatorNameTxt;
	
	@FindBy(id = "pkElFloorsName")
	private WebElement floorNameTxt;
	
	@FindBy(id = "savebtn")
	private WebElement gridsaveBtn;
	
	@FindBy(xpath = "(//*[@class=\"input-group-btn\"])[2]")
	private WebElement floorGrpPicklist;
	
	@FindBy(xpath = "//*[@class=\"row isselected-grid\"]//*[@class=\"ng-untouched ng-pristine ng-valid\"]")
	private WebElement selectAllCheckbox;
	
	@FindBy(xpath = "//*[@key='OK']")
	private WebElement popupOkBtn;
	
	
	//****************************************************
	//FUNCTIONS
	//***************************************************
	public void createFloorGroup(DataTable data) throws InterruptedException, IOException {
		pageLoadWaitng();
		String[][] dataE = AccessControlPO.excelDataElevator("S_ElevatorFlrGrp");
		for (int i = 1; i < dataE.length; i++) {
			for (Map<String, String> dataT : data.asMaps(String.class, String.class)) {
				int groupName = Integer.parseInt(dataT.get("GroupName")); //0
				int elevator = Integer.parseInt(dataT.get("Elevator")); //1
				int floor = Integer.parseInt(dataT.get("Floor")); //2
				int val = Integer.parseInt(dataT.get("validation")); //3
				
				addButtonClick();
				element_Clear(floorGroupNameTxt);
				element_InputTextUsingActionClass(floorGroupNameTxt, dataE[i][groupName]);
				
				String[][] dataSub = AccessControlPO.excelDataElevator("S_ElevatorFlrGrpwithELFL");
				int count = 0;
				for (int j = 1; j < dataSub.length; j++) {
					if (dataSub[j][groupName].equalsIgnoreCase(dataE[i][groupName])) {
						element_Click(addButton);
						Thread.sleep(500);
						element_Click(elevatorNameTxt);
						element_Clear(elevatorNameTxt);
						element_InputTextUsingActionClass(elevatorNameTxt, dataSub[j][elevator]);
						element_TextBoxToClickOnTab(elevatorNameTxt);
						Thread.sleep(1000);
//						element_Click(floorNameTxt);
//						element_Clear(floorNameTxt);
//						element_InputTextUsingActionClass(floorNameTxt, dataSub[j][floor]);
//						element_TextBoxToClickOnTab(floorNameTxt);
						element_Click(floorGrpPicklist);
						Thread.sleep(500);
						element_Click(selectAllCheckbox);
						element_Click(popupOkBtn);
						Thread.sleep(1000);
						element_Click(gridsaveBtn);
						Thread.sleep(500);
						count++;
					}
				}
				saveButtonClick();
				Assert.assertEquals(validationMessage(), dataE[i][val]);
			}
		}
		
	}

}
