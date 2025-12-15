package PageObject.UserModule;

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

public class ChangeUserIdPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ChangeUserIdPO.class);
	
	public ChangeUserIdPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	//Elements
	@FindBy(xpath = "//*[@value=\"Process\"]")
	private WebElement processBtn;
	
	@FindBy(id = "txtLoginID")
	private WebElement authorizeUsernameTxt;
	
	@FindBy(id = "txtPassword")
	private WebElement authorizePasswordTxt;
	
	@FindBy(id = "UserID")
	private WebElement userIdTxt;
	
	@FindBy(id = "UserName")
	private WebElement userNameTxt;
	
	@FindBy(id = "txtNewUserID")
	private WebElement newUserIdTxt;
	
	@FindBy(id = "mdok")
	private WebElement warningMsgOkBtn;
	
	@FindBy(xpath="//*[contains(text(),\"Warning\")]")
	private WebElement warningpopUp;
	
	////////////////
	public void changeUserId(DataTable dataTable) throws InterruptedException
	{
		waitForElementVisible(authorizeUsernameTxt);
		element_Clear(authorizeUsernameTxt);
		element_InputText(authorizeUsernameTxt, "sa");
		element_Clear(authorizePasswordTxt);
		element_InputText(authorizePasswordTxt, "admin");
		
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserId: "+data.get("UserId"));
			String userId = data.get("UserId");
			String newUserID = data.get("NewUserID");
			String validation = data.get("Validation");
			element_Clear(userIdTxt);
			element_dynamicDDSelect(userIdTxt, userId);
			element_TextBoxToClickOnTab(userIdTxt);
			if (!element_getInputControlValue(userNameTxt).isBlank()
					|| !element_getInputControlValue(userNameTxt).isEmpty()) {
				element_Clear(newUserIdTxt);
				element_InputTextUsingActionClass(newUserIdTxt, newUserID);
				element_Click(processBtn);
				waitForElementVisible(warningpopUp);
				element_Click(warningMsgOkBtn);
				String valMsg = validationMessage();
				Assert.assertEquals(valMsg, validation);
			}
		}
	}
}
