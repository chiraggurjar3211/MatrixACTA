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

public class FormBuilderPO extends AbstractMethod {
	WebDriver driver;

	public FormBuilderPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//***************ELEMENTS*************************************
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> formNames;
	
	@FindBy(id = "FormName")
	private WebElement nameTxt;
	
	@FindBy(xpath = "//*[contains(text(),'Assessment Criteria')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> assessmentCriteriaPanelOpenOrNot;
	
	@FindBy(xpath = "//*[contains(text(),'Assessment Criteria')]/ancestor::a")
	private WebElement assessmentCriteriaPanel;
	
	@FindBy(id = "cboApproveOn")
	private WebElement approveOnDD;
	
	@FindBy(id = "DisplayScoreToUser")
	private WebElement displayScoreFlag;
	
	@FindBy(xpath = "//*[contains(text(),'Form Content')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> formContentPanelOpenOrNot;
	
	@FindBy(xpath = "//*[contains(text(),'Form Content')]/ancestor::a")
	private WebElement formContentPanel;
	
	@FindBy(id = "lnkAddQuestion")
	private WebElement addButtonInForm;
	
	@FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]//a[contains(text(),'Section')]")
	private WebElement sectionOptionInAddBtn;
	
	@FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]//a[contains(text(),'Single-Choice')]")
	private WebElement singleChoiceOptionInAddBtn;
	
	@FindBy(id = "txtQuestion_2_1")
	private WebElement section1Que1;
	
	@FindBy(id = "txtQueOption_2_1")
	private WebElement section1Que1Option1;
	
	@FindBy(id = "txtQueOption_2_2")
	private WebElement section1Que1Option2;
	
	@FindBy(id = "ddlSingleChoiceAnswer_2_1")
	private WebElement section1Que1AnsDD;
	
	@FindBy(id = "spnSaveQuestion_2_1")
	private WebElement queSaveIcon;
	
	@FindBy(xpath = "//*[@title=\"Add Option\"]")
	private WebElement addOptionBtn;
	
	@FindBy(xpath = "//*[contains(text(),'Agreement')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> agreementPanelOpenOrNot;
	
	@FindBy(xpath = "//*[contains(text(),'Agreement')]/ancestor::a")
	private WebElement agreementPanel;
	
	@FindBy(id = "AgreementMstName")
	private WebElement agreementNameTxt;
	
	@FindBy(id = "cboPositionAt")
	private WebElement positionAtDD;
	
	
	//***************CODE**************************************\
	
	public String createForm(Map<String, String> data) throws InterruptedException {
		String val = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (formNames.size() > 0) {
				for (int j = 0; j < formNames.size(); j++) {
					String formName = formNames.get(j).getText();
					ar.add(formName);
					if (formName.equalsIgnoreCase(data.get("Name"))) {
						formNames.get(j).click();
					}
				}
			}
			//logger.debug(ar);
			if (!ar.contains(data.get("Name"))) {
				Thread.sleep(1000);
				addButtonClick();
				element_Clear(nameTxt);
				element_InputTextUsingActionClass(nameTxt, data.get("Name"));
			}
		}
		else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(nameTxt);
			element_InputTextUsingActionClass(nameTxt, data.get("Name"));
		}
		// Main COde
		//*************************************
		// Agreement Panel
		// *************************************
		if (agreementPanelOpenOrNot.size() ==1 ) {
			Thread.sleep(1500);
			element_Click(agreementPanel);
		}
		if (data.get("Agreement") != null) {
			element_Clear(agreementNameTxt);
			Thread.sleep(1500);
			element_InputTextUsingActionClass(agreementNameTxt, data.get("Agreement"));
			element_TextBoxToClickOnTab(agreementNameTxt);
		}
		if (data.get("PositionAt") != null) {
			Thread.sleep(1500);
			element_DropDownSelectByvisibleText(positionAtDD, data.get("PositionAt"));
		}
		//*************************************
		// Assessment Criteria Panel
		//*************************************
		if (assessmentCriteriaPanelOpenOrNot.size()>0) {
			element_Click(assessmentCriteriaPanel);
		}
		if (data.get("ApproveOn") != null) {
			element_DropDownSelectByvisibleText(approveOnDD, data.get("ApproveOn"));
		}
		if (data.get("DisplayScoreToUser") != null) {
			Boolean DisplayScoreToUser1 = Boolean.parseBoolean(data.get("DisplayScoreToUser"));
			if (DisplayScoreToUser1==true) {
				if (!displayScoreFlag.isSelected()) {
					element_Click(displayScoreFlag);
				}
			}
			else {
				if (displayScoreFlag.isSelected()) {
					element_Click(displayScoreFlag);
				}
			}
		}
		//*************************************
		// Form Content Panel
		//*************************************
		if (formContentPanelOpenOrNot.size()>0) {
			element_Click(formContentPanel);
		}
		//Add Section
		element_Click(addButtonInForm);
		Thread.sleep(1000);
		element_Click(sectionOptionInAddBtn);
		Thread.sleep(1000);
		// Add Single choice que
		element_Click(addButtonInForm);
		element_Click(singleChoiceOptionInAddBtn);
		Thread.sleep(1000);
		element_InputTextUsingActionClass(section1Que1, data.get("SingleChoiceQuestion"));
		Thread.sleep(500);
		element_InputTextUsingActionClass(section1Que1Option1, data.get("Option1"));
		Thread.sleep(500);
		element_Click(addOptionBtn);
		Thread.sleep(500);
		element_InputTextUsingActionClass(section1Que1Option2, data.get("Option2"));
		Thread.sleep(500);
		element_DropDownSelectByvisibleText(section1Que1AnsDD, data.get("Answer"));
		Thread.sleep(500);
		element_Click(queSaveIcon);
		
		
		Thread.sleep(1000);
		saveButtonClick();
		val = validationMessage();
		return val;
	}
}
