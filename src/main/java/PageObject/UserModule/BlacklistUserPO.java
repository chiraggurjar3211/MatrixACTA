package PageObject.UserModule;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class BlacklistUserPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(BlacklistUserPO.class);
	
	public BlacklistUserPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// elements
	@FindBy(xpath = "//*[@id=\"div_grd_gvBlockedUsers\"]//table/tbody/tr[not(@hidden)]//td[1]")
	private List<WebElement> blacklistUsersTable;

	@FindBy(xpath = "//*[@gridname=\"gvDetailGridss\"]//table/tbody/tr/td[not(@hidden)]")
	private List<WebElement> restoredUsersTable;

	@FindBy(xpath = "//*[contains(text(),'Restored Users')]")
	private WebElement restoredUserCollapsClick;

	@FindBy(id = "ID")
	private WebElement usrIdTxt;

	@FindBy(xpath = "//*[@key='btnBlackList']")
	private WebElement addToBlacklistBtn;

	@FindBy(xpath = "//*[@value='Yes']")
	private WebElement popupYesBtn;
	
	@FindBy(xpath="//*[text()=\"Warning\"]")
	private WebElement warningTab;

	public void verifyBlacklistedUser(String userId) throws InterruptedException {
		waitForElementVisible(usrIdTxt);
		String actUserId = null;
		for (int i = 0; i < blacklistUsersTable.size(); i++) {
			String userId1 = blacklistUsersTable.get(i).getText();

			if (userId.toUpperCase().equalsIgnoreCase(userId1.toUpperCase())) {
				actUserId = blacklistUsersTable.get(i).getText();
				break;
			}
		}
		Assert.assertEquals(userId.toUpperCase(), actUserId.toUpperCase());
	}

	public void restoreBlacklistedUser(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(usrIdTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String userID = data.get("UserID");
			for (int i = 0; i < blacklistUsersTable.size(); i++) {
				String userId1 = blacklistUsersTable.get(i).getText();
				if (userID.toUpperCase().equalsIgnoreCase(userId1.toUpperCase())) {
					Thread.sleep(1000);
					WebElement restorUser = blacklistUsersTable.get(i)
							.findElement(By.xpath("following-sibling::td[4]/i"));
					Thread.sleep(1000);
					element_Click(restorUser);
					break;
				}
			}
		}
		Thread.sleep(1000);
	}

	// Chhaya
	public void verifyRestoredUser(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(usrIdTxt);
		waitForElementClickable(restoredUserCollapsClick);
		element_Click(restoredUserCollapsClick);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String userId = data.get("UserID");
			String actUserId = null;
			Thread.sleep(250);
			for (int i = 0; i < restoredUsersTable.size(); i++) {
				String userId1 = restoredUsersTable.get(i).getText();
				if (userId.toUpperCase().equalsIgnoreCase(userId1.toUpperCase())) {
					actUserId = restoredUsersTable.get(i).getText();
					break;
				}
			}
			Assert.assertEquals(userId.toUpperCase(), actUserId.toUpperCase());
		}
	}

	public void blackUsrFromBlacklistUser(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(usrIdTxt);
		waitForElementVisible(usrIdTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserId: "+data.get("userid"));
			String userid = data.get("userid");
			element_Clear(usrIdTxt);
			element_InputTextUsingActionClass(usrIdTxt, userid);
			element_TextBoxToClickOnTab(usrIdTxt);
		}
		Thread.sleep(500);
		element_Click(addToBlacklistBtn);
		waitForElementVisible(warningTab);
		element_Click(popupYesBtn);
	}

}
