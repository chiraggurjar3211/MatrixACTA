package PageObject.VisitorManagement;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class VisitRequestHandlingPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(VisitRequestHandlingPO.class);
	public VisitRequestHandlingPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Mayank
	//************************************************************************
	// ***************ELEMENTS********************************************
	// ************************************************************************
	@FindBy(id = "HostUserID")
	private WebElement hostIDTxt;
	
	//Auto Transfer Setting Panel
	
	@FindBy(xpath = "//*[@default='Auto Transfer Setting']")
	private WebElement autoTransferSettingPanel;

	@FindBy(xpath = "//*[@class='anchorclick']//*[@default='Auto Transfer Setting']")
	private List<WebElement> autoTransferSettingPanelOpenOrNot;
	
	@FindBy(id = "chkEnblAutoTrnsfr")
	private WebElement enableAutoTransferVisitFlag;
	
	@FindBy(id = "TrnsHostUserID")
	private WebElement transferHostIdTxt;
	
	//Auto Approval Rejection Setting Panel
	@FindBy(xpath = "//*[@default='Auto Approval/Rejection Setting']")
	private WebElement autoApprovalRejectionSettingPanel;

	@FindBy(xpath = "//*[@class='collapsed']//*[@default='Auto Approval/Rejection Setting']")
	private List<WebElement> autoApprovalRejectionSettingPanelOpenOrNot;

	@FindBy(id = "chkEnblAutoApprv")
	private WebElement enableVisitAutoApprovalRejectionFlag;
	
	@FindBy(id = "txtWrkST")
	private WebElement workingStartTimeTxt;
	
	@FindBy(id = "txtWrkET")
	private WebElement workingEndTimeTxt;
	
	@FindBy(id = "txtBrkST")
	private WebElement breakStartTimeTxt;
	
	@FindBy(id = "txtBrkET")
	private WebElement breakEndTimeTxt;
	
	@FindBy(id = "TxtOverlappDur")
	private WebElement allowedOverlappingDurationTxt;
	
	@FindBy(id = "chkMonday")
	private WebElement mondayFlag;
	
	@FindBy(xpath = "//*[@name='chkDay1']")
	private WebElement tuesdayFlag;
	
	@FindBy(xpath = "//*[@name='chkDay2']")
	private WebElement wednesdayFlag;
	
	@FindBy(xpath = "//*[@name='chkDay3']")
	private WebElement thursdayFlag;
	
	@FindBy(xpath = "//*[@name='chkDay4']")
	private WebElement fridayFlag;
	
	@FindBy(xpath = "//*[@name='chkDay5']")
	private WebElement saturdayFlag;
	
	@FindBy(xpath = "//*[@name='chkDay6']")
	private WebElement sundayFlag;
	
	//Unavailability Days
	
	@FindBy(xpath = "//*[contains(@id,'grdUnavlblDysrow')]//*[@title='Delete']")
	private List<WebElement> unavailabilityDeleteBtns;
	
	@FindBy(xpath = "//*[@id='grdUnavlblDysrow0']//*[@title='Delete']")
	private WebElement unavailabilityDeleteBtn;
	
	@FindBy(id = "grdUnavlblDysaddBtn")
	private WebElement unavailabilitygridAddBtn;
	
	@FindBy(id = "_UnavailblDate")
	private WebElement unavailabilitygridFromDt;
	
	@FindBy(id = "Reason")
	private WebElement unavailabilitygridReason;
	
	@FindBy(xpath = "//*[@class='grid-raw-size cursor grd-prevent-rtl']//*[@id='savebtn'][not(@hidden)]")
	private WebElement gridsaveBtn;
	
	//************************************************************************
	// ***************Functions********************************************
	// ************************************************************************

	public String visitRequestHandling(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1500);
		if (data.get("HostId") != null) {
			element_Clear(hostIDTxt);
//			Thread.sleep(1000);
			element_InputTextUsingActionClass(hostIDTxt, data.get("HostId"));
			element_Click(driver.findElement(By.xpath("//html")));
			//element_dynamicDDSelect(hostIDTxt, data.get("HostId"));
//			element_TextBoxToClickOnTab(hostIDTxt);
			Thread.sleep(2000);
		}
		if (autoApprovalRejectionSettingPanelOpenOrNot.size() == 1) {
			element_Click(autoApprovalRejectionSettingPanel);
		}
		//Auto Transfer Setting Panel.
		Thread.sleep(1000);
		if (autoTransferSettingPanelOpenOrNot.size()==0) {
			element_Click(autoTransferSettingPanel);
		}
		if (data.get("EnableAutoTransferVisit") != null) {
			boolean enableAutoTransferVisit = Boolean.parseBoolean(data.get("EnableAutoTransferVisit"));
			System.out.println(enableAutoTransferVisit);
			if (enableAutoTransferVisit==true) {
				if (!enableAutoTransferVisitFlag.isSelected()) {
					element_Click(enableAutoTransferVisitFlag);
				}
			}
			else {
				if (enableAutoTransferVisitFlag.isSelected()) {
					element_Click(enableAutoTransferVisitFlag);
				}
			}
		}
		if (data.get("TransfertoUser") != null) {
			if (enableAutoTransferVisitFlag.isSelected()) {
				element_Clear(transferHostIdTxt);
				element_InputTextUsingActionClass(transferHostIdTxt, data.get("TransfertoUser"));
				element_TextBoxToClickOnTab(transferHostIdTxt);
			}
		}
		Thread.sleep(1000);
		if (autoTransferSettingPanelOpenOrNot.size()==1) {
			element_Click(autoTransferSettingPanel);
		}
		//Auto Approval Rejection Setting
		Thread.sleep(1500);
		if (autoApprovalRejectionSettingPanelOpenOrNot.size() == 1) {
			element_Click(autoApprovalRejectionSettingPanel);
		}
		if (data.get("EnableVisitAutoApprovalRejection") != null) {
			boolean enableVisitAutoApprovalRejection = Boolean.parseBoolean(data.get("EnableVisitAutoApprovalRejection"));
			if (enableVisitAutoApprovalRejection==true) {
				if (!enableVisitAutoApprovalRejectionFlag.isSelected()) {
					element_Click(enableVisitAutoApprovalRejectionFlag);
				}
			}
			else {
				if (enableVisitAutoApprovalRejectionFlag.isSelected()) {
					element_Click(enableVisitAutoApprovalRejectionFlag);
				}
			}
		}
		if (data.get("WorkingDays") != null) {
			if (mondayFlag.isEnabled()) {
			if (data.get("WorkingDays").contains(",")) {
				String[] commaSeparatedValues = data.get("WorkingDays").split(",");
				for (int i = 0; i < commaSeparatedValues.length; i++) {
					String day = commaSeparatedValues[i].trim().toUpperCase();
					if (day.equalsIgnoreCase("MON")) {
						if (!mondayFlag.isSelected()) {
							element_Click(mondayFlag);
						}
					}
					else if (day.equalsIgnoreCase("TUE")) {
						if (!tuesdayFlag.isSelected()) {
							element_Click(tuesdayFlag);
						}
					}
					else if (day.equalsIgnoreCase("WED")) {
						if (!wednesdayFlag.isSelected()) {
							element_Click(wednesdayFlag);
						}
					}
					else if (day.equalsIgnoreCase("THU")) {
						if (!thursdayFlag.isSelected()) {
							element_Click(thursdayFlag);
						}
					}
					else if (day.equalsIgnoreCase("FRI")) {
						if (!fridayFlag.isSelected()) {
							element_Click(fridayFlag);
						}
					}
					else if (day.equalsIgnoreCase("SAT")) {
						if (!saturdayFlag.isSelected()) {
							element_Click(saturdayFlag);
						}
					}
					else if (day.equalsIgnoreCase("SUN")) {
						if (!sundayFlag.isSelected()) {
							element_Click(sundayFlag);
						}
					}
				}
			}
			else {
				if (data.get("WorkingDays").toUpperCase().equalsIgnoreCase("MON")) {
					if (!mondayFlag.isSelected()) {
						element_Click(mondayFlag);
					}
				}
				else if (data.get("WorkingDays").toUpperCase().equalsIgnoreCase("TUE")) {
					if (!tuesdayFlag.isSelected()) {
						element_Click(tuesdayFlag);
					}
				}
				else if (data.get("WorkingDays").toUpperCase().equalsIgnoreCase("WED")) {
					if (!wednesdayFlag.isSelected()) {
						element_Click(wednesdayFlag);
					}
				}
				else if (data.get("WorkingDays").toUpperCase().equalsIgnoreCase("THU")) {
					if (!thursdayFlag.isSelected()) {
						element_Click(thursdayFlag);
					}
				}
				else if (data.get("WorkingDays").toUpperCase().equalsIgnoreCase("FRI")) {
					if (!fridayFlag.isSelected()) {
						element_Click(fridayFlag);
					}
				}
				else if (data.get("WorkingDays").toUpperCase().equalsIgnoreCase("SAT")) {
					if (!saturdayFlag.isSelected()) {
						element_Click(saturdayFlag);
					}
				}
				else if (data.get("WorkingDays").toUpperCase().equalsIgnoreCase("SUN")) {
					if (!sundayFlag.isSelected()) {
						element_Click(sundayFlag);
					}
				}
			}
			}
		}
		if (data.get("WorkingStartTime") != null) {
			String time = staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("WorkingStartTime"));
			element_Clear(workingStartTimeTxt);
			element_inputTextUsingActionClassCharacterOneByOne(workingStartTimeTxt, time);
		}
		if (data.get("WorkingEndTime") != null) {
			String time = staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("WorkingEndTime"));
			element_Clear(workingEndTimeTxt);
			element_inputTextUsingActionClassCharacterOneByOne(workingEndTimeTxt, time);
		}
		if (data.get("BreakStartTime") != null) {
			String time = staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("BreakStartTime"));
			element_Clear(breakStartTimeTxt);
			element_inputTextUsingActionClassCharacterOneByOne(breakStartTimeTxt, time);
		}
		if (data.get("BreakEndTime") != null) {
			String time = staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("BreakEndTime"));
			element_Clear(breakEndTimeTxt);
			element_inputTextUsingActionClassCharacterOneByOne(breakEndTimeTxt, time);
		}
		if (data.get("AllowedOverlappingDuration") != null) {
			element_Clear(allowedOverlappingDurationTxt);
			element_InputTextUsingActionClass(allowedOverlappingDurationTxt, data.get("AllowedOverlappingDuration"));
		}
		saveButtonClick();
		String val = validationMessage();
		return val;
		
	}
	
	// Unavailability Days
	public String unavailabilityDays(String hostID, List<Map<String, String>> data) throws InterruptedException {
		pageLoadWaitng();
		if (hostID != null) {
			element_Clear(hostIDTxt);
			element_InputTextUsingActionClass(hostIDTxt, hostID);
			element_TextBoxToClickOnTab(hostIDTxt);
		}
		Thread.sleep(1000);
		if (autoTransferSettingPanelOpenOrNot.size()==1) {
			element_Click(autoTransferSettingPanel);
		}
		//Auto Approval Rejection Setting
		Thread.sleep(1000);
		if (autoApprovalRejectionSettingPanelOpenOrNot.size() == 1) {
			element_Click(autoApprovalRejectionSettingPanel);
		}
		//Delete already configured grid components for newly updated configuration if any
		while (unavailabilityDeleteBtns.size()!=0) {
			element_Click(unavailabilityDeleteBtn);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
		}
		//Add components in grid
		for (int i = 0; i < data.size(); i++) {
			logger.info("Date = "+data.get(i).get("Date"));
			String date = staticDateOrPlusMinusFromCurrentDate(data.get(i).get("Date"));
			String reason = data.get(i).get("Reason");
			element_Click(unavailabilitygridAddBtn);
			Thread.sleep(1000);
			if (date != null) {
				element_Clear(unavailabilitygridFromDt);
				element_InputTextUsingActionClass(unavailabilitygridFromDt, date);
			}
			if (reason != null) {
				element_Clear(unavailabilitygridReason);
				element_InputTextUsingActionClass(unavailabilitygridReason, reason);
			}
			element_Click(gridsaveBtn);
			Thread.sleep(1000);
		}
		saveButtonClick();
		String val = validationMessage();
		return val;
	}
	
	
}
