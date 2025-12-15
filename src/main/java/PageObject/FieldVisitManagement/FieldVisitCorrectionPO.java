package PageObject.FieldVisitManagement;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import com.aventstack.extentreports.model.Test;

import CommonAbstract.AbstractMethod;

public class FieldVisitCorrectionPO extends AbstractMethod {
	WebDriver driver;

	public FieldVisitCorrectionPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "autoFVMActiveUserID")
	private WebElement userIdTxt;

	@FindBy(id = "_txtPDate")
	private WebElement dateTxt;

	@FindBy(id = "punchcorrgridaddBtn")
	private WebElement plusButton;

	@FindBy(id = "_custEDate")
	private WebElement tableDateTxt;

	@FindBy(id = "custETime")
	private WebElement tableTimeTxt;

	@FindBy(id = "pickpunchLocationID")
	private WebElement tableLocationIdTxt;

	@FindBy(id = "comments")
	private WebElement tableCommentTxt;

	@FindBy(id = "savebtn")
	private WebElement tableSaveBtn;

	@FindBy(id = "txtSchStat")
	private WebElement scheduleStatusTxt;

	public void createFieldVisitCorrectionFromSA(String userID, String date, String time, String location,
			String comment, String validation) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userIdTxt);
		element_Clear(userIdTxt);
		element_dynamicDDSelect(userIdTxt, userID);
		waitForElementClickable(dateTxt);
		String date1 = dateSelectedinddMMyyyy(date);
		element_Clear(dateTxt);
		element_InputTextUsingActionClass(dateTxt, date1);
		Thread.sleep(1000);
		waitForElementClickable(plusButton);
		element_Click(plusButton);
		Thread.sleep(1000);
		element_Clear(tableDateTxt);
		element_InputTextUsingActionClass(tableDateTxt, date1);
		Thread.sleep(1000);

		if (tableTimeTxt.isEnabled()) {
			element_Clear(tableTimeTxt);
			element_inputTextUsingActionClassCharacterOneByOne(tableTimeTxt, time);
		}

		if (location != null) {
			if (tableLocationIdTxt.isEnabled()) {
				element_Clear(tableLocationIdTxt);
				element_dynamicDDSelect(tableLocationIdTxt, location);
				element_TextBoxToClickOnTab(tableLocationIdTxt);
			}
		}
		if (comment != null) {
			if (tableCommentTxt.isEnabled()) {
				element_Clear(tableCommentTxt);
				element_InputTextUsingActionClass(tableCommentTxt, location);
			}
		}
		Thread.sleep(1000);
		element_Click(tableSaveBtn);
		Thread.sleep(1000);
		saveButtonClick();
		String val = validationMessage();
		Assert.assertEquals(val, validation);
	}

	public void validateFieldVisitCorrectionFromSA(String userId, String date, String scheduleStatus)
			throws InterruptedException {
		waitForElementVisible(userIdTxt);
		element_Clear(userIdTxt);
		element_InputText(userIdTxt, userId);
		element_TextBoxToClickOnTab(userIdTxt);
		waitForElementClickable(dateTxt);
		String date1 = dateSelectedinddMMyyyy(date);
		element_Clear(dateTxt);
		element_InputTextUsingActionClass(dateTxt, date1);
		Thread.sleep(1000);
		String actualRes = scheduleStatusTxt.getAttribute("value");
		Assert.assertEquals(actualRes, scheduleStatus);
	}

}
