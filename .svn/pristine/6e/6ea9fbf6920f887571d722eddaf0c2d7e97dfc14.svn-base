package PageObject.FieldVisitManagement;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class FieldVisitManagementPO extends AbstractMethod {
	WebDriver driver;

	public FieldVisitManagementPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "17010")
	private WebElement taskPage;
	
	@FindBy(id = "17020")
	private WebElement FieldVisitSchedulePage;
	
	@FindBy(id = "Utilities")
	private WebElement utilities;
	
	@FindBy(id = "17040")
	private WebElement fieldVisitStatusPage;
	
	@FindBy(id = "17050")
	private WebElement fieldVisitCorrectionPage;
	
	@FindBy(id = "17060")
	private WebElement fieldVisitCorrectionAuthorizationPage;
	
	@FindBy(id = "Reports")
	private WebElement reports;
	
	@FindBy(id = "17080")
	private WebElement scheduleStatusSummaryReport;
	
	@FindBy(id = "17090")
	private WebElement fieldVisitSummaryReport;
	
	//////////////////
	
	public void goToTask() {
		element_Click(taskPage);
	}
	
	public void goToFieldVisitSchedule() {
		element_Click(FieldVisitSchedulePage);
	}
	
	//chhaya
	public void goToFieldVisitStatus() {
		element_Click(utilities);
		element_Click(fieldVisitStatusPage);
	}
	
	//chhaya
	public void goToFieldVisitCorrection() {
		element_Click(utilities);
		element_Click(fieldVisitCorrectionPage);
	}
	
	//chhaya
	public void goToFieldVisitCorrectionAuthorization() {
		element_Click(utilities);
		element_Click(fieldVisitCorrectionAuthorizationPage);
	}
	
	public void gotoReports() {
		element_Click(reports);
	}
	
	public void  gotoScheduleStatusSummaryReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(scheduleStatusSummaryReport);
	}
	
	public void gotoFieldVisitSummaryReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(fieldVisitSummaryReport);
	}
}
