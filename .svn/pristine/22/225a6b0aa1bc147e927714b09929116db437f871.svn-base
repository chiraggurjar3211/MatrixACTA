package PageObject.VisitorManagement;

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

public class StationLocationPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(StationLocationPO.class);
	public StationLocationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Mayank
	//***************************ELEMENTS***************************************
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[3]")
	private List<WebElement> stationLocationName;
	
	@FindBy(id = "StationLocationName")
	private WebElement nameTxt;
	
	@FindBy(id="StationLocationID")
	private WebElement stationID;
	
	@FindBy(id = "SiteName")
	private WebElement siteNameTxt;
	
	@FindBy(xpath = "//*[@id='chkActive' and @name='txtchkActive1']")
	private WebElement autoAuthVisitorLoginFlag;
	
	@FindBy(xpath = "//*[@id='message']/div/label")
	private List<WebElement> validationMessages;
	
	@FindBy(id = "VisitorTemplateName")
	private WebElement visitorTemplateNameTxt;
	
	@FindBy(id = "VisitTemplateName")
	private WebElement visitTemplateNameTxt;
	
	@FindBy(xpath = "//*[@id='chkActive' and @name='txtchkActive11']")
	private WebElement visitCreationonCurrentDateFlag;
	
	// Form Panel
	
	@FindBy(xpath = "//*[@class='collapsed']//*[@key='Form']")
	private List<WebElement> formPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@key='Form']")
	private WebElement formPanel;
	
	@FindBy(id = "NewFormBuilderMstName")
	private WebElement checkInFormNameTxt;
	
	@FindBy(xpath = "//*[@id='txtvisitcheck1']")
	private WebElement checkInExecutionOnDD;
	
	@FindBy(id = "txtVisitCheckInVldTime")
	private WebElement checkInValidityTxt;
	
	@FindBy(xpath = "//*[@id='txtvlddurationgh']")
	private WebElement checkInVldDurationDD;
	
	@FindBy(id = "FormBuilderMstforOutName")
	private WebElement checkOutFormNameTxt;
	
	@FindBy(xpath = "//*[@id='txtvlddurationgh2']")
	private WebElement checkOutExecutionOnDD;
	
	@FindBy(id = "txtVisitCheckOutVldTime")
	private WebElement checkOutValidityTxt;
	
	@FindBy(xpath = "//*[@id='txtvlddurationgh67']")
	private WebElement checkOutVldDurationDD;
	
	@FindBy(id = "FormBuilderMstName")
	private WebElement loginFormNameTxt;
	
	@FindBy(xpath = "//*[@id='txtagpr']")
	private WebElement loginExecutionOnDD;
	
	@FindBy(id = "txtVldTime")
	private WebElement loginValidityTxt;
	
	@FindBy(xpath = "//*[@id='txtchange1']")
	private WebElement loginVldDurationDD;
	
	//*******************************CODE**************************************************
	public static String visitorStationID=null;
	public String createStationLocation(Map<String, String> data) throws InterruptedException {
		String val = null;
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Click(searchTextBoxTitleBar);
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (stationLocationName.size() > 0) {
				for (int j = 0; j < stationLocationName.size(); j++) {
					String stationLocation1 = stationLocationName.get(j).getText();
					ar.add(stationLocation1);
					if (stationLocation1.equalsIgnoreCase(data.get("Name"))) {
						stationLocationName.get(j).click();
					}
				}
			}
			//System.out.println(ar);
			if (!ar.contains(data.get("Name"))) {
				Thread.sleep(1000);
				addButtonClick();
			}
		}
		Thread.sleep(1000);
		//Main code
		element_Clear(nameTxt);
		Thread.sleep(700);
		element_InputTextUsingActionClass(nameTxt, data.get("Name"));
		Thread.sleep(1000);
		if (data.get("SiteName") != null) {
			element_Clear(siteNameTxt);
			Thread.sleep(250);
			element_dynamicDDSelect(siteNameTxt, data.get("SiteName"));
			
		}
		if (data.get("AutoAuthorizeVisitorLogin") != null) {
			boolean autoAuthorizeVisitorLogin1 = Boolean.parseBoolean(data.get("AutoAuthorizeVisitorLogin"));
			if (autoAuthorizeVisitorLogin1==true) {
				if (!autoAuthVisitorLoginFlag.isSelected()) {
					element_Click(autoAuthVisitorLoginFlag);
				}
			}
			else {
				if (autoAuthVisitorLoginFlag.isSelected()) {
					element_Click(autoAuthVisitorLoginFlag);
				}
			}
		}
		if (data.get("VisitorTemplate") != null) {
			element_Clear(visitorTemplateNameTxt);
			element_dynamicDDSelect(visitorTemplateNameTxt, data.get("VisitorTemplate"));
		}
		if (data.get("VisitTemplate") != null) {
			element_Clear(visitTemplateNameTxt);
			element_dynamicDDSelect(visitTemplateNameTxt, data.get("VisitTemplate"));
		}
		if (data.get("VisitCreationonCurrentDate") != null) {
			boolean visitCreationonCurrentDate = Boolean.parseBoolean(data.get("VisitCreationonCurrentDate"));
			if (visitCreationonCurrentDate==true) {
				if (!visitCreationonCurrentDateFlag.isSelected()) {
					element_Click(visitCreationonCurrentDateFlag);
				}
			}
			else {
				if (visitCreationonCurrentDateFlag.isSelected()) {
					element_Click(visitCreationonCurrentDateFlag);
				}
			}
		}
		//*************************************
		// Form Panel
		//*************************************
		if (formPanelOpenOrNot.size()>0) {
			element_Click(formPanel);
		}
		// Login
		if (data.get("LoginFormName") != null) {
			element_Clear(loginFormNameTxt);
			element_dynamicDDSelect(loginFormNameTxt, data.get("LoginFormName"));
			if (data.get("LoginExecutionOn") != null) {
				element_DropDownSelectByvisibleText(loginExecutionOnDD, data.get("LoginExecutionOn"));
			}
			if (data.get("LoginValidity") != null && loginValidityTxt.isEnabled()) {
				if (data.get("LoginValDuration") != null) {
					element_DropDownSelectByvisibleText(loginVldDurationDD, data.get("LoginValDuration"));
				}
				element_Clear(loginValidityTxt);
				element_InputTextUsingActionClass(loginValidityTxt, data.get("LoginValidity"));
			}
		}
		
		// CheckIn
		if (data.get("CheckInFormName") != null) {
			element_Clear(checkInFormNameTxt);
			element_dynamicDDSelect(checkInFormNameTxt, data.get("CheckInFormName"));
			element_TextBoxToClickOnTab(checkInFormNameTxt);
			if (data.get("CheckInExecutionOn") != null) {
				element_DropDownSelectByvisibleText(checkInExecutionOnDD, data.get("CheckInExecutionOn"));
			}
			if (data.get("CheckInValidity") != null && checkInValidityTxt.isEnabled()) {
				if (data.get("CheckInValDuration") != null) {
					element_DropDownSelectByvisibleText(checkInVldDurationDD, data.get("CheckInValDuration"));
				}
				element_Clear(checkInValidityTxt);
				element_InputTextUsingActionClass(checkInValidityTxt, data.get("CheckInValidity"));
			}
		}
		
		// CheckOut
		if (data.get("CheckOutFormName") != null) {
			element_Clear(checkOutFormNameTxt);
			element_dynamicDDSelect(checkOutFormNameTxt, data.get("CheckOutFormName"));
			element_TextBoxToClickOnTab(checkOutFormNameTxt);
			if (data.get("CheckOutExecutionOn") != null) {
				element_DropDownSelectByvisibleText(checkOutExecutionOnDD, data.get("CheckOutExecutionOn"));
			}
			if (data.get("CheckOutValidity") != null && checkOutValidityTxt.isEnabled()) {
				if (data.get("CheckOutValDuration") != null) {
					element_DropDownSelectByvisibleText(checkOutVldDurationDD, data.get("CheckOutValDuration"));
				}
				element_Clear(checkOutValidityTxt);
				element_InputTextUsingActionClass(checkOutValidityTxt, data.get("CheckOutValidity"));
			}
		}
		saveButtonClick();
		if (validationMessages.size()==0) {
			saveButtonClick();
		}
		val = validationMessage();
		visitorStationID=element_getInputControlValue(stationID);
		return val;
	}
	
	public void deleteStationLocation(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (stationLocationName.size() > 0) {
				for (int j = 0; j < stationLocationName.size(); j++) {
					String stationLocation1 = stationLocationName.get(j).getText();
					ar.add(stationLocation1);
					if (stationLocation1.equalsIgnoreCase(data.get("Name"))) {
						logger.debug("Station location Found, Name = "+data.get("Name"));
						stationLocationName.get(j).click();
						Thread.sleep(1000);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
					}
				}
			}
			//System.out.println(ar);
			if (!ar.contains(data.get("Name"))) {
				logger.debug("Station location not found, Name = "+data.get("Name"));
			}
		}
	}
}
