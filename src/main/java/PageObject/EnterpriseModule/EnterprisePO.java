package PageObject.EnterpriseModule;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.locators.RelativeLocator;
import org.openqa.selenium.support.locators.RelativeLocator.*;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class EnterprisePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EnterprisePO.class);
	
	public EnterprisePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "11001")
	private WebElement organizationPage;

	@FindBy(id = "11002")
	private WebElement branchPage;

	@FindBy(id = "11003")
	private WebElement departmentPage;

	@FindBy(id = "11004")
	private WebElement designationPage;

	@FindBy(id = "11005")
	private WebElement sectionPage;

	@FindBy(id = "11006")
	private WebElement categoryPage;

	@FindBy(id = "11007")
	private WebElement gradePage;

	@FindBy(id = "11019")
	private WebElement customGroupOnePage;

	@FindBy(id = "11020")
	private WebElement customGroupTwoPage;

	@FindBy(id = "11021")
	private WebElement customGroupThreePage;

	@FindBy(xpath = "//*[@class='col-md-12']//*[@name='cmnTxtSearch']")
	private WebElement searchTextBoxTitleBar;

	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[3]")
	private List<WebElement> groupName;

	@FindBy(xpath = "//*[@name=\"autoCompleteName\"]")
	private WebElement nameTextBox;
	
	@FindBy(name="autoCompleteId")
	private WebElement autoID;

	@FindBy(xpath = "//*[@placeholder='6 char Code']")
	private WebElement codeTextBox;

	
	@FindBy(xpath = "//*[@class=\"panel panel-list\"]")
	private List<WebElement> pageName;

	@FindBy(id = "Utilities")
	private WebElement utilitiesPage;

	@FindBy(id = "11009")
	private WebElement groupAssociationsPage;

	// Association Mapping Panel
	@FindBy(xpath = "//*[@default='Association Mapping']")
	private WebElement associationMappingPanel;

	@FindBy(xpath = "//*[@default='Association Mapping']/ancestor::div[@class=\"panel\"]//a[@aria-expanded=\"true\"]")
	private List<WebElement> associationMappingPanelOpenOrNot;
	
	@FindBy(id = "AutoDeviceGroupName")
	private WebElement deviceGroupNameTxt;

	// ESS
	@FindBy(xpath = "//*[@default=\"Enable Account\"]")
	private List<WebElement> enableAccountLabel;

	@FindBy(name = "EnableAccountCheckBox")
	private WebElement enableAccountinput;

	@FindBy(xpath = "//*[@default=\"Edit Basic Details\"]")
	private List<WebElement> editBasicDetailsLabel;

	@FindBy(id = "BasicDetailsCheckBox")
	private WebElement editBasicDetailsinput;

	@FindBy(xpath = "//*[@default=\"Punch Marking Via ESS\"]")
	private List<WebElement> punchMarkingViaESSLabel;

	@FindBy(id = "AttendanceViaESSCheckBox")
	private WebElement punchMarkingViaESSinput;

	@FindBy(xpath = "//*[@default=\"Punch Marking Via API\"]")
	private List<WebElement> punchMarkingViaAPILabel;

	@FindBy(id = "chkPunchAPI")
	private WebElement punchMarkingViaAPIinput;

	@FindBy(xpath = "//*[@default=\"Auto Punch Marking\"]")
	private List<WebElement> autoPunchMarkingLabel;

	@FindBy(id = "chkAutoAtdEnbl")
	private WebElement autoPunchMarkinginput;

	@FindBy(xpath = "//*[@default=\"Manual Punch Marking\"]")
	private List<WebElement> manualPunchMarkingLabel;

	@FindBy(id = "chkManPunch")
	private WebElement manualPunchMarkinginput;

	@FindBy(xpath = "//*[@default=\"Face Mandatory for Punch\"]")
	private List<WebElement> faceMandatoryforPunchLabel;

	@FindBy(id = "cmbFaceManForPunch")
	private WebElement faceMandatoryforPunchinput;

	@FindBy(xpath = "//*[@default=\"Capture Photo\"]")
	private List<WebElement> capturePhotoLabel;

	@FindBy(id = "chkCapturePhoto")
	private WebElement capturePhotoinput;

	@FindBy(xpath = "//*[@default=\"Allow Offline Punch\"]")
	private List<WebElement> allowOfflinePunchLabel;

	@FindBy(id = "chkAlwOffLnPunch")
	private WebElement allowOfflinePunchinput;

	@FindBy(xpath = "//*[@default=\"Location Mandatory for Punch\"]")
	private List<WebElement> locationMandatoryforPunchLabel;

	@FindBy(id = "cmbLocManForPunch")
	private WebElement locationMandatoryforPunchinput;

	@FindBy(xpath = "//*[@default=\"Reason For Punching From Unassigned Location\"]")
	private List<WebElement> reasonForPunchingFromUnassignedLocationLabel;

	@FindBy(id = "chkReasonForPunching")
	private WebElement reasonForPunchingFromUnassignedLocationinput;

	@FindBy(xpath = "//*[@default='Location Assignment']")
	private List<WebElement> locationAssignmentLabel;

	@FindBy(id = "cmbLocationAssignment")
	private WebElement locationAssignmentinput;

	@FindBy(xpath = "//mx-label[@default=\"ESS\"]/ancestor::div[1]//*[@default=\"Location\"]")
	private List<WebElement> locationLabel;

	@FindBy(xpath = "//mx-label[@default=\"ESS\"]/ancestor::div[1]//*[@default='Location Group']")
	private List<WebElement> locationGroupLabel;

	@FindBy(xpath = "//*[@default=\"Allow Door Access Through API\"]")
	private List<WebElement> allowDoorAccessThroughAPILabel;

	@FindBy(id = "chkAlwDoorAcsAPI")
	private WebElement allowDoorAccessThroughAPIinput;

	@FindBy(xpath = "//*[@default=\"PIN Authentication For Door Access\"]")
	private List<WebElement> pINAuthenticationForDoorAccessLabel;

	@FindBy(id = "chkPinAuthForDoor")
	private WebElement pINAuthenticationForDoorAccessinput;

	@FindBy(xpath = "//*[@default=\"APTA Face Anti-Spoofing\"]")
	private List<WebElement> aPTAFaceAntiSpoofingLabel;

	@FindBy(id = "APTAFaceAntiSpoofingCheckbox")
	private WebElement aPTAFaceAntiSpoofinginput;

	// Attendance
	@FindBy(xpath = "//*[@default=\"Enable Attendance Calculation\"]")
	private List<WebElement> enableAttendanceCalculationLabel;

	@FindBy(id = "EnableAttendanceCalculation")
	private WebElement enableAttendanceCalculationinput;

	@FindBy(xpath = "//*[@default=\"Restrict Half Day Considerations\"]")
	private List<WebElement> restrictHalfDayConsiderationsLabel;

	@FindBy(id = "RestrictHalfDay")
	private WebElement restrictHalfDayConsiderationsinput;

	@FindBy(xpath = "//*[@default=\"Attendance Marking Type\"]")
	private List<WebElement> attendanceMarkingTypeLabel;

	@FindBy(id = "cmbMarkingTypeList")
	private WebElement attendanceMarkingTypeinput;

	@FindBy(xpath = "//*[@key=\"lblMinWrkReq\" or @default=\"Full Day\" or @default=\"Half Day\"]")
	private List<WebElement> minimumWorkHrsRequiredLabel;

	@FindBy(xpath = "//*[@default=\"Maximum Punches to be considered\"]")
	private List<WebElement> maximumPunchestobeconsideredLabel;

	@FindBy(id = "cmbMaxPunchtobeConsidered")
	private WebElement maximumPunchestobeconsideredinput;

	@FindBy(xpath = "//*[@default=\"Maximum Short Leaves Allowed\"]")
	private List<WebElement> maximumShortLeavesAllowedLabel;

	@FindBy(id = "MaxShortLeavesAllowed")
	private WebElement maximumShortLeavesAllowedinput;

	@FindBy(xpath = "//*[@default=\"OT/C-OFF Eligibility\"]")
	private List<WebElement> oTCOFFEligibilityLabel;

	@FindBy(id = "cmbCOFFAuthorization")
	private WebElement oTCOFFEligibilityinput;

	@FindBy(xpath = "//*[@default=\"Auto Authorize C-OFF\"]")
	private List<WebElement> autoAuthorizeCOFFLabel;

	@FindBy(xpath = "//*[@default=\"Bus Route\"]")
	private List<WebElement> busRouteLabel;

	@FindBy(id = "AutoBusRouteID")
	private WebElement busRouteinput;

	@FindBy(xpath = "//*[@default=\"Enable Site Based Auto Tour Application\"]")
	private List<WebElement> enableSiteBasedAutoTourApplicationLabel;

	@FindBy(id = "chkEnblAutoTour")
	private WebElement enableSiteBasedAutoTourApplicationinput;

	@FindBy(xpath = "//*[@id=\"chkEnblAutoTour\"]/ancestor::div[@class=\"form-group\"]/following-sibling::div[1]//*[@default=\"Tour\"]")
	private List<WebElement> tourLabel;

	@FindBy(id = "cboAutoTour")
	private WebElement tourinput;

	@FindBy(xpath = "//*[@default=\"Base Site Selection\"]")
	private List<WebElement> baseSiteSelectionLabel;

	@FindBy(id = "SiteID")
	private WebElement baseSiteSelectioninput;

	@FindBy(xpath = "//*[@default=\"Auto Authorize Site Based Tour Application\"]")
	private List<WebElement> autoAuthorizeSiteBasedTourApplicationLabel;

	@FindBy(id = "chkAuthTourApp")
	private WebElement autoAuthorizeSiteBasedTourApplicationinput;

	@FindBy(xpath = "//*[@default=\"Enable Location Based Auto Tour Application\"]")
	private List<WebElement> enableLocationBasedAutoTourApplicationLabel;

	@FindBy(xpath = "//*[@id=\"chkAuthTourApp\"]/ancestor::div[@class=\"form-group\"]/following-sibling::div/div//*[@id=\"chkEnblLocAutoTour\"]")
	private WebElement enableLocationBasedAutoTourApplicationinput;

	@FindBy(xpath = "//*[@default='Base Location Assignment']")
	private List<WebElement> baseLocationAssignmentLabel;

	@FindBy(xpath = "//*[@id='cmbBaseLocationAssignment']")
	private WebElement baseLocationAssignmentinput;

	@FindBy(xpath = "//*[@key='lblLocAutoLocationPk']")
	private List<WebElement> atdLocationLabel;

	@FindBy(xpath = "//*[@id='AutoLocationPkID']")
	private WebElement atdLocationinput;

	@FindBy(xpath = "//*[@key='lblLocAutoLocationGroupPk']")
	private List<WebElement> atdLocationGroupLabel;

	@FindBy(xpath = "//*[@id='AutoLocationGroupPkID']")
	private WebElement atdLocationGroupinput;

	@FindBy(xpath = "//*[@key='lblEnblAuthLocAutoTour']")
	private List<WebElement> autoAuthorizeLocationBasedTourApplicationLabel;

	@FindBy(xpath = "//*[@key='lblEnblAuthLocAutoTour']/ancestor::fieldset[1]//*[@id=\"chkEnblLocAutoTour\"]")
	private WebElement autoAuthorizeLocationBasedTourApplicationinput;

	@FindBy(xpath = "//*[@default=\"Show Attendance Details On Device\"]")
	private List<WebElement> showAttendanceDetailsOnDeviceLabel;

	@FindBy(id = "chkEnblAtdSumOnDvc")
	private WebElement showAttendanceDetailsOnDeviceinput;

	@FindBy(xpath = "//*[@default=\"Bypass Finger/Palm/Face For Attendance\"]")
	private List<WebElement> bypassFingerPalmFaceForAttendanceLabel;

	@FindBy(id = "BypassFingerPalmforAttendance")
	private WebElement bypassFingerPalmFaceForAttendanceinput;

	@FindBy(xpath = "//*[@default=\"Leave Group\"]")
	private List<WebElement> leaveGroupLabel;

	@FindBy(xpath = "//*[@id='AutoLGID']")
	private WebElement leaveGroupinput;

	@FindBy(xpath = "//*[@default=\"Reporting Group\"]")
	private List<WebElement> reportingGroupLabel;

	@FindBy(xpath = "//*[@id='AutoRGID']")
	private WebElement reportingGroupinput;

	@FindBy(xpath = "//*[@key='lblApprovalPolicy']")
	private List<WebElement> approvalPolicyLabel;

	@FindBy(xpath = "//*[@id='ApprovalPolicyPkID']")
	private WebElement approvalPolicyinput;

	// Policy
	@FindBy(xpath = "//*[@key='lblAttendancePolicy']")
	private List<WebElement> attendancePolicyLabel;

	@FindBy(xpath = "//*[@id='AutoATDPLCName']")
	private WebElement attendancePolicyinput;

	@FindBy(xpath = "//*[@key='lblLateInPolicy']")
	private List<WebElement> lateINPolicyLabel;

	@FindBy(xpath = "//*[@id='AutoLateINPLCName']")
	private WebElement lateINPolicyinput;

	@FindBy(xpath = "//*[@key='lblEarlyOutPolicy']")
	private List<WebElement> earlyOUTPolicyLabel;

	@FindBy(xpath = "//*[@id='AutoEarlyOUTPLCName']")
	private WebElement earlyOUTPolicyinput;

	@FindBy(xpath = "//*[@key='lblOvertimePolicy']")
	private List<WebElement> overtimePolicyLabel;

	@FindBy(xpath = "//*[@id='AutoOTPLCName']")
	private WebElement overtimePolicyinput;

	@FindBy(xpath = "//*[@key='lblAbsenteePolicy']")
	private List<WebElement> absenteePolicyLabel;

	@FindBy(xpath = "//*[@id='AutoABPLCName']")
	private WebElement absenteePolicyinput;

	@FindBy(xpath = "//*[@key='lblCoffPolicy']")
	private List<WebElement> cOFFPolicyLabel;

	@FindBy(xpath = "//*[@id='AutoCOFFPLCName']")
	private WebElement cOFFPolicyinput;

	// Access Details
	@FindBy(xpath = "//*[@key='lblAccessValidity']")
	private List<WebElement> accessValidityLabel;

	@FindBy(xpath = "//*[@id='Validity']")
	private WebElement accessValidityinput;

	@FindBy(xpath = "//*[@default='Access Validity Date']")
	private List<WebElement> accessValidityDateLabel;

	@FindBy(xpath = "//*[@id='_ValidityDate']")
	private WebElement accessValidityDateinput;

	@FindBy(xpath = "//*[@key='lblAccessLevel']")
	private List<WebElement> accessLevelForSmartIdentificationLabel;

	@FindBy(id = "cmbAccessLvls")
	private WebElement accessLevelForSmartIdentificationinput;

	@FindBy(xpath = "//*[@key='lblBypassFinger']")
	private List<WebElement> bypassFingerLabel;

	@FindBy(xpath = "//*[@id='BypassFinger']")
	private WebElement bypassFingerinput;

	@FindBy(xpath = "//*[@key='lblBypassPalm']")
	private List<WebElement> bypassPalmLabel;

	@FindBy(xpath = "//*[@id='BypassPalm']")
	private WebElement bypassPalminput;

	@FindBy(xpath = "//*[@key='lblAdvAccessControlFlg']")
	private List<WebElement> enableAdvanceAccessControlLabel;

	@FindBy(xpath = "//*[@id='AdvAccessControlFlg']")
	private WebElement enableAdvanceAccessControlinput;

	@FindBy(xpath = "//*[@key='lblShiftBasedAccess']")
	private List<WebElement> shiftBasedAccessLabel;

	@FindBy(xpath = "//*[@id='ShiftBasedAccess']")
	private WebElement shiftBasedAccessinput;

	@FindBy(xpath = "//*[@key='lblShiftSchedule']")
	private List<WebElement> shiftScheduleLabel;

	@FindBy(id = "cmbSchelNo")
	private WebElement shiftScheduleinput;

	@FindBy(xpath = "//*[@key='lblStartSft']")
	private List<WebElement> startShiftLabel;

	@FindBy(id = "cmbStartShift")
	private WebElement startShiftinput;

	@FindBy(xpath = "//*[@key='lblHolidySchedule']")
	private List<WebElement> holidayScheduleLabel;

	@FindBy(id = "cmbHoliday")
	private WebElement holidayScheduleinput;

	@FindBy(xpath = "//*[@key='lblDeviceGroup']")
	private List<WebElement> deviceGroupLabel;

	@FindBy(xpath = "//*[@id='AutoDeviceGroupID']")
	private WebElement deviceGroupinput;

	@FindBy(xpath = "//*[@key='lblPVRGrpNo']")
	private List<WebElement> biometricGroupNoLabel;

	@FindBy(xpath = "//*[@id='PVRGrpNo']")
	private WebElement biometricGroupNoinput;

	@FindBy(xpath = "//*[text()='Roaming User']")
	private List<WebElement> roamingUserLabel;

	@FindBy(xpath = "//*[@id='chkRoamingUser']")
	private WebElement roamingUserinput;

	@FindBy(xpath = "//*[@key='lblSmartAccessRoute']")
	private List<WebElement> smartAccessRouteLabel;

	@FindBy(xpath = "//*[@id='AutoSmtACSRouteID']")
	private WebElement smartAccessRouteinput;

	@FindBy(xpath = "//*[@key='lblMaxSmartAccessRouteLevel']")
	private List<WebElement> maximumSmartAccessRouteLevelLabel;

	@FindBy(id = "cmbACSRouteLvl")
	private WebElement maximumSmartAccessRouteLevelinput;

	@FindBy(xpath = "//*[@key='lblEnableElevatorAccessControl']")
	private List<WebElement> enableElevatorAccessControlLabel;

	@FindBy(xpath = "//*[@id='ChkElevatorAccess']")
	private WebElement enableElevatorAccessControlinput;

	@FindBy(xpath = "//*[@key='lblElevatorFloorGroup']")
	private List<WebElement> elevatorFloorGroupLabel;

	@FindBy(xpath = "//*[@id='FloorGroupPicklistID']")
	private WebElement elevatorFloorGroupinput;

	// Cafeteria
	@FindBy(xpath = "//*[@key='lblDiscountLeavel']")
	private List<WebElement> discountLevelLabel;

	@FindBy(xpath = "//*[@title='Select Discount Level']")
	private WebElement discountLevelinput;

	@FindBy(xpath = "//*[@key='Cafeteria Usage Policy']")
	private List<WebElement> cafeteriaUsagePolicyLabel;

	@FindBy(xpath = "//*[@id='CafeteriaUsagePolicyID']")
	private WebElement cafeteriaUsagePolicyinput;

	@FindBy(xpath = "//*[@key='lblEnblOfflineTrn']")
	private List<WebElement> enableOfflineTransactionLabel;

	@FindBy(xpath = "//*[@id='EnblOfflineTrn']")
	private WebElement enableOfflineTransactioninput;

	@FindBy(xpath = "//*[@key='lblBalMgt']")
	private List<WebElement> prepaidBalanceManagementLabel;

	@FindBy(xpath = "//*[@id=\"cmbBalMgt\"]")
	private WebElement prepaidBalanceManagementinput;

	@FindBy(xpath = "//*[@key='lblBalChk']")
	private List<WebElement> prepaidDeviceServerBalanceCheckLabel;

	@FindBy(xpath = "//*[@id='chkBalChk']")
	private WebElement prepaidDeviceServerBalanceCheckinput;

	@FindBy(xpath = "//*[@key='lblPreMaxLmtParMonth']")
	private List<WebElement> prepaidMaximumUsageLimitPerMonthLabel;

	@FindBy(xpath = "//*[@id='PreMaxLmtParMonth']")
	private WebElement prepaidMaximumUsageLimitPerMonthinput;

	@FindBy(xpath = "//*[@key='lblPreMaxLmtParDay']")
	private List<WebElement> prepaidMaximumUsageLimitPerDayLabel;

	@FindBy(xpath = "//*[@id='PreMaxLmtParDay']")
	private WebElement prepaidMaximumUsageLimitPerDayinput;

	@FindBy(xpath = "//*[@key='lblMaxAllowedUsage']")
	private List<WebElement> postpaidAllowedUsagePerMonthLabel;

	@FindBy(xpath = "//*[@id='MaxAllowedUsage']")
	private WebElement postpaidAllowedUsagePerMonthinput;

	@FindBy(xpath = "//*[@key='lblMaxUsageLimit']")
	private List<WebElement> postpaidMaximumUsageLimitPerMonthLabel;

	@FindBy(xpath = "//*[@id='MaxUsageLimit']")
	private WebElement postpaidMaximumUsageLimitPerMonthinput;

	@FindBy(xpath = "//*[@key='lblPostMaxUsageLmtPerDay']")
	private List<WebElement> postpaidMaximumUsageLimitPerDayLabel;

	@FindBy(xpath = "//*[@id='PostMaxUsageLmtPerDay']")
	private WebElement postpaidMaximumUsageLimitPerDayinput;

	// JPC
	@FindBy(xpath = "//*[text()='Job Costing' and @class=\"control-label mx-input-theme\"]")
	private List<WebElement> jobCostingLabel;

	@FindBy(xpath = "//*[@id='cboJobAsgnType']")
	private WebElement jobCostinginput;

	@FindBy(id = "btnOk")
	private List<WebElement> jobCostingEnableOkBtn;

	// FVM
	@FindBy(xpath = "//*[@key='lblFVMEnable']")
	private List<WebElement> enableFVMLabel;

	@FindBy(xpath = "//*[@id='chkFVMEnable']")
	private WebElement enableFVMinput;

	// FR
	@FindBy(xpath = "//*[@key='lblFREnable']")
	private List<WebElement> enableFRLabel;

	@FindBy(xpath = "//*[@id='chkFREnable']")
	private WebElement enableFRinput;

	// VMS
	@FindBy(xpath = "//*[text()='Authorized Host User']")
	private List<WebElement> authorizedHostUserLabel;

	@FindBy(xpath = "//*[@id='chkAuthHostUserEnable']")
	private WebElement authorizedHostUserinput;

	@FindBy(xpath = "//*[@id='VisDeviceGroupID']/ancestor::div[@class=\"form-group\"][1]/div//label[text()='Device Group']")
	private List<WebElement> vmsDeviceGroupLabel;

	@FindBy(xpath = "//*[@id='VisDeviceGroupID']")
	private WebElement vmsDeviceGroupinput;

	// Confirmation Popup
	@FindBy(xpath = "//*[@class='modal-content']")
	private List<WebElement> confirmPopUp;

	@FindBy(id = "btnYes")
	private WebElement confirmYesBtn;
	
	@FindBy(id = "btnYes")
	private List<WebElement> confirmYesBtnSize;

	@FindBy(id = "btnNo")
	private WebElement confirmNoBtn;

	// User In This Group Panel
	@FindBy(xpath = "//*[contains(text(), 'User In This Group')]")
	private WebElement userInThisGroupPanel;

	@FindBy(xpath = "//label[text()='User In This Group']/ancestor::div[@class=\"panel\"]//a[@aria-expanded=\"true\"]")
	private List<WebElement> userInThisGroupPanelOpenOrNot;

	@FindBy(id = "AllUserWithFilterID")
	private WebElement useridTxt;

	@FindBy(xpath = "//*[@id=\"collapseTwo\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)]/i")
	private List<WebElement> gridDeleteBtns;

	@FindBy(xpath = "//*[@id='collapseTwo']//tbody//*[@title=\"Delete\"]")
	private WebElement gridDeleteBtn;
	
	//kamal for reports
	@FindBy(id = "Reports")
	private WebElement report;
	
	@FindBy(id = "11012")
	private WebElement organizationReport;
	
	@FindBy(id = "11013")
	private WebElement branchReport;
	
	@FindBy(id = "11014")
	private WebElement departmentReport;
	
	@FindBy(id = "11015")
	private WebElement designationReport;
	
	@FindBy(id = "11016")
	private WebElement sectionReport;
	
	@FindBy(id = "11017")
	private WebElement categoryReport;
	
	@FindBy(id = "11018")
	private WebElement gradeReport;
	
	@FindBy(id = "11022")
	private WebElement customGroup1Report;
	
	@FindBy(id = "11023")
	private WebElement customGroup2Report;
	
	@FindBy(id = "11024")
	private WebElement customGroup3Report;
	
	//Association Maping Collaps
	
	@FindBy(id = "cboJobAsgnType")
	private WebElement jobCostingDD;
	
	@FindBy(id = "grdJobsaddBtn")
	private WebElement jobAddBtn;
	
	@FindBy(id = "AutoJobID")
	private WebElement jobCodeTxt;
	
	@FindBy(id = "_FromDate")
	private WebElement assignmentStartDateTxt;
	
	@FindBy(id = "_ToDate")
	private WebElement assignmentEndDateTxt;
	
	@FindBy(xpath= "//*[@id=\"savebtn\"]")
	private WebElement jobAssignmentOkBtn;
	
	@FindBy(xpath = "//*[@id='message']/div/label")
	private List<WebElement> jobCostingValMsgSize;
	
	@FindBy(xpath = "//*[@id='message']/div/label")
	private WebElement jobCostingValMsg;
	
	@FindBy(xpath = "//*[@id='div_grd_grdJobs']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> defaultJobTable;
	
	@FindBy(id = "btnYes")
	private List<WebElement> confirmPopupYesbtnSize;
	
	@FindBy(id = "btnYes")
	private WebElement confirmPopupYesbtn;
	
	@FindBy(xpath = "//*[@id='div_grd_AccessProfile']//*[@key='Search']")
	private WebElement associationMapSearch;
	
	@FindBy(xpath = "//*[@id=\"div_grd_AccessProfile\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]")
	private List<WebElement> assignAcsProfileTable;
	
	@FindBy(id = "ChkAccessProfile")
	private WebElement chkAccessProfile;
	
	@FindBy(xpath = "//*[@id=\"div_grd_AccessProfile\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]/following-sibling::td[not(@hidden)][3]/*[@id=\"savebtn\" and not(@hidden)]")
	private WebElement gridSaveBtn;
	
	@FindBy(id = "btnYes")
	private WebElement yesButton;
	
	@FindBy(id = "btnYes")
	private List<WebElement> yesButtonSize;
	
	@FindBy(id = "JobSchedulerESName")
	private WebElement jobSchedulerNameTxt;
	
	@FindBy(xpath = "//*[@id=\"div_grd_grdjobScheduler\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]")
	private List<WebElement> jobSchedulerTable;
	
	@FindBy(xpath = "//*[@id=\"div_grd_grdjobScheduler\"]//*[@name='cmnTxtSearch']")
	private WebElement jobSchedulerSearch;
	
	@FindBy(xpath = "//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> allGRPNames;
	//

	// **************************************************************************************
	// *************************************FUNCTIONS***************************************
	// *************************************************************************************
	public void goToOrganizationPage() {
		element_Click(organizationPage);
	}

	public void goToBranchPage() {
		element_Click(branchPage);
	}

	public void goToDepartmentPage() {
		element_Click(departmentPage);
	}

	public void goToDesignationPage() {
		element_Click(designationPage);
	}

	public void goToSectionPagePage() {
		element_Click(sectionPage);
	}

	public void goToCategoryPagePage() {
		element_Click(categoryPage);
	}

	public void goToGradePage() {
		element_Click(gradePage);
	}

	public void goToCustomGroupOnePage() {
		element_Click(customGroupOnePage);
	}

	public void goToCustomGroupTwoPage() {
		element_Click(customGroupTwoPage);
	}

	public void goToCustomGroupThreePage() {
		element_Click(customGroupThreePage);
	}

	public void goToEnterpriseGroupPage(String group) throws InterruptedException {
		switch (group) {
		case "Organization":
			goToOrganizationPage();
//			Thread.sleep(1000);
			// actual = testContextObject.pom.enterprisePO().createGroup(group, name, code);
//			Thread.sleep(1000);
			break;
		case "Branch":
			goToBranchPage();
//			Thread.sleep(1000);
			break;
		case "Department":
			goToDepartmentPage();
//			Thread.sleep(1000);
			break;
		case "Designation":
			goToDesignationPage();
//			Thread.sleep(1000);
			break;
		case "Section":
			goToSectionPagePage();
//			Thread.sleep(1000);
			break;
		case "Category":
			goToCategoryPagePage();
//			Thread.sleep(1000);
			break;
		case "Grade":
			goToGradePage();
//			Thread.sleep(1000);
			break;
		case "Custom Group 1":
			goToCustomGroupOnePage();
//			Thread.sleep(1000);
			break;
		case "Custom Group 2":
			goToCustomGroupTwoPage();
//			Thread.sleep(1000);
			break;
		case "Custom Group 3":
			goToCustomGroupThreePage();
//			Thread.sleep(1000);
			break;
		default:
			logger.debug("Invalid Page Name : " + group);
			break;
		}
	}

	public String createGroup(String group, String name, String code) throws InterruptedException {
		pageLoadWaitng();
		//waitForElementClickable(searchTextBoxTitleBar);
		String validationMsg = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {

			element_Click(searchTextBoxTitleBar);
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, name);
			Thread.sleep(2000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
//			searchTextBoxTitleBar.sendKeys(Keys.ENTER);
			Thread.sleep(2000);
			List<String> list = new ArrayList<String>();
			for (int i = 0; i < groupName.size(); i++) {
				list.add(groupName.get(i).getText());
				if (groupName.get(i).getText().equalsIgnoreCase(name)) {
					groupName.get(i).click();
					Thread.sleep(2000);
				}
			}
			if (!list.contains(name)) {
				addButtonClick();
				Thread.sleep(2000);
				element_Clear(nameTextBox);
				element_InputTextUsingActionClass(nameTextBox, name);
				Thread.sleep(2000);
			}
			element_Clear(codeTextBox);
			element_InputTextUsingActionClass(codeTextBox, code);
			Thread.sleep(2000);
			saveButtonClick();
			validationMsg = validationMessage();
			element_Click(validationMessageCloseButton);
		}
		return validationMsg;
	}

	public void deleteGroup(String group, String name, String expectedValMsg) throws InterruptedException {
//		pageLoadWaitng();
		waitForElementVisible(nameTextBox);
		String actualValMsg = null;
		element_Clear(nameTextBox);
		Thread.sleep(300);
		element_InputTextUsingActionClass(nameTextBox, name);
		Thread.sleep(400);
		element_TextBoxToClickOnTab(nameTextBox);
		pageLoadWaitng();
		if (!element_getInputControlValue(codeTextBox).isBlank()
				|| !element_getInputControlValue(codeTextBox).isEmpty()) {
			// Delete already user if any
			if (userInThisGroupPanelOpenOrNot.size() == 0) {
				element_Click(userInThisGroupPanel);
			}
			Thread.sleep(1000);
			while (gridDeleteBtns.size() != 0) {
				waitForElementClickable(gridDeleteBtn);
				element_Click(gridDeleteBtn);
				if (element_AlertIsPresent()) {
					driver.switchTo().alert().accept();
				}
				Thread.sleep(250);
			}
			saveButtonClick();
			if (confirmPopUp.size() > 0) {
				element_Click(confirmNoBtn);
				pageLoadWaitng();
			}
			Thread.sleep(1000);
			// Main COde
			deleteButtonClick();
			Thread.sleep(1000);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
			actualValMsg = validationMessage();
			Assert.assertEquals(actualValMsg, expectedValMsg);
		} else {
			element_Clear(nameTextBox);
			Thread.sleep(1000);
		}
	}

	public void verifyEnterpriseGroupName(String renamedGroup) throws InterruptedException {
		String actualRes = null;
		Thread.sleep(2000);
		for (WebElement singlePageName : pageName) {
			String pageNameText = singlePageName.getText();
			if (pageNameText.equalsIgnoreCase(renamedGroup)) {
				actualRes = singlePageName.getText();
			}
		}
		Assert.assertEquals(actualRes, renamedGroup);
	}

	// Mayank
	public void goToGroupAssociationsPage() {
		element_Click(utilitiesPage);
		element_Click(groupAssociationsPage);
	}

	// Mayank
	public void groupAssociationReflectionsESS(Map<String, String> data) throws InterruptedException {
		if (data.get("EnableAccount") != null) {
			boolean validate = false;
			if (enableAccountLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(enableAccountLabel.get(0).getText(), "Enable Account");
				String type = enableAccountinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("EnableAccount")));
		}
		if (data.get("EditBasicDetails") != null) {
			boolean validate = false;
			if (editBasicDetailsLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(editBasicDetailsLabel.get(0).getText(), "Edit Basic Details");
				String type = editBasicDetailsinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("EditBasicDetails")));
		}
		if (data.get("PunchMarkingViaESS") != null) {
			boolean validate = false;
			if (punchMarkingViaESSLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(punchMarkingViaESSLabel.get(0).getText(), "Punch Marking Via ESS");
				String type = punchMarkingViaESSinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("PunchMarkingViaESS")));
		}
		if (data.get("PunchMarkingViaAPI") != null) {
			boolean validate = false;
			if (punchMarkingViaAPILabel.size() > 0) {
				validate = true;
				Assert.assertEquals(punchMarkingViaAPILabel.get(0).getText(), "Punch Marking Via API");
				String type = punchMarkingViaAPIinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("PunchMarkingViaAPI")));
		}
		if (data.get("AutoPunchMarking") != null) {
			boolean validate = false;
			if (autoPunchMarkingLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(autoPunchMarkingLabel.get(0).getText(), "Auto Punch Marking");
				String type = autoPunchMarkinginput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AutoPunchMarking")));
		}
		if (data.get("ManualPunchMarking") != null) {
			boolean validate = false;
			if (manualPunchMarkingLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(manualPunchMarkingLabel.get(0).getText(), "Manual Punch Marking");
				String type = manualPunchMarkinginput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("ManualPunchMarking")));
		}
		if (data.get("FaceMandatoryforPunch") != null) {
			boolean validate = false;
			if (faceMandatoryforPunchLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(faceMandatoryforPunchLabel.get(0).getText(), "Face Mandatory for Punch");
				String type = faceMandatoryforPunchinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("FaceMandatoryforPunch")));
		}
		if (data.get("CapturePhoto") != null) {
			boolean validate = false;
			if (capturePhotoLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(capturePhotoLabel.get(0).getText(), "Capture Photo");
				String type = capturePhotoinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("CapturePhoto")));
		}
		if (data.get("AllowOfflinePunch") != null) {
			boolean validate = false;
			if (allowOfflinePunchLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(allowOfflinePunchLabel.get(0).getText(), "Allow Offline Punch");
				String type = allowOfflinePunchinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AllowOfflinePunch")));
		}
		if (data.get("LocationMandatoryforPunch") != null) {
			boolean validate = false;
			if (locationMandatoryforPunchLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(locationMandatoryforPunchLabel.get(0).getText(), "Location Mandatory for Punch");
				String type = locationMandatoryforPunchinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("LocationMandatoryforPunch")));
		}
		if (data.get("ReasonForPunchingFromUnassignedLocation") != null) {
			boolean validate = false;
			if (reasonForPunchingFromUnassignedLocationLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(reasonForPunchingFromUnassignedLocationLabel.get(0).getText(),
						"Reason For Punching From Unassigned Location");
				String type = reasonForPunchingFromUnassignedLocationinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("ReasonForPunchingFromUnassignedLocation")));
		}
		if (data.get("LocationAssignment") != null) {
			boolean validate = false;
			if (locationAssignmentLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(locationAssignmentLabel.get(0).getText(), "Location Assignment");
				String type = locationAssignmentinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("LocationAssignment")));
		}
		if (data.get("Location") != null) {
			boolean validate = false;
			if (locationLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(locationLabel.get(0).getText(), "Location");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("Location")));
		}
		if (data.get("LocationGroup") != null) {
			boolean validate = false;
			if (locationGroupLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(locationGroupLabel.get(0).getText(), "Location Group");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("LocationGroup")));
		}
		if (data.get("AllowDoorAccessThroughAPI") != null) {
			boolean validate = false;
			if (allowDoorAccessThroughAPILabel.size() > 0) {
				validate = true;
				Assert.assertEquals(allowDoorAccessThroughAPILabel.get(0).getText(), "Allow Door Access Through API");
				String type = allowDoorAccessThroughAPIinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AllowDoorAccessThroughAPI")));
		}
		if (data.get("PINAuthenticationForDoorAccess") != null) {
			boolean validate = false;
			if (pINAuthenticationForDoorAccessLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(pINAuthenticationForDoorAccessLabel.get(0).getText(),
						"PIN Authentication For Door Access");
				String type = pINAuthenticationForDoorAccessinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("PINAuthenticationForDoorAccess")));
		}
		if (data.get("APTAFaceAntiSpoofing") != null) {
			boolean validate = false;
			if (aPTAFaceAntiSpoofingLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(aPTAFaceAntiSpoofingLabel.get(0).getText(), "APTA Face Anti-Spoofing");
				String type = aPTAFaceAntiSpoofinginput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("APTAFaceAntiSpoofing")));
		}

	}

	// Mayank
	public void groupAssociationReflectionsAttendance(Map<String, String> data) throws InterruptedException {
		if (data.get("EnableAttendanceCalculation") != null) {
			boolean validate = false;
			if (enableAttendanceCalculationLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(enableAttendanceCalculationLabel.get(0).getText(), "Enable Attendance Calculation");
				String type = enableAttendanceCalculationinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("EnableAttendanceCalculation")));
		}
		if (data.get("RestrictHalfDayConsiderations") != null) {
			boolean validate = false;
			if (restrictHalfDayConsiderationsLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(restrictHalfDayConsiderationsLabel.get(0).getText(),
						"Restrict Half Day Considerations");
				String type = restrictHalfDayConsiderationsinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("RestrictHalfDayConsiderations")));
		}
		if (data.get("AttendanceMarkingType") != null) {
			boolean validate = false;
			if (attendanceMarkingTypeLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(attendanceMarkingTypeLabel.get(0).getText(), "Attendance Marking Type");
				String type = attendanceMarkingTypeinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AttendanceMarkingType")));
		}
		if (data.get("MinimumWorkHrsRequired") != null) {
			boolean validate = false;
			if (minimumWorkHrsRequiredLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(minimumWorkHrsRequiredLabel.get(0).getText(), "Minimum Work Hrs Required");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("MinimumWorkHrsRequired")));
		}
		if (data.get("MaximumPunchestobeconsidered") != null) {
			boolean validate = false;
			if (maximumPunchestobeconsideredLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(maximumPunchestobeconsideredLabel.get(0).getText(),
						"Maximum Punches to be considered");
				String type = maximumPunchestobeconsideredinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("MaximumPunchestobeconsidered")));
		}
		if (data.get("MaximumShortLeavesAllowed") != null) {
			boolean validate = false;
			if (maximumShortLeavesAllowedLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(maximumShortLeavesAllowedLabel.get(0).getText(), "Maximum Short Leaves Allowed");
				String type = maximumShortLeavesAllowedinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("MaximumShortLeavesAllowed")));
		}
		if (data.get("OTCOFFEligibility") != null) {
			boolean validate = false;
			if (oTCOFFEligibilityLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(oTCOFFEligibilityLabel.get(0).getText(), "OT/C-OFF Eligibility");
				String type = oTCOFFEligibilityinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("OTCOFFEligibility")));
		}
		if (data.get("AutoAuthorizeCOFF") != null) {
			boolean validate = false;
			if (autoAuthorizeCOFFLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(autoAuthorizeCOFFLabel.get(0).getText(), "Auto Authorize C-OFF");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AutoAuthorizeCOFF")));
		}
		if (data.get("BusRoute") != null) {
			boolean validate = false;
			if (busRouteLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(busRouteLabel.get(0).getText(), "Bus Route");
				String type = busRouteinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("BusRoute")));
		}
		if (data.get("EnableSiteBasedAutoTourApplication") != null) {
			boolean validate = false;
			if (enableSiteBasedAutoTourApplicationLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(enableSiteBasedAutoTourApplicationLabel.get(0).getText(),
						"Enable Site Based Auto Tour Application");
				String type = enableSiteBasedAutoTourApplicationinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("EnableSiteBasedAutoTourApplication")));
		}
		if (data.get("Tour") != null) {
			boolean validate = false;
			if (tourLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(tourLabel.get(0).getText(), "Tour");
				String type = tourinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("Tour")));
		}
		if (data.get("BaseSiteSelection") != null) {
			boolean validate = false;
			if (baseSiteSelectionLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(baseSiteSelectionLabel.get(0).getText(), "Base Site Selection");
				String type = baseSiteSelectioninput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("BaseSiteSelection")));
		}
		if (data.get("AutoAuthorizeSiteBasedTourApplication") != null) {
			boolean validate = false;
			if (autoAuthorizeSiteBasedTourApplicationLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(autoAuthorizeSiteBasedTourApplicationLabel.get(0).getText(),
						"Auto Authorize Site Based Tour Application");
				String type = autoAuthorizeSiteBasedTourApplicationinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AutoAuthorizeSiteBasedTourApplication")));
		}
		if (data.get("EnableLocationBasedAutoTourApplication") != null) {
			boolean validate = false;
			if (enableLocationBasedAutoTourApplicationLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(enableLocationBasedAutoTourApplicationLabel.get(0).getText(),
						"Enable Location Based Auto Tour Application");
				String type = enableLocationBasedAutoTourApplicationinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("EnableLocationBasedAutoTourApplication")));
		}
		if (data.get("BaseLocationAssignment") != null) {
			boolean validate = false;
			if (baseLocationAssignmentLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(baseLocationAssignmentLabel.get(0).getText(), "Base Location Assignment");
				String type = baseLocationAssignmentinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("BaseLocationAssignment")));
		}
		if (data.get("Location") != null) {
			boolean validate = false;
			if (atdLocationLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(atdLocationLabel.get(0).getText(), "Location");
				String type = atdLocationinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("Location")));
		}
		if (data.get("LocationGroup") != null) {
			boolean validate = false;
			if (atdLocationGroupLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(atdLocationGroupLabel.get(0).getText(), "Location Group");
				String type = atdLocationGroupinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("LocationGroup")));
		}
		if (data.get("AutoAuthorizeLocationBasedTourApplication") != null) {
			boolean validate = false;
			if (autoAuthorizeLocationBasedTourApplicationLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(autoAuthorizeLocationBasedTourApplicationLabel.get(0).getText(),
						"Auto Authorize Location Based Tour Application");
				String type = autoAuthorizeLocationBasedTourApplicationinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AutoAuthorizeLocationBasedTourApplication")));
		}
		if (data.get("ShowAttendanceDetailsOnDevice") != null) {
			boolean validate = false;
			if (showAttendanceDetailsOnDeviceLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(showAttendanceDetailsOnDeviceLabel.get(0).getText(),
						"Show Attendance Details On Device");
				String type = showAttendanceDetailsOnDeviceinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("ShowAttendanceDetailsOnDevice")));
		}
		if (data.get("BypassFingerPalmFaceForAttendance") != null) {
			boolean validate = false;
			if (bypassFingerPalmFaceForAttendanceLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(bypassFingerPalmFaceForAttendanceLabel.get(0).getText(),
						"Bypass Finger/Palm/Face For Attendance");
				String type = bypassFingerPalmFaceForAttendanceinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("BypassFingerPalmFaceForAttendance")));
		}
		if (data.get("LeaveGroup") != null) {
			boolean validate = false;
			if (leaveGroupLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(leaveGroupLabel.get(0).getText(), "Leave Group");
				String type = leaveGroupinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("LeaveGroup")));
		}
		if (data.get("ReportingGroup") != null) {
			boolean validate = false;
			if (reportingGroupLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(reportingGroupLabel.get(0).getText(), "Reporting Group");
				String type = reportingGroupinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("ReportingGroup")));
		}
		if (data.get("ApprovalPolicy") != null) {
			boolean validate = false;
			if (approvalPolicyLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(approvalPolicyLabel.get(0).getText(), "Approval Policy");
				String type = approvalPolicyinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("ApprovalPolicy")));
		}

	}

	// Mayank
	public void groupAssociationReflectionsPolicy(Map<String, String> data) throws InterruptedException {
		if (data.get("AttendancePolicy") != null) {
			boolean validate = false;
			if (attendancePolicyLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(attendancePolicyLabel.get(0).getText(), "Attendance Policy");
				String type = attendancePolicyinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AttendancePolicy")));
		}
		if (data.get("LateINPolicy") != null) {
			boolean validate = false;
			if (lateINPolicyLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(lateINPolicyLabel.get(0).getText(), "Late-In Policy");
				String type = lateINPolicyinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("LateINPolicy")));
		}
		if (data.get("EarlyOUTPolicy") != null) {
			boolean validate = false;
			if (earlyOUTPolicyLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(earlyOUTPolicyLabel.get(0).getText(), "Early-Out Policy");
				String type = earlyOUTPolicyinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("EarlyOUTPolicy")));
		}
		if (data.get("OvertimePolicy") != null) {
			boolean validate = false;
			if (overtimePolicyLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(overtimePolicyLabel.get(0).getText(), "Overtime Policy");
				String type = overtimePolicyinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("OvertimePolicy")));
		}
		if (data.get("AbsenteePolicy") != null) {
			boolean validate = false;
			if (absenteePolicyLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(absenteePolicyLabel.get(0).getText(), "Absentee Policy");
				String type = absenteePolicyinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AbsenteePolicy")));
		}
		if (data.get("COFFPolicy") != null) {
			boolean validate = false;
			if (cOFFPolicyLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(cOFFPolicyLabel.get(0).getText(), "C-OFF Policy");
				String type = cOFFPolicyinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("COFFPolicy")));
		}
	}

	// Mayank
	public void groupAssociationReflectionsAccessDetails(Map<String, String> data) throws InterruptedException {
		if (data.get("AccessValidity") != null) {
			boolean validate = false;
			if (accessValidityLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(accessValidityLabel.get(0).getText(), "Access Validity");
				String type = accessValidityinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AccessValidity")));
		}
		if (data.get("AccessValidityDate") != null) {
			boolean validate = false;
			if (accessValidityDateLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(accessValidityDateLabel.get(0).getText(), "Access Validity Date");
				String type = accessValidityDateinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AccessValidityDate")));
		}
		if (data.get("AccessLevelForSmartIdentification") != null) {
			boolean validate = false;
			if (accessLevelForSmartIdentificationLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(accessLevelForSmartIdentificationLabel.get(0).getText(),
						"Access Level For Smart Identification");
				String type = accessLevelForSmartIdentificationinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AccessLevelForSmartIdentification")));
		}
		if (data.get("BypassFinger") != null) {
			boolean validate = false;
			if (bypassFingerLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(bypassFingerLabel.get(0).getText(), "Bypass Finger");
				String type = bypassFingerinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("BypassFinger")));
		}
		if (data.get("BypassPalm") != null) {
			boolean validate = false;
			if (bypassPalmLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(bypassPalmLabel.get(0).getText(), "Bypass Palm");
				String type = bypassPalminput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("BypassPalm")));
		}
		if (data.get("EnableAdvanceAccessControl") != null) {
			boolean validate = false;
			if (enableAdvanceAccessControlLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(enableAdvanceAccessControlLabel.get(0).getText(), "Enable Advance Access Control");
				String type = enableAdvanceAccessControlinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("EnableAdvanceAccessControl")));
		}
		if (data.get("ShiftBasedAccess") != null) {
			boolean validate = false;
			if (shiftBasedAccessLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(shiftBasedAccessLabel.get(0).getText(), "Shift Based Access");
				String type = shiftBasedAccessinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("ShiftBasedAccess")));
		}
		if (data.get("ShiftSchedule") != null) {
			boolean validate = false;
			if (shiftScheduleLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(shiftScheduleLabel.get(0).getText(), "Shift Schedule");
				String type = shiftScheduleinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("ShiftSchedule")));
		}
		if (data.get("StartShift") != null) {
			boolean validate = false;
			if (startShiftLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(startShiftLabel.get(0).getText(), "Start Shift");
				String type = startShiftinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("StartShift")));
		}
		if (data.get("HolidaySchedule") != null) {
			boolean validate = false;
			if (holidayScheduleLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(holidayScheduleLabel.get(0).getText(), "Holiday Schedule");
				String type = holidayScheduleinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("HolidaySchedule")));
		}
		if (data.get("DeviceGroup") != null) {
			boolean validate = false;
			if (deviceGroupLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(deviceGroupLabel.get(0).getText(), "Device Group");
				String type = deviceGroupinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("DeviceGroup")));
		}
		if (data.get("BiometricGroupNo") != null) {
			boolean validate = false;
			if (biometricGroupNoLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(biometricGroupNoLabel.get(0).getText(), "Biometric Group No.");
				String type = biometricGroupNoinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("BiometricGroupNo")));
		}
		if (data.get("RoamingUser") != null) {
			boolean validate = false;
			if (roamingUserLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(roamingUserLabel.get(0).getText(), "Roaming User");
				String type = roamingUserinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("RoamingUser")));
		}
		if (data.get("SmartAccessRoute") != null) {
			boolean validate = false;
			if (smartAccessRouteLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(smartAccessRouteLabel.get(0).getText(), "Smart Access Route");
				String type = smartAccessRouteinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("SmartAccessRoute")));
		}
		if (data.get("MaximumSmartAccessRouteLevel") != null) {
			boolean validate = false;
			if (maximumSmartAccessRouteLevelLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(maximumSmartAccessRouteLevelLabel.get(0).getText(),
						"Maximum Smart Access Route Level");
				String type = maximumSmartAccessRouteLevelinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("MaximumSmartAccessRouteLevel")));
		}
		if (data.get("EnableElevatorAccessControl") != null) {
			boolean validate = false;
			if (enableElevatorAccessControlLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(enableElevatorAccessControlLabel.get(0).getText(),
						"Enable Elevator Access Control");
				String type = enableElevatorAccessControlinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("EnableElevatorAccessControl")));
		}
		if (data.get("ElevatorFloorGroup") != null) {
			boolean validate = false;
			if (elevatorFloorGroupLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(elevatorFloorGroupLabel.get(0).getText(), "Elevator Floor Group");
				String type = elevatorFloorGroupinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("ElevatorFloorGroup")));
		}

	}

	// Mayank
	public void groupAssociationReflectionsCafeteria(Map<String, String> data) throws InterruptedException {
		if (data.get("DiscountLevel") != null) {
			boolean validate = false;
			if (discountLevelLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(discountLevelLabel.get(0).getText(), "Discount Level");
				String type = discountLevelinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("DiscountLevel")));
		}
		if (data.get("CafeteriaUsagePolicy") != null) {
			boolean validate = false;
			if (cafeteriaUsagePolicyLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(cafeteriaUsagePolicyLabel.get(0).getText(), "Cafeteria Usage Policy");
				String type = cafeteriaUsagePolicyinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("CafeteriaUsagePolicy")));
		}
		if (data.get("EnableOfflineTransaction") != null) {
			boolean validate = false;
			if (enableOfflineTransactionLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(enableOfflineTransactionLabel.get(0).getText(), "Enable Offline Transaction");
				String type = enableOfflineTransactioninput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("EnableOfflineTransaction")));
		}
		if (data.get("PrepaidBalanceManagement") != null) {
			boolean validate = false;
			if (prepaidBalanceManagementLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(prepaidBalanceManagementLabel.get(0).getText(), "Balance Management");
				String type = prepaidBalanceManagementinput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("PrepaidBalanceManagement")));
		}
		if (data.get("PrepaidDeviceServerBalanceCheck") != null) {
			boolean validate = false;
			if (prepaidDeviceServerBalanceCheckLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(prepaidDeviceServerBalanceCheckLabel.get(0).getText(),
						"Device-Server Balance Check");
				String type = prepaidDeviceServerBalanceCheckinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("PrepaidDeviceServerBalanceCheck")));
		}
		if (data.get("PrepaidMaximumUsageLimitPerMonth") != null) {
			boolean validate = false;
			if (prepaidMaximumUsageLimitPerMonthLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(prepaidMaximumUsageLimitPerMonthLabel.get(0).getText(),
						"Maximum Usage Limit Per Month");
				String type = prepaidMaximumUsageLimitPerMonthinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("PrepaidMaximumUsageLimitPerMonth")));
		}
		if (data.get("PrepaidMaximumUsageLimitPerDay") != null) {
			boolean validate = false;
			if (prepaidMaximumUsageLimitPerDayLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(prepaidMaximumUsageLimitPerDayLabel.get(0).getText(),
						"Maximum Usage Limit Per Day");
				String type = prepaidMaximumUsageLimitPerDayinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("PrepaidMaximumUsageLimitPerDay")));
		}
		if (data.get("PostpaidAllowedUsagePerMonth") != null) {
			boolean validate = false;
			if (postpaidAllowedUsagePerMonthLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(postpaidAllowedUsagePerMonthLabel.get(0).getText(), "Allowed Usage Per Month");
				String type = postpaidAllowedUsagePerMonthinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("PostpaidAllowedUsagePerMonth")));
		}
		if (data.get("PostpaidMaximumUsageLimitPerMonth") != null) {
			boolean validate = false;
			if (postpaidMaximumUsageLimitPerMonthLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(postpaidMaximumUsageLimitPerMonthLabel.get(0).getText(),
						"Maximum Usage Limit Per Month");
				String type = postpaidMaximumUsageLimitPerMonthinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("PostpaidMaximumUsageLimitPerMonth")));
		}
		if (data.get("PostpaidMaximumUsageLimitPerDay") != null) {
			boolean validate = false;
			if (postpaidMaximumUsageLimitPerDayLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(postpaidMaximumUsageLimitPerDayLabel.get(0).getText(),
						"Maximum Usage Limit Per Day");
				String type = postpaidMaximumUsageLimitPerDayinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("PostpaidMaximumUsageLimitPerDay")));
		}
	}

	// Mayank
	public void groupAssociationReflectionsJobCosting(Map<String, String> data) throws InterruptedException {
		if (data.get("JobCosting") != null) {
			boolean validate = false;
			if (jobCostingLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(jobCostingLabel.get(0).getText(), "Job Costing");
				String type = jobCostinginput.getAttribute("type");
				Assert.assertEquals(type, "select-one"); // Expected type select-one get in this parameter instead of
															// dropdown
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("JobCosting")));
		}
	}

	// Mayank
	public void groupAssociationReflectionsFVM(Map<String, String> data) throws InterruptedException {
		if (data.get("EnableFVM") != null) {
			boolean validate = false;
			if (enableFVMLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(enableFVMLabel.get(0).getText(), "Enable FVM");
				String type = enableFVMinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("EnableFVM")));
		}
	}

	// Mayank
	public void groupAssociationReflectionsFaceRecognition(Map<String, String> data) throws InterruptedException {
		if (data.get("EnableFaceRecognition") != null) {
			boolean validate = false;
			if (enableFRLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(enableFRLabel.get(0).getText(), "Enable Face Recognition");
				String type = enableFRinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("EnableFaceRecognition")));
		}
	}

	// Mayank
	public void groupAssociationReflectionsVisitorManagement(Map<String, String> data) throws InterruptedException {
		if (data.get("AuthorizedHostUser") != null) {
			boolean validate = false;
			if (authorizedHostUserLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(authorizedHostUserLabel.get(0).getText(), "Authorized Host User");
				String type = authorizedHostUserinput.getAttribute("type");
				Assert.assertEquals(type, "checkbox");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("AuthorizedHostUser")));
		}
		if (data.get("DeviceGroup") != null) {
			boolean validate = false;
			if (vmsDeviceGroupLabel.size() > 0) {
				validate = true;
				Assert.assertEquals(vmsDeviceGroupLabel.get(0).getText(), "Device Group");
				String type = vmsDeviceGroupinput.getAttribute("type");
				Assert.assertEquals(type, "text");
			}
			Assert.assertEquals(validate, Boolean.parseBoolean(data.get("DeviceGroup")));
		}
	}

	// Mayank
	public void groupAssociationReflections(String module, Map<String, String> data) throws InterruptedException {
		waitForElementClickable(searchTextBoxTitleBar);
		if (element_isEnabled(searchTextBoxTitleBar) == true) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			Thread.sleep(2000);
			searchTextBoxTitleBar.sendKeys(Keys.ENTER);
			Thread.sleep(2000);
			List<String> list = new ArrayList<String>();
			for (int i = 0; i < groupName.size(); i++) {
				list.add(groupName.get(i).getText());
				if (groupName.get(i).getText().equalsIgnoreCase(data.get("Name"))) {
					groupName.get(i).click();
					Thread.sleep(2000);
				}
			}
			if (!list.contains(data.get("Name"))) {
				logger.debug("Entered Group Name is not present");
			}
		}
		// Main COde
		if (associationMappingPanelOpenOrNot.size() == 0) {
			element_Click(associationMappingPanel);
		}
		Thread.sleep(1000);

		switch (module) {
		case "ESS":
			groupAssociationReflectionsESS(data);
			break;

		case "Attendance":
			groupAssociationReflectionsAttendance(data);
			break;

		case "Policy":
			groupAssociationReflectionsPolicy(data);
			break;

		case "Access Details":
			groupAssociationReflectionsAccessDetails(data);
			break;

		case "Cafeteria":
			groupAssociationReflectionsCafeteria(data);
			break;

		case "Job Costing":
			groupAssociationReflectionsJobCosting(data);
			break;

		case "Field Visit Management":
			groupAssociationReflectionsFVM(data);
			break;

		case "Face Recognition":
			groupAssociationReflectionsFaceRecognition(data);
			break;

		case "Visitor Management":
			groupAssociationReflectionsVisitorManagement(data);
			break;

		default:
			logger.debug("Module Name is incorrect");
			Assert.assertEquals("Module Name is incorrect", "Module Name should be correct");
			break;
		}
	}

	// Mayank
	public void setValueOfAssociatedParameters(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementClickable(searchTextBoxTitleBar);
		if (element_isEnabled(searchTextBoxTitleBar) == true) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			Thread.sleep(2000);
			searchTextBoxTitleBar.sendKeys(Keys.ENTER);
			Thread.sleep(2000);
			List<String> list = new ArrayList<String>();
			for (int i = 0; i < groupName.size(); i++) {
				list.add(groupName.get(i).getText());
				if (groupName.get(i).getText().equalsIgnoreCase(data.get("Name"))) {
					groupName.get(i).click();
					Thread.sleep(2000);
				}
			}
			if (!list.contains(data.get("Name"))) {
				logger.debug("Entered Group Name is not present");
			}
		}
		// Main COde
		if (associationMappingPanelOpenOrNot.size() == 0) {
			element_Click(associationMappingPanel);
		}
		Thread.sleep(1000);

		if (data.get("EnableAccount") != null) {
			Boolean enableAccount = Boolean.parseBoolean(data.get("EnableAccount"));
			if (enableAccount == true) {
				if (!enableAccountinput.isSelected()) {
					element_Click(enableAccountinput);
				}
			} else {
				if (enableAccountinput.isSelected()) {
					element_Click(enableAccountinput);
				}
			}
		}
		if (data.get("EnableAttendanceCalculation") != null) {
			Boolean enableAttendanceCalculation = Boolean.parseBoolean(data.get("EnableAttendanceCalculation"));
			if (enableAttendanceCalculation == true) {
				if (!enableAttendanceCalculationinput.isSelected()) {
					element_Click(enableAttendanceCalculationinput);
				}
			} else {
				if (enableAttendanceCalculationinput.isSelected()) {
					element_Click(enableAttendanceCalculationinput);
				}
			}
		}
		if (data.get("AttendancePolicy") != null) {
			element_Clear(attendancePolicyinput);
			element_InputTextUsingActionClass(attendancePolicyinput, data.get("AttendancePolicy"));
			Thread.sleep(400);
			element_TextBoxToClickOnTab(attendancePolicyinput);
			Thread.sleep(1000);
		}
		if (data.get("AccessValidity") != null) {
			Boolean accessValidity = Boolean.parseBoolean(data.get("AccessValidity"));
			if (accessValidity == true) {
				if (!accessValidityinput.isSelected()) {
					element_Click(accessValidityinput);
				}
				String date = dateSelected(data.get("AccessValidityDate"));
				element_Clear(accessValidityDateinput);
				element_InputTextUsingActionClass(accessValidityDateinput, date);
			} else {
				if (accessValidityinput.isSelected()) {
					element_Click(accessValidityinput);
				}
			}
		}
		if (data.get("DiscountLevel") != null) {
			element_DropDownSelectByvisibleText(discountLevelinput, data.get("DiscountLevel"));
		}
		if (data.get("JobCosting") != null) {
			element_DropDownSelectByvisibleText(jobCostinginput, data.get("JobCosting"));
			Thread.sleep(1000);
			if (jobCostingEnableOkBtn.size() > 0) {
				element_Click(jobCostingEnableOkBtn.get(0));
			}
			Thread.sleep(1000);
		}
		if (data.get("EnableFVM") != null) {
			Boolean enableFVM = Boolean.parseBoolean(data.get("EnableFVM"));
			if (enableFVM == true) {
				if (!enableFVMinput.isSelected()) {
					element_Click(enableFVMinput);
				}
			} else {
				if (enableFVMinput.isSelected()) {
					element_Click(enableFVMinput);
				}
			}
		}
		if (data.get("EnableFaceRecognition") != null) {
			Boolean enableFaceRecognition = Boolean.parseBoolean(data.get("EnableFaceRecognition"));
			if (enableFaceRecognition == true) {
				if (!enableFRinput.isSelected()) {
					element_Click(enableFRinput);
				}
			} else {
				if (enableFRinput.isSelected()) {
					element_Click(enableFRinput);
				}
			}
		}
		if (data.get("AuthorizedHostUser") != null) {
			Boolean authorizedHostUser = Boolean.parseBoolean(data.get("AuthorizedHostUser"));
			if (authorizedHostUser == true) {
				if (!authorizedHostUserinput.isSelected()) {
					element_Click(authorizedHostUserinput);
				}
			} else {
				if (authorizedHostUserinput.isSelected()) {
					element_Click(authorizedHostUserinput);
				}
			}
		}
		if (data.get("AccessProfile") != null) {
			Boolean accessProfile1 = Boolean.parseBoolean(data.get("AccessProfile"));
			if (accessProfile1 == true) {
				if (!chkAccessProfile.isSelected()) {
					element_Click(chkAccessProfile);
				}
			} else {
				if (chkAccessProfile.isSelected()) {
					element_Click(chkAccessProfile);
				}
			}
		}
		if(data.get("Scheduler") != null) {
			selectUsersOrGroupFromPicklist(data.get("Scheduler"), jobSchedulerNameTxt);
		}
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(1000);
		if (data.get("ConfirmationPopup").equalsIgnoreCase("Accept") || data.get("ConfirmationPopup").equalsIgnoreCase("Yes")) {
			Thread.sleep(1000);
			if(confirmYesBtnSize.size() > 0) {
				element_Click(confirmYesBtn);
				pageLoadWaitng();
			}
		} else {
			element_Click(confirmNoBtn);
			pageLoadWaitng();
		}
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}

	// Mayank
	public void assignUserFromGroupPages(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementClickable(searchTextBoxTitleBar);
		if (element_isEnabled(searchTextBoxTitleBar) == true) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			Thread.sleep(2000);
			searchTextBoxTitleBar.sendKeys(Keys.ENTER);
			Thread.sleep(2000);
			List<String> list = new ArrayList<String>();
			for (int i = 0; i < groupName.size(); i++) {
				list.add(groupName.get(i).getText());
				if (groupName.get(i).getText().equalsIgnoreCase(data.get("Name"))) {
					groupName.get(i).click();
					Thread.sleep(2000);
				}
			}
			if (!list.contains(data.get("Name"))) {
				logger.debug("Entered Group Name is not present");
			}
		}
		// Main COde
		if (userInThisGroupPanelOpenOrNot.size() == 0) {
			element_Click(userInThisGroupPanel);
		}
		Thread.sleep(1000);
		element_InputTextUsingActionClass(useridTxt, data.get("Userid"));
		Thread.sleep(400);
		element_TextBoxToClickOnTab(useridTxt);

		saveButtonClick();
		if (confirmPopUp.size() > 0) {
			element_Click(confirmYesBtn);
			pageLoadWaitng();
		}

		Assert.assertEquals(validationMessage(), data.get("validation"));
	}

	public void verifyGroupInEnterpriseModule(String group, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		boolean expRes = true;
		waitForElementClickable(searchTextBoxTitleBar);
		if (element_isEnabled(searchTextBoxTitleBar) == true) {
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("NAME: "+data.get("NAME"));
				String name = data.get("NAME");
				boolean actRes = false;
				element_Clear(searchTextBoxTitleBar);
				element_InputTextUsingActionClass(searchTextBoxTitleBar, name);
				Thread.sleep(1000);
				element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
				Thread.sleep(2000);
				for (int i = 0; i < groupName.size(); i++) {
					String grpName = groupName.get(i).getText();
					if (grpName.toUpperCase().equalsIgnoreCase(name.toUpperCase())) {
						actRes = true;
						Thread.sleep(2000);
						break;
					}
				}
				Assert.assertEquals(actRes, expRes);
			}
		}
	}

	// Kamal
	public void gotoOrganizationReport() throws Exception {
		element_Click(report);
		Thread.sleep(1000);
		element_Click(organizationReport);
	}

	// Kamal
	public void gotoBranchReport() throws Exception {
		element_Click(report);
		Thread.sleep(1000);
		element_Click(branchReport);
	}

	// Kamal
	public void gotoDepartmentReport() throws Exception {
		element_Click(report);
		Thread.sleep(1000);
		element_Click(departmentReport);
	}

	// Kamal
	public void gotodesigationReport() throws Exception {
		element_Click(report);
		Thread.sleep(1000);
		element_Click(designationReport);
	}

	// Kamal
	public void gotoSectionReport() throws Exception {
		element_Click(report);
		Thread.sleep(1000);
		element_Click(sectionReport);
	}

	// Kamal
	public void gotoCategoryReport() throws Exception {
		element_Click(report);
		Thread.sleep(1000);
		element_Click(categoryReport);
	}

	// Kamal
	public void gotoGradeReport() throws Exception {
		element_Click(report);
		Thread.sleep(1000);
		element_Click(gradeReport);
	}

	// Kamal
	public void gotoCustomGroup1Report() throws Exception {
		element_Click(report);
		Thread.sleep(1000);
		element_Click(customGroup1Report);
	}

	// Kamal
	public void gotoCustomGroup2Report() throws Exception {
		element_Click(report);
		Thread.sleep(1000);
		element_Click(customGroup2Report);
	}

	// Kamal
	public void gotoCustomGroup3Report() throws Exception {
		element_Click(report);
		Thread.sleep(1000);
		element_Click(customGroup3Report);
	}
	
	public void assignJobToGroup(String groupName, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(nameTextBox);
		String valmsg = null;
		element_InputTextUsingActionClass(nameTextBox, groupName);
		Thread.sleep(400);
		element_TextBoxToClickOnTab(nameTextBox); // This method use for userid control to click on tab
		Thread.sleep(3000);
		if (!element_getInputControlValue(nameTextBox).isBlank() || !element_getInputControlValue(nameTextBox).isEmpty()) {
			if (associationMappingPanelOpenOrNot.size() == 0) {
				element_Click(associationMappingPanel);
				Thread.sleep(1000);
			}
			waitForElementVisible(jobCostingDD);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("JobCode: "+data.get("JobCode"));
				element_Click(jobAddBtn);
				Thread.sleep(1000);
				element_Clear(jobCodeTxt);
				element_InputTextUsingActionClass(jobCodeTxt, data.get("JobCode"));
				Thread.sleep(400);
				element_TextBoxToClickOnTab(jobCodeTxt);
				Thread.sleep(1000);
				if (data.get("AssignmentStart") != null) {
					String assignmentStartDate = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentStart"));
					element_Clear(assignmentStartDateTxt);
					element_InputTextUsingActionClass(assignmentStartDateTxt, assignmentStartDate);
					Thread.sleep(400);
					element_TextBoxToClickOnTab(assignmentStartDateTxt);
				}
				if (data.get("AssignmentEnd") != null) {
					String assignmentEndDate = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentEnd"));
					element_Clear(assignmentEndDateTxt);
					element_InputTextUsingActionClass(assignmentEndDateTxt, assignmentEndDate);
					Thread.sleep(400);
					element_TextBoxToClickOnTab(assignmentEndDateTxt);
				}
				element_Click(jobAssignmentOkBtn);
				Thread.sleep(700);
				if(data.get("Validation")!=null) {
					if(jobCostingValMsgSize.size() > 0) {
						String val = jobCostingValMsg.getText();
						Thread.sleep(1000);
						Assert.assertEquals(val, data.get("Validation"));
					}
				}
			}
			Thread.sleep(1000);
			saveButtonClick();
			Thread.sleep(1500);
			if(confirmPopupYesbtnSize.size() > 0) {
				element_Click(confirmPopupYesbtn);
			}
			Thread.sleep(1000);
			valmsg = validationMessage();
			Thread.sleep(700);
			Assert.assertEquals(valmsg, "Saved Successfully");
		} else {
			cancelButtonClick();
			Assert.assertEquals("User Not Found", "Saved Successfully");
			Thread.sleep(1000);
		}
	}
	
	public void prioritizeJob(String groupName, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, groupName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			if (allGRPNames.size() > 0) {
				for (int j = 0; j < allGRPNames.size(); j++) {
					String WOName = allGRPNames.get(j).getText();
					if (WOName.equalsIgnoreCase(groupName)) {
						allGRPNames.get(j).click();
						break;
					}
				}
			}
		} 
		
//		waitForElementVisible(nameTextBox);
//		element_InputTextUsingActionClass(nameTextBox, groupName);
//		Thread.sleep(400);
//		//element_TextBoxToClickOnTab(nameTextBox); // This method use for userid control to click on tab
//		element_Click(autoID);
		Thread.sleep(3000);
		if (!element_getInputControlValue(nameTextBox).isBlank() || !element_getInputControlValue(nameTextBox).isEmpty()) {
			if (associationMappingPanelOpenOrNot.size() == 0) {
				element_Click(associationMappingPanel);
				Thread.sleep(1000);
			}
			waitForElementVisible(jobCostingDD);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("JobCode: "+data.get("JobCode"));
				for(int i=0; i<defaultJobTable.size(); i++) {
					String actualJobCode = defaultJobTable.get(i).getText();
					if(data.get("JobCode").equalsIgnoreCase(actualJobCode)) {
						if(data.get("PrioritizeJob").equalsIgnoreCase("up")) {
							WebElement keyUp = defaultJobTable.get(i).findElement(By.xpath("following-sibling::td[7]/i[@key='Up']"));
							Thread.sleep(500);
							element_ClickUsingJS(keyUp);
							//element_Click(keyUp);
							Thread.sleep(1000);
						}
						if(data.get("PrioritizeJob").equalsIgnoreCase("down")) {
							WebElement keyDown = defaultJobTable.get(i).findElement(By.xpath("following-sibling::td[7]/i[@key='Down']"));
							Thread.sleep(500);
							element_ClickUsingJS(keyDown);
							//element_Click(keyDown);
							Thread.sleep(1000);
						}
						break;
					}
				}
			}
			Thread.sleep(2000);
			saveButtonClick();
			Thread.sleep(2000);
			if(confirmPopupYesbtnSize.size() > 0) {
				element_Click(confirmPopupYesbtn);
			}
			Thread.sleep(2000);
			String valMsg = validationMessage();
			Thread.sleep(2000);
			Assert.assertEquals(valMsg, "Saved Successfully");
		}else {
			Assert.assertEquals("Group Not Found", "Saved Successfully");
		}
	}
	
	public void verifyPrioritizedJob(String groupName, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(nameTextBox);
		
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, groupName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			if (allGRPNames.size() > 0) {
				for (int j = 0; j < allGRPNames.size(); j++) {
					String WOName = allGRPNames.get(j).getText();
					if (WOName.equalsIgnoreCase(groupName)) {
						allGRPNames.get(j).click();
						break;
					}
				}
			}
		} 
		
//		element_InputTextUsingActionClass(nameTextBox, groupName);
//		Thread.sleep(400);
//		element_TextBoxToClickOnTab(nameTextBox); // This method use for userid control to click on tab
		Thread.sleep(3000);
		if (!element_getInputControlValue(nameTextBox).isBlank() || !element_getInputControlValue(nameTextBox).isEmpty()) {
			if (associationMappingPanelOpenOrNot.size() == 0) {
				element_Click(associationMappingPanel);
				Thread.sleep(1000);
			}
			waitForElementVisible(jobCostingDD);
			ArrayList<String> actualJobCodeAr = new ArrayList<String>();
			for (int i = 0; i < defaultJobTable.size(); i++) {
				actualJobCodeAr.add(defaultJobTable.get(i).getText());
			}
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("JobCode: " + data.get("JobCode"));
				String[] expectedJobCodeAr = data.get("JobCode").split(",");
				for (int i = 0; i < expectedJobCodeAr.length; i++) {
					System.out.println("expectedJobCodeAr : " + expectedJobCodeAr[i]);
					System.out.println("actualJobCodeAr : " + actualJobCodeAr.get(i));
					Assert.assertEquals(actualJobCodeAr.get(i), expectedJobCodeAr[i].trim());
				}
			}
		}else {
			Assert.assertEquals(nameTextBox.getAttribute("value"), groupName);
		}
	}
	
	
	public void assignAcsProfile(String groupName, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(nameTextBox);
		Thread.sleep(400);
		String valMsg = null;
		element_dynamicDDSelect(nameTextBox, groupName);
		Thread.sleep(400);
//		element_TextBoxToClickOnTab(nameTextBox); // This method use for userid control to click on tab
		Thread.sleep(3000);
		if (!element_getInputControlValue(nameTextBox).isBlank() || !element_getInputControlValue(nameTextBox).isEmpty()) {
			if (associationMappingPanelOpenOrNot.size() == 0) {
				element_Click(associationMappingPanel);
				Thread.sleep(1000);
			}
			waitForElementVisible(chkAccessProfile);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Panel Name: "+data.get("PanelName"));
				element_Clear(associationMapSearch);
				element_InputTextUsingActionClass(associationMapSearch, data.get("PanelName"));
				element_TextBoxToClickOnEnter(associationMapSearch);
				Thread.sleep(1000);
				for(int i =0; i<assignAcsProfileTable.size(); i++) {
					String actPanelName = assignAcsProfileTable.get(i).getText();
					if(data.get("PanelName").equalsIgnoreCase(actPanelName)) {
						WebElement editBtn = assignAcsProfileTable.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][3]/i"));
						element_Click(editBtn);
						Thread.sleep(500);
						if(data.get("PanelSelection") != null) {
							WebElement panelSelectionCheckbox = assignAcsProfileTable.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][1]/input"));
							Boolean panelSelection1 = Boolean.parseBoolean(data.get("PanelSelection"));
							if (panelSelection1 == true) {
								if (!panelSelectionCheckbox.isSelected()) {
									element_Click(panelSelectionCheckbox);
								}
							} else {
								if (panelSelectionCheckbox.isSelected()) {
									element_Click(panelSelectionCheckbox);
								}
							}
						}
						Thread.sleep(700);
						if(data.get("AcsPrflName") != null) {
							WebElement accessProfileNameDD = assignAcsProfileTable.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][2]/select"));
							element_DropDownSelectByvisibleText(accessProfileNameDD, data.get("AcsPrflName"));
							Thread.sleep(500);
						}
						element_Click(gridSaveBtn);
						Thread.sleep(1000);
						break;
					}
				}
			}
			saveButtonClick();
			Thread.sleep(2000);
			//if(yesButtonSize.size() > 0) {
				element_Click(yesButton);
			//}
			Thread.sleep(2000);
			valMsg = validationMessage();
			Assert.assertEquals(valMsg, "Saved Successfully");
		} else {
			cancelButtonClick();
			Assert.assertEquals("Group Not Found", "Saved Successfully");
			Thread.sleep(1000);
		}
	}
	
	public void assignDeviceGroup(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(nameTextBox);
		String valMsg = null;
		element_Clear(nameTextBox);
		element_InputTextUsingActionClass(nameTextBox, data.get("Name"));
		Thread.sleep(400);
		element_TextBoxToClickOnTab(nameTextBox);
		Thread.sleep(3000);
		if(!element_getInputControlValue(nameTextBox).isBlank() || !element_getInputControlValue(nameTextBox).isEmpty()) {
			if (associationMappingPanelOpenOrNot.size() == 0) {
				element_Click(associationMappingPanel);
				Thread.sleep(1500);
//				waitForElementVisible(deviceGroupNameTxt);
			}
			selectUsersOrGroupFromPicklist(data.get("DeviceGroup"), deviceGroupNameTxt);
			saveButtonClick();
			Thread.sleep(2000);
			element_Click(yesButton);
			Thread.sleep(1500);
			valMsg = validationMessage();
			Assert.assertEquals(valMsg, data.get("Validation"));
			reloadPageButtonClick();
		}else {
			cancelButtonClick();
			Assert.assertEquals("Group Not Found", data.get("Validation"));
			Thread.sleep(1000);
		}
	}
	
	public void removeJobScheduler(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(nameTextBox);
		String valMsg = null;
		element_Clear(nameTextBox);
		element_InputTextUsingActionClass(nameTextBox, data.get("Name"));
		Thread.sleep(400);
		element_TextBoxToClickOnTab(nameTextBox);
		Thread.sleep(3000);
		if(!element_getInputControlValue(nameTextBox).isBlank() || !element_getInputControlValue(nameTextBox).isEmpty()) {
			if (associationMappingPanelOpenOrNot.size() == 0) {
				element_Click(associationMappingPanel);
				Thread.sleep(1500);
			}
			element_Clear(jobSchedulerSearch);
			element_InputTextUsingActionClass(jobSchedulerSearch, data.get("SchedulerName"));
			element_Click(jobSchedulerSearch);
			if(jobSchedulerTable.size()>0) {
				for(int i=0; i<jobSchedulerTable.size(); i++) {
					String schedulerName = jobSchedulerTable.get(i).getText();
					if(schedulerName.equalsIgnoreCase(data.get("SchedulerName"))) {
						WebElement gridDeleteButton = jobSchedulerTable.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][1]/i"));
						element_Click(gridDeleteButton);
						Thread.sleep(800);
						driver.switchTo().alert().accept();
						Thread.sleep(500);
						break;
					}
					
				}
			}
			saveButtonClick();
			Thread.sleep(2500);
			element_Click(yesButton);
			Thread.sleep(1500);
			valMsg = validationMessage();
			Assert.assertEquals(valMsg, data.get("Validation"));
			reloadPageButtonClick();
		}else {
			cancelButtonClick();
			Assert.assertEquals("Group Not Found", data.get("Validation"));
			Thread.sleep(1000);
		}
	}

}
