package PageObject.EnterpriseModule;

import static org.testng.AssertJUnit.assertEquals;

import java.util.ArrayList;
import java.util.Iterator;
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

import com.google.inject.Key;

import CommonAbstract.AbstractMethod;
import PageObject.ShiftAndSchedule.ShiftSchedulePO;
import io.cucumber.datatable.DataTable;
import net.bytebuddy.asm.Advice.Enter;

public class GroupAssociationsPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(GroupAssociationsPO.class);
	
	public GroupAssociationsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// *************************************************************************
		// **************ELEMENTS******************************************************
		// *****************************************************************************
		// Mayank
		@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[2]")
		private List<WebElement> groupName;

		// ess
		@FindBy(name = "chkActive")
		private WebElement enableAccountflag;

		@FindBy(xpath = "//input[@name='lblEditBasicDetails']")
		private WebElement editBasicDetailsflag;

		@FindBy(xpath = "//input[@name='lblAttendanceViaESS']")
		private WebElement punchMarkingViaESSflag;

		@FindBy(xpath = "//input[@name='lblPunchAPI']")
		private WebElement punchMarkingViaAPIflag;

		@FindBy(xpath = "//input[@name='lblAutoAtdEnbl']")
		private WebElement autoPunchMarkingflag;

		@FindBy(xpath = "//input[@name='lblManualPunch']")
		private WebElement manualPunchMarkingflag;

		@FindBy(xpath = "//input[@name='lblFaceMan']")
		private WebElement faceMandatoryforPunchflag;

		@FindBy(xpath = "//input[@name='lblAPTAFaceAntiSpoofing']")
		private WebElement aPTAFaceAntiSpoofingflag;

		@FindBy(xpath = "//input[@name='lblCapturePhoto']")
		private WebElement capturePhotoflag;

		@FindBy(xpath = "//input[@name='lblAlwOffLnPunch']")
		private WebElement allowOfflinePunchflag;

		@FindBy(xpath = "//input[@name='locationMan']")
		private WebElement locationMandatoryforPunchflag;

		@FindBy(xpath = "//input[@name='lblAlwDoorAcsThroughAPI']")
		private WebElement allowDoorAccessThroughAPIflag;

		@FindBy(xpath = "//input[@name='lblLocationAssignment']")
		private WebElement locationAssignmentflag;

		// Attendance
		@FindBy(xpath = "//input[@name='lblEnableAttendanceCalculation']")
		private WebElement enableAttendanceCalculationflag;

		@FindBy(xpath = "//input[@name='lblRestrictHalfDay']")
		private WebElement restrictHalfDayConsiderationsflag;

		@FindBy(xpath = "//input[@name='lblAttendanceMarkingType']")
		private WebElement attendanceMarkingTypeflag;

		@FindBy(xpath = "//input[@name='lblMaxPunchtobeConsidered']")
		private WebElement maximumPunchestobeconsideredflag;

		@FindBy(xpath = "//input[@name='lblMaxshortLeavesAllowed']")
		private WebElement maximumShortLeavesAllowedflag;

		@FindBy(xpath = "//input[@name='lblOTCOFFAuthorization']")
		private WebElement oTCOFFEligibilityflag;

		@FindBy(xpath = "//input[@name='lblBusRoute']")
		private WebElement busRouteflag;

		@FindBy(xpath = "//input[@name='lblAutoTourApp']")
		private WebElement enableSiteBasedAutoTourApplicationflag;

		@FindBy(xpath = "//input[@name='lblLocAutoTourApp']")
		private WebElement enableLocationBasedAutoTourApplicationflag;

		@FindBy(xpath = "//input[@name='lblAtdSumOnDvc']")
		private WebElement showAttendanceDetailsOnDeviceflag;

		@FindBy(xpath = "//input[@name='lblBypassFingerPalmforAttendance']")
		private WebElement bypassFingerPalmFaceForAttendanceflag;

		@FindBy(xpath = "//input[@name='lblLeaveGroup']")
		private WebElement leaveGroupflag;

		@FindBy(xpath = "//input[@name='lblReportingGroup']")
		private WebElement reportingGroupflag;

		// Policy
		@FindBy(xpath = "//input[@name='Code']")
		private WebElement attendancePolicyflag;

		@FindBy(xpath = "//input[@name='lblLateINPolicy']")
		private WebElement lateINPolicyflag;

		@FindBy(xpath = "//input[@name='CodeErly']")
		private WebElement earlyOUTPolicyflag;

		@FindBy(xpath = "//input[@name='lblOvertimePolicy']")
		private WebElement overtimePolicyflag;

		@FindBy(xpath = "//input[@name='Code1']")
		private WebElement absenteePolicyflag;

		@FindBy(xpath = "//input[@name='Code3']")
		private WebElement cOFFPolicyflag;

		// Access Details
		@FindBy(xpath = "//input[@name='lblAccessValidity']")
		private WebElement accessValidityflag;

		@FindBy(xpath = "//input[@name='lblAccessLevel']")
		private WebElement accessLevelForSmartIdentificationflag;

		@FindBy(xpath = "//input[@name='lblBypassFinger']")
		private WebElement bypassFingerflag;

		@FindBy(xpath = "//input[@name='lblBypassPalm']")
		private WebElement bypassPalmflag;

		@FindBy(xpath = "//input[@name='lblAdvAccessControlFlg']")
		private WebElement enableAdvanceAccessControlflag;

		@FindBy(xpath = "//input[@name='lblShiftBasedAccess']")
		private WebElement shiftBasedAccessflag;

		@FindBy(xpath = "//input[@name='lblShiftSchedule']")
		private WebElement shiftScheduleflag;

		@FindBy(xpath = "//input[@name='lblShiftSchedule1']")
		private WebElement holidayScheduleflag;

		@FindBy(xpath = "//*[@id=\"tblAccessDet\"]//input[@name='lblDeviceGroup']")
		private WebElement deviceGroupflag;

		@FindBy(xpath = "//*[@id=\"tblAccessDet\"]//input[@name='lblPVRGrpNo']")
		private WebElement biometricGroupNoflag;

		@FindBy(xpath = "//*[@id=\"tblAccessDet\"]//input[@name='lblRoamingUsr']")
		private WebElement roamingUserflag;

		@FindBy(xpath = "//*[@id=\"tblAccessDet\"]//input[@name='lblSmartAccessRoute']")
		private WebElement smartAccessRouteflag;

		@FindBy(xpath = "//*[@id=\"tblAccessDet\"]//input[@name='lblMaxSmartAccessRouteLevel']")
		private WebElement maximumSmartAccessRouteLevelflag;

		@FindBy(xpath = "//*[@id=\"tblAccessDet\"]//input[@name='lblEnableElevatorAccessControl']")
		private WebElement enableElevatorAccessControlflag;
		
		@FindBy(xpath = "//*[@id=\"tblAccessDet\"]//input[@name='lblAccessProfile']")
		private WebElement accessProfileFlag;

		// Cafeteria
		@FindBy(xpath = "(//input[@name='lblDiscountLevel'])[1]")
		private WebElement discountLevelflag;

		@FindBy(xpath = "(//input[@name='lblDiscountLevel'])[2]")
		private WebElement cafeteriaUsagePolicyflag;

		@FindBy(xpath = "//input[@name='lblEnblOfflineTrn']")
		private WebElement enableOfflineTransactionflag;

		@FindBy(xpath = "//input[@name='lblPrepaidAcc']")
		private WebElement prepaidBalanceManagementflag;

		@FindBy(xpath = "(//input[@name='lblMaxUsageLimit'])[1]")
		private WebElement prepaidMaximumUsageLimitPerMonthflag;

		@FindBy(xpath = "(//input[@name='lblMaxUsageDay'])[1]")
		private WebElement prepaidMaximumUsageLimitPerDayflag;

		@FindBy(xpath = "//input[@name='lblMaxAllowedUsage']")
		private WebElement postpaidAllowedUsagePerMonthflag;

		@FindBy(xpath = "(//input[@name='lblMaxUsageLimit'])[2]")
		private WebElement postpaidMaximumUsageLimitPerMonthflag;

		@FindBy(xpath = "//input[@name='lblMaxUsageLimitDay']")
		private WebElement postpaidMaximumUsageLimitPerDayflag;

		// Job Costing
		@FindBy(xpath = "//input[@name='lblJobType']")
		private WebElement jobCostingflag;

		// Field Visit Management
		@FindBy(xpath = "//input[@name='lblFVMEnable']")
		private WebElement enableFVMflag;

		// Face Recognition
		@FindBy(xpath = "//input[@name='lblFR']")
		private WebElement enableFaceRecognitionflag;
		
		// Visitor Management
		@FindBy(xpath = "//input[@name='lblVMM']")
		private WebElement authorizedHostUserflag;
		
		@FindBy(xpath = "//*[@id=\"tblVisitorManagement\"]//input[@name='lblVMSDeviceGroup']")
		private WebElement visitorDeviceGroupflag;
		
		@FindBy(id = "chkJobScheduler")
		private WebElement jobSchedulerFlag;
	// *************************************************************************
	// **************FUNCTIONS******************************************************
	// *****************************************************************************

	public void setESSParameters(Map<String, String> data) throws InterruptedException {
		if (data.get("EnableAccount") != null) {
			Boolean enableAccount = Boolean.parseBoolean(data.get("EnableAccount"));
			if (enableAccount == true) {
				if (!enableAccountflag.isSelected()) {
					element_ClickUsingJS(enableAccountflag);
				}
			} else {
				if (enableAccountflag.isSelected()) {
					element_ClickUsingJS(enableAccountflag);
				}
			}
		}
		if (data.get("EditBasicDetails") != null) {
			Boolean editBasicDetails = Boolean.parseBoolean(data.get("EditBasicDetails"));
			if (editBasicDetails == true) {
				if (!editBasicDetailsflag.isSelected()) {
					element_ClickUsingJS(editBasicDetailsflag);
				}
			} else {
				if (editBasicDetailsflag.isSelected()) {
					element_ClickUsingJS(editBasicDetailsflag);
				}
			}
		}
		if (data.get("PunchMarkingViaESS") != null) {
			Boolean punchMarkingViaESS = Boolean.parseBoolean(data.get("PunchMarkingViaESS"));
			if (punchMarkingViaESS == true) {
				if (!punchMarkingViaESSflag.isSelected()) {
					element_ClickUsingJS(punchMarkingViaESSflag);
				}
			} else {
				if (punchMarkingViaESSflag.isSelected()) {
					element_ClickUsingJS(punchMarkingViaESSflag);
				}
			}
		}
		if (data.get("PunchMarkingViaAPI") != null) {
			Boolean punchMarkingViaAPI = Boolean.parseBoolean(data.get("PunchMarkingViaAPI"));
			if (punchMarkingViaAPI == true) {
				if (!punchMarkingViaAPIflag.isSelected()) {
					element_ClickUsingJS(punchMarkingViaAPIflag);
				}
			} else {
				if (punchMarkingViaAPIflag.isSelected()) {
					element_ClickUsingJS(punchMarkingViaAPIflag);
				}
			}
		}
		if (data.get("AutoPunchMarking") != null) {
			Boolean autoPunchMarking = Boolean.parseBoolean(data.get("AutoPunchMarking"));
			if (autoPunchMarking == true) {
				if (!autoPunchMarkingflag.isSelected()) {
					element_ClickUsingJS(autoPunchMarkingflag);
				}
			} else {
				if (autoPunchMarkingflag.isSelected()) {
					element_ClickUsingJS(autoPunchMarkingflag);
				}
			}
		}
		if (data.get("ManualPunchMarking") != null) {
			Boolean manualPunchMarking = Boolean.parseBoolean(data.get("ManualPunchMarking"));
			if (manualPunchMarking == true) {
				if (!manualPunchMarkingflag.isSelected()) {
					element_ClickUsingJS(manualPunchMarkingflag);
				}
			} else {
				if (manualPunchMarkingflag.isSelected()) {
					element_ClickUsingJS(manualPunchMarkingflag);
				}
			}
		}
		if (data.get("FaceMandatoryforPunch") != null) {
			Boolean faceMandatoryforPunch = Boolean.parseBoolean(data.get("FaceMandatoryforPunch"));
			if (faceMandatoryforPunch == true) {
				if (!faceMandatoryforPunchflag.isSelected()) {
					element_ClickUsingJS(faceMandatoryforPunchflag);
				}
			} else {
				if (faceMandatoryforPunchflag.isSelected()) {
					element_ClickUsingJS(faceMandatoryforPunchflag);
				}
			}
		}
		if (data.get("APTAFaceAntiSpoofing") != null) {
			Boolean aPTAFaceAntiSpoofing = Boolean.parseBoolean(data.get("APTAFaceAntiSpoofing"));
			if (aPTAFaceAntiSpoofing == true) {
				if (!aPTAFaceAntiSpoofingflag.isSelected()) {
					element_ClickUsingJS(aPTAFaceAntiSpoofingflag);
				}
			} else {
				if (aPTAFaceAntiSpoofingflag.isSelected()) {
					element_ClickUsingJS(aPTAFaceAntiSpoofingflag);
				}
			}
		}
		if (data.get("CapturePhoto") != null) {
			Boolean capturePhoto = Boolean.parseBoolean(data.get("CapturePhoto"));
			if (capturePhoto == true) {
				if (!capturePhotoflag.isSelected()) {
					element_ClickUsingJS(capturePhotoflag);
				}
			} else {
				if (capturePhotoflag.isSelected()) {
					element_ClickUsingJS(capturePhotoflag);
				}
			}
		}
		if (data.get("AllowOfflinePunch") != null) {
			Boolean allowOfflinePunch = Boolean.parseBoolean(data.get("AllowOfflinePunch"));
			if (allowOfflinePunch == true) {
				if (!allowOfflinePunchflag.isSelected()) {
					element_ClickUsingJS(allowOfflinePunchflag);
				}
			} else {
				if (allowOfflinePunchflag.isSelected()) {
					element_ClickUsingJS(allowOfflinePunchflag);
				}
			}
		}
		if (data.get("LocationMandatoryforPunch") != null) {
			Boolean locationMandatoryforPunch = Boolean.parseBoolean(data.get("LocationMandatoryforPunch"));
			if (locationMandatoryforPunch == true) {
				if (!locationMandatoryforPunchflag.isSelected()) {
					element_ClickUsingJS(locationMandatoryforPunchflag);
				}
			} else {
				if (locationMandatoryforPunchflag.isSelected()) {
					element_ClickUsingJS(locationMandatoryforPunchflag);
				}
			}
		}
		if (data.get("AllowDoorAccessThroughAPI") != null) {
			Boolean allowDoorAccessThroughAPI = Boolean.parseBoolean(data.get("AllowDoorAccessThroughAPI"));
			if (allowDoorAccessThroughAPI == true) {
				if (!allowDoorAccessThroughAPIflag.isSelected()) {
					element_ClickUsingJS(allowDoorAccessThroughAPIflag);
				}
			} else {
				if (allowDoorAccessThroughAPIflag.isSelected()) {
					element_ClickUsingJS(allowDoorAccessThroughAPIflag);
				}
			}
		}
		if (data.get("LocationAssignment") != null) {
			Boolean locationAssignment = Boolean.parseBoolean(data.get("LocationAssignment"));
			if (locationAssignment == true) {
				if (!locationAssignmentflag.isSelected()) {
					element_ClickUsingJS(locationAssignmentflag);
				}
			} else {
				if (locationAssignmentflag.isSelected()) {
					element_ClickUsingJS(locationAssignmentflag);
				}
			}
		}
		saveButtonClick();
		String validationMsg = validationMessage();
		Assert.assertEquals(validationMsg, "Saved Successfully");
	}

	// Mayank
	public void verifyESSParameters(Map<String, String> data) {
		if (data.get("EnableAccount") != null) {
			Boolean actual = enableAccountflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("EnableAccount"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("EditBasicDetails") != null) {
			Boolean actual = editBasicDetailsflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("EditBasicDetails"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("PunchMarkingViaESS") != null) {
			Boolean actual = punchMarkingViaESSflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("PunchMarkingViaESS"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("PunchMarkingViaAPI") != null) {
			Boolean actual = punchMarkingViaAPIflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("PunchMarkingViaAPI"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("AutoPunchMarking") != null) {
			Boolean actual = autoPunchMarkingflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("AutoPunchMarking"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("ManualPunchMarking") != null) {
			Boolean actual = manualPunchMarkingflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("ManualPunchMarking"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("FaceMandatoryforPunch") != null) {
			Boolean actual = faceMandatoryforPunchflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("FaceMandatoryforPunch"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("APTAFaceAntiSpoofing") != null) {
			Boolean actual = aPTAFaceAntiSpoofingflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("APTAFaceAntiSpoofing"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("CapturePhoto") != null) {
			Boolean actual = capturePhotoflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("CapturePhoto"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("AllowOfflinePunch") != null) {
			Boolean actual = allowOfflinePunchflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("AllowOfflinePunch"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("LocationMandatoryforPunch") != null) {
			Boolean actual = locationMandatoryforPunchflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("LocationMandatoryforPunch"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("AllowDoorAccessThroughAPI") != null) {
			Boolean actual = allowDoorAccessThroughAPIflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("AllowDoorAccessThroughAPI"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("LocationAssignment") != null) {
			Boolean actual = locationAssignmentflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("LocationAssignment"));
			Assert.assertEquals(actual, expected);
		}
	}

	// Mayank
	public void setAttendanceParameters(Map<String, String> data) throws InterruptedException {
		if (data.get("EnableAttendanceCalculation") != null) {
			Boolean enableAttendanceCalculation = Boolean.parseBoolean(data.get("EnableAttendanceCalculation"));
			if (enableAttendanceCalculation == true) {
				if (!enableAttendanceCalculationflag.isSelected()) {
					element_ClickUsingJS(enableAttendanceCalculationflag);
				}
			} else {
				if (enableAttendanceCalculationflag.isSelected()) {
					element_ClickUsingJS(enableAttendanceCalculationflag);
				}
			}
		}
		if (data.get("RestrictHalfDayConsiderations") != null) {
			Boolean restrictHalfDayConsiderations = Boolean.parseBoolean(data.get("RestrictHalfDayConsiderations"));
			if (restrictHalfDayConsiderations == true) {
				if (!restrictHalfDayConsiderationsflag.isSelected()) {
					element_ClickUsingJS(restrictHalfDayConsiderationsflag);
				}
			} else {
				if (restrictHalfDayConsiderationsflag.isSelected()) {
					element_ClickUsingJS(restrictHalfDayConsiderationsflag);
				}
			}
		}
		if (data.get("AttendanceMarkingType") != null) {
			Boolean attendanceMarkingType = Boolean.parseBoolean(data.get("AttendanceMarkingType"));
			if (attendanceMarkingType == true) {
				if (!attendanceMarkingTypeflag.isSelected()) {
					element_ClickUsingJS(attendanceMarkingTypeflag);
				}
			} else {
				if (attendanceMarkingTypeflag.isSelected()) {
					element_ClickUsingJS(attendanceMarkingTypeflag);
				}
			}
		}
		if (data.get("MaximumPunchestobeconsidered") != null) {
			Boolean maximumPunchestobeconsidered = Boolean.parseBoolean(data.get("MaximumPunchestobeconsidered"));
			if (maximumPunchestobeconsidered == true) {
				if (!maximumPunchestobeconsideredflag.isSelected()) {
					element_ClickUsingJS(maximumPunchestobeconsideredflag);
				}
			} else {
				if (maximumPunchestobeconsideredflag.isSelected()) {
					element_ClickUsingJS(maximumPunchestobeconsideredflag);
				}
			}
		}
		if (data.get("MaximumShortLeavesAllowed") != null) {
			Boolean maximumShortLeavesAllowed = Boolean.parseBoolean(data.get("MaximumShortLeavesAllowed"));
			if (maximumShortLeavesAllowed == true) {
				if (!maximumShortLeavesAllowedflag.isSelected()) {
					element_ClickUsingJS(maximumShortLeavesAllowedflag);
				}
			} else {
				if (maximumShortLeavesAllowedflag.isSelected()) {
					element_ClickUsingJS(maximumShortLeavesAllowedflag);
				}
			}
		}
		if (data.get("OTCOFFEligibility") != null) {
			Boolean oTCOFFEligibility = Boolean.parseBoolean(data.get("OTCOFFEligibility"));
			if (oTCOFFEligibility == true) {
				if (!oTCOFFEligibilityflag.isSelected()) {
					element_ClickUsingJS(oTCOFFEligibilityflag);
				}
			} else {
				if (oTCOFFEligibilityflag.isSelected()) {
					element_ClickUsingJS(oTCOFFEligibilityflag);
				}
			}
		}
		if (data.get("BusRoute") != null) {
			Boolean busRoute = Boolean.parseBoolean(data.get("BusRoute"));
			if (busRoute == true) {
				if (!busRouteflag.isSelected()) {
					element_ClickUsingJS(busRouteflag);
				}
			} else {
				if (busRouteflag.isSelected()) {
					element_ClickUsingJS(busRouteflag);
				}
			}
		}
		if (data.get("EnableSiteBasedAutoTourApplication") != null) {
			Boolean enableSiteBasedAutoTourApplication = Boolean
					.parseBoolean(data.get("EnableSiteBasedAutoTourApplication"));
			if (enableSiteBasedAutoTourApplication == true) {
				if (!enableSiteBasedAutoTourApplicationflag.isSelected()) {
					element_ClickUsingJS(enableSiteBasedAutoTourApplicationflag);
				}
			} else {
				if (enableSiteBasedAutoTourApplicationflag.isSelected()) {
					element_ClickUsingJS(enableSiteBasedAutoTourApplicationflag);
				}
			}
		}
		if (data.get("EnableLocationBasedAutoTourApplication") != null) {
			Boolean enableLocationBasedAutoTourApplication = Boolean
					.parseBoolean(data.get("EnableLocationBasedAutoTourApplication"));
			if (enableLocationBasedAutoTourApplication == true) {
				if (!enableLocationBasedAutoTourApplicationflag.isSelected()) {
					element_ClickUsingJS(enableLocationBasedAutoTourApplicationflag);
				}
			} else {
				if (enableLocationBasedAutoTourApplicationflag.isSelected()) {
					element_ClickUsingJS(enableLocationBasedAutoTourApplicationflag);
				}
			}
		}
		if (data.get("ShowAttendanceDetailsOnDevice") != null) {
			Boolean showAttendanceDetailsOnDevice = Boolean.parseBoolean(data.get("ShowAttendanceDetailsOnDevice"));
			if (showAttendanceDetailsOnDevice == true) {
				if (!showAttendanceDetailsOnDeviceflag.isSelected()) {
					element_ClickUsingJS(showAttendanceDetailsOnDeviceflag);
				}
			} else {
				if (showAttendanceDetailsOnDeviceflag.isSelected()) {
					element_ClickUsingJS(showAttendanceDetailsOnDeviceflag);
				}
			}
		}
		if (data.get("BypassFingerPalmFaceForAttendance") != null) {
			Boolean bypassFingerPalmFaceForAttendance = Boolean
					.parseBoolean(data.get("BypassFingerPalmFaceForAttendance"));
			if (bypassFingerPalmFaceForAttendance == true) {
				if (!bypassFingerPalmFaceForAttendanceflag.isSelected()) {
					element_ClickUsingJS(bypassFingerPalmFaceForAttendanceflag);
				}
			} else {
				if (bypassFingerPalmFaceForAttendanceflag.isSelected()) {
					element_ClickUsingJS(bypassFingerPalmFaceForAttendanceflag);
				}
			}
		}
		if (data.get("LeaveGroup") != null) {
			Boolean leaveGroup = Boolean.parseBoolean(data.get("LeaveGroup"));
			if (leaveGroup == true) {
				if (!leaveGroupflag.isSelected()) {
					element_ClickUsingJS(leaveGroupflag);
				}
			} else {
				if (leaveGroupflag.isSelected()) {
					element_ClickUsingJS(leaveGroupflag);
				}
			}
		}
		if (data.get("ReportingGroup") != null) {
			Boolean reportingGroup = Boolean.parseBoolean(data.get("ReportingGroup"));
			if (reportingGroup == true) {
				if (!reportingGroupflag.isSelected()) {
					element_ClickUsingJS(reportingGroupflag);
				}
			} else {
				if (reportingGroupflag.isSelected()) {
					element_ClickUsingJS(reportingGroupflag);
				}
			}
		}
		saveButtonClick();
		String validationMsg = validationMessage();
		Assert.assertEquals(validationMsg, "Saved Successfully");
	}

	// Mayank
	public void verifyAttendanceParameters(Map<String, String> data) {
		if (data.get("EnableAttendanceCalculation") != null) {
			Boolean actual = enableAttendanceCalculationflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("EnableAttendanceCalculation"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("RestrictHalfDayConsiderations") != null) {
			Boolean actual = restrictHalfDayConsiderationsflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("RestrictHalfDayConsiderations"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("AttendanceMarkingType") != null) {
			Boolean actual = attendanceMarkingTypeflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("AttendanceMarkingType"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("MaximumPunchestobeconsidered") != null) {
			Boolean actual = maximumPunchestobeconsideredflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("MaximumPunchestobeconsidered"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("MaximumShortLeavesAllowed") != null) {
			Boolean actual = maximumShortLeavesAllowedflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("MaximumShortLeavesAllowed"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("OTCOFFEligibility") != null) {
			Boolean actual = oTCOFFEligibilityflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("OTCOFFEligibility"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("BusRoute") != null) {
			Boolean actual = busRouteflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("BusRoute"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("EnableSiteBasedAutoTourApplication") != null) {
			Boolean actual = enableSiteBasedAutoTourApplicationflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("EnableSiteBasedAutoTourApplication"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("EnableLocationBasedAutoTourApplication") != null) {
			Boolean actual = enableLocationBasedAutoTourApplicationflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("EnableLocationBasedAutoTourApplication"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("ShowAttendanceDetailsOnDevice") != null) {
			Boolean actual = showAttendanceDetailsOnDeviceflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("ShowAttendanceDetailsOnDevice"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("BypassFingerPalmFaceForAttendance") != null) {
			Boolean actual = bypassFingerPalmFaceForAttendanceflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("BypassFingerPalmFaceForAttendance"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("LeaveGroup") != null) {
			Boolean actual = leaveGroupflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("LeaveGroup"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("ReportingGroup") != null) {
			Boolean actual = reportingGroupflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("ReportingGroup"));
			Assert.assertEquals(actual, expected);
		}
	}

	// Mayank
	public void setPolicyParameters(Map<String, String> data) throws InterruptedException {
		if (data.get("AttendancePolicy") != null) {
			Boolean attendancePolicy = Boolean.parseBoolean(data.get("AttendancePolicy"));
			if (attendancePolicy == true) {
				if (!attendancePolicyflag.isSelected()) {
					element_ClickUsingJS(attendancePolicyflag);
				}
			} else {
				if (attendancePolicyflag.isSelected()) {
					element_ClickUsingJS(attendancePolicyflag);
				}
			}
		}
		if (data.get("LateINPolicy") != null) {
			Boolean lateINPolicy = Boolean.parseBoolean(data.get("LateINPolicy"));
			if (lateINPolicy == true) {
				if (!lateINPolicyflag.isSelected()) {
					element_ClickUsingJS(lateINPolicyflag);
				}
			} else {
				if (lateINPolicyflag.isSelected()) {
					element_ClickUsingJS(lateINPolicyflag);
				}
			}
		}
		if (data.get("EarlyOUTPolicy") != null) {
			Boolean earlyOUTPolicy = Boolean.parseBoolean(data.get("EarlyOUTPolicy"));
			if (earlyOUTPolicy == true) {
				if (!earlyOUTPolicyflag.isSelected()) {
					element_ClickUsingJS(earlyOUTPolicyflag);
				}
			} else {
				if (earlyOUTPolicyflag.isSelected()) {
					element_ClickUsingJS(earlyOUTPolicyflag);
				}
			}
		}
		if (data.get("OvertimePolicy") != null) {
			Boolean overtimePolicy = Boolean.parseBoolean(data.get("OvertimePolicy"));
			if (overtimePolicy == true) {
				if (!overtimePolicyflag.isSelected()) {
					element_ClickUsingJS(overtimePolicyflag);
				}
			} else {
				if (overtimePolicyflag.isSelected()) {
					element_ClickUsingJS(overtimePolicyflag);
				}
			}
		}
		if (data.get("AbsenteePolicy") != null) {
			Boolean absenteePolicy = Boolean.parseBoolean(data.get("AbsenteePolicy"));
			if (absenteePolicy == true) {
				if (!absenteePolicyflag.isSelected()) {
					element_ClickUsingJS(absenteePolicyflag);
				}
			} else {
				if (absenteePolicyflag.isSelected()) {
					element_ClickUsingJS(absenteePolicyflag);
				}
			}
		}
		if (data.get("COFFPolicy") != null) {
			Boolean cOFFPolicy = Boolean.parseBoolean(data.get("COFFPolicy"));
			if (cOFFPolicy == true) {
				if (!cOFFPolicyflag.isSelected()) {
					element_ClickUsingJS(cOFFPolicyflag);
				}
			} else {
				if (cOFFPolicyflag.isSelected()) {
					element_ClickUsingJS(cOFFPolicyflag);
				}
			}
		}
		saveButtonClick();
		String validationMsg = validationMessage();
		Assert.assertEquals(validationMsg, "Saved Successfully");
	}

	// Mayank
	public void verifyPolicyParameters(Map<String, String> data) {
		if (data.get("AttendancePolicy") != null) {
			Boolean actual = attendancePolicyflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("AttendancePolicy"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("LateINPolicy") != null) {
			Boolean actual = lateINPolicyflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("LateINPolicy"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("EarlyOUTPolicy") != null) {
			Boolean actual = earlyOUTPolicyflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("EarlyOUTPolicy"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("OvertimePolicy") != null) {
			Boolean actual = overtimePolicyflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("OvertimePolicy"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("AbsenteePolicy") != null) {
			Boolean actual = absenteePolicyflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("AbsenteePolicy"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("COFFPolicy") != null) {
			Boolean actual = cOFFPolicyflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("COFFPolicy"));
			Assert.assertEquals(actual, expected);
		}
	}

	// Mayank
	public void setAccessDetailsParameters(Map<String, String> data) throws InterruptedException {
		if (data.get("AccessValidity") != null) {
			Boolean accessValidity = Boolean.parseBoolean(data.get("AccessValidity"));
			if (accessValidity == true) {
				if (!accessValidityflag.isSelected()) {
					element_ClickUsingJS(accessValidityflag);
				}
			} else {
				if (accessValidityflag.isSelected()) {
					element_ClickUsingJS(accessValidityflag);
				}
			}
		}
		if (data.get("AccessLevelForSmartIdentification") != null) {
			Boolean accessLevelForSmartIdentification = Boolean
					.parseBoolean(data.get("AccessLevelForSmartIdentification"));
			if (accessLevelForSmartIdentification == true) {
				if (!accessLevelForSmartIdentificationflag.isSelected()) {
					element_ClickUsingJS(accessLevelForSmartIdentificationflag);
				}
			} else {
				if (accessLevelForSmartIdentificationflag.isSelected()) {
					element_ClickUsingJS(accessLevelForSmartIdentificationflag);
				}
			}
		}
		if (data.get("BypassFinger") != null) {
			Boolean bypassFinger = Boolean.parseBoolean(data.get("BypassFinger"));
			if (bypassFinger == true) {
				if (!bypassFingerflag.isSelected()) {
					element_ClickUsingJS(bypassFingerflag);
				}
			} else {
				if (bypassFingerflag.isSelected()) {
					element_ClickUsingJS(bypassFingerflag);
				}
			}
		}
		if (data.get("BypassPalm") != null) {
			Boolean bypassPalm = Boolean.parseBoolean(data.get("BypassPalm"));
			if (bypassPalm == true) {
				if (!bypassPalmflag.isSelected()) {
					element_ClickUsingJS(bypassPalmflag);
				}
			} else {
				if (bypassPalmflag.isSelected()) {
					element_ClickUsingJS(bypassPalmflag);
				}
			}
		}
		if (data.get("EnableAdvanceAccessControl") != null) {
			Boolean enableAdvanceAccessControl = Boolean.parseBoolean(data.get("EnableAdvanceAccessControl"));
			if (enableAdvanceAccessControl == true) {
				if (!enableAdvanceAccessControlflag.isSelected()) {
					element_ClickUsingJS(enableAdvanceAccessControlflag);
				}
			} else {
				if (enableAdvanceAccessControlflag.isSelected()) {
					element_ClickUsingJS(enableAdvanceAccessControlflag);
				}
			}
		}
		if (data.get("ShiftBasedAccess") != null) {
			Boolean shiftBasedAccess = Boolean.parseBoolean(data.get("ShiftBasedAccess"));
			if (shiftBasedAccess == true) {
				if (!shiftBasedAccessflag.isSelected()) {
					element_ClickUsingJS(shiftBasedAccessflag);
				}
			} else {
				if (shiftBasedAccessflag.isSelected()) {
					element_ClickUsingJS(shiftBasedAccessflag);
				}
			}
		}
		if (data.get("ShiftSchedule") != null) {
			Boolean shiftSchedule = Boolean.parseBoolean(data.get("ShiftSchedule"));
			if (shiftSchedule == true) {
				if (!shiftScheduleflag.isSelected()) {
					element_ClickUsingJS(shiftScheduleflag);
				}
			} else {
				if (shiftScheduleflag.isSelected()) {
					element_ClickUsingJS(shiftScheduleflag);
				}
			}
		}
		if (data.get("HolidaySchedule") != null) {
			Boolean holidaySchedule = Boolean.parseBoolean(data.get("HolidaySchedule"));
			if (holidaySchedule == true) {
				if (!holidayScheduleflag.isSelected()) {
					element_ClickUsingJS(holidayScheduleflag);
				}
			} else {
				if (holidayScheduleflag.isSelected()) {
					element_ClickUsingJS(holidayScheduleflag);
				}
			}
		}
		if (data.get("DeviceGroup") != null) {
			Boolean deviceGroup = Boolean.parseBoolean(data.get("DeviceGroup"));
			if (deviceGroup == true) {
				if (!deviceGroupflag.isSelected()) {
					element_Click(deviceGroupflag);
				}
			} else {
				if (deviceGroupflag.isSelected()) {
					element_Click(deviceGroupflag);
				}
			}
		}
		if (data.get("BiometricGroupNo") != null) {
			Boolean biometricGroupNo = Boolean.parseBoolean(data.get("BiometricGroupNo"));
			if (biometricGroupNo == true) {
				if (!biometricGroupNoflag.isSelected()) {
					element_ClickUsingJS(biometricGroupNoflag);
				}
			} else {
				if (biometricGroupNoflag.isSelected()) {
					element_ClickUsingJS(biometricGroupNoflag);
				}
			}
		}
		if (data.get("RoamingUser") != null) {
			Boolean roamingUser = Boolean.parseBoolean(data.get("RoamingUser"));
			if (roamingUser == true) {
				if (!roamingUserflag.isSelected()) {
					element_ClickUsingJS(roamingUserflag);
				}
			} else {
				if (roamingUserflag.isSelected()) {
					element_ClickUsingJS(roamingUserflag);
				}
			}
		}
		if (data.get("SmartAccessRoute") != null) {
			Boolean smartAccessRoute = Boolean.parseBoolean(data.get("SmartAccessRoute"));
			if (smartAccessRoute == true) {
				if (!smartAccessRouteflag.isSelected()) {
					element_ClickUsingJS(smartAccessRouteflag);
				}
			} else {
				if (smartAccessRouteflag.isSelected()) {
					element_ClickUsingJS(smartAccessRouteflag);
				}
			}
		}
		if (data.get("MaximumSmartAccessRouteLevel") != null) {
			Boolean maximumSmartAccessRouteLevel = Boolean.parseBoolean(data.get("MaximumSmartAccessRouteLevel"));
			if (maximumSmartAccessRouteLevel == true) {
				if (!maximumSmartAccessRouteLevelflag.isSelected()) {
					element_ClickUsingJS(maximumSmartAccessRouteLevelflag);
				}
			} else {
				if (maximumSmartAccessRouteLevelflag.isSelected()) {
					element_ClickUsingJS(maximumSmartAccessRouteLevelflag);
				}
			}
		}
		if (data.get("EnableElevatorAccessControl") != null) {
			Boolean enableElevatorAccessControl = Boolean.parseBoolean(data.get("EnableElevatorAccessControl"));
			if (enableElevatorAccessControl == true) {
				if (!enableElevatorAccessControlflag.isSelected()) {
					element_Click(enableElevatorAccessControlflag);
				}
			} else {
				if (enableElevatorAccessControlflag.isSelected()) {
					element_Click(enableElevatorAccessControlflag);
				}
			}
		}
		if (data.get("AccessProfile") != null) {
			Boolean accessProfile1 = Boolean.parseBoolean(data.get("AccessProfile"));
			if (accessProfile1 == true) {
				if (!accessProfileFlag.isSelected()) {
					element_ClickUsingJS(accessProfileFlag);
				}
			} else {
				if (accessProfileFlag.isSelected()) {
					element_ClickUsingJS(accessProfileFlag);
				}
			}
		}
		
		saveButtonClick();
		String validationMsg = validationMessage();
		Assert.assertEquals(validationMsg, "Saved Successfully");
	}

	// Mayank
	public void verifyAccessDetailsParameters(Map<String, String> data) {
		if (data.get("AccessValidity") != null) {
			Boolean actual = accessValidityflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("AccessValidity"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("AccessLevelForSmartIdentification") != null) {
			Boolean actual = accessLevelForSmartIdentificationflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("AccessLevelForSmartIdentification"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("BypassFinger") != null) {
			Boolean actual = bypassFingerflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("BypassFinger"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("BypassPalm") != null) {
			Boolean actual = bypassPalmflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("BypassPalm"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("EnableAdvanceAccessControl") != null) {
			Boolean actual = enableAdvanceAccessControlflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("EnableAdvanceAccessControl"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("ShiftBasedAccess") != null) {
			Boolean actual = shiftBasedAccessflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("ShiftBasedAccess"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("ShiftSchedule") != null) {
			Boolean actual = shiftScheduleflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("ShiftSchedule"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("HolidaySchedule") != null) {
			Boolean actual = holidayScheduleflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("HolidaySchedule"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("DeviceGroup") != null) {
			Boolean actual = deviceGroupflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("DeviceGroup"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("BiometricGroupNo") != null) {
			Boolean actual = biometricGroupNoflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("BiometricGroupNo"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("RoamingUser") != null) {
			Boolean actual = roamingUserflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("RoamingUser"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("SmartAccessRoute") != null) {
			Boolean actual = smartAccessRouteflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("SmartAccessRoute"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("MaximumSmartAccessRouteLevel") != null) {
			Boolean actual = maximumSmartAccessRouteLevelflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("MaximumSmartAccessRouteLevel"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("EnableElevatorAccessControl") != null) {
			Boolean actual = enableElevatorAccessControlflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("EnableElevatorAccessControl"));
			Assert.assertEquals(actual, expected);
		}
	}

	// Mayank
	public void setCafeteriaParameters(Map<String, String> data) throws InterruptedException {
		if (data.get("DiscountLevel") != null) {
			Boolean discountLevel = Boolean.parseBoolean(data.get("DiscountLevel"));
			if (discountLevel == true) {
				if (!discountLevelflag.isSelected()) {
					element_ClickUsingJS(discountLevelflag);
				}
			} else {
				if (discountLevelflag.isSelected()) {
					element_ClickUsingJS(discountLevelflag);
				}
			}
		}
		if (data.get("CafeteriaUsagePolicy") != null) {
			Boolean cafeteriaUsagePolicy = Boolean.parseBoolean(data.get("CafeteriaUsagePolicy"));
			if (cafeteriaUsagePolicy == true) {
				if (!cafeteriaUsagePolicyflag.isSelected()) {
					element_ClickUsingJS(cafeteriaUsagePolicyflag);
				}
			} else {
				if (cafeteriaUsagePolicyflag.isSelected()) {
					element_ClickUsingJS(cafeteriaUsagePolicyflag);
				}
			}
		}
		if (data.get("EnableOfflineTransaction") != null) {
			Boolean enableOfflineTransaction = Boolean.parseBoolean(data.get("EnableOfflineTransaction"));
			if (enableOfflineTransaction == true) {
				if (!enableOfflineTransactionflag.isSelected()) {
					element_ClickUsingJS(enableOfflineTransactionflag);
				}
			} else {
				if (enableOfflineTransactionflag.isSelected()) {
					element_ClickUsingJS(enableOfflineTransactionflag);
				}
			}
		}
		if (data.get("PrepaidBalanceManagement") != null) {
			Boolean prepaidBalanceManagement = Boolean.parseBoolean(data.get("PrepaidBalanceManagement"));
			if (prepaidBalanceManagement == true) {
				if (!prepaidBalanceManagementflag.isSelected()) {
					element_ClickUsingJS(prepaidBalanceManagementflag);
				}
			} else {
				if (prepaidBalanceManagementflag.isSelected()) {
					element_ClickUsingJS(prepaidBalanceManagementflag);
				}
			}
		}
		if (data.get("PrepaidMaximumUsageLimitPerMonth") != null) {
			Boolean prepaidMaximumUsageLimitPerMonth = Boolean
					.parseBoolean(data.get("PrepaidMaximumUsageLimitPerMonth"));
			if (prepaidMaximumUsageLimitPerMonth == true) {
				if (!prepaidMaximumUsageLimitPerMonthflag.isSelected()) {
					element_ClickUsingJS(prepaidMaximumUsageLimitPerMonthflag);
				}
			} else {
				if (prepaidMaximumUsageLimitPerMonthflag.isSelected()) {
					element_ClickUsingJS(prepaidMaximumUsageLimitPerMonthflag);
				}
			}
		}
		if (data.get("PrepaidMaximumUsageLimitPerDay") != null) {
			Boolean prepaidMaximumUsageLimitPerDay = Boolean.parseBoolean(data.get("PrepaidMaximumUsageLimitPerDay"));
			if (prepaidMaximumUsageLimitPerDay == true) {
				if (!prepaidMaximumUsageLimitPerDayflag.isSelected()) {
					element_ClickUsingJS(prepaidMaximumUsageLimitPerDayflag);
				}
			} else {
				if (prepaidMaximumUsageLimitPerDayflag.isSelected()) {
					element_ClickUsingJS(prepaidMaximumUsageLimitPerDayflag);
				}
			}
		}
		if (data.get("PostpaidAllowedUsagePerMonth") != null) {
			Boolean postpaidAllowedUsagePerMonth = Boolean.parseBoolean(data.get("PostpaidAllowedUsagePerMonth"));
			if (postpaidAllowedUsagePerMonth == true) {
				if (!postpaidAllowedUsagePerMonthflag.isSelected()) {
					element_ClickUsingJS(postpaidAllowedUsagePerMonthflag);
				}
			} else {
				if (postpaidAllowedUsagePerMonthflag.isSelected()) {
					element_ClickUsingJS(postpaidAllowedUsagePerMonthflag);
				}
			}
		}
		if (data.get("PostpaidMaximumUsageLimitPerMonth") != null) {
			Boolean postpaidMaximumUsageLimitPerMonth = Boolean
					.parseBoolean(data.get("PostpaidMaximumUsageLimitPerMonth"));
			if (postpaidMaximumUsageLimitPerMonth == true) {
				if (!postpaidMaximumUsageLimitPerMonthflag.isSelected()) {
					element_ClickUsingJS(postpaidMaximumUsageLimitPerMonthflag);
				}
			} else {
				if (postpaidMaximumUsageLimitPerMonthflag.isSelected()) {
					element_ClickUsingJS(postpaidMaximumUsageLimitPerMonthflag);
				}
			}
		}
		if (data.get("PostpaidMaximumUsageLimitPerDay") != null) {
			Boolean postpaidMaximumUsageLimitPerDay = Boolean.parseBoolean(data.get("PostpaidMaximumUsageLimitPerDay"));
			if (postpaidMaximumUsageLimitPerDay == true) {
				if (!postpaidMaximumUsageLimitPerDayflag.isSelected()) {
					element_ClickUsingJS(postpaidMaximumUsageLimitPerDayflag);
				}
			} else {
				if (postpaidMaximumUsageLimitPerDayflag.isSelected()) {
					element_ClickUsingJS(postpaidMaximumUsageLimitPerDayflag);
				}
			}
		}
		saveButtonClick();
		String validationMsg = validationMessage();
		Assert.assertEquals(validationMsg, "Saved Successfully");
	}

	// Mayank
	public void verifyCafeteriaParameters(Map<String, String> data) {
		if (data.get("DiscountLevel") != null) {
			Boolean actual = discountLevelflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("DiscountLevel"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("CafeteriaUsagePolicy") != null) {
			Boolean actual = cafeteriaUsagePolicyflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("CafeteriaUsagePolicy"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("EnableOfflineTransaction") != null) {
			Boolean actual = enableOfflineTransactionflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("EnableOfflineTransaction"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("PrepaidBalanceManagement") != null) {
			Boolean actual = prepaidBalanceManagementflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("PrepaidBalanceManagement"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("PrepaidMaximumUsageLimitPerMonth") != null) {
			Boolean actual = prepaidMaximumUsageLimitPerMonthflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("PrepaidMaximumUsageLimitPerMonth"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("PrepaidMaximumUsageLimitPerDay") != null) {
			Boolean actual = prepaidMaximumUsageLimitPerDayflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("PrepaidMaximumUsageLimitPerDay"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("PostpaidAllowedUsagePerMonth") != null) {
			Boolean actual = postpaidAllowedUsagePerMonthflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("PostpaidAllowedUsagePerMonth"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("PostpaidMaximumUsageLimitPerMonth") != null) {
			Boolean actual = postpaidMaximumUsageLimitPerMonthflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("PostpaidMaximumUsageLimitPerMonth"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("PostpaidMaximumUsageLimitPerDay") != null) {
			Boolean actual = postpaidMaximumUsageLimitPerDayflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("PostpaidMaximumUsageLimitPerDay"));
			Assert.assertEquals(actual, expected);
		}
	}

	// Mayank
	public void setJobCostingParameters(Map<String, String> data) throws InterruptedException {
		if (data.get("JobCosting") != null) {
			Boolean jobCosting = Boolean.parseBoolean(data.get("JobCosting"));
			if (jobCosting == true) {
				if (!jobCostingflag.isSelected()) {
					element_ClickUsingJS(jobCostingflag);
				}
			} else {
				if (jobCostingflag.isSelected()) {
					element_ClickUsingJS(jobCostingflag);
				}
			}
		}
		if(data.get("JobScheduler") != null) {
			Boolean jobScheduler = Boolean.parseBoolean(data.get("JobScheduler"));
			if(jobScheduler == true) {
				if(!jobSchedulerFlag.isSelected()) {
					element_ClickUsingJS(jobSchedulerFlag);
				}
			}else {
				if(jobSchedulerFlag.isSelected()) {
					element_ClickUsingJS(jobSchedulerFlag);
				}
			}
		}
		saveButtonClick();
		Thread.sleep(1000);
		String validationMsg = validationMessage();
		Assert.assertEquals(validationMsg, "Saved Successfully");
	}

	// Mayank
	public void verifyJobCostingParameters(Map<String, String> data) {
		if (data.get("JobCosting") != null) {
			Boolean actual = jobCostingflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("JobCosting"));
			Assert.assertEquals(actual, expected);
		}
	}

	// Mayank
	public void setFieldVisitManagementParameters(Map<String, String> data) throws InterruptedException {
		if (data.get("EnableFVM") != null) {
			Boolean enableFVM = Boolean.parseBoolean(data.get("EnableFVM"));
			if (enableFVM == true) {
				if (!enableFVMflag.isSelected()) {
					element_ClickUsingJS(enableFVMflag);
				}
			} else {
				if (enableFVMflag.isSelected()) {
					element_ClickUsingJS(enableFVMflag);
				}
			}
		}
		saveButtonClick();
		String validationMsg = validationMessage();
		Assert.assertEquals(validationMsg, "Saved Successfully");
	}

	// Mayank
	public void verifyFieldVisitManagementParameters(Map<String, String> data) {
		if (data.get("EnableFVM") != null) {
			Boolean actual = enableFVMflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("EnableFVM"));
			Assert.assertEquals(actual, expected);
		}
	}

	// Mayank
	public void setFaceRecognitionParameters(Map<String, String> data) throws InterruptedException {
		if (data.get("EnableFaceRecognition") != null) {
			Boolean enableFaceRecognition = Boolean.parseBoolean(data.get("EnableFaceRecognition"));
			if (enableFaceRecognition == true) {
				if (!enableFaceRecognitionflag.isSelected()) {
					element_ClickUsingJS(enableFaceRecognitionflag);
				}
			} else {
				if (enableFaceRecognitionflag.isSelected()) {
					element_ClickUsingJS(enableFaceRecognitionflag);
				}
			}
		}
		saveButtonClick();
		String validationMsg = validationMessage();
		Assert.assertEquals(validationMsg, "Saved Successfully");
	}

	// Mayank
	public void verifyFaceRecognitionParameters(Map<String, String> data) {
		if (data.get("EnableFaceRecognition") != null) {
			Boolean actual = enableFaceRecognitionflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("EnableFaceRecognition"));
			Assert.assertEquals(actual, expected);
		}
	}

	// Mayank
	public void setVisitorManagementParameters(Map<String, String> data) throws InterruptedException {
		if (data.get("AuthorizedHostUser") != null) {
			Boolean authorizedHostUser = Boolean.parseBoolean(data.get("AuthorizedHostUser"));
			if (authorizedHostUser == true) {
				if (!authorizedHostUserflag.isSelected()) {
					element_ClickUsingJS(authorizedHostUserflag);
				}
			} else {
				if (authorizedHostUserflag.isSelected()) {
					element_ClickUsingJS(authorizedHostUserflag);
				}
			}
		}
		if (data.get("DeviceGroup") != null) {
			Boolean deviceGroup = Boolean.parseBoolean(data.get("DeviceGroup"));
			if (deviceGroup == true) {
				if (!visitorDeviceGroupflag.isSelected()) {
					element_ClickUsingJS(visitorDeviceGroupflag);
				}
			} else {
				if (visitorDeviceGroupflag.isSelected()) {
					element_ClickUsingJS(visitorDeviceGroupflag);
				}
			}
		}
		saveButtonClick();
		String validationMsg = validationMessage();
		Assert.assertEquals(validationMsg, "Saved Successfully");
	}

	// Mayank
	public void verifyVisitorManagementParameters(Map<String, String> data) {
		if (data.get("AuthorizedHostUser") != null) {
			Boolean actual = authorizedHostUserflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("AuthorizedHostUser"));
			Assert.assertEquals(actual, expected);
		}
		if (data.get("DeviceGroup") != null) {
			Boolean actual = visitorDeviceGroupflag.isEnabled();
			Boolean expected = Boolean.parseBoolean(data.get("DeviceGroup"));
			Assert.assertEquals(actual, expected);
		}
	}

	// Mayank
	public void setValueInGroupAssociations(String module, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		for (int i = 0; i < groupName.size(); i++) {
			if (groupName.get(i).getText().equalsIgnoreCase(data.get("Group"))) {
				groupName.get(i).click();
				Thread.sleep(2000);
			}
		}
		switch (module) {
		case "ESS":
			setESSParameters(data);
			break;

		case "Attendance":
			setAttendanceParameters(data);
			break;

		case "Policy":
			setPolicyParameters(data);
			break;

		case "Access Details":
			setAccessDetailsParameters(data);
			break;

		case "Cafeteria":
			setCafeteriaParameters(data);
			break;

		case "Job Costing":
			setJobCostingParameters(data);
			break;

		case "Field Visit Management":
			setFieldVisitManagementParameters(data);
			break;

		case "Face Recognition":
			setFaceRecognitionParameters(data);
			break;
			
		case "Visitor Management":
			setVisitorManagementParameters(data);
			break;

		default:
			logger.debug("Module name is incorrect");
		}
	}

	// Mayank
	public void verifyValueInGroupAssociations(String module, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		for (int i = 0; i < groupName.size(); i++) {
			if (groupName.get(i).getText().equalsIgnoreCase(data.get("Group"))) {
				groupName.get(i).click();
				Thread.sleep(2000);
			}
		}
		switch (module) {
		case "ESS":
			verifyESSParameters(data);
			break;

		case "Attendance":
			verifyAttendanceParameters(data);
			break;

		case "Policy":
			verifyPolicyParameters(data);
			break;

		case "Access Details":
			verifyAccessDetailsParameters(data);
			break;

		case "Cafeteria":
			verifyCafeteriaParameters(data);
			break;

		case "Job Costing":
			verifyJobCostingParameters(data);
			break;

		case "Field Visit Management":
			verifyFieldVisitManagementParameters(data);
			break;

		case "Face Recognition":
			verifyFaceRecognitionParameters(data);
			break;
			
		case "Visitor Management":
			verifyVisitorManagementParameters(data);
			break;

		default:
			logger.debug("Module name is incorrect");
		}
	}
}
