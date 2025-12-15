package PageObject.DeviceModule;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class ManageVoiceGuidanceAudioPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AccessSchedulesPO.class);
	
	public ManageVoiceGuidanceAudioPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//locators
	@FindBy(id = "9026")
	private WebElement ManageVoiceGuidanceAudioPage;
	
	@FindBy(id = "FileUploader")
	private WebElement chooseFileBtn;
	
	@FindBy(id = "uploadFile")
	private WebElement uploadFileBtn;
	
	@FindBy(xpath="//*[@id=\"grid1\"]//tbody//tr[not(@hidden)]")
	private List<WebElement> datadisplayedInTableChk;
	
	@FindBy(xpath = "//*[contains(text(), 'No Audio Files Found')]")
	private WebElement nodataFoundText;
	
	//code
	public void uploadFile() throws InterruptedException {
		pageLoadWaitng();
		String filePath =null;
		
		filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\123.mp3";
		
		element_InputText(chooseFileBtn, filePath);
		Thread.sleep(1500);
		element_Click(uploadFileBtn);
		Thread.sleep(1500);
		String valMsg1 = validationMessage();
		Assert.assertEquals(valMsg1, "File saved successfully");
		Thread.sleep(1500);
		//check file uploaded successfully
		if(datadisplayedInTableChk.size()>0) {
			logger.info("Audio File Uploaded Successfully...");
		}
		else {
			logger.error("File upload succeeded, but file is not displayed in the table.");
	        Assert.fail("Uploaded file not visible in table!");
		}
		Thread.sleep(1000);
	}
}
