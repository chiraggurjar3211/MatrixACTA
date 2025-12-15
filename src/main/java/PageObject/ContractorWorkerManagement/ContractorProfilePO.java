package PageObject.ContractorWorkerManagement;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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

public class ContractorProfilePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ContractorProfilePO.class);
	
	public ContractorProfilePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// **********************************************************************************************
	// **************** Elements
	// *******************************************************************
	// *********************************************************************************************

	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> contractorIDs;

//	@FindBy(xpath = "//*[@title='Edit (Alt+E)']")
//	private WebElement editButton;

	@FindBy(id = "ConProfileID")
	private WebElement contractorID;

	@FindBy(id = "ConProfileName")
	private WebElement contractorName;

	@FindBy(xpath = "//html")
	private WebElement blankSpace;

	@FindBy(id = "_endDate")
	private WebElement validityDate;

	@FindBy(xpath = "//*[@id='endDate']/div/span[1]/i")
	private WebElement endDatePicker;

	// *******************************************************
	// Contact Info Panel Elements
	// *******************************************************

	@FindBy(xpath = "//*[@class='collapsed']//*[@default='Contact Information']")
	private List<WebElement> contactInfoPanelOpenOrNot;

	@FindBy(xpath = "//*[@default='Contact Information']")
	private WebElement contactInfoPanel;

	@FindBy(id = "txtPer1")
	private WebElement contact1;

	@FindBy(id = "txtMobile1")
	private WebElement contactmobile1;

	@FindBy(id = "txtEmail1")
	private WebElement contactemail1;

	// *******************************************************
	// License Info Panel Elements
	// *******************************************************

	@FindBy(xpath = "//*[@class='collapsed']//*[@default='License Information']")
	private List<WebElement> licenseInfoPanelOpenOrNot;

	@FindBy(xpath = "//*[@default='License Information']")
	private WebElement licenseInfoPanel;

	@FindBy(id = "txtLicNo")
	private WebElement licenseNotxt;

	@FindBy(id = "txtDescr")
	private WebElement licensedesctxt;

	// *******************************************************
	// Account Info Panel Elements
	// *******************************************************

	@FindBy(xpath = "//*[@class='collapsed']//*[@default='Account Information']")
	private List<WebElement> accountInfoPanelOpenOrNot;

	@FindBy(xpath = "//*[@default='Account Information']")
	private WebElement accountInfoPanel;

	@FindBy(xpath = "//*[@name='txtUseCntLimit4']")
	private WebElement enableAccountflag;

	@FindBy(xpath = "//*[@name='txtUseCntLimit5']")
	private WebElement editBasicDetailsflag;

	// *******************************************************
	// Detaails Panel Elements
	// *******************************************************

	@FindBy(xpath = "//*[@default='Details']")
	private WebElement detailPanel;

	@FindBy(xpath = "//div[@class='panel-collapse collapse panel-collapse-custom show']//label[text()=\"ESI No.\"]/ancestor::div[2]/following-sibling::div[not(@hidden)]/div[1]")
	private List<WebElement> customFieldRows;

	// **********************************************************************************************
	// **************** Functions
	// *******************************************************************
	// *********************************************************************************************
	// Created by Mayank
	// **********************************************************
	// Contractor Delete via API
	// **********************************************************
	public String contractorDeleteAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data) {
		String apiPar = null;
		if (columnHeader.contains("id")) {
			if (data.get("id") != null) {
				apiParameter.add("id=" + data.get("id"));
			}
		}
		return apiPar;
	}

	// Mayank
	// **********************************************************
	// Contractor Create
	// **********************************************************
	public void createContractor(List<String> columnHeader, Map<String, String> data) throws InterruptedException {
		String msg = null;
		Thread.sleep(1000);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Id"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1500);
			ArrayList<String> ar = new ArrayList<>();
			if (contractorIDs.size() > 0) {
				for (int j = 0; j < contractorIDs.size(); j++) {
					String id1 = contractorIDs.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(data.get("Id"))) {
						contractorIDs.get(j).click();
					}
				}
			}
			// logger.debug(ar);
			if (!ar.contains(data.get("Id"))) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(contractorID);
				element_InputTextUsingActionClass(contractorID, data.get("Id"));
			}
		} else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(contractorID);
			element_InputTextUsingActionClass(contractorID, data.get("Id"));
		}
		Thread.sleep(1000);
		// Main Code
		if (columnHeader.contains("ValidityEndDate")) {
			if (data.get("ValidityEndDate") != null) {
//				element_Click(endDatePicker);
//				dateSelectedThroughDatePicker(data.get("ValidityEndDate"));
				String vdate = staticDateOrPlusMinusFromCurrentDate(data.get("ValidityEndDate"));
				element_Clear(validityDate);
				element_InputTextUsingActionClass(validityDate, vdate);
			}
		}
		// **************************************************************************
		// ****** Contact Information
		// Panel******************************************************
		// **************************************************************************
		if (data.get("ContactPerson1") != null || data.get("ContactMobile1") != null || data.get("ContactEmail1") != null) {
			Thread.sleep(1000);
			if (contactInfoPanelOpenOrNot.size() > 0) {
				element_Click(contactInfoPanel);
			}
			Thread.sleep(500);
			if (columnHeader.contains("ContactPerson1")) {
				if (data.get("ContactPerson1") != null) {
					element_Clear(contact1);
					element_InputTextUsingActionClass(contact1, data.get("ContactPerson1"));
				}
			}
			if (columnHeader.contains("ContactMobile1")) {
				if (data.get("ContactMobile1") != null) {
					element_Clear(contactmobile1);
					element_InputTextUsingActionClass(contactmobile1, data.get("ContactMobile1"));
				}
			}
			if (columnHeader.contains("ContactEmail1")) {
				if (data.get("ContactEmail1") != null) {
					element_Clear(contactemail1);
					element_InputTextUsingActionClass(contactemail1, data.get("ContactEmail1"));
				}
			}
		}

		// **************************************************************************
		// ****** License Information
		// Panel******************************************************
		// **************************************************************************
		if (data.get("LicenseNo") != null || data.get("Description") != null) {
			Thread.sleep(1000);
			if (licenseInfoPanelOpenOrNot.size() > 0) {
				element_Click(licenseInfoPanel);
			}
			Thread.sleep(500);
			if (columnHeader.contains("LicenseNo")) {
				if (data.get("LicenseNo") != null) {
					element_Clear(licenseNotxt);
					element_InputTextUsingActionClass(licenseNotxt, data.get("LicenseNo"));
				}
			}
			if (columnHeader.contains("Description")) {
				if (data.get("Description") != null) {
					element_Clear(licensedesctxt);
					element_InputTextUsingActionClass(licensedesctxt, data.get("Description"));
				}
			}
		}

		// **************************************************************************
		// ****** Account Information
		// Panel******************************************************
		// **************************************************************************
		if (data.get("EnableAccount") != null || data.get("EditBasicDetails") != null) {
			Thread.sleep(1000);
			if (accountInfoPanelOpenOrNot.size() > 0) {
				element_Click(accountInfoPanel);
			}
			Thread.sleep(500);
			if (columnHeader.contains("EnableAccount")) {
				if (data.get("EnableAccount") != null) {
					boolean enable = Boolean.parseBoolean(data.get("EnableAccount"));
					if (enable == true) {
						if (!enableAccountflag.isSelected()) {
							element_Click(enableAccountflag);
						}
						// Flag depends on Enable Account flag
						if (columnHeader.contains("EditBasicDetails")) {
							if (data.get("EditBasicDetails") != null) {
								boolean enableeditdetails = Boolean.parseBoolean(data.get("EditBasicDetails"));
								if (enableeditdetails == true) {
									if (!editBasicDetailsflag.isSelected()) {
										element_Click(editBasicDetailsflag);
									}
								} else {
									if (editBasicDetailsflag.isSelected()) {
										element_Click(editBasicDetailsflag);
									}
								}
							}
						}
					} else {
						if (enableAccountflag.isSelected()) {
							element_Click(enableAccountflag);
						}
					}
				}
			}
		}
		// *********************************************************************************
		Thread.sleep(1000);
		if (columnHeader.contains("name")) {
			if (data.get("name") != null) {
				element_Clear(contractorName);
				element_InputTextUsingActionClass(contractorName, data.get("name"));
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(2000);
		msg = validationMessage();
		Assert.assertEquals(msg, data.get("Validation"));
	}

	// Mayank
	public void customFieldsVerification(String conID, List<Map<String, String>> data) throws InterruptedException {
		Thread.sleep(2000);
		waitForElementVisible(contractorID);
		Thread.sleep(1000);
		element_Clear(contractorID);
		element_InputTextUsingActionClass(contractorID, conID);
		Thread.sleep(1000);
		element_Click(blankSpace);
		pageLoadWaitng();
		element_Click(detailPanel);
		Thread.sleep(1000);
		for (int i = 0; i < data.size(); i++) {
			String fieldName = data.get(i).get("FieldName");
			String type = data.get(i).get("Type");
			String upload = data.get(i).get("Upload");
			String mandatory = data.get(i).get("Mandatory");
			Boolean validate = Boolean.parseBoolean(data.get(i).get("Validate"));
			if (customFieldRows.size() > 0) {
				// Field
				if (fieldName != null) {
					logger.info("FieldName: "+fieldName);
					String actualFieldLabel = customFieldRows.get(i).getText();
					logger.debug(actualFieldLabel);
					Assert.assertEquals(actualFieldLabel, fieldName);
				}
				// Type
				if (type != null) {
					logger.info("Type: "+type);
					String actualType1 = customFieldRows.get(i)
							.findElement(By.xpath("following-sibling::div[1]//input")).getAttribute("maxlength");
					logger.debug(actualType1);
					String actualType = null;
					//Boolean actualType2 = Boolean.parseBoolean(actualType1);
					if (actualType1.equalsIgnoreCase("10")) {
						actualType = "Date";
					} else {
						actualType = "Textbox";
					}
					Assert.assertEquals(actualType, type);
				}
				// Upload
				if (upload != null) {
					int actualUpload = customFieldRows.get(i).findElements(By.xpath(
							"following-sibling::div[2]//*[@imgtitle='Upload']/ancestor::div[@class=\"col-md-3 col-sm-6\" and not(@hidden)]"))
							.size();
					logger.debug(actualUpload);
					Boolean upload1 = Boolean.parseBoolean(upload);
					if (upload1 == true) {
						Assert.assertEquals(actualUpload, 1);
					} else {
						Assert.assertEquals(actualUpload, 0);
					}
				}
				// Mandatory
				if (mandatory != null) {
					logger.info("Mandatory: "+mandatory);
					Boolean mandatory1 = Boolean.parseBoolean(mandatory);
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					Thread.sleep(1000);
					saveButtonClick();
					Thread.sleep(1000);
					String valmsg = validationMessage();
					if (mandatory1 == true) {
						Assert.assertEquals(valmsg, fieldName + " should not be blank");
						validationMessageCloseButton.click();
						customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
								.sendKeys("01/01/2020");
					} else {
						String val1 = "Saved Successfully";
						String val2 = fieldName + " should not be blank";
						String actual = "Pass";
						if (valmsg.equalsIgnoreCase(val1) || !valmsg.equalsIgnoreCase(val2)) {
							actual = "Pass";
						} else {
							actual = "Failed";
							logger.debug(valmsg);
						}
						Assert.assertEquals(actual, "Pass");
						if (editButton.isEnabled()) {
							editButtonClick();
						}
					}
					Thread.sleep(1000);
				}
				// Validate
				if (validate != null) {
					Boolean actualValidate = true;
					String fieldLabel = customFieldRows.get(i).getText();
					if (fieldLabel.equalsIgnoreCase(fieldName)) {
						actualValidate = true;
					} else {
						actualValidate = false;
					}
					Assert.assertEquals(actualValidate, validate);
				}
			} else { // For No any Custom fields are active
				Boolean actualValidate = false;
				Assert.assertEquals(actualValidate, validate);
			}
		}
		saveButtonClick();
		String valmsg = validationMessage();
		Assert.assertEquals(valmsg, "Saved Successfully");
	}

	// Mayank
	// Mayank
	public String uploadDocumentsInCustomFields(Map<String, String> data) throws InterruptedException, IOException {
		Thread.sleep(2000);
		waitForElementVisible(contractorID);
		Thread.sleep(1000);
		element_Clear(contractorID);
		element_InputTextUsingActionClass(contractorID, data.get("Id"));
		Thread.sleep(1000);
		element_Click(blankSpace);
		pageLoadWaitng();
		element_Click(detailPanel);
		Thread.sleep(1000);

		for (int i = 0; i < customFieldRows.size(); i++) {
			String fieldLabel = customFieldRows.get(i).getText();
			logger.debug(fieldLabel);
			if (data.get("Adhar") != null && data.get("Adhar").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("Adhar")) {
					WebElement uploadIcon = customFieldRows.get(i).findElement(By.xpath(
							"following-sibling::div[2]//*[@imgtitle='Upload']"));
					element_Click(uploadIcon);
					uploadDocumentUsingAutoIT();
					String actualUpload = null;
					if (customFieldRows.get(i).findElements(By.xpath(
							"following-sibling::div[2]//*[@title='Preview']"))
							.size() > 0) {
						actualUpload = "Pass";
					} else {
						actualUpload = "Failed";
					}
					Assert.assertEquals(actualUpload, "Pass");
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
							.sendKeys("01/01/2020");
				}
			}
			if (data.get("PanCard") != null && data.get("PanCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("PanCard")) {
					WebElement uploadIcon = customFieldRows.get(i).findElement(By.xpath(
							"following-sibling::div[2]//*[@imgtitle='Upload']"));
					element_Click(uploadIcon);
					uploadDocumentUsingAutoIT();
					String actualUpload = null;
					if (customFieldRows.get(i).findElements(By.xpath(
							"following-sibling::div[2]//*[@title='Preview']"))
							.size() > 0) {
						actualUpload = "Pass";
					} else {
						actualUpload = "Failed";
					}
					Assert.assertEquals(actualUpload, "Pass");
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
							.sendKeys("01/01/2020");
				}
			}
			if (data.get("VotingCard") != null && data.get("VotingCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("VotingCard")) {
					WebElement uploadIcon = customFieldRows.get(i).findElement(By.xpath(
							"following-sibling::div[2]//*[@imgtitle='Upload']"));
					element_Click(uploadIcon);
					uploadDocumentUsingAutoIT();
					String actualUpload = null;
					if (customFieldRows.get(i).findElements(By.xpath(
							"following-sibling::div[2]//*[@title='Preview']"))
							.size() > 0) {
						actualUpload = "Pass";
					} else {
						actualUpload = "Failed";
					}
					Assert.assertEquals(actualUpload, "Pass");
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
							.sendKeys("01/01/2020");
				}
			}
			if (data.get("CitizenCard") != null && data.get("CitizenCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("CitizenCard")) {
					WebElement uploadIcon = customFieldRows.get(i).findElement(By.xpath(
							"following-sibling::div[2]//*[@imgtitle='Upload']"));
					element_Click(uploadIcon);
					uploadDocumentUsingAutoIT();
					String actualUpload = null;
					if (customFieldRows.get(i).findElements(By.xpath(
							"following-sibling::div[2]//*[@title='Preview']"))
							.size() > 0) {
						actualUpload = "Pass";
					} else {
						actualUpload = "Failed";
					}
					Assert.assertEquals(actualUpload, "Pass");
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
							.sendKeys("01/01/2020");
				}
			}
			if (data.get("IDCard") != null && data.get("IDCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("IDCard")) {
					WebElement uploadIcon = customFieldRows.get(i).findElement(By.xpath(
							"following-sibling::div[2]//*[@imgtitle='Upload']"));
					element_Click(uploadIcon);
					uploadDocumentUsingAutoIT();
					String actualUpload = null;
					if (customFieldRows.get(i).findElements(By.xpath(
							"following-sibling::div[2]//*[@title='Preview']"))
							.size() > 0) {
						actualUpload = "Pass";
					} else {
						actualUpload = "Failed";
					}
					Assert.assertEquals(actualUpload, "Pass");
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
							.sendKeys("01/01/2020");
				}
			}
		}
		saveButtonClick();
		String valmsg = validationMessage();
		return valmsg;
	}

	// Mayank
	public String updateContractorCustomFields(Map<String, String> data) throws InterruptedException, IOException {
		Thread.sleep(2000);
		waitForElementVisible(contractorID);
		Thread.sleep(1000);
		element_Clear(contractorID);
		element_InputTextUsingActionClass(contractorID, data.get("Id"));
		Thread.sleep(1000);
		element_Click(blankSpace);
		pageLoadWaitng();
		element_Click(detailPanel);
		Thread.sleep(1000);

		for (int i = 0; i < customFieldRows.size(); i++) {
			String fieldLabel = customFieldRows.get(i).getText();
			if (data.get("Adhar") != null && !data.get("Adhar").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("Adhar")) {
					String dt = staticDateOrPlusMinusFromCurrentDate(data.get("Adhar"));
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
							.sendKeys(dt);
				}
			}
			if (data.get("PanCard") != null && !data.get("PanCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("PanCard")) {
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
							.sendKeys(data.get("PanCard"));
				}
			}
			if (data.get("VotingCard") != null && !data.get("VotingCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("VotingCard")) {
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
							.sendKeys(data.get("VotingCard"));
				}
			}
			if (data.get("CitizenCard") != null && !data.get("CitizenCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("CitizenCard")) {
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
							.sendKeys(data.get("CitizenCard"));
				}
			}
			if (data.get("IDCard") != null && !data.get("IDCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("IDCard")) {
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
							.sendKeys(data.get("IDCard"));
				}
			}
		}
		saveButtonClick();
		String valmsg = validationMessage();
		return valmsg;
	}
	
	//Chhaya
	public void verifyContractorName(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(contractorID);
		boolean expRes = true;
		boolean actRes = false;
		addButtonClick();
		Thread.sleep(1000);
		element_Clear(contractorID);
		element_InputTextUsingActionClass(contractorID, data.get("ID"));
		Thread.sleep(500);
		element_TextBoxToClickOnTab(contractorID);
		Thread.sleep(2000);
		if(!element_getInputControlValue(contractorName).isBlank() || !element_getInputControlValue(contractorName).isEmpty()) {
			actRes = true;
		}
		reloadPageButtonClick();
		Thread.sleep(2000);
		Assert.assertEquals(actRes, expRes);
		
	}
}
