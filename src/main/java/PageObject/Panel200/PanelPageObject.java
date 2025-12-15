package PageObject.Panel200;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

public class PanelPageObject {
	WebDriver driver;
	public PanelPageObject(WebDriver driver) {
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	
	private Panel200HomePO panel200HomePO;
	private PanelDoorConfigurationPO panelDoorConfigurationPO;
	private	PanelElevatorConfigurationPO panelElevatorConfigurationPO;
	private PanelElevatorFloorGroupPO panelElevatorFloorGroupPO;
	private ElevatorFacilityPO elevatorFacilityPO;
	private SmartElevatorFloorGroupPO smartElevatorFloorGroupPO;
	
	
	public Panel200HomePO panel200HomePO() {
		panel200HomePO=new Panel200HomePO(driver);
		return panel200HomePO;
	}
	
	public PanelDoorConfigurationPO panelDoorConfigurationPO() {
		panelDoorConfigurationPO=new PanelDoorConfigurationPO(driver);
		return panelDoorConfigurationPO;
	}
	
	public PanelElevatorConfigurationPO panelElevatorConfigurationPO() {
		panelElevatorConfigurationPO=new PanelElevatorConfigurationPO(driver);
		return panelElevatorConfigurationPO;
	}
	
	public PanelElevatorFloorGroupPO panelElevatorFloorGroupPO() {
		panelElevatorFloorGroupPO=new PanelElevatorFloorGroupPO(driver);
		return panelElevatorFloorGroupPO;
	}
	
	public ElevatorFacilityPO elevatorFacilityPO() {
		elevatorFacilityPO=new ElevatorFacilityPO(driver);
		return elevatorFacilityPO;
	}
	
	public SmartElevatorFloorGroupPO smartElevatorFloorGroupPO() {
		smartElevatorFloorGroupPO=new SmartElevatorFloorGroupPO(driver);
		return smartElevatorFloorGroupPO;
	}

}
