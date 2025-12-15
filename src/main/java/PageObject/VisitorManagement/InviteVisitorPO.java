package PageObject.VisitorManagement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.WindowType;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class InviteVisitorPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(InviteVisitorPO.class);
	public InviteVisitorPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Mayank
	//************************************************************************
	//***************ELEMENTS********************************************
	//************************************************************************
	@FindBy(id = "txtName")
	private WebElement vNameTxt;
	
	@FindBy(id = "txtMobile")
	private WebElement vMobileTxt;
	
	@FindBy(id = "txtEmail")
	private WebElement vEmailTxt;
	
	@FindBy(id = "txtOrganization")
	private WebElement vOrganizationTxt;
	
	@FindBy(id = "InviteHostUserID")
	private WebElement hostIDTxt;
	
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
	
	@FindBy(id = "txtAddVisitor")
	private WebElement additionalVisitorsTxt;
	
	@FindBy(id = "btnSendLink")
	private WebElement sendLinkBtn;
	
	@FindBy(id = "iconCopyLink")
	private WebElement copyIcon;
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> sendVisitorNames;
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][3]")
	private List<WebElement> sendVisitorLinkStatus;
	
	@FindBy(xpath = "//*[@key=\"btnSelDontSave\"]")
	private WebElement dontSaveBtn;
	
//	@FindBy(id = "RepeatVisit")
//	private WebElement repeatVisitBtn;
	
	@FindBy(id = "ddlRepeatMode")
	private WebElement repeatModeDD;
	
	@FindBy(xpath = "//*[@id='BitsCardMatrix']/li")
	private List<WebElement> repeatDays;
	
//	@FindBy(xpath = "//*[@default='OK']")
//	private WebElement popupOkBtn;
	
	@FindBy(id = "StationLocationMstPicklist2Name")
	private WebElement visitStationNameTxt;
	
	@FindBy(id = "cmbLocationMode")
	private WebElement visitLocationDD;
	
	@FindBy(id = "ConfigLocationDetailsName")
	private WebElement visitConfigLocNameTxt;
	
	@FindBy(id = "ViewMap")
	private WebElement viewMapIcon;
	
	@FindBy(id = "txtPOPLatitude")
	private WebElement latitudeTxt;
	
	@FindBy(id = "txtPOPLongitude")
	private WebElement longitudeTxt;
	
	@FindBy(id = "btnPOPSave")
	private WebElement locationSaveBtn;
	
	
	
	//**********************************************************************
	//***********FUNCTIONS**************************************************
	//***********************************************************************
	
	// Mayank
	public String inviteVisitorAPI(List<String> columnHeader,List<String> apiParameter,Map<String, String> data) {
		String apiPar=null;

				if (columnHeader.contains("visitor-name")) {
					if (data.get("visitor-name")!=null) {
					apiParameter.add("visitor-name="+data.get("visitor-name"));
					}
				}
				if (columnHeader.contains("Visitor-email-id")) {
					if (data.get("Visitor-email-id")!=null) {
					apiParameter.add("Visitor-email-id="+data.get("Visitor-email-id"));
					}
				}
				if (columnHeader.contains("Visitor-mobile-no")) {
					if (data.get("Visitor-mobile-no")!=null) {
					apiParameter.add("Visitor-mobile-no="+data.get("Visitor-mobile-no"));
					}
				}
				if (columnHeader.contains("visit-date")) {
					if (data.get("visit-date")!=null) {
					String date=dateSelectedinddMMyyyy(data.get("visit-date"));
					apiParameter.add("visit-date="+date);
					}
				}
				if (columnHeader.contains("visit-until-date")) {
					if (data.get("visit-until-date")!=null) {
					String date=dateSelectedinddMMyyyy(data.get("visit-until-date"));
					apiParameter.add("visit-until-date="+date);
					}
				}
				if (columnHeader.contains("visit-start-time")) {
					if (data.get("visit-start-time")!=null) {
					apiParameter.add("visit-start-time="+data.get("visit-start-time"));
					}
				}
				if (columnHeader.contains("visit-end-time")) {
					if (data.get("visit-end-time")!=null) {
					apiParameter.add("visit-end-time="+data.get("visit-end-time"));
					}
				}
				if (columnHeader.contains("additional-visitors")) {
					if (data.get("additional-visitors")!=null) {
					apiParameter.add("additional-visitors="+data.get("additional-visitors"));
					}
				}
				if (columnHeader.contains("host-id")) {
					if (data.get("host-id")!=null) {
					apiParameter.add("host-id="+data.get("host-id"));
					}
				}
				if (columnHeader.contains("purpose")) {
					if (data.get("purpose")!=null) {
					apiParameter.add("purpose="+data.get("purpose"));
					}
				}
				
		return apiPar;
	}
	
	//Mayank
	public String sendInviteVisitorLink(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		addButtonClick();
		Thread.sleep(1000);
		if (data.get("VName") != null) {
			element_InputTextUsingActionClass(vNameTxt, data.get("VName"));
		}
		if (data.get("VMobile") != null) {
			element_InputTextUsingActionClass(vMobileTxt, data.get("VMobile"));
		}
		if (data.get("VEmail") != null) {
			element_InputTextUsingActionClass(vEmailTxt, data.get("VEmail"));
		}
		if (data.get("VOrganization") != null) {
			element_InputTextUsingActionClass(vOrganizationTxt, data.get("VOrganization"));
		}
		Thread.sleep(1000);
		if (data.get("HostUserID") != null) {
			element_Clear(hostIDTxt);
			element_InputTextUsingActionClass(hostIDTxt, data.get("HostUserID"));
			element_TextBoxToClickOnTab(hostIDTxt);
		}
		Thread.sleep(1000);
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
			// element_Click(repeatVisitBtn);  Removed in V20R9.1
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
		if (data.get("AddVisitors") != null) {
			element_InputTextUsingActionClass(additionalVisitorsTxt, data.get("AddVisitors"));
		}
		//V20R8.1 - Station Linking
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
		element_Click(sendLinkBtn);
		String val = validationMessage();
		return val;
	}
	
	// Mayank
	public String copyInviteVisitorLink(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("VName"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (sendVisitorNames.size() > 0) {
				for (int j = 0; j < sendVisitorNames.size(); j++) {
					String sendVisitorName = sendVisitorNames.get(j).getText();
					System.out.println(sendVisitorName);
					ar.add(sendVisitorName);
					if (sendVisitorName.equalsIgnoreCase(data.get("VName"))) {
						sendVisitorNames.get(j).click();
						Thread.sleep(1000);
						if (data.get("VMobile") != null) {
							String mobile = vMobileTxt.getAttribute("value");
							if (mobile.equalsIgnoreCase(data.get("VMobile"))) {
								element_Click(copyIcon);
								Thread.sleep(1500);
								val = validationMessage();
								break;
							}
						} else if (data.get("VEMail") != null) {
							String email = vEmailTxt.getAttribute("value");
							if (email.equalsIgnoreCase(data.get("VEMail"))) {
								element_Click(copyIcon);
								Thread.sleep(1500);
								val = validationMessage();
								break;
							}
						} 
						
					}
				}
			}
			System.out.println(ar);
			if (!ar.contains(data.get("VName"))) {
				val = "Visitor name not found";
			}
		}
		else {
			val = "Visitor name not found";
		}
		return val;
	}
	
	public void copyLinkGetLinkAndOpenInNewTab(Map<String, String> data) throws InterruptedException {
		String copyStatus = copyInviteVisitorLink(data);
		System.out.println(copyStatus);
		String getLink = null;
		if (copyStatus.equalsIgnoreCase("Link Copied")) {
			reloadPageButtonClick();
			addButtonClick();
			waitForElementVisible(vEmailTxt);
			element_Clear(vEmailTxt);
			element_InputText(vEmailTxt, Keys.CONTROL + "v");
			element_TextBoxToClickOnTab(vEmailTxt);
			getLink = ipAddressSetInLink(vEmailTxt.getAttribute("value")) ;
			logger.debug(getLink);
			reloadPageButtonClick();
			
//			element_Clear(vNameTxt);
//			element_InputText(vNameTxt, Keys.CONTROL+ "v");
//			getLink = ipAddressSetInLink(vNameTxt.getAttribute("value")) ;
//			logger.debug("Link = "+getLink);
			
		}
		else {
			getLink = "Link is not copied - "+copyStatus;
		}
		homeButtonClick();
//		element_Click(dontSaveBtn);
		Thread.sleep(1000);
		if (!getLink.contains("Link is not copied")) {
			System.out.println("2");
			// New Tab
			Thread.sleep(1000);
			driver.switchTo().newWindow(WindowType.TAB);
			Thread.sleep(1000);
			ArrayList<String> tabs = new ArrayList<>(driver.getWindowHandles());
			driver.switchTo().window(tabs.get(1));
			// Open Url
			Thread.sleep(1500);
			driver.get(getLink.replace("https", "http"));
			Thread.sleep(2000);
			Assert.assertEquals(driver.getTitle(), data.get("Validation"));
		} else {
			Assert.assertEquals(getLink, data.get("Validation"));
		}
	}
	
	public String inviteVisitorLinkStatus(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("VName"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (sendVisitorNames.size() > 0) {
				for (int j = 0; j < sendVisitorNames.size(); j++) {
					String sendVisitorName = sendVisitorNames.get(j).getText();
					ar.add(sendVisitorName);
					if (sendVisitorName.equalsIgnoreCase(data.get("VName"))) {
						sendVisitorNames.get(j).click();
						Thread.sleep(1000);
						val = sendVisitorLinkStatus.get(j).getText();
					}
				}
			}
			if (!ar.contains(data.get("VName"))) {
				val = "Visitor name not found";
			}
		}
		else {
			val = "Visitor name not found";
		}
		return val;
	}
	
	public void deleteInviteVisitorLink(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("VName"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (sendVisitorNames.size() > 0) {
				for (int j = 0; j < sendVisitorNames.size(); j++) {
					String sendVisitorName = sendVisitorNames.get(j).getText();
					ar.add(sendVisitorName);
					if (sendVisitorName.equalsIgnoreCase(data.get("VName"))) {
						sendVisitorNames.get(j).click();
						Thread.sleep(1000);
						deleteButtonClick();
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						val = validationMessage();
						Assert.assertEquals(val, "Deleted Successfully");
					}
				}
			}
			if (!ar.contains(data.get("VName"))) {
				logger.debug("Visitor name not found"); 
			}
		}
		else {
			logger.debug("Visitor name not found"); 
		}
	}
	
	public Map<String, String> getInviteVisitorData(String vstr) throws Exception {
		pageLoadWaitng();
		Map<String, String> data=new HashMap<String, String>();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, vstr);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (sendVisitorNames.size() > 0) {
				for (int j = 0; j < sendVisitorNames.size(); j++) {
					String sendVisitorName = sendVisitorNames.get(j).getText();
					ar.add(sendVisitorName);
					if (sendVisitorName.equalsIgnoreCase(vstr)) {
						sendVisitorNames.get(j).click();
						Thread.sleep(1000);
						data.put("HostName",element_getInputControlValue(hostIDTxt));
						data.put("VisitUntilDate",element_getInputControlValue(toDtTxt));
						data.put("Link",element_getInputControlValue(toDtTxt));
						data.put("Link",copyIcon.getAttribute("alt").replace("Copy Link - ", ""));
						break;
					}
				}
			}
		}
		System.out.println(data);
		cancelButtonClick();
		return data;
	}
}
