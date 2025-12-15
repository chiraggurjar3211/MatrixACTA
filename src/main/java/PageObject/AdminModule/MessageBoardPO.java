package PageObject.AdminModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class MessageBoardPO extends AbstractMethod {
	WebDriver driver;

	public MessageBoardPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]/li[2]/a")
	private WebElement newsTab;

	@FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]/li[3]/a")
	private WebElement noticeTab;

	@FindBy(xpath = "//*[@id=\"txtGenSub\" or @id=\"txtNewsSub\" or @id=\"txtNoticeSub\"]")
	private WebElement subjectTxtbox;

	@FindBy(xpath = "//*[contains(@class,\"ql-editor\")]")
	private WebElement messageTxtbox;

	

	public String createMessageBoard(String message, String subject, String tabName) throws InterruptedException {
		String valMsg = null;
		Thread.sleep(1000);

		if (tabName.contains("News")) {
			element_Click(newsTab);
			Thread.sleep(1000);
		} else if (tabName.contains("Notice")) {
			element_Click(noticeTab);
			Thread.sleep(1000);
		}
		element_Clear(subjectTxtbox);
		element_InputTextUsingActionClass(subjectTxtbox, subject);
		element_Clear(messageTxtbox);
		element_InputTextUsingActionClass(messageTxtbox, message);
		Thread.sleep(1000);
		saveButtonClick();
		valMsg = validationMessage();
		return valMsg;
	}

	
}
