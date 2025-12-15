package PageObject.AdminModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class WhatsappConfigurationPO extends AbstractMethod {
	WebDriver driver;

	public WhatsappConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//************************************************
	//Elements
	//**********************************************
	@FindBy(id = "txtPostURL")
	private WebElement messagePostURLTxt;
	
	@FindBy(id = "txtAccessToken")
	private WebElement accessTokenTxt;
	
	@FindBy(id = "txtAlertCycle")
	private WebElement alertCycleTxt;
	
	@FindBy(id = "txtRetryCount")
	private WebElement retryCountTxt;
	
	@FindBy(id = "txtActiveDays")
	private WebElement activeDaysTxt;
	
	@FindBy(xpath = "//*[@name='cosecForm']//*[@id='btnSave']")
	private WebElement saveBtn;
	
	
	
	//************************************************
	//Elements
	//**********************************************
	public void setWhatsappConfiguration() throws InterruptedException {
		pageLoadWaitng();
		element_Clear(messagePostURLTxt);
		element_InputTextUsingActionClass(messagePostURLTxt, "https://graph.facebook.com/v17.0/11/messages");
		element_Clear(accessTokenTxt);
		element_InputTextUsingActionClass(accessTokenTxt, "11111111111111111111");
		element_Clear(alertCycleTxt);
		element_InputTextUsingActionClass(alertCycleTxt, "10");
		element_Clear(retryCountTxt);
		element_InputTextUsingActionClass(retryCountTxt, "3");
		element_Clear(activeDaysTxt);
		element_InputTextUsingActionClass(activeDaysTxt, "1");
		element_Click(saveBtn);
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
	}

}
