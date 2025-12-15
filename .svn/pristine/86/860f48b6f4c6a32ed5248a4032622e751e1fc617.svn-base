package PageObject.Panel200;

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

public class ElevatorFacilityPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(ElevatorFacilityPO.class);

	public ElevatorFacilityPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@id=\"Add\" or @id=\"btnadd\"]")
	private WebElement add;

	@FindBy(id = "config-frame")
	private WebElement configframe;

	@FindBy(id = "elevatorFacilityName")
	private WebElement elevatorFacilityName;

	@FindBy(id = "elevatorTerminalIPAddress")
	private WebElement elevatorTerminalIPAddress;

	@FindBy(id = "floorCollapsibleBtn")
	private WebElement floorCollapsibleBtn;

	@FindBy(xpath = "//*[@id=\"floorCollapsibleBtn\" and @class=\"collapsible active\"]")
	private List<WebElement> floorCollapsibleBtncount;

	@FindBy(id = "addFloor")
	private WebElement addFloor;

	@FindBy(id="floorNo0")
	private WebElement floorNo0;
	
	@FindBy(id="floorNameRow0")
	private WebElement floorNameRow0;
	
	@FindBy(id="saveFloorRow0")
	private WebElement saveFloorRow0;
	
	@FindBy(id="btnsave")
	private WebElement btnsave;
	
	@FindBy(xpath="//*[@class=\"msg_div\"]//label")
	private WebElement validationMsg;
	
	
	
	
	public void addElevatorFacility(DataTable dataTable) throws InterruptedException {
		driver.switchTo().frame(configframe);
		waitForElementVisible(add);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			int createdElevatorNO = Integer.parseInt(data.get("CreatedElevatorNO"));
			String elevatorName = data.get("ElevatorName");
			String eleTermIPAddress = data.get("EleTermIPAddress");
			for (int i = 1; i <= createdElevatorNO; i++) {
				element_Click(add);
				logger.info("Elevator Facilate added : "+i);
				waitForElementVisible(elevatorFacilityName);
				String fname = elevatorName+i;
				element_InputText(elevatorFacilityName, fname);
				element_InputText(elevatorTerminalIPAddress, eleTermIPAddress);
				if (floorCollapsibleBtncount.size() == 0) {
					element_Click(floorCollapsibleBtn);
				}
				waitForElementClickable(addFloor);
				if (i == 1 || i == 32) {
					for (int j = 1; j < 256; j++) {
						Thread.sleep(500);
						element_Click(addFloor);
						Thread.sleep(500);
						String flrno=String.valueOf(j);
						element_InputText(floorNo0, flrno);
						Thread.sleep(250);
						String flrname="Floor"+String.valueOf(j);
						element_InputText(floorNameRow0, flrname);
						Thread.sleep(250);
						element_Click(saveFloorRow0);
						Thread.sleep(500);						
					}
				} else {
					for (int j = 0; j < 2; j++) {
						Thread.sleep(500);
						element_Click(addFloor);
						Thread.sleep(500);
						String flrno=String.valueOf(j);
						element_InputText(floorNo0, flrno);
						Thread.sleep(250);
						String flrname="Floor"+String.valueOf(j);
						element_InputText(floorNameRow0, flrname);
						Thread.sleep(250);
						element_Click(saveFloorRow0);
						Thread.sleep(500);		
					}
				}
				Thread.sleep(500);
				element_Click(btnsave);//Saved Successfully
				String val=element_GetText(validationMsg);
				Assert.assertEquals(val, "Saved Successfully");
				Thread.sleep(1000);
			}

		}
		driver.switchTo().defaultContent();
	}

}

