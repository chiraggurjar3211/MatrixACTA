package PageObject.TimeAndAttendance;

import org.jsoup.internal.FieldsAreNonnullByDefault;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class TimeAndAttendancePO extends AbstractMethod {
	WebDriver driver;

	public TimeAndAttendancePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "Process")
	private WebElement process;

	@FindBy(id = "3028")
	private WebElement monthlyAttendance;

	@FindBy(id = "Utilities")
	private WebElement utilities;

	@FindBy(id = "3016")
	private WebElement attendanceCorrection;
	
	@FindBy(id = "3203")
	private WebElement shortLeaveOfficialINOUTEntry;

	@FindBy(id = "Authorization/Approval")
	private WebElement authorizationApproval;

	@FindBy(id = "3023")
	private WebElement overtimeCOFFAuth;
	
	@FindBy(id = "3022")
	private WebElement shortLeaveOfficialINOUT;

	@FindBy(id = "3025")
	private WebElement attendanceCorrectionApproval;

	@FindBy(id = "Policies")
	private WebElement policies;

	@FindBy(id = "3199")
	private WebElement networkHoursPolicy;

	@FindBy(id = "3201")
	private WebElement advanceOTApplication;

	@FindBy(id = "3202")
	private WebElement advanceOTApproval;

	@FindBy(id = "3002")
	private WebElement attendancePolicy;

	@FindBy(id = "3004")
	private WebElement overtimePolicy;

	@FindBy(id = "Reports")
	private WebElement reports;

	@FindBy(xpath = "//*[text()='Monthly Reports']")
	private WebElement monthlyReports;

	@FindBy(id = "3098")
	private WebElement monthlyDetails;

	@FindBy(id = "3012")
	private WebElement attendanceSummary;

	@FindBy(id = "3014")
	private WebElement otCOffEntryPage;

	@FindBy(xpath = "//*[@data-bs-target=\"#3033\"]")
	private WebElement timemanagementReport;

	@FindBy(id = "3034")
	private WebElement lateInReport;

	@FindBy(id = "3035")
	private WebElement earlyInReport;

	@FindBy(id = "3036")
	private WebElement earlyOutReport;

	@FindBy(id = "3037")
	private WebElement overstayReport;

	@FindBy(id = "3038")
	private WebElement attendenceReport;

	@FindBy(id = "3039")
	private WebElement attendenceSummaryReport;

	@FindBy(id = "3040")
	private WebElement lateArrivalMemoReport;

	@FindBy(id = "3041")
	private WebElement graceTimeUsageReport;

	@FindBy(id = "3042")
	private WebElement npunchWorkHoursReport;

	@FindBy(id = "3043")
	private WebElement dailyWorkHoursReport;

	@FindBy(id = "3044")
	private WebElement absentAdjustmentsReport;

	@FindBy(id = "3045")
	private WebElement hourlyAttendenceReport;

	@FindBy(id = "3046")
	private WebElement workHoursSummaryReport;

	@FindBy(id = "3096")
	private WebElement dailyDetialsReport;

	@FindBy(id = "3097")
	private WebElement dailySummaryReport;

	@FindBy(id = "3116")
	private WebElement dailyWorkDetialsReport;

	@FindBy(id = "3101")
	private WebElement breakDeviationReport;

	@FindBy(id = "3111")
	private WebElement shiftWiseCountSummaryReport;

	@FindBy(id = "3118")
	private WebElement firstInLastOutPunchDetialsReport;

	@FindBy(xpath = "//*[@data-bs-target=\"#3047\"]")
	private WebElement absenteeismReport;

	@FindBy(id = "3048")
	private WebElement absenteeReport;

	@FindBy(id = "3049")
	private WebElement absenteeismMemoReport;

	@FindBy(id = "3050")
	private WebElement continuousAbsencePresenceReport;

	@FindBy(id = "3051")
	private WebElement weekOffHolidayReport;

	@FindBy(id = "3052")
	private WebElement userFieldBreakReport;

	@FindBy(xpath = "//*[@data-bs-target=\"#3053\"]")
	private WebElement overtimeReport;

	@FindBy(id = "3054")
	private WebElement overtimewkReport;

	@FindBy(id = "3055")
	private WebElement overtimeDetialsReport;

	@FindBy(id = "3056")
	private WebElement totalHeadCountOvertimeReport;

	@FindBy(id = "3057")
	private WebElement userPresenceOvertimeReport;

	@FindBy(id = "3058")
	private WebElement weeklyWorkinghrsOvertimeReport;

	@FindBy(id = "3117")
	private WebElement dailyOvertimeSummaryReport;

	@FindBy(xpath = "//*[@data-bs-target=\"#3059\"]")
	private WebElement expectionsReport;

	@FindBy(id = "3060")
	private WebElement expectionsinnerReport;

	@FindBy(id = "3061")
	private WebElement attendenceExpectionReport;

	@FindBy(id = "3062")
	private WebElement manualCorrectionReport;

	@FindBy(id = "3063")
	private WebElement pendingAuthorizationReport;

	@FindBy(id = "3064")
	private WebElement specialFunctionPunchReport;

	@FindBy(id = "3065")
	private WebElement shiftChangeReport;

	@FindBy(id = "3066")
	private WebElement shiftAllowanceReport;

	@FindBy(id = "3103")
	private WebElement authorizationStatusReport;

	@FindBy(id = "3069")
	private WebElement musterSummary;

	@FindBy(id = "3070")
	private WebElement perviousAdjustmentSummaryReport;

	@FindBy(id = "3071")
	private WebElement salaryDataReport;

	@FindBy(id = "3072")
	private WebElement absenteeDetialReport;

	@FindBy(id = "3099")
	private WebElement monthlySummaryReport;

	@FindBy(id = "3100")
	private WebElement monthlyLogReport;

	@FindBy(id = "3102")
	private WebElement shiftDetialsReport;

	@FindBy(id = "3113")
	private WebElement headCountReport;

	@FindBy(id = "3115")
	private WebElement flexibleSummaryReport;

	@FindBy(xpath = "//*[@data-bs-target=\"#3073\"]")
	private WebElement registersReport;

	@FindBy(id = "3074")
	private WebElement attendenceRegisterReport;

	@FindBy(id = "3075")
	private WebElement lateInRegisterReport;

	@FindBy(id = "3076")
	private WebElement earlyOutRegisterReport;

	@FindBy(id = "3077")
	private WebElement overtimeRegisterReport;

	@FindBy(xpath = "//*[@data-bs-target=\"#3078\"]")
	private WebElement yearlyReports;

	@FindBy(id = "3079")
	private WebElement yearlyPerformanceReport;

	@FindBy(xpath = "//*[@data-bs-target=\"#3106\"]")
	private WebElement statutoryReports;

	@FindBy(id = "3107")
	private WebElement formTReport;

	@FindBy(id = "3108")
	private WebElement form18Report;

	@FindBy(id = "3109")
	private WebElement form28Report;

	@FindBy(id = "3200")
	private WebElement form26Report;

	@FindBy(xpath = "//*[@data-bs-target=\"#3080\"]")
	private WebElement userDefinedReport;

	@FindBy(id = "3082")
	private WebElement customAttendenceRegisterReport;

	@FindBy(xpath = "//*[@data-bs-target=\"#3084\"]")
	private WebElement chartsReport;

	@FindBy(id = "3085")
	private WebElement timeLossReport;

	@FindBy(id = "3086")
	private WebElement overtimeChartReport;

	@FindBy(id = "3087")
	private WebElement absentReport;

	@FindBy(id = "3088")
	private WebElement userAbsentReport;

	@FindBy(id = "3089")
	private WebElement userLateInReport;

	@FindBy(id = "3090")
	private WebElement userEarlyOutReport;

	@FindBy(id = "3091")
	private WebElement userIrregularityReport;

	@FindBy(id = "3092")
	private WebElement monthWiseOvertimeReport;

	@FindBy(id = "3093")
	private WebElement attendenceSummaryChartReport;

	@FindBy(id = "3095")
	private WebElement dailyAttendenceView;

	@FindBy(xpath = "//*[@default=\"Template Configuration\"]")
	private WebElement templateConfiguration;

	@FindBy(xpath = "//*[@default=\"View\"]")
	private WebElement viewPage;

	@FindBy(id = "Exports")
	private WebElement exports;

	@FindBy(id = "3030")
	private WebElement attendenceRegister;

	@FindBy(id = "3031")
	private WebElement sitewiseHeadcountManhours;

	@FindBy(id = "3104")
	private WebElement shortleaveOfficalouttime;

	@FindBy(id = "3112")
	private WebElement groupwiseShiftHeadcount;

	@FindBy(id = "3114")
	private WebElement enterpriseGroupwisePresencecout;

	@FindBy(id = "3003")
	private WebElement absenteePolicy;

	@FindBy(id = "3005")
	private WebElement lateInPolicy;

	@FindBy(id = "3006")
	private WebElement earlyOutPolicy;

	@FindBy(id = "3024")
	private WebElement dailyAttendance;

	@FindBy(id = "3119")
	private WebElement monthlyHoursSummary;

	@FindBy(id = "3120")
	private WebElement sitewiseMonthlySummary;

	@FindBy(id = "3121")
	private WebElement musterRoll;

	@FindBy(id = "3122")
	private WebElement eventAuthorization;
	
	@FindBy(id = "3110")
	private WebElement manualStatusCorrection;
	
	@FindBy(id = "3007")
	private WebElement cOffPolicy;
	
	@FindBy(id = "3105")
	private WebElement npunchView;
	
	@FindBy(id = "3027")
	private WebElement dailyAttendanceProcess;
	
	@FindBy(id = "Masters")
	private WebElement mastersTab;
	
	@FindBy(id = "3009")
	private WebElement inOutReason;
	
	@FindBy(id = "3018")
	private WebElement shiftWiseManagement;
	
	@FindBy(id = "3019")
	private WebElement changePlc;
	
	@FindBy(id = "3015")
	private WebElement previousAdjustmentPage;
	
	@FindBy(id = "3017")
	private WebElement manageAttendance;
	
	@FindBy(id = "3010")
	private WebElement busRoute;

	// Functions

	public void goToMonthlyAttendanceProcess() {
		element_Click(process);
		element_Click(monthlyAttendance);
	}

	public void goToAttendanceCorrection() {
		element_Click(utilities);
		element_Click(attendanceCorrection);
	}

	public void goToshortLeaveOfficialINOUT() {
		element_Click(authorizationApproval);
		element_Click(shortLeaveOfficialINOUT);
	}

	public void goToNetworkHoursPolicy() {
		element_Click(policies);
		element_Click(networkHoursPolicy);
	}

	public void goToAttendanceCorrectionApproval() {
		element_Click(authorizationApproval);
		element_Click(attendanceCorrectionApproval);
	}

	public void goToAdvanceOTApplication() {
		element_Click(utilities);
		element_Click(advanceOTApplication);
	}

	public void goToAdvanceOTApproval() {
		element_Click(authorizationApproval);
		element_Click(advanceOTApproval);
	}

	public void goToAttendancePolicy() {
		element_Click(policies);
		element_Click(attendancePolicy);
	}

	public void goToOvertimePolicy() {
		element_Click(policies);
		element_Click(overtimePolicy);
	}

	public void goToMonthlyDetailsReport() {
		element_Click(reports);
		element_Click(monthlyReports);
		element_Click(monthlyDetails);
	}

	public void goToAttendanceSummary() {
		element_Click(utilities);
		element_Click(attendanceSummary);
	}

	// Chhaya
	public void goToOvertimeCOFFEntry() {
		element_Click(utilities);
		element_Click(otCOffEntryPage);
	}

	public void gotoReports() {
		element_Click(reports);
	}

	public void gotoTimeManagementReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(timemanagementReport);
	}

	public void gotoLateInReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(lateInReport);
	}

	public void gotoEarlyInReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(earlyInReport);
	}

	public void gotoEarlyOutReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(earlyOutReport);
	}

	public void gotoOverstayReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(overstayReport);
	}

	public void gotoAttendenceReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(attendenceReport);
	}

	public void gotoAttendenceSummaryReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(attendenceSummaryReport);
	}

	public void gotoLateArrivalMemoReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(lateArrivalMemoReport);
	}

	public void gotoGraceTimeUsageReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(graceTimeUsageReport);
	}

	public void gotoNpunchWorkHoursReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(npunchWorkHoursReport);
	}

	public void gotoDailyWorkHoursReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(dailyWorkHoursReport);
	}

	public void gotoAbsentAdjustmentReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(absentAdjustmentsReport);
	}

	public void gotoHourlyAttendenceReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(hourlyAttendenceReport);
	}

	public void gotoWorkHoursSummaryReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(workHoursSummaryReport);
	}

	public void gotoDailyDetialsReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(dailyDetialsReport);
	}

	public void gotoDailySummaryReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(dailySummaryReport);
	}

	public void gotoDailyWorkDetialsReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(dailyWorkDetialsReport);
	}

	public void gotoBreakDeviationReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(breakDeviationReport);
	}

	public void gotoShiftWiseCountSummaryReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(shiftWiseCountSummaryReport);
	}

	public void gotoFirstInLastOutPunchDetialsReport() throws InterruptedException {
		gotoTimeManagementReport();
		Thread.sleep(1000);
		element_Click(firstInLastOutPunchDetialsReport);
	}

	public void gotoAbsenteeismReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(absenteeismReport);
	}

	public void gotoAbsenteeismMemoReport() throws InterruptedException {
		gotoAbsenteeismReport();
		Thread.sleep(1000);
		element_Click(absenteeismMemoReport);
	}

	public void gotoAbsenteeReport() throws InterruptedException {
		gotoAbsenteeismReport();
		Thread.sleep(1000);
		element_Click(absenteeReport);
	}

	public void gotoContinuousAbsencePresenceReport() throws InterruptedException {
		gotoAbsenteeismReport();
		Thread.sleep(1000);
		element_Click(continuousAbsencePresenceReport);
	}

	public void gotoWeekOffHolidayReport() throws InterruptedException {
		gotoAbsenteeismReport();
		Thread.sleep(1000);
		element_Click(weekOffHolidayReport);
	}

	public void gotoUserFieldBreakReport() throws InterruptedException {
		gotoAbsenteeismReport();
		Thread.sleep(1000);
		element_Click(userFieldBreakReport);
	}

	public void gotoOvertimeReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(overtimeReport);
	}

	public void gotoOvertimewkReport() throws InterruptedException {
		gotoOvertimeReport();
		Thread.sleep(1000);
		element_Click(overtimewkReport);
	}

	public void gotoOvertimeDetialsReport() throws InterruptedException {
		gotoOvertimeReport();
		Thread.sleep(1000);
		element_Click(overtimeDetialsReport);
	}

	public void gotoTotalHeadCountOvertimeReport() throws InterruptedException {
		gotoOvertimeReport();
		Thread.sleep(1000);
		element_Click(totalHeadCountOvertimeReport);
	}

	public void gotoUserPresenceOvertimeReport() throws InterruptedException {
		gotoOvertimeReport();
		Thread.sleep(1000);
		element_Click(userPresenceOvertimeReport);
	}

	public void gotoWeeklyWorkingHrsOvertimeReport() throws InterruptedException {
		gotoOvertimeReport();
		Thread.sleep(1000);
		element_Click(weeklyWorkinghrsOvertimeReport);
	}

	public void gotoDailyOvertimeSummaryReport() throws InterruptedException {
		gotoOvertimeReport();
		Thread.sleep(1000);
		element_Click(dailyOvertimeSummaryReport);
	}

	public void gotoExpectionReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(expectionsReport);
	}

	public void gotoExpectioninnerReport() throws InterruptedException {
		gotoExpectionReport();
		Thread.sleep(1000);
		element_Click(expectionsinnerReport);
	}

	public void gotoAttendenceExpectionReport() throws InterruptedException {
		gotoExpectionReport();
		Thread.sleep(1000);
		element_Click(attendenceExpectionReport);
	}

	public void gotoManualCorrectionReport() throws InterruptedException {
		gotoExpectionReport();
		Thread.sleep(1000);
		element_Click(manualCorrectionReport);
	}

	public void gotoPendingAuthorizationReport() throws InterruptedException {
		gotoExpectionReport();
		Thread.sleep(1000);
		element_Click(pendingAuthorizationReport);
	}

	public void gotoSpecialFunctionPunchReport() throws InterruptedException {
		gotoExpectionReport();
		Thread.sleep(1000);
		element_Click(specialFunctionPunchReport);
	}

	public void gotoShiftChangeReport() throws InterruptedException {
		gotoExpectionReport();
		Thread.sleep(1000);
		element_Click(shiftChangeReport);
	}

	public void gotoShiftAllowanceReport() throws InterruptedException {
		gotoExpectionReport();
		Thread.sleep(1000);
		element_Click(shiftAllowanceReport);
	}

	public void gotoAuthorizationStatusReport() throws InterruptedException {
		gotoExpectionReport();
		Thread.sleep(1000);
		element_Click(authorizationStatusReport);
	}

	public void gotoMonthlyReports() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(monthlyReports);
	}

	public void gotoMusterSummaryReport() throws InterruptedException {
		gotoMonthlyReports();
		Thread.sleep(1000);
		element_Click(musterSummary);
	}

	public void gotoPreviousAdjustmentSummaryReport() throws InterruptedException {
		gotoMonthlyReports();
		Thread.sleep(1000);
		element_Click(perviousAdjustmentSummaryReport);
	}

	public void gotoSalaryDataReport() throws InterruptedException {
		gotoMonthlyReports();
		Thread.sleep(1000);
		element_Click(salaryDataReport);
	}

	public void gotoAbsenteeDetialsReport() throws InterruptedException {
		gotoMonthlyReports();
		Thread.sleep(1000);
		element_Click(absenteeDetialReport);
	}

	public void gotoMonthlySummaryReport() throws InterruptedException {
		gotoMonthlyReports();
		Thread.sleep(1000);
		element_Click(monthlySummaryReport);
	}

	public void gotoMonthlyLogReport() throws InterruptedException {
		gotoMonthlyReports();
		Thread.sleep(1000);
		element_Click(monthlyLogReport);
	}

	public void gotoShiftDetialsReport() throws InterruptedException {
		gotoMonthlyReports();
		Thread.sleep(1000);
		element_Click(shiftDetialsReport);
	}

	public void gotoHeadCountReport() throws InterruptedException {
		gotoMonthlyReports();
		Thread.sleep(1000);
		element_Click(headCountReport);
	}

	public void gotoFlexibleSummaryReport() throws InterruptedException {
		gotoMonthlyReports();
		Thread.sleep(1000);
		element_Click(flexibleSummaryReport);
	}

	public void gotoRegisterReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(registersReport);
	}

	public void gotoAttendenceRegisterReport() throws InterruptedException {
		gotoRegisterReport();
		Thread.sleep(1000);
		element_Click(attendenceRegisterReport);
	}

	public void gotoLateInRegisterReport() throws InterruptedException {
		gotoRegisterReport();
		Thread.sleep(1000);
		element_Click(lateInRegisterReport);
	}

	public void gotoEarlyOutRegisterReport() throws InterruptedException {
		gotoRegisterReport();
		Thread.sleep(1000);
		element_Click(earlyOutRegisterReport);
	}

	public void gotoOvertimeRegisterReport() throws InterruptedException {
		gotoRegisterReport();
		Thread.sleep(1000);
		element_Click(overtimeRegisterReport);
	}

	public void gotoYearlyReports() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(yearlyReports);
	}

	public void gotoYearlyPerformanceReport() throws InterruptedException {
		gotoYearlyReports();
		Thread.sleep(1000);
		element_Click(yearlyPerformanceReport);
	}

	public void gotoUserDefinedReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(userDefinedReport);
	}

	public void gotoCustomAttendenceRegisterReport() throws InterruptedException {
		gotoUserDefinedReport();
		Thread.sleep(1000);
		element_Click(customAttendenceRegisterReport);
	}

	public void gotoStatutoryReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(statutoryReports);
	}

	public void gotoFormTReport() throws InterruptedException {
		gotoStatutoryReport();
		Thread.sleep(1000);
		element_Click(formTReport);
	}

	public void gotoForm18Report() throws InterruptedException {
		gotoStatutoryReport();
		Thread.sleep(1000);
		element_Click(form18Report);
	}

	public void gotoForm28Report() throws InterruptedException {
		gotoStatutoryReport();
		Thread.sleep(1000);
		element_Click(form28Report);
	}

	public void gotoForm26Report() throws InterruptedException {
		gotoStatutoryReport();
		Thread.sleep(1000);
		element_Click(form26Report);
	}

	public void gotoChartsReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(chartsReport);
	}

	public void gotoTimeLossReport() throws InterruptedException {
		gotoChartsReport();
		Thread.sleep(1000);
		element_Click(timeLossReport);
	}

	public void gotoOvertimeChartReport() throws InterruptedException {
		gotoChartsReport();
		Thread.sleep(1000);
		element_Click(overtimeChartReport);
	}

	public void gotoAbsentReport() throws InterruptedException {
		gotoChartsReport();
		Thread.sleep(1000);
		element_Click(absentReport);
	}

	public void gotoUserAbsentReport() throws InterruptedException {
		gotoChartsReport();
		Thread.sleep(1000);
		element_Click(userAbsentReport);
	}

	public void gotoUserLateInReport() throws InterruptedException {
		gotoChartsReport();
		Thread.sleep(1000);
		element_Click(userLateInReport);
	}

	public void gotoUserEarlyOutReport() throws InterruptedException {
		gotoChartsReport();
		Thread.sleep(1000);
		element_Click(userEarlyOutReport);
	}

	public void gotoUserIrregularityReport() throws InterruptedException {
		gotoChartsReport();
		Thread.sleep(1000);
		element_Click(userIrregularityReport);
	}

	public void gotoMonthWiseOvertimeReport() throws InterruptedException {
		gotoChartsReport();
		Thread.sleep(1000);
		element_Click(monthWiseOvertimeReport);
	}

	public void gotoAttendenceSummaryChartReport() throws InterruptedException {
		gotoChartsReport();
		Thread.sleep(1000);
		element_Click(attendenceSummaryChartReport);
	}

	public void gotoUtilities() {
		element_Click(utilities);
	}

	public void gotoDailyAttendenceView_TemplateConfiguration() throws InterruptedException {
		gotoUtilities();
		Thread.sleep(1000);
		element_Click(dailyAttendenceView);
		Thread.sleep(1000);
		element_Click(templateConfiguration);
	}

	public void gotoDailyAttendence_ViewPage() throws InterruptedException {
		gotoUtilities();
		Thread.sleep(1000);
		element_Click(dailyAttendenceView);
		Thread.sleep(1000);
		element_Click(viewPage);
	}

	// Chhaya
	public void goToAbsenteePolicyPage() throws InterruptedException {
		element_Click(policies);
		Thread.sleep(1000);
		element_Click(absenteePolicy);
	}

	public void goToLateInPolicyPage() throws InterruptedException {
		element_Click(policies);
		Thread.sleep(1000);
		element_Click(lateInPolicy);
	}

	public void goToEarlyOutPolicyPage() throws InterruptedException {
		element_Click(policies);
		Thread.sleep(1000);
		element_Click(earlyOutPolicy);
	}

	// Chhaya
	public void goToDailyAttendanceAuthorizationPage() throws InterruptedException {
		element_Click(authorizationApproval);
		Thread.sleep(1000);
		element_Click(dailyAttendance);
	}

	public void gotoExports() {
		element_Click(exports);
	}

	public void gotoAttendenceRegister() throws InterruptedException {
		gotoExports();
		Thread.sleep(1000);
		element_Click(attendenceRegister);
	}

	public void gotoSiteWiseHeadcountManHours() throws InterruptedException {
		gotoExports();
		Thread.sleep(1000);
		element_Click(sitewiseHeadcountManhours);
	}

	public void gotoShortLeaveOfficaloutTime() throws InterruptedException {
		gotoExports();
		Thread.sleep(1000);
		element_Click(shortleaveOfficalouttime);
	}

	public void gotoGroupWiseShiftHeadcount() throws InterruptedException {
		gotoExports();
		Thread.sleep(1000);
		element_Click(groupwiseShiftHeadcount);
	}

	public void gotoEnterpriseGroupWisePresenceCount() throws InterruptedException {
		gotoExports();
		Thread.sleep(1000);
		element_Click(enterpriseGroupwisePresencecout);
	}

	public void gotoMonthlyHoursSummary() throws InterruptedException {
		gotoExports();
		Thread.sleep(1000);
		element_Click(monthlyHoursSummary);
	}

	public void gotoSiteWiseMonthlySummary() throws InterruptedException {
		gotoExports();
		Thread.sleep(1000);
		element_Click(sitewiseMonthlySummary);
	}

	public void gotoMusterRoll() throws InterruptedException {
		gotoExports();
		Thread.sleep(1000);
		element_Click(musterRoll);
	}

	// Chhaya
	public void goToEventAuthorizationPage() throws InterruptedException {
		element_Click(authorizationApproval);
		Thread.sleep(1000);
		element_Click(eventAuthorization);
	}
	
	public void goToManualStatusCorrectionPage() throws InterruptedException {
		element_Click(utilities);
		Thread.sleep(1000);
		element_Click(manualStatusCorrection);
	}
	
	public void goToOvertimeCOFFAuthorizationApprovalPage() throws Exception{
		element_Click(authorizationApproval);
		Thread.sleep(1000);
		element_Click(overtimeCOFFAuth);
	}
	
	//Chhaya
	public void goToCOFFPolicyPage() throws InterruptedException {
		element_Click(policies);
		Thread.sleep(1000);
		element_Click(cOffPolicy);
	}
	
	//Chhaya
	public void goToNPunchViewPage() throws InterruptedException {
		element_Click(utilities);
		Thread.sleep(1000);
		element_Click(npunchView);
	}
 
	//Chhaya
	public void goToDailyAttendanceProcessPage() throws InterruptedException {
		element_Click(process);
		Thread.sleep(1000);
		element_Click(dailyAttendanceProcess);
	}
	
	//Chhaya
	public void goToInOutReasonsPage() throws InterruptedException {
		element_Click(mastersTab);
		Thread.sleep(1000);
		element_Click(inOutReason);
	}
	
	//Chhaya
	public void goToShiftWiseManagementPage() throws InterruptedException {
		element_Click(utilities);
		Thread.sleep(1000);
		element_Click(shiftWiseManagement);
	}
	
	//Mayank
	public void goToChangePlc() throws InterruptedException {
		element_Click(utilities);
		element_Click(changePlc);
	}
	
	//Mayank
	public void goToPreviousAdjustmentPage() throws InterruptedException {
		element_Click(utilities);
		element_Click(previousAdjustmentPage);
	}

	//Chhaya
	public void goToManageAttendancePage() throws InterruptedException {
		element_Click(utilities);
		Thread.sleep(1000);
		element_Click(manageAttendance);
	}
	
	public void goToBusRoutePage() throws InterruptedException {
		element_Click(mastersTab);
		element_Click(busRoute);
	}
	
	public void goToShortLeaveOfficialINOUTEntryPage() throws InterruptedException {
		element_Click(utilities);
		Thread.sleep(1000);
		element_Click(shortLeaveOfficialINOUTEntry);
	}
}
