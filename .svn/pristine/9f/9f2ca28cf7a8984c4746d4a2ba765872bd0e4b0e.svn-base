package PageObject.VisitorManagement;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
import io.cucumber.java.it.Date;

public class VisitorPreRegistrationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(VisitorPreRegistrationPO.class);

	public VisitorPreRegistrationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Mayank
	// ************************************************************************
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

	@FindBy(id = "HostUserID")
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

//	@FindBy(id = "VisitorProfile")
//	private WebElement visitorDetailsIcon;
//
//	@FindBy(xpath = "//*[@key='btnSelOK']")
//	private WebElement visitorDeatilsSavenBtn;

	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][3]")
	private List<WebElement> visitorNames;

	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][5]/i")
	private WebElement appDetails;

	@FindBy(xpath = "//*[@id='div_grd_grdApprovalDetails']//table/tbody/tr/td[not(@hidden)][2]/label")
	private WebElement appRejDate;

	@FindBy(xpath = "//*[@id='div_grd_grdApprovalDetails']//table/tbody/tr/td[not(@hidden)][3]/label")
	private WebElement appRejRemark;

	@FindBy(xpath = "//button[@class='close']")
	private WebElement closeButtonP;

	@FindBy(id = "txtStatus")
	private WebElement visitStatusTxt;

	@FindBy(id = "txtRICApproval")
	private List<WebElement> ricApprovalStatusTxtDisplayedorNot;

	@FindBy(id = "txtRICApproval")
	private WebElement ricApprovalStatusTxt;

	@FindBy(id = "txtSecClrnc")
	private List<WebElement> securityApprovalStatusTxtDisplayedorNot;

	@FindBy(id = "txtSecClrnc")
	private WebElement securityApprovalStatusTxt;

//	@FindBy(id = "RepeatVisit")
//	private WebElement repeatVisitBtn;

	@FindBy(id = "ddlRepeatMode")
	private WebElement repeatModeDD;

	@FindBy(xpath = "//*[@id='BitsCardMatrix']/li")
	private List<WebElement> repeatDays;

//	@FindBy(xpath = "//*[@default='OK']")
//	private WebElement popupOkBtn;

	@FindBy(id = "StationLocationMstName")
	private WebElement visitStationNameTxt;

	@FindBy(id = "txtVstrChkIn")
	private WebElement visitorCheckin;

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

	@FindBy(id = "txtRegID")
	private WebElement appNo;

	@FindBy(xpath = "//*[@id='RepeatVisit' and @class='cursor']")
	private List<WebElement> repDayW;

	@FindBy(xpath = "//*[@id='BitsCardMatrix']/li[contains(@style,'rgb(124, 167, 224)')]")
	private List<WebElement> repeatD;

	@FindBy(id = "btnCancel")
	public WebElement cancelButton;

	@FindBy(id = "sfdBtnDontSave")
	private List<WebElement> dontsaveBsize;
	
	@FindBy(id = "sfdBtnDontSave")
	private WebElement dontsaveB;

//	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@default='Cancel']")
//	private WebElement popupCancelBtn;

//	@FindBy(xpath="//*[@title=\"Delete (Alt+L)\"]")
//	private WebElement deleteButton;

	// *****************************
	// Via API
	// *****************************
	// Mayank
	public String visitorPreRegistrationAPI(List<String> columnHeader, List<String> apiParameter,
			Map<String, String> data, String stationId) {
		String apiPar = null;

		if (columnHeader.contains("user-type")) {
			if (data.get("user-type") != null) {
				apiParameter.add("user-type=" + data.get("user-type"));
			}
		}
		if (columnHeader.contains("visit-date")) {
			if (data.get("visit-date") != null) {
				String date = dateSelectedinddMMyyyy(data.get("visit-date"));
				apiParameter.add("visit-date=" + date);
			}
		}
		if (columnHeader.contains("visit-until-date")) {
			if (data.get("visit-until-date") != null) {
				String date = dateSelectedinddMMyyyy(data.get("visit-until-date"));
				apiParameter.add("visit-until-date=" + date);
			}
		}
		if (columnHeader.contains("visit-start-time")) {
			if (data.get("visit-start-time") != null) {
				String time = changeHoursMinutesAPI(data.get("visit-start-time"));
				apiParameter.add("visit-start-time=" + time);
			}
		}
		if (columnHeader.contains("visit-end-time")) {
			if (data.get("visit-end-time") != null) {
				String time = changeHoursMinutesAPI(data.get("visit-end-time"));
				apiParameter.add("visit-end-time=" + time);
			}
		}
		if (columnHeader.contains("visitor-name")) {
			if (data.get("visitor-name") != null) {
				apiParameter.add("visitor-name=" + data.get("visitor-name"));
			}
		}
		if (columnHeader.contains("organization-name")) {
			if (data.get("organization-name") != null) {
				apiParameter.add("organization-name=" + data.get("organization-name"));
			}
		}
		if (columnHeader.contains("mobile-no")) {
			if (data.get("mobile-no") != null) {
				apiParameter.add("mobile-no=" + data.get("mobile-no"));
			}
		}
		if (columnHeader.contains("email")) {
			if (data.get("email") != null) {
				apiParameter.add("email=" + data.get("email"));
			}
		}
		if (columnHeader.contains("host-id")) {
			if (data.get("host-id") != null) {
				apiParameter.add("host-id=" + data.get("host-id"));
			}
		}
		if (columnHeader.contains("visit-station-name")) {
			if (data.get("visit-station-name") != null) {
				apiParameter.add("visit-station-id=" + stationId);
			}
		}
		return apiPar;
	}

	// Mayank
	// *****************************
	// Visitor Preregistration
	// *****************************
	public String visitorPreregistartion(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		addButtonClick();
		Thread.sleep(1000);
		if (data.get("HostUser") != null) {
			element_Clear(hostIDTxt);
			element_dynamicDDSelect(hostIDTxt, data.get("HostUser"));
			element_TextBoxToClickOnTab(hostIDTxt);
		}
		if (data.get("VMobile") != null) {
			element_InputTextUsingActionClass(vMobileTxt, data.get("VMobile"));
		}
		if (data.get("VName") != null) {
			element_InputTextUsingActionClass(vNameTxt, data.get("VName"));
		}
		if (data.get("VOrganization") != null) {
			Thread.sleep(1200);
			element_InputTextUsingActionClass(vOrganizationTxt, data.get("VOrganization"));
			Thread.sleep(1200);
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
				if (data.get("RepeatVisitDays").equalsIgnoreCase("ALL")
						|| data.get("RepeatVisitDays").equalsIgnoreCase("All")) {
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
			// element_Click(popupOkBtn); Removed in V20R9.1
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
			Thread.sleep(1500);
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
		return val;
	}

	// *****************************
	// Verify Visit
	// *****************************
	public String verifyVisit(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("VisitorName"));
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allvisit = new ArrayList<>();
			if (visitorNames.size() > 0) {
				for (int j = 0; j < visitorNames.size(); j++) {
					String tName = visitorNames.get(j).getText();
					allvisit.add(tName);
					if (tName.equalsIgnoreCase(data.get("VisitorName"))) {
						visitorNames.get(j).click();
						Thread.sleep(1000);
						String actualVMobile = vMobileTxt.getAttribute("value");
						System.out.println(actualVMobile);
						if (actualVMobile.equalsIgnoreCase(data.get("VMobile"))) {
							val = "Visit Found";
						} else {
							val = "Visit Found but Mobile Number is different";
						}

					}
				}
			}
			if (!allvisit.contains(data.get("VisitorName"))) {
				val = "Visit Not Found";
			}
		} else {
			val = "Visit Not Found";
		}
		Thread.sleep(1000);
		return val;
	}

	// ********************************************************
	// Verify Visit Status
	// *******************************************************
	public void verifyVisitStatus(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("VName"));
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allvisit = new ArrayList<>();
			if (visitorNames.size() > 0) {
				for (int j = 0; j < visitorNames.size(); j++) {
					String tName = visitorNames.get(j).getText();
					allvisit.add(tName);
					if (tName.equalsIgnoreCase(data.get("VName"))) {
						visitorNames.get(j).click();
						Thread.sleep(1000);
						String actualVMobile = vMobileTxt.getAttribute("value");
						if (actualVMobile.equalsIgnoreCase(data.get("VMobile"))) {
							logger.debug("Visit found, Mobile no = " + data.get("VMobile"));
							if (data.get("VisitStatus") != null) {
								String actualVisitStatus = visitStatusTxt.getAttribute("value");
								String expectedVisitStatus = data.get("VisitStatus");
								Assert.assertEquals("VisitStatus = " + actualVisitStatus,
										"VisitStatus = " + expectedVisitStatus);
							}
							if (data.get("RICApprovalStatus") != null) {
								String actualricApprovalStatus = null;
								if (ricApprovalStatusTxtDisplayedorNot.size() > 0) {
									String actualricApprovalStatus1 = ricApprovalStatusTxt.getAttribute("value");
									if (actualricApprovalStatus1 != null) {
										actualricApprovalStatus = actualricApprovalStatus1.split(" ")[0];
									} else {
										actualricApprovalStatus = "Pending";
									}
								} else {
									actualricApprovalStatus = "Approved";
								}
								Assert.assertEquals("RICApprovalStatus = " + actualricApprovalStatus,
										"RICApprovalStatus = " + data.get("RICApprovalStatus"));
							}
							if (data.get("SecurityClearanceStatus") != null) {
								String actualSecurityClearanceStatus = null;
								if (securityApprovalStatusTxtDisplayedorNot.size() > 0) {
									String actualSecurityClearanceStatus1 = securityApprovalStatusTxt
											.getAttribute("value");
									if (actualSecurityClearanceStatus1 != null) {
										if (actualSecurityClearanceStatus1.split(" ")[0].matches(".*[a-zA-Z].*")) {
											actualSecurityClearanceStatus = actualSecurityClearanceStatus1
													.split(" ")[0];
										} else {
											actualSecurityClearanceStatus = "Approved";
										}
									} else {
										actualSecurityClearanceStatus = "Pending";
									}
								} else {
									actualSecurityClearanceStatus = "Approved";
								}
								Assert.assertEquals("SecurityApprovalStatus = " + actualSecurityClearanceStatus,
										"SecurityApprovalStatus = " + data.get("SecurityClearanceStatus"));
							}
						} else {
							logger.debug("Visit Found but Mobile Number is different");
							val = "Visit Found but Mobile Number is different";
							Assert.assertEquals(val, "Visitor Name and Mobile Number should be match in TC");
						}

					}
				}
			}
			if (!allvisit.contains(data.get("VName"))) {
				logger.debug("Visit Not Found, Mobile no = " + data.get("VMobile"));
				val = "Visit Not Found";
				Assert.assertEquals(val, "Visit should be found");
			}
		} else {
			logger.debug("Visit Not Found, Mobile no = " + data.get("VMobile"));
			val = "Visit Not Found";
			Assert.assertEquals(val, "Visit should be found");
		}
		if (cancelButton.isEnabled()) {
			element_Click(cancelButton);
		}
		reloadPageButtonClick();
		Thread.sleep(1000);
		if(dontsaveBsize.size()>0) {
			element_Click(dontsaveB);
			Thread.sleep(1000);
		}
	}
	
	

	// Chirag Analysis regarding Acustom alert
	public Map<String, String> getDataOfVisitorPreRegistration(String vName) throws Exception {
		Map<String, String> data = new HashMap<>();
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, vName);
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			if (visitorNames.size() > 0) {
				for (int j = 0; j < visitorNames.size(); j++) {
					String tName = visitorNames.get(j).getText();
					if (tName.equalsIgnoreCase(vName)) {
						visitorNames.get(j).click();
						Thread.sleep(1500);
						break;
					}
				}
			}

		}
		Thread.sleep(1500);
		data.put("Appointment No", element_getInputControlValue(appNo));
		data.put("HostName", element_getInputControlValue(hostIDTxt));
		data.put("Visit Date", element_getInputControlValue(fromDtTxt));
		data.put("Visit Until Date", element_getInputControlValue(toDtTxt));
		data.put("Visit Start Time", element_getInputControlValue(startTimeTxt));
		data.put("Visit End Time", element_getInputControlValue(endTimeTxt));
		data.put("Visit Station", element_getInputControlValue(visitStationNameTxt));
		data.put("MobileNo", element_getInputControlValue(vMobileTxt));
		String vstPur = element_getInputControlValue(purposeTxt);
		if (vstPur == null) {
			data.put("Visit Purpose", "");
		} else {
			data.put("Visit Purpose", vstPur);
		}
		// element_Click(repeatVisitBtn); Removed in V20R9.1
		Thread.sleep(1000);
		if (element_DropDownFirstSelectedValue(repeatModeDD).equalsIgnoreCase("Daily")) {
			data.put("DailyWeekly", "Daily");
			data.put("RepeatVisitDate", "");
		} else {
			data.put("DailyWeekly", element_DropDownFirstSelectedValue(repeatModeDD));
			if (repeatD.size() > 0) {
				String days = null;
				for (int i = 0; i < repeatD.size(); i++) {
					if (days == null) {
						days = repeatD.get(i).getText();
					} else {
						days = days + "," + repeatD.get(i).getText();
					}
				}
				data.put("RepeatVisitDate", days);
			} else {
				data.put("RepeatVisitDate", "");
			}
		}
		// element_Click(popupCancelBtn); Removed in V20R9.1
		Thread.sleep(1000);
		String checkedIn = element_getInputControlValue(visitorCheckin);
		if (checkedIn.isBlank() || checkedIn.isEmpty()) {
			data.put("DateTime", "");
		} else {
			data.put("DateTime", convertedDatetime(checkedIn));
		}
		element_Click(appDetails);
		Thread.sleep(1000);
		String appRejeTime = appRejDate.getText();
		if (appRejeTime == null) {
			data.put("approvedRejectedTime", "");
		} else {
			data.put("approvedRejectedTime", appRejeTime.replace("(", "").replace(")", ""));
		}
		String appRejeR = appRejRemark.getText();
		if (appRejeTime == null) {
			data.put("approvedRejectedRemark", "");
		} else {
			data.put("approvedRejectedRemark", appRejeR);
		}
		element_Click(closeButtonP);
		Thread.sleep(1500);
		if (element_isEnabled(cancelButton)) {
			cancelButtonClick();
		}
		System.out.println(data);
		return data;
	}

	public void deleteVisitorPreRegistration(String vName) throws Exception {

		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, vName);
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			if (visitorNames.size() > 0) {
				for (int j = 0; j < visitorNames.size(); j++) {
					String tName = visitorNames.get(j).getText();
					if (tName.equalsIgnoreCase(vName)) {
						visitorNames.get(j).click();
						Thread.sleep(1500);
						element_Click(deleteButton);
						Thread.sleep(1500);
						driver.switchTo().alert().accept();
						Thread.sleep(1500);
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
						break;
					}
				}
			}

		}
	}
}
