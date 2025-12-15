package PageObject.UserModule;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class UsersOnDevicePO extends AbstractMethod {
	WebDriver driver;

	public UsersOnDevicePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	//Element 
	@FindBy(xpath = "(//*[@class=\"nav navbar-nav panel-group accordion\"]/li/a)[1]")
	private WebElement assignUsersTab;
	
	@FindBy(xpath = "(//*[@class=\"nav navbar-nav panel-group accordion\"]/li/a)[2]")
	private WebElement revokeUsersTab;
	
	@FindBy(id = "autoDeviceGroupName")
	private WebElement deviceNameTxtAssignTab;
	
	@FindBy(id = "grpddl")
	private WebElement selectUsersDD;
	
	@FindBy(id = "ID")
	private WebElement userIdTxt;
	
	@FindBy(xpath = "(//*[@id = \"grpddl\"])[2]")
	private WebElement selectGroupDD;
	
	@FindBy(id = "grpname")
	private WebElement groupNameTxt;
	
	@FindBy(id = "autoDeviceGroupRevokeName")
	private WebElement deviceNameTxtRevokeTab;
	
	@FindBy(xpath = "//*[@default='Select']")
	private WebElement selectButtonRevokeTab;
	
	@FindBy(xpath = "//*[@default='Add']")
	private WebElement addButtonAssignTab;
	
	@FindBy(xpath = "//*[@id='div_grd_gvAssignedUser']//table/tbody/tr[not(@hidden)]/td[1]")
	private List<WebElement> assignUsersTable;
	
	@FindBy(xpath = "//*[@id='div_grd_gvAssignedUser']//*[@default='Search']")
	private WebElement assignUsersSearch;
	
	@FindBy(xpath = "//*[@key='Device Options']/label")
	private WebElement deviceOptionLabel;
	
	@FindBy(name = "txtddlMnth")
	private WebElement accessGroupDD;
	
	@FindBy(id = "btnOk")
	private WebElement saveBtnDeviceOptionPage;
	
	///////////////
	
	public void assignRevokeUsers(String assignRevoke, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(deviceNameTxtAssignTab);
		//Thread.sleep(1000);
		if(assignRevoke.equalsIgnoreCase("Assign Users")) {
			element_Click(assignUsersTab);
			Thread.sleep(1000);
			element_Clear(deviceNameTxtAssignTab);
			element_InputTextUsingActionClass(deviceNameTxtAssignTab, data.get("DeviceName"));
			Thread.sleep(400);
			element_TextBoxToClickOnTab(deviceNameTxtAssignTab);
			Thread.sleep(1500);
			element_DropDownSelectByvisibleText(selectUsersDD, data.get("SelectUsers"));
				Thread.sleep(500);
				if(data.get("SelectUsers").equalsIgnoreCase("User Wise") && data.get("UserID") != null) {
					selectUsersOrGroupFromPicklist(data.get("UserID"), userIdTxt);
				}
				if(data.get("SelectUsers").equalsIgnoreCase("Group Wise") && data.get("GroupName") != null) {
					if(data.get("SelectGroup") != null) {
						element_DropDownSelectByvisibleText(selectGroupDD, data.get("SelectGroup"));
						Thread.sleep(500);
					}
					selectUsersOrGroupFromPicklist(data.get("GroupName"), groupNameTxt);
				}
			Thread.sleep(700);
			element_Click(addButtonAssignTab);
			Thread.sleep(1000);
			if(data.get("AccessGroup") != null) {
				if(element_isEnabled(assignUsersSearch)) {
					element_Clear(assignUsersSearch);
					element_InputTextUsingActionClass(assignUsersSearch, data.get("UserID"));
					element_TextBoxToClickOnEnter(assignUsersSearch);
					for(int i=0; i<assignUsersTable.size(); i++) {
						String actUserId = assignUsersTable.get(i).getText();
						if(data.get("UserID").equalsIgnoreCase(actUserId)) {
							WebElement deviceOptionIcon = assignUsersTable.get(i).findElement(By.xpath("following-sibling::td[2]/img"));
							element_Click(deviceOptionIcon);
							Thread.sleep(2000);
							waitForElementVisible(deviceOptionLabel);
							if(data.get("AccessGroup") != null) {
								element_DropDownSelectByvisibleText(accessGroupDD, data.get("AccessGroup"));
							}
						}
					}
					element_Click(saveBtnDeviceOptionPage);
					Thread.sleep(1000);
				}
			}
		}
		if(assignRevoke.equalsIgnoreCase("Revoke Users")) {
			element_Click(revokeUsersTab);
			Thread.sleep(1000);
			element_Clear(deviceNameTxtRevokeTab);
			element_InputTextUsingActionClass(deviceNameTxtRevokeTab, data.get("DeviceName"));
			Thread.sleep(400);
			element_TextBoxToClickOnTab(deviceNameTxtRevokeTab);
			Thread.sleep(1000);
			element_DropDownSelectByvisibleText(selectUsersDD, data.get("SelectUsers"));
				Thread.sleep(500);
				if(data.get("SelectUsers").equalsIgnoreCase("User Wise") && data.get("UserID") != null) {
					selectUsersOrGroupFromPicklist(data.get("UserID"), userIdTxt);
				}
				if(data.get("SelectUsers").equalsIgnoreCase("Group Wise") && data.get("GroupName") != null) {
					if(data.get("SelectGroup") != null) {
						element_DropDownSelectByvisibleText(selectGroupDD, data.get("SelectGroup"));
						Thread.sleep(500);
					}
					selectUsersOrGroupFromPicklist(data.get("GroupName"), groupNameTxt);
				}
			Thread.sleep(700);
			element_Click(selectButtonRevokeTab);
			Thread.sleep(1000);
		}
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(700);
		String valMsg = validationMessage();
		Assert.assertEquals(valMsg, "Saved Successfully");
		reloadPageButtonClick();
	}

}
