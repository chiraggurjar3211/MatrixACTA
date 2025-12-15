package PageObject.ESSLogin;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class EssBottomMessagePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssBottomMessagePO.class);
	
	public EssBottomMessagePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	
	@FindBy(id = "lblNotice")
	private WebElement noticeLabel;

	@FindBy(id = "btnNotice")
	private WebElement noticeButton;

	@FindBy(id = "btnNews")
	private WebElement newsButton;

	@FindBy(id = "btnGeneral")
	private WebElement generalButton;

	@FindBy(xpath = "//*[@class=\"modal-body modal-body-lg\"]//*[@class=\"col-md-12 col-sm-12\"]/label")
	private WebElement actualMessage; 

	// By Chhaya
	public void verifyMessageInESS(String message, String tabName) throws InterruptedException {
		logger.info("TabName: "+tabName);
		String actualMsg = null;
		Thread.sleep(1000);
		element_Click(noticeLabel);
		Thread.sleep(3000);
		if (tabName.contains("General")) {
			element_ClickUsingJS(generalButton);
			Thread.sleep(750);
			actualMsg = actualMessage.getText();
			Assert.assertEquals(actualMsg, message);
		} else if (tabName.contains("News")) {
			element_Click(newsButton);
			Thread.sleep(750);
			actualMsg = actualMessage.getText();
			Assert.assertEquals(actualMsg, message);
		} else if (tabName.contains("Notice")) {
			element_Click(noticeButton);
			Thread.sleep(750);
			actualMsg = actualMessage.getText();
			Assert.assertEquals(actualMsg, message);
		}
		Thread.sleep(2000);
	}
}
