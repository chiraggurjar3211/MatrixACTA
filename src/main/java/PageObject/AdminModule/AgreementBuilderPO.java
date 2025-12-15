package PageObject.AdminModule;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovyjarjarantlr4.v4.parse.ANTLRParser.throwsSpec_return;

public class AgreementBuilderPO extends AbstractMethod {
	WebDriver driver;

	public AgreementBuilderPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//***************ELEMENTS*************************************
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[3]")
	private List<WebElement> AgreementBNames;
	
	@FindBy(id = "AgreementName")
	private WebElement nameTxt;
	
	@FindBy(xpath = "//*[@id='accordion_master']//*[@class='panel'][1]//*[@class='collapsed']")
	private List<WebElement> agreementContentPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@default='Agreement Content']")
	private WebElement agreementContentPanel;
	
	@FindBy(id = "txtHdrMsg")
	private WebElement headerTxt;
	
	@FindBy(id = "txtBodyMsg")
	private WebElement bodyTxt;
	
	@FindBy(id = "txtFtrMsg")
	private WebElement footerTxt;
	
	@FindBy(xpath = "//*[@id='accordion_master']//*[@class='panel'][2]//*[@class='collapsed']")
	private List<WebElement> additionalPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@default='Additional']")
	private WebElement additionalPanel;
	
	@FindBy(id = "chkEnblDigitalSignature")
	private WebElement enableSignatureFlag;
	
	@FindBy(id = "chkCheckbox")
	private WebElement agreeCheckboxFlag;
	
	@FindBy(id = "chkButton")
	private WebElement chkButtonFlag;
	
	
	//***************CODE**************************************\
	
	public String createAgreementB(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(nameTxt);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (AgreementBNames.size() > 0) {
				for (int j = 0; j < AgreementBNames.size(); j++) {
					String AgreementBName = AgreementBNames.get(j).getText();
					ar.add(AgreementBName);
					if (AgreementBName.equalsIgnoreCase(data.get("Name"))) {
						AgreementBNames.get(j).click();
					}
				}
			}
			// logger.debug(ar);
			if (!ar.contains(data.get("Name"))) {
				Thread.sleep(1000);
				addButtonClick();
				element_Clear(nameTxt);
				element_InputTextUsingActionClass(nameTxt, data.get("Name"));
			}
		} else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(nameTxt);
			element_InputTextUsingActionClass(nameTxt, data.get("Name"));
		}
		// Main COde
		// Agreement Content Panel
		if (agreementContentPanelOpenOrNot.size()==1) {
			element_Click(agreementContentPanel);
		}
		if (data.get("Header") != null) {
			element_Clear(headerTxt);
			element_InputTextUsingActionClass(headerTxt, data.get("Header"));
		}
		if (data.get("Content") != null) {
			element_Clear(bodyTxt);
			element_InputTextUsingActionClass(bodyTxt, data.get("Content"));
		}
		if (data.get("Footer") != null) {
			element_Clear(footerTxt);
			element_InputTextUsingActionClass(footerTxt, data.get("Footer"));
		}
		Thread.sleep(1000);
		// Additional Panel
		if (additionalPanelOpenOrNot.size()==1) {
			element_Click(additionalPanel);
		}
		if (data.get("EnableSignature") != null) {
			boolean enableSignature1 = Boolean.parseBoolean(data.get("EnableSignature"));
			if (enableSignature1==true) {
				if (!enableSignatureFlag.isSelected()) {
					element_Click(enableSignatureFlag);
				}
			}
			else {
				if (enableSignatureFlag.isSelected()) {
					element_Click(enableSignatureFlag);
				}
			}
		}
		if (data.get("ConfirmationStyle") != null) {
			if (data.get("ConfirmationStyle").equalsIgnoreCase("Agree Checkbox")) {
				element_Click(agreeCheckboxFlag);
			}
			else {
				element_Click(chkButtonFlag);
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}
}
