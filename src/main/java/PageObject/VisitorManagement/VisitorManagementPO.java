package PageObject.VisitorManagement;

import java.util.List;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;

public class VisitorManagementPO extends AbstractMethod{
	WebDriver driver;
	public VisitorManagementPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "Utilities")
	private WebElement utilities;
	
	@FindBy(id = "5036")
	private WebElement deleteFrequentVisitorsPage;
	
	@FindBy(id = "5039")
	private WebElement inviteVisitorsPage;
	
	@FindBy(id = "5004")
	private WebElement visitorPreRegistrationPage;
	
	@FindBy(id = "5002")
	private WebElement visitorProfilePage;
	
	@FindBy(id = "5010")
	private WebElement watchlistBlacklistPage;
	
	@FindBy(id = "5009")
	private WebElement frequentVisitorsPage;
	
	@FindBy(id = "5038")
	private WebElement visitApprovalPage;
	
	@FindBy(id = "5042")
	private WebElement stationLocationPage;
	
	@FindBy(id = "5005")
	private WebElement visitRegistrationApprovalPage;
	
	@FindBy(id = "5035")
	private WebElement securityApprovalPage;
	
	@FindBy(id = "5034")
	private WebElement visitRequestHandlingPage;
	
	@FindBy(id = "5003")
	private WebElement visitComponentsPage;
	
	@FindBy(id = "5040")
	private WebElement visitTemplatePage;
	
	@FindBy(id = "5037")
	private WebElement visitorLoginAuthorizationPage;
	
	@FindBy(id = "5041")
	private WebElement visitorTemplatePage;
	
	//Kamal
	@FindBy(id = "Reports")
	private WebElement report;
	
	@FindBy(linkText = "Visitor Access")
	private WebElement visiotrAccessReport;
	
	@FindBy(linkText = "Visitor Pass")
	private WebElement visitorPassReport;
	
	@FindBy(linkText = "Visitor Summary")
	private WebElement visitorSummaryReport;
	
	@FindBy(id = "5032")
	private WebElement visitorEvacuationReport;
	
	@FindBy(id = "5014")
	private WebElement visitorPunchReport;
	
	@FindBy(id = "5015")
	private WebElement visitorPunchDetialReport;
	
	@FindBy(id = "5016")
	private WebElement visitorPunchExceptionReport;
	
	@FindBy(id = "5017")
	private WebElement visitorEnrollmentStatusReport;
	
	@FindBy(id = "5018")
	private WebElement panelWiseVisitorReport;
	
	@FindBy(id = "5019")
	private WebElement visitorAccessDeniedReport;
	
	@FindBy(id = "5021")
	private WebElement visitorPassValidityReport;
	
	@FindBy(id = "5022")
	private WebElement visitorPassStatusReport;
	
	@FindBy(id = "5023")
	private WebElement expiredPassesReport;
	
	@FindBy(id = "5025")
	private WebElement visitorWatchlistBlacklistReport;
	
	@FindBy(id = "5026")
	private WebElement preregisteredVisitorReport;
	
	@FindBy(id = "5027")
	private WebElement visitorHistoryReport;
	
	@FindBy(id = "5028")
	private WebElement visitorHeadCountReport;
	//end Kamal
	
	@FindBy(id = "5043")
	private WebElement visitorEventsPage;
	
	@FindBy(id = "5011")
	private WebElement visitorHistoryPage;
	
	@FindBy(id = "5033")
	private WebElement authorizedHostUsersPage;
	
	@FindBy(id = "5044")
	private WebElement formSummaryPage;
	
	@FindBy(id = "5050")
	private WebElement importPage;
	
	@FindBy(id = "5053")
	private WebElement preRegistrationTemplatePage;
	
	@FindBy(id = "Templates")
	private WebElement templatesTab;
	
	@FindBy(id = "Approval")
	private WebElement approvalTab;
	
	
	public void goToDeleteFrequentVisitorsPage() {
		element_Click(utilities);
		element_Click(deleteFrequentVisitorsPage);
	}
	
	public void goToInviteVisitorsPage() {
		element_Click(inviteVisitorsPage);
	}
	
	public void goToVisitorPreRegistrationPage() {
		element_Click(visitorPreRegistrationPage);
	}
	
	public void goToVisitorProfilePage() {
		element_Click(visitorProfilePage);
	}
	
	public void goToWatchlistBlacklistPage() {
		element_Click(utilities);
		element_Click(watchlistBlacklistPage);
	}
	
	public void goToFrequentVisitorsPage() {
		element_Click(utilities);
		element_Click(frequentVisitorsPage);
	}
	
	public void goToVisitApprovalPage() {
		element_Click(approvalTab);
		element_Click(visitApprovalPage);
	}
	
	public void goToStationLocationPage() {
		element_Click(stationLocationPage);
	}
	
	public void goToVisitRegistrationApprovalPage() {
		element_Click(approvalTab);
		element_Click(visitRegistrationApprovalPage);
	}
	
	public void goToSecurityApprovalPage() {
		element_Click(approvalTab);
		element_Click(securityApprovalPage);
	}
	
	public void goToVisitRequestHandlingPage() {
		element_Click(utilities);
		element_Click(visitRequestHandlingPage);
	}
	
	public void goToVisitComponentsPage() {
		element_Click(visitComponentsPage);
	}
	
	public void goToVisitTemplatePage() {
		element_Click(templatesTab);
		element_Click(visitTemplatePage);
	}
	
	public void goToVisitorLoginAuthorizationPage() {
		element_Click(approvalTab);
		element_Click(visitorLoginAuthorizationPage);
	}
	
	public void goToVisitorTemplatePage() {
		element_Click(templatesTab);
		element_Click(visitorTemplatePage);
	}
	
	//Kamal 
	
	public void gotoReports() {
		element_Click(report);
	}
	
	//Kamal
	public void gotoVisitorAccessReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(visiotrAccessReport);
	}
	
	//Kamal
	public void gotoVisitorPassReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(visitorPassReport);
	}
	
	//Kamal
	public void gotoVisitorSummaryReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(visitorSummaryReport);
	}
	
	//Kamal
	public void gotoVisitorEvacuationReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(visitorEvacuationReport);
	}
	
	//Kamal
	public void gotoVisitorPunchReport() throws InterruptedException {
		gotoVisitorAccessReport();
		Thread.sleep(1000);
		element_Click(visitorPunchReport);
	}
	
	//Kamal
	public void gotoVisitorPunchDetialReport() throws InterruptedException {
		gotoVisitorAccessReport();
		Thread.sleep(1000);
		element_Click(visitorPunchDetialReport);
	}
	
	//Kamal
	public void gotoVisitorPunchExecptionReport() throws InterruptedException {
		gotoVisitorAccessReport();
		Thread.sleep(1000);
		element_Click(visitorPunchExceptionReport);
	}
	
	//Kamal
	public void gotoVisitorEnrollmnetStatusReport() throws InterruptedException {
		gotoVisitorAccessReport();
		Thread.sleep(1000);
		element_Click(visitorEnrollmentStatusReport);
	}
	
	//Kamal
	public void gotoPanelWiseVisitorReport() throws InterruptedException {
		gotoVisitorAccessReport();
		Thread.sleep(1000);
		element_Click(panelWiseVisitorReport);
	}
	
	//Kamal
	public void gotoVisitorAccessDeniedReport() throws InterruptedException {
		gotoVisitorAccessReport();
		Thread.sleep(1000);
		element_Click(visitorAccessDeniedReport);
	}
	
	//Kamal
	public void gotoVisitorPassValidityReport() throws InterruptedException {
		gotoVisitorPassReport();
		Thread.sleep(1000);
		element_Click(visitorPassValidityReport);	
	}
	
	//Kamal
	public void gotoVisitorPassStatusReport() throws InterruptedException {
		gotoVisitorPassReport();
		Thread.sleep(1000);
		element_Click(visitorPassStatusReport);
	}
	
	//Kamal
	public void gotoExpiredPassesReport() throws InterruptedException {
		gotoVisitorPassReport();
		Thread.sleep(1000);
		element_Click(expiredPassesReport);
	}
	
	//Kamal
	public void gotoVisitorWatchBlackListReport() throws InterruptedException {
		gotoVisitorSummaryReport();
		Thread.sleep(1000);
		element_Click(visitorWatchlistBlacklistReport);
	}
	
	//Kamal
	public void gotoPreRegisterVisitorsReport() throws InterruptedException {
		gotoVisitorSummaryReport();
		Thread.sleep(1000);
		element_Click(preregisteredVisitorReport);
	}
	
	//Kamal
	public void gotoVisitorHistoryReport() throws InterruptedException {
		gotoVisitorSummaryReport();
		Thread.sleep(1000);
		element_Click(visitorHistoryReport);
	}
	
	//Kamal
	public void gotoVisitorHeadCountReport() throws InterruptedException {
		gotoVisitorSummaryReport();
		Thread.sleep(1000);
		element_Click(visitorHeadCountReport);
	}
	
	public void goToVisitorEventsPage() {
		element_Click(utilities);
		element_Click(visitorEventsPage);
	}
	
	public void goToVisitorHistoryPage() {
		element_Click(utilities);
		element_Click(visitorHistoryPage);
	}
	
	public void goToAuthorizedHostUsersPage() {
		element_Click(utilities);
		element_Click(authorizedHostUsersPage);
	}
	
	public void goToFormSummaryPage() {
		element_Click(formSummaryPage);
	}
	
	public void goToImportPage() {
		element_Click(utilities);
		element_Click(importPage);
	}
	
	public void goToPreRegistrationTemplatePage() {
		element_Click(templatesTab);
		element_Click(preRegistrationTemplatePage);
	}
}
