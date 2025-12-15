package PageObject;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.AccessControlModule.AccessControlModuleReportPO;
import PageObject.AccessControlModule.AccessControlPO;
import PageObject.AccessControlModule.AccessGroupReportPO;
import PageObject.AccessControlModule.AccessGroupWiseTimeZoneReportPO;
import PageObject.AccessControlModule.AccessProfilePO;
import PageObject.AccessControlModule.AccessRouteMasterReportPO;
import PageObject.AccessControlModule.AccessRouteWiseWhoIsInReportPO;
import PageObject.AccessControlModule.AccessZoneReportPO;
import PageObject.AccessControlModule.AlarmDetialsReportPO;
import PageObject.AccessControlModule.AssignedDevicesReportPO;
import PageObject.AccessControlModule.DirectDoorReportPO;
import PageObject.AccessControlModule.DoorHeldOpenReportPO;
import PageObject.AccessControlModule.ElevatorAccessReportPO;
import PageObject.AccessControlModule.ElevatorConfigurationPO;
import PageObject.AccessControlModule.ElevatorFacilityConfigurationPO;
import PageObject.AccessControlModule.ElevatorFloorGroupMasterReportPO;
import PageObject.AccessControlModule.ElevatorFloorGroupPO;
import PageObject.AccessControlModule.EmergencyEvacuationReportPO;
import PageObject.AccessControlModule.FirstInUserPO;
import PageObject.AccessControlModule.FirstInUserReportPO;
import PageObject.AccessControlModule.FunctionalGroupReportPO;
import PageObject.AccessControlModule.GuardTourReportPO;
import PageObject.AccessControlModule.InputPortGroupReportPO;
import PageObject.AccessControlModule.OutputPortGroupReportPO;
import PageObject.AccessControlModule.PanelsReportPO;
import PageObject.AccessControlModule.SmartAccessRoutePO;
import PageObject.AccessControlModule.SmartAccessRouteWiseWhoIsInReportPO;
import PageObject.AccessControlModule.SmartElevatorFloorGroupPO;
import PageObject.AccessControlModule.TimeZoneReportPO;
import PageObject.AccessControlModule.TourDetialsReportPO;
import PageObject.AccessControlModule.TwoPersonAccessReportPO;
import PageObject.AccessControlModule.TwoPersonGroupPO;
import PageObject.AccessControlModule.TwoPersonsGroupReportPO;
import PageObject.AccessControlModule.ZoneAccessedByUserReportPO;
import PageObject.AccessControlModule.ZoneWiseWhoIsInReportPO;
import PageObject.AdminModule.AdminPO;
import PageObject.AdminModule.AgreementBuilderPO;
import PageObject.AdminModule.AlertMessageConfigPO;
import PageObject.AdminModule.AlertViewPO;
import PageObject.AdminModule.EmailConfigurationPO;
import PageObject.AdminModule.EnterpriseProfilePO;
import PageObject.AdminModule.ExportDataPO;
import PageObject.AdminModule.FormBuilderPO;
import PageObject.AdminModule.GlobalPolicyPO;
import PageObject.AdminModule.IdentificationServerConfigurationPO;
import PageObject.AdminModule.ImportDataPO;
import PageObject.AdminModule.LocationMasterPO;
import PageObject.AdminModule.MessageBoardPO;
import PageObject.AdminModule.RenameGroupPO;
import PageObject.AdminModule.ReportSchedulerPO;
import PageObject.AdminModule.RolesAndRigthsPO;
import PageObject.AdminModule.SMSConfigurationPO;
import PageObject.AdminModule.SchedulerLogPO;
import PageObject.AdminModule.SystemAccountPO;
import PageObject.ShiftAndSchedule.ChangeSchedulePO;
import PageObject.ShiftAndSchedule.ChangeWeekOffPO;
import PageObject.ShiftAndSchedule.HolidaySchedulePO;
import PageObject.ShiftAndSchedule.HolidayScheduleReportPO;
import PageObject.ShiftAndSchedule.ManageShiftsPO;
import PageObject.ShiftAndSchedule.ManualScheduleImportPO;
import PageObject.ShiftAndSchedule.MonthlySchedulePO;
import PageObject.ShiftAndSchedule.MonthlyShiftSchedulePO;
import PageObject.ShiftAndSchedule.RestrictedHolidaysPO;
import PageObject.ShiftAndSchedule.ScheduleGroupsReportPO;
import PageObject.ShiftAndSchedule.ShiftAndSchedulePO;
import PageObject.ShiftAndSchedule.ShiftChangeApplicationPO;
import PageObject.ShiftAndSchedule.ShiftChangeApprovalPO;
import PageObject.ShiftAndSchedule.ShiftConfigurationPO;
import PageObject.ShiftAndSchedule.ShiftReportPO;
import PageObject.ShiftAndSchedule.ShiftScheduleModuleReportPO;
import PageObject.ShiftAndSchedule.ShiftSchedulePO;
import PageObject.ShiftAndSchedule.ShiftScheduleReportPO;
import PageObject.ShiftAndSchedule.WeekOffChangeReportPO;
import PageObject.ShiftAndSchedule.WeekOffGroupPO;
import PageObject.UserModule.AccessDeniedReportPO;
import PageObject.UserModule.AccessProfileReportPO;
import PageObject.UserModule.ApprovalPolicyPO;
import PageObject.UserModule.BiometricEnrollmentReportPO;
import PageObject.UserModule.BlacklistUserPO;
import PageObject.UserModule.BlockedUsersReportPO;
import PageObject.UserModule.ChangeGroupPO;
import PageObject.UserModule.ChangeGroupReportPO;
import PageObject.UserModule.ChangeUserIdPO;
import PageObject.UserModule.ContactInfoReportPO;
import PageObject.UserModule.DeleteUsersPO;
import PageObject.UserModule.DeviceAssignmentInformationReportPO;
import PageObject.UserModule.DoorAccessedbyUserReportPO;
import PageObject.UserModule.DoorUsageReportPO;
import PageObject.UserModule.DoorWiseUsersReportPO;
import PageObject.UserModule.ReportingGroupPO;
import PageObject.UserModule.ReportingGruopsReportPO;
import PageObject.UserModule.RetirementInfoReportPO;
import PageObject.UserModule.UserConfigurationPO;
import PageObject.UserModule.UserEventIntervalReportPO;
import PageObject.UserModule.UserEventsPO;
import PageObject.UserModule.UserModuleConfigurationPO;
import PageObject.UserModule.UserModuleReportsPO;
import PageObject.UserModule.UserPO;
import PageObject.UserModule.UserWiseControllerReportPO;
import PageObject.UserModule.UserWisePolicyAssignmentReportPO;
import PageObject.UserModule.UsersOnDevicePO;
import PageObject.UserModule.UsersWithoutReportingInReportPO;
import PageObject.UserModule.WhoIsInReportPO;
import PageObject.UserModule.ESSRolesAndRightsPO;
import PageObject.UserModule.EnrollmentInfoReportPO;
import PageObject.UserModule.FormerUsersReportPO;
import PageObject.UserModule.HealthDeclarationPO;
import PageObject.UserModule.HealthRecordsPO;
import PageObject.UserModule.ImportHealthDeclarationPO;
import PageObject.UserModule.ImportUserPO;
import PageObject.UserModule.InOutEventReportPO;
import PageObject.UserModule.InOutSummaryReportPO;
import PageObject.UserModule.InviteUserPO;
import PageObject.UserModule.MultiUserConfigurationPO;
import PageObject.UserModule.NewJoiningReportPO;
import PageObject.UserModule.OfficalInfoReportPO;
import PageObject.UserModule.OnBoardingPortalPO;
import PageObject.UserModule.OutTimeReportPO;
import PageObject.UserModule.PanelWiseUsersReportPO;
import PageObject.UserModule.PendingConformationReportPO;
import PageObject.UserModule.PersonalInformationReportPO;
import PageObject.AdminModule.TaskSchedulerPO;
import PageObject.AdminModule.WhatsappConfigurationPO;
import PageObject.AdminPortal.AdminPortalPO;
import PageObject.TimeAndAttendance.*;
import PageObject.LeaveManagement.*;
import PageObject.JobProcessingCosting.*;
import PageObject.ESSLogin.*;
import PageObject.EnterpriseModule.BranchReportPO;
import PageObject.EnterpriseModule.CategoryReportPO;
import PageObject.EnterpriseModule.CustomGroup1ReportPO;
import PageObject.EnterpriseModule.CustomGroup2ReportPO;
import PageObject.EnterpriseModule.CustomGroup3ReportPO;
import PageObject.EnterpriseModule.DepartmentReportPO;
import PageObject.EnterpriseModule.DesignationReportPO;
import PageObject.EnterpriseModule.EnterpriseModuleReportPO;
import PageObject.EnterpriseModule.EnterprisePO;
import PageObject.EnterpriseModule.GradeReportPO;
import PageObject.EnterpriseModule.GroupAssociationsPO;
import PageObject.EnterpriseModule.OrgantizationReportPO;
import PageObject.EnterpriseModule.SectionReportPO;
import PageObject.FieldVisitManagement.*;
import PageObject.ContractorWorkerManagement.*;
import PageObject.ContractorWorkerManagement.DailySummaryReportPO;
import PageObject.Dashboard.DashboardPO;
import PageObject.DeviceModule.AccessSchedulesPO;
import PageObject.DeviceModule.DeviceConfigurationPO;
import PageObject.DeviceModule.DeviceGroupPO;
import PageObject.DeviceModule.DeviceModuleReportsPO;
import PageObject.DeviceModule.DevicePO;
import PageObject.DeviceModule.DeviceWiseEventReportPO;
import PageObject.DeviceModule.DoorOfflineReportPO;
import PageObject.DeviceModule.DoorReportPO;
import PageObject.DeviceModule.IntercomEventsReportPO;
import PageObject.DeviceModule.InvalidEventsReportPO;
import PageObject.DeviceModule.ManageVoiceGuidanceAudioPO;
import PageObject.DeviceModule.PanelReportPO;
import PageObject.DeviceModule.TimeFramesPO;
import PageObject.CSSLogin.*;
import PageObject.VisitorManagement.*;
import PageObject.CafeteriaManagement.*;
import PageObject.AdminPortal.*; 


//import PageObject.DeviceWebpagePO;

public class PageObjectModel {
	WebDriver driver;
	private LoginPO loginPO;
	private UserPO userPO;
	private HomePO homePO;
	private UserConfigurationPO userConfigurationPO;
	private AdminPO adminPO;
	private GlobalPolicyPO globalPolicyPO;
	private AbstractMethod abstractMethod;
	private SystemAccountPO systemAccountPO;
	private AlertViewPO alertViewPO;
	private SMSConfigurationPO smsConfigurationPO;
	private EmailConfigurationPO emailConfigurationPO;
	private ShiftAndSchedulePO shiftAndSchedulePO;
	private ShiftConfigurationPO shiftConfigurationPO;
	private DeleteUsersPO deleteUsersPO;
	private ShiftSchedulePO shiftSchedulePO;
	private ReportingGroupPO reportingGroupPO;
	private AlertMessageConfigPO alertMessageConfigPO;
	private MonthlySchedulePO monthlySchedulePO;
	private TimeAndAttendancePO timeAndAttendancePO;
	private MonthlyAttendanceProcess monthlyAttendanceProcess;
	private ESSRolesAndRightsPO eSSRolesAndRightsPO;
	private TaskSchedulerPO taskSchedulerPO;
	private AttendanceCorrectionPO attendanceCorrectionPO;
	private DeviceWebpagePO deviceWebpagePO;
	private LeaveManagementPO leaveManagementPO;
	private LeaveApplicationPO leaveApplicationPO;
	private LeaveApprovalPO leaveApprovalPO;
	private LeaveCreditDebitEncashPO leaveCreditDebitEncashPO;
	private ShortLvOfficialAppApprovalPO shortLvOfficialAppApprovalPO;
	private ManageShiftsPO manageShiftsPO;
	private NetWorkHoursPolicyPO netWorkHoursPolicyPO;
	private LeavePO leavePO;
	private LeaveGroupPO leaveGroupPO;
	private AttendanceCorrectionApprovalPO attendanceCorrectionApprovalPO;
	private AdvanceOTApplicationPO advanceOTApplicationPO;
	private AdvanceOTApprovalPO advanceOTApprovalPO;
	private AttendancePolicyPO attendancePolicyPO;
	private OvertimePolicyPO overtimePolicyPO;
	private JobProcessingCostingPO jobProcessingCostingPO;
	private JobPO jobPO;
	private PhasePO phasePO;
	private ProjectPO projectPO;
	private TimesheetCorrectionPO timesheetCorrectionPO;
	private EssPO essPO;
	private AssignAwardPenaltyHoursPO assignAwardPenaltyHoursPO;
	private LocationMasterPO locationMasterPO;
	private FieldVisitManagementPO fieldVisitManagementPO;
	private TaskPO taskPO;
	private FieldVisitSchedulePO fieldVisitSchedulePO;
	private ContractorWorkerManagementPO contractorWorkerManagementPO;
	private ContractorProfilePO contractorProfilePO;
	private WorkOrderPO workOrderPO;
	private WorkerProfilePO workerProfilePO;
	private ApprovalStagesPO approvalStagesPO;
	private InductionLevelsPO inductionLevelsPO;
	private CssPO cssPO;
	private CssWorkerProfilePO cssWorkerProfilePO;
	private InductionApprovalPO inductionApprovalPO;
	private ReportSchedulerPO reportSchedulerPO;
	private SchedulerLogPO schedulerLogPO;
	private InOutEventReportPO inOutEventReport;
	private InOutSummaryReportPO inOutSummaryReportPO;
	private MonthlyDetailsReport monthlyDetailsReport;
	private ExportDataPO exportDataPO;
	private AccessDeniedReportPO accessDeniedReportPO;
	private VisitorManagementPO visitorManagementPO;
	private DeleteFrequentVisitorsPO deleteFrequentVisitorsPO;
	private InviteVisitorPO inviteVisitorPO;
	private VisitorPreRegistrationPO visitorPreRegistrationPO;
	private VisitorProfilePO visitorProfilePO;
	private WatchlistBlacklistPO watchlistBlacklistPO;
	private FrequentVisitorsPO frequentVisitorsPO;
	private VisitorPortalPO visitorPortalPO;
	private VisitApprovalPO visitApprovalPO;
	private StationLocationPO stationLocationPO;
	private FormBuilderPO formBuilderPO;
	private VisitRegistrationApprovalPO visitRegistrationApprovalPO;
	private MonthlyShiftSchedulePO monthlyShiftSchedulePO;
	private AttendanceSummaryPO attendanceSummaryPO;
	private LeaveBalancePO leaveBalancePO;
	private CafeteriaManagementPO cafeteriaManagementPO;
	private TransactionSummaryPO transactionSummaryPO;
	private RolesAndRigthsPO rolesAndRigthsPO;
	private EnterprisePO enterprisePO;
	private AccessProfileReportPO accessProfileReportPO;
	private ContactInfoReportPO contactInfoReportPO;
	private RenameGroupPO renameGroupPO;
	private ImportDataPO importDataPO;
	private UserJobDetailsPO userJobDetailsPO;
	private ProjectSummaryPO projectSummaryPO;
	private PhaseSummaryPO phaseSummaryPO;
	private EssTimesheetCorrectionPO essTimesheetCorrectionPO;
	private RicTimesheetCorrectionAuthPO ricTimesheetCorrectionAuthPO;
	private MessageBoardPO messageBoardPO;
	private EssBottomMessagePO essBottomMessagePO;
	private EssFieldVisitSchedulePO essFieldVisitSchedulePO;
	private FieldVisitStatusPO fieldVisitStatusPO;
	private EssFieldVisitStatusPO essFieldVisitStatusPO;
	private FieldVisitCorrectionPO fieldVisitCorrectionPO;
	private EssFieldVisitCorrectionPO essFieldVisitCorrectionPO;
	private RicFieldVisitCorrectionAutorizationPO ricFieldVisitCorrectionAutorizationPO;
	private FieldVisitCorrectionAuthorizationPO fieldVisitCorrectionAuthorizationPO;
	private RicAwardPenaltyAuthPO ricAwardPenaltyAuthPO;
	private DailyTimesheetPO dailyTimesheetPO;
	private GroupAssociationsPO groupAssociationsPO;
	private UserEventsPO userEventsPO;
	private BlacklistUserPO blacklistUserPO;
	private UserModuleReportsPO userModuleReportsPO;
	private PanelWiseUsersReportPO panelWiseUsersReportPO;
	private DoorWiseUsersReportPO doorWiseUsersReportPO;
	private BlockedUsersReportPO blockedUsersReportPO;
	private UserModuleConfigurationPO userModuleConfigurationPO;
	private InviteUserPO inviteUserPO;
	private OnBoardingPortalPO onBoardingPortalPO;
	private ChangeGroupPO changeGroupPO;
	private ChangeUserIdPO changeUserIdPO;
	private HealthDeclarationPO healthDeclarationPO;
	private HealthRecordsPO healthRecordsPO;
	private WeekOffGroupPO weekOffGroupPO;
	private ImportUserPO importUserPO;
	private ImportHealthDeclarationPO importHealthDeclarationPO;
	private HolidaySchedulePO holidaySchedulePO;
	private ChangeSchedulePO changeSchedulePO;
	private ChangeWeekOffPO changeWeekOffPO;
	private ManualScheduleImportPO manualScheduleImportPO;
	private RestrictedHolidaysPO restrictedHolidaysPO;
	private SelfDeclarationPO selfDeclarationPO;
	private DevicePO devicePO;
	private DeviceConfigurationPO deviceConfigurationPO;
	private TourPO tourPO;
	// Start By Kamal
	private DoorAccessedbyUserReportPO doorAccessedbyUserReportPO;
	private DoorUsageReportPO doorUsageReportPO;
	private WhoIsInReportPO whoIsInReportPO;
	private OutTimeReportPO outTimeReportPO;
	private UserEventIntervalReportPO userEventIntervalReportPO;
	private FormerUsersReportPO formerUsersReportPO;
	private NewJoiningReportPO newJoiningReportPO;
	private PendingConformationReportPO pendingConformationReportPO;
	private ReportingGruopsReportPO reportingGruopsReportPO;
	private UsersWithoutReportingInReportPO usersWithoutReportingInReportPO;
	private UserWisePolicyAssignmentReportPO userWisePolicyAssignmentReportPO;
	private UserWiseControllerReportPO userWiseControllerReportPO;
	private DeviceAssignmentInformationReportPO deviceAssignmentInformationReportPO;
	private PersonalInformationReportPO personalInformationReportPO;
	private OfficalInfoReportPO officalInfoReportPO;
	private RetirementInfoReportPO retirementInfoReportPO;
	private ChangeGroupReportPO changeGroupReportPO;
	private EnrollmentInfoReportPO enrollmentInfoReportPO;
	private BiometricEnrollmentReportPO biometricEnrollmentReportPO;
	private PanelReportPO panelReportPO;
	private DoorReportPO doorReportPO;
	private InvalidEventsReportPO invalidEventsReportPO;
	private DeviceWiseEventReportPO deviceWiseEventReportPO;
	private DoorOfflineReportPO doorOfflineReportPO;
	private IntercomEventsReportPO intercomEventsReportPO;
	private DeviceModuleReportsPO deviceModuleReportsPO;
	private ShiftReportPO shiftReportPO;
	private ShiftScheduleModuleReportPO shiftScheduleModuleReportPO;
	private ScheduleGroupsReportPO scheduleGroupsReportPO;
	private HolidayScheduleReportPO holidayScheduleReportPO;
	private ShiftScheduleReportPO shiftScheduleReportPO;
	private WeekOffChangeReportPO weekOffChangeReportPO;
	private EnterpriseModuleReportPO enterpriseModuleReportPO;
	private OrgantizationReportPO organtizationReportPO;
	private BranchReportPO branchReportPO;
	private DepartmentReportPO departmentReportPO;
	private DesignationReportPO designationReportPO;
	private SectionReportPO sectionReportPO;
	private CategoryReportPO categoryReportPO;
	private GradeReportPO gradeReportPO;
	private CustomGroup1ReportPO customGroup1ReportPO;
	private CustomGroup2ReportPO customGroup2ReportPO;
	private CustomGroup3ReportPO customGroup3ReportPO;
	private AccessControlPO accessControlPO;
	private AccessControlModuleReportPO accessControlModuleReportPO;
	private AccessZoneReportPO accessZoneReportPO;
	private TimeZoneReportPO timeZoneReportPO;
	private AccessGroupReportPO accessGroupReportPO;
	private FunctionalGroupReportPO functionalGroupReportPO;
	private TwoPersonsGroupReportPO twoPersonsGroupReportPO;
	private AccessGroupWiseTimeZoneReportPO accessGroupWiseTimeZoneReportPO;
	private InputPortGroupReportPO inputPortGroupReportPO;
	private OutputPortGroupReportPO outputPortGroupReportPO;
	private PanelsReportPO panelsReportPO;
	private DirectDoorReportPO directDoorReportPO;
	private FirstInUserReportPO firstInUserReportPO;
	private ZoneAccessedByUserReportPO zoneAccessedByUserReportPO;
	private TwoPersonAccessReportPO twoPersonAccessReportPO;
	private ZoneWiseWhoIsInReportPO zoneWiseWhoIsInReportPO;
	private AccessRouteWiseWhoIsInReportPO accessRouteWiseWhoIsInReportPO;
	private SmartAccessRouteWiseWhoIsInReportPO smartAccessRouteWiseWhoIsInReportPO;
	private AssignedDevicesReportPO assignedDevicesReportPO;
	private GuardTourReportPO guardTourReportPO;
	private TourDetialsReportPO tourDetialsReportPO;
	private AccessRouteMasterReportPO accessRouteMasterReportPO;
	private ElevatorAccessReportPO elevatorAccessReportPO;
	private ElevatorFloorGroupMasterReportPO elevatorFloorGroupMasterReportPO;
	private DoorHeldOpenReportPO doorHeldOpenReportPO;
	private AlarmDetialsReportPO alarmDetialsReportPO;
	private EmergencyEvacuationReportPO emergencyEvacuationReportPO;
	private LeaveModuleReportsPO leaveModuleReportsPO;
	private MonthlyLeaveDetialsReportPO monthlyLeaveDetialsReportPO;
	private CoffRegisterReportPO coffRegisterReportPO;
	private LeaveRegisterReportPO leaveRegisterReportPO;
	private LeaveReportPO leaveReportPO;
	private LeaveGroupReportPO leaveGroupReportPO;
	private LeaveApplicationReportPO leaveApplicationReportPO;
	private LeaveEncashmentReportPO leaveEncashmentReportPO;
	private LeaveCreditDebitReportPO leaveCreditDebitReportPO;
	private FormBReportPO formBReportPO;
	private Form15ReportPO form15ReportPO;
	private FormQReportPO formQReportPO;
	private VisitorManagementModuleReportPO visitorManagementModuleReportPO;
	private VisitorPunchReportPO visitorPunchReportPO;
	private VisitorPunchDetialReportPO visitorPunchDetialReportPO;
	private VisitorPunchExceptionReportPO visitorPunchExceptionReportPO;
	private VisitorEnrollmentStatusReportPO visitorEnrollmentStatusReportPO;
	private PanelWiseVisitorReportPO panelWiseVisitorReportPO;
	private VisitorAccessDeniedReportPO visitorAccessDeniedReportPO;
	private VisitorPassValidityReportPO visitorPassValidityReportPO;
	private VisitorPassStatusReportPO visitorPassStatusReportPO;
	private ExpiredPassReportPO expiredPassReportPO;
	private VisitorWatchlistBlacklistReportPO visitorWatchlistBlacklistReportPO;
	private PreRegisteredVisitorReportPO preRegisteredVisitorReportPO;
	private VisitorHistoryReportPO visitorHistoryReportPO;
	private VisitorHeadCountReportPO visitorHeadCountReportPO;
	private VisitorEvacuationReportPO visitorEvacuationReportPO;
	private CafeteriaManagementModuleReportPO cafeteriaManagementModuleReportPO;
	private ItemsReportPO itemsReportPO;
	private MenuReportPO menuReportPO;
	private MenuScheduleReportPO menuScheduleReportPO;
	private HeadCountReportPO headCountReportPO;
	private UserTranscationReportPO userTranscationReportPO;
	private UserAccountDetialsReportPO userAccountDetialsReportPO;
	private UserConsumptionReportPO userConsumptionReportPO;
	private CreditDebitReportPO creditDebitReportPO;
	private BlockedUserReportPO blockedUserReportPO;
	private UserPreOrderDetailsReportPO userPreOrderDetailsReportPO;
	private SalesReportPO salesReportPO;
	private DeviceWiseConsumptionReportPO deviceWiseConsumptionReportPO;
	private ItemWiseConsumptionReportPO itemWiseConsumptionReportPO;
	private DailyConsumptionReportPO dailyConsumptionReportPO;
	private MonthlyConsumptionReportPO monthlyConsumptionReportPO;
	private CafeteriaDevicesReportPO cafeteriaDevicesReportPO;
	private JobProcessingCostingModuleReportPO jobProcessingCostingModuleReportPO;
	private JobSummaryReportPO jobSummaryReportPO;
	private PhaseSummaryReportPO phaseSummaryReportPO;
	private ProjectSummaryReportPO projectSummaryReportPO;
	private TransactionWiseHoursSummaryReportPO transactionWiseHoursSummaryReportPO;
	private DailyJobDetailsReportPO dailyJobDetailsReportPO;
	private MonthlyJobDetailsReportPO monthlyJobDetailsReportPO;
	private JobTransactionsReportPO jobTransactionsReportPO;
	private UserJobDetailsReportPO userJobDetailsReportPO;
	private FieldVisitManagementModuleReportPO fieldVisitManagementModuleReportPO;
	private ScheduleStatusSummaryReportPO scheduleStatusSummaryReportPO;
	private FieldVisitSummaryReportPO fieldVisitSummaryReportPO;
	private CWMModuleReportPO cvmModuleReportPO;
	private ShiftScheduleAttendenceReportPO shiftScheduleAttendenceReportPO;
	private MusterRollReportPO musterRollReportPO;
	private ContinuousAbPrReportPO continuousAbPrReportPO;
	private MonthlyAttendanceReportPO monthlyAttendanceReportPO;
	private DailySummaryReportPO dailySummaryReportPO;
	private DailyWorkHoursReportPO dailyWorkHoursReportPO;
	private DailyHeadCountReportPO dailyHeadCountReportPO;
	private WorkOrderManDaysReportPO workOrderManDaysReportPO;
	private BlackedlistWorkersReportPO blackedlistWorkersReportPO;
	private WorkOrderDetailsReportPO workOrderDetailsReportPO;
	private ContractorDetailsReportPO contractorDetailsReportPO;
	private WorkerDetialsReportPO workerDetialsReportPO;
	private TimeAndAttendenceModuleReportPO timeAndAttendenceModuleReportPO;
	private LateInReportPO lateInReportPO;
	private EarlyInReportPO earlyInReportPO;
	private EarlyOutReportPO earlyOutReportPO;
	private OverstayReportPO overstayReportPO;
    private AttendenceReportPO attendenceReportPO;
	// End by Kamal
	private AccrualPolicyPO accrualPolicyPO;
	private OvertimeCOffEntryPO overtimeCOffEntryPO;
	private COFFEncashmentPO cOFFEncashmentPO;
	private EssInviteVisitorPO essInviteVisitorPO;
	private OverflowManagementPO overflowManagementPO;
	private LeaveBalanceProcessPO leaveBalanceProcessPO;
	private EssLeaveApplicatioPO essLeaveApplicatioPO;
	private RicApplicationAuthorizationPO ricApplicationAuthorizationPO;
	private EssLeaveApplicationApprovalPO essLeaveApplicationApprovalPO;
	private EssTourApplicationApprovalPO essTourApplicationApprovalPO;
	private EssCOffApplicationApprovalPO essCOffApplicationApprovalPO;
	private EssTourApplicationPO essTourApplicationPO;
	private EssCOffApplicationPO essCOffApplicationPO;
	private EssVisitorPreRegistrationPO essVisitorPreRegistrationPO;
	private EssVisitApprovalPO essVisitApprovalPO;
	private EssVisitRegistrationApprovalPO essVisitRegistrationApprovalPO;
	private SecurityApprovalPO securityApprovalPO;
	private VisitRequestHandlingPO visitRequestHandlingPO;
	private VisitComponentsPO visitComponentsPO;
	private LeaveRegisterPO leaveRegisterPO;
	private VisitTemplatePO visitTemplatePO;
	private VisitorLoginAuthorizationPO visitorLoginAuthorizationPO;
	private VisitorTemplatePO visitorTemplatePO;
	private ImportLeaveBalancePO importLeaveBalancePO;
	private VisitorEventsPO visitorEventsPO;
	private VisitorHistoryPO visitorHistoryPO;
	private AuthorizedHostUsersPO authorizedHostUsersPO;
	private FormSummaryPO formSummaryPO;
	private ImportDataVisitorVisitPO importDataVisitorVisitPO;
	private AttendanceSummaryReportPO attendanceSummaryReportPO;
	private LateArrivalMemoReportPO lateArrivalMemoReportPO;
	private GraceTimeUsageReportPO graceTimeUsageReportPO;
	private NPunchWorkHoursReportPO nPunchWorkHoursReportPO;
	private DailyWorkHoursTAReportPO dailyWorkHoursTAReportPO;
	private AbsentAdjustmentsReportPO absentAdjustmentsReportPO;
	private HourlyAttendanceReportPO hourlyAttendanceReportPO;
	private WorkHoursSummaryReportPO workHoursSummaryReportPO;
	private DailyDetialsReportPO dailyDetialsReportPO;
	private DailySummaryReportTAPO dailySummaryReportTAPO;
	private DailyWorkDetailsReportPO dailyWorkDetailsReportPO;
	private BreakDeviationReportPO breakDeviationReportPO;
	private ShiftWiseCountSummaryReportPO  shiftWiseCountSummaryReportPO;
	private FirstINLastOUTPunchDetailsReportPO firstINLastOUTPunchDetailsReportPO;
	private AbsenteeReportPO absenteeReportPO;
	private AbsenteeismMemoReportPO absenteeismMemoReportPO;
	private ContinuousAbsencePresenceReportPO continuousAbsencePresenceReportPO;
	private WeekOffHolidayReportPO weekOffHolidayReportPO;
	private UserFieldBreakReportPO userFieldBreakReportPO;
	private OvertimeReportPO overtimeReportPO;
	private OvertimeDetailsReportPO overtimeDetailsReportPO;
	private TotalHeadCountOvertimeReportPO totalHeadCountOvertimeReportPO;
	private UserPresenceOvertimeReportPO userPresenceOvertimeReportPO;
	private WeeklyWorkingHrsOvertimeReportPO weeklyWorkingHrsOvertimeReportPO;
	private DailyOvertimeSummaryReportPO dailyOvertimeSummaryReportPO;
	private ExceptionsReportPO exceptionsReportPO;
	private AttendanceExceptionReportPO attendanceExceptionReportPO;
	private ManualCorrectionReportPO manualCorrectionReportPO;
	private PendingAuthorizationReportPO pendingAuthorizationReportPO;
	private SpecialFunctionPunchReportPO specialFunctionPunchReportPO;
	private ShiftChangeReportPO shiftChangeReportPO;
	private ShiftAllowanceReportPO shiftAllowanceReportPO;
	private AuthorizationStatusReportPO authorizationStatusReportPO;
	private AgreementBuilderPO agreementBuilderPO;
	private MusterSummaryReportPO musterSummaryReportPO;
	private PreviousAdjustmentSummaryReportPO previousAdjustmentSummaryReportPO;
	private SalaryDataReportPO salaryDataReportPO;
	private AbsenteeDetailReportPO absenteeDetailReportPO;
	private MonthlySummaryReportPO monthlySummaryReportPO;
	private MonthlyLogReportPO monthlyLogReportPO;
	private ShiftDetailsReportPO shiftDetailsReportPO;
	private HeadCountTAReportPO headCountTAReportPO;
	private FlexibleSummaryReportPO flexibleSummaryReportPO;
    private AttendanceRegisterReportPO attendanceRegisterReportPO;
    private LateInRegisterReportPO lateInRegisterReportPO;
    private EarlyOutRegisterReportPO earlyOutRegisterReportPO;
    private OvertimeRegisterReportPO overtimeRegisterReportPO;
    private YearlyPerformanceReportPO  yearlyPerformanceReportPO;
    private FormTReportPO formTReportPO;
    private Form18ReportPO form18ReportPO;
    private Form28ReportPO form28ReportPO;
    private CustomAttendanceRegisterReportPO customAttendanceRegisterReportPO;
    private Form26ReportPO form26ReportPO;
    private EssLeaveBalancePO essLeaveBalancePO;
    private TimeLossReportPO timeLossReportPO;
    private OvertimeChartReportPO overtimeChartReportPO;
    private AbsentReportPO absentReportPO;
    private UserAbsentReportPO userAbsentReportPO;
    private UserLateInReportPO userLateInReportPO;
    private UserEarlyOutReportPO userEarlyOutReportPO;
    private UserIrregularityReportPO userIrregularityReportPO;
    private MonthWiseOvertimeReportPO monthWiseOvertimeReportPO;
    private AttendanceSummaryChartReportPO attendanceSummaryChartReportPO;
    private EssAttendanceCorrectionAuthorizationPO essAttendanceCorrectionAuthorizationPO;
    private ESSInductionApprovalPO essInductionApprovalPO;
    private SkillPO skillPO;
    private WorkerAssignmentPO workerAssignmentPO;
    private CssWorkerAssignmentPO cssWorkerAssignmentPO;
    private ImportDataCWMPO importDataCWMPO;
    private CWMBlacklistPO cwmBlacklistPO;
    private ManageWorkersPO manageWorkersPO;
    private WorkOrderProgressPO workOrderProgressPO;
    private ApprovalPolicyPO approvalPolicyPO;
    private DailyAttendenceViewPO dailyAttendenceViewPO;
    private DailyAttendanceView_TemplatePO dailyAttendenceView_TemplatePO;
    private EssDailyAttendence_TemplatePO essDailyAttendence_TemplatePO;
    private EssUserDailyAttendenceViewPO essUserDailyAttendenceViewFormatPO;
    private AbsenteePolicyPO absenteePolicyPO;
    private LateINPolicyPO lateINPolicyPO;
    private EarlyOUTPolicyPO earlyOUTPolicyPO;
    private ExportsPO exportsPO;
    private AttendenceRegisterPO attendenceRegisterPO;
    private SiteWiseHeadCountManHoursPO siteWiseHeadCountManHoursPO;
    private ShortLeaveOfficialOUTTimePO shortLeaveOfficialOUTTimePO;
    private GroupWiseShiftHeadcountPO groupWiseShiftHeadcountPO;
    private EnterpriseGroupWisePresenceCountPO enterpriseGroupWisePresenceCountPO;
    private MonthlyHoursSummaryPO monthlyHoursSummaryPO;
    private SiteWiseMonthlySummaryPO siteWiseMonthlySummaryPO;
    private MusterRollPO musterRollPO;
    private DailyAttendanceAuthorizationPO dailyAttendanceAuthorizationPO;
    private EssDailyAttendanceAuthorizationPO essDailyAttendanceAuthorizationPO;
    private EssEventPO essEventPO;
    private EssEventAuthorizationPO essEventAuthorizationPO;
    private EventAuthorizationPO eventAuthorizationPO;
    private EssAdvanceOvertimeApplicationPO essAdvanceOvertimeApplicationPO;
    private EssAdvanceOvertimeApprovalPO essAdvanceOvertimeApprovalPO;
    private ManualStatusCorrectionPO manualStatusCorrectionPO;
    private EssAttendanceCorrectionApplicationPO essAttendanceCorrectionApplicationPO;
    private OvertimeCOFFPO overtimeCOFFPO;
    private EssShortLeaveOfficialINOUTEntryPO essShortLeaveOfficialINOUTEntryPO;
    private EssOvertimeCOFFAuthorizationPO essOvertimeCOFFAuthorizationPO; 
    private COFFPolicyPO cOFFPolicyPO;
    private EssShortLeaveOfficialInOutAuthorizationPO essShortLeaveOfficialInOutAuthorizationPO;
    private COFFApplicationPO coffApplicationPO;
    private EssAttendanceDetailsPO essAttendanceDetailsPO;
    private NPunchViewPO nPunchViewPO;
    private DailyAttendanceProcessPO dailyAttendanceProcessPO;
    private InOutReasonsPO inOutReasonsPO;
    private ShiftWiseManagementPO shiftWiseManagementPO;
    private ElevatorConfigurationPO elevatorConfigurationPO;
    private ElevatorFloorGroupPO elevatorFloorGroupPO;
    private ChangePolicyPO changePolicyPO;
    private MultiUserConfigurationPO multiUserConfigurationPO;
    private PreviousAdjustmentEntryPO previousAdjustmentEntryPO;
    private ManageAttendancePO manageAttendancePO;
    private AdminPortalPO adminPortalPO;
    private ApSystemAccountsPO apSystemAccountsPO;
    private ApPasswordPolicyPO apPasswordPolicyPO;
    private ApEmailConfigurationPO apEmailConfigurationPO;
    private ApChangePasswordPO apChangePasswordPO;
    private AccessProfilePO accessProfilePO;
    private UsersOnDevicePO usersOnDevicePO; 
    private DeviceGroupPO deviceGroupPO;
    private WhatsappConfigurationPO whatsappConfigurationPO;
    private ShiftChangeApprovalPO shiftChangeApprovalPO;
    private ShiftChangeApplicationPO shiftChangeApplicationPO;
    private ImportDataJPCPO importDataJPCPO;
    private JobSchedulerPO jobSchedulerPO;
    private SchedulerLogsJPCPO schedulerLogsJPCPO;
    private PreRegistrationTemplatePO preRegistrationTemplatePO;
    private JobAssignmentProcessPO jobAssignmentProcessPO;
    private IdentificationServerConfigurationPO identificationServerConfigurationPO;
    private EnterpriseProfilePO enterpriseProfilePO;
    private ElevatorFacilityConfigurationPO elevatorFacilityConfigurationPO;
    private EssShiftChangeApprovalPO essShiftChangeApprovalPO;
    private EssShiftChangeApplicationPO essShiftChangeApplicationPO;
    private SmartElevatorFloorGroupPO smartElevatorFloorGroupPO;
    private BusRoutePO busRoutePO;
    private SmartAccessRoutePO smartAccessRoutePO;
    private ReportBuilderPO reportbuilderPO;
    private ItemsPO itemsPO;
    private MenusPO menusPO;
    private TwoPersonGroupPO twoPersonGroupPO;
    private FirstInUserPO firstInUserPO;
    private TimeFramesPO timeFramesPO;
    private AccessSchedulesPO accessSchedulesPO;
    private PosDevicesConfigurationPO posDevicesConfigurationPO;
    private ApSmsConfigurationPO apSmsConfigurationPO;
    private RechargePO rechargePO;
    private PaymentPO paymentPO;
    private CafeteriaSettingsPO cafeteriaSettingsPO;
    private CafeteriaUsagePolicyPO cafeteriaUsagePolicyPO;
    private ManualCorrectionPO manualCorrectionPO;
    private EssTransactionCorrectionApplicationPO essTransactionCorrectionApplicationPO;
    private CorrectionApprovalPO correctionApprovalPO;
    private ManualAdjustmentPO manualAdjustmentPO;
    private EssPreOrderMealsPO essPreOrderMealsPO;
    private PreorderedMealsPO preorderedMealsPO;
    private BlockedUserPO blockedUserPO;
    private DashboardPO dashboard;
    private TourApprovalPO tourApprovalPO;
    private CoffApprovalPO coffApprovalPO;
    private TourApplicationPO tourApplicationPO;
    private TimesheetCorrectionAuthorizationPO timesheetCorrectionAuthorizationPO;
    private ShortLeaveOfficialInOutEntryPO shortLeaveOfficialInOutEntryPO;
    private ManageVoiceGuidanceAudioPO manageVoiceGuidanceAudioPO;
    
    
	public PageObjectModel(WebDriver driver) {
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	public LoginPO loginPO() {
		loginPO = new LoginPO(driver);
		return loginPO;
	}

	public HomePO homePO() {
		homePO = new HomePO(driver);
		return homePO;
	}

	public UserPO userPO() {
		userPO = new UserPO(driver);
		return userPO;
	}

	public UserConfigurationPO userConfigurationPO() {
		userConfigurationPO = new UserConfigurationPO(driver);
		return userConfigurationPO;
	}

	public AdminPO adminPO() {
		adminPO = new AdminPO(driver);
		return adminPO;
	}

	public GlobalPolicyPO globalPolicyPO() {
		globalPolicyPO = new GlobalPolicyPO(driver);
		return globalPolicyPO;
	}

	public AbstractMethod abstractMethod() {
		abstractMethod = new AbstractMethod(driver);
		return abstractMethod;
	}

	public SystemAccountPO systemAccountPO() {
		systemAccountPO = new SystemAccountPO(driver);
		return systemAccountPO;
	}

	public AlertViewPO alertViewPO() {
		alertViewPO = new AlertViewPO(driver);
		return alertViewPO;
	}

	public SMSConfigurationPO smsConfigurationPO() {
		smsConfigurationPO = new SMSConfigurationPO(driver);
		return smsConfigurationPO;
	}

	public EmailConfigurationPO emailConfigurationPO() {
		emailConfigurationPO = new EmailConfigurationPO(driver);
		return emailConfigurationPO;
	}

	public ShiftAndSchedulePO shiftAndSchedulePO() {
		shiftAndSchedulePO = new ShiftAndSchedulePO(driver);
		return shiftAndSchedulePO;
	}

	public ShiftConfigurationPO shiftConfigurationPO() {
		shiftConfigurationPO = new ShiftConfigurationPO(driver);
		return shiftConfigurationPO;
	}

	public DeleteUsersPO deleteUsersPO() {
		deleteUsersPO = new DeleteUsersPO(driver);
		return deleteUsersPO;
	}

	public ShiftSchedulePO shiftSchedulePO() {
		shiftSchedulePO = new ShiftSchedulePO(driver);
		return shiftSchedulePO;
	}

	public ReportingGroupPO reportingGroupPO() {
		reportingGroupPO = new ReportingGroupPO(driver);
		return reportingGroupPO;
	}

	public AlertMessageConfigPO alertMessageConfigPO() {
		alertMessageConfigPO = new AlertMessageConfigPO(driver);
		return alertMessageConfigPO;
	}

	public MonthlySchedulePO monthlySchedulePO() {
		monthlySchedulePO = new MonthlySchedulePO(driver);
		return monthlySchedulePO;
	}

	public TimeAndAttendancePO timeAndAttendancePO() {
		timeAndAttendancePO = new TimeAndAttendancePO(driver);
		return timeAndAttendancePO;
	}

	public MonthlyAttendanceProcess monthlyAttendanceProcess() {
		monthlyAttendanceProcess = new MonthlyAttendanceProcess(driver);
		return monthlyAttendanceProcess;
	}

	public ESSRolesAndRightsPO eSSRolesAndRightsPO() {
		eSSRolesAndRightsPO = new ESSRolesAndRightsPO(driver);
		return eSSRolesAndRightsPO;
	}

	public TaskSchedulerPO taskSchedulerPO() {
		taskSchedulerPO = new TaskSchedulerPO(driver);
		return taskSchedulerPO;
	}

	public AttendanceCorrectionPO attendanceCorrectionPO() {
		attendanceCorrectionPO = new AttendanceCorrectionPO(driver);
		return attendanceCorrectionPO;
	}

	public DeviceWebpagePO deviceWebpagePO() {
		deviceWebpagePO = new DeviceWebpagePO(driver);
		return deviceWebpagePO;
	}

	public LeaveManagementPO leaveManagementPO() {
		leaveManagementPO = new LeaveManagementPO(driver);
		return leaveManagementPO;
	}

	public LeaveApplicationPO leaveApplicationPO() {
		leaveApplicationPO = new LeaveApplicationPO(driver);
		return leaveApplicationPO;
	}

	public LeaveApprovalPO leaveApprovalPO() {
		leaveApprovalPO = new LeaveApprovalPO(driver);
		return leaveApprovalPO;
	}

	public LeaveCreditDebitEncashPO leaveCreditDebitEncashPO() {
		leaveCreditDebitEncashPO = new LeaveCreditDebitEncashPO(driver);
		return leaveCreditDebitEncashPO;
	}

	public ShortLvOfficialAppApprovalPO shortLvOfficialAppApprovalPO() {
		shortLvOfficialAppApprovalPO = new ShortLvOfficialAppApprovalPO(driver);
		return shortLvOfficialAppApprovalPO;
	}

	public ManageShiftsPO manageShiftsPO() {
		manageShiftsPO = new ManageShiftsPO(driver);
		return manageShiftsPO;
	}

	public NetWorkHoursPolicyPO netWorkHoursPolicyPO() {
		netWorkHoursPolicyPO = new NetWorkHoursPolicyPO(driver);
		return netWorkHoursPolicyPO;
	}

	public LeavePO leavePO() {
		leavePO = new LeavePO(driver);
		return leavePO;
	}

	public LeaveGroupPO leaveGroupPO() {
		leaveGroupPO = new LeaveGroupPO(driver);
		return leaveGroupPO;
	}

	public AttendanceCorrectionApprovalPO attendanceCorrectionApprovalPO() {
		attendanceCorrectionApprovalPO = new AttendanceCorrectionApprovalPO(driver);
		return attendanceCorrectionApprovalPO;
	}

	public AdvanceOTApplicationPO advanceOTApplicationPO() {
		advanceOTApplicationPO = new AdvanceOTApplicationPO(driver);
		return advanceOTApplicationPO;
	}

	public AdvanceOTApprovalPO advanceOTApprovalPO() {
		advanceOTApprovalPO = new AdvanceOTApprovalPO(driver);
		return advanceOTApprovalPO;
	}

	public AttendancePolicyPO attendancePolicyPO() {
		attendancePolicyPO = new AttendancePolicyPO(driver);
		return attendancePolicyPO;
	}

	public OvertimePolicyPO overtimePolicyPO() {
		overtimePolicyPO = new OvertimePolicyPO(driver);
		return overtimePolicyPO;
	}

	public JobProcessingCostingPO jobProcessingCostingPO() {
		jobProcessingCostingPO = new JobProcessingCostingPO(driver);
		return jobProcessingCostingPO;
	}

	public JobPO jobPO() {
		jobPO = new JobPO(driver);
		return jobPO;
	}

	public PhasePO phasePO() {
		phasePO = new PhasePO(driver);
		return phasePO;
	}

	public ProjectPO projectPO() {
		projectPO = new ProjectPO(driver);
		return projectPO;
	}

	public TimesheetCorrectionPO timesheetCorrectionPO() {
		timesheetCorrectionPO = new TimesheetCorrectionPO(driver);
		return timesheetCorrectionPO;
	}

	public EssPO essPO() {
		essPO = new EssPO(driver);
		return essPO;
	}

	public AssignAwardPenaltyHoursPO assignAwardPenaltyHoursPO() {
		assignAwardPenaltyHoursPO = new AssignAwardPenaltyHoursPO(driver);
		return assignAwardPenaltyHoursPO;
	}

	public LocationMasterPO locationMasterPO() {
		locationMasterPO = new LocationMasterPO(driver);
		return locationMasterPO;
	}

	public FieldVisitManagementPO fieldVisitManagementPO() {
		fieldVisitManagementPO = new FieldVisitManagementPO(driver);
		return fieldVisitManagementPO;
	}

	public TaskPO taskPO() {
		taskPO = new TaskPO(driver);
		return taskPO;
	}

	public FieldVisitSchedulePO fieldVisitSchedulePO() {
		fieldVisitSchedulePO = new FieldVisitSchedulePO(driver);
		return fieldVisitSchedulePO;
	}

	public ContractorWorkerManagementPO contractorWorkerManagementPO() {
		contractorWorkerManagementPO = new ContractorWorkerManagementPO(driver);
		return contractorWorkerManagementPO;
	}

	public ContractorProfilePO contractorProfilePO() {
		contractorProfilePO = new ContractorProfilePO(driver);
		return contractorProfilePO;
	}

	public WorkOrderPO workOrderPO() {
		workOrderPO = new WorkOrderPO(driver);
		return workOrderPO;
	}

	public WorkerProfilePO workerProfilePO() {
		workerProfilePO = new WorkerProfilePO(driver);
		return workerProfilePO;
	}

	public ApprovalStagesPO approvalStagesPO() {
		approvalStagesPO = new ApprovalStagesPO(driver);
		return approvalStagesPO;
	}

	public InductionLevelsPO inductionLevelsPO() {
		inductionLevelsPO = new InductionLevelsPO(driver);
		return inductionLevelsPO;
	}

	public CssPO cssPO() {
		cssPO = new CssPO(driver);
		return cssPO;
	}

	public CssWorkerProfilePO cssWorkerProfilePO() {
		cssWorkerProfilePO = new CssWorkerProfilePO(driver);
		return cssWorkerProfilePO;
	}

	public InductionApprovalPO inductionApprovalPO() {
		inductionApprovalPO = new InductionApprovalPO(driver);
		return inductionApprovalPO;
	}

	public ReportSchedulerPO reportSchedulerPO() {
		reportSchedulerPO = new ReportSchedulerPO(driver);
		return reportSchedulerPO;
	}

	public SchedulerLogPO schedulerLogPO() {
		schedulerLogPO = new SchedulerLogPO(driver);
		return schedulerLogPO;
	}

	public InOutEventReportPO inOutEventReport() {
		inOutEventReport = new InOutEventReportPO(driver);
		return inOutEventReport;
	}

	public InOutSummaryReportPO inOutSummaryReportPO() {
		inOutSummaryReportPO = new InOutSummaryReportPO(driver);
		return inOutSummaryReportPO;
	}

	public MonthlyDetailsReport monthlyDetailsReport() {
		monthlyDetailsReport = new MonthlyDetailsReport(driver);
		return monthlyDetailsReport;
	}

	public ExportDataPO exportDataPO() {
		exportDataPO = new ExportDataPO(driver);
		return exportDataPO;
	}

	public AccessDeniedReportPO accessDeniedReportPO() {
		accessDeniedReportPO = new AccessDeniedReportPO(driver);
		return accessDeniedReportPO;
	}

	public VisitorManagementPO visitorManagementPO() {
		visitorManagementPO = new VisitorManagementPO(driver);
		return visitorManagementPO;
	}

	public DeleteFrequentVisitorsPO deleteFrequentVisitorsPO() {
		deleteFrequentVisitorsPO = new DeleteFrequentVisitorsPO(driver);
		return deleteFrequentVisitorsPO;
	}

	public InviteVisitorPO inviteVisitorPO() {
		inviteVisitorPO = new InviteVisitorPO(driver);
		return inviteVisitorPO;
	}

	public VisitorPreRegistrationPO visitorPreRegistrationPO() {
		visitorPreRegistrationPO = new VisitorPreRegistrationPO(driver);
		return visitorPreRegistrationPO;
	}

	public VisitorProfilePO visitorProfilePO() {
		visitorProfilePO = new VisitorProfilePO(driver);
		return visitorProfilePO;
	}

	public WatchlistBlacklistPO watchlistBlacklistPO() {
		watchlistBlacklistPO = new WatchlistBlacklistPO(driver);
		return watchlistBlacklistPO;
	}

	public FrequentVisitorsPO frequentVisitorsPO() {
		frequentVisitorsPO = new FrequentVisitorsPO(driver);
		return frequentVisitorsPO;
	}

	public VisitorPortalPO visitorPortalPO() {
		visitorPortalPO = new VisitorPortalPO(driver);
		return visitorPortalPO;
	}

	public VisitApprovalPO visitApprovalPO() {
		visitApprovalPO = new VisitApprovalPO(driver);
		return visitApprovalPO;
	}

	public StationLocationPO stationLocationPO() {
		stationLocationPO = new StationLocationPO(driver);
		return stationLocationPO;
	}

	public FormBuilderPO formBuilderPO() {
		formBuilderPO = new FormBuilderPO(driver);
		return formBuilderPO;
	}

	public VisitRegistrationApprovalPO visitRegistrationApprovalPO() {
		visitRegistrationApprovalPO = new VisitRegistrationApprovalPO(driver);
		return visitRegistrationApprovalPO;
	}

	public MonthlyShiftSchedulePO monthlyShiftSchedulePO() {
		monthlyShiftSchedulePO = new MonthlyShiftSchedulePO(driver);
		return monthlyShiftSchedulePO;
	}

	public AttendanceSummaryPO attendanceSummaryPO() {
		attendanceSummaryPO = new AttendanceSummaryPO(driver);
		return attendanceSummaryPO;
	}

	public LeaveBalancePO leaveBalancePO() {
		leaveBalancePO = new LeaveBalancePO(driver);
		return leaveBalancePO;
	}

	public CafeteriaManagementPO cafeteriaManagementPO() {
		cafeteriaManagementPO = new CafeteriaManagementPO(driver);
		return cafeteriaManagementPO;
	}

	public TransactionSummaryPO transactionSummaryPO() {
		transactionSummaryPO = new TransactionSummaryPO(driver);
		return transactionSummaryPO;
	}

	// Created by Chhaya
	public RolesAndRigthsPO rolesAndRigthsPO() {
		rolesAndRigthsPO = new RolesAndRigthsPO(driver);
		return rolesAndRigthsPO;
	}

	// Created by Chhaya
	public EnterprisePO enterprisePO() {
		enterprisePO = new EnterprisePO(driver);
		return enterprisePO;
	}

	// Created by Chhaya
	public AccessProfileReportPO accessProfileReportPO() {
		accessProfileReportPO = new AccessProfileReportPO(driver);
		return accessProfileReportPO;
	}

	// Created by Chhaya
	public ContactInfoReportPO contactInfoReportPO() {
		contactInfoReportPO = new ContactInfoReportPO(driver);
		return contactInfoReportPO;
	}

	// By Chhaya
	public RenameGroupPO renameGroupPO() {
		renameGroupPO = new RenameGroupPO(driver);
		return renameGroupPO;
	}

	// By Chhaya
	public ImportDataPO importDataPO() {
		importDataPO = new ImportDataPO(driver);
		return importDataPO;
	}

	// By Chhaya
	public UserJobDetailsPO userJobDetailsPO() {
		userJobDetailsPO = new UserJobDetailsPO(driver);
		return userJobDetailsPO;
	}

	// by Chhaya
	public ProjectSummaryPO projectSummaryPO() {
		projectSummaryPO = new ProjectSummaryPO(driver);
		return projectSummaryPO;
	}

	// by Chhaya
	public PhaseSummaryPO phaseSummaryPO() {
		phaseSummaryPO = new PhaseSummaryPO(driver);
		return phaseSummaryPO;
	}

	// by Chhaya
	public EssTimesheetCorrectionPO essTimesheetCorrectionPO() {
		essTimesheetCorrectionPO = new EssTimesheetCorrectionPO(driver);
		return essTimesheetCorrectionPO;
	}

	// by Chhaya
	public RicTimesheetCorrectionAuthPO ricTimesheetCorrectionAuthPO() {
		ricTimesheetCorrectionAuthPO = new RicTimesheetCorrectionAuthPO(driver);
		return ricTimesheetCorrectionAuthPO;
	}

	// by Chhaya
	public MessageBoardPO messageBoardPO() {
		messageBoardPO = new MessageBoardPO(driver);
		return messageBoardPO;
	}

	// by Chhaya
	public EssBottomMessagePO essBottomMessagePO() {
		essBottomMessagePO = new EssBottomMessagePO(driver);
		return essBottomMessagePO;
	}

	// by Chhaya
	public EssFieldVisitSchedulePO essFieldVisitSchedulePO() {
		essFieldVisitSchedulePO = new EssFieldVisitSchedulePO(driver);
		return essFieldVisitSchedulePO;
	}

	// by Chhaya
	public FieldVisitStatusPO fieldVisitStatusPO() {
		fieldVisitStatusPO = new FieldVisitStatusPO(driver);
		return fieldVisitStatusPO;
	}

	// by Chhaya
	public EssFieldVisitStatusPO essFieldVisitStatusPO() {
		essFieldVisitStatusPO = new EssFieldVisitStatusPO(driver);
		return essFieldVisitStatusPO;
	}

	// by Chhaya
	public FieldVisitCorrectionPO fieldVisitCorrectionPO() {
		fieldVisitCorrectionPO = new FieldVisitCorrectionPO(driver);
		return fieldVisitCorrectionPO;
	}

	// by Chhaya
	public EssFieldVisitCorrectionPO essFieldVisitCorrectionPO() {
		essFieldVisitCorrectionPO = new EssFieldVisitCorrectionPO(driver);
		return essFieldVisitCorrectionPO;
	}

	// by Chhaya
	public RicFieldVisitCorrectionAutorizationPO ricFieldVisitCorrectionAutorizationPO() {
		ricFieldVisitCorrectionAutorizationPO = new RicFieldVisitCorrectionAutorizationPO(driver);
		return ricFieldVisitCorrectionAutorizationPO;
	}

	// by Chhaya
	public FieldVisitCorrectionAuthorizationPO fieldVisitCorrectionAuthorizationPO() {
		fieldVisitCorrectionAuthorizationPO = new FieldVisitCorrectionAuthorizationPO(driver);
		return fieldVisitCorrectionAuthorizationPO;
	}

	// by Chhaya
	public RicAwardPenaltyAuthPO ricAwardPenaltyAuthPO() {
		ricAwardPenaltyAuthPO = new RicAwardPenaltyAuthPO(driver);
		return ricAwardPenaltyAuthPO;
	}

	// by Chhaya
	public DailyTimesheetPO dailyTimesheetPO() {
		dailyTimesheetPO = new DailyTimesheetPO(driver);
		return dailyTimesheetPO;
	}

	// by Mayank
	public GroupAssociationsPO groupAssociationsPO() {
		groupAssociationsPO = new GroupAssociationsPO(driver);
		return groupAssociationsPO;
	}

	// by Chhaya
	public BlacklistUserPO blacklistUserPO() {
		blacklistUserPO = new BlacklistUserPO(driver);
		return blacklistUserPO;
	}

	// by Chhaya
	public UserEventsPO userEventsPO() {
		userEventsPO = new UserEventsPO(driver);
		return userEventsPO;
	}

	public UserModuleReportsPO userModuleReportsPO() {
		userModuleReportsPO = new UserModuleReportsPO(driver);
		return userModuleReportsPO;
	}

	public PanelWiseUsersReportPO panelWiseUsersReportPO() {
		panelWiseUsersReportPO = new PanelWiseUsersReportPO(driver);
		return panelWiseUsersReportPO;
	}

	public DoorWiseUsersReportPO doorWiseUsersReportPO() {
		doorWiseUsersReportPO = new DoorWiseUsersReportPO(driver);
		return doorWiseUsersReportPO;
	}

	public BlockedUsersReportPO blockedUsersReportPO() {
		blockedUsersReportPO = new BlockedUsersReportPO(driver);
		return blockedUsersReportPO;
	}

	// by Chhaya
	public UserModuleConfigurationPO userModuleConfigurationPO() {
		userModuleConfigurationPO = new UserModuleConfigurationPO(driver);
		return userModuleConfigurationPO;
	}

	// by Chhaya
	public InviteUserPO inviteUserPO() {
		inviteUserPO = new InviteUserPO(driver);
		return inviteUserPO;
	}

	// by Chhaya
	public OnBoardingPortalPO onBoardingPortalPO() {
		onBoardingPortalPO = new OnBoardingPortalPO(driver);
		return onBoardingPortalPO;
	}

	// by Chhaya
	public ChangeGroupPO changeGroupPO() {
		changeGroupPO = new ChangeGroupPO(driver);
		return changeGroupPO;
	}

	// by Chhaya
	public ChangeUserIdPO changeUserIdPO() {
		changeUserIdPO = new ChangeUserIdPO(driver);
		return changeUserIdPO;
	}

	// by Chhaya
	public HealthDeclarationPO healthDeclarationPO() {
		healthDeclarationPO = new HealthDeclarationPO(driver);
		return healthDeclarationPO;
	}

	// by Chhaya
	public HealthRecordsPO healthRecordsPO() {
		healthRecordsPO = new HealthRecordsPO(driver);
		return healthRecordsPO;
	}

	// Mayank
	public WeekOffGroupPO weekOffGroupPO() {
		weekOffGroupPO = new WeekOffGroupPO(driver);
		return weekOffGroupPO;
	}

	// by Chhaya
	public ImportUserPO importUserPO() {
		importUserPO = new ImportUserPO(driver);
		return importUserPO;
	}

	// by Chhaya
	public ImportHealthDeclarationPO importHealthDeclarationPO() {
		importHealthDeclarationPO = new ImportHealthDeclarationPO(driver);
		return importHealthDeclarationPO;
	}

	// Mayank
	public HolidaySchedulePO holidaySchedulePO() {
		holidaySchedulePO = new HolidaySchedulePO(driver);
		return holidaySchedulePO;
	}

	public ChangeSchedulePO changeSchedulePO() {
		changeSchedulePO = new ChangeSchedulePO(driver);
		return changeSchedulePO;
	}

	public ChangeWeekOffPO changeWeekOffPO() {
		changeWeekOffPO = new ChangeWeekOffPO(driver);
		return changeWeekOffPO;
	}

	public ManualScheduleImportPO manualScheduleImportPO() {
		manualScheduleImportPO = new ManualScheduleImportPO(driver);
		return manualScheduleImportPO;
	}

	public RestrictedHolidaysPO restrictedHolidaysPO() {
		restrictedHolidaysPO = new RestrictedHolidaysPO(driver);
		return restrictedHolidaysPO;
	}

	public SelfDeclarationPO selfDeclarationPO() {
		selfDeclarationPO = new SelfDeclarationPO(driver);
		return selfDeclarationPO;
	}

	public DevicePO devicePO() {
		devicePO = new DevicePO(driver);
		return devicePO;
	}

	public DeviceConfigurationPO deviceConfigurationPO() {
		deviceConfigurationPO = new DeviceConfigurationPO(driver);
		return deviceConfigurationPO;
	}

	public TourPO tourPO() {
		tourPO = new TourPO(driver);
		return tourPO;
	}

	// Kamal
	public DoorAccessedbyUserReportPO doorAccessedbyUserReportPO() {
		doorAccessedbyUserReportPO = new DoorAccessedbyUserReportPO(driver);
		return doorAccessedbyUserReportPO;
	}

	// Kamal
	public DoorUsageReportPO doorUsageReportPO() {
		doorUsageReportPO = new DoorUsageReportPO(driver);
		return doorUsageReportPO;
	}

	// Kamal
	public WhoIsInReportPO whoIsInReportPO() {
		whoIsInReportPO = new WhoIsInReportPO(driver);
		return whoIsInReportPO;
	}

	// Kamal
	public OutTimeReportPO outTimeReportPO() {
		outTimeReportPO = new OutTimeReportPO(driver);
		return outTimeReportPO;
	}

	// Kamal
	public UserEventIntervalReportPO userEventIntervalReportPO() {
		userEventIntervalReportPO = new UserEventIntervalReportPO(driver);
		return userEventIntervalReportPO;
	}

	// Kamal
	public FormerUsersReportPO formerUserReportPO() {
		formerUsersReportPO = new FormerUsersReportPO(driver);
		return formerUsersReportPO;
	}

	// Kamal
	public NewJoiningReportPO newJoiningReportPO() {
		newJoiningReportPO = new NewJoiningReportPO(driver);
		return newJoiningReportPO;
	}

	// Kamal
	public PendingConformationReportPO pendingConformationReportPO() {
		pendingConformationReportPO = new PendingConformationReportPO(driver);
		return pendingConformationReportPO;
	}

	// Kamal
	public ReportingGruopsReportPO reportingGruopsReportPO() {
		reportingGruopsReportPO = new ReportingGruopsReportPO(driver);
		return reportingGruopsReportPO;
	}

	// Kamal
	public UsersWithoutReportingInReportPO userWithoutReportingInchargeReportPO() {
		usersWithoutReportingInReportPO = new UsersWithoutReportingInReportPO(driver);
		return usersWithoutReportingInReportPO;
	}

	// Kamal
	public UserWisePolicyAssignmentReportPO userWisePolicyAssignmentReportPO() {
		userWisePolicyAssignmentReportPO = new UserWisePolicyAssignmentReportPO(driver);
		return userWisePolicyAssignmentReportPO;
	}

	// Kamal
	public UserWiseControllerReportPO userWiseControllerReportPO() {
		userWiseControllerReportPO = new UserWiseControllerReportPO(driver);
		return userWiseControllerReportPO;
	}

	// Kamal
	public DeviceAssignmentInformationReportPO deviceAssignmentInformationReportPO() {
		deviceAssignmentInformationReportPO = new DeviceAssignmentInformationReportPO(driver);
		return deviceAssignmentInformationReportPO;
	}

	// Kamal
	public PersonalInformationReportPO personalInformationReportPO() {
		personalInformationReportPO = new PersonalInformationReportPO(driver);
		return personalInformationReportPO;
	}

	// Kamal
	public OfficalInfoReportPO officalInfoReportPO() {
		officalInfoReportPO = new OfficalInfoReportPO(driver);
		return officalInfoReportPO;
	}

	// Kamal
	public RetirementInfoReportPO retirementInfoReportPO() {
		retirementInfoReportPO = new RetirementInfoReportPO(driver);
		return retirementInfoReportPO;
	}

	// Kamal
	public EnrollmentInfoReportPO enrollmentInfoReportPO() {
		enrollmentInfoReportPO = new EnrollmentInfoReportPO(driver);
		return enrollmentInfoReportPO;
	}

	// Kamal
	public ChangeGroupReportPO changeGroupReportPO() {
		changeGroupReportPO = new ChangeGroupReportPO(driver);
		return changeGroupReportPO;
	}

	// Kamal
	public BiometricEnrollmentReportPO biometricEnrollmentReportPO() {
		biometricEnrollmentReportPO = new BiometricEnrollmentReportPO(driver);
		return biometricEnrollmentReportPO;
	}

	// Kamal
	public PanelReportPO panelReportPO() {
		panelReportPO = new PanelReportPO(driver);
		return panelReportPO;
	}

	// Kamal
	public DoorReportPO doorReportPO() {
		doorReportPO = new DoorReportPO(driver);
		return doorReportPO;
	}

	// Kamal
	public InvalidEventsReportPO invalidEventsReportPO() {
		invalidEventsReportPO = new InvalidEventsReportPO(driver);
		return invalidEventsReportPO;
	}

	// Kamal
	public DeviceWiseEventReportPO deviceWiseEventReportPO() {
		deviceWiseEventReportPO = new DeviceWiseEventReportPO(driver);
		return deviceWiseEventReportPO;
	}

	// Kamal
	public DoorOfflineReportPO doorOfflineReportPO() {
		doorOfflineReportPO = new DoorOfflineReportPO(driver);
		return doorOfflineReportPO;
	}

	// Kamal
	public IntercomEventsReportPO intercomEventsReportPO() {
		intercomEventsReportPO = new IntercomEventsReportPO(driver);
		return intercomEventsReportPO;
	}

	// Kamal
	public DeviceModuleReportsPO deviceModuleReportsPO() {
		deviceModuleReportsPO = new DeviceModuleReportsPO(driver);
		return deviceModuleReportsPO;
	}

	// chhaya
	public AccrualPolicyPO accrualPolicyPO() {
		accrualPolicyPO = new AccrualPolicyPO(driver);
		return accrualPolicyPO;
	}

	// Kamal
	public ShiftScheduleModuleReportPO shiftScheduleModuleReportPO() {
		shiftScheduleModuleReportPO = new ShiftScheduleModuleReportPO(driver);
		return shiftScheduleModuleReportPO;
	}

	// Kamal
	public ShiftReportPO shiftReportPO() {
		shiftReportPO = new ShiftReportPO(driver);
		return shiftReportPO;
	}

	// Kamal
	public ScheduleGroupsReportPO scheduleGroupsReportPO() {
		scheduleGroupsReportPO = new ScheduleGroupsReportPO(driver);
		return scheduleGroupsReportPO;
	}

	// Kamal
	public HolidayScheduleReportPO holidayScheduleReportPO() {
		holidayScheduleReportPO = new HolidayScheduleReportPO(driver);
		return holidayScheduleReportPO;
	}

	// Kamal
	public ShiftScheduleReportPO shiftScheduleReportPO() {
		shiftScheduleReportPO = new ShiftScheduleReportPO(driver);
		return shiftScheduleReportPO;
	}

	// Kamal
	public WeekOffChangeReportPO weekOffChangeReportPO() {
		weekOffChangeReportPO = new WeekOffChangeReportPO(driver);
		return weekOffChangeReportPO;
	}

	// Kamal
	public EnterpriseModuleReportPO enterpriseModuleReportPO() {
		enterpriseModuleReportPO = new EnterpriseModuleReportPO(driver);
		return enterpriseModuleReportPO;
	}

	// Kamal
	public OrgantizationReportPO organizationReportPO() {
		organtizationReportPO = new OrgantizationReportPO(driver);
		return organtizationReportPO;
	}

	// Kamal
	public BranchReportPO branchReportPO() {
		branchReportPO = new BranchReportPO(driver);
		return branchReportPO;
	}

	// Kamal
	public DepartmentReportPO departmentReportPO() {
		departmentReportPO = new DepartmentReportPO(driver);
		return departmentReportPO;
	}

	// Kamal
	public DesignationReportPO designationReportPO() {
		designationReportPO = new DesignationReportPO(driver);
		return designationReportPO;
	}

	// Kamal
	public SectionReportPO sectionReportPO() {
		sectionReportPO = new SectionReportPO(driver);
		return sectionReportPO;
	}

	// Kamal
	public CategoryReportPO categoryReportPO() {
		categoryReportPO = new CategoryReportPO(driver);
		return categoryReportPO;
	}

	// Kamal
	public GradeReportPO gradeReportPO() {
		gradeReportPO = new GradeReportPO(driver);
		return gradeReportPO;
	}

	// Kamal
	public CustomGroup1ReportPO customGroup1ReportPO() {
		customGroup1ReportPO = new CustomGroup1ReportPO(driver);
		return customGroup1ReportPO;
	}

	// Kamal
	public CustomGroup2ReportPO customGroup2ReportPO() {
		customGroup2ReportPO = new CustomGroup2ReportPO(driver);
		return customGroup2ReportPO;
	}

	// Kamal
	public CustomGroup3ReportPO customGroup3ReportPO() {
		customGroup3ReportPO = new CustomGroup3ReportPO(driver);
		return customGroup3ReportPO;
	}
	
	//Kamal
	public AccessControlPO accessControlPO() {
		accessControlPO = new AccessControlPO(driver);
		return accessControlPO;
	}
	
	//Kamal
	public AccessControlModuleReportPO  accessControlModuleReportPO() {
		accessControlModuleReportPO = new AccessControlModuleReportPO(driver);
		return accessControlModuleReportPO;
	}
	
	//Kamal
	public AccessZoneReportPO accessZoneReportPO() {
		accessZoneReportPO = new AccessZoneReportPO(driver);
		return accessZoneReportPO;
	}
	
	//Kamal
	public TimeZoneReportPO timeZoneReportPO() {
		timeZoneReportPO = new TimeZoneReportPO(driver);
		return timeZoneReportPO;
	}
	
	//Kamal 
	public AccessGroupReportPO accessGroupReportPO() {
		accessGroupReportPO = new AccessGroupReportPO(driver);
		return accessGroupReportPO;
	}
	
	//Kamal
	public FunctionalGroupReportPO functionalGroupReportPO() {
		functionalGroupReportPO = new FunctionalGroupReportPO(driver);
		return functionalGroupReportPO;
	}
	
	//Kamal
	public TwoPersonsGroupReportPO twoPersonsGroupReportPO() {
		twoPersonsGroupReportPO = new TwoPersonsGroupReportPO(driver);
		return twoPersonsGroupReportPO;
	}
	
	//Kamal
	public AccessGroupWiseTimeZoneReportPO accessGroupWiseTimeZoneReportPO() {
		accessGroupWiseTimeZoneReportPO = new AccessGroupWiseTimeZoneReportPO(driver);
		return accessGroupWiseTimeZoneReportPO;
	}
	
	//Kamal
	public InputPortGroupReportPO inputPortGroupReportPO() {
		inputPortGroupReportPO = new InputPortGroupReportPO(driver);
		return inputPortGroupReportPO;
	}
	
	//Kamal
	public OutputPortGroupReportPO outputPortGroupReportPO() {
		outputPortGroupReportPO = new OutputPortGroupReportPO(driver);
		return outputPortGroupReportPO;
	}
	
	//Kamal
	public  PanelsReportPO panelsReportPO() {
		panelsReportPO = new PanelsReportPO(driver);
		return panelsReportPO;
	}
	
	//Kamal
	public DirectDoorReportPO directDoorReportPO() {
		directDoorReportPO = new DirectDoorReportPO(driver);
		return directDoorReportPO;
	}
	
	//Kamal
	public FirstInUserReportPO firstInUserReportPO() {
		firstInUserReportPO = new FirstInUserReportPO(driver);
		return firstInUserReportPO;
	}
	
	//Kamal
	public ZoneAccessedByUserReportPO zoneAccessedByUserReportPO() {
		zoneAccessedByUserReportPO = new ZoneAccessedByUserReportPO(driver);
		return zoneAccessedByUserReportPO;
	}
	
	//Kamal
	public TwoPersonAccessReportPO twoPersonAccessReportPO() {
		twoPersonAccessReportPO = new TwoPersonAccessReportPO(driver);
		return twoPersonAccessReportPO;
	}
	
	
	// Chhaya
		public OvertimeCOffEntryPO overtimeCOffEntryPO() {
			overtimeCOffEntryPO = new OvertimeCOffEntryPO(driver);
			return overtimeCOffEntryPO;
		}

		// Chhaya
		public COFFEncashmentPO cOFFEncashmentPO() {
			cOFFEncashmentPO = new COFFEncashmentPO(driver);
			return cOFFEncashmentPO;
		}
	
	//Kamal
	public ZoneWiseWhoIsInReportPO zoneWiseWhoIsInReportPO() {
		zoneWiseWhoIsInReportPO = new ZoneWiseWhoIsInReportPO(driver);
		return zoneWiseWhoIsInReportPO;
	}
	
	//Kamal
	public AccessRouteWiseWhoIsInReportPO accessRouteWiseWhoIsInReportPO() {
		accessRouteWiseWhoIsInReportPO = new AccessRouteWiseWhoIsInReportPO(driver);
		return accessRouteWiseWhoIsInReportPO;
	}
	
	//Kamal 
	public SmartAccessRouteWiseWhoIsInReportPO smartAccessRouteWiseWhoIsInReportPO() {
		smartAccessRouteWiseWhoIsInReportPO = new SmartAccessRouteWiseWhoIsInReportPO(driver);
		return smartAccessRouteWiseWhoIsInReportPO;
	}
	
	//Kamal
	public AssignedDevicesReportPO assignedDevicesReportPO() {
		assignedDevicesReportPO = new AssignedDevicesReportPO(driver);
		return assignedDevicesReportPO;
	}
	
	//Kamal
	public GuardTourReportPO guardTourReportPO() {
		guardTourReportPO = new GuardTourReportPO(driver);
		return guardTourReportPO;
	}
	
	//Kamal
	public TourDetialsReportPO tourDetialsReportPO() {
		tourDetialsReportPO = new TourDetialsReportPO(driver);
		return tourDetialsReportPO;
	}
	
	//Kamal
	public AccessRouteMasterReportPO accessRouteMasterReportPO() {
		accessRouteMasterReportPO = new AccessRouteMasterReportPO(driver);
		return accessRouteMasterReportPO;
	}
	
	//Kamal
	public ElevatorAccessReportPO elevatorAccessReportPO() {
		elevatorAccessReportPO = new ElevatorAccessReportPO(driver);
		return elevatorAccessReportPO;
	}
	
	// Mayank
	public EssInviteVisitorPO essInviteVisitorPO() {
		essInviteVisitorPO = new EssInviteVisitorPO(driver);
		return essInviteVisitorPO;
	}
	
	// Chhaya
	public OverflowManagementPO overflowManagementPO() {
		overflowManagementPO = new OverflowManagementPO(driver);
		return overflowManagementPO;
	}

	// Chhaya
	public LeaveBalanceProcessPO leaveBalanceProcessPO() {
		leaveBalanceProcessPO = new LeaveBalanceProcessPO(driver);
		return leaveBalanceProcessPO;
	}

	// Chhaya
	public EssLeaveApplicatioPO essLeaveApplicatioPO() {
		essLeaveApplicatioPO = new EssLeaveApplicatioPO(driver);
		return essLeaveApplicatioPO;
	}

	// Chhaya
	public RicApplicationAuthorizationPO ricApplicationAuthorizationPO() {
		ricApplicationAuthorizationPO = new RicApplicationAuthorizationPO(driver);
		return ricApplicationAuthorizationPO;
	}

	// Chhaya
	public EssLeaveApplicationApprovalPO essLeaveApplicationApprovalPO() {
		essLeaveApplicationApprovalPO = new EssLeaveApplicationApprovalPO(driver);
		return essLeaveApplicationApprovalPO;
	}

	// Chhaya
	public EssTourApplicationApprovalPO essTourApplicationApprovalPO() {
		essTourApplicationApprovalPO = new EssTourApplicationApprovalPO(driver);
		return essTourApplicationApprovalPO;
	}

	// Chhaya
	public EssCOffApplicationApprovalPO essCOffApplicationApprovalPO() {
		essCOffApplicationApprovalPO = new EssCOffApplicationApprovalPO(driver);
		return essCOffApplicationApprovalPO;
	}
	
	//Kamal 
	public ElevatorFloorGroupMasterReportPO elevatorFloorGroupMasterReportPO() {
		elevatorFloorGroupMasterReportPO = new ElevatorFloorGroupMasterReportPO(driver);
		return elevatorFloorGroupMasterReportPO;
	}
	
	//Kamal
	public DoorHeldOpenReportPO doorHeldOpenReportPO() {
		doorHeldOpenReportPO = new DoorHeldOpenReportPO(driver);
		return doorHeldOpenReportPO;
	}
	
	//Kamal
	public AlarmDetialsReportPO alarmDetailsReportPO() {
		alarmDetialsReportPO = new AlarmDetialsReportPO(driver);
		return alarmDetialsReportPO;
	}
	
	//Kamal 
	public EmergencyEvacuationReportPO emergencyEvacuationReportPO() {
		emergencyEvacuationReportPO = new EmergencyEvacuationReportPO(driver);
		return emergencyEvacuationReportPO;
	}
	
	//Kamal 
	public LeaveModuleReportsPO leaveModuleReportsPO() {
		leaveModuleReportsPO = new LeaveModuleReportsPO(driver);
		return leaveModuleReportsPO;
	}
	
	//Kamal
	public MonthlyLeaveDetialsReportPO monthlyLeaveDetialsReportPO() {
		monthlyLeaveDetialsReportPO = new MonthlyLeaveDetialsReportPO(driver);
		return monthlyLeaveDetialsReportPO;
	}
	
	//Kamal
	public CoffRegisterReportPO coffRegisterReportPO() {
		coffRegisterReportPO = new CoffRegisterReportPO(driver);
		return coffRegisterReportPO;
	}
	
	//Kamal
	public LeaveRegisterReportPO leaveRegisterReportPO() {
		leaveRegisterReportPO = new LeaveRegisterReportPO(driver);
		return leaveRegisterReportPO;
	}
	
	//Kamal
	public LeaveReportPO leaveReportPO() {
		leaveReportPO = new LeaveReportPO(driver);
		return leaveReportPO;
	}
	
	//Kamal
	public LeaveGroupReportPO leaveGroupReportPO() {
		leaveGroupReportPO  = new LeaveGroupReportPO(driver);
		return leaveGroupReportPO;
	}
	
	//Kamal
	public LeaveApplicationReportPO leaveApplicationReportPO() {
		leaveApplicationReportPO = new LeaveApplicationReportPO(driver);
		return leaveApplicationReportPO;
	}
	
	// Chhaya
	public EssTourApplicationPO essTourApplicationPO() {
		essTourApplicationPO = new EssTourApplicationPO(driver);
		return essTourApplicationPO;
	}

	// Chhaya
	public EssCOffApplicationPO essCOffApplicationPO() {
		essCOffApplicationPO = new EssCOffApplicationPO(driver);
		return essCOffApplicationPO;
	}

	public EssVisitorPreRegistrationPO essVisitorPreRegistrationPO() {
		essVisitorPreRegistrationPO = new EssVisitorPreRegistrationPO(driver);
		return essVisitorPreRegistrationPO;
	}

	public EssVisitApprovalPO essVisitApprovalPO() {
		essVisitApprovalPO = new EssVisitApprovalPO(driver);
		return essVisitApprovalPO;
	}

	public EssVisitRegistrationApprovalPO essVisitRegistrationApprovalPO() {
		essVisitRegistrationApprovalPO = new EssVisitRegistrationApprovalPO(driver);
		return essVisitRegistrationApprovalPO;
	}

	public SecurityApprovalPO securityApprovalPO() {
		securityApprovalPO = new SecurityApprovalPO(driver);
		return securityApprovalPO;
	}

	public VisitRequestHandlingPO visitRequestHandlingPO() {
		visitRequestHandlingPO = new VisitRequestHandlingPO(driver);
		return visitRequestHandlingPO;
	}

	public VisitComponentsPO visitComponentsPO() {
		visitComponentsPO = new VisitComponentsPO(driver);
		return visitComponentsPO;
	}
	
	//Kamal
	public LeaveEncashmentReportPO leaveEncashmentReportPO() {
		leaveEncashmentReportPO = new LeaveEncashmentReportPO(driver);
		return leaveEncashmentReportPO;
	}
	
	//Kamal 
	public LeaveCreditDebitReportPO leaveCreditDebitReportPO() {
		leaveCreditDebitReportPO = new LeaveCreditDebitReportPO(driver);
		return leaveCreditDebitReportPO;
	}
	
	//Kamal
	public FormBReportPO formBReportPO() {
		formBReportPO = new FormBReportPO(driver);
		return formBReportPO;
	}
	
	//Kamal 
	public Form15ReportPO form15ReportPO() {
		form15ReportPO = new Form15ReportPO(driver);
		return form15ReportPO;
	}
	
	//Kamal 
	public FormQReportPO formQReportPO() {
		formQReportPO = new FormQReportPO(driver);
		return formQReportPO;
	}
	
	public LeaveRegisterPO leaveRegisterPO() {
		leaveRegisterPO = new LeaveRegisterPO(driver);
		return leaveRegisterPO;
	}
	
	public VisitTemplatePO visitTemplatePO() {
		visitTemplatePO = new VisitTemplatePO(driver);
		return visitTemplatePO;
	}
	
	public VisitorLoginAuthorizationPO visitorLoginAuthorizationPO() {
		visitorLoginAuthorizationPO = new VisitorLoginAuthorizationPO(driver);
		return visitorLoginAuthorizationPO;
	}
	
	public VisitorTemplatePO visitorTemplatePO() {
		visitorTemplatePO = new VisitorTemplatePO(driver);
		return visitorTemplatePO;
	}
	
	//Kamal
	public VisitorManagementModuleReportPO visitorManagementModuleReportPO() {
		visitorManagementModuleReportPO = new VisitorManagementModuleReportPO(driver);
		return visitorManagementModuleReportPO;
	}
	
	//Kamal
	public VisitorPunchReportPO visitorPunchReportPO() {
		visitorPunchReportPO = new VisitorPunchReportPO(driver);
		return visitorPunchReportPO;
	}
	
	//Kamal
	public VisitorPunchDetialReportPO visitorPunchDetialReportPO() {
		visitorPunchDetialReportPO = new VisitorPunchDetialReportPO(driver);
		return visitorPunchDetialReportPO;
	}
	
	//Kamal
	public VisitorPunchExceptionReportPO visitorPunchExceptionReportPO() {
		visitorPunchExceptionReportPO = new VisitorPunchExceptionReportPO(driver);
		return visitorPunchExceptionReportPO;
	}
	
	//Kamal
	public VisitorEnrollmentStatusReportPO visitorEnrollmentStatusReportPO() {
		visitorEnrollmentStatusReportPO = new VisitorEnrollmentStatusReportPO(driver);
		return visitorEnrollmentStatusReportPO;
	}
	
	//Kamal
	public PanelWiseVisitorReportPO panelWiseVisitorReportPO() {
		panelWiseVisitorReportPO = new PanelWiseVisitorReportPO(driver);
		return panelWiseVisitorReportPO;
	}
	
	//Kamal
	public VisitorAccessDeniedReportPO visitorAccessDeniedReportPO() {
		visitorAccessDeniedReportPO = new VisitorAccessDeniedReportPO(driver);
		return visitorAccessDeniedReportPO;
	}
	
	//Kamal
	public VisitorPassValidityReportPO visitorPassValidityReportPO() {
		visitorPassValidityReportPO = new VisitorPassValidityReportPO(driver);
		return visitorPassValidityReportPO;
	}
	
	//Kamal
	public VisitorPassStatusReportPO visitorPassStatusReportPO() {
		visitorPassStatusReportPO = new VisitorPassStatusReportPO(driver);
		return visitorPassStatusReportPO;
	}
	
	//Kamal
	public ExpiredPassReportPO expiredPassReportPO() {
		expiredPassReportPO = new ExpiredPassReportPO(driver);
		return expiredPassReportPO;
	}
	
	//Kamal
	public VisitorWatchlistBlacklistReportPO visitorWatchlistBlacklistReportPO() {
		visitorWatchlistBlacklistReportPO = new VisitorWatchlistBlacklistReportPO(driver);
		return visitorWatchlistBlacklistReportPO;
	}
	
	//Kamal
	public PreRegisteredVisitorReportPO preregisterVisitorReportPO() {
		preRegisteredVisitorReportPO = new PreRegisteredVisitorReportPO(driver);
		return preRegisteredVisitorReportPO;
	}
	
	//Chhaya
	public ImportLeaveBalancePO importLeaveBalancePO() {
		importLeaveBalancePO = new ImportLeaveBalancePO(driver);
		return importLeaveBalancePO;
	}
	
	public VisitorEventsPO visitorEventsPO() {
		visitorEventsPO = new VisitorEventsPO(driver);
		return visitorEventsPO;
	}
	
	public VisitorHistoryPO visitorHistoryPO() {
		visitorHistoryPO = new VisitorHistoryPO(driver);
		return visitorHistoryPO;
	}
	
	public AuthorizedHostUsersPO authorizedHostUsersPO() {
		authorizedHostUsersPO = new AuthorizedHostUsersPO(driver);
		return authorizedHostUsersPO;
	}
	
	//Kamal
	public VisitorHistoryReportPO visitorHistoryReportPO() {
		visitorHistoryReportPO = new VisitorHistoryReportPO(driver);
		return visitorHistoryReportPO;
	}
	
	public VisitorHeadCountReportPO visitorHeadCountReportPO() {
		visitorHeadCountReportPO = new VisitorHeadCountReportPO(driver);
		return visitorHeadCountReportPO;
	}
	
	public VisitorEvacuationReportPO visitorEvacuationReportPO() {
		visitorEvacuationReportPO = new VisitorEvacuationReportPO(driver);
		return visitorEvacuationReportPO;
	}
	
	public CafeteriaManagementModuleReportPO cafeteriaManagementModuleReportPO() {
		cafeteriaManagementModuleReportPO = new CafeteriaManagementModuleReportPO(driver);
		return cafeteriaManagementModuleReportPO;
	}
	
	public ItemsReportPO itemsReportPO() {
		itemsReportPO = new ItemsReportPO(driver);
		return itemsReportPO;
	}
	
	public MenuReportPO menuReportPO() {
		menuReportPO  = new MenuReportPO(driver);
		return menuReportPO;
	}
	
	public MenuScheduleReportPO menuScheduleReportPO() {
		 menuScheduleReportPO = new MenuScheduleReportPO(driver);
		 return menuScheduleReportPO;
	}
	
	public HeadCountReportPO headCountReportPO() {
		headCountReportPO = new HeadCountReportPO(driver);
		return headCountReportPO;
	}
	
	public UserTranscationReportPO userTransactionReportPO() {
		userTranscationReportPO  = new UserTranscationReportPO(driver);
		return userTranscationReportPO;
	}
	
	public UserAccountDetialsReportPO userAccountDetialsReportPO() {
		userAccountDetialsReportPO = new UserAccountDetialsReportPO(driver);
		return userAccountDetialsReportPO;
	}
	
	public UserConsumptionReportPO userConsumptionReportPO() {
		userConsumptionReportPO = new UserConsumptionReportPO(driver);
		return userConsumptionReportPO;
	}
	
	public CreditDebitReportPO creditDebitReportPO() {
		creditDebitReportPO = new CreditDebitReportPO(driver);
		return creditDebitReportPO;
	}
	
	public BlockedUserReportPO blockedUserReportPO() {
		blockedUserReportPO = new BlockedUserReportPO(driver);
		return blockedUserReportPO;
	}
	
	public UserPreOrderDetailsReportPO userPreOrderDetialsReportPO() {
		userPreOrderDetailsReportPO  = new UserPreOrderDetailsReportPO(driver);
		return userPreOrderDetailsReportPO;
	}
	
	public SalesReportPO salesReportPO() {
		salesReportPO = new SalesReportPO(driver);
		return salesReportPO;
	}
	
	public DeviceWiseConsumptionReportPO deviceWiseConsumptionReportPO() {
		deviceWiseConsumptionReportPO = new DeviceWiseConsumptionReportPO(driver);
		return deviceWiseConsumptionReportPO;
	}
	
	public ItemWiseConsumptionReportPO itemWiseConsumptionReportPO() {
		itemWiseConsumptionReportPO = new ItemWiseConsumptionReportPO(driver);
		return itemWiseConsumptionReportPO;
	}
	
	public  DailyConsumptionReportPO dailyConsumptionReportPO() {
		dailyConsumptionReportPO = new DailyConsumptionReportPO(driver);
		return dailyConsumptionReportPO;
	}
	
	public MonthlyConsumptionReportPO monthlyConsumptionReportPO() {
		monthlyConsumptionReportPO = new MonthlyConsumptionReportPO(driver);
		return monthlyConsumptionReportPO;
	}
	
	public CafeteriaDevicesReportPO cafeteriaDevicesReportPO() {
		cafeteriaDevicesReportPO = new CafeteriaDevicesReportPO(driver);
		return cafeteriaDevicesReportPO;
	}
	
	public JobProcessingCostingModuleReportPO jobProcessingCostingModuleReportPO() {
		jobProcessingCostingModuleReportPO = new JobProcessingCostingModuleReportPO(driver);
		return jobProcessingCostingModuleReportPO;
	}
	
	public JobSummaryReportPO jobSummaryReportPO() {
		jobSummaryReportPO = new JobSummaryReportPO(driver);
		return jobSummaryReportPO;
	}
	
	public PhaseSummaryReportPO phaseSummaryReportPO() {
		phaseSummaryReportPO = new PhaseSummaryReportPO(driver);
		return phaseSummaryReportPO;
	}
	
	public ProjectSummaryReportPO projectSummaryReportPO() {
		projectSummaryReportPO = new ProjectSummaryReportPO(driver);
		return projectSummaryReportPO;
	}
	
	public TransactionWiseHoursSummaryReportPO transactionWiseHoursSummaryReportPO() {
		transactionWiseHoursSummaryReportPO = new TransactionWiseHoursSummaryReportPO(driver);
		return transactionWiseHoursSummaryReportPO;
	}
	
	public DailyJobDetailsReportPO dailyJobDetailsReportPO() {
		dailyJobDetailsReportPO = new DailyJobDetailsReportPO(driver);
		return dailyJobDetailsReportPO;
	}
	
	public MonthlyJobDetailsReportPO monthlyJobDetailsReportPO() {
		monthlyJobDetailsReportPO = new MonthlyJobDetailsReportPO(driver);
		return monthlyJobDetailsReportPO;
	}
	
	public JobTransactionsReportPO jobTransactionsReportPO() {
		jobTransactionsReportPO = new JobTransactionsReportPO(driver);
		return jobTransactionsReportPO;
	}
	
	public FormSummaryPO formSummaryPO() {
		formSummaryPO = new FormSummaryPO(driver);
		return formSummaryPO;
	}
	
	public UserJobDetailsReportPO userJobDetailsReportPO() {
		userJobDetailsReportPO = new UserJobDetailsReportPO(driver);
		return userJobDetailsReportPO;
	}
	
	public FieldVisitManagementModuleReportPO fieldVisitManagementModuleReportPO() {
		fieldVisitManagementModuleReportPO = new FieldVisitManagementModuleReportPO(driver);
		return fieldVisitManagementModuleReportPO;
	}
	
	public ScheduleStatusSummaryReportPO scheduleStatusSummaryReportPO() {
		scheduleStatusSummaryReportPO = new ScheduleStatusSummaryReportPO(driver);
		return scheduleStatusSummaryReportPO;
	}
	
	public FieldVisitSummaryReportPO fieldVisitSummaryReportPO() {
		fieldVisitSummaryReportPO = new FieldVisitSummaryReportPO(driver);
		return fieldVisitSummaryReportPO;
	}
	
	public CWMModuleReportPO cvmModuleReportPO() {
		cvmModuleReportPO = new CWMModuleReportPO(driver);
		return cvmModuleReportPO;
	}
	
	public ShiftScheduleAttendenceReportPO shiftScheduleAttendenceReportPO() {
		shiftScheduleAttendenceReportPO = new ShiftScheduleAttendenceReportPO(driver);
		return shiftScheduleAttendenceReportPO;
	}
	
	public MusterRollReportPO musterRollReportPO() {
		musterRollReportPO = new MusterRollReportPO(driver);
		return musterRollReportPO;
	}
	
	public ContinuousAbPrReportPO continuousAbPrReportPO() {
		continuousAbPrReportPO = new ContinuousAbPrReportPO(driver);
		return continuousAbPrReportPO;
	}
	
	public MonthlyAttendanceReportPO monthlyAttendanceReportPO() {
		monthlyAttendanceReportPO = new MonthlyAttendanceReportPO(driver);
		return monthlyAttendanceReportPO;
	}
	
	public DailySummaryReportPO dailySummaryReportPO() {
		dailySummaryReportPO = new DailySummaryReportPO(driver);
		return dailySummaryReportPO;
	}
	
	public DailyWorkHoursReportPO dailyWorkHoursReportPO() {
		dailyWorkHoursReportPO = new DailyWorkHoursReportPO(driver);
		return dailyWorkHoursReportPO;
	}
	
	public DailyHeadCountReportPO dailyHeadCountReportPO() {
		dailyHeadCountReportPO = new DailyHeadCountReportPO(driver);
		return dailyHeadCountReportPO;
	}
	
	public WorkOrderManDaysReportPO workOrderManDaysReportPO() {
		workOrderManDaysReportPO = new WorkOrderManDaysReportPO(driver);
		return workOrderManDaysReportPO;
	}
	
	public BlackedlistWorkersReportPO blackedlistWorkersReportPO() {
		blackedlistWorkersReportPO = new BlackedlistWorkersReportPO(driver);
		return blackedlistWorkersReportPO; 
	}
	
	public WorkOrderDetailsReportPO workOrderDetailsReportPO() {
		workOrderDetailsReportPO = new WorkOrderDetailsReportPO(driver);
		return workOrderDetailsReportPO;
	}
	
	public ContractorDetailsReportPO contractorDetailsReportPO() {
		contractorDetailsReportPO = new ContractorDetailsReportPO(driver);
		return contractorDetailsReportPO;
	}
	
	public WorkerDetialsReportPO workerDetialsReportPO() {
		workerDetialsReportPO = new WorkerDetialsReportPO(driver);
		return workerDetialsReportPO;
	}
	
	public TimeAndAttendenceModuleReportPO timeAndAttendenceModuleReportPO() {
		timeAndAttendenceModuleReportPO = new TimeAndAttendenceModuleReportPO(driver);
		return timeAndAttendenceModuleReportPO;
	}
	
	public LateInReportPO lateInReportPO() {
		lateInReportPO = new LateInReportPO(driver);
		return lateInReportPO;
	}
	
	public EarlyInReportPO earlyInReportPO() {
		earlyInReportPO = new EarlyInReportPO(driver);
		return earlyInReportPO;
	}
	
	public EarlyOutReportPO earlyOutReportPO() {
		earlyOutReportPO = new EarlyOutReportPO(driver);
		return earlyOutReportPO;
	}
	
	public OverstayReportPO overstayReportPO() {
		overstayReportPO = new OverstayReportPO(driver);
		return overstayReportPO;
	}
	
	public AttendenceReportPO attendenceReportPO() {
		attendenceReportPO = new AttendenceReportPO(driver);
		return attendenceReportPO;
	}
	
	public ImportDataVisitorVisitPO importDataVisitorVisitPO() {
		importDataVisitorVisitPO = new ImportDataVisitorVisitPO(driver);
		return importDataVisitorVisitPO;
	}
	
	public AttendanceSummaryReportPO attendanceSummaryReportPO() {
		attendanceSummaryReportPO = new AttendanceSummaryReportPO(driver);
		return attendanceSummaryReportPO;
	}
	
	public LateArrivalMemoReportPO lateArrivalMemoReportPO() {
		lateArrivalMemoReportPO = new LateArrivalMemoReportPO(driver);
		return lateArrivalMemoReportPO;
	}
	
	public GraceTimeUsageReportPO graceTimeUsageReportPO() {
		graceTimeUsageReportPO = new GraceTimeUsageReportPO(driver);
		return graceTimeUsageReportPO;
	}
	
	public NPunchWorkHoursReportPO nPunchWorkHoursReportPO() {
		nPunchWorkHoursReportPO = new NPunchWorkHoursReportPO(driver);
		return nPunchWorkHoursReportPO;
	}
	
	public DailyWorkHoursTAReportPO dailyWorkHoursTAReportPO() {
		dailyWorkHoursTAReportPO = new DailyWorkHoursTAReportPO(driver);
		return dailyWorkHoursTAReportPO;
	}
	
	public AbsentAdjustmentsReportPO absentAdjustmentsReportPO() {
		absentAdjustmentsReportPO = new AbsentAdjustmentsReportPO(driver);
		return absentAdjustmentsReportPO;
	}
	
	public HourlyAttendanceReportPO hourlyAttendanceReportPO() {
		hourlyAttendanceReportPO = new HourlyAttendanceReportPO(driver);
		return hourlyAttendanceReportPO;
	}
	
	public WorkHoursSummaryReportPO workHoursSummaryReportPO() {
		workHoursSummaryReportPO = new WorkHoursSummaryReportPO(driver);
		return workHoursSummaryReportPO;
	}
	
	public DailyDetialsReportPO dailyDetialsReportPO() {
		dailyDetialsReportPO= new DailyDetialsReportPO(driver);
		return dailyDetialsReportPO;
	}
	
	public DailySummaryReportTAPO dailySummaryReportTAPO() {
		dailySummaryReportTAPO= new DailySummaryReportTAPO(driver);
		return dailySummaryReportTAPO;
	}
	
	public DailyWorkDetailsReportPO dailyWorkDetailsReportPO() {
		dailyWorkDetailsReportPO = new DailyWorkDetailsReportPO(driver);
		return dailyWorkDetailsReportPO;
	}
	
	public BreakDeviationReportPO breakDeviationReportPO() {
		breakDeviationReportPO = new BreakDeviationReportPO(driver);
		return breakDeviationReportPO;
	}
	
	public ShiftWiseCountSummaryReportPO shiftWiseCountSummaryReportPO() {
		shiftWiseCountSummaryReportPO= new ShiftWiseCountSummaryReportPO(driver);
		return shiftWiseCountSummaryReportPO;
	}
	
	public FirstINLastOUTPunchDetailsReportPO firstINLastOUTPunchDetailsReportPO() {
		firstINLastOUTPunchDetailsReportPO= new FirstINLastOUTPunchDetailsReportPO(driver);
		return firstINLastOUTPunchDetailsReportPO;
	}
	
	public AbsenteeReportPO absenteeReportPO() {
		absenteeReportPO = new AbsenteeReportPO(driver);
		return absenteeReportPO; 
	}
	
	public AbsenteeismMemoReportPO absenteeismMemoReportPO() {
		absenteeismMemoReportPO = new AbsenteeismMemoReportPO(driver);
		return absenteeismMemoReportPO;
	}
	
	public ContinuousAbsencePresenceReportPO continuousAbsencePresenceReportPO() {
		continuousAbsencePresenceReportPO = new ContinuousAbsencePresenceReportPO(driver);
		return continuousAbsencePresenceReportPO;
	}
	
	public WeekOffHolidayReportPO weekOffHolidayReportPO() {
		weekOffHolidayReportPO = new WeekOffHolidayReportPO(driver);
		return weekOffHolidayReportPO;
	}
	
	public UserFieldBreakReportPO userFieldBreakReportPO() {
		userFieldBreakReportPO = new UserFieldBreakReportPO(driver);
		return userFieldBreakReportPO;
	}
	
	public OvertimeReportPO overtimeReportPO() {
		overtimeReportPO = new OvertimeReportPO(driver);
		return overtimeReportPO;
	}
	
	public OvertimeDetailsReportPO overtimeDetailsReportPO() {
		overtimeDetailsReportPO = new OvertimeDetailsReportPO(driver);
		return overtimeDetailsReportPO;
	}
	
	public TotalHeadCountOvertimeReportPO totalHeadCountOvertimeReportPO() {
		totalHeadCountOvertimeReportPO = new TotalHeadCountOvertimeReportPO(driver);
		return totalHeadCountOvertimeReportPO; 
	}
	
	public UserPresenceOvertimeReportPO userPresenceOvertimeReportPO() {
		userPresenceOvertimeReportPO = new UserPresenceOvertimeReportPO(driver);
		return userPresenceOvertimeReportPO;
	}
	
	public WeeklyWorkingHrsOvertimeReportPO weeklyWorkingHrsOvertimeReportPO() {
		weeklyWorkingHrsOvertimeReportPO= new WeeklyWorkingHrsOvertimeReportPO(driver);
		return weeklyWorkingHrsOvertimeReportPO;
	}
	
	public DailyOvertimeSummaryReportPO dailyOvertimeSummaryReportPO() {
		dailyOvertimeSummaryReportPO = new DailyOvertimeSummaryReportPO(driver);
		return dailyOvertimeSummaryReportPO;
	}
	
	public ExceptionsReportPO exceptionsReportPO() {
		exceptionsReportPO = new ExceptionsReportPO(driver);
		return exceptionsReportPO;
	}
	
	public AttendanceExceptionReportPO attendanceExceptionReportPO() {
		attendanceExceptionReportPO = new AttendanceExceptionReportPO(driver);
		return attendanceExceptionReportPO;
	}
	
	public ManualCorrectionReportPO manualCorrectionReportPO() {
		manualCorrectionReportPO = new ManualCorrectionReportPO(driver);
		return manualCorrectionReportPO;
	}
	
	public PendingAuthorizationReportPO pendingAuthorizationReportPO() {
		pendingAuthorizationReportPO= new PendingAuthorizationReportPO(driver);
		return pendingAuthorizationReportPO;
	}
	
	public SpecialFunctionPunchReportPO specialFunctionPunchReportPO() {
		specialFunctionPunchReportPO= new SpecialFunctionPunchReportPO(driver);
		return specialFunctionPunchReportPO;
	}
	
	public ShiftChangeReportPO shiftChangeReportPO() {
		shiftChangeReportPO = new ShiftChangeReportPO(driver);
		return shiftChangeReportPO;
	}
	
	public ShiftAllowanceReportPO shiftAllowanceReportPO() {
		shiftAllowanceReportPO = new ShiftAllowanceReportPO(driver);
		return shiftAllowanceReportPO;
	}
	
	public AuthorizationStatusReportPO authorizationStatusReportPO() {
		authorizationStatusReportPO= new AuthorizationStatusReportPO(driver);
		return authorizationStatusReportPO;
	}
	
	public AgreementBuilderPO agreementBuilderPO() {
		agreementBuilderPO = new AgreementBuilderPO(driver);
		return agreementBuilderPO;
	}
	
	public MusterSummaryReportPO musterSummaryReportPO() {
		musterSummaryReportPO= new MusterSummaryReportPO(driver);
		return musterSummaryReportPO;
	}
	
	public PreviousAdjustmentSummaryReportPO previousAdjustmentSummaryReportPO() {
		previousAdjustmentSummaryReportPO = new PreviousAdjustmentSummaryReportPO(driver);
		return previousAdjustmentSummaryReportPO;
	}
	
	public SalaryDataReportPO salaryDataReportPO() {
		salaryDataReportPO= new SalaryDataReportPO(driver);
		return salaryDataReportPO;
	}
	
	public AbsenteeDetailReportPO absenteeDetailReportPO() {
		absenteeDetailReportPO= new AbsenteeDetailReportPO(driver);
		return absenteeDetailReportPO;
	}
	
	public MonthlySummaryReportPO monthlySummaryReportPO() {
		monthlySummaryReportPO = new MonthlySummaryReportPO(driver);
		return monthlySummaryReportPO;
	}
	
	public MonthlyLogReportPO monthlyLogReportPO() {
		monthlyLogReportPO= new MonthlyLogReportPO(driver);
		return monthlyLogReportPO;
	}
	
	public ShiftDetailsReportPO shiftDetailsReportPO() {
		shiftDetailsReportPO = new ShiftDetailsReportPO(driver);
		return shiftDetailsReportPO;
	}
	
	public HeadCountTAReportPO headCountTAReportPO() {
		headCountTAReportPO= new HeadCountTAReportPO(driver);
		return headCountTAReportPO;
	}
	
	public FlexibleSummaryReportPO flexibleSummaryReportPO() {
		flexibleSummaryReportPO = new FlexibleSummaryReportPO(driver);
		return flexibleSummaryReportPO;
	}
	
	public AttendanceRegisterReportPO attendanceRegisterReportPO() {
		attendanceRegisterReportPO = new AttendanceRegisterReportPO(driver);
		return attendanceRegisterReportPO;
	}
	
	public LateInRegisterReportPO lateInRegisterReportPO() {
		lateInRegisterReportPO = new LateInRegisterReportPO(driver);
		return lateInRegisterReportPO; 
	}
	
	public EarlyOutRegisterReportPO earlyOutRegisterReportPO() {
		earlyOutRegisterReportPO = new EarlyOutRegisterReportPO(driver);
		return earlyOutRegisterReportPO;
	}
	
	public OvertimeRegisterReportPO overtimeRegisterReportPO() {
		overtimeRegisterReportPO= new OvertimeRegisterReportPO(driver);
		return overtimeRegisterReportPO;
	}
	
	public YearlyPerformanceReportPO yearlyPerformanceReportPO() {
		yearlyPerformanceReportPO = new YearlyPerformanceReportPO(driver);
		return yearlyPerformanceReportPO;
	}
	
	public FormTReportPO formTReportPO() {
		formTReportPO = new FormTReportPO(driver);
		return formTReportPO;
	}
	
	public Form18ReportPO form18ReportPO() {
		form18ReportPO= new Form18ReportPO(driver);
		return form18ReportPO;
	}
	
	public Form28ReportPO form28ReportPO() {
		form28ReportPO = new Form28ReportPO(driver);
		return form28ReportPO;
	}
	
	public CustomAttendanceRegisterReportPO customAttendanceRegisterReportPO() {
		customAttendanceRegisterReportPO = new CustomAttendanceRegisterReportPO(driver);
		return customAttendanceRegisterReportPO;
	}
	
	public Form26ReportPO form26ReportPO() {
		form26ReportPO = new Form26ReportPO(driver);
		return form26ReportPO;
	}
	
	//Chhaya
	public EssLeaveBalancePO essLeaveBalancePO() {
		essLeaveBalancePO = new EssLeaveBalancePO(driver);
		return essLeaveBalancePO;
	}
	
	public TimeLossReportPO timeLossReportPO() {
		timeLossReportPO = new TimeLossReportPO(driver);
		return timeLossReportPO;
	}
	
	public OvertimeChartReportPO overtimeChartReportPO() {
		overtimeChartReportPO = new OvertimeChartReportPO(driver);
		return overtimeChartReportPO;
	}
	
	public AbsentReportPO absentReportPO() {
		absentReportPO = new AbsentReportPO(driver);
		return absentReportPO;
	}
	
	public UserAbsentReportPO userAbsentReportPO() {
		userAbsentReportPO = new UserAbsentReportPO(driver);
		return userAbsentReportPO;
	}
	
	public UserLateInReportPO userLateInReportPO() {
		userLateInReportPO = new UserLateInReportPO(driver);
		return userLateInReportPO;
	}
	
	public UserEarlyOutReportPO userEarlyOutReportPO() {
		userEarlyOutReportPO = new UserEarlyOutReportPO(driver);
		return userEarlyOutReportPO;
	}
	
	public UserIrregularityReportPO userIrregularityReportPO() {
		userIrregularityReportPO = new UserIrregularityReportPO(driver);
		return userIrregularityReportPO;
	}
	
	public MonthWiseOvertimeReportPO monthWiseOvertimeReportPO() {
		monthWiseOvertimeReportPO = new MonthWiseOvertimeReportPO(driver);
		return monthWiseOvertimeReportPO;
	}
	
	public AttendanceSummaryChartReportPO attendanceSummaryChartReportPO() {
		attendanceSummaryChartReportPO = new AttendanceSummaryChartReportPO(driver);
		return attendanceSummaryChartReportPO;
	}
	
	//Chhaya
	public EssAttendanceCorrectionAuthorizationPO essAttendanceCorrectionAuthorizationPO() {
		essAttendanceCorrectionAuthorizationPO = new EssAttendanceCorrectionAuthorizationPO(driver);
		return essAttendanceCorrectionAuthorizationPO;
	}
	
	public ESSInductionApprovalPO essInductionApprovalPO() {
		essInductionApprovalPO = new ESSInductionApprovalPO(driver);
		return essInductionApprovalPO;
	}
	
	public SkillPO skillPO() {
		skillPO = new SkillPO(driver);
		return skillPO;
	}
	
	public WorkerAssignmentPO workerAssignmentPO() {
		workerAssignmentPO = new WorkerAssignmentPO(driver);
		return workerAssignmentPO;
	}
	
	public CssWorkerAssignmentPO cssWorkerAssignmentPO() {
		cssWorkerAssignmentPO = new CssWorkerAssignmentPO(driver);
		return cssWorkerAssignmentPO;
	}
	
	public ImportDataCWMPO importDataCWMPO() {
		importDataCWMPO = new ImportDataCWMPO(driver);
		return importDataCWMPO;
	}
	
	public CWMBlacklistPO cwmBlacklistPO() {
		cwmBlacklistPO = new CWMBlacklistPO(driver);
		return cwmBlacklistPO;
	}
	
	public ManageWorkersPO manageWorkersPO() {
		manageWorkersPO = new ManageWorkersPO(driver);
		return manageWorkersPO;
	}
	
	public WorkOrderProgressPO workOrderProgressPO() {
		workOrderProgressPO = new WorkOrderProgressPO(driver);
		return workOrderProgressPO;
	}
	
	public ApprovalPolicyPO approvalPolicyPO() {
		approvalPolicyPO = new ApprovalPolicyPO(driver);
		return approvalPolicyPO;
	}
	
	public DailyAttendenceViewPO dailyAttendenceViewPO() {
		dailyAttendenceViewPO= new DailyAttendenceViewPO(driver);
		return dailyAttendenceViewPO;
	}
		
	public DailyAttendanceView_TemplatePO dailyAttendenceView_TemplatePO() {
		dailyAttendenceView_TemplatePO = new DailyAttendanceView_TemplatePO(driver);
		return dailyAttendenceView_TemplatePO;
	}
	
	public EssDailyAttendence_TemplatePO essDailyAttendence_TemplatePO() {
		essDailyAttendence_TemplatePO = new EssDailyAttendence_TemplatePO(driver);
		return essDailyAttendence_TemplatePO;
	}
	
	public EssUserDailyAttendenceViewPO essUserDailyAttendenceViewFormatPO() {
		essUserDailyAttendenceViewFormatPO = new EssUserDailyAttendenceViewPO(driver);
		return essUserDailyAttendenceViewFormatPO;
	}
	
	public AbsenteePolicyPO absenteePolicyPO() {
		absenteePolicyPO = new AbsenteePolicyPO(driver);
		return absenteePolicyPO;
	}
	
	public LateINPolicyPO lateINPolicyPO() {
		lateINPolicyPO = new LateINPolicyPO(driver);
		return lateINPolicyPO;
	}
	
	public EarlyOUTPolicyPO earlyOUTPolicyPO() {
		earlyOUTPolicyPO = new EarlyOUTPolicyPO(driver);
		return earlyOUTPolicyPO;
	}
	
	public ExportsPO exportsPO() {
		exportsPO = new ExportsPO(driver);
		return exportsPO;
	}
	
	public AttendenceRegisterPO attendenceRegisterPO() {
		attendenceRegisterPO = new AttendenceRegisterPO(driver);
		return attendenceRegisterPO;
	}
	
	public SiteWiseHeadCountManHoursPO siteWiseHeadCountManHoursPO() {
		siteWiseHeadCountManHoursPO = new SiteWiseHeadCountManHoursPO(driver);
		return siteWiseHeadCountManHoursPO;
	}
	
	public ShortLeaveOfficialOUTTimePO shortLeaveOfficialOUTTimePO() {
		shortLeaveOfficialOUTTimePO = new ShortLeaveOfficialOUTTimePO(driver);
		return shortLeaveOfficialOUTTimePO;
	}
	
	public GroupWiseShiftHeadcountPO groupWiseShiftHeadcountPO() {
		groupWiseShiftHeadcountPO = new GroupWiseShiftHeadcountPO(driver);
		return groupWiseShiftHeadcountPO;
	}
	
	public EnterpriseGroupWisePresenceCountPO enterpriseGroupWisePresenceCountPO() {
		enterpriseGroupWisePresenceCountPO= new EnterpriseGroupWisePresenceCountPO(driver);
		return enterpriseGroupWisePresenceCountPO;
	}
	
	public MonthlyHoursSummaryPO monthlyHoursSummaryPO() {
		monthlyHoursSummaryPO = new MonthlyHoursSummaryPO(driver);
		return monthlyHoursSummaryPO;
	}
	
	public SiteWiseMonthlySummaryPO siteWiseMonthlySummaryPO() {
		siteWiseMonthlySummaryPO = new SiteWiseMonthlySummaryPO(driver);
		return siteWiseMonthlySummaryPO;
	}
	
	public MusterRollPO musterRollPO() {
		musterRollPO = new MusterRollPO(driver);
		return musterRollPO;
	}
	
	public DailyAttendanceAuthorizationPO dailyAttendanceAuthorizationPO() {
		dailyAttendanceAuthorizationPO = new DailyAttendanceAuthorizationPO(driver);
		return dailyAttendanceAuthorizationPO;
	}
	
	//Chhaya
	public EssDailyAttendanceAuthorizationPO essDailyAttendanceAuthorizationPO() {
		essDailyAttendanceAuthorizationPO = new EssDailyAttendanceAuthorizationPO(driver);
		return essDailyAttendanceAuthorizationPO;
	}
	
	//Chhaya
	public EssEventPO essEventPO() {
		essEventPO = new EssEventPO(driver);
		return essEventPO;
	}
	
	//Chhaya
	public EssEventAuthorizationPO essEventAuthorizationPO() {
		essEventAuthorizationPO = new EssEventAuthorizationPO(driver);
		return essEventAuthorizationPO;
	}
	
	//Chhaya
	public EventAuthorizationPO eventAuthorizationPO() {
		eventAuthorizationPO = new EventAuthorizationPO(driver);
		return eventAuthorizationPO;
	}
	
	//Chhaya
	public EssAdvanceOvertimeApplicationPO essAdvanceOvertimeApplicationPO() {
		essAdvanceOvertimeApplicationPO = new EssAdvanceOvertimeApplicationPO(driver);
		return essAdvanceOvertimeApplicationPO;
	}
	
	//Chhaya
	public EssAdvanceOvertimeApprovalPO essAdvanceOvertimeApprovalPO() {
		essAdvanceOvertimeApprovalPO = new EssAdvanceOvertimeApprovalPO(driver);
		return essAdvanceOvertimeApprovalPO;
	}
	
	public ManualStatusCorrectionPO manualStatusCorrectionPO() {
		manualStatusCorrectionPO = new ManualStatusCorrectionPO(driver);
		return manualStatusCorrectionPO;
	}
	
	//Chhaya
	public EssAttendanceCorrectionApplicationPO essAttendanceCorrectionApplicationPO() {
		essAttendanceCorrectionApplicationPO = new EssAttendanceCorrectionApplicationPO(driver);
		return essAttendanceCorrectionApplicationPO;
	}
	 public OvertimeCOFFPO overtimeCOFFPO() {
		 overtimeCOFFPO=new OvertimeCOFFPO(driver);
		 return overtimeCOFFPO;
	 }
	 
	 public EssShortLeaveOfficialINOUTEntryPO essShortLeaveOfficialINOUTEntryPO() {
		 essShortLeaveOfficialINOUTEntryPO=new EssShortLeaveOfficialINOUTEntryPO(driver);
		 return essShortLeaveOfficialINOUTEntryPO;
	 }
	 
	 //Chhaya
	 public EssOvertimeCOFFAuthorizationPO essOvertimeCOFFAuthorizationPO() {
		 essOvertimeCOFFAuthorizationPO=new EssOvertimeCOFFAuthorizationPO(driver);
		 return essOvertimeCOFFAuthorizationPO;
	 }
	 
	 public COFFPolicyPO cOFFPolicyPO() {
		 cOFFPolicyPO=new COFFPolicyPO(driver);
		 return cOFFPolicyPO;
	 }
	 
	 public EssShortLeaveOfficialInOutAuthorizationPO essShortLeaveOfficialInOutAuthorizationPO() {
		 essShortLeaveOfficialInOutAuthorizationPO=new EssShortLeaveOfficialInOutAuthorizationPO(driver);
		 return essShortLeaveOfficialInOutAuthorizationPO;
	 }
	 
	 //Chhaya
	 public COFFApplicationPO coffApplicationPO() {
		 coffApplicationPO=new COFFApplicationPO(driver);
		 return coffApplicationPO;
	 }
	 
	//Chhaya
	public EssAttendanceDetailsPO essAttendanceDetailsPO() {
		essAttendanceDetailsPO = new EssAttendanceDetailsPO(driver);
		return essAttendanceDetailsPO;
	}
	
	//Chhaya
	public NPunchViewPO nPunchViewPO() {
		nPunchViewPO = new NPunchViewPO(driver);
		return nPunchViewPO;
	}
	
	//Chhaya
	public DailyAttendanceProcessPO dailyAttendanceProcessPO() {
		dailyAttendanceProcessPO = new DailyAttendanceProcessPO(driver);
		return dailyAttendanceProcessPO;
	}
	
	//Chhaya
	public InOutReasonsPO inOutReasonsPO() {
		inOutReasonsPO = new InOutReasonsPO(driver);
		return inOutReasonsPO;
	}
	
	//Chhaya
	public ShiftWiseManagementPO shiftWiseManagementPO() {
		shiftWiseManagementPO = new ShiftWiseManagementPO(driver);
		return shiftWiseManagementPO;
	}
	
	public ElevatorConfigurationPO elevatorConfigurationPO() {
		elevatorConfigurationPO = new ElevatorConfigurationPO(driver);
		return elevatorConfigurationPO;
	}
	
	public ElevatorFloorGroupPO elevatorFloorGroupPO() {
		elevatorFloorGroupPO = new ElevatorFloorGroupPO(driver);
		return elevatorFloorGroupPO;
	}
	
	public ChangePolicyPO changePolicyPO() {
		changePolicyPO = new ChangePolicyPO(driver);
		return changePolicyPO;
	}
	
	public MultiUserConfigurationPO multiUserConfigurationPO() {
		multiUserConfigurationPO = new MultiUserConfigurationPO(driver);
		return multiUserConfigurationPO;
	}
	
	public PreviousAdjustmentEntryPO previousAdjustmentEntryPO() {
		previousAdjustmentEntryPO = new PreviousAdjustmentEntryPO(driver);
		return previousAdjustmentEntryPO;
	}
	
	public ManageAttendancePO manageAttendancePO() {
		manageAttendancePO = new ManageAttendancePO(driver);
		return manageAttendancePO;
	}
	
	public AdminPortalPO adminPortalPO() {
		adminPortalPO = new AdminPortalPO(driver);
		return adminPortalPO;
	}
	
	public ApSystemAccountsPO apSystemAccountsPO() {
		apSystemAccountsPO = new ApSystemAccountsPO(driver);
		return apSystemAccountsPO;
	}
	
	public ApPasswordPolicyPO apPasswordPolicyPO() {
		apPasswordPolicyPO = new ApPasswordPolicyPO(driver);
		return apPasswordPolicyPO;
	}
	
	public ApEmailConfigurationPO apEmailConfigurationPO() {
		apEmailConfigurationPO = new ApEmailConfigurationPO(driver);
		return apEmailConfigurationPO;
	}
	
	public ApChangePasswordPO apChangePasswordPO() {
		apChangePasswordPO = new ApChangePasswordPO(driver);
		return apChangePasswordPO;
	}
	
	public AccessProfilePO accessProfilePO() {
		accessProfilePO = new AccessProfilePO(driver);
		return accessProfilePO;
	}
	
	public UsersOnDevicePO usersOnDevicePO() {
		usersOnDevicePO = new UsersOnDevicePO(driver);
		return usersOnDevicePO;
	}
	
	public DeviceGroupPO deviceGroupPO() {
		deviceGroupPO = new DeviceGroupPO(driver);
		return deviceGroupPO;
	}
	
	public WhatsappConfigurationPO whatsappConfigurationPO() {
		whatsappConfigurationPO = new WhatsappConfigurationPO(driver);
		return whatsappConfigurationPO;
	}
	
	public ShiftChangeApprovalPO shiftChangeApprovalPO() {
		shiftChangeApprovalPO = new ShiftChangeApprovalPO(driver);
		return shiftChangeApprovalPO;
	}
	
	public ShiftChangeApplicationPO shiftChangeApplicationPO() {
		shiftChangeApplicationPO = new ShiftChangeApplicationPO(driver);
		return shiftChangeApplicationPO;
	}
	
	public ImportDataJPCPO importDataJPCPO() {
		importDataJPCPO = new ImportDataJPCPO(driver);
		return importDataJPCPO;
	}
	
	public JobSchedulerPO jobSchedulerPO() {
		jobSchedulerPO = new JobSchedulerPO(driver);
		return jobSchedulerPO;
	}
	
	public SchedulerLogsJPCPO schedulerLogsJPCPO() {
		schedulerLogsJPCPO = new SchedulerLogsJPCPO(driver);
		return schedulerLogsJPCPO;
	}
	
	public PreRegistrationTemplatePO preRegistrationTemplatePO() {
		preRegistrationTemplatePO = new PreRegistrationTemplatePO(driver);
		return preRegistrationTemplatePO;
	}
	
	public JobAssignmentProcessPO jobAssignmentProcessPO() {
		jobAssignmentProcessPO = new JobAssignmentProcessPO(driver);
		return jobAssignmentProcessPO;
	}
	public IdentificationServerConfigurationPO identificationServerConfigurationPO() {
		identificationServerConfigurationPO = new IdentificationServerConfigurationPO(driver);
		return identificationServerConfigurationPO;
	}
	
	public EnterpriseProfilePO enterpriseProfilePO() {
		enterpriseProfilePO = new EnterpriseProfilePO(driver);
		return enterpriseProfilePO;
	}
	
	public ElevatorFacilityConfigurationPO elevatorFacilityConfigurationPO() {
		elevatorFacilityConfigurationPO=new ElevatorFacilityConfigurationPO(driver);
		return elevatorFacilityConfigurationPO;
	}
	
	public EssShiftChangeApprovalPO essShiftChangeApprovalPO() {
		essShiftChangeApprovalPO=new EssShiftChangeApprovalPO(driver);
		return essShiftChangeApprovalPO;
	}
	
	public EssShiftChangeApplicationPO essShiftChangeApplicationPO() {
		essShiftChangeApplicationPO=new EssShiftChangeApplicationPO(driver);
		return essShiftChangeApplicationPO;
	}
	
	public SmartElevatorFloorGroupPO smartElevatorFloorGroupPO() {
		smartElevatorFloorGroupPO=new SmartElevatorFloorGroupPO(driver);
		return smartElevatorFloorGroupPO;
	}
	
	public BusRoutePO busRoutePO() {
		busRoutePO=new BusRoutePO(driver);
		return busRoutePO;
	}
	
	public SmartAccessRoutePO smartAccessRoutePO() {
		smartAccessRoutePO=new SmartAccessRoutePO(driver);
		return smartAccessRoutePO;
	}
	
	public ReportBuilderPO reportbuilderPO() {
		reportbuilderPO= new ReportBuilderPO(driver);
		return reportbuilderPO;
	}
	
	public ItemsPO itemsPO() {
		itemsPO= new ItemsPO(driver);
		return itemsPO;
	}
	
	public MenusPO menusPO() {
		menusPO= new MenusPO(driver);
		return menusPO;
	}
	
	public TwoPersonGroupPO twoPersonGroupPO() {
		twoPersonGroupPO= new TwoPersonGroupPO(driver);
		return twoPersonGroupPO;
	}
	
	public FirstInUserPO firstInUserPO() {
		firstInUserPO= new FirstInUserPO(driver);
		return firstInUserPO;
	}
	
	public TimeFramesPO timeFramesPO() {
		timeFramesPO= new TimeFramesPO(driver);
		return timeFramesPO;
	}
	
	public AccessSchedulesPO accessSchedulesPO() {
		accessSchedulesPO= new AccessSchedulesPO(driver);
		return accessSchedulesPO;
	}
	
	public PosDevicesConfigurationPO posDevicesConfigurationPO() {
		posDevicesConfigurationPO= new PosDevicesConfigurationPO(driver);
		return posDevicesConfigurationPO;
	}
	
	public ApSmsConfigurationPO apSmsConfigurationPO() {
		apSmsConfigurationPO= new ApSmsConfigurationPO(driver);
		return apSmsConfigurationPO;
	}
	
	public RechargePO rechargePO() {
		rechargePO= new RechargePO(driver);
		return rechargePO;
	}
	
	public PaymentPO paymentPO() {
		paymentPO= new PaymentPO(driver);
		return paymentPO;
	}
	
	public CafeteriaSettingsPO cafeteriaSettingsPO() {
		cafeteriaSettingsPO= new CafeteriaSettingsPO(driver);
		return cafeteriaSettingsPO;
	}
	
	public CafeteriaUsagePolicyPO cafeteriaUsagePolicyPO() {
		cafeteriaUsagePolicyPO= new CafeteriaUsagePolicyPO(driver);
		return cafeteriaUsagePolicyPO;
	}
	
	public ManualCorrectionPO manualCorrectionPO() {
		manualCorrectionPO= new ManualCorrectionPO(driver);
		return manualCorrectionPO;
	}
	
	public EssTransactionCorrectionApplicationPO essTransactionCorrectionApplicationPO() {
		essTransactionCorrectionApplicationPO= new EssTransactionCorrectionApplicationPO(driver);
		return essTransactionCorrectionApplicationPO;
	}
	
	public CorrectionApprovalPO correctionApprovalPO() {
		correctionApprovalPO= new CorrectionApprovalPO(driver);
		return correctionApprovalPO;
	}
	
	public ManualAdjustmentPO manualAdjustmentPO() {
		manualAdjustmentPO= new ManualAdjustmentPO(driver);
		return manualAdjustmentPO;
	}
	
	public EssPreOrderMealsPO essPreOrderMealsPO() {
		essPreOrderMealsPO= new EssPreOrderMealsPO(driver);
		return essPreOrderMealsPO;
	}
	
	public PreorderedMealsPO preorderedMealsPO() {
		preorderedMealsPO= new PreorderedMealsPO(driver);
		return preorderedMealsPO;
	}
	
	public BlockedUserPO blockedUserPO() {
		blockedUserPO= new BlockedUserPO(driver);
		return blockedUserPO;
	}
	
	public DashboardPO dashboard() {
    	dashboard = new DashboardPO(driver);
		return dashboard;
	}
	
	public TourApprovalPO tourApprovalPO() {
		tourApprovalPO = new TourApprovalPO(driver);
		return tourApprovalPO;
	}
	
	public CoffApprovalPO coffApprovalPO() {
		coffApprovalPO = new CoffApprovalPO(driver);
		return coffApprovalPO;
	}
	
	public TourApplicationPO tourApplicationPO() {
		tourApplicationPO = new TourApplicationPO(driver);
		return tourApplicationPO;
	}
	
	public TimesheetCorrectionAuthorizationPO timesheetCorrectionAuthorizationPO() {
		timesheetCorrectionAuthorizationPO = new TimesheetCorrectionAuthorizationPO(driver);
		return timesheetCorrectionAuthorizationPO;
	}
	
	public ShortLeaveOfficialInOutEntryPO shortLeaveOfficialInOutEntryPO() {
		shortLeaveOfficialInOutEntryPO = new ShortLeaveOfficialInOutEntryPO(driver);
		return shortLeaveOfficialInOutEntryPO;
	}
	
	public ManageVoiceGuidanceAudioPO manageVoiceGuidanceAudioPO() {
		manageVoiceGuidanceAudioPO = new ManageVoiceGuidanceAudioPO(driver);
		return manageVoiceGuidanceAudioPO;
	}
	
}