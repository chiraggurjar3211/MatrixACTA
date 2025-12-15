package PageObject.VisitorManagement;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class AuthorizedHostUsersPO extends AbstractMethod{
	WebDriver driver;
	public AuthorizedHostUsersPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Mayank
	//************************************************************************
	// ***************ELEMENTS********************************************
	// ************************************************************************
	@FindBy(xpath = "//*[@gridname='userSelectionGrid']//table/tbody/tr")
	private List<WebElement> userList;
	
	@FindBy(xpath = "//*[@gridname='userSelectionGrid']//*[@name='cmnTxtSearch']")
	private WebElement searchbar;
	
	@FindBy(id = "grpddl")
	private WebElement selectUserDD;
	
	@FindBy(id = "ID")
	private WebElement userIDTxt;
	
	@FindBy(xpath = "//*[@id='grpddl' and @class='form-control mx-input-theme ng-untouched ng-pristine ng-valid']")
	private WebElement selectGroupDD;
	
	@FindBy(id = "grpname")
	private WebElement grpNameTxt;
	
	@FindBy(xpath = "//*[@key='Save']")
	private WebElement saveBtn;
	
	
	//************************************************************************
	// ***************FUNCTIONS********************************************
	// ************************************************************************
	public void verifyHostUsers(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		if (element_isEnabled(searchbar)) {
			element_Clear(searchbar);
			element_InputTextUsingActionClass(searchbar, data.get("userid"));
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchbar);
			Thread.sleep(1000);
			if (userList.size() == 1) {
				val = "User is authorized host user";
			}
			else {
				val = "User is not authorized host user";
			}
		}
		else {
			val = "User is not authorized host user";
		}
		Assert.assertEquals(val, "User is authorized host user");
	}
	
	// Add user in host user
	public void addUserAsAuthorizedHostUser(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (data.get("SelectUsers") != null) {
			element_DropDownSelectByvisibleText(selectUserDD, data.get("SelectUsers"));
			Thread.sleep(1000);
			if (data.get("SelectUsers").equalsIgnoreCase("User Wise")) {
				selectUsersOrGroupFromPicklist(data.get("UserIDs"), userIDTxt);
			}
			else if (data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
				element_DropDownSelectByvisibleText(selectGroupDD, data.get("SelectGroups"));
				selectUsersOrGroupFromPicklist(data.get("GroupIDs"), grpNameTxt);
			}
		}
		element_Click(saveBtn);
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
}
