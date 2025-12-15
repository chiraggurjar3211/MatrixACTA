package PageObject.DeviceModule;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class DevicePO extends AbstractMethod {

	WebDriver driver;

	public DevicePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

//Elements
	@FindBy(id = "9002")
	private WebElement deviceConfigPage;
	
	@FindBy(id = "9001")
	private WebElement deviceList;
	
	@FindBy(id = "Multi-Device Options")
	private WebElement multideviceoptions;
	
	@FindBy(id = "9016")
	private WebElement milestoneIntegration;
	
	@FindBy(id = "Masters")
	private WebElement masters;
	
	@FindBy(id = "9021")
	private WebElement cardpersonalization;
	
	@FindBy(id = "9010")
	private WebElement devicestatus;
	
	@FindBy(id = "Reports")
	private WebElement reports;
	
	@FindBy(id = "9012")
	private WebElement panelReport;
	
	@FindBy(id = "9013" )
	private WebElement doorReport;
	
	@FindBy(id = "9014")
	private WebElement invalidEventsReport;
	
	@FindBy(id ="9015")
	private WebElement devicewiseEventReport;
	
	@FindBy(id = "9017")
	private WebElement doorofflineReport;
	
	@FindBy(id = "9019")
	private WebElement intercomEventReprot;
	
	@FindBy(id = "9001")
	private WebElement deviceListPage;
	
	@FindBy(id = "Masters")
	private WebElement mastersTab;
	
	@FindBy(xpath = "//*[@class='active' and @id='Masters']")
	private List<WebElement> mastersTabSize;

	@FindBy(id = "9009")
	private WebElement deviceGroup;
	
	@FindBy(id = "Device Access Schedule")
	private WebElement deviceAccessScheduleTab;
	
	@FindBy(id = "9024")
	private WebElement timeFramesPage;
	
	@FindBy(id = "9025")
	private WebElement accessSchedulesPage;
	
	@FindBy(id = "9026")
	private WebElement manageVoiceGuidanceAudioPage;

	
/////////////////

	
	
	public void goToDeviceConfiguration() {
		element_Click(deviceConfigPage);
	}
	
	//Kamal
		public void gotoPanelReport() throws Exception {
			element_Click(reports);
			Thread.sleep(1000);
			element_Click(panelReport);
		}
		
		//Kamal 
		public void gotoDoorReport() throws Exception {
			element_Click(reports);
			Thread.sleep(1000);
			element_Click(doorReport);
		}
	    
		//Kamal 
		public void gotoInvalidEventsReport() throws Exception {
			element_Click(reports);
			Thread.sleep(1000);
			element_Click(invalidEventsReport);
		}
		
		//Kamal
		public void gotoDeviceWiseEventReport() throws Exception {
			element_Click(reports);
			Thread.sleep(1000);
			element_Click(devicewiseEventReport);
		}
		
		//Kamal
		public void gotoDoorOfflineReport() throws Exception {
			element_Click(reports);
			Thread.sleep(1000);
			element_Click(doorofflineReport);
		}
		
		//Kamal
		public void gotoIntercomEventsReport() throws Exception {
			element_Click(reports);
			Thread.sleep(1000);
			element_Click(intercomEventReprot);
		}
		
		public void goToDeviceList() throws InterruptedException {
			element_Click(deviceListPage);
		}
		
		public void goToDeviceGroupPage() throws InterruptedException {
			if (mastersTabSize.size() == 0) {
				element_Click(mastersTab);
			}
			Thread.sleep(1000);
			element_Click(deviceGroup);
		}
		
		public void gotoTimeFramesPage() throws Exception {
			element_Click(deviceAccessScheduleTab);
			Thread.sleep(1000);
			element_Click(timeFramesPage);
		}
		
		public void gotoAccessSchedulesPage() throws Exception {
			element_Click(deviceAccessScheduleTab);
			Thread.sleep(1000);
			element_Click(accessSchedulesPage);
		}
		
		public void gotoManageVoiceGuidanceAudioPage() throws Exception {
			element_Click(manageVoiceGuidanceAudioPage);
			Thread.sleep(1000);
		}
		
		
}
