package PageObject.UserModule;

import static org.testng.Assert.assertEquals;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.time.DateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.tools.ant.filters.LineContains.Contains;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import PageObject.JobProcessingCosting.JobPO;
import groovyjarjarantlr4.v4.parse.ANTLRParser.throwsSpec_return;
import io.cucumber.datatable.DataTable;

public class UserConfigurationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(UserConfigurationPO.class);

	public UserConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// ******************************************************************************
	// ************************Profile Tab Element************************
	// ******************************************************************************
	// *************Profile Tab -> Basic Tab Element************************
	@FindBy(xpath = "//*[text()='Basic']")
	private WebElement basicLabel;

	@FindBy(xpath = "//*[@class='form-label label-text control-label mx-input-theme lblRight grd-prevent-rtl']")
	private WebElement statusLabel;

	@FindBy(id = "ChkUserEnbl")
	private WebElement active;

	@FindBy(id = "AutoUserID")
	private WebElement userId;

	@FindBy(id = "AutoUserName")
	private WebElement userName;

	@FindBy(id = "btnDeleteOK")
	private WebElement confirmDeleteButton;

	@FindBy(xpath = "//*[text()='Basic' and @class=\"form-label control-label mx-input-theme\"]/ancestor::a")
	private WebElement basicTab;

//	@FindBy(xpath = "//*[@title='Edit (Alt+E)']")
//	private WebElement editButton;

	@FindBy(id = "btnResetPwd")
	private WebElement resetPassBtn;

	@FindBy(id = "btnUserBlacklist")
	private WebElement blacklistBtn;

	@FindBy(id = "txtBlacklistReason")
	private WebElement blacklistReasonTxt;

	@FindBy(id = "btnOk")
	private WebElement blacklistOkBtn;

	@FindBy(id = "btnUserRestore")
	private WebElement restoreUserBtn;

	// *************Profile Tab -> General Tab Element************************
	@FindBy(xpath = "//*[@class='nav navbar-nav hr-tab hr-tab-user panel-group accordion']//*[contains(text(),'General')]")
	private WebElement generalTab;

	@FindBy(xpath = "//*[@class='fieldset_width']//*[@class='tab-fieldset' and not(@hidden)]/div[4]//div[@class='form-group' and not(@hidden)]/div[1]")
	private List<WebElement> customFieldRows;

	@FindBy(xpath = "//*[@class='overlay_alert']/label") // By chhaya
	private List<WebElement> validationMessage;

	@FindBy(id = "_TxtJoinDT")
	private WebElement joiningDatetxt;

	@FindBy(id = "_TxtBirthDT")
	private WebElement birthDatetxt;

	@FindBy(id = "_TxtLeaveDT")
	private WebElement leavingDatetxt;

	@FindBy(id = "_TxtConfirmDT")
	private WebElement confirmDatetxt;

	// *************Profile Tab -> Contact Tab Element************************
	@FindBy(xpath = "//*[@class='nav navbar-nav hr-tab hr-tab-user panel-group accordion']//*[contains(text(),'Contact')]")
	private WebElement contactTab;

	@FindBy(id = "TxtPERSMobile")
	private WebElement personalMobile;

	@FindBy(id = "TxtPERSEmail")
	private WebElement personalEmail;

	// ******************************************************************************
	// ************************Devices Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='Devices']")
	private WebElement devicesTab;

	@FindBy(id = "UserConfigAutoDeviceSelectionName")
	private WebElement deviceNameTxt;

	@FindBy(id = "UserConfigAutoDeviceGroupName")
	private WebElement deviceGroupNameTxt;

	@FindBy(xpath = "//*[@class='nav navbar-nav hr-tab hr-tab-user panel-group accordion']//*[contains(text(),'Configure')]")
	private WebElement configureTab;

	@FindBy(xpath = "//*[@class='fieldset_width']//*[@class='tab-fieldset' and not(@hidden)]//*[@default='Device']/ancestor::div[@class='form-group']//select")
	private WebElement deviceDD;

	@FindBy(xpath = "//*[@class='fieldset_width']//*[@class='tab-fieldset' and not(@hidden)]//*[@default='Access Profile']/ancestor::div[@class='form-group']//select")
	private WebElement accessProfileDD;

	@FindBy(xpath = "//*[@id='div_grd_GrdDeviceGroup']//*[@name='cmnTxtSearch']")
	private WebElement deviceGroupSearch;

	@FindBy(xpath = "//*[@id='div_grd_GrdDeviceGroup']//table/tbody/tr/td[@class=\"mx-grid-edit-ww-bw cursor\" or  @class=\"grid-raw-size cursor grd-prevent-rtl\"]")
	private List<WebElement> deviceGroupTable;

	// ******************************************************************************
	// ************************Group Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='Group']")
	private WebElement groupTab;

	@FindBy(id = "UserConfigAutoReportingGroupName")
	private WebElement userConfigAutoReportingGroupName;

	@FindBy(id = "UserConfigAutoReportingGroupID")
	private WebElement userConfigAutoReportingGroupID;

	@FindBy(id = "UserConfigAutoApprovalPolicyID")
	private WebElement userConfigAutoApprovalPolicyID;

	@FindBy(id = "UserConfigAutoApprovalPolicyName")
	private WebElement UserConfigAutoApprovalPolicyName;

	@FindBy(id = "UserConfigAutoLeaveGroupID")
	private WebElement userConfigAutoLeaveGroupID;

	@FindBy(id = "UserConfigAutoLeaveGroupName")
	private WebElement UserConfigAutoLeaveGroupName;

	@FindBy(id = "UserConfigAutoWOGroupID")
	private WebElement userConfigAutoWOGroupID;

	@FindBy(id = "UserConfigAutoWOGroupName")
	private WebElement UserConfigAutoWOGroupName;

	// Chhaya
	@FindBy(id = "UserConfigAutoOrganizationName")
	private WebElement userConfigOrganizationGroupName;

	@FindBy(id = "UserConfigAutoOrganizationID")
	private WebElement userConfigAutoOrganizationID;

	@FindBy(id = "UserConfigAutoBranchID")
	private WebElement userConfigAutoBranchID;
	// Chhaya
	@FindBy(id = "UserConfigAutoBranchName")
	private WebElement userConfigBranchGroupName;

	@FindBy(id = "UserConfigAutoDepartmentName")
	private WebElement userConfigDepartmentGroupName;

	@FindBy(id = "UserConfigAutoDepartmentID")
	private WebElement userConfigAutoDepartmentID;

	@FindBy(id = "UserConfigAutoSectionID")
	private WebElement userConfigAutoSectionID;

	@FindBy(id = "UserConfigAutoSectionName")
	private WebElement userConfigSectionGroupName;

	@FindBy(id = "UserConfigAutoCategoryID")
	private WebElement userConfigAutoCategoryID;

	@FindBy(id = "UserConfigAutoCategoryName")
	private WebElement userConfigCategoryGroupName;

	@FindBy(id = "UserConfigAutoGradeID")
	private WebElement userConfigAutoGradeID;

	@FindBy(id = "UserConfigAutoGradeName")
	private WebElement userConfigGradeGroupName;

	@FindBy(id = "UserConfigAutoDesignationID")
	private WebElement userConfigAutoDesignationID;

	@FindBy(id = "UserConfigAutoDesignationName")
	private WebElement userConfigDesignationGroupName;

	@FindBy(id = "UserConfigAutoCustGRp1ID")
	private WebElement userConfigAutoCustGRp1ID;

	@FindBy(id = "UserConfigAutoCustGRp1Name")
	private WebElement userConfigCustomGroup1GroupName;

	@FindBy(id = "UserConfigAutoCustGRp2ID")
	private WebElement userConfigAutoCustGRp2ID;

	@FindBy(id = "UserConfigAutoCustGRp2Name")
	private WebElement userConfigCustomGroup2GroupName;

	@FindBy(id = "UserConfigAutoCustGRp3ID")
	private WebElement userConfigAutoCustGRp3ID;

	@FindBy(id = "UserConfigAutoCustGRp3Name")
	private WebElement userConfigCustomGroup3GroupName;

	@FindBy(xpath = "//*[@class='tab-fieldset' and not(@hidden)]//*[contains(@picklistname,'UserConfigAuto') and not(@searchid='LGID' or @searchid='ID' or @searchid='RGID')]//input[@placeholder='Name']")
	private List<WebElement> enterpriseGroupList;

	@FindBy(xpath = "//*[@class='tab-fieldset' and not(@hidden)]//label[contains(@class,'control-label mx-input-theme')]")
	private List<WebElement> enterpriseGroupLabelList;

	// ******************************************************************************
	// ************************T&A Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='T&A']")
	private WebElement timeattendanceTab;

	@FindBy(xpath = "//*[@class='nav navbar-nav hr-tab hr-tab-user panel-group accordion']//*[contains(text(),'Policy')]")
	private WebElement policytab;

	@FindBy(id = "UserConfigAutoAttendancePolicyName")
	private WebElement attendancePolicyName;

	@FindBy(id = "UserConfigAutoAbsentPolicyName")
	private WebElement absenteePolicyName;

	@FindBy(id = "UserConfigAutoOTPolicyName")
	private WebElement overtimePolicyName;

	@FindBy(id = "UserConfigAutoLateInPolicyName")
	private WebElement lateINPolicyName;

	@FindBy(id = "UserConfigAutoEarlyOutPolicyName")
	private WebElement earlyOUTPolicyName;

	@FindBy(id = "UserConfigAutoCOPolicyName")
	private WebElement cOffPolicyName;

	@FindBy(id = "UserConfigAutoAttendancePolicyID")
	private WebElement userConfigAutoAttendancePolicyID;

	@FindBy(id = "UserConfigAutoAbsentPolicyID")
	private WebElement userConfigAutoAbsentPolicyID;

	@FindBy(id = "UserConfigAutoOTPolicyID")
	private WebElement userConfigAutoOTPolicyID;

	@FindBy(id = "UserConfigAutoLateInPolicyID")
	private WebElement userConfigAutoLateInPolicyID;

	@FindBy(id = "UserConfigAutoEarlyOutPolicyID")
	private WebElement userConfigAutoEarlyOutPolicyID;

	@FindBy(id = "UserConfigAutoCOPolicyID")
	private WebElement userConfigAutoCOPolicyID;

	// ******************************************************************************
	// ************************T&A Tab Element************************
	// ******************************************************************************
	// *************T&A Tab -> Attendance Tab Element************************
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='T&A']")
	private WebElement tandATab;

	@FindBy(xpath = "//*[text()='Enable Attendance Calculation']")
	private WebElement enableAttendanceCalculationText;

	@FindBy(xpath = "//*[@title='Check For Enabling Attendance Calculation']")
	private WebElement enableAttendanceCalculationCheckbox;

	@FindBy(xpath = "//*[@title='Select Overtime or C-OFF applied to user']")
	private WebElement otCffEligibilityDD;

	@FindBy(id = "0_chkCoffAuthOn")
	private WebElement autoAuthCoffWO;

	@FindBy(id = "1_chkCoffAuthOn")
	private WebElement autoAuthCoffPH;

	@FindBy(id = "2_chkCoffAuthOn")
	private WebElement autoAuthCoffWOPH;

	@FindBy(id = "3_chkCoffAuthOn")
	private WebElement autoAuthCoffFB;

	@FindBy(id = "4_chkCoffAuthOn")
	private WebElement autoAuthCoffRD;

	@FindBy(id = "5_chkCoffAuthOn")
	private WebElement autoAuthCoffNormal;

	@FindBy(xpath = "//*[contains(@id,'_chkCoffAuthOn')]")
	private List<WebElement> autoAuthCoffOptionsFlag;

	@FindBy(xpath = "//*[@name='id_150']")
	private WebElement attendanceMarkingTypeDD;

	@FindBy(id = "CboMaxATDEVT")
	private WebElement maxPunchesToBeConsideredDD;

	@FindBy(xpath = "//*[@name=\"id_75\"]")
	private WebElement restrictHalfDayConsFlag;

	@FindBy(xpath = "//*[@class='nav navbar-nav hr-tab hr-tab-user panel-group accordion']//*[contains(text(),'Policy')]")
	private WebElement tandAPolicyTab;

	@FindBy(xpath = "//*[@name='id_76']")
	private WebElement flexibleHalfDayTxt;

	@FindBy(xpath = "//*[@name='id_77']")
	private WebElement flexibleFullDayTxt;

	// ******************************************************************************
	// ************************ACCESS Control Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='Access Control']")
	private WebElement accessControlTab;
	// *************ACCESS Control Tab -> Basic Tab
	// Element************************
	@FindBy(id = "CboSchelNo")
	private WebElement scheduleDD;

	@FindBy(id = "CboStartShift")
	private WebElement startShiftDD;

	@FindBy(xpath = "//*[@name='id_88']")
	private WebElement accessValidityFlag;

	@FindBy(id = "_TxtValidity")
	private WebElement accessValidityDateTxt;

	@FindBy(xpath = "//*[@name='id_159']")
	private WebElement holidayScheduleDD;

	// *************ACCESS Control Tab -> Advance Tab
	// Element************************
	@FindBy(xpath = "//label[text()='Advance']")
	private WebElement accessControlAdvanceTab;

	@FindBy(name = "id_90")
	private WebElement enableAdvanceAccessControl;

	// ******************************************************************************
	// ************************Ess Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='ESS']")
	private WebElement essTab;

	@FindBy(name = "id_93")
	private WebElement enableAccount;

	@FindBy(name = "id_94")
	private WebElement editBasicDetails;

	@FindBy(name = "id_95")
	private WebElement punchMarkingViaESS;

	@FindBy(id = "UserConfigAutoESSRoleRightsName")
	private WebElement eSSRoleRightNmTxt;

	@FindBy(name = "id_100")
	private WebElement autoAuthIMEI;

	// *******************************************************
	// ******************** Credential Tab*******************
	// *******************************************************
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='Credentials']")
	private WebElement credentialsTab;

	@FindBy(name = "id_73")
	private WebElement enableSelfEnrollment;

	@FindBy(id = "QRGenerate")
	private WebElement generateQRImg;

	// ******************************************************************************
	// ************************Cafeteria Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='Cafeteria']")
	private WebElement cafeteriaTab;

	@FindBy(id = "CboECanflg")
	private WebElement cafeEnableFlag;

	@FindBy(name = "id_174")
	private WebElement accountTypeDD;

	@FindBy(name = "id_175")
	private WebElement balanceManagementDD;

	@FindBy(id = "TxtAccLmt")
	private WebElement txtAccLmt;

	@FindBy(id = "DdlDscntLvl")
	private WebElement discountLevelDD;

	@FindBy(id = "UserConfigAutoCafeteriaUsagePolicyName")
	private WebElement cafeUsagePlcTxt;

	// ******************************************************************************
	// ************************Popup Element************************
	// ******************************************************************************
	@FindBy(id = "mdcancel")
	private WebElement informationPopupCancelBtn;

	// ******************************************************************************
	// ************************Job Costing Tab Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[contains(text(),'Costing')]")
	private WebElement jobCostingTab;

	// Chhaya
	@FindBy(name = "id_176")
	private WebElement jobCostingDropdown;

	@FindBy(xpath = "//*[@class='modal-content']")
	private List<WebElement> jobCostingChangePopup;

	@FindBy(xpath = "//*[@value='Ok']")
	private WebElement jobCostingChangePopupOkBtn;

	@FindBy(id = "grdJobsaddBtn")
	private WebElement jobAddBtn;

	@FindBy(id = "UserConfigAutoJobID")
	private WebElement jobCodeTxt;

	@FindBy(id = "_FromDate")
	private WebElement assignmentStartDateTxt;

	@FindBy(id = "_ToDate")
	private WebElement assignmentEndDateTxt;

	@FindBy(xpath = "//*[@id=\"savebtn\"]")
	private WebElement jobAssignmentOkBtn;

	@FindBy(xpath = "//*[@id='message']/div/label")
	private List<WebElement> jobCostingValMsgSize;

	@FindBy(xpath = "//*[@id='message']/div/label")
	private WebElement jobCostingValMsg;

	@FindBy(xpath = "//*[@gridname='grdJobs']//table/tbody/tr/td[(@class=\"mx-grid-edit-ww-bw\" or @class=\"mx-grid-edit-ww-bw egImgCell\" or @class=\"grid-raw-size cursor\") and not(@hidden)][1]")
	private List<WebElement> defaultJobTable;

	@FindBy(xpath = "//*[@id='div_grd_grdJobs']//*[@name='cmnTxtSearch']")
	private WebElement defaultJobsSearchBox;

	@FindBy(xpath = "//*[@id='div_grd_grdJobs']//*[@name='cmnTxtSearch']")
	private List<WebElement> defaultJobsSearchBox1;

	@FindBy(xpath = "//*[@class='nav navbar-nav hr-tab hr-tab-user panel-group accordion']//*[contains(text(),'Assigned Job Schedules')]")
	private WebElement assignedJobSchedulesTab;

	@FindBy(xpath = "//*[@gridname=\"grdAssignedJobSchedules\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement jobSchedulerSearchBox;

	@FindBy(xpath = "//*[@gridname=\"grdAssignedJobSchedules\"]//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> jobSchedulerTable;

	@FindBy(xpath = "//*[@gridname=\"grdAssignedJobSchedules\" and @class=\"ng-isolate-scope\"]//*[@key=\"No Data\"]")
	private WebElement noDataLabel;

	@FindBy(xpath = "//*[@id=\"div_grd_grdJobs\"]//*[@class=\"col-md-12 col-sm-12\"]//*[@default=\"No Data\"]")
	private WebElement noDataLabelJobTable;

	@FindBy(xpath = "//*[@id=\"div_grd_grdJobs\"]//*[@default='No Data Found']")
	private WebElement noDataFoundLabelJobTable;

	@FindBy(name = "id_129")
	private WebElement deviceBasedJobAssignmentFlag;

	@FindBy(xpath = "//*[@default=\"Ok\"]")
	private WebElement popupOKBtn;

	@FindBy(xpath = "//*[@default=\"Ok\"]")
	private List<WebElement> popupOKBtnXpath;

	@FindBy(xpath = "//*[@gridname=\"grdAssignedJobSchedules\"]//mx-label[@key=\"No Data Found\"]")
	private WebElement notDataFoundLabel;

	@FindBy(id = "ESSAssignment")
	private WebElement jobAssignmentChk;

	@FindBy(xpath = "//*[@id=\"div_grd_grdJobs\"]//*[@id='savebtn' and not(@hidden)]")
	private WebElement editGridOKBtn;

	@FindBy(xpath = "//*[@id=\"div_grd_grdJobs\"]//*[@title=\"Cancel\" and not(@hidden)]")
	private WebElement editGridCancelBtn;
	// ******************************************************************************
	// ************************Events Tab Element************************
	// ******************************************************************************
	// Chhaya
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[contains(text(),'Events')]")
	private WebElement eventsTab;

	@FindBy(xpath = "//*[@class=\"tab-fieldset\" and not(@hidden)]//*[@class=\"panel-group accordion_master1\" and @id=\"accordion_master\"]/div[1]/a[@aria-expanded=\"true\"]")
	private List<WebElement> attendanceEventsCollaps;

	@FindBy(xpath = "//*[contains(text(),'Attendance Events‎')]")
	private WebElement atdCollapsClick;

	@FindBy(id = "_TxtEventStartDate")
	private WebElement startDateTxt1;

	@FindBy(id = "_TxtEventEndDate")
	private WebElement endDateTxt1;

	@FindBy(xpath = "//*[@value='View']")
	private WebElement viewBtnEvents;

	@FindBy(xpath = "//*[@id=\"div_grd_gvATD\"]//table/tbody/tr[not(@hidden)]")
	private List<WebElement> attendanceEventsTable;

	@FindBy(xpath = "//*[@id=\"div_grd_gvATD\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> attendanceEventsTableCols;

	@FindBy(xpath = "//*[@class=\"tab-fieldset\" and not(@hidden)]//*[@class=\"panel-group accordion_master1\" and @id=\"accordion_master\"]/div[2]/a[@aria-expanded=\"true\"]")
	private List<WebElement> accessControlCollaps;

	@FindBy(xpath = "//*[contains(text(),'Access Control Events‎')]")
	private WebElement acsCollapsClick;

	@FindBy(xpath = "//*[@id='div_grd_gvACS']//table/tbody/tr[not(@hidden)]")
	private List<WebElement> acsControlEventsTable;

	@FindBy(xpath = "//*[@id='div_grd_gvACS']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> acsControlEventsTableCols;

	// ******************************************************************************
	// ************************Field Visit Management Tab
	// Element************************
	// ******************************************************************************
	// Chhaya
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[contains(text(),'Field Visit Management')]")
	private WebElement fVMTab;

	@FindBy(name = "id_130")
	private WebElement enableFVMChk;

	// ******************************************************************************
	// ************************Face Recognition Tab
	// Element************************
	// ******************************************************************************
	// Chhaya
	@FindBy(name = "id_131")
	private WebElement fREnable;

	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[contains(text(),'Face Recognition')]")
	private WebElement faceRecognitionTab;

	// ******************************************************************************
	// ************************Visitor Management Tab
	// Element************************
	// ******************************************************************************
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[contains(text(),'Visitor Management')]")
	private WebElement visitorManagementTab;

	@FindBy(id = "chkIsAuthHost")
	private WebElement authHostUserEnable;

	@FindBy(id = "TxtMinDaysPreRegistration")
	private WebElement minimumDaysBeforeAllowingVisitTxt;

	@FindBy(id = "TxtMaxDaysPreRegistration")
	private WebElement maximumDaysBeforeAllowingVisitTxt;

	// *********************************************************************************************************

	// By Mayank
	// If you want to change any parameter or if you get any error while execution ,
	// kindly contact Mayank Vishnoriya
	public void createUser(List<String> columnHeader, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		addButtonClick();
		waitForElementClickable(active);
		// Condition for auto generate userid --Mayank
		if (userId.isEnabled()) {
			element_InputTextUsingActionClass(userId, data.get("userid"));
			Thread.sleep(300);
			element_Click(basicTab); // This method use for userid control to click on tab
		}
		Thread.sleep(2000);
		element_Clear(userName);
		element_InputTextUsingActionClass(userName, data.get("userid"));
		// ******************************************
		// ******Basic Tab***************************
		// ******************************************
		if (columnHeader.contains("Active")) {
			if (data.get("Active") != null) {
				boolean activeC = Boolean.parseBoolean(data.get("Active"));
				if (activeC == true) {
					if (element_isSelected(active) != true) {
						element_Click(active);
					}
				} else {
					if (element_isSelected(active) == true) {
						element_Click(active);
					}
				}
			}
		}
		// ******************************************
		// ******General Tab***************************
		// ******************************************
		if (data.get("JoiningDate") != null || data.get("LeavingDate") != null || data.get("ConfirmationDate") != null
				|| data.get("BirthDate") != null) { // For go to General tab or not
			element_Click(generalTab);
			// Parameters
			if (columnHeader.contains("BirthDate")) {
				if (data.get("BirthDate") != null) {
					String bDate = staticDateOrPlusMinusFromCurrentDate(data.get("BirthDate"));
					element_Clear(birthDatetxt);
					element_InputTextUsingActionClass(birthDatetxt, bDate);
				}
			}
			if (columnHeader.contains("JoiningDate")) {
				if (data.get("JoiningDate") != null) {
					String jDate = staticDateOrPlusMinusFromCurrentDate(data.get("JoiningDate"));
					element_Clear(joiningDatetxt);
					element_InputTextUsingActionClass(joiningDatetxt, jDate);
				}
			}
			if (columnHeader.contains("LeavingDate")) {
				if (data.get("LeavingDate") != null) {
					String lDate = staticDateOrPlusMinusFromCurrentDate(data.get("LeavingDate"));
					element_Clear(leavingDatetxt);
					element_InputTextUsingActionClass(leavingDatetxt, lDate);
				}
			}
			if (columnHeader.contains("ConfirmationDate")) {
				if (data.get("ConfirmationDate") != null) {
					String cDate = staticDateOrPlusMinusFromCurrentDate(data.get("ConfirmationDate"));
					element_Clear(confirmDatetxt);
					element_InputTextUsingActionClass(confirmDatetxt, cDate);
				}
			}
		}

		// ******************************************
		// ******Contact Tab***************************
		// ******************************************
		if (data.get("PersonalMobile") != null || data.get("PersonalEmail") != null) { // For go to contact tab or not
			element_Click(contactTab);
			// Parameters
			if (columnHeader.contains("PersonalMobile")) {
				if (data.get("PersonalMobile") != null) {
					element_Clear(personalMobile);
					element_InputTextUsingActionClass(personalMobile, data.get("PersonalMobile"));
				}
			}
			if (columnHeader.contains("PersonalEmail")) {
				if (data.get("PersonalEmail") != null) {
					element_Clear(personalEmail);
					element_InputTextUsingActionClass(personalEmail, data.get("PersonalEmail"));
				}
			}
		}

		// ******************************************
		// ******Credentials Tab***************************
		// ******************************************
		if (data.get("EnableSelfEnrollment") != null) { // For go to credential tab or not
			element_Click(credentialsTab);
			// Parameters
			if (columnHeader.contains("EnableSelfEnrollment")) {
				if (data.get("EnableSelfEnrollment") != null) {
					boolean selfEnrollment1 = Boolean.parseBoolean(data.get("EnableSelfEnrollment"));
					if (selfEnrollment1 == true) {
						if (!enableSelfEnrollment.isSelected()) {
							element_Click(enableSelfEnrollment);
						}
					} else {
						if (enableSelfEnrollment.isSelected()) {
							element_Click(enableSelfEnrollment);
						}
					}
				}
			}
		}

		// *****************************************************************
		// ********** Group tab **************************************
		// ****************************************************************
		if (data.get("Organization") != null || data.get("Branch") != null || data.get("Department") != null
				|| data.get("Section") != null || data.get("Category") != null || data.get("Grade") != null
				|| data.get("Designation") != null || data.get("Custom Group 1") != null
				|| data.get("Custom Group 2") != null || data.get("Custom Group 3") != null
				|| data.get("ReportingGroup") != null || data.get("ApprovalPolicy") != null
				|| data.get("LeaveGroup") != null || data.get("WeekOffGroup") != null) {
			element_Click(groupTab);
			waitForElementVisible(userConfigOrganizationGroupName);
			element_Click(userConfigAutoReportingGroupID);
			if (data.get("Organization") != null) { // Chhaya
				element_isEnabled(userConfigOrganizationGroupName);
				element_Clear(userConfigAutoOrganizationID);
				element_TextBoxToClickOnTab(userConfigAutoOrganizationID);
				element_Clear(userConfigOrganizationGroupName);
				element_TextBoxToClickOnTab(userConfigOrganizationGroupName);
				element_dynamicDDSelect(userConfigOrganizationGroupName, data.get("Organization"));
			}

			if (data.get("Branch") != null) { // Chhaya
				element_Clear(userConfigAutoBranchID);
				element_TextBoxToClickOnTab(userConfigAutoBranchID);
				element_Clear(userConfigBranchGroupName);
				element_TextBoxToClickOnTab(userConfigBranchGroupName);
				element_dynamicDDSelect(userConfigBranchGroupName, data.get("Branch"));
			}
			if (data.get("Department") != null) {
				element_Clear(userConfigAutoDepartmentID);
				element_TextBoxToClickOnTab(userConfigAutoDepartmentID);
				element_Clear(userConfigDepartmentGroupName);
				element_TextBoxToClickOnTab(userConfigDepartmentGroupName);
				element_dynamicDDSelect(userConfigDepartmentGroupName, data.get("Department"));
			}
			if (data.get("Section") != null) {
				element_Clear(userConfigAutoSectionID);
				element_TextBoxToClickOnTab(userConfigAutoSectionID);
				element_Clear(userConfigSectionGroupName);
				element_TextBoxToClickOnTab(userConfigSectionGroupName);
				element_dynamicDDSelect(userConfigSectionGroupName, data.get("Section"));
			}
			if (data.get("Category") != null) {
				element_Clear(userConfigAutoCategoryID);
				element_TextBoxToClickOnTab(userConfigAutoCategoryID);
				element_Clear(userConfigCategoryGroupName);
				element_TextBoxToClickOnTab(userConfigCategoryGroupName);
				element_dynamicDDSelect(userConfigCategoryGroupName, data.get("Category"));
			}
			if (data.get("Grade") != null) {
				element_Clear(userConfigAutoGradeID);
				element_TextBoxToClickOnTab(userConfigAutoGradeID);
				element_Clear(userConfigGradeGroupName);
				element_TextBoxToClickOnTab(userConfigGradeGroupName);
				element_InputTextUsingActionClass(userConfigGradeGroupName, data.get("Grade"));
				element_Click(groupTab);
			}
			if (data.get("Designation") != null) {
				element_Clear(userConfigAutoDesignationID);
				element_TextBoxToClickOnTab(userConfigAutoDesignationID);
				element_Clear(userConfigDesignationGroupName);
				element_TextBoxToClickOnTab(userConfigDesignationGroupName);
				element_dynamicDDSelect(userConfigDesignationGroupName, data.get("Designation"));
			}
			if (data.get("Custom Group 1") != null) {
				element_Clear(userConfigAutoCustGRp1ID);
				element_TextBoxToClickOnTab(userConfigAutoCustGRp1ID);
				element_Clear(userConfigCustomGroup1GroupName);
				element_TextBoxToClickOnTab(userConfigCustomGroup1GroupName);
				element_InputTextUsingActionClass(userConfigCustomGroup1GroupName, data.get("Custom Group 1"));
				element_Click(groupTab);
			}
			if (data.get("Custom Group 2") != null) {
				element_Clear(userConfigAutoCustGRp2ID);
				element_TextBoxToClickOnTab(userConfigAutoCustGRp2ID);
				element_Clear(userConfigCustomGroup2GroupName);
				element_TextBoxToClickOnTab(userConfigCustomGroup2GroupName);
				element_dynamicDDSelect(userConfigCustomGroup2GroupName, data.get("Custom Group 2"));
			}
			if (data.get("Custom Group 3") != null) {
				element_Clear(userConfigAutoCustGRp3ID);
				element_TextBoxToClickOnTab(userConfigAutoCustGRp3ID);
				element_Clear(userConfigCustomGroup3GroupName);
				element_TextBoxToClickOnTab(userConfigCustomGroup3GroupName);
				element_dynamicDDSelect(userConfigCustomGroup3GroupName, data.get("Custom Group 3"));
			}
			if (data.get("ReportingGroup") != null) {
				element_Clear(userConfigAutoReportingGroupID);
				element_TextBoxToClickOnTab(userConfigAutoReportingGroupID);
				element_Clear(userConfigAutoReportingGroupName);
				element_TextBoxToClickOnTab(userConfigAutoReportingGroupName);
				element_dynamicDDSelect(userConfigAutoReportingGroupName, data.get("ReportingGroup"));
				element_TextBoxToClickOnTab(userConfigAutoReportingGroupName);
			} else {
				element_Clear(userConfigAutoReportingGroupID);
				element_TextBoxToClickOnTab(userConfigAutoReportingGroupID);
				element_Clear(userConfigAutoReportingGroupName);
				element_TextBoxToClickOnTab(userConfigAutoReportingGroupName);
				element_Click(groupTab);
			}
			if (data.get("ApprovalPolicy") != null) {
				if (element_isEnabled(UserConfigAutoApprovalPolicyName)) {
					element_Clear(userConfigAutoApprovalPolicyID);
					element_TextBoxToClickOnTab(userConfigAutoApprovalPolicyID);
					element_Clear(UserConfigAutoApprovalPolicyName);
					element_TextBoxToClickOnTab(UserConfigAutoApprovalPolicyName);
					element_dynamicDDSelect(UserConfigAutoApprovalPolicyName, data.get("ApprovalPolicy"));
				}
			} else {
				if (element_isEnabled(UserConfigAutoApprovalPolicyName)) {
					element_Clear(userConfigAutoApprovalPolicyID);
					element_TextBoxToClickOnTab(userConfigAutoApprovalPolicyID);
					element_Clear(UserConfigAutoApprovalPolicyName);
					element_TextBoxToClickOnTab(UserConfigAutoApprovalPolicyName);
					element_Click(groupTab);
				}
			}
			if (data.get("LeaveGroup") != null) {
				element_Clear(userConfigAutoLeaveGroupID);
				element_TextBoxToClickOnTab(userConfigAutoLeaveGroupID);
				element_Clear(UserConfigAutoLeaveGroupName);
				element_TextBoxToClickOnTab(UserConfigAutoLeaveGroupName);
				element_dynamicDDSelect(UserConfigAutoLeaveGroupName, data.get("LeaveGroup"));
			}
			if (data.get("WeekOffGroup") != null) {
				element_Clear(userConfigAutoWOGroupID);
				element_TextBoxToClickOnTab(userConfigAutoWOGroupID);
				element_Clear(UserConfigAutoWOGroupName);
				element_TextBoxToClickOnTab(UserConfigAutoWOGroupName);
				element_dynamicDDSelect(UserConfigAutoWOGroupName, data.get("WeekOffGroup"));
			}
		}
		// *****************************************************************
		// ********** Devices tab **************************************
		// ****************************************************************
		if (data.get("DeviceName") != null || data.get("DeviceGroup") != null) { // For go to Devices tab or not
			element_Click(devicesTab);
			// Parameters
			if (columnHeader.contains("DeviceName")) {
				if (data.get("DeviceName") != null) {
					selectUsersOrGroupFromPicklist(data.get("DeviceName"), deviceNameTxt);
				}
			}
			if (columnHeader.contains("DeviceGroup")) {
				if (data.get("DeviceGroup") != null) {
					selectUsersOrGroupFromPicklist(data.get("DeviceGroup"), deviceGroupNameTxt);
					element_Click(devicesTab);
				}
			}
		}

		// *****************************************************************
		// ********** T&A tab **************************************
		// ****************************************************************
		if (data.get("AtdEnable") != null || data.get("OtCoffEligibility") != null || data.get("AutoAuthCoff") != null
				|| data.get("AtdMarkingType") != null || data.get("MaxPunchesToBeConsidered") != null
				|| data.get("RestrHalfDayCons") != null || data.get("AttendancePlc") != null
				|| data.get("AbsenteePlc") != null || data.get("OvertimePlc") != null || data.get("LateInPlc") != null
				|| data.get("EarlyOutPlc") != null || data.get("CoffPlc") != null || data.get("FlexibleHalfDay") != null
				|| data.get("FlexibleFullDay") != null) {
			element_Click(tandATab);
			// Parameters
			waitForElementVisible(enableAttendanceCalculationText);
			// T&A Tab Parameters
			if (data.get("AtdEnable") != null) {
				boolean tandAenableCheck = Boolean.parseBoolean(data.get("AtdEnable"));
				if (tandAenableCheck == true) {
					if (element_isSelected(enableAttendanceCalculationCheckbox) != true) {
						element_Click(enableAttendanceCalculationCheckbox);
					}
				} else {
					if (element_isSelected(enableAttendanceCalculationCheckbox) == true) {
						element_Click(enableAttendanceCalculationCheckbox);
					}
				}
			}
			if (element_isSelected(enableAttendanceCalculationCheckbox) == true) {
				// T&A Calculation enable then only other parameters enable
				if (data.get("OtCoffEligibility") != null) {
					if (element_isSelected(enableAttendanceCalculationCheckbox)) {
						element_DropDownSelectByvisibleText(otCffEligibilityDD, data.get("OtCoffEligibility"));
					}
				}
				if (data.get("AutoAuthCoff") != null) {
					if (element_DropDownFirstSelectedValue(otCffEligibilityDD).equalsIgnoreCase("Both")) {
						String autoAuthCoff = data.get("AutoAuthCoff");
						if (autoAuthCoff.contains(",")) {
							String[] commaSeparatedValues = autoAuthCoff.split(",");
							for (int i = 0; i < commaSeparatedValues.length; i++) {
								String autoAuthCoffOptions = commaSeparatedValues[i].trim().toUpperCase();
								if (autoAuthCoffOptions.equalsIgnoreCase("WO")) {
									if (!element_isSelected(autoAuthCoffWO)) {
										element_Click(autoAuthCoffWO);
									}
								}
								if (autoAuthCoffOptions.equalsIgnoreCase("PH")) {
									if (!element_isSelected(autoAuthCoffPH)) {
										element_Click(autoAuthCoffPH);
									}
								}
								if (autoAuthCoffOptions.equalsIgnoreCase("WO/PH")) {
									if (!element_isSelected(autoAuthCoffWOPH)) {
										element_Click(autoAuthCoffWOPH);
									}
								}
								if (autoAuthCoffOptions.equalsIgnoreCase("FB")) {
									if (!element_isSelected(autoAuthCoffFB)) {
										element_Click(autoAuthCoffFB);
									}
								}
								if (autoAuthCoffOptions.equalsIgnoreCase("RD")) {
									if (!element_isSelected(autoAuthCoffRD)) {
										element_Click(autoAuthCoffRD);
									}
								}
								if (autoAuthCoffOptions.equalsIgnoreCase("NORMAL DAY")) {
									if (!element_isSelected(autoAuthCoffNormal)) {
										element_Click(autoAuthCoffNormal);
									}
								}
							}
						} else {
							if (autoAuthCoff.toUpperCase().equalsIgnoreCase("WO")) {
								if (!element_isSelected(autoAuthCoffWO)) {
									element_Click(autoAuthCoffWO);
								}
							}
							if (autoAuthCoff.toUpperCase().equalsIgnoreCase("PH")) {
								if (!element_isSelected(autoAuthCoffPH)) {
									element_Click(autoAuthCoffPH);
								}
							}
							if (autoAuthCoff.toUpperCase().equalsIgnoreCase("WO/PH")) {
								if (!element_isSelected(autoAuthCoffWOPH)) {
									element_Click(autoAuthCoffWOPH);
								}
							}
							if (autoAuthCoff.toUpperCase().equalsIgnoreCase("FB")) {
								if (!element_isSelected(autoAuthCoffFB)) {
									element_Click(autoAuthCoffFB);
								}
							}
							if (autoAuthCoff.toUpperCase().equalsIgnoreCase("RD")) {
								if (!element_isSelected(autoAuthCoffRD)) {
									element_Click(autoAuthCoffRD);
								}
							}
							if (autoAuthCoff.toUpperCase().equalsIgnoreCase("NORMAL DAY")) {
								if (!element_isSelected(autoAuthCoffNormal)) {
									element_Click(autoAuthCoffNormal);
								}
							}
							if (autoAuthCoff.toUpperCase().equalsIgnoreCase("ALL")) {
								for (WebElement ele : autoAuthCoffOptionsFlag) {
									if (!element_isSelected(ele)) {
										element_Click(ele);
									}
								}
							}
						}
					}
				}
				if (data.get("AtdMarkingType") != null) {
					element_DropDownSelectByvisibleText(attendanceMarkingTypeDD, data.get("AtdMarkingType"));
					Thread.sleep(500);
				}
				if (data.get("FlexibleHalfDay") != null) {
					if (dropDownSelectedValue(attendanceMarkingTypeDD).equalsIgnoreCase("Flexible")) {
						element_Clear(flexibleHalfDayTxt);
						element_inputTextUsingActionClassCharacterOneByOne(flexibleHalfDayTxt,
								data.get("FlexibleHalfDay"));
					}
				}
				if (data.get("FlexibleFullDay") != null) {
					if (dropDownSelectedValue(attendanceMarkingTypeDD).equalsIgnoreCase("Flexible")) {
						element_Clear(flexibleFullDayTxt);
						element_inputTextUsingActionClassCharacterOneByOne(flexibleFullDayTxt,
								data.get("FlexibleFullDay"));
					}
				}
				if (data.get("MaxPunchesToBeConsidered") != null) {
					element_DropDownSelectByvisibleText(maxPunchesToBeConsideredDD,
							data.get("MaxPunchesToBeConsidered"));
				}
				if (data.get("RestrHalfDayCons") != null) {
					Boolean restrHalfDayCons = Boolean.parseBoolean(data.get("RestrHalfDayCons"));
					if (restrHalfDayCons == true) {
						if (!restrictHalfDayConsFlag.isSelected()) {
							element_Click(restrictHalfDayConsFlag);
						}
					} else {
						if (restrictHalfDayConsFlag.isSelected()) {
							element_Click(restrictHalfDayConsFlag);
						}
					}
				}
				// ***********************************************
				// Policy Tab parameteres
				element_Click(policytab);
				waitForElementVisible(attendancePolicyName);
				if (data.get("AttendancePlc") != null) {
					element_Clear(userConfigAutoAttendancePolicyID);
					element_TextBoxToClickOnTab(userConfigAutoAttendancePolicyID);
					element_Clear(attendancePolicyName);
					element_TextBoxToClickOnTab(attendancePolicyName);
					element_dynamicDDSelect(attendancePolicyName, data.get("AttendancePlc"));
				}
				if (data.get("AbsenteePlc") != null) {
					element_Clear(userConfigAutoAbsentPolicyID);
					element_TextBoxToClickOnTab(userConfigAutoAbsentPolicyID);
					element_Clear(absenteePolicyName);
					element_TextBoxToClickOnTab(absenteePolicyName);
					element_dynamicDDSelect(absenteePolicyName, data.get("AbsenteePlc"));
				}
				if (data.get("OvertimePlc") != null) {
					element_Clear(userConfigAutoOTPolicyID);
					element_TextBoxToClickOnTab(userConfigAutoOTPolicyID);
					element_Clear(overtimePolicyName);
					element_TextBoxToClickOnTab(overtimePolicyName);
					element_dynamicDDSelect(overtimePolicyName, data.get("OvertimePlc"));

				}
				if (data.get("LateInPlc") != null) {
					element_Clear(userConfigAutoLateInPolicyID);
					element_TextBoxToClickOnTab(userConfigAutoLateInPolicyID);
					element_Clear(lateINPolicyName);
					element_TextBoxToClickOnTab(lateINPolicyName);
					element_dynamicDDSelect(lateINPolicyName, data.get("LateInPlc"));
				}
				if (data.get("EarlyOutPlc") != null) {
					element_Clear(userConfigAutoEarlyOutPolicyID);
					element_TextBoxToClickOnTab(userConfigAutoEarlyOutPolicyID);
					element_Clear(earlyOUTPolicyName);
					element_TextBoxToClickOnTab(earlyOUTPolicyName);
					element_dynamicDDSelect(earlyOUTPolicyName, data.get("EarlyOutPlc"));
				}
				if (data.get("CoffPlc") != null) {
					element_Clear(userConfigAutoCOPolicyID);
					element_TextBoxToClickOnTab(userConfigAutoCOPolicyID);
					element_Clear(cOffPolicyName);
					element_TextBoxToClickOnTab(cOffPolicyName);
					element_dynamicDDSelect(cOffPolicyName, data.get("CoffPlc"));
				}
			}
		}
		// *****************************************************************
		// ********** Access Control tab **************************************
		// ****************************************************************
		if (data.get("ACSEnable") != null || data.get("HolidaySchedule") != null || data.get("ShiftSchedule") != null
				|| data.get("StartShift") != null) {
			element_Click(accessControlTab);
			// Parameters
			if (data.get("HolidaySchedule") != null) {
				element_DropDownSelectByvisibleText(holidayScheduleDD, data.get("HolidaySchedule"));
			}
			if (data.get("ShiftSchedule") != null) {
				element_DropDownSelectByvisibleText(scheduleDD, data.get("ShiftSchedule"));
			}
			if (data.get("StartShift") != null) {
				element_DropDownSelectByvisibleText(startShiftDD, data.get("StartShift"));
			}

			// Advance Access Control
			waitForElementVisible(accessControlAdvanceTab);
			element_Click(accessControlAdvanceTab);
			if (columnHeader.contains("ACSEnable")) {
				if (data.get("ACSEnable") != null) {
					boolean acsEnable = Boolean.parseBoolean(data.get("ACSEnable"));
					if (acsEnable == true) {
						if (element_isSelected(enableAdvanceAccessControl) != true) {
							element_Click(enableAdvanceAccessControl);
						}
					} else {
						if (element_isSelected(enableAdvanceAccessControl) == true) {
							element_Click(enableAdvanceAccessControl);
						}
					}
				}
			}
		}
		// *****************************************************************
		// ********** ESS tab **************************************
		// ****************************************************************
		if (data.get("ESSEnable") != null || data.get("ESSDetail") != null || data.get("PunchMarkingviaESS") != null
				|| data.get("ESSRoleRights") != null || data.get("AutoAuthIMEI") != null) {
			element_Click(essTab);
			// Parameters
			// ESS Parameters
			if (columnHeader.contains("ESSEnable")) {
				if (data.get("ESSEnable") != null) {
					boolean essEnable = Boolean.parseBoolean(data.get("ESSEnable"));
					if (essEnable == true) {
						if (element_isSelected(enableAccount) != true) {
							element_Click(enableAccount);
							// if ess enable then All other ESS parameters enable
							// ess Basic Details
							if (columnHeader.contains("ESSDetail")) {
								if (data.get("ESSDetail") != null) {
									boolean essEditBscDetails = Boolean.parseBoolean(data.get("ESSDetail"));
									if (essEditBscDetails == true) {
										if (element_isSelected(editBasicDetails) != true) {
											element_Click(editBasicDetails);
										}
									} else {
										if (element_isSelected(editBasicDetails) == true) {
											element_Click(editBasicDetails);
										}
									}
								}
							}
							// ess Punch marking via ess
							if (columnHeader.contains("PunchMarkingviaESS")) {
								if (data.get("PunchMarkingviaESS") != null) {
									boolean essPunchMarking = Boolean.parseBoolean(data.get("PunchMarkingviaESS"));
									if (essPunchMarking == true) {
										if (element_isSelected(punchMarkingViaESS) != true) {
											element_Click(punchMarkingViaESS);
										}
									} else {
										if (element_isSelected(punchMarkingViaESS) == true) {
											element_Click(punchMarkingViaESS);
										}
									}
								}
							}
							// ESS Role Rights
							if (columnHeader.contains("ESSRoleRights")) {
								if (data.get("ESSRoleRights") != null) {
									String eSSRoleRights = data.get("ESSRoleRights");
									element_Clear(eSSRoleRightNmTxt);
									element_InputTextUsingActionClass(eSSRoleRightNmTxt, eSSRoleRights);
									element_Click(essTab);
								}
							}
							// Auto Authorize IMEI Registration
							if (columnHeader.contains("AutoAuthIMEI")) {
								if (data.get("AutoAuthIMEI") != null) {
									boolean imeiAuth = Boolean.parseBoolean(data.get("AutoAuthIMEI"));
									if (imeiAuth == true) {
										if (element_isSelected(autoAuthIMEI) != true) {
											element_Click(autoAuthIMEI);
										}
									} else {
										if (element_isSelected(autoAuthIMEI) == true) {
											element_Click(autoAuthIMEI);
										}
									}
								} else {
									if (element_isSelected(autoAuthIMEI) == true) {
										element_Click(autoAuthIMEI);
									}
								}
							}
						}

					} else {
						if (element_isSelected(enableAccount) == true) {
							element_Click(enableAccount);
						}
					}
				}
			}
		}
		// *****************************************************************
		// ********** Cafeteria tab **************************************
		// ****************************************************************
		if (data.get("CafeteriaEnable") != null || data.get("AccountType") != null
				|| data.get("BalanceManagement") != null || data.get("DiscountLevel") != null
				|| data.get("CafeUsagePolicy") != null || data.get("AllowedUsagePerMonth") != null) {
			element_Click(cafeteriaTab);

			// Parameters
			if (data.get("CafeteriaEnable") != null) {
				waitForElementVisible(cafeEnableFlag);
				Boolean cafeteriaEnable1 = Boolean.parseBoolean(data.get("CafeteriaEnable"));
				if (cafeteriaEnable1 == true) {
					if (!cafeEnableFlag.isSelected()) {
						element_Click(cafeEnableFlag);
						Thread.sleep(250);
					}
					if (data.get("DiscountLevel") != null) {
						element_DropDownSelectByvisibleText(discountLevelDD, data.get("DiscountLevel"));
					}
					if (data.get("AccountType") != null) {
						element_DropDownSelectByvisibleText(accountTypeDD, data.get("AccountType"));
					}
					if (data.get("BalanceManagement") != null) {
						element_DropDownSelectByvisibleText(balanceManagementDD, data.get("BalanceManagement"));
					}
					if (data.get("AllowedUsagePerMonth") != null) {
						element_Clear(txtAccLmt);
						element_TextBoxToClickOnTab(txtAccLmt);
						element_InputDataUsingJS(txtAccLmt, data.get("AllowedUsagePerMonth"));
					}
					if (data.get("CafeUsagePolicy") != null) {
						element_Clear(cafeUsagePlcTxt);
						element_InputTextUsingActionClass(cafeUsagePlcTxt, data.get("CafeUsagePolicy"));
						element_Click(driver.findElement(By.xpath("//html")));
					}
				} else {
					if (cafeEnableFlag.isSelected()) {
						element_Click(cafeEnableFlag);
					}
				}
			}
		}
		// *****************************************************************
		// ********** Visitor Management tab **************************************
		// ****************************************************************
		if (data.get("AuthorizedHostUser") != null || data.get("MaxDaysBeforeAllowingVisit") != null
				|| data.get("MinDaysBeforeAllowingVisit") != null) {
			element_Click(visitorManagementTab);
			// Parameters
			if (data.get("AuthorizedHostUser") != null) {
				boolean authorizedHostUser = Boolean.parseBoolean(data.get("AuthorizedHostUser"));
				if (authorizedHostUser == true) {
					if (!authHostUserEnable.isSelected()) {
						element_Click(authHostUserEnable);
					}
				} else {
					if (authHostUserEnable.isSelected()) {
						element_Click(authHostUserEnable);
					}
				}
			}
			if (authHostUserEnable.isSelected()) {
				if (data.get("MinDaysBeforeAllowingVisit") != null) {
					element_Clear(minimumDaysBeforeAllowingVisitTxt);
					element_InputTextUsingActionClass(minimumDaysBeforeAllowingVisitTxt,
							data.get("MinDaysBeforeAllowingVisit"));
				}
				if (data.get("MaxDaysBeforeAllowingVisit") != null) {
					element_Clear(maximumDaysBeforeAllowingVisitTxt);
					element_InputTextUsingActionClass(maximumDaysBeforeAllowingVisitTxt,
							data.get("MaxDaysBeforeAllowingVisit"));
				}
			}
		}
		// *****************************************************************
		// ********** JPC tab **************************************
		// ****************************************************************
		if (data.get("JobCosting") != null || data.get("DeviceBasedJobAssign") != null) {
			element_Click(jobCostingTab);
			// Parameters
			if (data.get("JobCosting") != null) {
				waitForElementVisible(jobCostingDropdown);
				element_DropDownSelectByvisibleText(jobCostingDropdown, data.get("JobCosting"));
				if (jobCostingChangePopup.size() > 0) {
					element_Click(jobCostingChangePopupOkBtn);
					Thread.sleep(1000);
				}
			}
			if (data.get("DeviceBasedJobAssign") != null) {
				boolean DeviceBasedJobAssign1 = Boolean.parseBoolean(data.get("DeviceBasedJobAssign"));
				if (DeviceBasedJobAssign1 == true) {
					if (!deviceBasedJobAssignmentFlag.isSelected()) {
						element_Click(deviceBasedJobAssignmentFlag);
					}
				} else {
					if (deviceBasedJobAssignmentFlag.isSelected()) {
						element_Click(deviceBasedJobAssignmentFlag);
					}
				}
				if (popupOKBtnXpath.size() > 0) {
					element_Click(popupOKBtn);
				}
			}
		}
		// *****************************************************************
		// ********** FVM tab **************************************
		// ****************************************************************
		if (data.get("EnableFVM") != null) {
			element_Click(fVMTab);
			if (data.get("EnableFVM") != null) {
				boolean enableFVM1 = Boolean.parseBoolean(data.get("EnableFVM"));
				if (enableFVM1 == true) {
					if (!enableFVMChk.isSelected()) {
						element_Click(enableFVMChk);
					}
				} else {
					if (enableFVMChk.isSelected()) {
						element_Click(enableFVMChk);
					}
				}
			}
		}
		saveButtonClick();
		pageLoadWaitng();
		String valmsg = validationMessage();
		Assert.assertEquals(valmsg, data.get("Validation"));
		if (!valmsg.equalsIgnoreCase("Saved Successfully")) {
			cancelButtonClick();
		}
	}

	// By Chirag
	public void deleteUser(String deleteUserId) throws InterruptedException {
		pageLoadWaitng();
		String valmsg = null;
		addButtonClick();
		waitForElementClickable(active);
		element_InputTextUsingActionClass(userId, deleteUserId);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		if (!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			deleteButtonClick();
			driver.switchTo().alert().accept();
			element_Click(confirmDeleteButton);
			valmsg = validationMessage();
			Assert.assertEquals(valmsg, "Deleted Successfully");
		} else {
			cancelButtonClick();
		}
	}

	public String groupAssignToUser(String uid, String rgrp, String aprvPolicy, String leaveG, String weekOffG,
			Map<String, String> data) throws InterruptedException {
		waitForElementVisible_TimeinMinutes(userId, 1);
//		waitForElementClickable(active);
//		waitForElementClickable(userId);
		element_dynamicDDSelect(userId, uid);
		element_Click(basicTab);
		waitForElementDisable(userId);
		element_Click(groupTab);
		waitForElementVisible(userConfigOrganizationGroupName);
		element_Click(userConfigAutoReportingGroupID);
		if (data.get("Organization") != null) { // Chhaya
			element_isEnabled(userConfigOrganizationGroupName);
			element_Clear(userConfigAutoOrganizationID);
			element_TextBoxToClickOnTab(userConfigAutoOrganizationID);
			element_Clear(userConfigOrganizationGroupName);
			element_TextBoxToClickOnTab(userConfigOrganizationGroupName);
			element_dynamicDDSelect(userConfigOrganizationGroupName, data.get("Organization"));
		}

		if (data.get("Branch") != null) { // Chhaya
			element_Clear(userConfigAutoBranchID);
			element_TextBoxToClickOnTab(userConfigAutoBranchID);
			element_Clear(userConfigBranchGroupName);
			element_TextBoxToClickOnTab(userConfigBranchGroupName);
			element_dynamicDDSelect(userConfigBranchGroupName, data.get("Branch"));
		}
		if (data.get("Department") != null) {
			element_Clear(userConfigAutoDepartmentID);
			element_TextBoxToClickOnTab(userConfigAutoDepartmentID);
			element_Clear(userConfigDepartmentGroupName);
			element_TextBoxToClickOnTab(userConfigDepartmentGroupName);
			element_dynamicDDSelect(userConfigDepartmentGroupName, data.get("Department"));
		}
		if (data.get("Section") != null) {
			element_Clear(userConfigAutoSectionID);
			element_TextBoxToClickOnTab(userConfigAutoSectionID);
			element_Clear(userConfigSectionGroupName);
			element_TextBoxToClickOnTab(userConfigSectionGroupName);
			element_dynamicDDSelect(userConfigSectionGroupName, data.get("Section"));
		}
		if (data.get("Category") != null) {
			element_Clear(userConfigAutoCategoryID);
			element_TextBoxToClickOnTab(userConfigAutoCategoryID);
			element_Clear(userConfigCategoryGroupName);
			element_TextBoxToClickOnTab(userConfigCategoryGroupName);
			element_dynamicDDSelect(userConfigCategoryGroupName, data.get("Category"));
		}
		if (data.get("Grade") != null) {
			element_Clear(userConfigAutoGradeID);
			element_TextBoxToClickOnTab(userConfigAutoGradeID);
			element_Clear(userConfigGradeGroupName);
			element_TextBoxToClickOnTab(userConfigGradeGroupName);
			element_InputTextUsingActionClass(userConfigGradeGroupName, data.get("Grade"));
			element_Click(groupTab);
		}
		if (data.get("Designation") != null) {
			element_Clear(userConfigAutoDesignationID);
			element_TextBoxToClickOnTab(userConfigAutoDesignationID);
			element_Clear(userConfigDesignationGroupName);
			element_TextBoxToClickOnTab(userConfigDesignationGroupName);
			element_dynamicDDSelect(userConfigDesignationGroupName, data.get("Designation"));
		}
		if (data.get("Custom Group 1") != null) {
			element_Clear(userConfigAutoCustGRp1ID);
			element_TextBoxToClickOnTab(userConfigAutoCustGRp1ID);
			element_Clear(userConfigCustomGroup1GroupName);
			element_TextBoxToClickOnTab(userConfigCustomGroup1GroupName);
			element_InputTextUsingActionClass(userConfigCustomGroup1GroupName, data.get("Custom Group 1"));
			element_Click(groupTab);
		}
		if (data.get("Custom Group 2") != null) {
			element_Clear(userConfigAutoCustGRp2ID);
			element_TextBoxToClickOnTab(userConfigAutoCustGRp2ID);
			element_Clear(userConfigCustomGroup2GroupName);
			element_TextBoxToClickOnTab(userConfigCustomGroup2GroupName);
			element_dynamicDDSelect(userConfigCustomGroup2GroupName, data.get("Custom Group 2"));
		}
		if (data.get("Custom Group 3") != null) {
			element_Clear(userConfigAutoCustGRp3ID);
			element_TextBoxToClickOnTab(userConfigAutoCustGRp3ID);
			element_Clear(userConfigCustomGroup3GroupName);
			element_TextBoxToClickOnTab(userConfigCustomGroup3GroupName);
			element_dynamicDDSelect(userConfigCustomGroup3GroupName, data.get("Custom Group 3"));
		}
		if (rgrp != null) {
			element_Clear(userConfigAutoReportingGroupID);
			element_TextBoxToClickOnTab(userConfigAutoReportingGroupID);
			element_Clear(userConfigAutoReportingGroupName);
			element_TextBoxToClickOnTab(userConfigAutoReportingGroupName);
			element_dynamicDDSelect(userConfigAutoReportingGroupName, rgrp);
		} else {
			element_Clear(userConfigAutoReportingGroupID);
			element_TextBoxToClickOnTab(userConfigAutoReportingGroupID);
			element_Clear(userConfigAutoReportingGroupName);
			element_TextBoxToClickOnTab(userConfigAutoReportingGroupName);
			element_Click(groupTab);
		}
		if (aprvPolicy != null) {
			if (element_isEnabled(UserConfigAutoApprovalPolicyName)) {
				element_Clear(userConfigAutoApprovalPolicyID);
				element_TextBoxToClickOnTab(userConfigAutoApprovalPolicyID);
				element_Clear(UserConfigAutoApprovalPolicyName);
				element_TextBoxToClickOnTab(UserConfigAutoApprovalPolicyName);
				element_dynamicDDSelect(UserConfigAutoApprovalPolicyName, aprvPolicy);
			}
		} else {
			if (element_isEnabled(UserConfigAutoApprovalPolicyName)) {
				element_Clear(userConfigAutoApprovalPolicyID);
				element_TextBoxToClickOnTab(userConfigAutoApprovalPolicyID);
				element_Clear(UserConfigAutoApprovalPolicyName);
				element_TextBoxToClickOnTab(UserConfigAutoApprovalPolicyName);
				element_Click(groupTab);
			}
		}
		if (leaveG != null) {
			element_Clear(userConfigAutoLeaveGroupID);
			element_TextBoxToClickOnTab(userConfigAutoLeaveGroupID);
			element_Clear(UserConfigAutoLeaveGroupName);
			element_TextBoxToClickOnTab(UserConfigAutoLeaveGroupName);
			element_dynamicDDSelect(UserConfigAutoLeaveGroupName, leaveG);
		}
		if (weekOffG != null) {
			element_Clear(userConfigAutoWOGroupID);
			element_TextBoxToClickOnTab(userConfigAutoWOGroupID);
			element_Clear(UserConfigAutoWOGroupName);
			element_TextBoxToClickOnTab(UserConfigAutoWOGroupName);
			element_dynamicDDSelect(UserConfigAutoWOGroupName, weekOffG);
		}
		saveButtonClick();
		String valmsg = validationMessage();
		reloadPageButtonClick();
		return valmsg;

	}

	// *********************************************************************************************************
	// **************************************User Configuration
	// API****************************************
	// *********************************************************************************************************
	public void userAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data) {
		// String apiPar=null;
		if (columnHeader.contains("Id")) {
			if (data.get("Id") != null) {
				apiParameter.add("Id=" + data.get("Id"));
			}
		}
		if (columnHeader.contains("reference-code")) {
			if (data.get("reference-code") != null) {
				apiParameter.add("reference-code=" + data.get("reference-code"));
			}
		}
		if (columnHeader.contains("name")) {
			if (data.get("name") != null) {
				apiParameter.add("name=" + data.get("name"));
			}
		}
		if (columnHeader.contains("full-name")) {
			if (data.get("full-name") != null) {
				apiParameter.add("full-name=" + data.get("full-name"));
			}
		}
		if (columnHeader.contains("short-name")) {
			if (data.get("short-name") != null) {
				apiParameter.add("short-name=" + data.get("short-name"));
			}
		}
		if (columnHeader.contains("Active")) {
			if (data.get("Active") != null) {
				apiParameter.add("Active=" + data.get("Active"));
			}
		}
		if (columnHeader.contains("Module")) {
			if (data.get("Module") != null) {
				apiParameter.add("Module=" + data.get("Module"));
			}
		}
		if (columnHeader.contains("date-of-birth")) {
			if (data.get("date-of-birth") != null) {
				String date = daysMonthYear1999forDOB(data.get("date-of-birth"));
				apiParameter.add("date-of-birth=" + date);
			}
		}
		if (columnHeader.contains("joining-date")) {
			if (data.get("joining-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("joining-date"));
				String daterange = date.replace("/", "");
				apiParameter.add("joining-date=" + daterange);
			}
		}
		if (columnHeader.contains("confirmation-date")) {
			if (data.get("confirmation-date") != null) {
				String date = dateSelectedinddMMyyyy(data.get("confirmation-date"));
				apiParameter.add("confirmation-date=" + date);
			}
		}

		if (columnHeader.contains("Leaving-date")) {
			if (data.get("Leaving-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("Leaving-date"));
				String date1 = date.replace("/", "");
				apiParameter.add("Leaving-date=" + date1);
			}
		}
		if (columnHeader.contains("Reason-for-leaving")) {
			if (data.get("Reason-for-leaving\"") != null) {
				apiParameter.add("Reason-for-leaving=" + data.get("Reason-for-leaving"));
			}
		}
		if (columnHeader.contains("pf-no")) {
			if (data.get("pf-no") != null) {
				apiParameter.add("pf-no=" + data.get("pf-no"));
			}
		}
		if (columnHeader.contains("vehicle-reg-no")) {
			if (data.get("vehicle-reg-no") != null) {
				apiParameter.add("vehicle-reg-no=" + data.get("vehicle-reg-no"));
			}
		}
		if (columnHeader.contains("Pan")) {
			if (data.get("Pan") != null) {
				apiParameter.add("Pan=" + data.get("Pan"));
			}
		}
		if (columnHeader.contains("personal-phone")) {
			if (data.get("personal-phone") != null) {
				apiParameter.add("personal-phone=" + data.get("personal-phone"));
			}
		}
		if (columnHeader.contains("personal-cell")) {
			if (data.get("personal-cell") != null) {
				apiParameter.add("personal-cell=" + data.get("personal-cell"));
			}
		}
		if (columnHeader.contains("personal-email")) {
			if (data.get("personal-email") != null) {
				apiParameter.add("personal-email=" + data.get("personal-email"));
			}
		}
		if (columnHeader.contains("official-phone")) {
			if (data.get("official-phone") != null) {
				apiParameter.add("official-phone=" + data.get("official-phone"));
			}
		}
		if (columnHeader.contains("official-extension")) {
			if (data.get("official-extension") != null) {
				apiParameter.add("official-extension=" + data.get("official-extension"));
			}
		}
		if (columnHeader.contains("official-cell")) {
			if (data.get("official-cell") != null) {
				apiParameter.add("official-cell=" + data.get("official-cell"));
			}
		}
		if (columnHeader.contains("official-email")) {
			if (data.get("official-email") != null) {
				apiParameter.add("official-email=" + data.get("official-email"));
			}
		}
		if (columnHeader.contains("reporting-incharge")) {
			if (data.get("reporting-incharge") != null) {
				apiParameter.add("reporting-incharge=" + data.get("reporting-incharge"));
			}
		}
		if (columnHeader.contains("ess-login")) {
			if (data.get("ess-login") != null) {
				apiParameter.add("ess-login=" + data.get("ess-login"));
			}
		}
		if (columnHeader.contains("Ess-detail-edit")) {
			if (data.get("Ess-detail-edit") != null) {
				apiParameter.add("Ess-detail-edit=" + data.get("Ess-detail-edit"));
			}
		}
		if (columnHeader.contains("Attendance-via-ess")) {
			if (data.get("Attendance-via-ess") != null) {
				apiParameter.add("Attendance-via-ess=" + data.get("Attendance-via-ess"));
			}
		}
		if (columnHeader.contains("Attendance-calc")) {
			if (data.get("Attendance-calc") != null) {
				apiParameter.add("Attendance-calc=" + data.get("Attendance-calc"));
			}
		}
		if (columnHeader.contains("attendance-policy")) {
			if (data.get("attendance-policy") != null) {
				apiParameter.add("attendance-policy=" + data.get("attendance-policy"));
			}
		}
		if (columnHeader.contains("lateIn-policy")) {
			if (data.get("lateIn-policy") != null) {
				apiParameter.add("lateIn-policy=" + data.get("lateIn-policy"));
			}
		}
		if (columnHeader.contains("earlyOut-policy")) {
			if (data.get("earlyOut-policy") != null) {
				apiParameter.add("earlyOut-policy=" + data.get("earlyOut-policy"));
			}
		}
		if (columnHeader.contains("overtime-policy")) {
			if (data.get("overtime-policy") != null) {
				apiParameter.add("overtime-policy=" + data.get("overtime-policy"));
			}
		}
		if (columnHeader.contains("absentee-policy")) {
			if (data.get("absentee-policy") != null) {
				apiParameter.add("absentee-policy=" + data.get("absentee-policy"));
			}
		}
		if (columnHeader.contains("coff-policy")) {
			if (data.get("coff-policy") != null) {
				apiParameter.add("coff-policy=" + data.get("coff-policy"));
			}
		}
		if (columnHeader.contains("pin")) {
			if (data.get("pin") != null) {
				apiParameter.add("pin=" + data.get("pin"));
			}
		}
		if (columnHeader.contains("card-1")) {
			if (data.get("card-1") != null) {
				apiParameter.add("card-1=" + data.get("card-1"));
			}
		}
		if (columnHeader.contains("card-2")) {
			if (data.get("card-2") != null) {
				apiParameter.add("card-2=" + data.get("card-2"));
			}
		}
		if (columnHeader.contains("Shift-schedule")) {
			if (data.get("Shift-schedule") != null) {
				apiParameter.add("Shift-schedule=" + data.get("Shift-schedule"));
			}
		}
		if (columnHeader.contains("start-shift")) {
			if (data.get("start-shift") != null) {
				apiParameter.add("start-shift=" + data.get("start-shift"));
			}
		}
		if (columnHeader.contains("holiday-schedule")) {
			if (data.get("holiday-schedule") != null) {
				apiParameter.add("holiday-schedule=" + data.get("holiday-schedule"));
			}
		}
		if (columnHeader.contains("device-group-id")) {
			if (data.get("device-group-id") != null) {
				apiParameter.add("device-group-id=" + data.get("device-group-id"));
			}
		}
		if (columnHeader.contains("device-group")) {
			if (data.get("device-group") != null) {
				apiParameter.add("device-group=" + data.get("device-group"));
			}
		}
		if (columnHeader.contains("visa-no")) {
			if (data.get("visa-no") != null) {
				apiParameter.add("visa-no=" + data.get("visa-no"));
			}
		}
		if (columnHeader.contains("visa-expiry")) {
			if (data.get("visa-expiry") != null) {
				String date = dateSelectedinddMMyyyy(data.get("visa-expiry"));
				apiParameter.add("visa-expiry=" + date);
			}
		}
		if (columnHeader.contains("driving-license-expiry")) {
			if (data.get("driving-license-expiry") != null) {
				String date = dateSelectedinddMMyyyy(data.get("driving-license-expiry"));
				apiParameter.add("driving-license-expiry=" + date);
			}
		}
		if (columnHeader.contains("driving-license")) {
			if (data.get("driving-license") != null) {
				apiParameter.add("driving-license=" + data.get("driving-license"));
			}
		}
		if (columnHeader.contains("passport-no")) {
			if (data.get("passport-no") != null) {
				apiParameter.add("passport-no=" + data.get("passport-no"));
			}
		}
		if (columnHeader.contains("passport-expiry")) {
			if (data.get("passport-expiry") != null) {
				String date = dateSelectedinddMMyyyy(data.get("passport-expiry"));
				apiParameter.add("passport-expiry=" + date);
			}
		}
		if (columnHeader.contains("job-assignment-type")) {
			if (data.get("job-assignment-type") != null) {
				apiParameter.add("job-assignment-type=" + data.get("job-assignment-type"));
			}
		}
		if (columnHeader.contains("FVM-enable")) {
			if (data.get("FVM-enable") != null) {
				apiParameter.add("FVM-enable=" + data.get("FVM-enable"));
			}
		}
		if (columnHeader.contains("authorized-host-user")) {
			if (data.get("authorized-host-user") != null) {
				apiParameter.add("authorized-host-user=" + data.get("authorized-host-user"));
			}
		}
		if (columnHeader.contains("Allow-ecanteen")) {
			if (data.get("Allow-ecanteen") != null) {
				apiParameter.add("Allow-ecanteen=" + data.get("Allow-ecanteen"));
			}
		}
		if (columnHeader.contains("account-type")) {
			if (data.get("account-type") != null) {
				apiParameter.add("account-type=" + data.get("account-type"));
			}
		}
		if (columnHeader.contains("max-allowed-limit")) {
			if (data.get("max-allowed-limit") != null) {
				apiParameter.add("max-allowed-limit=" + data.get("max-allowed-limit"));
			}
		}
		// by Chhaya
		if (columnHeader.contains("punch-api")) {
			if (data.get("punch-api") != null) {
				apiParameter.add("punch-api=" + data.get("punch-api"));
			}
		}
		// by Chhaya
		if (columnHeader.contains("FVM-enable")) {
			if (data.get("FVM-enable") != null) {
				apiParameter.add("FVM-enable=" + data.get("FVM-enable"));
			}
		}
		// by Chhaya
		if (columnHeader.contains("job-assignment-type")) {
			if (data.get("job-assignment-type") != null) {
				apiParameter.add("job-assignment-type=" + data.get("job-assignment-type"));
			}
		}
		// by Chhaya
		if (columnHeader.contains("enable-fr")) {
			if (data.get("enable-fr") != null) {
				apiParameter.add("enable-fr=" + data.get("enable-fr"));
			}
		}
		// Mayank
		if (columnHeader.contains("Organization_code")) {
			if (data.get("Organization_code") != null) {
				apiParameter.add("Organization_code=" + data.get("Organization_code"));
			}
		}
		if (columnHeader.contains("branch_code")) {
			if (data.get("branch_code") != null) {
				apiParameter.add("branch_code=" + data.get("branch_code"));
			}
		}
		if (columnHeader.contains("department_code")) {
			if (data.get("department_code") != null) {
				apiParameter.add("department_code=" + data.get("department_code"));
			}
		}
		if (columnHeader.contains("category_code")) {
			if (data.get("category_code") != null) {
				apiParameter.add("category_code=" + data.get("category_code"));
			}
		}
		if (columnHeader.contains("grade_code")) {
			if (data.get("grade_code") != null) {
				apiParameter.add("grade_code=" + data.get("grade_code"));
			}
		}
		if (columnHeader.contains("designation_code")) {
			if (data.get("designation_code") != null) {
				apiParameter.add("designation_code=" + data.get("designation_code"));
			}
		}
		if (columnHeader.contains("section_code")) {
			if (data.get("section_code") != null) {
				apiParameter.add("section_code=" + data.get("section_code"));
			}
		}
		if (columnHeader.contains("Blacklisted")) {
			if (data.get("Blacklisted") != null) {
				apiParameter.add("Blacklisted=" + data.get("Blacklisted"));
			}
		}
		if (columnHeader.contains("customgroup1_code")) {
			if (data.get("customgroup1_code") != null) {
				apiParameter.add("customgroup1_code=" + data.get("customgroup1_code"));
			}
		}
		if (columnHeader.contains("customgroup2_code")) {
			if (data.get("customgroup2_code") != null) {
				apiParameter.add("customgroup2_code=" + data.get("customgroup2_code"));
			}
		}
		if (columnHeader.contains("customgroup3_code")) {
			if (data.get("customgroup3_code") != null) {
				apiParameter.add("customgroup3_code=" + data.get("customgroup3_code"));
			}
		}
		if (columnHeader.contains("access-validity-date")) {
			if (data.get("access-validity-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("access-validity-date"));
				apiParameter.add("access-validity-date=" + date);
			}
		}

		// return apiPar;
	}

	// By Mayank
	// Assign Policy to user
	public String policyAssignToUser(String uid, String atdPlc, String absPlc, String otPlc, String ltInPlc,
			String erlOutPlc, String coPlc) throws InterruptedException {
		pageLoadWaitng();
		addButtonClick();
		waitForElementClickable(active);
		element_InputTextUsingActionClass(userId, uid);
		Thread.sleep(700);
		element_Click(basicTab);
		element_Click(timeattendanceTab);
		element_Click(policytab);
		waitForElementVisible(attendancePolicyName);
		if (atdPlc != null) {
			element_Clear(userConfigAutoAttendancePolicyID);
			element_TextBoxToClickOnTab(userConfigAutoAttendancePolicyID);
			element_Clear(attendancePolicyName);
			element_TextBoxToClickOnTab(attendancePolicyName);
			element_dynamicDDSelect(attendancePolicyName, atdPlc);
		}
		if (absPlc != null) {
			element_Clear(userConfigAutoAbsentPolicyID);
			element_TextBoxToClickOnTab(userConfigAutoAbsentPolicyID);
			element_Clear(absenteePolicyName);
			element_TextBoxToClickOnTab(absenteePolicyName);
			element_dynamicDDSelect(absenteePolicyName, absPlc);
		}
		if (otPlc != null) {
			element_Clear(userConfigAutoOTPolicyID);
			element_TextBoxToClickOnTab(userConfigAutoOTPolicyID);
			element_Clear(overtimePolicyName);
			element_TextBoxToClickOnTab(overtimePolicyName);
			element_dynamicDDSelect(overtimePolicyName, otPlc);

		}
		if (ltInPlc != null) {
			element_Clear(userConfigAutoLateInPolicyID);
			element_TextBoxToClickOnTab(userConfigAutoLateInPolicyID);
			element_Clear(lateINPolicyName);
			element_TextBoxToClickOnTab(lateINPolicyName);
			element_dynamicDDSelect(lateINPolicyName, ltInPlc);
		}
		if (erlOutPlc != null) {
			element_Clear(userConfigAutoEarlyOutPolicyID);
			element_TextBoxToClickOnTab(userConfigAutoEarlyOutPolicyID);
			element_Clear(earlyOUTPolicyName);
			element_TextBoxToClickOnTab(earlyOUTPolicyName);
			element_dynamicDDSelect(earlyOUTPolicyName, erlOutPlc);
		}
		if (coPlc != null) {
			element_Clear(userConfigAutoCOPolicyID);
			element_TextBoxToClickOnTab(userConfigAutoCOPolicyID);
			element_Clear(cOffPolicyName);
			element_TextBoxToClickOnTab(cOffPolicyName);
			element_dynamicDDSelect(cOffPolicyName, coPlc);
		}
		saveButtonClick();
		String valmsg = validationMessage();
		return valmsg;
	}

	// Mayank
	public Boolean verifyUserIDfieldWhileAddUser() throws InterruptedException {
		addButtonClick();
		waitForElementClickable(active);
		Boolean idEnable = element_isEnabled(userId);
		return idEnable;
	}

	public String verifyUserID(String name) throws InterruptedException {
		waitForElementVisible(userName);
		element_dynamicDDSelect(userName, name);
		element_Click(basicTab);
		String userid = userId.getAttribute("value");
		reloadPageButtonClick();
		// cancelButtonClick();
		return userid;
	}

	// Mayank
	public void customFieldsVerification(String userid, List<Map<String, String>> data) throws InterruptedException {
		waitForElementVisible(userId);
		Thread.sleep(1000);
		element_Clear(userId);
		element_InputTextUsingActionClass(userId, userid);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		element_Click(generalTab);
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
					logger.info("FieldName: " + fieldName);
					String actualFieldLabel = customFieldRows.get(i).getText();
					logger.debug(actualFieldLabel);
					Assert.assertEquals(actualFieldLabel, fieldName);
				}
				// Type
				if (type != null) {
					String actualType1 = customFieldRows.get(i)
							.findElement(By.xpath("following-sibling::div[1]//input")).getAttribute("data-default");
					logger.info(actualType1);
					String actualType = null;
					Boolean actualType2 = Boolean.parseBoolean(actualType1);
					if (actualType1 != null && actualType1.equalsIgnoreCase("Date")) {
						actualType = "Date";
					} else {
						actualType = "Textbox";
					}
					System.out.println("[" + actualType1 + "]");
					Assert.assertEquals(actualType, type);
				}
				// Upload
				if (upload != null) {
					int actualUpload = customFieldRows.get(i)
							.findElements(By.xpath("following-sibling::div[2]/div[not(@hidden)][1]")).size();
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
	public String uploadDocumentsInCustomFields(Map<String, String> data) throws InterruptedException, IOException {
		Thread.sleep(2000);
		waitForElementVisible(userId);
		Thread.sleep(1000);
		element_Clear(userId);
		element_InputTextUsingActionClass(userId, data.get("userid"));
		Thread.sleep(2000);
		pageLoadWaitng();
		element_Click(generalTab);
		Thread.sleep(1000);

		for (int i = 0; i < customFieldRows.size(); i++) {
			String fieldLabel = customFieldRows.get(i).getText();
			if (data.get("Adhar") != null && data.get("Adhar").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("Adhar")) {
					WebElement uploadIcon = customFieldRows.get(i)
							.findElement(By.xpath("following-sibling::div[2]/div[not(@hidden)][1]//a"));
					element_Click(uploadIcon);
					Thread.sleep(1000);
					uploadDocumentUsingAutoIT();
					String actualUpload = null;
					if (customFieldRows.get(i)
							.findElements(By.xpath("following-sibling::div[2]/div[not(@hidden)][2]//a")).size() > 0) {
						actualUpload = "Pass";
					} else {
						actualUpload = "Failed";
					}
					Assert.assertEquals(actualUpload, "Pass");
				}
			}
			if (data.get("PanCard") != null && data.get("PanCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("PanCard")) {
					WebElement uploadIcon = customFieldRows.get(i)
							.findElement(By.xpath("following-sibling::div[2]/div[not(@hidden)][1]//a"));
					element_Click(uploadIcon);
					uploadDocumentUsingAutoIT();
					String actualUpload = null;
					if (customFieldRows.get(i)
							.findElements(By.xpath("following-sibling::div[2]/div[not(@hidden)][2]//a")).size() > 0) {
						actualUpload = "Pass";
					} else {
						actualUpload = "Failed";
					}
					Assert.assertEquals(actualUpload, "Pass");
				}
			}
			if (data.get("VotingCard") != null && data.get("VotingCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("VotingCard")) {
					WebElement uploadIcon = customFieldRows.get(i)
							.findElement(By.xpath("following-sibling::div[2]/div[not(@hidden)][1]//a"));
					element_Click(uploadIcon);
					uploadDocumentUsingAutoIT();
					String actualUpload = null;
					if (customFieldRows.get(i)
							.findElements(By.xpath("following-sibling::div[2]/div[not(@hidden)][2]//a")).size() > 0) {
						actualUpload = "Pass";
					} else {
						actualUpload = "Failed";
					}
					Assert.assertEquals(actualUpload, "Pass");
				}
			}
			if (data.get("CitizenCard") != null && data.get("CitizenCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("CitizenCard")) {
					WebElement uploadIcon = customFieldRows.get(i)
							.findElement(By.xpath("following-sibling::div[2]/div[not(@hidden)][1]//a"));
					element_Click(uploadIcon);
					uploadDocumentUsingAutoIT();
					String actualUpload = null;
					if (customFieldRows.get(i)
							.findElements(By.xpath("following-sibling::div[2]/div[not(@hidden)][2]//a")).size() > 0) {
						actualUpload = "Pass";
					} else {
						actualUpload = "Failed";
					}
					Assert.assertEquals(actualUpload, "Pass");
				}
			}
			if (data.get("IDCard") != null && data.get("IDCard").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("IDCard")) {
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).click();
					WebElement uploadIcon = customFieldRows.get(i)
							.findElement(By.xpath("following-sibling::div[2]/div[not(@hidden)][1]//a"));
					element_Click(uploadIcon);
					uploadDocumentUsingAutoIT();
					String actualUpload = null;
					if (customFieldRows.get(i)
							.findElements(By.xpath("following-sibling::div[2]/div[not(@hidden)][2]//a")).size() > 0) {
						actualUpload = "Pass";
					} else {
						actualUpload = "Failed";
					}
					Assert.assertEquals(actualUpload, "Pass");
				}
			}
		}
		saveButtonClick();
		String valmsg = validationMessage();
		return valmsg;
	}

	// Mayank
	public String updateUserCustomFields(Map<String, String> data) throws InterruptedException, IOException {
		Thread.sleep(2000);
		waitForElementVisible(userId);
		Thread.sleep(1000);
		element_Clear(userId);
		element_InputTextUsingActionClass(userId, data.get("userid"));
		Thread.sleep(2000);
		pageLoadWaitng();
		element_Click(generalTab);
		Thread.sleep(1000);

		for (int i = 0; i < customFieldRows.size(); i++) {
			String fieldLabel = customFieldRows.get(i).getText();
			if (data.get("Adhar") != null && !data.get("Adhar").equalsIgnoreCase("UploadFile")) {
				if (fieldLabel.equalsIgnoreCase("Adhar")) {
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input")).clear();
					customFieldRows.get(i).findElement(By.xpath("following-sibling::div[1]//input"))
							.sendKeys(data.get("Adhar"));
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

	// By Chhaya
	public void verifyUserFromUserConfig(List<String> columnHeader, Map<String, String> data)
			throws InterruptedException {
		String actualRes = null;
		pageLoadWaitng();
		Thread.sleep(1000);
		element_Clear(userId);
		Thread.sleep(1000);
		element_InputTextUsingActionClass(userId, data.get("UserID"));
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		// User status
		if (data.get("Status") != null) {
			if (!element_getInputControlValue(userName).isBlank()
					|| !element_getInputControlValue(userName).isEmpty()) {
				actualRes = statusLabel.getText();
				cancelButtonClick();
				Thread.sleep(1000);
			} else if (validationMessage.size() > 0) {
				// Thread.sleep(1000);
				actualRes = validationMessage();
				Thread.sleep(1000);
			} else {
				Thread.sleep(1000);
				element_Click(informationPopupCancelBtn);
				Thread.sleep(1000);
				actualRes = validationMessage();
			}
			Assert.assertEquals(actualRes, data.get("Status"));
		}
		// Parameters
		// *****************************************************************
		// ********** T&A tab **************************************
		// ****************************************************************
		if (data.get("EnableAttendanceCalculation") != null || data.get("AttendancePolicy") != null) {
			Thread.sleep(1000);
			element_Click(tandATab);
			// Parameters
			if (data.get("EnableAttendanceCalculation") != null) {
				Boolean actualEnableAttendanceCalculationFlag = enableAttendanceCalculationCheckbox.isSelected();
				Boolean expectedEnableAttendanceCalculationFlag = Boolean
						.parseBoolean(data.get("EnableAttendanceCalculation"));
				Assert.assertEquals(actualEnableAttendanceCalculationFlag, expectedEnableAttendanceCalculationFlag);
			}
			// Policy Parameters
			Thread.sleep(1000);
			element_Click(tandAPolicyTab);
			Thread.sleep(1500);
			if (data.get("AttendancePolicy") != null) {
				String actualAttendancePolicy = attendancePolicyName.getAttribute("value");
				Assert.assertEquals(actualAttendancePolicy, data.get("AttendancePolicy"));
			}
		}
		// *****************************************************************
		// ********** Access Control tab **************************************
		// ****************************************************************
		if (data.get("AccessValidity") != null || data.get("AccessValidityDate") != null) {
			Thread.sleep(1000);
			element_Click(accessControlTab);
			// Parameters
			if (data.get("AccessValidity") != null) {
				Boolean actualAccessValidityFlag = accessValidityFlag.isSelected();
				Boolean expectedAccessValidityFlag = Boolean.parseBoolean(data.get("AccessValidity"));
				Assert.assertEquals(actualAccessValidityFlag, expectedAccessValidityFlag);
			}
			if (data.get("AccessValidityDate") != null) {
				String date = dateSelected(data.get("AccessValidityDate"));
				String actualAccessValidityDate = accessValidityDateTxt.getAttribute("value");
				Assert.assertEquals(actualAccessValidityDate, date);
			}
			// Advance Access Control
			waitForElementVisible(accessControlAdvanceTab);
			element_Click(accessControlAdvanceTab);
			Thread.sleep(1000);
			if (data.get("EnableAdvanceAccessControl") != null) {
				Boolean actualEnableAdvanceAccessControlFlag = enableAdvanceAccessControl.isSelected();
				Boolean expectedEnableAdvanceAccessControlFlag = Boolean
						.parseBoolean(data.get("EnableAdvanceAccessControl"));
				Assert.assertEquals(actualEnableAdvanceAccessControlFlag, expectedEnableAdvanceAccessControlFlag);
			}
		}
		// *****************************************************************
		// ********** ESS tab **************************************
		// ****************************************************************
		if (data.get("EnableAccount") != null || data.get("ESSRoleRights") != null) {
			Thread.sleep(1000);
			element_Click(essTab);
			// Parameters
			if (data.get("EnableAccount") != null) {
				Boolean actualEnableAccountFlag = enableAccount.isSelected();
				Boolean expectedEnableAccountFlag = Boolean.parseBoolean(data.get("EnableAccount"));
				Assert.assertEquals(actualEnableAccountFlag, expectedEnableAccountFlag);
			}
			if (data.get("ESSRoleRights") != null) {
				String actualESSRoleRights = eSSRoleRightNmTxt.getAttribute("value");
				Assert.assertEquals(actualESSRoleRights, data.get("ESSRoleRights"));
			}

		}
		// *****************************************************************
		// ********** Cafeteria tab **************************************
		// ****************************************************************
		if (data.get("CafeteriaEnable") != null || data.get("DiscountLevel") != null) {
			Thread.sleep(1000);
			element_Click(cafeteriaTab);
			// Parameters
			if (data.get("CafeteriaEnable") != null) {
				Boolean actualCafeteriaEnableFlag = cafeEnableFlag.isSelected();
				Boolean expectedCafeteriaEnableFlag = Boolean.parseBoolean(data.get("CafeteriaEnable"));
				Assert.assertEquals(actualCafeteriaEnableFlag, expectedCafeteriaEnableFlag);
			}
			if (data.get("DiscountLevel") != null) {
				String actualDiscountLevel = element_DropDownFirstSelectedValue(discountLevelDD);
				Assert.assertEquals(actualDiscountLevel, data.get("DiscountLevel"));
			}
		}
		// *****************************************************************
		// ********** job Costing tab **************************************
		// ****************************************************************
		if (data.get("JobCosting") != null) {
			Thread.sleep(1000);
			element_Click(jobCostingTab);
			// Parameters
			if (data.get("JobCosting") != null) {
				String actualJobCosting = element_DropDownFirstSelectedValue(jobCostingDropdown);
				Assert.assertEquals(actualJobCosting, data.get("JobCosting"));
			}
		}
		// *****************************************************************
		// ********** FVM tab **************************************
		// ****************************************************************
		if (data.get("EnableFVM") != null) {
			Thread.sleep(1000);
			element_Click(fVMTab);
			// Parameters
			if (data.get("EnableFVM") != null) {
				Boolean actualEnableFVMFlag = enableFVMChk.isSelected();
				Boolean expectedEnableFVMFlag = Boolean.parseBoolean(data.get("EnableFVM"));
				Assert.assertEquals(actualEnableFVMFlag, expectedEnableFVMFlag);
			}
		}
		// *****************************************************************
		// ********** Face Recognition tab **************************************
		// ****************************************************************
		if (data.get("EnableFaceRecognition") != null) {
			Thread.sleep(1000);
			element_Click(faceRecognitionTab);
			// Parameters
			if (data.get("EnableFaceRecognition") != null) {
				Boolean actualEnableFaceRecognitionFlag = fREnable.isSelected();
				Boolean expectedEnableFaceRecognitionFlag = Boolean.parseBoolean(data.get("EnableFaceRecognition"));
				Assert.assertEquals(actualEnableFaceRecognitionFlag, expectedEnableFaceRecognitionFlag);
			}
		}
		// *****************************************************************
		// ********** Visitor Management tab **************************************
		// ****************************************************************
		if (data.get("AuthorizedHostUser") != null) {
			Thread.sleep(1000);
			element_Click(visitorManagementTab);
			// Parameters
			if (data.get("AuthorizedHostUser") != null) {
				Boolean actualAuthorizedHostUserFlag = authHostUserEnable.isSelected();
				Boolean expectedAuthorizedHostUserFlag = Boolean.parseBoolean(data.get("AuthorizedHostUser"));
				Assert.assertEquals(actualAuthorizedHostUserFlag, expectedAuthorizedHostUserFlag);
			}
		}

	}

	// By Chhaya
	public void verifyEnterpriseGroupFromUserConfig(String userID, String organization, String branch,
			String department, String section, String category, String grade, String designation, String customGroup1,
			String customGroup2, String customGroup3) throws InterruptedException {

		pageLoadWaitng();
		waitForElementClickable(userId);
		Thread.sleep(1000);
		element_Clear(userId);
		Thread.sleep(1000);
		element_InputTextUsingActionClass(userId, userID);
		// Thread.sleep(1000);
		Thread.sleep(400);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		element_Click(groupTab);
		Thread.sleep(1000);

		ArrayList<String> arList = new ArrayList<String>();
		for (WebElement enterpriseGroup : enterpriseGroupList) {
			String entGroupName = enterpriseGroup.getAttribute("value");
			arList.add(entGroupName);
		}
		if (organization != null) {
			String organizationVal = arList.get(0);
			Assert.assertEquals(organizationVal, organization);
		}
		if (branch != null) {
			String branchVal = arList.get(1);
			Assert.assertEquals(branchVal, branch);
		}
		if (department != null) {
			String departmentVal = arList.get(2);
			Assert.assertEquals(departmentVal, department);
		}
		if (section != null) {
			String sectionVal = arList.get(3);
			Assert.assertEquals(sectionVal, section);
		}
		if (category != null) {
			String categoryVal = arList.get(4);
			Assert.assertEquals(categoryVal, category);
		}
		if (grade != null) {
			String gradeVal = arList.get(5);
			Assert.assertEquals(gradeVal, grade);
		}
		if (designation != null) {
			String designationVal = arList.get(6);
			Assert.assertEquals(designationVal, designation);
		}
		if (customGroup1 != null) {
			String customGroup1Val = arList.get(7);
			Assert.assertEquals(customGroup1Val, customGroup1);
		}
		if (customGroup2 != null) {
			String customGroup2Val = arList.get(8);
			Assert.assertEquals(customGroup2Val, customGroup2);
		}
		if (customGroup3 != null) {
			String customGroup3Val = arList.get(9);
			Assert.assertEquals(customGroup3Val, customGroup3);
		}
	}

	// By Chhaya
	public void verifyGroupFieldName(String renamedGroup) throws InterruptedException {
		String actualRes = null;
		Thread.sleep(2000);
		element_Click(groupTab);
		Thread.sleep(1000);
		for (WebElement labelVal : enterpriseGroupLabelList) {
			String labelValue = labelVal.getText();

			if (labelValue.equalsIgnoreCase(renamedGroup)) {
				actualRes = labelVal.getText();
			}
		}
		Assert.assertEquals(actualRes, renamedGroup);
	}

	// By Chhaya
	public void verifyJobCostingTabName(String tabName) throws InterruptedException {
		pageLoadWaitng();
		logger.info("TabName: " + tabName);
		String lableName = jobCostingTab.getText();
		Assert.assertEquals(lableName, tabName);
	}

	// By Chhaya
	public void resetUserPassword(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserId: " + data.get("userid"));
			String val = null;
			String userid1 = data.get("userid");
			String validation = data.get("Validation");
			addButtonClick();
			waitForElementClickable(active);
			element_Clear(userId);
			element_InputTextUsingActionClass(userId, userid1);
			Thread.sleep(700);
			element_Click(basicTab);
			Thread.sleep(2000);
			if (!element_getInputControlValue(userName).isBlank()
					|| !element_getInputControlValue(userName).isEmpty()) {
				element_Click(resetPassBtn);
				Thread.sleep(1000);
				val = validationMessage();
				Thread.sleep(1000);
				Assert.assertEquals(val, validation);
			} else {
				cancelButtonClick();
				Thread.sleep(1000);
			}
		}
	}

	// Chhaya
	public void addUserInBlacklist(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserId: " + data.get("userid"));
			String val = null;
			String userid1 = data.get("userid");
			String reasonForBlacklist = data.get("ReasonForBlacklist");
			String validation = data.get("Validation");
			addButtonClick();
			Thread.sleep(1000);
			waitForElementVisible(userId);
			element_Clear(userId);
			element_InputTextUsingActionClass(userId, userid1);
			Thread.sleep(700);
			element_Click(basicTab);
			Thread.sleep(2000);
			if (!element_getInputControlValue(userName).isBlank()
					|| !element_getInputControlValue(userName).isEmpty()) {
				element_Click(blacklistBtn);
				pageLoadWaitng();
				// Thread.sleep(2000);
				waitForElementVisible(blacklistReasonTxt);
				element_Clear(blacklistReasonTxt);
				element_InputTextUsingActionClass(blacklistReasonTxt, reasonForBlacklist);
				Thread.sleep(1000);
				element_Click(blacklistOkBtn);
				Thread.sleep(1500);
				val = validationMessage();
				Thread.sleep(1000);
				Assert.assertEquals(val, validation);
			} else {
				cancelButtonClick();
				Thread.sleep(1000);
			}
		}
	}

	// by Chhaya
	public void verifyUserEvents(String usrId, String fromDt, String toDt, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userId);
		List<List<String>> dt1 = dataTable.asLists();
		Boolean expMsg = true;
		addButtonClick();
		Thread.sleep(1000);
		waitForElementVisible(userId);
		element_Clear(userId);
		element_InputTextUsingActionClass(userId, usrId);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		if (!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			element_Click(eventsTab);
			Thread.sleep(3000);
			String fDate = dateSelected(fromDt);
			String tDate = dateSelected(toDt);
			element_Clear(startDateTxt1);
			element_InputTextUsingActionClass(startDateTxt1, fDate);
			Thread.sleep(400);
			element_TextBoxToClickOnTab(startDateTxt1);
			element_Clear(endDateTxt1);
			element_InputTextUsingActionClass(endDateTxt1, tDate);
			Thread.sleep(400);
			element_TextBoxToClickOnTab(endDateTxt1);
			Thread.sleep(1000);
			element_ClickUsingJS(viewBtnEvents);
			Thread.sleep(1000);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("event-date: " + data.get("event-date") + " event-time: " + data.get("event-time"));
				String eventDate = data.get("event-date");
				String eventTime = data.get("event-time");
				String eventType = data.get("EventType");
				Boolean actMsg = false;
				String actDT = null;
				String edate = dateSelected(eventDate);
				String expDateAndTime = edate + " " + eventTime;
				if (eventType.equalsIgnoreCase("Attendance Events")) {
					if (attendanceEventsCollaps.size() == 0) {
						element_Click(atdCollapsClick);
						Thread.sleep(1000);
					}
					if (attendanceEventsTable.size() == dt1.size() - 1) {
						for (int i = 0; i < attendanceEventsTableCols.size(); i++) {
							String dtTime = attendanceEventsTableCols.get(i).getText();
							if (dtTime.contains(":")) {
								String[] dtTime1 = dtTime.split(":");
								dtTime = dtTime1[0] + dtTime1[1];
								if (dtTime.equalsIgnoreCase(expDateAndTime)) {
									actDT = dtTime;
									actMsg = true;
								}
							}
						}
					}
				} else if (eventType.equalsIgnoreCase("Access Control")) {
					if (accessControlCollaps.size() == 0) {
						element_Click(acsCollapsClick);
						Thread.sleep(1000);
					}
					if (acsControlEventsTable.size() == dt1.size() - 1) {
						for (int i = 0; i < acsControlEventsTableCols.size(); i++) {
							String dtTime = acsControlEventsTableCols.get(i).getText();
							if (dtTime.contains(":")) {
								String[] dtTime1 = dtTime.split(":");
								dtTime = dtTime1[0] + dtTime1[1];
								if (dtTime.equalsIgnoreCase(expDateAndTime)) {
									actDT = dtTime;
									actMsg = true;
								}
							}
						}
					}
				}
				logger.debug("exp msg = " + expDateAndTime);
				logger.debug("act msg = " + actDT);
				Thread.sleep(1000);
				Assert.assertEquals(actMsg, expMsg);
				cancelButtonClick();
			}
		} else {
			cancelButtonClick();
			Thread.sleep(1000);
		}
	}

	// by Chhaya
	public void restoreUserFromUserConfig(String usrId) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userId);
		element_Clear(userId);
		element_InputTextUsingActionClass(userId, usrId);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		if (!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			element_Click(restoreUserBtn);
			Thread.sleep(1000);
		} else {
			cancelButtonClick();
			Thread.sleep(1000);
		}
	}

	// *********************************************************************************************************
	// **************************************User_Events_API*********************
	// *********************************************************************************************************
	public void userEventsAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data) {
		if (columnHeader.contains("Userid")) {
			if (data.get("Userid") != null) {
				apiParameter.add("Userid=" + data.get("Userid"));
			}
		}
		if (columnHeader.contains("event-date") && columnHeader.contains("event-time")
				|| columnHeader.contains("CurrentDtTominusMonthDate") && columnHeader.contains("event-time")) {
			if (data.get("CurrentDtTominusMonthDate") != null && data.get("event-time") != null
					&& data.get("event-date") != null) {
				String eventdatetime = currentDt2minus1MonthDateAndDate(data.get("CurrentDtTominusMonthDate"),
						data.get("event-date")).replace("/", "") + data.get("event-time");

				apiParameter.add("event-datetime=" + eventdatetime);
			} else if (data.get("CurrentDtTominusMonthDate") != null && data.get("event-time") != null) {
				String eventdatetime = currentDt2minus1MonthDate(data.get("CurrentDtTominusMonthDate")).replace("/", "")
						+ data.get("event-time");
				apiParameter.add("event-datetime=" + eventdatetime);
			} else if (data.get("event-date") != null && data.get("event-time") != null) {
				String edate = null;
				if (data.get("event-date").length() > 4) {
					edate = data.get("event-date");
				} else {
					edate = dateSelectedinddMMyyyy(data.get("event-date"));
				}
				String etime = data.get("event-time");
				String eventdatetime = edate + etime;
				apiParameter.add("event-datetime=" + eventdatetime);
			}
		}
		if (columnHeader.contains("In-out")) {
			if (data.get("In-out") != null) {
				apiParameter.add("In-out=" + data.get("In-out"));
			}
		}
		if (columnHeader.contains("Spfid")) {
			if (data.get("Spfid") != null) {
				apiParameter.add("Spfid=" + data.get("Spfid"));
			}
		}
		if (columnHeader.contains("Event-type")) {
			if (data.get("Event-type") != null) {
				apiParameter.add("Event-type=" + data.get("Event-type"));
			}
		}
		if (columnHeader.contains("Event_src")) {
			if (data.get("Event_src") != null) {
				apiParameter.add("Event_src=" + data.get("Event_src"));
			}
		}
	}

	//////////////// Assign Jobs to User//////////////////
	public void assignJobToUser(String user, DataTable dataTable) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(userId);
		addButtonClick();
		Thread.sleep(1500);
		String valmsg = null;
		element_InputTextUsingActionClass(userId, user);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		if (!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			element_Click(jobCostingTab);
			Thread.sleep(1000);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("JobCode: " + data.get("JobCode"));
				element_Click(jobAddBtn);
				Thread.sleep(1000);
				element_Clear(jobCodeTxt);
				element_InputTextUsingActionClass(jobCodeTxt, data.get("JobCode"));
				Thread.sleep(400);
				element_Click(jobCostingTab);
				Thread.sleep(1000);
				if (data.get("JobSchedulerType") != null) {
					if (data.get("JobSchedulerType").equalsIgnoreCase("Monthly")
							|| data.get("JobSchedulerType").equalsIgnoreCase("Daily")) {
						String currentMonth = integerMonthSelected("0");
						String currentYear = integerYearSelected("0");
						if (data.get("AssignmentStart") != null) {
							int startDateValue = Integer.parseInt(data.get("AssignmentStart"));
							if (startDateValue < 1) {
								String sdate = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentStart"));
								element_Clear(assignmentStartDateTxt);
								element_InputTextUsingActionClass(assignmentStartDateTxt, sdate);
							} else {
								if (data.get("AssignmentStart").length() == 1) {
									String startDt1 = "0" + data.get("AssignmentStart") + "/" + currentMonth + "/"
											+ currentYear;
									element_Clear(assignmentStartDateTxt);
									element_InputTextUsingActionClass(assignmentStartDateTxt, startDt1);
								} else {
									String startDt2 = data.get("AssignmentStart") + "/" + currentMonth + "/"
											+ currentYear;
									element_Clear(assignmentStartDateTxt);
									element_InputTextUsingActionClass(assignmentStartDateTxt, startDt2);
								}
							}
						}
						if (data.get("AssignmentEnd") != null) {
							int endDateValue = Integer.parseInt(data.get("AssignmentEnd"));
							if (endDateValue > 31) {
								String eDate = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentEnd"));
								element_Clear(assignmentEndDateTxt);
								element_InputTextUsingActionClass(assignmentEndDateTxt, eDate);
							} else {
								if (data.get("AssignmentEnd").length() == 1) {
									String endDt1 = "0" + data.get("AssignmentEnd") + "/" + currentMonth + "/"
											+ currentYear;
									element_Clear(assignmentEndDateTxt);
									element_InputTextUsingActionClass(assignmentEndDateTxt, endDt1);
								} else {
									String endDt2 = data.get("AssignmentEnd") + "/" + currentMonth + "/" + currentYear;
									element_Clear(assignmentEndDateTxt);
									element_InputTextUsingActionClass(assignmentEndDateTxt, endDt2);
								}
							}
						}
					}
				} else {
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
				}

				if (data.get("ESSAssignment") != null) {
					boolean essAssignment = Boolean.parseBoolean(data.get("ESSAssignment"));
					if (essAssignment == true) {
						if (!jobAssignmentChk.isSelected()) {
							element_Click(jobAssignmentChk);
						}
					} else {
						if (jobAssignmentChk.isSelected()) {
							element_Click(jobAssignmentChk);
						}
					}
					Thread.sleep(500);
				}
				element_Click(jobAssignmentOkBtn);
				Thread.sleep(700);
				if (data.get("Validation") != null) {
					if (jobCostingValMsgSize.size() > 0) {
						String val = jobCostingValMsg.getText();
						Thread.sleep(1000);
						Assert.assertEquals(val, data.get("Validation"));
					}
				}
			}
			Thread.sleep(1000);
			saveButtonClick();
			Thread.sleep(1000);
			valmsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valmsg, "Saved Successfully");
		} else {
			cancelButtonClick();
			Assert.assertEquals("User Not Found", "Saved Successfully");
			Thread.sleep(1000);
		}
	}

	public void prioritizeJob(String userID, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userId);
		addButtonClick();
		Thread.sleep(1500);
		element_InputTextUsingActionClass(userId, userID);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		if (!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("JobCode: " + data.get("JobCode"));
				element_Click(jobCostingTab);
				Thread.sleep(1000);
				for (int i = 0; i < defaultJobTable.size(); i++) {
					String actualJobCode = defaultJobTable.get(i).getText();
					if (data.get("JobCode").equalsIgnoreCase(actualJobCode)) {
						if (data.get("PrioritizeJob").equalsIgnoreCase("up")) {
							WebElement keyUp = defaultJobTable.get(i)
									.findElement(By.xpath("following-sibling::td[7]/i[@key='Up']"));
							Thread.sleep(500);
							// element_ClickUsingJS(keyUp);
							element_Click(keyUp);
							Thread.sleep(1000);
						}
						if (data.get("PrioritizeJob").equalsIgnoreCase("down")) {
							WebElement keyDown = defaultJobTable.get(i)
									.findElement(By.xpath("following-sibling::td[7]/i[@key='Down']"));
							Thread.sleep(500);
							// element_ClickUsingJS(keyDown);
							element_Click(keyDown);
							Thread.sleep(1000);
						}
						break;
					}
				}
			}
			saveButtonClick();
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(500);
			Assert.assertEquals(valMsg, "Saved Successfully");
			// reloadPageButtonClick();
		} else {
			Assert.assertEquals("User Not Found", "Saved Successfully");
		}
	}

	public void verifyJobPriority(String userID, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userId);
		addButtonClick();
		Thread.sleep(1500);
		element_InputTextUsingActionClass(userId, userID);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		waitForElementClickable(active);
		if (!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			element_Click(jobCostingTab);
			Thread.sleep(1000);
			ArrayList<String> actualJobCodeAr = new ArrayList<String>();
			for (int i = 0; i < defaultJobTable.size(); i++) {
				actualJobCodeAr.add(defaultJobTable.get(i).getText());
			}
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("JobCode: " + data.get("JobCode"));
				String[] expectedJobCodeAr = data.get("JobCode").split(",");
				for (int i = 0; i < expectedJobCodeAr.length; i++) {
					Assert.assertEquals(actualJobCodeAr.get(i), expectedJobCodeAr[i].trim());
				}
			}
			cancelButtonClick();
		} else {
			Assert.assertEquals(userName.getAttribute("value"), userID);
			logger.info(userID + " Not Found");
		}
	}

	public void verifyDeviceConfigurations(String userID, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userId);
		addButtonClick();
		Thread.sleep(1500);
		element_InputTextUsingActionClass(userId, userID);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		waitForElementClickable(active);
		if (!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			element_Click(devicesTab);
			Thread.sleep(1000);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Device: " + data.get("Device"));
				if (data.get("DeviceGroupName") != null) {
					element_Clear(deviceGroupSearch);
					element_InputTextUsingActionClass(deviceGroupSearch, data.get("DeviceGroupName"));
					element_TextBoxToClickOnEnter(deviceGroupSearch);
					Thread.sleep(700);
					for (int i = 0; i < deviceGroupTable.size(); i++) {
						String actualGroupName = deviceGroupTable.get(i).getText();
						if (actualGroupName.equalsIgnoreCase(data.get("DeviceGroupName"))) {
							Assert.assertEquals(actualGroupName, data.get("DeviceGroupName"));
							break;
						}
					}
				}
				if (data.get("AccessProfile") != null) {
					element_Click(configureTab);
					Thread.sleep(1000);
					element_DropDownSelectByvisibleText(deviceDD, data.get("Device"));
					Thread.sleep(1000);
					if (data.get("AccessProfile") != null) {
						String actualValue = element_DropDownFirstSelectedValue(accessProfileDD);
						logger.info("actualValue= " + actualValue);
						Assert.assertEquals(actualValue, data.get("AccessProfile"));
					}
				}
			}
			cancelButtonClick();
		} else {
			Assert.assertEquals(userName.getAttribute("value"), userID);
			logger.info(userID + " Not Found");
		}
	}

	public void changeDeviceConfigurations(String userID, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userId);
		addButtonClick();
		Thread.sleep(1500);
		element_InputTextUsingActionClass(userId, userID);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		waitForElementClickable(active);
		if (!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			element_Click(devicesTab);
			Thread.sleep(1000);
			if (data.get("Device") != null) {
				element_Click(configureTab);
				Thread.sleep(1000);
				element_DropDownSelectByvisibleText(deviceDD, data.get("Device"));
				if (data.get("AccessProfile") != null) {
					element_DropDownSelectByvisibleText(accessProfileDD, data.get("AccessProfile"));
					Thread.sleep(500);
				}
			}
			saveButtonClick();
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(500);
			Assert.assertEquals(valMsg, "Saved Successfully");
		} else {
			Assert.assertEquals(userName.getAttribute("value"), userID);
			logger.info(userID + " Not Found");
		}
	}

	public void getnarateOR(String userid) throws InterruptedException {
		String val = null;
		pageLoadWaitng();
		waitForElementVisible(userId);
		element_InputTextUsingActionClass(userId, userid);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		waitForElementNotToBeClickable(userId);
		cancelButtonClick();
		Thread.sleep(1000);
		element_Click(credentialsTab);
		Thread.sleep(1000);
		element_Click(generateQRImg);
		Thread.sleep(1000);
		val = validationMessage();
		Assert.assertEquals(val, "QR Generated Successfully");
		reloadPageButtonClick();
	}

	public void verifyJob(String userID, DataTable dataTable) throws Exception {
		List<Map<String, String>> jobDetail = JobPO.jobDataForJOBScheduler;
		System.out.println("Job Details " + jobDetail);
		pageLoadWaitng();
		waitForElementVisible(userId);
		addButtonClick();
		Thread.sleep(1500);
		element_InputTextUsingActionClass(userId, userID);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		waitForElementClickable(active);
		if (!element_getInputControlValue(userName).isBlank() || element_getInputControlValue(userName).isEmpty()) {
			element_Click(jobCostingTab);
			Thread.sleep(1000);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				boolean expRes = true;
				boolean actRes = false;
				logger.info("JobCode: " + data.get("JobCode"));
				String rowCount = data.get("RowCount"); // This field is used to validate row count of jobs
				String assignmentStartDate = null;
				String assignmentEndDate = null;
				Set<String> datesOfWeek = null;
				String jobCostingFlagValue = element_DropDownFirstSelectedValue(jobCostingDropdown);
				if (data.get("JobCosting") != null) {
					jobCostingFlagValue = element_DropDownFirstSelectedValue(jobCostingDropdown);
					Thread.sleep(700);
					Assert.assertEquals(jobCostingFlagValue, data.get("JobCosting"));
				}
				// if (jobCostingFlagValue.equalsIgnoreCase("Enabled")) {
				if (data.get("SchedulerType") != null) {
					if (data.get("SchedulerType").equalsIgnoreCase("Monthly")
							|| data.get("SchedulerType").equalsIgnoreCase("Daily")) {
						String month = null;
						String year = null;
						if (data.get("Month") != null) {
							if (data.get("Month").equalsIgnoreCase("Current")) {
								month = integerMonthSelected("0");
								year = integerYearSelected("0");
							} else if (data.get("Month").equalsIgnoreCase("Next")) {
								month = integerMonthSelected("1");
								year = staticYearOrPlusMinusYearFromCurrentYear("1", "0");
							}
						}
						if (data.get("AssignmentStartDate") != null) {
							if (data.get("AssignmentStartDate").equalsIgnoreCase("LastDateOfMonth")) {
								String[] lastDate = getWeekstartDateEndDateForCustomAlert(
										staticDateOrPlusMinusFromCurrentDate("0"), "Sun", "Monthly").split(" to ");
								assignmentStartDate = lastDate[1];
							} else if (data.get("AssignmentStartDate").length() == 1) {
								assignmentStartDate = "0" + data.get("AssignmentStartDate") + "/" + month + "/" + year;
							} else {
								assignmentStartDate = data.get("AssignmentStartDate") + "/" + month + "/" + year;
							}
						}
						if (data.get("AssignmentEndDate") != null) {
							if (data.get("AssignmentEndDate").equalsIgnoreCase("LastDateOfMonth")) {
								String[] lastDate = getWeekstartDateEndDateForCustomAlert(
										staticDateOrPlusMinusFromCurrentDate("0"), "Sun", "Monthly").split(" to ");
								assignmentEndDate = lastDate[1];
							} else if (data.get("AssignmentEndDate").length() == 1) {
								assignmentEndDate = "0" + data.get("AssignmentEndDate") + "/" + month + "/" + year;
							} else {
								assignmentEndDate = data.get("AssignmentEndDate") + "/" + month + "/" + year;
							}
						}
					} else if (data.get("SchedulerType").equalsIgnoreCase("Weekly")) {
						String jobSDate = null;
						String jobEDate = null;
						for (int i = 0; i < jobDetail.size(); i++) {
							if (jobDetail.get(i).get("JobCode").equalsIgnoreCase(data.get("JobCode"))) {
								jobSDate = jobDetail.get(i).get("JobStartDate");
								jobEDate = jobDetail.get(i).get("JobEndDate");
//								if(data.get("Month")!=null) {
//									if(data.get("Month").equalsIgnoreCase("Current")) {
//										jobEDate=validateDateCurrentMonthLastDate(jobEDate);
//									}
//								}
//								System.out.println("jobEDate End Date "+jobEDate);
								Map<String, String> startEndMonthDate = getFromDateChecked(jobSDate, jobEDate,
										data.get("Month"));
								String firstDate = startEndMonthDate.get("fromDate");
								String lastDate = startEndMonthDate.get("toDate");
								System.out.println("checked for Job Id: "+data.get("JobCode"));
								datesOfWeek = getFilteredDatesFromWeeklyConfig(firstDate, lastDate, data.get("Week"),
										data.get("Days"));
								break;
							}
						}
					}
				} else {
					if (data.get("AssignmentStartDate") != null) {
						assignmentStartDate = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentStartDate"));
					}
					if (data.get("AssignmentEndDate") != null) {
						assignmentEndDate = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentEndDate"));
					}
				}

				if (data.containsKey("TableContent") && data.get("TableContent") != null) {
					if (element_isEnabled(defaultJobsSearchBox)) {
						element_Clear(defaultJobsSearchBox);
						element_InputTextUsingActionClass(defaultJobsSearchBox, data.get("JobCode"));
						element_TextBoxToClickOnEnter(defaultJobsSearchBox);
						Thread.sleep(500);
						Assert.assertEquals(noDataFoundLabelJobTable.getText(), data.get("TableContent"));
						element_Clear(defaultJobsSearchBox);
					} else {
						Assert.assertEquals(noDataLabelJobTable.getText(), data.get("TableContent"));
					}
				} else if (defaultJobsSearchBox1.size() > 0) {
					if (data.get("JobCode") != null) {
						Set<String> actualDates = new HashSet<>();
						element_Clear(defaultJobsSearchBox);
						element_InputTextUsingActionClass(defaultJobsSearchBox, data.get("JobCode"));
						element_TextBoxToClickOnEnter(defaultJobsSearchBox);
						Thread.sleep(500);
						if (data.get("SchedulerType") != null && data.get("SchedulerType").equalsIgnoreCase("Weekly")) {
							if (String.valueOf(defaultJobTable.size())
									.equalsIgnoreCase(String.valueOf(datesOfWeek.size()))) {
								for (int i = 0; i < defaultJobTable.size(); i++) {
									String actualJobCode = defaultJobTable.get(i).getText();
									String assignmentStart = defaultJobTable.get(i)
											.findElement(By.xpath("following-sibling::td[2]")).getText();
									String assignmentEnd = defaultJobTable.get(i)
											.findElement(By.xpath("following-sibling::td[3]")).getText();
									if (actualJobCode.equalsIgnoreCase(data.get("JobCode"))) {
										if (assignmentStart.equalsIgnoreCase(assignmentEnd)) {
											actualDates.add(assignmentStart);
										} else {
											Assert.assertEquals("Both dates are different = " + assignmentEnd,
													assignmentStart);
										}
									} else {
										Assert.assertEquals(actualJobCode, data.get("JobCode"));
									}
								}
								for (int k = 0; k < datesOfWeek.size(); k++) {
									if (actualDates.equals(datesOfWeek)) {
										Assert.assertEquals(true, expRes);
									} else {
										Assert.assertEquals(false, expRes);
									}
								}
							} else {
								Assert.assertEquals(String.valueOf(defaultJobTable.size()),
										String.valueOf(datesOfWeek.size()));
							}
						} else {
							for (int i = 0; i < defaultJobTable.size(); i++) {
								String actualJobCode = defaultJobTable.get(i).getText();
								String assignmentStart = defaultJobTable.get(i)
										.findElement(By.xpath("following-sibling::td[2]")).getText();
								String assignmentEnd = defaultJobTable.get(i)
										.findElement(By.xpath("following-sibling::td[3]")).getText();
								Thread.sleep(500);
								if (rowCount.equalsIgnoreCase(String.valueOf(defaultJobTable.size()))) {
									if (actualJobCode.equalsIgnoreCase(data.get("JobCode"))
											&& assignmentStart.equalsIgnoreCase(assignmentStartDate)
											&& assignmentEnd.equalsIgnoreCase(assignmentEndDate)) {
										Thread.sleep(500);
										actRes = true;
										Thread.sleep(500);
										if (data.get("ESSAssignment") != null) {
											String actualESSAssignment = defaultJobTable.get(i)
													.findElement(By.xpath("following-sibling::td[5]/label")).getText();
											Assert.assertEquals(actualESSAssignment, data.get("ESSAssignment"));
										}
										break;
									}
								} else {
									Assert.assertEquals(String.valueOf(defaultJobTable.size()), rowCount);
								}
							}
							Assert.assertEquals(actRes, true);
						}
					}
				}
//				} else {
//					logger.info("Job Costing Flag is " + jobCostingFlagValue);
//				}
			}
			cancelButtonClick();
		} else {
			Assert.assertEquals(userName.getAttribute("value"), userID);
			logger.info(userID + " Not Found");
		}
	}

	public void verifyJobScheduler(String userID, DataTable dataTable) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(userId);
		addButtonClick();
		Thread.sleep(1500);
		element_Clear(userId);
		element_InputTextUsingActionClass(userId, userID);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		waitForElementClickable(active);
		if (!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			element_Click(jobCostingTab);
			Thread.sleep(1000);
			element_Click(assignedJobSchedulesTab);
			Thread.sleep(1000);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String actualStartDate = null;
				String actualEndDate = null;
				String schedulerStartDate = null;
				String schedulerEndDate = null;
				if (data.get("SchedulerType") != null) {
					if (data.get("SchedulerType").equalsIgnoreCase("Monthly")
							|| data.get("SchedulerType").equalsIgnoreCase("Daily")
							|| data.get("SchedulerType").equalsIgnoreCase("Weekly")) {
						String month = null;
						String year = null;
						if (data.get("Month") != null) {
							if (data.get("Month").equalsIgnoreCase("Current")) {
								month = integerMonthSelected("0");
								year = integerYearSelected("0");
							} else if (data.get("Month").equalsIgnoreCase("Next")) {
								month = integerMonthSelected("1");
								year = staticYearOrPlusMinusYearFromCurrentYear("1", "0");
							}
						} else {
							month = integerMonthSelected("0");
							year = integerYearSelected("0");
						}
						if (data.get("SchedulerStartDate").length() == 1) {
							schedulerStartDate = "0" + data.get("SchedulerStartDate") + "/" + month + "/" + year;
						} else {
							schedulerStartDate = data.get("SchedulerStartDate") + "/" + month + "/" + year;
						}
						if (data.get("SchedulerEndDate") != null) {
							int endDateValue = Integer.parseInt(data.get("SchedulerEndDate"));
							if (endDateValue == 31) {
								DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
								LocalDate lt = LocalDate.now();
								LocalDate currentMonthLastDate = LocalDate.of(lt.getYear(), lt.getMonthValue(),
										lt.lengthOfMonth());
								schedulerEndDate = currentMonthLastDate.format(formatter);
							} else if (data.get("SchedulerEndDate").length() == 1) {
								schedulerEndDate = "0" + data.get("SchedulerEndDate") + "/" + month + "/" + year;
							} else {
								schedulerEndDate = data.get("SchedulerEndDate") + "/" + month + "/" + year;
							}
						}
					}
				} else if (data.get("SchedulerStartDate") != null && data.get("SchedulerEndDate") != null) {
					schedulerStartDate = staticDateOrPlusMinusFromCurrentDate(data.get("SchedulerStartDate"));
					schedulerEndDate = staticDateOrPlusMinusFromCurrentDate(data.get("SchedulerEndDate"));
				}
				if (data.containsKey("TableContent") && data.get("TableContent") != null) {
					if (element_isEnabled(jobSchedulerSearchBox)) {
						element_Clear(jobSchedulerSearchBox);
						element_InputTextUsingActionClass(jobSchedulerSearchBox, data.get("SchedulerName"));
						element_TextBoxToClickOnEnter(jobSchedulerSearchBox);
						Thread.sleep(500);
						Assert.assertEquals(notDataFoundLabel.getText(), data.get("TableContent"));
					} else {
						Assert.assertEquals(noDataLabel.getText(), data.get("TableContent"));
					}
				} else if (element_isEnabled(jobSchedulerSearchBox)) {
					element_Clear(jobSchedulerSearchBox);
					element_InputTextUsingActionClass(jobSchedulerSearchBox, data.get("SchedulerName"));
					element_TextBoxToClickOnEnter(jobSchedulerSearchBox);
					Thread.sleep(500);
					if (jobSchedulerTable.size() > 0) {
						for (int i = 0; i < jobSchedulerTable.size(); i++) {
							String actualSchedulerName = jobSchedulerTable.get(i).getText();
							if (actualSchedulerName.equalsIgnoreCase(data.get("SchedulerName"))) {
								actualStartDate = jobSchedulerTable.get(i)
										.findElement(By.xpath("following-sibling::td[1]")).getText();
								actualEndDate = jobSchedulerTable.get(i)
										.findElement(By.xpath("following-sibling::td[2]")).getText();
								Thread.sleep(500);
								break;
							}
						}
						Assert.assertEquals(actualStartDate, schedulerStartDate);
						Assert.assertEquals(actualEndDate, schedulerEndDate);
					}
				} else {
					Assert.assertEquals("Job Scheduler not Found", data.get("SchedulerName"));
				}
			}
			cancelButtonClick();
		} else {
			Assert.assertEquals("User Not Found", userID);
		}
	}

	////////////// Update Job Assignment
	public void updateAssignedJobs(String user, DataTable dataTable) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(userId);
		addButtonClick();
		Thread.sleep(1500);
		String valmsg = null;
		element_InputTextUsingActionClass(userId, user);
		Thread.sleep(700);
		element_Click(basicTab);
		Thread.sleep(2000);
		if (!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			element_Click(jobCostingTab);
			Thread.sleep(1000);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("JobCode: " + data.get("JobCode"));
				String assignmentStartDate = null;
				String assignmentEndDate = null;
				String newAssignmentStartDate = null;
				String newAssignmentEndDate = null;
				element_Clear(defaultJobsSearchBox);
				element_InputTextUsingActionClass(defaultJobsSearchBox, data.get("JobCode"));
				element_TextBoxToClickOnEnter(defaultJobsSearchBox);
				Thread.sleep(1000);
				if (data.get("JobSchedulerType") != null) {
					if (data.get("JobSchedulerType").equalsIgnoreCase("Monthly")
							|| data.get("JobSchedulerType").equalsIgnoreCase("Daily")
							|| data.get("JobSchedulerType").equalsIgnoreCase("Weekly")) {
						String currentMonth = integerMonthSelected("0");
						String currentYear = integerYearSelected("0");
						int startDateValue = Integer.parseInt(data.get("AssignmentStart"));
						if (startDateValue < 1) {
							assignmentStartDate = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentStart"));
						} else {
							if (data.get("AssignmentStart").length() == 1) {
								assignmentStartDate = "0" + data.get("AssignmentStart") + "/" + currentMonth + "/"
										+ currentYear;
							} else {
								assignmentStartDate = data.get("AssignmentStart") + "/" + currentMonth + "/"
										+ currentYear;
							}
						}
						int endDateValue = Integer.parseInt(data.get("AssignmentEnd"));
						if (endDateValue > 31) {
							assignmentEndDate = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentEnd"));
						} else {
							if (data.get("AssignmentEnd").length() == 1) {
								assignmentEndDate = "0" + data.get("AssignmentEnd") + "/" + currentMonth + "/"
										+ currentYear;
							} else {
								assignmentEndDate = data.get("AssignmentEnd") + "/" + currentMonth + "/" + currentYear;
							}
						}
						if (data.get("NewAssignmentStartDate") != null) {
							int newStartDateValue = Integer.parseInt(data.get("NewAssignmentStartDate"));
							if (newStartDateValue < 1) {
								newAssignmentStartDate = staticDateOrPlusMinusFromCurrentDate(
										data.get("NewAssignmentStartDate"));
							} else {
								if (data.get("NewAssignmentStartDate").length() == 1) {
									newAssignmentStartDate = "0" + data.get("NewAssignmentStartDate") + "/"
											+ currentMonth + "/" + currentYear;
								} else {
									newAssignmentStartDate = data.get("NewAssignmentStartDate") + "/" + currentMonth
											+ "/" + currentYear;
								}
							}
						}
						if (data.get("NewAssignmentEndDate") != null) {
							int newEndDateValue = Integer.parseInt(data.get("NewAssignmentEndDate"));
							if (newEndDateValue > 31) {
								newAssignmentEndDate = staticDateOrPlusMinusFromCurrentDate(
										data.get("NewAssignmentEndDate"));
							} else {
								if (data.get("NewAssignmentEndDate").length() == 1) {
									newAssignmentEndDate = "0" + data.get("NewAssignmentEndDate") + "/" + currentMonth
											+ "/" + currentYear;
								} else {
									newAssignmentEndDate = data.get("NewAssignmentEndDate") + "/" + currentMonth + "/"
											+ currentYear;
								}
							}
						}
					}
				} else {
					assignmentStartDate = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentStart"));
					assignmentEndDate = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentEnd"));
					if (data.get("NewAssignmentStartDate") != null) {
						newAssignmentStartDate = staticDateOrPlusMinusFromCurrentDate(
								data.get("NewAssignmentStartDate"));
					}
					if (data.get("NewAssignmentEndDate") != null) {
						newAssignmentEndDate = staticDateOrPlusMinusFromCurrentDate(data.get("NewAssignmentEndDate"));
					}
				}
				for (int i = 0; i < defaultJobTable.size(); i++) {
					String actualJobCode = defaultJobTable.get(i).getText();
					String actualAssignmentStart = defaultJobTable.get(i)
							.findElement(By.xpath("following-sibling::td[2]")).getText();
					String actualAssignmentEnd = defaultJobTable.get(i)
							.findElement(By.xpath("following-sibling::td[3]")).getText();
					if (actualJobCode.equalsIgnoreCase(data.get("JobCode"))
							&& actualAssignmentStart.equalsIgnoreCase(assignmentStartDate)
							&& actualAssignmentEnd.equalsIgnoreCase(assignmentEndDate)) {
						WebElement editButton = defaultJobTable.get(i)
								.findElement(By.xpath("following-sibling::td[6]//i[@title=\"Edit\"]"));
						element_Click(editButton); // Edit Button Click
						Thread.sleep(500);
						// Main Edit Code
						if (data.get("NewAssignmentStartDate") != null) {
							element_Clear(assignmentStartDateTxt);
							element_InputTextUsingActionClass(assignmentStartDateTxt, newAssignmentStartDate);
						}
						Thread.sleep(500);
						if (data.get("NewAssignmentEndDate") != null) {
							System.out.println("NewAssignmentEndDate= " + newAssignmentEndDate);
							element_Clear(assignmentEndDateTxt);
							element_InputTextUsingActionClass(assignmentEndDateTxt, newAssignmentEndDate);
						}
						if (data.get("ESSAssignment") != null) {
							boolean essAssignment = Boolean.parseBoolean(data.get("ESSAssignment"));
							if (essAssignment == true) {
								if (!jobAssignmentChk.isSelected()) {
									element_Click(jobAssignmentChk);
								}
							} else {
								if (jobAssignmentChk.isSelected()) {
									element_Click(jobAssignmentChk);
								}
							}
							Thread.sleep(500);
						}
						Thread.sleep(500);
						element_Click(editGridOKBtn);
						Thread.sleep(700);
						break;
					}
				}
				if (data.get("Validation") != null) {
					if (jobCostingValMsgSize.size() > 0) {
						String val = jobCostingValMsg.getText();
						Thread.sleep(1000);
						Assert.assertEquals(val, data.get("Validation"));
						element_Click(editGridCancelBtn);
						Thread.sleep(500);
					}
				}
			}
			Thread.sleep(1000);
			saveButtonClick();
			Thread.sleep(1000);
			valmsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valmsg, "Saved Successfully");
		} else {
			cancelButtonClick();
			Assert.assertEquals("User Not Found", "Saved Successfully");
			Thread.sleep(1000);
		}
	}
}
