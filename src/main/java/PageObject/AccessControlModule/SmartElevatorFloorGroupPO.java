package PageObject.AccessControlModule;

import java.util.Map;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class SmartElevatorFloorGroupPO extends AbstractMethod{
	WebDriver driver;

	public SmartElevatorFloorGroupPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id="SmartElevatorFloorGroupName")
	private WebElement smartElevatorFloorGroupName;
	
	@FindBy(id="gridCfgGroupMembersaddBtn")
	private WebElement gridCfgGroupMembersaddBtn;
	
	@FindBy(id="ElevatorFacilityPicklistID")
	private WebElement elevatorFacilityPicklistID;
	
	@FindBy(id="ElevatorFacilityPicklistName")
	private WebElement elevatorFacilityPicklistName;
	
	@FindBy(xpath="//*[@id=\"ElevatorFacilityFloorsPicklistName\"]/ancestor::div[1]/span//i")
	private WebElement ElevatorFacilityFloorsPicklistBtn;
	
	@FindBy(xpath="//*[@class=\"row isselected-grid\"]//input")
	private WebElement accessibleFloorsAllSelectedCheckBox;
	
	@FindBy(xpath="//*[@value=\"OK\"]")
	private WebElement popUpOkButton;
	
	@FindBy(id="ElevatorFacilityDefaultFloorPicklistID")
	private WebElement ElevatorFacilityDefaultFloorPicklistID;
	
	@FindBy(xpath="//*[@class=\"grid-raw-size cursor grd-prevent-rtl\"]/a[@id=\"savebtn\"]")
	private WebElement saveButtonTable;
	
	@FindBy(xpath = "//*[@id='message']/div/label")
	private WebElement valMessagepath;
	
	@FindBy(xpath = "//*[text()='Picklist For Accessible Floors']")
	private WebElement pickListPopUpOpen;
	
	
	
	public void addSmartElevatorFloorGroup(Map<String, String> data) throws InterruptedException {
		int groupTotal=Integer.parseInt(data.get("totalAddedCount"));
		for(int i=1;i<=groupTotal;i++) {
			pageLoadWaitng();
			waitForElementVisible(smartElevatorFloorGroupName);
			addButtonClick();
			Thread.sleep(1000);
			String groupName=data.get("SmartElevatorFloorGroupName")+i;
			element_Clear(smartElevatorFloorGroupName);
			element_InputTextUsingActionClass(smartElevatorFloorGroupName, groupName);
			Thread.sleep(1000);
			for(int x=1;x<=32;x++) {
				waitForElementClickable(gridCfgGroupMembersaddBtn,1);
				element_Click(gridCfgGroupMembersaddBtn);
				waitForElementVisible_TimeinMinutes(elevatorFacilityPicklistName, 1);
				element_InputTextUsingActionClass(elevatorFacilityPicklistName, "EleConf"+String.valueOf(x));
				element_TextBoxToClickOnEnter(elevatorFacilityPicklistName);
				Thread.sleep(1000);
				element_Click(ElevatorFacilityFloorsPicklistBtn);
				waitForElementVisible_TimeinMinutes(pickListPopUpOpen, 1);
				Thread.sleep(1000);
				element_Click(accessibleFloorsAllSelectedCheckBox);
				Thread.sleep(1000);
				element_Click(popUpOkButton);
				Thread.sleep(1000);
				element_InputTextUsingActionClass(ElevatorFacilityDefaultFloorPicklistID, "1");
				element_TextBoxToClickOnTab(ElevatorFacilityDefaultFloorPicklistID);
				Thread.sleep(1000);
				element_Click(saveButtonTable);
				Thread.sleep(500);
			}
			saveButtonClick();
			waitForElementVisible_TimeinMinutes(valMessagepath, 1);
			String val = validationMessage();
			Assert.assertEquals(val, "Saved Successfully");
			reloadPageButtonClick();
		}
		
	}
	
}
