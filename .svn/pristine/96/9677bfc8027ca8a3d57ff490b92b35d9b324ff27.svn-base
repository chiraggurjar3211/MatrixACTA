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

public class PanelDoorConfigurationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(PanelDoorConfigurationPO.class);
	
	public PanelDoorConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "Add")
	private WebElement add;

	@FindBy(id = "basicConfig")
	private WebElement basicConfig;

	@FindBy(id = "doorType")
	private WebElement doorType;

	@FindBy(id = "active")
	private WebElement active;

	@FindBy(id = "dCName")
	private WebElement dCName;
	
	@FindBy(id = "ipAddress")
	private WebElement ipAddress;
	
	@FindBy(id = "macAddress")
	private WebElement macAddress;
	
	@FindBy(id = "saveBtn")
	private WebElement saveBtn;
	
	@FindBy(xpath = "//*[@class=\"msg_div\"]")
	private WebElement validation;
	
	@FindBy(id="config-frame")
	private WebElement configframe;
	
	@FindBy(id="listBtn")
	private WebElement listBtn;
	
	
	
	public void doorConfigure(DataTable data) throws InterruptedException {
		driver.switchTo().frame(configframe);
		for (Map<String, String> dataT : data.asMaps(String.class, String.class)) {
			logger.info("DoorType: "+dataT.get("DoorType")+" DoorName: "+dataT.get("DoorName"));
			String doorT = dataT.get("DoorType");
			String doorN = dataT.get("DoorName");
			String activ = dataT.get("Active");
			String ip = dataT.get("ipAddress");
			String mac = dataT.get("macAddress");
			String val = dataT.get("validation");
			
			waitForElementVisible(add);
			element_Click(add);
			waitForElementVisible(doorType);
			element_DropDownSelectByvisibleText(doorType, doorT);
			if (activ != null) {
				boolean activeC = Boolean.parseBoolean(activ);
				if (activeC == true) {
					if (element_isSelected(active) != true) {
						element_Click(active);
					}
				} else {
					if (element_isSelected(active) == true) {
						element_Click(active);
					}
				}
			}
			element_Clear(dCName);
			element_InputTextUsingActionClass(dCName, doorN);
			element_Clear(ipAddress);
			element_InputTextUsingActionClass(ipAddress, ip);
			element_Clear(macAddress);
			element_InputTextUsingActionClass(macAddress, mac);
			element_Click(saveBtn);
			Assert.assertEquals(element_GetText(validation), val);
			Thread.sleep(1500);
			element_Click(listBtn);
		}
		driver.switchTo().defaultContent();
	}

}
