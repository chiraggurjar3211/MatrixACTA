package PageObject.ContractorWorkerManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class ContractorWorkerManagementPO extends AbstractMethod{
	WebDriver driver;
	public ContractorWorkerManagementPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//Elements
	@FindBy(id = "Contractor")
	private WebElement contractor;
	
	@FindBy(id = "13010")
	private WebElement contractorProfile;
	
	@FindBy(id = "Work Order")
	private WebElement workOrderTab;
	
	@FindBy(id = "13007")
	private WebElement workOrders;
	
	@FindBy(xpath = "//*[@id='Workers ']")
	private WebElement workertab;
	
	@FindBy(id = "13014")
	private WebElement workerProfile;
	
	@FindBy(id = "13012")
	private WebElement workerList;
	
	@FindBy(id = "13006")
	private WebElement approvalStages;
	
	@FindBy(id = "13005")
	private WebElement inductionLevels;
	
	@FindBy(id = "Authorization/Approval")
	private WebElement authorizationApprovalTab;
	
	@FindBy(id = "13023")
	private WebElement inductionApproval;
	
	@FindBy(id = "Reports")
	private WebElement reports;
	
	@FindBy(xpath = "//*[contains(text(),'Attendance Details')]")
	private WebElement attendenceDetialsreport;
	
	@FindBy(id = "13035")
	private WebElement shiftScheduleattendencereport;
	
	@FindBy(id = "13036")
	private WebElement musterRollreport;
	
	@FindBy(id = "13037")
	private WebElement continuousAbPRreprot;
	
	@FindBy(xpath = "//*[contains(text(),'Status Summary')]")
	private WebElement statusSummaryreport;
	
	@FindBy(id = "13032")
	private WebElement attendenceStatusTemplatereport;
	
	@FindBy(id = "13031")
	private WebElement dailySummaryreport;
	
	@FindBy(id = "13033")
	private WebElement monthlyAttendencereport;
	
	@FindBy(id = "13025")
	private WebElement workerDetialsreport;
	
	@FindBy(id = "13026")
	private WebElement contracterDetialsreport;
	
	@FindBy(id = "13027")
	private WebElement workOrderDetialsreport;
	
	@FindBy(id = "13028")
	private WebElement blacklistWorkersreport;
	
	@FindBy(id = "13029")
	private WebElement workOrderManDaysreport;
	
	@FindBy(id = "13030")
	private WebElement dialyHeadCountreport;
	
	@FindBy(id = "13034")
	private WebElement dailyWorkHoursreport;
	
	@FindBy(id = "13013")
	private WebElement skillPage;
	
	@FindBy(id = "13015")
	private WebElement workerAssignmentPage;
	
	@FindBy(xpath = "//*[@id='Utilities']")
	private WebElement utilitytab;
	
	@FindBy(id = "13018")
	private WebElement importDataPage;
	
	@FindBy(id = "13019")
	private WebElement blacklistPage;
	
	@FindBy(id = "13020")
	private WebElement manageWorkersPage;
	
	@FindBy(id = "13021")
	private WebElement workOrderProgressPage;
	
	
	
	// Functions
	public void goToContractorProfile() {
		element_Click(contractor);
		element_Click(contractorProfile);
	}
	
	public void goToWorkOrders() {
		element_Click(workOrderTab);
		element_Click(workOrders);
	}
	
	public void goToWorkerProfile() {
		element_Click(workertab);
		element_Click(workerProfile);
	}
	
	public void goToWorkerList() {
		element_Click(workertab);
		element_Click(workerList);
	}
	
	public void goToApprovalStages() {
		element_Click(workOrderTab);
		element_Click(approvalStages);
	}
	
	public void goToInductionLevels() {
		element_Click(workOrderTab);
		element_Click(inductionLevels);
	}
	
	public void goToInductionApprovals() {
		element_Click(authorizationApprovalTab);
		element_Click(inductionApproval);
	}
	
	public void gotoReports() {
		element_Click(reports);
	}
	
	public void gotoWorkerDetialsReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(workerDetialsreport);
	}
	
	public void gotoContractorDetialsReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(contracterDetialsreport);
	}
	
	public void gotoWorkOrderDetialsReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(workOrderDetialsreport);
	}
	
	public void gotoBlackedlistWorkersReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(blacklistWorkersreport);
	}
	
	public void gotoWorkOrderManDaysReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(workOrderManDaysreport);
	}
	
	public void gotoDailyHeadCountReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(dialyHeadCountreport);
	}
	
	public void gotoDailyWorkHoursReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(dailyWorkHoursreport);
	}
	
	public void gotoStatusSummaryReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(statusSummaryreport);
	}
	
	public void gotoAttendenceDetialsReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(attendenceDetialsreport);
	}
	
	public void gotoAttendenceStatusTemplateReport() throws InterruptedException {
		gotoStatusSummaryReport();
		Thread.sleep(1000);
		element_Click(attendenceStatusTemplatereport);
	}
	
	public void gotoDailySummaryReport() throws InterruptedException {
		gotoStatusSummaryReport();
		Thread.sleep(1000);
		element_Click(dailySummaryreport);
	}
	
	public void gotoMonthlyAttendenceReport() throws InterruptedException {
		gotoStatusSummaryReport();
		Thread.sleep(1000);
		element_Click(monthlyAttendencereport);
	}
	
	public void gotoShiftScheduleAttendenceReport() throws InterruptedException {
		gotoAttendenceDetialsReport();
		Thread.sleep(1000);
		element_Click(shiftScheduleattendencereport);
	}
	
	public void gotoMusterRollReport() throws InterruptedException {
		gotoAttendenceDetialsReport();
		Thread.sleep(1000);
		element_Click(musterRollreport);
	}
	
	public void gotoContinuousAbPrReport() throws InterruptedException {
		gotoAttendenceDetialsReport();
		Thread.sleep(1000);
		element_Click(continuousAbPRreprot);
	}
	
	public void gotoSkillPage(){
		element_Click(workertab);
		element_Click(skillPage);
	}
	
	public void gotoWorkerAssignmentPage() {
		element_Click(workertab);
		element_Click(workerAssignmentPage);
	}
	
	public void gotoImportDataPage() {
		element_Click(utilitytab);
		element_Click(importDataPage);
	}
	
	public void gotoBlacklistPage() {
		element_Click(utilitytab);
		element_Click(blacklistPage);
	}
	
	public void goToManageWorkersPage() {
		element_Click(utilitytab);
		element_Click(manageWorkersPage);
	}
	
	public void goToWorkOrderProgressPage() {
		element_Click(utilitytab);
		element_Click(workOrderProgressPage);
	}
	
		
}
