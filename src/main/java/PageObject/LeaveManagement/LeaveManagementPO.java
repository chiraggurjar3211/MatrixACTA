package PageObject.LeaveManagement;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class LeaveManagementPO extends AbstractMethod {
	WebDriver driver;

	// Created by Mayank
	public LeaveManagementPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "Application/Approval")
	private WebElement applicationApproval;

	@FindBy(id = "4010")
	private WebElement leaveApplication;
	
	@FindBy(id = "4011")
	private WebElement tourApplication;

	@FindBy(id = "4013")
	private WebElement leaveApproval;
	
	@FindBy(id = "4014")
	private WebElement tourApproval;
	
	@FindBy(id = "4015")
	private WebElement coffApproval;

	@FindBy(id = "Balance Management")
	private WebElement balanceManagement;

	@FindBy(id = "4006")
	private WebElement creditDebitEncashment;

	@FindBy(id = "4001")
	private WebElement leave;

	@FindBy(id = "4002")
	private WebElement tour;

	@FindBy(id = "4003")
	private WebElement leaveGroup;

	@FindBy(id = "4004")
	private WebElement accrualPolicy;

	@FindBy(id = "4017")
	private WebElement leaveBalance;

	@FindBy(id = "View")
	private WebElement viewTab;

	@FindBy(id = "4027")
	private WebElement cOffEncashment;

	@FindBy(id = "4007")
	private WebElement overflowManagement;

	@FindBy(id = "Process")
	private WebElement process;

	@FindBy(id = "4034")
	private WebElement leaveBalanceProcess;

	// Kamal
	@FindBy(id = "Reports")
	private WebElement report;

	@FindBy(id = "4019")
	private WebElement leaveReport;

	@FindBy(id = "4020")
	private WebElement leaveGroupReport;

	@FindBy(id = "4021")
	private WebElement leaveApplicationReport;

	@FindBy(id = "4022")
	private WebElement leaveEncashmentReport;

	@FindBy(id = "4023")
	private WebElement leaveCreditDebitReport;

	@FindBy(id = "4024")
	private WebElement leaveRegisterReport;

	@FindBy(id = "4025")
	private WebElement CoffRegisterReport;

	@FindBy(id = "4026")
	private WebElement monthlyLeaveDetialsReport;

	@FindBy(xpath = "//*[@data-bs-target='#4028']")
	private WebElement statutoryLeaveReports;

	@FindBy(id = "4029")
	private WebElement formBReport;

	@FindBy(id = "4030")
	private WebElement form15Report;

	@FindBy(id = "4035")
	private WebElement formQReport;
	// end Kamal

	// Chhaya
	@FindBy(id = "Exports")
	private WebElement exportsTab;

	@FindBy(id = "4032")
	private WebElement leaveRegisterPage;

	@FindBy(id = "4008")
	private WebElement importLeaveBalancePage;
	
	@FindBy(id = "4012")
	private WebElement coffApplicationPage;

	// Functions

	public void goToLeaveApplication() {
		element_Click(applicationApproval);
		element_Click(leaveApplication);
	}

	public void goToLeaveApproval() {
		element_Click(applicationApproval);
		element_Click(leaveApproval);
	}

	public void goToCreditDebitEncashment() {
		element_Click(balanceManagement);
		element_Click(creditDebitEncashment);
	}

	public void goToLeave() {
		element_Click(leave);
	}

	public void goTOLeaveGroup() {
		element_Click(leaveGroup);
	}

	public void goToLeaveBalance() {
		element_Click(viewTab);
		element_Click(leaveBalance);
	}

	// Methods by Chhaya
	public void goToTour() {
		element_Click(tour);
	}

	public void goToAccrualPolicy() {
		element_Click(accrualPolicy);
	}

	public void goToCOffEncashmentPage() {
		element_Click(balanceManagement);
		element_Click(cOffEncashment);
	}

	public void goToOverflowManagementPage() {
		element_Click(balanceManagement);
		element_Click(overflowManagement);
	}

	public void goToLeaveBalanceProcessPage() {
		element_Click(process);
		element_Click(leaveBalanceProcess);
	}
	/////////////////////

	// Kamal
	public void gotoReports() {
		element_Click(report);
	}

	// Kamal
	public void gotoLeaveReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(leaveReport);
	}

	// Kamal
	public void gotoLeaveGroupReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(leaveGroupReport);
	}

	// Kamal
	public void gotoLeaveApplicationReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(leaveApplicationReport);
	}

	// Kamal
	public void gotoLeaveEncashmentReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(leaveEncashmentReport);
	}

	// Kamal
	public void gotoLeaveCreditDebitReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(leaveCreditDebitReport);
	}

	// Kamal
	public void gotoLeaveRegisterReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(leaveRegisterReport);
	}

	// Kamal
	public void gotoCoffRegisterReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(CoffRegisterReport);
	}

	// Kamal
	public void gotoMonthlyLeaveDetialsReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(monthlyLeaveDetialsReport);
	}

	// Kamal
	public void gotostatutoryLeaveReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(statutoryLeaveReports);
	}

	// Kamal
	public void gotoFormBReport() throws InterruptedException {
		gotostatutoryLeaveReport();
		Thread.sleep(1000);
		element_Click(formBReport);
	}

	// Kamal
	public void gotoForm15Report() throws InterruptedException {
		gotostatutoryLeaveReport();
		Thread.sleep(1000);
		element_Click(form15Report);
	}

	// Kamal
	public void gotoFormQReport() throws InterruptedException {
		gotostatutoryLeaveReport();
		Thread.sleep(1000);
		element_Click(formQReport);
	}

	// by Chhaya
	public void goToLeaveRegisterPage() {
		element_Click(exportsTab);
		element_Click(leaveRegisterPage);
	}

	// by Chhaya
	public void goToImportLeaveBalancePage() {
		element_Click(balanceManagement);
		element_Click(importLeaveBalancePage);
	}
	
	//Chhaya
	public void goToCOFFApplication() {
		element_Click(applicationApproval);
		element_Click(coffApplicationPage);
	}
	
	public void goToTourApproval() {
		element_Click(applicationApproval);
		element_Click(tourApproval);
	}
	
	public void goToCoffApproval() {
		element_Click(applicationApproval);
		element_Click(coffApproval);
	}
	
	public void goToTourApplication() {
		element_Click(applicationApproval);
		element_Click(tourApplication);
	}

}
