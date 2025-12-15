package PageObject.UserModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class OnBoardingPortalPO extends AbstractMethod {
	WebDriver driver;

	public OnBoardingPortalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "txtName")
	private WebElement nameTxt;

	@FindBy(id = "TxtUShtName")
	private WebElement shortNameTxt;

	@FindBy(id = "_TxtBirthDT")
	private WebElement dOBTxt;

	@FindBy(id = "_TxtJoinDT")
	private WebElement joinDateTxt;

	@FindBy(id = "txtVehicleRegNo")
	private WebElement vehicleRegNoTxt;

	@FindBy(id = "TxtUserDefinedField1")
	private WebElement field1Txt;
	
	@FindBy(id = "TxtUserDefinedField2")
	private WebElement field2Txt;
	
	@FindBy(id = "TxtUserDefinedField3")
	private WebElement field3Txt;
	
	@FindBy(id = "TxtUserDefinedField4")
	private WebElement field4Txt;
	
	@FindBy(id = "TxtUserDefinedField5")
	private WebElement field5Txt;

	@FindBy(id = "TxtSName")
	private WebElement fatherSpouseNmTxt;

	@FindBy(xpath = "//*[@value='Submit']")
	private WebElement submitBtn;

	@FindBy(xpath = "//*[@value='Save']")
	private WebElement saveBtn;

	@FindBy(id = "btnOk")
	private WebElement popupOKBtn;
	
	@FindBy(id = "msg")
	private WebElement validationMsg;
	
	public void enterDetailsInOnBoardingPortal(String name, String dateOfBirth, String joiningDate,
			String vehicleRegiNo, String field1, String field2, String field3, String field4, String field5, String fatherSpouseName) throws InterruptedException {

		pageLoadWaitng();
		waitForElementVisible(nameTxt);
		element_Clear(nameTxt);
		element_InputTextUsingActionClass(nameTxt, name);
		element_TextBoxToClickOnTab(nameTxt);
		if(dateOfBirth != null) {
			element_Clear(dOBTxt);
			element_InputTextUsingActionClass(dOBTxt, dateOfBirth);
			element_TextBoxToClickOnTab(dOBTxt);
			Thread.sleep(1000);
		}
		if(joiningDate !=null) {
			element_Clear(joinDateTxt);
			element_InputTextUsingActionClass(joinDateTxt, joiningDate);
			element_TextBoxToClickOnTab(joinDateTxt);
			Thread.sleep(1000);
		}
		if(vehicleRegiNo != null) {
			element_Clear(vehicleRegNoTxt);
			element_InputTextUsingActionClass(vehicleRegNoTxt, vehicleRegiNo);
		}
		if(field1 != null) {
			element_Clear(field1Txt);
			element_InputTextUsingActionClass(field1Txt, field1);
		}
		if(fatherSpouseName != null) {
			element_Clear(fatherSpouseNmTxt);
			element_InputTextUsingActionClass(fatherSpouseNmTxt, fatherSpouseName);
			Thread.sleep(1000);
		}
		element_Click(submitBtn);
		Thread.sleep(1000);
		element_Click(popupOKBtn);
		Thread.sleep(1000);
		String expValMsg = "User Details already submitted. Welcome aboard.";
		String actValMsg = validationMsg.getText();
		Thread.sleep(1000);
		Assert.assertEquals(actValMsg, expValMsg);
	}

}
