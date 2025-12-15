package PageObject.ESSLogin;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class EssVisitorPreRegistrationPO extends AbstractMethod{
	WebDriver driver;
	public EssVisitorPreRegistrationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	//************************************************************************
	// ***************ELEMENTS********************************************
	// ************************************************************************
	@FindBy(id = "txtVName")
	private WebElement vNameTxt;

	@FindBy(id = "txtMobileNo")
	private WebElement vMobileTxt;

	@FindBy(id = "txtVPEmail")
	private WebElement vEmailTxt;

	@FindBy(id = "txtOrgName")
	private WebElement vOrganizationTxt;

	@FindBy(id = "_calVisitDate")
	private WebElement fromDtTxt;

	@FindBy(id = "_calUntillDate")
	private WebElement toDtTxt;

	@FindBy(id = "txtVisitStartTime")
	private WebElement startTimeTxt;

	@FindBy(id = "txtVisitEndTime")
	private WebElement endTimeTxt;

	@FindBy(id = "txtPurpose")
	private WebElement purposeTxt;
	
	
	@FindBy(id = "ddlRepeatMode")
	private WebElement repeatModeDD;
	
	@FindBy(xpath = "//*[@id='BitsCardMatrix']/li")
	private List<WebElement> repeatDays;
	
//	@FindBy(xpath = "//*[@default='OK']")
//	private WebElement popupOkBtn;
	
	@FindBy(id = "StationLocationMstName")
	private WebElement visitStationNameTxt;
	
	@FindBy(id = "cmbLocationMode")
	private WebElement visitLocationDD;
	
	@FindBy(id = "ConfigLocationName")
	private WebElement visitConfigLocNameTxt;
	
	@FindBy(id = "ViewMap")
	private WebElement viewMapIcon;
	
	@FindBy(id = "txtPOPLatitude")
	private WebElement latitudeTxt;
	
	@FindBy(id = "txtPOPLongitude")
	private WebElement longitudeTxt;
	
	@FindBy(id = "btnPOPSave")
	private WebElement locationSaveBtn;
	
	//**************************************************************************
	//**************************FUNCTIONS******************************************
	//*****************************************************************************
	
	//Mayank
	public String visitorPreregistartion(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		addButtonClick();
		Thread.sleep(1000);
		if (data.get("VMobile") != null) {
			element_InputTextUsingActionClass(vMobileTxt, data.get("VMobile"));
		}
		if (data.get("VName") != null) {
			element_InputTextUsingActionClass(vNameTxt, data.get("VName"));
		}
		if (data.get("VOrganization") != null) {
			element_InputTextUsingActionClass(vOrganizationTxt, data.get("VOrganization"));
		}
		// element_Click(visitorDetailsIcon); Removed in V20R9.1
		Thread.sleep(1000);
		if (data.get("VEmail") != null) {
			element_InputTextUsingActionClass(vEmailTxt, data.get("VEmail"));
		}
		// element_Click(visitorDeatilsSavenBtn); Removed in V20R9.1
		if (data.get("StartDate") != null) {
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("StartDate"));
			element_Clear(fromDtTxt);
			element_InputTextUsingActionClass(fromDtTxt, date);
		}
		if (data.get("EndDate") != null) {
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("EndDate"));
			element_Clear(toDtTxt);
			element_InputTextUsingActionClass(toDtTxt, date);
		}
		if (data.get("RepeatVisitMode") != null) {
			// element_Click(repeatVisitBtn); Removed in V20R9.1
			Thread.sleep(500);
			element_DropDownSelectByvisibleText(repeatModeDD, data.get("RepeatVisitMode"));
			if (data.get("RepeatVisitDays") != null) {
				if (data.get("RepeatVisitDays").equalsIgnoreCase("ALL") || data.get("RepeatVisitDays").equalsIgnoreCase("All")) {
					for (int k = 0; k < repeatDays.size(); k++) {
						element_Click(repeatDays.get(k));
					}
				} else {
					String[] commaSeparatedValues = data.get("RepeatVisitDays").split(",");
					for (int i = 0; i < commaSeparatedValues.length; i++) {
						for (int j = 0; j < repeatDays.size(); j++) {
							String day = commaSeparatedValues[i].trim().toUpperCase();
							if (repeatDays.get(j).getText().toUpperCase().equalsIgnoreCase(day)) {
								element_Click(repeatDays.get(j));
								break;
							}
						}
					}
				}
			}
			// element_Click(popupOkBtn);  Removed in V20R9.1
			Thread.sleep(1000);
		}
		if (data.get("StartTime") != null) {
			String time = staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("StartTime"));
			element_Clear(startTimeTxt);
			element_inputTextUsingActionClassCharacterOneByOne(startTimeTxt, time);
		}
		if (data.get("EndTime") != null) {
			String time = staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("EndTime"));
			element_Clear(endTimeTxt);
			element_inputTextUsingActionClassCharacterOneByOne(endTimeTxt, time);
		}
		if (data.get("Purpose") != null) {
			element_InputTextUsingActionClass(purposeTxt, data.get("Purpose"));
		}
		// V20R8.1 - Station Linking
		if (data.get("VisitStation") != null) {
			element_Clear(visitStationNameTxt);
			element_dynamicDDSelect(visitStationNameTxt, data.get("VisitStation"));
			element_TextBoxToClickOnTab(visitStationNameTxt);
		}
		if (data.get("VisitLocation") != null) {
			element_DropDownSelectByvisibleText(visitLocationDD, data.get("VisitLocation"));
			if (data.get("VisitLocation").equalsIgnoreCase("Configured Location")) {
				if (data.get("LocationName") != null) {
					element_Clear(visitConfigLocNameTxt);
					element_dynamicDDSelect(visitConfigLocNameTxt, data.get("LocationName"));
					element_TextBoxToClickOnTab(visitConfigLocNameTxt);
				}
			} else if (data.get("VisitLocation").equalsIgnoreCase("Custom Location")) {
				if (data.get("Latitude") != null) {
					element_Click(viewMapIcon);
					element_Clear(latitudeTxt);
					element_InputTextUsingActionClass(latitudeTxt, data.get("Latitude"));
				}
				if (data.get("Longitude") != null) {
					element_Clear(longitudeTxt);
					element_InputTextUsingActionClass(longitudeTxt, data.get("Longitude"));
					element_Click(locationSaveBtn);
				}
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		String val = validationMessage();
		reloadPageButtonClick();
		return val;
	}
}
