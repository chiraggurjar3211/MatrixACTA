package PageObject.Panel200;

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

public class SmartElevatorFloorGroupPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(SmartElevatorFloorGroupPO.class);

	public SmartElevatorFloorGroupPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@id=\"Add\" or @id=\"addBtn\"]")
	private WebElement add;

	@FindBy(id = "config-frame")
	private WebElement configframe;

	@FindBy(id = "grpName")
	private WebElement grpName;

	@FindBy(id = "elevatorFacilityopenDoorPopUp")
	private WebElement elevatorFacilityopenDoorPopUp;

	@FindBy(xpath = "//*[@class=\"popUp-header-label\" and text()=\"Elevator Facility\"]")
	private WebElement popupElevatorDacilatiy;

	@FindBy(id = "elevatorfacilitysearchQury")
	private WebElement searchFacilate;

	@FindBy(id = "elevatorfacilitybtnsearch")
	private WebElement elevatorfacilitybtnsearch;

	@FindBy(xpath = "//*[@id=\"elevatorfacilitypopuprow1\"]")
	private WebElement facilateRow;

	@FindBy(id = "AccessflooropenDoorPopUp")
	private WebElement accessflooropenDoorPopUp;

	@FindBy(xpath = "//*[@class=\"popUp-header-label\" and text()=\"Accessible Floors\"]")
	private WebElement accessiblefloorsTab;

	@FindBy(xpath = "//*[@id=\"AccessiblefloorpopUp-division\"]//*[@class=\"list-table\"]//tbody//th[3]/input")
	private WebElement allchecked;

	@FindBy(id = "paccessiblefloornextBtn")
	private WebElement next;

	@FindBy(id = "okBtn-AssignFloorsPopup")
	private WebElement okButton;

	@FindBy(id = "DefaultflooropenDoorPopUp")
	private WebElement defaultflooropenDoorPopUp;

	@FindBy(xpath = "//*[@class=\"popUp-header-label\" and text()=\"Default Floor\"]")
	private WebElement defaultFloorPopUp;

	@FindBy(id = "defaultfloorsearchQury")
	private WebElement defaultfloorsearchQury;

	@FindBy(id = "defaultfloorbtnsearch")
	private WebElement defaultfloorbtnsearch;

	@FindBy(xpath = "//*[@id=\"DefaultfloorpopUp-division\"]//*[@class=\"list-table\"]//*[@id=\"defaultfloorpopuprow1\"]")
	private WebElement firstDefaultFloor;

	@FindBy(id = "updateBtn")
	private WebElement updateButton;
	
	@FindBy(id="saveBtn")
	private WebElement btnsave;
	
	@FindBy(xpath="//*[@class=\"msg_div\"]//label")
	private WebElement validationMsg;

	public void addSmartEleFlrGrp(DataTable datatable) throws InterruptedException {
		driver.switchTo().frame(configframe);
		waitForElementVisible(add);
		for (Map<String, String> data : datatable.asMaps(String.class, String.class)) {
			int createdSmartElevatorNO = Integer.parseInt(data.get("CreatedSmartElevatorNO"));
			String ggroupName = data.get("GroupName");
			for (int i = 1; i <= createdSmartElevatorNO; i++) {
				element_Click(add);
				logger.info("Group added : " + i);
				waitForElementVisible(grpName);
				String fname = ggroupName + i;
				element_InputText(grpName, fname);
				if (i == 1 || i == 999) {
					for (int j = 1; j <= 32; j++) {
						Thread.sleep(250);
						element_Click(elevatorFacilityopenDoorPopUp);
						waitForElementVisible(popupElevatorDacilatiy);
						String eleName = "Elevator" + j;
						element_InputText(searchFacilate, eleName);
						Thread.sleep(250);
						element_Click(elevatorfacilitybtnsearch);
						Thread.sleep(350);
						element_Click(facilateRow);
						Thread.sleep(350);
						// new pop
						element_Click(accessflooropenDoorPopUp);
						waitForElementVisible(accessiblefloorsTab);
						if (j == 1 || j == 32) {
							for (int x = 1; x < 52; x++) {
								Thread.sleep(200);
								element_Click(allchecked);
								Thread.sleep(200);
								element_Click(next);
								Thread.sleep(200);
							}
						} else {
							Thread.sleep(200);
							element_Click(allchecked);
							Thread.sleep(200);
						}
						Thread.sleep(150);
						element_Click(okButton);
						Thread.sleep(500);
						// new pop
						element_Click(defaultflooropenDoorPopUp);
						waitForElementVisible(defaultFloorPopUp);
						Thread.sleep(250);
						element_InputText(defaultfloorsearchQury, "Floor1");
						Thread.sleep(150);
						element_Click(defaultfloorbtnsearch);
						Thread.sleep(250);
						element_Click(firstDefaultFloor);
						Thread.sleep(250);
						element_Click(updateButton);
						Thread.sleep(250);
					}
				} else {
					for (int j = 1; j <= 1; j++) {
						Thread.sleep(250);
						element_Click(elevatorFacilityopenDoorPopUp);
						waitForElementVisible(popupElevatorDacilatiy);
						String eleName = "Elevator" + j;
						element_InputText(searchFacilate, eleName);
						Thread.sleep(250);
						element_Click(elevatorfacilitybtnsearch);
						Thread.sleep(350);
						element_Click(facilateRow);
						Thread.sleep(350);
						// new pop
						element_Click(accessflooropenDoorPopUp);
						waitForElementVisible(accessiblefloorsTab);
//						for (int x = 1; x <= 1; x++) {
							Thread.sleep(200);
							element_Click(allchecked);
							Thread.sleep(200);
//							element_Click(next);
//							Thread.sleep(200);
//						}
						Thread.sleep(150);
						element_Click(okButton);
						Thread.sleep(500);
						// new pop
						element_Click(defaultflooropenDoorPopUp);
						waitForElementVisible(defaultFloorPopUp);
						Thread.sleep(250);
						element_InputText(defaultfloorsearchQury, "Floor1");
						Thread.sleep(150);
						element_Click(defaultfloorbtnsearch);
						Thread.sleep(250);
						element_Click(firstDefaultFloor);
						Thread.sleep(250);
						element_Click(updateButton);
						Thread.sleep(250);
					}
				}
				element_Click(btnsave);//Saved Successfully
				String val=element_GetText(validationMsg);
				Assert.assertEquals(val, "Saved Successfully");
				Thread.sleep(1000);

			}
			
		}
		driver.switchTo().defaultContent();
	}

}
