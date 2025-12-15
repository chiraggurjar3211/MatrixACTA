package PageObject.UserModule;

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

public class DeleteUsersPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(DeleteUsersPO.class);
	
	public DeleteUsersPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "txtLoginID")
	private WebElement authorizeUsername;

	@FindBy(id = "txtPassword")
	private WebElement authorizePassword;

	@FindBy(xpath = "//*[@id='grpddl']")
	private WebElement selectUsersDD;

	@FindBy(id = "ID")
	private WebElement userIDTxt;

	@FindBy(xpath = "//*[@id='grpddl' and @class=\"form-control mx-input-theme ng-untouched ng-pristine ng-valid\"]")
	private WebElement deleteDD;

	@FindBy(xpath = "//*[@value='Apply']")
	private WebElement applyButton;

	@FindBy(xpath = "//*[@class='table-responsive']")
	private List<WebElement> table;

	@FindBy(id = "mdok")
	private WebElement okButton;

//////////////////////
	public void deleteUsers() throws InterruptedException {
		waitForElementVisible(authorizeUsername);
		element_Clear(authorizeUsername);
		element_InputTextUsingActionClass(authorizeUsername, "sa");
		element_Clear(authorizePassword);
		element_InputTextUsingActionClass(authorizePassword, "admin");
	}

	// By Chhaya
	public void deleteUsersFromDeleteUserPage(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(authorizeUsername);
//		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String userID = data.get("UserID");
			String selectUsers = data.get("SelectUsers");
			String delete = data.get("Delete");
			element_Click(selectUsersDD);
			element_DropDownSelectByvisibleText(selectUsersDD, selectUsers);
			Thread.sleep(1500);
			element_Clear(userIDTxt);
			element_InputTextUsingActionClass(userIDTxt, userID);
			element_TextBoxToClickOnTab(userIDTxt);
			Thread.sleep(1000);
			element_Click(deleteDD);
			element_DropDownSelectByvisibleText(deleteDD, delete);
			Thread.sleep(1500);
			if (table.size() > 0) {
				element_ClickUsingJS(applyButton);
				Thread.sleep(2500);
				element_Click(okButton);
				Thread.sleep(3000);
				String validation = validationMessage(); //Sometimes displays validation msg sometimes not
				Assert.assertEquals(validation, "Selected Users deleted successfully");
			}
		}
	}
}
