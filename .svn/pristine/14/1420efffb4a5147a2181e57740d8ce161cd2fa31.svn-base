package PageObject.UserModule;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.WindowType;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class InviteUserPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(InviteUserPO.class);
	
	public InviteUserPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "_FromDate")
	private WebElement dateTxt;

	@FindBy(xpath = "//*[@gridname='inviteUserGrid']//*[@name='cmnTxtSearch']")
	private WebElement searchTxt;


	@FindBy(xpath = "//*[@id='grid1']/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> inviteUserTable;

	@FindBy(id = "addInviteUserGridaddBtn")
	private WebElement inviteUserPopupAddBtn;

	@FindBy(id = "Name")
	private WebElement inviteUserPopupNameTxt;

	@FindBy(id = "MobileNo")
	private WebElement inviteUserPopupMobileNoTxt;

	@FindBy(id = "EmailID")
	private WebElement inviteUserPopupEmailIdTxt;

	@FindBy(xpath = "//*[@id=\"div_grd_addInviteUserGrid\"]//*[@id='savebtn']")
	private WebElement inviteUserPopupSaveBtn;

	@FindBy(xpath = "//*[@class=\"modal-footer modal-popup-footer\"]/input[@value=\"Send Link\"]")
	private WebElement inviteUserPopupSendLinkBtn;

	@FindBy(xpath = "//*[@class='close']")
	private WebElement inviteUserPopupCloseBtn;

	

	@FindBy(id = "btnLogin")
	private WebElement sendOtpBtn;

	@FindBy(id = "txtLoginOTP")
	private WebElement otpTxt;

	@FindBy(id = "btnLogin")
	private WebElement loginBtn;

	@FindBy(id = "msg")
	private List<WebElement> checkInvalidLoginValidation;

	@FindBy(id = "msg")
	private WebElement invalidLoginValidation;

	@FindBy(id = "txtName")
	private WebElement nameTxtUsrDetails;

	@FindBy(xpath = "//*[@default=\"General\"]//ancestor::a")
	private WebElement generalTabUsrDetails;

	@FindBy(id = "_txtBirthDT")
	private WebElement dobTxtUsrDetails;

	@FindBy(id = "_txtJoinDT")
	private WebElement joinDtTxtUsrDetails;

	@FindBy(name = "txtVehicleRegNo")
	private WebElement vehicleRegNoTxtUsrDetails;

	@FindBy(id = "txtUserDefinedField1")
	private WebElement fieldTxtUsrDetails;

	@FindBy(xpath = "//*[@default=\"Personal\"]//ancestor::a")
	private WebElement personalTabUsrDetails;

	@FindBy(id = "txtSName")
	private WebElement fatherSpTxtUsrDetails;

	@FindBy(xpath = "//*[@value='OK']")
	private WebElement OkBtnUsrDetails;

	@FindBy(xpath = "//*[@key='btnImport']")
	private WebElement importBtn;

	@FindBy(id = "cboFileFrmt")
	private WebElement fileFormatDrop;

	@FindBy(name = "importuser")
	private WebElement chooseBtn;

	@FindBy(id = "Upload")
	private WebElement uploadBtn;

	@FindBy(xpath = "//*[@id=\"message1\"]//label")
	private WebElement validationMessageXpath;

	@FindBy(id = "Process")
	private WebElement sendLinkBtn;

	@FindBy(xpath = "//*[@class=\"panel-collapse in\"]//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> descriptionTable;

	@FindBy(id = "Cancel")
	private WebElement cancelBtn;
	
	@FindBy(xpath = "//*[contains(@id,'inviteUserGridrow')]//*[@title='Delete']")
	private List<WebElement> deleteBtns;
	
	@FindBy(xpath = "//*[contains(@id,'inviteUserGridrow0')]//*[@title='Delete']")
	private WebElement firstDeleteBtn;

	//////////////
	public void inviteUser(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(dateTxt);
		addButtonClick();
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String name = data.get("Name");
			String mobileNo = data.get("MobileNo");
			String emailID = data.get("EmailID");
			element_Click(inviteUserPopupAddBtn);
			Thread.sleep(1000);
			element_Clear(inviteUserPopupNameTxt);
			element_InputTextUsingActionClass(inviteUserPopupNameTxt, name);
			element_TextBoxToClickOnTab(inviteUserPopupNameTxt);
			element_Clear(inviteUserPopupMobileNoTxt);
			element_InputTextUsingActionClass(inviteUserPopupMobileNoTxt, mobileNo);
			element_TextBoxToClickOnTab(inviteUserPopupMobileNoTxt);
			element_Clear(inviteUserPopupEmailIdTxt);
			element_InputTextUsingActionClass(inviteUserPopupEmailIdTxt, emailID);
			element_TextBoxToClickOnTab(inviteUserPopupEmailIdTxt);
			element_Click(inviteUserPopupSaveBtn);
		}
		Thread.sleep(1000);
		element_ClickUsingJS(inviteUserPopupSendLinkBtn);
		String actMsg = validationMessage();
		Assert.assertEquals(actMsg, "Send Link Successfully");
	}

	public void resendOrCopyLink(String action, String validation, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(searchTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String name = data.get("Name");
			String valMsg = null;
			if (element_isEnabled(searchTxt) == true) {
				element_Clear(searchTxt);
				element_InputTextUsingActionClass(searchTxt, name);
				Thread.sleep(2000);
				element_TextBoxToClickOnEnter(searchTxt);
				Thread.sleep(2000);
				for (int i = 0; i < inviteUserTable.size(); i++) {
					String name1 = inviteUserTable.get(i).getText();
					if (name1.equalsIgnoreCase(name)) {
						if (action.equalsIgnoreCase("Resend")) {
							WebElement resendLink1 = inviteUserTable.get(i)
									.findElement(By.xpath("following-sibling::td[4]//img[@title='Resend Link']"));
							element_Click(resendLink1);
						}
						if (action.equalsIgnoreCase("Copy link")) {
							WebElement copyLink1 = inviteUserTable.get(i)
									.findElement(By.xpath("following-sibling::td[4]//img[@title='Copy Link']"));
							element_Click(copyLink1);
						}
					}
					Thread.sleep(1000);
				}
				valMsg = validationMessage();
				Assert.assertEquals(valMsg, validation);
			}
		}
	}

	public void deleteLink(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(searchTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String name = data.get("Name");
			if (element_isEnabled(searchTxt) == true) {
				element_Clear(searchTxt);
				element_InputTextUsingActionClass(searchTxt, name);
				Thread.sleep(2000);
				element_TextBoxToClickOnEnter(searchTxt);
				Thread.sleep(2000);
				for (int i = 0; i < inviteUserTable.size(); i++) {
					String valMsg = null;
					String name1 = inviteUserTable.get(i).getText();
					if (name1.equalsIgnoreCase(name)) {
						WebElement delLink1 = inviteUserTable.get(i)
								.findElement(By.xpath("following-sibling::td[5]/i"));
						element_Click(delLink1);
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1500);
						valMsg = validationMessage();
						if(valMsg.equalsIgnoreCase("Deleted Successfully")) {
							Assert.assertEquals(valMsg, "Deleted Successfully");
						}else {
							Assert.assertEquals(valMsg, "No Data Found");
						}
						
					} else {
						element_Clear(searchTxt);
					}
				}
			}
		}
	}

	public void getAndOpenInviteUserLink(String copyLink, String name) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(searchTxt);
		String getLink = null;
		String valMsg = null;
		if (element_isEnabled(searchTxt) == true) {
			element_Clear(searchTxt);
			element_InputTextUsingActionClass(searchTxt, name);
			Thread.sleep(2000);
			element_TextBoxToClickOnEnter(searchTxt);
			Thread.sleep(2000);
			for (int i = 0; i < inviteUserTable.size(); i++) {
				String name1 = inviteUserTable.get(i).getText();
				if (name1.equalsIgnoreCase(name)) {
					if (copyLink.equalsIgnoreCase("Copy link")) {
						WebElement copyLink1 = inviteUserTable.get(i)
								.findElement(By.xpath("following-sibling::td[4]//img[@title='Copy Link']"));
						element_Click(copyLink1);
					}
				}
				Thread.sleep(1000);
			}
			valMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valMsg, "Link Copied");
		}
		reloadPageButtonClick();
		addButtonClick();
		pageLoadWaitng();
		element_Click(inviteUserPopupAddBtn);
		Thread.sleep(1000);
		element_Clear(inviteUserPopupEmailIdTxt);
		element_Click(inviteUserPopupEmailIdTxt);
		inviteUserPopupEmailIdTxt.sendKeys(Keys.CONTROL + "v");
		element_TextBoxToClickOnTab(inviteUserPopupEmailIdTxt);
		getLink = inviteUserPopupEmailIdTxt.getAttribute("value");
		String getLink1 = ipAddressSetInLink(getLink);
		Thread.sleep(1000);
		element_Click(inviteUserPopupCloseBtn);
		Thread.sleep(1000);
		homeButtonClick();
		// New Tab
		Thread.sleep(1000);
		driver.switchTo().newWindow(WindowType.TAB);
		Thread.sleep(1000);
		ArrayList<String> tabs = new ArrayList<>(driver.getWindowHandles());
		driver.switchTo().window(tabs.get(1));
		// Open Url
		Thread.sleep(1500);
		driver.get(getLink1.replace("https", "http"));
		Thread.sleep(1500);
		driver.get(getLink1.replace("https", "http"));
		Thread.sleep(1500);
		waitForElementVisible_TimeinMinutes(sendOtpBtn, 1);
		element_Click(sendOtpBtn);
		Thread.sleep(3000);
	}

	public String enterOTPandClickOnLoginInOnboardingPortal(String OTP) throws InterruptedException {
		// pageLoadWaitng();
		waitForElementVisible(otpTxt);
		Thread.sleep(1000);
		String title = null;
		element_Clear(otpTxt);
		element_InputTextUsingActionClass(otpTxt, OTP);
		element_TextBoxToClickOnTab(otpTxt);
		Thread.sleep(2000);
		element_Click(loginBtn);
		Thread.sleep(1000);
		if (checkInvalidLoginValidation.size() > 0) {
			title = element_GetText(invalidLoginValidation);
		} else {
			title = "COSEC Onboarding Portal";
		}
		return title;
	}

	public void verifyUserDetailsFromInviteUserPage(String name, String dateOfBirth, String joiningDate,
			String vehicleRegNo, String field1, String fatherSpouseName) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(searchTxt);
		String expValue = name + " " + dateOfBirth + " " + joiningDate + " " + vehicleRegNo + " " + field1 + " "
				+ fatherSpouseName;
		if (element_isEnabled(searchTxt) == true) {
			element_Clear(searchTxt);
			element_InputTextUsingActionClass(searchTxt, name);
			Thread.sleep(2000);
			element_TextBoxToClickOnEnter(searchTxt);
			Thread.sleep(1500);
			if (inviteUserTable.size() > 0) {
				for (int i = 0; i < inviteUserTable.size(); i++) {
					String name1 = inviteUserTable.get(i).getText();
					if (name1.equalsIgnoreCase(name)) {
						WebElement userDetailsOpt = inviteUserTable.get(i)
								.findElement(By.xpath("following-sibling::td[4]//img[@title='Details']"));
						element_Click(userDetailsOpt);
						pageLoadWaitng();
						String nameUsr = nameTxtUsrDetails.getAttribute("value");
						Thread.sleep(1000);
						element_Click(generalTabUsrDetails);
						Thread.sleep(1000);
						String dobUsr = dobTxtUsrDetails.getAttribute("value");
						String joinDtUsr = joinDtTxtUsrDetails.getAttribute("value");
						String vehiRegNoUsr = vehicleRegNoTxtUsrDetails.getAttribute("value");
						String field1Usr = fieldTxtUsrDetails.getAttribute("value");
						Thread.sleep(1000);
						element_Click(personalTabUsrDetails);
						Thread.sleep(1000);
						String fatherSpUsr = fatherSpTxtUsrDetails.getAttribute("value");
						Thread.sleep(1000);
						String actValue = nameUsr + " " + dobUsr + " " + joinDtUsr + " " + vehiRegNoUsr + " "
								+ field1Usr + " " + fatherSpUsr;
						Assert.assertEquals(actValue, expValue);
					}
				}
			}
		}
	}

	public void importUserFrmInviteUser(String fileFormat, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		String filePath = null;
		element_Click(importBtn);
		pageLoadWaitng();
		String actValMsg = null;
		element_Click(fileFormatDrop);
		element_DropDownSelectByvisibleText(fileFormatDrop, fileFormat);
		if (fileFormat.equalsIgnoreCase("XLS")) {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		} else if (fileFormat.equalsIgnoreCase("XLSX")) {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xlsx";
		} else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\Invite User.csv";
		}
		element_InputText(chooseBtn, filePath);
		Thread.sleep(2000);
		element_Click(uploadBtn);
		Thread.sleep(1000);
		actValMsg = validationMessageXpath.getText();
		Assert.assertEquals(actValMsg, "File uploaded succes...");
		Thread.sleep(1000);
		element_Click(sendLinkBtn);
		pageLoadWaitng();
		Thread.sleep(1500);
		actValMsg = validationMessageXpath.getText();
		Assert.assertEquals(actValMsg, "Processing Completed");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: " + data.get("Name") + " Success: " + data.get("Success"));
			String name = data.get("Name");
			String success = data.get("Success");
			String actRes = null;
			for (int i = 0; i < descriptionTable.size(); i++) {
				String successCol = descriptionTable.get(i).getText();
				if (successCol.toUpperCase().equalsIgnoreCase(name.toUpperCase())) {
					actRes = descriptionTable.get(i)
							.findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]"))
							.getText();
					Thread.sleep(1000);
					break;
				}
			}
			Thread.sleep(1000);
			Assert.assertEquals(actRes, success);
		}
		Thread.sleep(1000);
		element_Click(cancelBtn);
	}
	
	public void deleteAllLink() throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(searchTxt);
		while (deleteBtns.size()!=0) {
			element_Click(firstDeleteBtn);
			Thread.sleep(500);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
			String result = null;
			if (validationMessage().equalsIgnoreCase("Deleted Successfully") || validationMessage().equalsIgnoreCase("No Data Found")) {
				result = "Pass";
			} else {
				result = "Fail";
				System.out.println(validationMessage());
			}
			Assert.assertEquals(result, "Pass");
		}
	}
}
