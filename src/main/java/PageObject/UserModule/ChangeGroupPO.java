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

public class ChangeGroupPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ChangeGroupPO.class);
	
	public ChangeGroupPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements

	@FindBy(id = "AllUsersID")
	private WebElement userIdTxt;

	@FindBy(id = "AllUsersName")
	private WebElement userNameTxt;

	@FindBy(id = "cmbGrpType")
	private WebElement changeGroupDropdown;

	@FindBy(id = "_txtFromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "SUNewGroupName")
	private WebElement newGroupNameTxt;

	@FindBy(xpath = "//*[@default='Apply']")
	private WebElement applyBtn;
	
	@FindBy(xpath = "//*[@value='Clear']")
	private WebElement clearBtn;
	
	@FindBy(id = "_txtToDate")
	private WebElement toDateTxt;
	
	@FindBy(xpath = "//*[text()='Multi User']/ancestor::a")
	private WebElement multiUserTab;

	@FindBy(id = "cmbGrpType1")
	private WebElement groupTypeDD;
	
	@FindBy(id = "_txtFrmDt1")
	private WebElement multiUserFromDateTxt;
	
	@FindBy(id = "_txtToDt1")
	private WebElement multiUserToDateTxt;
	
	@FindBy(id = "MUNewGroupName")
	private WebElement newGroupNameTxtMultiUser;
	
	@FindBy(xpath = "(//*[@class=\"user-selection\"]//*[@id=\"grpddl\"])[1]")
	private WebElement selectUsersDD;
	
	@FindBy(id = "ID")
	private WebElement userIdTxtMultiUser;

	@FindBy(xpath = "(//*[@class=\"user-selection\"]//*[@id=\"grpddl\"])[2]")
	private WebElement selectGroupDD;
	
	@FindBy(id = "grpname")
	private WebElement groupNmTxtMultiUser;
	
	@FindBy(xpath = "//*[@value=\"Apply\"]")
	private WebElement multiUserApplyBtn;
	
	////////////
	public void changeGroup(String userType, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(userIdTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Change Group: "+data.get("ChangeGroup"));
			String validation = data.get("Validation");
			//element_Click(clearBtn);
			if(userType.equalsIgnoreCase("Single User")) {
				element_Clear(userIdTxt);
				element_dynamicDDSelect(userIdTxt, data.get("UserId"));
				element_TextBoxToClickOnTab(userIdTxt);
				if (!element_getInputControlValue(userNameTxt).isBlank()
						|| !element_getInputControlValue(userNameTxt).isEmpty()) {
					element_DropDownSelectByvisibleText(changeGroupDropdown, data.get("ChangeGroup"));
					Thread.sleep(1000);
					if(data.get("FromDate") != null) {
						String fDate = staticDateOrPlusMinusFromCurrentDate(data.get("FromDate"));
						element_Clear(fromDateTxt);
						element_InputTextUsingActionClass(fromDateTxt, fDate);
						element_TextBoxToClickOnTab(fromDateTxt);
					}
					if(data.get("ToDate") != null) {
						String tDate = staticDateOrPlusMinusFromCurrentDate(data.get("ToDate"));
						element_Clear(toDateTxt);
						element_InputTextUsingActionClass(toDateTxt, tDate);
						element_TextBoxToClickOnTab(toDateTxt);
					}
					element_Clear(newGroupNameTxt);
					element_dynamicDDSelect(newGroupNameTxt, data.get("NewGroup"));
					element_TextBoxToClickOnTab(newGroupNameTxt);
					element_Click(applyBtn);
					String valMsg = validationMessage();
					Assert.assertEquals(valMsg, validation);
				}
			}
			if(userType.equalsIgnoreCase("Multi User")) {
					element_Click(multiUserTab);
					element_DropDownSelectByvisibleText(groupTypeDD, data.get("GroupType"));
					if(data.get("FromDate") != null) {
						String fDate = staticDateOrPlusMinusFromCurrentDate(data.get("FromDate"));
						element_Clear(multiUserFromDateTxt);
						element_InputTextUsingActionClass(multiUserFromDateTxt, fDate);
						element_TextBoxToClickOnTab(multiUserFromDateTxt);
					}
					if(data.get("ToDate") != null) {
						String tDate = staticDateOrPlusMinusFromCurrentDate(data.get("ToDate"));
						element_Clear(multiUserToDateTxt);
						element_InputTextUsingActionClass(multiUserToDateTxt, tDate);
						element_TextBoxToClickOnTab(multiUserToDateTxt);
					}
					element_Clear(newGroupNameTxtMultiUser);
					element_dynamicDDSelect(newGroupNameTxtMultiUser, data.get("NewGroup"));
					element_TextBoxToClickOnTab(newGroupNameTxtMultiUser);
					element_DropDownSelectByvisibleText(selectUsersDD, data.get("SelectUsers"));
					if(data.get("SelectUsers").equalsIgnoreCase("User Wise")) {
						selectUsersOrGroupFromPicklist(data.get("UserId"), userIdTxtMultiUser);
					}
					if(data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
						element_DropDownSelectByvisibleText(selectGroupDD, data.get("SelectGroup"));
						selectUsersOrGroupFromPicklist(data.get("GroupName"), groupNmTxtMultiUser);
					}
					element_Click(multiUserApplyBtn);
					String valMsg = validationMessage();
					Assert.assertEquals(valMsg, validation);
			}
			reloadPageButtonClick();
		}
	}
}
