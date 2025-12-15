package PageObject.JobProcessingCosting;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class JobProcessingCostingPO extends AbstractMethod {
	WebDriver driver;

	public JobProcessingCostingPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "Project Management")
	private WebElement projectManagement;

	@FindBy(id = "16025")
	private WebElement job;

	@FindBy(id = "16045")
	private WebElement phase;

	@FindBy(id = "16055")
	private WebElement project;

	// by Chhaya
	@FindBy(id = "Reports")
	private WebElement reports;

	// by Chhaya
	@FindBy(id = "16240")
	private WebElement userJobDetailsPage;

	// by Chhaya
	@FindBy(xpath = "//*[text() = 'Work Summary']")
	private WebElement workSummary;

	// by Chhaya
	@FindBy(id = "16255")
	private WebElement projectSummary;

	// by Chhaya
	@FindBy(id = "16260")
	private WebElement phaseSummary;

	// by Chhaya
	@FindBy(id = "Utilities")
	private WebElement utilities;
	// by Chhaya
	@FindBy(id = "16130")
	private WebElement timesheetCorrection;
	
	@FindBy(id = "16140")
	private WebElement timesheetCorrectionAutjorization;

	// by Chhaya
	@FindBy(id = "16410")
	private WebElement dailyTimesheetTab;

	// by Chhaya
	@FindBy(id = "Exports")
	private WebElement exportsTab;
	
    @FindBy(id = "16210")
    private WebElement dailyJobDetailsReport;
    
    @FindBy(id = "16220")
    private WebElement monthlyJobDetialsReport;
    
    @FindBy(id = "16230")
    private WebElement jobTransactionReport;
    
    @FindBy(id = "16245")
    private WebElement trasactionWiseHourSummaryReport;
    
    @FindBy(id = "16270")
    private WebElement jobSummaryReport;
	
    @FindBy(id = "16170")
    private WebElement importData;
    
    @FindBy(id = "Job Scheduler")
	private WebElement jobSchedulerTab;

    @FindBy(id = "16082")
    private WebElement jobSchedulerPage;
    
    @FindBy(id = "16084")
    private WebElement schedulerLogsPage;
    
    @FindBy(id = "16083")
    private WebElement jobAssignmentProcessPage;
    
	//
	/////
	public void goToJob() {
		element_Click(projectManagement);
		element_Click(job);
	}

	public void goToPhase() {
		element_Click(projectManagement);
		element_Click(phase);
	}

	public void goToProject() {
		element_Click(projectManagement);
		element_Click(project);
	}

	public void goToUserJobDetails() {
		element_Click(reports);
		element_Click(userJobDetailsPage);
	}

	public void goToProjectSummary() {
		element_Click(reports);
		element_Click(workSummary);
		element_Click(projectSummary);
	}

	public void goToPhaseSummary() {
		element_Click(reports);
		element_Click(workSummary);
		element_Click(phaseSummary);
	}

	public void goToTimesheetCorrection() throws InterruptedException {
		element_Click(utilities);
		Thread.sleep(500);
		element_Click(timesheetCorrection);
	}
	
	//By Chhaya
	public void goToDailyTimesheet() {
		element_Click(exportsTab);
		element_Click(dailyTimesheetTab);
	}
	
	public void gotoReports() {
		element_Click(reports);
	}
	
	public void gotoDailyJobDetialsReports() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(dailyJobDetailsReport);
	}
	
	public void gotoMonthlyJobDetialsReports() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(monthlyJobDetialsReport);
	}
	
	public void gotoJobTrasactionReports() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(jobTransactionReport);
	}
	
	public void gotoUserJobDetialsReports() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(userJobDetailsPage);
	}
	
    public void gotoTrasactionWiseHourSummaryReports() throws InterruptedException {
    	gotoReports();
    	Thread.sleep(1000);
    	element_Click(trasactionWiseHourSummaryReport);
    }
    
    public void gotoJobSummaryReports() throws InterruptedException {
    	gotoReports();
    	Thread.sleep(1000);
    	element_Click(workSummary);
    	Thread.sleep(1000);
    	element_Click(jobSummaryReport);
    }
    
    public void goToImportDataPage() throws InterruptedException {
		element_Click(utilities);
		Thread.sleep(1000);
		element_Click(importData);
	}
    
    public void goToJobScheduler() throws InterruptedException {
		element_Click(jobSchedulerTab);
		Thread.sleep(500);
		element_Click(jobSchedulerPage);
	}
    
    public void goToSchedulerLogs() throws InterruptedException {
		element_Click(jobSchedulerTab);
		Thread.sleep(500);
		element_Click(schedulerLogsPage);
	}
    
    public void goToJobAssignmentProcess() throws InterruptedException {
		element_Click(jobSchedulerTab);
		Thread.sleep(500);
		element_Click(jobAssignmentProcessPage);
	}
    
    public void goToTimesheetCorrectionAutjorization() throws InterruptedException {
		element_Click(utilities);
		Thread.sleep(500);
		element_Click(timesheetCorrectionAutjorization);
	}

}
