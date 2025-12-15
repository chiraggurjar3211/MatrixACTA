package PageObject.AdminPortal;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import PageObject.ShiftAndSchedule.WeekOffGroupPO;
import groovy.transform.Final;
import groovyjarjarantlr4.v4.parse.ANTLRParser.throwsSpec_return;

public class ApSystemAccountsPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ApSystemAccountsPO.class);

	public ApSystemAccountsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements ////////////////////////////
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[2]")
	private List<WebElement> allUserIds;
	
	@FindBy(xpath = "//*[@class='modal-footer']//*[@id='mdpBtnOk']")
	private WebElement deletePopupOkBtn;
	
	@FindBy(id = "SysAccID")
	private WebElement useridTxt;
	
	@FindBy(id = "SysAccName")
	private WebElement nameTxt;
	
	@FindBy(id = "txtEmailID")
	private WebElement emailTxt;
	
	@FindBy(id = "txtContact")
	private WebElement mobileTxt;
	
	
	// Function
	// Mayank
	public void deleteApSystemAccount(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputText(searchTextBoxTitleBar, data.get("UserID"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allUserID = new ArrayList<>();
			if (allUserIds.size() > 0) {
				for (int j = 0; j < allUserIds.size(); j++) {
					String userid = allUserIds.get(j).getText();
					allUserID.add(userid);
					if (userid.equalsIgnoreCase(data.get("UserID"))) {
						allUserIds.get(j).click();
						Thread.sleep(1000);
						deleteButtonClick();
						pageLoadWaitng();
						element_Click(deletePopupOkBtn);
						Thread.sleep(2000);
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
						logger.info("System Account Deleted Succcessfully");
					}
				}
			}
			if (!allUserID.contains(data.get("UserID"))) {
				logger.info("System Account not found!");
			}
		}
	}
	
	// Mayank
	public void createApSystemAccount(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputText(searchTextBoxTitleBar, data.get("UserID"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allUserID = new ArrayList<>();
			if (allUserIds.size() > 0) {
				for (int j = 0; j < allUserIds.size(); j++) {
					String userid = allUserIds.get(j).getText();
					allUserID.add(userid);
					if (userid.equalsIgnoreCase(data.get("UserID"))) {
						allUserIds.get(j).click();
					}
				}
			}
			if (!allUserID.contains(data.get("UserID"))) {
				addButtonClick();
			}
		}
		Thread.sleep(1000);
		if (data.get("UserID") != null) {
			element_Clear(useridTxt);
			element_InputText(useridTxt, data.get("UserID"));
		}
		if (data.get("Name") != null) {
			element_Clear(nameTxt);
			element_InputText(nameTxt, data.get("Name"));
		}
		if (data.get("EmailID") != null) {
			element_Clear(emailTxt);
			element_InputText(emailTxt, data.get("EmailID"));
		}
		if (data.get("Contact") != null) {
			element_Clear(mobileTxt);
			element_InputText(mobileTxt, data.get("Contact"));
		}
		Thread.sleep(1000);
		saveButtonClick();
		Assert.assertEquals(validationMessage(), data.get("Validation"));
	}

}
