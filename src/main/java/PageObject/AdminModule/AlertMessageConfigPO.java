package PageObject.AdminModule;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.xmlbeans.xml.stream.events.ElementTypeNames;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class AlertMessageConfigPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(AlertMessageConfigPO.class);

	public AlertMessageConfigPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// *************************************************************************************************
	// ********** Elements
	// *****************************************************************************
	// *************************************************************************************************

	@FindBy(id = "txtEventId")
	private WebElement alertEventSelection;

	@FindBy(xpath = "//*[@default='Additional Message Parameters']")
	private WebElement addMsgParameters;

	@FindBy(xpath = "//*[@class='collapsed']//*[@default='Additional Message Parameters']")
	private List<WebElement> addMsgParameterPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(@class,'sms-email-checkbox') or contains(@class,'app-whatsapp-checkbox')]//input")
	private List<WebElement> smsEmailAppNotification;

	@FindBy(id = "ddlmnth")
	private WebElement eventSelectionDD;

	@FindBy(id = "txtReminderDaysLinkExps")
	private WebElement DaysBeforeLinkExpirytext;

	@FindBy(id = "txtRemTime")
	private WebElement reminderTimetext;

	@FindBy(id = "txtRemTime2")
	private WebElement reminderTimetextnewJoining;

	@FindBy(xpath = "//*[text()='Assign Alert']")
	private WebElement assignAlert;

	@FindBy(id = "AutoUserID")
	private WebElement userIDtext;

	// Validity/Expiry Date
	@FindBy(xpath = "//*[@id='div_grd_grdIDProof']//table/tbody/tr[not(@hidden)]")
	private WebElement idProofs;

	@FindBy(id = "SendAlertFlg")
	private WebElement sendAlertForFlag;

	@FindBy(id = "DaysBefrExp")
	private WebElement daysBeforeExpirytext;

	@FindBy(id = "ReminderTime")
	private WebElement reminderTimegridtext;

	@FindBy(id = "RptReminderFlg")
	private WebElement repeatReminderflg;

	@FindBy(id = "RptInterval")
	private WebElement repeatIntervaltext;

	@FindBy(xpath = "//*[@title='OK']")
	private WebElement gridSaveBtn;

	@FindBy(id = "grdIDProofrow0")
	private WebElement visaRow;

	@FindBy(id = "grdIDProofrow1")
	private WebElement drivingLicRow;

	@FindBy(id = "grdIDProofrow2")
	private WebElement passportRow;

	// Missing In Punch - User / Incharge
	@FindBy(id = "txtduration")
	private WebElement postShiftStartMin;

	// Missing Out Punch - User / Incharge
	@FindBy(id = "txtDeduct")
	private WebElement preShiftEndMin;

	@FindBy(id = "txtAdd")
	private WebElement postShiftEndMin;

	// User Allowed
	@FindBy(id = "grdEventCheckaddBtn")
	private WebElement eventCheckAddBtn;

	@FindBy(id = "STTime")
	private WebElement eventStartTime;

	@FindBy(id = "ETTime")
	private WebElement eventEndTime;

	@FindBy(id = "ApplicableDays")
	private WebElement applicableDays;

	@FindBy(xpath = "(//*[@aria-labelledby='dropdownMenu']/li)[1]")
	private WebElement checkAll;

	@FindBy(xpath = "//*[@id='grdEventCheckrow0' and @class='cursor']")
	private List<WebElement> eventGridAddedOrNot;

	@FindBy(xpath = "//*[@title='Edit']")
	private WebElement eventGridEditBtn;

	@FindBy(id = "autoUserIDID")
	private WebElement sendAlertToUserId;

	// New Joining - Confirmation
	@FindBy(id = "txtCnfrmPer")
	private WebElement confirmationDaystext;

	@FindBy(id = "txtReminderPer")
	private WebElement setReminderDaysbeforeConfirmationtext;

	// Birthday Greetings
	@FindBy(id = "txtEmail")
	private WebElement additionalRecipientstext;

	@FindBy(id = "txtGTScheduleTime")
	private WebElement scheduleTimetext;

	@FindBy(id = "chkGroup")
	private WebElement groupFlag;

	// Health Declaration Pending
	@FindBy(xpath = "//*[@id='cmbAlertAsPer']")
	private WebElement sendAlertAsPerDD;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@class='col-md-6']//input")
	private List<WebElement> scheduleDaysFlags;

	// Identification Server Inactive
	@FindBy(id = "txtTolerenceTime")
	private WebElement tolerancePeriodMintext;

	@FindBy(xpath = "//*[@key='btnApply']")
	private WebElement assignUserBtn;

	// Pending Applications For Approval
	@FindBy(id = "cmbsetreminder")
	private WebElement setreminderDD;

	@FindBy(id = "txtReminderTime")
	private WebElement reminderTimetext2;

	// Leave Application
	@FindBy(id = "chkApprvlMail")
	private WebElement approvalLinks;

	@FindBy(xpath = "//*[@id='TEvtApprvlAckMail']")
	private WebElement approvalAcknowledgment;

	@FindBy(xpath = "//*[@id='TEvtIncAttachment1']")
	private WebElement includeAttachment;

	// Leave Credit / Debit
	@FindBy(id = "flgRptInch")
	private WebElement alertReportingInCharge;

	// Send Alert TO checkboxes
	@FindBy(xpath = "//*[@id='collapseOne']//*[@class='col-md-6 col-sm-12']//input[@type='checkbox' and @class='ng-untouched ng-pristine ng-valid']")
	private List<WebElement> sendAlertToFlags;

	@FindBy(xpath = "//*[text()=\"Send Alert To\"]/ancestor::div[@class=\"form-group\"]//*[@type=\"checkbox\"]")
	private List<WebElement> sendAlertToFlagsusingSend;

	// Send Alert TO checkboxes for Contractor Validity
	@FindBy(xpath = "//*[@id='collapseOne']//*[@class='col-md-6 col-sm-12']//input[@type='checkbox' and @class='ng-untouched ng-pristine ng-valid']")
	private List<WebElement> sendAlertToFlagsContractorValidity;

	// Send Alert TO checkboxes for Visitor
	@FindBy(xpath = "//*[@id='collapseOne']//*[@class='col-md-6 col-sm-12']//input[@type='checkbox' and @class='ng-untouched ng-pristine ng-valid']")
	private List<WebElement> sendAlertToFlagsVisitor;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@class='col-md-6 col-sm-12']//input[@type='checkbox' and @class='ng-untouched ng-pristine ng-valid']")
	private List<WebElement> sendAlertToFlagsVisitorCreateVisitWB;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@class='col-md-6 col-sm-12']//input[@type='checkbox' and @class='ng-untouched ng-pristine ng-valid']")
	private List<WebElement> sendAlertToFlagsVisitorFormExecution;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@class='form-group ng-scope']//*[@ng-repeat='data in pgObj.DataSourceGroup']/label/input")
	private List<WebElement> groupCheckboxes;

	// APTA Auto SignIn
	@FindBy(xpath = "//*[text()='Send Alert']")
	private WebElement sendAlert;

	@FindBy(xpath = "//*[@key='Send']")
	private WebElement sendAlertBtn;

	// Monthly Attendance
	@FindBy(id = "chkShowMonthlyLvBal")
	private WebElement showMonthlyLeaveBalFlag;

	// Shift Change
	@FindBy(id = "chkNrmlSFT")
	private WebElement alertForNormalShiftFlag;

	@FindBy(id = "chkFBSFT")
	private WebElement alertForFBShiftFlag;

	@FindBy(id = "chkRDSFT")
	private WebElement alertForRDShiftFlag;

	// Attendance Exception
	@FindBy(xpath = "//*[@name='chkSelectAll']")
	private WebElement exceptionsFlagSelectAll;

	// Ot Coff Authorization
	@FindBy(id = "ddlmnth")
	private WebElement eventSelectionDD2;

//	@FindBy(xpath = "//*[@title='Edit (Alt+E)']")
//	private WebElement editButton;

	// Schedule Unavailable
	@FindBy(id = "txtReminderPeriod")
	private WebElement reminderPeriod;

	// CWM Contractor Validity
	@FindBy(xpath = "//*[@id='grid1']//*[@title='Edit']")
	private WebElement gridediticon;

	@FindBy(id = "autoCWMContractorID")
	private WebElement contractorIDtxt;

	@FindBy(xpath = "//*[contains(@id,'grdUsrContractorAlertConfigrow')]//*[@title='Delete']")
	private List<WebElement> gridDeleteBtns;

	@FindBy(xpath = "//*[@id='grdUsrContractorAlertConfigrow0']//*[@title='Delete']")
	private WebElement gridDeleteBtn;

	// Visitor Management
	@FindBy(xpath = "//*[@id='chkRepInch']")
	private WebElement calendarInvite;

	@FindBy(id = "txtExpiryReminder")
	private WebElement expiryRemindertxt;

	@FindBy(xpath = "//*[@id='flgQRCode2']")
	private WebElement visitorPassBarcodeFlag;

	@FindBy(xpath = "//*[@id='flgQRCode1']")
	private WebElement visitorPassQRFlag;

	@FindBy(id = "txtReminderHours")
	private WebElement reminderPriorHoursTxt;

	@FindBy(id = "txtReminderDays")
	private WebElement reminderPriorDaysTxt;

	@FindBy(xpath = "//*[@default='Message Preview']")
	private WebElement messagePriviewTab;

	@FindBy(xpath = "(//*[contains(text(),'Mail')]/ancestor::div[contains(@class,'alert-message-config-header-label')][1]/following::div/a)[1]")
	private WebElement mailContentClick;

	@FindBy(xpath = "(//*[contains(text(),'Mail')]/ancestor::div[contains(@class,'alert-message-config-header-label')][1]/following::div/a)[2]")
	private List<WebElement> mailContent2size;

	@FindBy(xpath = "(//*[contains(text(),'Mail')]/ancestor::div[contains(@class,'alert-message-config-header-label')][1]/following::div/a)[2]")
	private WebElement mailContent2Click;

	@FindBy(xpath = "(//*[contains(text(),'Mail')]/ancestor::div[contains(@class,'alert-message-config-header-label')][1]/following::div/a)[3]")
	private List<WebElement> mailContent3size;

	@FindBy(xpath = "(//*[contains(text(),'Mail')]/ancestor::div[contains(@class,'alert-message-config-header-label')][1]/following::div/a)[3]")
	private WebElement mailContent3Click;

	@FindBy(xpath="(//*[contains(text(),'Mail')])[2]/ancestor::div[1]/following-sibling::div[@class=\"form-group\"]//a")
	private WebElement contractorDetailsAlertM;
	
	@FindBy(xpath="((//*[@class=\"panel-body no-padding word-break\"]//*[contains(text(),'SMS')])[2]/ancestor::div[1]/following-sibling::div[@class=\"form-group\"]//a)[1]")
	private WebElement contractorDetailsAlertSMM;
	
	@FindBy(xpath="(//*[@class=\"panel-body no-padding word-break\"]//*[contains(text(),'WhatsApp')])[2]/ancestor::div[1]/following-sibling::div//a")
	private WebElement contractorDetailsAlertWats;
	
	@FindBy(id = "txtMessage")
	private WebElement mailTextMessage;

	@FindBy(id = "btnDefault")
	private WebElement mailDefaultButton;

	@FindBy(id = "btnClosechangeMessage")
	private WebElement mailOKButton;

	// Assign user panel
	@FindBy(id = "cboUser")
	private WebElement selectUserDD;

	@FindBy(xpath = "//*[@id='groupList']")
	private WebElement selectGroupDD;

	@FindBy(id = "grpname")
	private WebElement groupNameTxt;

	@FindBy(xpath = "//*[@class='row autocomplete']//button[@class='btn']")
	private WebElement groupSelectPicklist;

	@FindBy(xpath = "//*[@gridname='grouppicklist']//*[@name='cmnTxtSearch']")
	private WebElement groupSelectPicklistSearchbar;

	@FindBy(xpath = "//*[@gridname='grouppicklist']//*[@class='grid-raw-size']//*[@type='checkbox']")
	private WebElement groupSelectPicklistSelectAll;

	@FindBy(xpath = "//*[@value='OK']")
	private WebElement groupSelectPicklistOkBtn;

	@FindBy(xpath = "//*[@class='checkbox-label']/*[@type='label']")
	private List<WebElement> documentlist;

	@FindBy(xpath = "//*[@default='Add']")
	private WebElement addBtn;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@class='col-md-6 col-sm-12']//input[@type='checkbox' and @class='ng-untouched ng-pristine ng-valid']")
	private List<WebElement> sendAlertToFlagsContractorDetails;

	@FindBy(xpath = "(//*[contains(text(),'SMS')]/ancestor::div[contains(@class,'alert-message-config-header-label')][1]/following::div/a)[1]")
	private WebElement sms;

	@FindBy(xpath = "(//*[contains(text(),'SMS')]/ancestor::div[contains(@class,'alert-message-config-header-label')][1]/following::div/a)[2]")
	private WebElement sms2;

	@FindBy(xpath = "(//*[contains(text(),'SMS')]/ancestor::div[contains(@class,'alert-message-config-header-label')][1]/following::div/a)[3]")
	private WebElement sms3;

	@FindBy(xpath = "(//*[contains(text(),'WhatsApp')]/ancestor::div[contains(@class,'alert-message-config-header-label')][1]/following::div/a)[1]")
	private WebElement whatsAPPP;

	@FindBy(xpath = "(//*[contains(text(),'WhatsApp')]/ancestor::div[contains(@class,'alert-message-config-header-label')][1]/following::div/a)[2]")
	private WebElement whatsAPPP2;

	@FindBy(xpath = "(//*[contains(text(),'WhatsApp')]/ancestor::div[contains(@class,'alert-message-config-header-label')][1]/following::div/a)[3]")
	private WebElement whatsAPPP3;

	// All Functions are Created by Mayank
	// *************************************************************************************************
	// ********** All Functions
	// *****************************************************************************
	// *************************************************************************************************
	public void alertParametersConfiguration(String alertName, Map<String, String> data) throws InterruptedException {
		switch (alertName) {
		// User
		case "User Events":
			String actual1 = additionalParametersUserEvents(data.get("EventSelection"));
			Assert.assertEquals(actual1, "Saved Successfully");
			break;

		case "Invite User":
			String actual2 = additionalParametersInviteUser(data.get("DaysBeforeLinkExpiry"), data.get("ReminderTime"));
			Assert.assertEquals(actual2, "Saved Successfully");
			break;

		case "Validity/Expiry Date":
			boolean sendAlertFor1 = Boolean.parseBoolean(data.get("SendAlertFor"));
			boolean repeatReminder1 = Boolean.parseBoolean(data.get("RepeatReminder"));
			String actual3 = additionalParametersValidityExpiryDate(sendAlertFor1, data.get("Document"),
					data.get("DaysBeforeExpiry"), data.get("ReminderTime"), repeatReminder1,
					data.get("RepeatIntervalInDays"));
			Assert.assertEquals(actual3, "Saved Successfully");
			break;

		case "Missing In Punch - Users":
			String actual4 = additionalParametersMissingInPunchUsersReportingIncharges(data.get("PostShiftStart"));
			Assert.assertEquals(actual4, "Saved Successfully");
			break;

		case "Missing In Punch - Group Incharge":
			String actual5 = additionalParametersMissingInPunchUsersReportingIncharges(data.get("PostShiftStart"));
			Assert.assertEquals(actual5, "Saved Successfully");
			break;

		case "Missing Out Punch - Users":
			String actual6 = additionalParametersMissingOutPunchUsersReportingIncharges(data.get("PreShiftEnd"),
					data.get("PostShiftEnd"));
			Assert.assertEquals(actual6, "Saved Successfully");
			break;

		case "Missing Out Punch - Group Incharge":
			String actual7 = additionalParametersMissingOutPunchUsersReportingIncharges(data.get("PreShiftEnd"),
					data.get("PostShiftEnd"));
			Assert.assertEquals(actual7, "Saved Successfully");
			break;

		case "User Allowed":
			String actual8 = additionalParametersUserAllowedDenied(data.get("StartTime"), data.get("EndTime"),
					data.get("SendAlertToUser"));
			Assert.assertEquals(actual8, "Saved Successfully");
			break;

		case "User Denied":
			String actual9 = additionalParametersUserAllowedDenied(data.get("StartTime"), data.get("EndTime"),
					data.get("SendAlertToUser"));
			Assert.assertEquals(actual9, "Saved Successfully");
			break;

		case "New Joining - Confirmation":
			String actual10 = additionalParametersNewJoiningConfirmation(data.get("Confirmation"),
					data.get("SetReminderDaysbeforeConfirmation"), data.get("ReminderTime"), data.get("UserID"));
			Assert.assertEquals(actual10, "Saved Successfully");
			break;

		case "Birthday Greetings":
			String actual11 = additionalParametersBirthdayGreetings(data.get("AdditionalRecipients"),
					data.get("ScheduleTime"));
			Assert.assertEquals(actual11, "Saved Successfully");
			break;

		case "Health Declaration Pending":
			String actual12 = additionalParametersHealthDeclarationPending(data.get("SendAlertAsPer"),
					data.get("ScheduleTime"), data.get("PostShiftStart"));
			Assert.assertEquals(actual12, "Saved Successfully");
			break;

		case "User Onboarding - Schedule Time":
			String actual13 = additionalParametersUserOnboardingScheduleTime(data.get("ScheduleTime"));
			Assert.assertEquals(actual13, "Saved Successfully");
			break;

		// System
		case "Identification Server Inactive":
			String actual14 = additionalParametersIdentificationServerInactive(data.get("StartTime"),
					data.get("EndTime"), data.get("TolerancePeriodMin"), data.get("UserID"));
			Assert.assertEquals(actual14, "Saved Successfully");
			break;

		case "Pending Applications For Approval":
			String actual15 = additionalParametersPendingAppForApproval(data.get("SetReminder"),
					data.get("ReminderTime"));
			Assert.assertEquals(actual15, "Saved Successfully");
			break;

		// Leave Management
		case "Leave Application": // Leave Application & Leave Cancellation Application & Leave Modification
									// Application are same we can merge cases
			boolean approvalLinks1 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment1 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			boolean includeAttachment1 = Boolean.parseBoolean(data.get("IncludeAttachment"));
			String actual16 = additionalParametersLeaveApplication(approvalLinks1, approvalAcknowledgment1,
					includeAttachment1);
			Assert.assertEquals(actual16, "Saved Successfully");
			break;

		case "Leave Cancellation Application":
			boolean approvalLinks2 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment2 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			boolean includeAttachment2 = Boolean.parseBoolean(data.get("IncludeAttachment"));
			String actual17 = additionalParametersLeaveApplication(approvalLinks2, approvalAcknowledgment2,
					includeAttachment2);
			Assert.assertEquals(actual17, "Saved Successfully");
			break;

		case "Leave Modification Application":
			boolean approvalLinks3 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment3 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			boolean includeAttachment3 = Boolean.parseBoolean(data.get("IncludeAttachment"));
			String actual18 = additionalParametersLeaveApplication(approvalLinks3, approvalAcknowledgment3,
					includeAttachment3);
			Assert.assertEquals(actual18, "Saved Successfully");
			break;

		case "Leave Credit/Debit":
			boolean alertReportingInCharge1 = Boolean.parseBoolean(data.get("AlertReportingInCharge"));
			String actual19 = additionalParametersLeaveCreditDebit(alertReportingInCharge1);
			Assert.assertEquals(actual19, "Saved Successfully");
			break;

		// Device
		case "Door Offline":
			String actual20 = additionalParametersDoorOffline(data.get("StartTime"), data.get("EndTime"),
					data.get("TolerancePeriodSec"), data.get("SendAlertToUser"));
			Assert.assertEquals(actual20, "Saved Successfully");
			break;

		// Time Attendance
		case "Monthly Attendance":
			boolean showMonthlyLeaveBal1 = Boolean.parseBoolean(data.get("ShowMonthlyLeaveBal"));
			String actual21 = additionalParametersMonthlyAttendance(showMonthlyLeaveBal1);
			Assert.assertEquals(actual21, "Saved Successfully");
			break;

		case "Attendance Correction Application": // Attendance Correction Application, Short Leave/Official Hours
													// Application, Event Authorization, Advance Overtime
													// Application are same we can merge cases
			boolean approvalLinks4 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment4 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual22 = additionalParametersAttendanceApplication(approvalLinks4, approvalAcknowledgment4);
			Assert.assertEquals(actual22, "Saved Successfully");
			break;

		case "Short Leave/Official Hours Application":
			boolean approvalLinks5 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment5 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual23 = additionalParametersAttendanceApplication(approvalLinks5, approvalAcknowledgment5);
			Assert.assertEquals(actual23, "Saved Successfully");
			break;

		case "Event Authorization":
			boolean approvalLinks6 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment6 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual24 = additionalParametersAttendanceApplication(approvalLinks6, approvalAcknowledgment6);
			Assert.assertEquals(actual24, "Saved Successfully");
			break;

		case "Advance Overtime Application":
			boolean approvalLinks7 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment7 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual25 = additionalParametersAttendanceApplication(approvalLinks7, approvalAcknowledgment7);
			Assert.assertEquals(actual25, "Saved Successfully");
			break;

		case "Shift Change":
			boolean alertForNormalShift = Boolean.parseBoolean(data.get("AlertForNormalShift"));
			boolean alertForFBShift = Boolean.parseBoolean(data.get("AlertForFBShift"));
			boolean alertForRDShift = Boolean.parseBoolean(data.get("AlertForRDShift"));
			String actual26 = additionalParametersShiftChange(alertForNormalShift, alertForFBShift, alertForRDShift);
			Assert.assertEquals(actual26, "Saved Successfully");
			break;

		case "Overtime/C-OFF Authorization":
			String actual27 = additionalParametersOTCOFFAuth(data.get("ScheduleTime"), data.get("ProcessingPeriod"));
			Assert.assertEquals(actual27, "Saved Successfully");
			break;

		case "Overtime Limit Exceeded - User":
			String actual28 = additionalParametersOTCOFFAuth(data.get("ScheduleTime"), data.get("ProcessingPeriod"));
			Assert.assertEquals(actual28, "Saved Successfully");
			break;

		case "Overtime Limit Exceeded - Group Incharge":
			String actual29 = additionalParametersOTCOFFAuth(data.get("ScheduleTime"), data.get("ProcessingPeriod"));
			Assert.assertEquals(actual29, "Saved Successfully");
			break;

		case "Attendance Exception":
			String actual30 = additionalParametersAtdException(data);
			Assert.assertEquals(actual30, "Saved Successfully");
			break;

		// Job Processing and Costing
		case "Award/Penalty Application":
			boolean approvalLinks8 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment8 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual31 = additionalParametersAttendanceApplication(approvalLinks8, approvalAcknowledgment8);
			Assert.assertEquals(actual31, "Saved Successfully");
			break;

		// FVM - Schedule Unavailable - Users
		case "Schedule Unavailable - Users":
			String actual32 = additionalParametersScheduleUnavailable(data.get("SetReminder"), data.get("ReminderTime"),
					data.get("RemPeriodDaysBefSchDate"));
			Assert.assertEquals(actual32, "Saved Successfully");
			break;

		// FVM - Schedule Unavailable - Incharge
		case "Schedule Unavailable - Group Incharge":
			String actual33 = additionalParametersScheduleUnavailable(data.get("SetReminder"), data.get("ReminderTime"),
					data.get("RemPeriodDaysBefSchDate"));
			Assert.assertEquals(actual33, "Saved Successfully");
			break;

		// CWM
		case "Contractor Validity":
			String actual34 = additionalParametersContractorValidity(data.get("DaysBeforeValEndDate"),
					data.get("ReminderTime"), data.get("RepeatReminder"), data.get("RepeatIntervalDays"),
					data.get("UserID"), data.get("ContractorID"), data);
			Assert.assertEquals(actual34, "Saved Successfully");
			break;

		case "Work Order Expiry":
			String actual35 = additionalParametersWorkOrderExpiry(data.get("SendReminder"), data.get("ReminderTime"),
					data.get("SetRemDaysBeforeValEnd"));
			Assert.assertEquals(actual35, "Saved Successfully");
			break;

		case "Worker Induction":
			boolean approvalLinks9 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment9 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual36 = additionalParametersAttendanceApplication(approvalLinks9, approvalAcknowledgment9);
			Assert.assertEquals(actual36, "Saved Successfully");
			break;

		case "Worker Assignment":
			String actual37 = additionalParametersOTCOFFAuth(data.get("ScheduleTime"), data.get("ProcessingPeriod"));
			Assert.assertEquals(actual37, "Saved Successfully");
			break;

		case "Worker Approval":
			String actual38 = additionalParametersOTCOFFAuth(data.get("ScheduleTime"), data.get("ProcessingPeriod"));
			Assert.assertEquals(actual38, "Saved Successfully");
			break;

		// Visitor Management
		case "Visitor Pre-Registration":
			boolean calendarInvite10 = Boolean.parseBoolean(data.get("CalendarInvite"));
			boolean approvalLinks10 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment10 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual39 = additionalParametersVisitorPreregistration(calendarInvite10, approvalLinks10,
					approvalAcknowledgment10);
			Assert.assertEquals(actual39, "Saved Successfully");
			break;

		case "Visitor Pass Expiry Reminder":
			String actual40 = additionalParametersVisitorPassExpiryReminder(data.get("ExpiryReminderMinutes"));
			Assert.assertEquals(actual40, "Saved Successfully");
			break;

		case "Visitor Pass Expired":
			String actual41 = additionalParametersVisitorPassExpiryReminder(data.get("ReminderPeriodMin"));
			Assert.assertEquals(actual41, "Saved Successfully");
			break;

		case "Security Clearance":
			boolean approvalLinks11 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment11 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual42 = additionalParametersAttendanceApplication(approvalLinks11, approvalAcknowledgment11);
			Assert.assertEquals(actual42, "Saved Successfully");
			break;

		case "Visit Transfer":
			boolean calendarInvite12 = Boolean.parseBoolean(data.get("CalendarInvite"));
			boolean approvalLinks12 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment12 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual43 = additionalParametersVisitorPreregistration(calendarInvite12, approvalLinks12,
					approvalAcknowledgment12);
			Assert.assertEquals(actual43, "Saved Successfully");
			break;

		case "Visitor Pass":
			boolean qrcode = Boolean.parseBoolean(data.get("QR"));
			boolean barcode = Boolean.parseBoolean(data.get("Barcode"));
			String actual44 = additionalParametersVisitorPass(qrcode, barcode);
			Assert.assertEquals(actual44, "Saved Successfully");
			break;

		case "Visit State Change":
			boolean calendarInvite13 = Boolean.parseBoolean(data.get("CalendarInvite"));
			boolean approvalLinks13 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment13 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual45 = additionalParametersVisitorPreregistration(calendarInvite13, approvalLinks13,
					approvalAcknowledgment13);
			Assert.assertEquals(actual45, "Saved Successfully");
			break;

		case "Visitor - Login without OTP":
			boolean approvalLinks14 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment14 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual46 = additionalParametersAttendanceApplication(approvalLinks14, approvalAcknowledgment14);
			Assert.assertEquals(actual46, "Saved Successfully");
			break;

		case "Visit Reminder":
			String actual47 = additionalParametersVisitReminder(data.get("ReminderPriorHours"),
					data.get("ReminderPriorDays"));
			Assert.assertEquals(actual47, "Saved Successfully");
			break;

		case "Visitor Pre-registration Approval/Rejection":
			boolean approvalLinks15 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment15 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual48 = additionalParametersAttendanceApplication(approvalLinks15, approvalAcknowledgment15);
			Assert.assertEquals(actual48, "Saved Successfully");
			break;

		// Mayank - V20R9.1
		case "Shift Change Application":
			boolean approvalLinks16 = Boolean.parseBoolean(data.get("ApprovalLinks"));
			boolean approvalAcknowledgment16 = Boolean.parseBoolean(data.get("ApprovalAcknowledgment"));
			String actual49 = additionalParametersAttendanceApplication(approvalLinks16, approvalAcknowledgment16);
			Assert.assertEquals(actual49, "Saved Successfully");
			break;

		case "Contractor Details Alert":
			boolean sendAlertFor17 = Boolean.parseBoolean(data.get("SendAlertFor"));
			boolean repeatReminder17 = Boolean.parseBoolean(data.get("RepeatReminder"));
			String actual50 = additionalParametersValidityExpiryDate(sendAlertFor17, data.get("Document"),
					data.get("DaysBeforeExpiry"), data.get("ReminderTime"), repeatReminder17,
					data.get("RepeatIntervalInDays"));
			Assert.assertEquals(actual50, "Saved Successfully");
			break;

		default:
			logger.debug("Alert Configuration Code is Pending or Alert Name is incorrect --Mayank");
			break;
		}
	}

	// *************************************************************************************************
	// ********** Alert Selection
	// **********************************************************************
	// *************************************************************************************************
	public void alertEventSelection(String event) throws InterruptedException {
		waitForElementVisible(alertEventSelection);
		element_DropDownSelectByvisibleText(alertEventSelection, event);
		Thread.sleep(1000);
	}

	// *************************************************************************************************
	// ********** Alert Message Selection SMS/Email/AppNotification
	// ************************************
	// *************************************************************************************************
	public String messageSelection() throws InterruptedException {
		waitForElementVisible(addMsgParameters);
		Thread.sleep(1500);
		element_Click(addMsgParameters);
		Thread.sleep(500);
		for (int i = 0; i < smsEmailAppNotification.size(); i++) {
			WebElement ele = smsEmailAppNotification.get(i);
			if (!ele.isSelected()) {
				element_Click(smsEmailAppNotification.get(i));
			}
			Thread.sleep(500);
		}
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Click on Additional Message Parameters
	// ************************************
	// *************************************************************************************************
	public void clickOnAdditionalMsgParameters() throws InterruptedException {
		waitForElementVisible(addMsgParameters);
		Thread.sleep(500);
		if (element_isEnabled(editButton)) {
			editButtonClick();
		}
		if (addMsgParameterPanelOpenOrNot.size() > 0) {
			element_Click(addMsgParameters);
		}
		Thread.sleep(1000);
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - User
	// Events************************************
	// *************************************************************************************************
	public String additionalParametersUserEvents(String eventSelection) throws InterruptedException {
		element_DropDownSelectByvisibleText(eventSelectionDD, eventSelection);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - Invite
	// User************************************
	// *************************************************************************************************
	public String additionalParametersInviteUser(String DaysBeforeLinkExpiry, String ReminderTime)
			throws InterruptedException {
		element_Clear(DaysBeforeLinkExpirytext);
		element_InputTextUsingActionClass(DaysBeforeLinkExpirytext, DaysBeforeLinkExpiry);
		String rtime = staticTimeOrPlusMinusMinutesFromCurrentTime(ReminderTime);
		element_Clear(reminderTimetext);
		element_inputTextUsingActionClassCharacterOneByOne(reminderTimetext, rtime);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - Validity Expiry
	// Date************************************
	// *************************************************************************************************
	public String additionalParametersValidityExpiryDate(Boolean sendAlertFor, String document, String daysBeforeExpiry,
			String reminderTime, Boolean repeatReminder, String repeatIntervalInDays) throws InterruptedException {

		if (document.equalsIgnoreCase("Visa")) {
			element_Click(visaRow);
		} else if (document.equalsIgnoreCase("Driving License")) {
			element_Click(drivingLicRow);
		} else if (document.equalsIgnoreCase("Passport")) {
			element_Click(passportRow);
		} else if (document.equalsIgnoreCase("Adhar")) {
			element_Click(visaRow); // First row
		} else {
			logger.debug("Mentioned Document is not found");
		}

		if (sendAlertFor == true) {
			if (!sendAlertForFlag.isSelected()) {
				element_Click(sendAlertForFlag);
			}
		} else {
			if (sendAlertForFlag.isSelected()) {
				element_Click(sendAlertForFlag);
			}
		}
		element_Clear(daysBeforeExpirytext);
		element_InputTextUsingActionClass(daysBeforeExpirytext, daysBeforeExpiry);
		String rtime = changeHoursMinutes(reminderTime);
		element_Clear(reminderTimegridtext);
		element_inputTextUsingActionClassCharacterOneByOne(reminderTimegridtext, rtime);
		if (repeatReminder == true) {
			if (!repeatReminderflg.isSelected()) {
				element_Click(repeatReminderflg);
			}
		} else {
			if (repeatReminderflg.isSelected()) {
				element_Click(repeatReminderflg);
			}
		}
		element_Clear(repeatIntervaltext);
		element_InputTextUsingActionClass(repeatIntervaltext, repeatIntervalInDays);
		Thread.sleep(1000);
//			element_Click(gridSaveBtn);
//			Thread.sleep(1000);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - Missing In Punch - Users /
	// ReportingIncharges************************************
	// *************************************************************************************************
	public String additionalParametersMissingInPunchUsersReportingIncharges(String postShiftStart)
			throws InterruptedException {
		element_Clear(postShiftStartMin);
		element_InputTextUsingActionClass(postShiftStartMin, postShiftStart);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters -Missing Out Punch - Users /
	// ReportingIncharges************************************
	// *************************************************************************************************
	public String additionalParametersMissingOutPunchUsersReportingIncharges(String preShiftEnd, String postShiftEnd)
			throws InterruptedException {
		element_Clear(preShiftEndMin);
		element_InputTextUsingActionClass(preShiftEndMin, preShiftEnd);
		element_Clear(postShiftEndMin);
		element_InputTextUsingActionClass(postShiftEndMin, postShiftEnd);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters -User Allowed /
	// Denied************************************
	// *************************************************************************************************
	public String additionalParametersUserAllowedDenied(String startTime, String endTime, String sendAlertToUser)
			throws InterruptedException {
		if (eventGridAddedOrNot.size() > 0) {
			element_Click(eventGridEditBtn);
		} else {
			element_Click(eventCheckAddBtn);
		}
		String stime = changeHoursMinutes(startTime);
		element_Clear(eventStartTime);
		element_inputTextUsingActionClassCharacterOneByOne(eventStartTime, stime);
		Thread.sleep(500);
		String etime = changeHoursMinutes(endTime);
		element_Clear(eventEndTime);
		element_inputTextUsingActionClassCharacterOneByOne(eventEndTime, etime);
		element_Click(applicableDays);
		if (element_GetText(checkAll).equalsIgnoreCase("Check All")) {
			element_Click(checkAll);
		}
		element_Click(gridSaveBtn);
		Thread.sleep(1000);
		element_Click(assignAlert);
		Thread.sleep(500);
		element_Clear(sendAlertToUserId);
		element_InputTextUsingActionClass(sendAlertToUserId, sendAlertToUser);
		element_TextBoxToClickOnTab(sendAlertToUserId);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters -New Joining -
	// Confirmation************************************
	// *************************************************************************************************
	public String additionalParametersNewJoiningConfirmation(String confirmation,
			String setReminderDaysbeforeConfirmation, String reminderTime, String sendAlertTo)
			throws InterruptedException {
		element_Clear(confirmationDaystext);
		element_InputTextUsingActionClass(confirmationDaystext, confirmation);
		element_Clear(setReminderDaysbeforeConfirmationtext);
		element_InputTextUsingActionClass(setReminderDaysbeforeConfirmationtext, setReminderDaysbeforeConfirmation);
		String rtime = changeHoursMinutes(reminderTime);
		element_Clear(reminderTimetextnewJoining);
		element_inputTextUsingActionClassCharacterOneByOne(reminderTimetextnewJoining, rtime);
		Thread.sleep(1000);
		element_Click(assignAlert);
		Thread.sleep(500);
		element_Clear(sendAlertToUserId);
		element_dynamicDDSelect(sendAlertToUserId, sendAlertTo);
		element_TextBoxToClickOnTab(sendAlertToUserId);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters -Birthday
	// Greetings************************************
	// *************************************************************************************************
	public String additionalParametersBirthdayGreetings(String additionalRecipients, String scheduleTime)
			throws InterruptedException {
		element_Clear(additionalRecipientstext);
		element_InputTextUsingActionClass(additionalRecipientstext, additionalRecipients);
		String stime = changeHoursMinutes(scheduleTime);
		element_Clear(scheduleTimetext);
		element_inputTextUsingActionClassCharacterOneByOne(scheduleTimetext, stime);
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - Health Declaration
	// Pending************************************
	// *************************************************************************************************
	public String additionalParametersHealthDeclarationPending(String sendAlertAsPer, String scheduleTime,
			String postShiftTime) throws InterruptedException {
		element_DropDownSelectByvisibleText(sendAlertAsPerDD, sendAlertAsPer);
		if (sendAlertAsPer.equalsIgnoreCase("Schedule Time")) {
			String stime = changeHoursMinutes(scheduleTime);
			element_Clear(scheduleTimetext);
			element_inputTextUsingActionClassCharacterOneByOne(scheduleTimetext, stime);
			for (int i = 0; i < scheduleDaysFlags.size(); i++) {
				WebElement ele = scheduleDaysFlags.get(i);
				if (!ele.isSelected()) {
					ele.click();
				}
			}
		} else {
			element_Clear(postShiftStartMin);
			element_inputTextUsingActionClassCharacterOneByOne(postShiftStartMin, postShiftTime);
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - User Onboarding - Schedule
	// Time************************************
	// *************************************************************************************************
	public String additionalParametersUserOnboardingScheduleTime(String scheduleTime) throws InterruptedException {
		String stime = staticTimeOrPlusMinusMinutesFromCurrentTime(scheduleTime);
		element_Clear(scheduleTimetext);
		element_inputTextUsingActionClassCharacterOneByOne(scheduleTimetext, stime);
		for (int i = 0; i < scheduleDaysFlags.size(); i++) {
			WebElement ele = scheduleDaysFlags.get(i);
			if (!ele.isSelected()) {
				ele.click();
			}
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - Identification Server
	// Inactive************************************
	// *************************************************************************************************
	public String additionalParametersIdentificationServerInactive(String startTime, String endTime,
			String tolerancePeriodMin, String userID) throws InterruptedException {
		if (eventGridAddedOrNot.size() == 0) {
			element_Click(eventCheckAddBtn);
		} else {
			element_Click(eventGridEditBtn);
		}
		element_Clear(eventStartTime);
		element_inputTextUsingActionClassCharacterOneByOne(eventStartTime, startTime);
		Thread.sleep(500);
		element_Clear(eventEndTime);
		element_inputTextUsingActionClassCharacterOneByOne(eventEndTime, endTime);
		element_Click(applicableDays);
		if (element_GetText(checkAll).equalsIgnoreCase("Check All")) {
			element_Click(checkAll);
		}
		element_Click(gridSaveBtn);
		Thread.sleep(500);
		element_Clear(tolerancePeriodMintext);
		element_InputTextUsingActionClass(tolerancePeriodMintext, tolerancePeriodMin);
		element_Click(assignAlert);
		Thread.sleep(500);
		element_Clear(sendAlertToUserId);
		element_InputTextUsingActionClass(sendAlertToUserId, userID);
		element_TextBoxToClickOnTab(sendAlertToUserId);
		Thread.sleep(500);
		element_Click(assignUserBtn);
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - Pending Applications For Approval
	// ************************************
	// *************************************************************************************************
	// -- Only Daily considered in Code
	public String additionalParametersPendingAppForApproval(String setReminder, String reminderTime)
			throws InterruptedException {
		element_DropDownSelectByvisibleText(setreminderDD, setReminder);
		String rtime = changeHoursMinutes(reminderTime);
		element_Clear(reminderTimetext2);
		element_inputTextUsingActionClassCharacterOneByOne(reminderTimetext2, rtime);
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - Leave Application & Leave
	// Cancellation Application & Leave Modification Application
	// ************************************
	// *************************************************************************************************
	public String additionalParametersLeaveApplication(Boolean approvalLinks1, Boolean approvalAcknowledgment1,
			Boolean includeAttachment1) throws InterruptedException {
		if (approvalLinks1 == true) {
			if (!approvalLinks.isSelected()) {
				element_Click(approvalLinks);
			}
		} else {
			if (approvalLinks.isSelected()) {
				element_Click(approvalLinks);
			}
		}
		// Approval Acknowledgment flag is depends on Approval Links flag
		if (approvalAcknowledgment.isEnabled()) {
			if (approvalAcknowledgment1 == true) {
				if (!approvalAcknowledgment.isSelected()) {
					element_Click(approvalAcknowledgment);
				}
			} else {
				if (approvalAcknowledgment.isSelected()) {
					element_Click(approvalAcknowledgment);
				}
			}
		}
		if (includeAttachment1 == true) {
			if (!includeAttachment.isSelected()) {
				element_Click(includeAttachment);
			}
		} else {
			if (includeAttachment.isSelected()) {
				element_Click(includeAttachment);
			}
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - Leave Credit/Debit
	// ************************************
	// *************************************************************************************************
	public String additionalParametersLeaveCreditDebit(Boolean alertReportingInCharge1) throws InterruptedException {
		if (alertReportingInCharge1 == true) {
			if (!alertReportingInCharge.isSelected()) {
				element_Click(alertReportingInCharge);
			}
		} else {
			if (alertReportingInCharge.isSelected()) {
				element_Click(alertReportingInCharge);
			}
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - /Door Offline
	// ************************************
	// *************************************************************************************************
	public String additionalParametersDoorOffline(String startTime, String endTime, String tolerancePeriodSec,
			String sendAlertToUser) throws InterruptedException {
		if (eventGridAddedOrNot.size() > 0) {
			element_Click(eventGridEditBtn);
		} else {
			element_Click(eventCheckAddBtn);
		}
		element_Clear(eventStartTime);
		element_inputTextUsingActionClassCharacterOneByOne(eventStartTime, startTime);
		Thread.sleep(500);
		element_Clear(eventEndTime);
		element_inputTextUsingActionClassCharacterOneByOne(eventEndTime, endTime);
		element_Click(applicableDays);
		if (element_GetText(checkAll).equalsIgnoreCase("Check All")) {
			element_Click(checkAll);
		}
		element_Click(gridSaveBtn);
		Thread.sleep(500);
		element_Clear(tolerancePeriodMintext);
		element_InputTextUsingActionClass(tolerancePeriodMintext, tolerancePeriodSec);
		Thread.sleep(500);
		element_Click(assignAlert);
		Thread.sleep(500);
		element_Clear(userIDtext);
		element_InputTextUsingActionClass(userIDtext, sendAlertToUser);
		element_TextBoxToClickOnTab(userIDtext);
		element_Click(assignUserBtn);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - Monthly Attendance
	// ************************************
	// *************************************************************************************************
	public String additionalParametersMonthlyAttendance(Boolean showMonthlyLeaveBal) throws InterruptedException {
		if (showMonthlyLeaveBal == true) {
			if (!showMonthlyLeaveBalFlag.isSelected()) {
				showMonthlyLeaveBalFlag.click();
			}
		} else {
			if (showMonthlyLeaveBalFlag.isSelected()) {
				showMonthlyLeaveBalFlag.click();
			}
		}
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - Attendance Correction Application,
	// Short Leave/Official Hours Application, Event Authorization, Advance Overtime
	// Application, JPC - Award/Penalty Application, CWM Worker Induction. VMS -
	// Security Clearance ************************************
	// *************************************************************************************************
	public String additionalParametersAttendanceApplication(Boolean approvalLinks1, Boolean approvalAcknowledgment1)
			throws InterruptedException {
		if (approvalLinks1 == true) {
			if (!approvalLinks.isSelected()) {
				element_Click(approvalLinks);
			}
		} else {
			if (approvalLinks.isSelected()) {
				element_Click(approvalLinks);
			}
		}
		// Approval Acknowledgment flag is depends on Approval Links flag
		if (approvalAcknowledgment.isEnabled()) {
			if (approvalAcknowledgment1 == true) {
				if (!approvalAcknowledgment.isSelected()) {
					element_Click(approvalAcknowledgment);
				}
			} else {
				if (approvalAcknowledgment.isSelected()) {
					element_Click(approvalAcknowledgment);
				}
			}
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********** Additional Message Parameters - Shift Change
	// ************************************
	// *************************************************************************************************
	public String additionalParametersShiftChange(Boolean alertForNormalShift, Boolean alertForFBShift,
			Boolean alertForRDShift) throws InterruptedException {
		if (alertForNormalShift == true) {
			if (!alertForNormalShiftFlag.isSelected()) {
				element_Click(alertForNormalShiftFlag);
			}
		} else {
			if (alertForNormalShiftFlag.isSelected()) {
				element_Click(alertForNormalShiftFlag);
			}
		}
		if (alertForFBShift == true) {
			if (!alertForFBShiftFlag.isSelected()) {
				element_Click(alertForFBShiftFlag);
			}
		} else {
			if (alertForFBShiftFlag.isSelected()) {
				element_Click(alertForFBShiftFlag);
			}
		}
		if (alertForRDShift == true) {
			if (!alertForRDShiftFlag.isSelected()) {
				element_Click(alertForRDShiftFlag);
			}
		} else {
			if (alertForRDShiftFlag.isSelected()) {
				element_Click(alertForRDShiftFlag);
			}
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********* Additional Message Parameters - Overtime/C-OFF Authorization ,
	// Overtime Limit Exceeded - User, Overtime Limit Exceeded - Group Incharge, CWM
	// Worker Assignment ************************************
	// *************************************************************************************************
	public String additionalParametersOTCOFFAuth(String scheduleTime, String processingPeriod)
			throws InterruptedException {
		String stime = changeHoursMinutes(scheduleTime);
		element_Clear(scheduleTimetext);
		element_inputTextUsingActionClassCharacterOneByOne(scheduleTimetext, stime);
		element_DropDownSelectByvisibleText(eventSelectionDD2, processingPeriod);
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********* Additional Message Parameters - Attendance Exception
	// ************************************
	// *************************************************************************************************
	public String additionalParametersAtdException(Map<String, String> data) throws InterruptedException {
		element_DropDownSelectByvisibleText(sendAlertAsPerDD, data.get("SendAlertAsPer"));
		if (data.get("SendAlertAsPer").equalsIgnoreCase("Daily-Schedule Time")) {
			String stime = staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("ScheduleTime"));
			element_Clear(scheduleTimetext);
			element_inputTextUsingActionClassCharacterOneByOne(scheduleTimetext, stime);
			for (int i = 0; i < scheduleDaysFlags.size(); i++) {
				WebElement ele = scheduleDaysFlags.get(i);
				if (!ele.isSelected()) {
					ele.click();
				}
			}
		}
		if (!element_isSelected(exceptionsFlagSelectAll)) {
			element_Click(exceptionsFlagSelectAll);
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********* Additional Message Parameters - FVM Schedule Unavailable
	// ************************************
	// *************************************************************************************************
	public String additionalParametersScheduleUnavailable(String setReminder, String reminderTime,
			String remPeriodDaysBefSchDate) throws InterruptedException {
		if (setReminder != null) {
			element_DropDownSelectByvisibleText(eventSelectionDD, setReminder);
		}
		if (reminderTime != null) {
			String rtime = changeHoursMinutes(reminderTime);
			element_Clear(reminderTimetext2);
			element_inputTextUsingActionClassCharacterOneByOne(reminderTimetext2, rtime);
		}
		if (remPeriodDaysBefSchDate != null) {
			element_Clear(reminderPeriod);
			element_InputTextUsingActionClass(reminderPeriod, remPeriodDaysBefSchDate);
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********* Additional Message Parameters - CWM Contractor Validity
	// ************************************
	// *************************************************************************************************
	public String additionalParametersContractorValidity(String daysBeforeValEndDate, String reminderTime,
			String repeatReminder, String repeatIntervalDays, String userID, String contractorID,
			Map<String, String> data) throws InterruptedException {
		waitForElementVisible(gridediticon);
		element_Click(gridediticon);
		if (daysBeforeValEndDate != null) {
			element_Clear(daysBeforeExpirytext);
			element_InputTextUsingActionClass(daysBeforeExpirytext, daysBeforeValEndDate);
		}
		if (reminderTime != null) {
			String rtime = changeHoursMinutes(reminderTime);
			element_Clear(reminderTimegridtext);
			element_inputTextUsingActionClassCharacterOneByOne(reminderTimegridtext, rtime);
		}
		if (repeatReminder != null) {
			boolean repeat = Boolean.parseBoolean(repeatReminder);
			if (repeat == true) {
				if (!repeatReminderflg.isSelected()) {
					element_Click(repeatReminderflg);
				}
			} else {
				if (repeatReminderflg.isSelected()) {
					element_Click(repeatReminderflg);
				}
			}
		}
		if (repeatIntervalDays != null) {
			element_Clear(repeatIntervaltext);
			element_InputTextUsingActionClass(repeatIntervaltext, repeatIntervalDays);
		}
		Thread.sleep(500);
		element_Click(gridSaveBtn);
		Thread.sleep(500);
		element_Click(assignAlert);
		Thread.sleep(500);
		// Delete Row
		while (gridDeleteBtns.size() != 0) {
			element_Click(gridDeleteBtn);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
		}
		// Add Row
		if (data.get("SelectUsers") != null) {
			String selectuseroptions = null;
			if (data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
				selectuseroptions = "G";
			} else if (data.get("SelectUsers").equalsIgnoreCase("Randomly")) {
				selectuseroptions = "R";
			} else {
				selectuseroptions = "A";
			}
			element_DropDownSelectByValue(selectUserDD, selectuseroptions);
			if (data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
				if (data.get("SelectGroup") != null) {
					element_DropDownSelectByvisibleText(selectGroupDD, data.get("SelectGroup"));
				}
				if (data.get("GroupName") != null) {
					element_Click(groupSelectPicklist);
					Thread.sleep(1000);
					String[] commaSeparatedValues = data.get("GroupName").split(",");
					for (int i = 0; i < commaSeparatedValues.length; i++) {
						String groupName = commaSeparatedValues[i].trim();
						element_Clear(groupSelectPicklistSearchbar);
						element_InputTextUsingActionClass(groupSelectPicklistSearchbar, groupName);
						Thread.sleep(300);
						element_TextBoxToClickOnEnter(groupSelectPicklistSearchbar);
						Thread.sleep(500);
						element_Click(groupSelectPicklistSelectAll);
						Thread.sleep(1000);
					}
					element_Click(groupSelectPicklistOkBtn);
				}
			}
		} else {
			element_Clear(userIDtext);
			element_InputTextUsingActionClass(userIDtext, data.get("UserID"));
			Thread.sleep(300);
			element_TextBoxToClickOnTab(userIDtext);
		}
		element_Clear(contractorIDtxt);
		element_InputTextUsingActionClass(contractorIDtxt, contractorID);
		Thread.sleep(300);
		element_TextBoxToClickOnTab(contractorIDtxt);
		Thread.sleep(500);
		element_Click(assignUserBtn);
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********* Additional Message Parameters - CWM Work Order Expiry
	// ************************************
	// *************************************************************************************************
	public String additionalParametersWorkOrderExpiry(String setReminder, String reminderTime,
			String remPeriodDaysBefSchDate) throws InterruptedException {
		if (setReminder != null) {
			element_DropDownSelectByvisibleText(eventSelectionDD, setReminder);
		}
		if (remPeriodDaysBefSchDate != null) {
			element_Clear(setReminderDaysbeforeConfirmationtext);
			element_InputTextUsingActionClass(setReminderDaysbeforeConfirmationtext, remPeriodDaysBefSchDate);
		}
		if (reminderTime != null) {
			String rtime = changeHoursMinutes(reminderTime);
			element_Clear(reminderTimetextnewJoining);
			element_inputTextUsingActionClassCharacterOneByOne(reminderTimetextnewJoining, rtime);
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********* Additional Message Parameters - Visitor Preregistration
	// ************************************
	// *************************************************************************************************
	public String additionalParametersVisitorPreregistration(Boolean calendarInvite1, Boolean approvalLinks1,
			Boolean approvalAcknowledgment1) throws InterruptedException {
		if (calendarInvite1 == true) {
			if (!calendarInvite.isSelected()) {
				element_Click(calendarInvite);
			}
		} else {
			if (calendarInvite.isSelected()) {
				element_Click(calendarInvite);
			}
		}
		if (approvalLinks1 == true) {
			if (!approvalLinks.isSelected()) {
				element_Click(approvalLinks);
			}
		} else {
			if (approvalLinks.isSelected()) {
				element_Click(approvalLinks);
			}
		}
		// Approval Acknowledgment flag is depends on Approval Links flag
		if (approvalAcknowledgment.isEnabled()) {
			if (approvalAcknowledgment1 == true) {
				if (!approvalAcknowledgment.isSelected()) {
					element_Click(approvalAcknowledgment);
				}
			} else {
				if (approvalAcknowledgment.isSelected()) {
					element_Click(approvalAcknowledgment);
				}
			}
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********* Additional Message Parameters - Visitor Pass
	// ************************************
	// *************************************************************************************************
	public String additionalParametersVisitorPass(Boolean qrcode, Boolean barcode) throws InterruptedException {
		if (qrcode == true) {
			if (!visitorPassQRFlag.isSelected()) {
				element_Click(visitorPassQRFlag);
			}
		} else {
			if (visitorPassQRFlag.isSelected()) {
				element_Click(visitorPassQRFlag);
			}
		}
		if (barcode == true) {
			if (!visitorPassBarcodeFlag.isSelected()) {
				element_Click(visitorPassBarcodeFlag);
			}
		} else {
			if (visitorPassBarcodeFlag.isSelected()) {
				element_Click(visitorPassBarcodeFlag);
			}
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********* Additional Message Parameters - Visitor Pass Expiry Reminder
	// ************************************
	// *************************************************************************************************
	public String additionalParametersVisitorPassExpiryReminder(String reminderMinutes) throws InterruptedException {
		if (reminderMinutes != null) {
			element_Clear(expiryRemindertxt);
			element_InputTextUsingActionClass(expiryRemindertxt, reminderMinutes);
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********* Additional Message Parameters - Visit Reminder
	// ************************************
	// *************************************************************************************************
	public String additionalParametersVisitReminder(String reminderPriorHours, String reminderPriorDays)
			throws InterruptedException {
		if (reminderPriorHours != null) {
			element_Clear(reminderPriorHoursTxt);
			element_InputTextUsingActionClass(reminderPriorHoursTxt, reminderPriorHours);
		}
		if (reminderPriorDays != null) {
			element_Clear(reminderPriorDaysTxt);
			element_InputTextUsingActionClass(reminderPriorDaysTxt, reminderPriorDays);
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********* click On Assign Alert Panel ************************************
	// *************************************************************************************************
	public void clickOnAssignAlert() throws InterruptedException {
		waitForElementVisible(assignAlert);
		element_Click(assignAlert);
		Thread.sleep(500);
	}

	// *************************************************************************************************
	// ********* click On Send Alert Btn ************************************
	// *************************************************************************************************
	public void clickOnSendAlert() throws InterruptedException {
		waitForElementVisible(sendAlert);
		element_Click(sendAlert);
		Thread.sleep(500);
	}

	// *************************************************************************************************
	// ********* Assign Users ************************************
	// *************************************************************************************************
	public void assignUsers(Map<String, String> data) throws InterruptedException {
		waitForElementVisible(userIDtext);
		if (data.get("SelectUsers") != null) {
			String selectuseroptions = null;
			if (data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
				selectuseroptions = "G";
			} else if (data.get("SelectUsers").equalsIgnoreCase("Randomly")) {
				selectuseroptions = "R";
			} else {
				selectuseroptions = "A";
			}
			element_DropDownSelectByValue(selectUserDD, selectuseroptions);
			if (data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
				if (data.get("SelectGroup") != null) {
					element_DropDownSelectByvisibleText(selectGroupDD, data.get("SelectGroup"));
				}
				if (data.get("GroupName") != null) {
					element_Click(groupSelectPicklist);
					Thread.sleep(1000);
					String[] commaSeparatedValues = data.get("GroupName").split(",");
					for (int i = 0; i < commaSeparatedValues.length; i++) {
						String groupName = commaSeparatedValues[i].trim();
						element_Clear(groupSelectPicklistSearchbar);
						element_InputTextUsingActionClass(groupSelectPicklistSearchbar, groupName);
						element_TextBoxToClickOnEnter(groupSelectPicklistSearchbar);
						Thread.sleep(500);
						element_Click(groupSelectPicklistSelectAll);
						Thread.sleep(1000);
					}
					element_Click(groupSelectPicklistOkBtn);
				}
			}
		} else {
			element_Clear(userIDtext);
			element_InputTextUsingActionClass(userIDtext, data.get("UserID"));
			element_TextBoxToClickOnTab(userIDtext);
		}

		Thread.sleep(500);
	}

	// *************************************************************************************************
	// ********* Assign Contractors for SWM ************************************
	// *************************************************************************************************
	public void assignContractors(String contractorID) throws InterruptedException {
		waitForElementVisible(contractorIDtxt);
		element_Clear(contractorIDtxt);
		Thread.sleep(250);
		element_dynamicDDSelect(contractorIDtxt, contractorID);
//		element_TextBoxToClickOnTab(contractorIDtxt);
		Thread.sleep(500);
	}

	// *************************************************************************************************
	// ********* "Send Alert To" Checkboxes enable
	// ************************************
	// *************************************************************************************************
	public String sendAlertTo(String event) throws InterruptedException {
		waitForElementVisible(addMsgParameters);
		Thread.sleep(1500);
		element_Click(addMsgParameters);
		Thread.sleep(1000);
		// This Alert checkboxes xpath are different
		for (int i = 0; i < sendAlertToFlagsusingSend.size(); i++) {
			WebElement ele = sendAlertToFlagsusingSend.get(i);
			if (!ele.isSelected()) {
				element_Click(ele);
			}
			Thread.sleep(500);
		}

		// Birthday Greetings - Group Selection Disable
		if (event.equalsIgnoreCase("Birthday Greetings")) {
			if (groupFlag.isSelected()) {
				element_Click(groupFlag);
			}
			Thread.sleep(500);

		}
		saveButtonClick();
		String val = validationMessage();
		return val;
	}

	// *************************************************************************************************
	// ********* send Alert For Apta Auto SignIn
	// ************************************
	// *************************************************************************************************
	public String sendAlertForAptaAutoSignIn(Map<String, String> data) throws InterruptedException {
		waitForElementVisible(userIDtext);
		if (data.get("SelectUsers") != null) {
			String selectuseroptions = null;
			if (data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
				selectuseroptions = "G";
			} else if (data.get("SelectUsers").equalsIgnoreCase("Randomly")) {
				selectuseroptions = "R";
			} else {
				selectuseroptions = "A";
			}
			element_DropDownSelectByValue(selectUserDD, selectuseroptions);
			if (data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
				if (data.get("SelectGroup") != null) {
					element_DropDownSelectByvisibleText(selectGroupDD, data.get("SelectGroup"));
				}
				if (data.get("GroupName") != null) {
					element_Click(groupSelectPicklist);
					Thread.sleep(1000);
					String[] commaSeparatedValues = data.get("GroupName").split(",");
					for (int i = 0; i < commaSeparatedValues.length; i++) {
						String groupName = commaSeparatedValues[i].trim();
						element_Clear(groupSelectPicklistSearchbar);
						element_dynamicDDSelect(groupSelectPicklistSearchbar, groupName);
						element_TextBoxToClickOnEnter(groupSelectPicklistSearchbar);
						Thread.sleep(500);
						element_Click(groupSelectPicklistSelectAll);
						Thread.sleep(1000);
					}
					element_Click(groupSelectPicklistOkBtn);
				}
			}
		} else {
			element_Clear(userIDtext);
			element_dynamicDDSelect(userIDtext, data.get("UserID"));
			element_TextBoxToClickOnTab(userIDtext);
		}
		element_Click(sendAlertBtn);
		String val = validationMessage();
		saveButtonClick();
		return val;
	}

	// *************************************************************************************************
	// ********* Message priview edit
	// ************************************//Chirag Analysis regarding Acustom alert
	// *************************************************************************************************
	public void mailEdit(String alertEvent, String mailC, String mailC1, String mailC2, String smsC, String smsC2,
			String smsC3, String whatsappC, String whatsappC2, String whatsappC3) throws InterruptedException {
		waitForElementVisible(messagePriviewTab);
		alertEventSelection(alertEvent);
		Thread.sleep(1500);
		element_Click(messagePriviewTab);
		Thread.sleep(1000);
		element_Click(mailContentClick);
		Thread.sleep(1500);
		if (mailC != null) {
			if (mailC.equalsIgnoreCase("default")) {
				element_Click(mailDefaultButton);
				Thread.sleep(1000);
			} else {
				element_Clear(mailTextMessage);
				Thread.sleep(1000);
				element_InputTextUsingActionClass(mailTextMessage, mailC);
				Thread.sleep(1000);
			}
		}
		element_Click(mailOKButton);
		Thread.sleep(1000);
		if (mailC1 != null) {
			if (mailContent2size.size() > 0) {
				element_Click(mailContent2Click);
				Thread.sleep(1000);
				if (mailC1.equalsIgnoreCase("default")) {
					element_Click(mailDefaultButton);
					Thread.sleep(1000);
				} else {
					element_Clear(mailTextMessage);
					Thread.sleep(1000);
					element_InputTextUsingActionClass(mailTextMessage, mailC1);
					Thread.sleep(2000);
				}
				element_Click(mailOKButton);
			}
		}
		if (mailC2 != null) {
			if (mailContent3size.size() > 0) {
				element_Click(mailContent3Click);
				Thread.sleep(1000);
				if (mailC2.equalsIgnoreCase("default")) {
					element_Click(mailDefaultButton);
					Thread.sleep(1000);
				} else {
					element_Clear(mailTextMessage);
					Thread.sleep(1000);
					element_InputTextUsingActionClass(mailTextMessage, mailC2);
					Thread.sleep(2000);
				}
				element_Click(mailOKButton);
			}
		}
		Thread.sleep(1000);
		if (smsC != null) {
			element_Click(sms);
			Thread.sleep(1000);
			if (smsC.equalsIgnoreCase("default")) {
				element_Click(mailDefaultButton);
				Thread.sleep(1000);
			} else {
				element_Clear(mailTextMessage);
				Thread.sleep(1000);
				element_InputTextUsingActionClass(mailTextMessage, smsC);
				Thread.sleep(2000);
			}
			element_Click(mailOKButton);
		}
		Thread.sleep(1000);
		if (smsC3 != null) {
			Thread.sleep(1000);
			element_Click(sms3);
			Thread.sleep(1000);
			if (smsC3.equalsIgnoreCase("default")) {
				element_Click(mailDefaultButton);
				Thread.sleep(1000);
			} else {
				element_Clear(mailTextMessage);
				Thread.sleep(1000);
				element_InputTextUsingActionClass(mailTextMessage, smsC3);
				Thread.sleep(2000);
			}
			element_Click(mailOKButton);
		}
		Thread.sleep(1000);

		if (smsC2 != null) {
			Thread.sleep(1000);
			element_Click(sms2);
			Thread.sleep(1000);
			if (smsC2.equalsIgnoreCase("default")) {
				element_Click(mailDefaultButton);
				Thread.sleep(1000);
			} else {
				element_Clear(mailTextMessage);
				Thread.sleep(1000);
				element_InputTextUsingActionClass(mailTextMessage, smsC2);
				Thread.sleep(2000);
			}
			element_Click(mailOKButton);
		}
		Thread.sleep(1000);
		System.out.println(whatsappC);
		if (whatsappC != null) {
			element_Click(whatsAPPP);
			Thread.sleep(2000);
			if (whatsappC.equalsIgnoreCase("default")) {
				element_Click(mailDefaultButton);
				Thread.sleep(1000);
			} else {
				element_Clear(mailTextMessage);
				Thread.sleep(1000);
				element_InputTextUsingActionClass(mailTextMessage, whatsappC);
				Thread.sleep(2000);
			}
			element_Click(mailOKButton);
		}
		Thread.sleep(1000);

		if (whatsappC2 != null) {
			element_Click(whatsAPPP2);
			Thread.sleep(1000);
			if (whatsappC2.equalsIgnoreCase("default")) {
				element_Click(mailDefaultButton);
				Thread.sleep(1000);
			} else {
				element_Clear(mailTextMessage);
				Thread.sleep(1000);
				element_InputTextUsingActionClass(mailTextMessage, whatsappC2);
				Thread.sleep(2000);
			}
			element_Click(mailOKButton);
		}
		Thread.sleep(1000);

		if (whatsappC3 != null) {
			element_Click(whatsAPPP3);
			Thread.sleep(1000);
			if (whatsappC3.equalsIgnoreCase("default")) {
				element_Click(mailDefaultButton);
				Thread.sleep(1000);
			} else {
				element_Clear(mailTextMessage);
				Thread.sleep(1000);
				element_InputTextUsingActionClass(mailTextMessage, whatsappC3);
				Thread.sleep(2000);
			}
			element_Click(mailOKButton);
		}

		Thread.sleep(1500);
		saveButtonClick();
		String val = validationMessage();
		Assert.assertEquals(val, "Saved Successfully");
	}

	// *************************************************************************************************
	// ********* Assign Users & Contractor ************************************
	// *************************************************************************************************
	public void assignUsersContractors(Map<String, String> data) throws InterruptedException {
		waitForElementVisible(userIDtext);
		if (data.get("SelectUsers") != null) {
			String selectuseroptions = null;
			if (data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
				selectuseroptions = "G";
			} else if (data.get("SelectUsers").equalsIgnoreCase("Randomly")) {
				selectuseroptions = "R";
			} else {
				selectuseroptions = "A";
			}
			element_DropDownSelectByValue(selectUserDD, selectuseroptions);
			if (data.get("SelectUsers").equalsIgnoreCase("Group Wise")) {
				if (data.get("SelectGroup") != null) {
					element_DropDownSelectByvisibleText(selectGroupDD, data.get("SelectGroup"));
				}
				if (data.get("GroupName") != null) {
					element_Click(groupSelectPicklist);
					Thread.sleep(1000);
					String[] commaSeparatedValues = data.get("GroupName").split(",");
					for (int i = 0; i < commaSeparatedValues.length; i++) {
						String groupName = commaSeparatedValues[i].trim();
						element_Clear(groupSelectPicklistSearchbar);
						element_InputTextUsingActionClass(groupSelectPicklistSearchbar, groupName);
						element_TextBoxToClickOnEnter(groupSelectPicklistSearchbar);
						Thread.sleep(500);
						element_Click(groupSelectPicklistSelectAll);
						Thread.sleep(1000);
					}
					element_Click(groupSelectPicklistOkBtn);
				}
			}
		} else {
			element_Clear(userIDtext);
			element_InputTextUsingActionClass(userIDtext, data.get("UserID"));
			element_TextBoxToClickOnTab(userIDtext);
		}
		if (data.get("ContractorID") != null) {
			element_Clear(contractorIDtxt);
			Thread.sleep(250);
			element_dynamicDDSelect(contractorIDtxt, data.get("ContractorID"));
//			element_TextBoxToClickOnTab(contractorIDtxt);
		}
		Thread.sleep(500);
		for (int i = 0; i < documentlist.size(); i++) {
			String documentName = documentlist.get(i).getText();
			if (documentName.equalsIgnoreCase(data.get("DocumentName"))) {
				WebElement ele = documentlist.get(i).findElement(By.xpath("preceding-sibling::input"));
				if (!element_isSelected(ele)) {
					element_Click(ele);
				}
			}
		}
		Thread.sleep(500);
		element_Click(addBtn);
		Thread.sleep(500);
	}

}
