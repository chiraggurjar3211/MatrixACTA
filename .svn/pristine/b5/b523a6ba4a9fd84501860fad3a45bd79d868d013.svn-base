package PageObject.ESSLogin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class EssPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssPO.class);
	public EssPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "Group Details")
	private WebElement groupDetails;

	@FindBy(xpath = "//*[@class=\"dashboard-div dashboard-div-12row dashboard-div-maxwid form-hr ess-dashboard-13\"]//mx-label[not(contains(@Key,'Pending Approvals/A'))]")
	private List<WebElement> ricDashboardElements;

	@FindBy(id = "12073")
	private WebElement assignAwardPenaltyHours;

	// Mark Punch
	@FindBy(xpath = "//label[contains(@id,'inClick') or contains(@id,'in_Click')]")
	private List<WebElement> markInLabels;

	@FindBy(xpath = "//label[contains(@id,'out_Click')]")
	private List<WebElement> markOutLabels;

	@FindBy(xpath = "//*[@id=\"id-punchInClick\"]")
	private WebElement markInClick;

	@FindBy(xpath = "//*[@id=\"id-punchInClick\"]")
	private List<WebElement> markInClicks;

	@FindBy(xpath = "//*[@id=\"id-punchOutClick\"]")
	private WebElement markOutClick;

	@FindBy(xpath = "//*[@id=\"id-punchOutClick\"]")
	private List<WebElement> markOutClicks;

	@FindBy(xpath = "//*[@class='modal-content']")
	private List<WebElement> punchConfirmPopup;

	@FindBy(xpath = "//*[@class='modal-content']//label[@key='lblPunchConfirmation']")
	private WebElement punchConfirmMsg;

	@FindBy(xpath = "//*[@class='modal-content']//input[@key='btnPunchConfirmOK']")
	private WebElement punchConfirmOkBtn;

	// Elements by chhaya
	@FindBy(id = "Job Costing")
	private WebElement jobCostingTab;

	@FindBy(id = "12071")
	private WebElement tsCorrectionAppTab;

	@FindBy(xpath = "//*[@class='active' and @id='Approval/Authorization']")
	private List<WebElement> approvalAuthorization;
	
	@FindBy(id = "Approval/Authorization")
	private WebElement approvalAuthorizationTab;

	@FindBy(id = "12060")
	private WebElement tsCorrectionAuthoTab;

	@FindBy(id = "FVM")
	private WebElement essFVM;

	@FindBy(id = "12079")
	private WebElement fieldVisitScheduleOption;

	@FindBy(id = "12080")
	private WebElement fieldVisitStatusOption;

	@FindBy(id = "12078")
	private WebElement fieldVisitCorrectionOption;

	@FindBy(id = "12076")
	private WebElement fieldVisitCorrApprovTab;

	@FindBy(id = "12065")
	private WebElement awardPenaltyAuthTab;

	@FindBy(id = "Health")
	private WebElement healthTab;

	@FindBy(id = "12110")
	private WebElement selfDeclarationTab;

	@FindBy(id = "Leave Management")
	private WebElement leaveManagementTab;

	@FindBy(xpath = "//*[@class='active' and @id='Leave Management']")
	private List<WebElement> leaveManagement;

	@FindBy(id = "12019")
	private WebElement leaveApplicationPage;

	@FindBy(id = "12020")
	private WebElement tourApplicationPage;

	@FindBy(id = "Visitor Management")
	private WebElement visitorManagementTab;

	@FindBy(id = "12088")
	private WebElement inviteVisitorPage;

	@FindBy(id = "12005")
	private WebElement visitorPreRegistrationPage;

	@FindBy(id = "12086")
	private WebElement visitApprovalPage;

	@FindBy(id = "12047")
	private WebElement visitRegistrationApprovalPage;

	@FindBy(id = "12021")
	private WebElement cOffApplicationPage;

	@FindBy(id = "12018")
	private WebElement leaveBalancePage;

	@FindBy(id = "CWM")
	private WebElement cwmTab;

	@FindBy(id = "12056")
	private WebElement inductionApprovalPage;

	@FindBy(xpath = "//*[@class=\"active\" and @id=\"Time Attendance\" ]")
	private List<WebElement> timeAttendance;

	@FindBy(id = "Time Attendance")
	private WebElement timeAttendenceTab;

	@FindBy(id = "12050")
	private WebElement dailyAttendence;

	@FindBy(xpath = "//*[@default=\"Template Configuration\"]")
	private WebElement templateConfiguartion;

	@FindBy(xpath = "//*[@default=\"View\"]")
	private WebElement viewPage;
	
	@FindBy(id = "Basic")
	private WebElement basicTab;
	
	@FindBy(id = "12002")
	private WebElement eventPage;

	@FindBy(id = "12092")
	private WebElement advanceOvertimeApplication;
	
	@FindBy(id = "12011")
	private WebElement attendanceCorrection;
	
	@FindBy(id = "12010")
	private WebElement shortLeaveOfficialInOut;
	
	@FindBy(id = "12033")
	private WebElement overtimeCOffAuthrizationTab;
	
	@FindBy(id = "12008")
	private WebElement attendanceDetailsTab;
	
	@FindBy(id = "btnJobSelectionOK")
	private WebElement selectJobPopupOKBtn;
	
	@FindBy(id = "selJobCode")
	private WebElement selectJobDD;
	
	@FindBy(id = "12140")
	private WebElement shiftChangeApplication;
	
	@FindBy(id = "Cafeteria")
	private WebElement cafeteriaTab;
	
	@FindBy(id = "12045")
	private WebElement trnCorrectionPage;
	
	@FindBy(id = "12083")
	private WebElement preOrderMealsPage;
	
	
	
	////////////////////////

	//////////// Functions Start/////////////

	public void goToAssignAwardPenaltyHours() {
		element_Click(groupDetails);
		element_Click(assignAwardPenaltyHours);
	}

	public void goToTimeSheetCorrectionApp() {
		element_Click(jobCostingTab);
		element_Click(tsCorrectionAppTab);
	}

	public void goToTimeSheetCorrectionAuthorization() throws InterruptedException {
		if (approvalAuthorization.size() == 0) {
			element_Click(approvalAuthorizationTab);
			Thread.sleep(1000);
		}
		element_Click(tsCorrectionAuthoTab);
	}

	public ArrayList<String> markPunchesAvialables() throws InterruptedException {
		ArrayList<String> markLabels = new ArrayList<>();
		if (markInClicks.size() > 0) {
			element_Click(markInClick);
			Thread.sleep(1000);
			for (WebElement ele : markInLabels) {
				String label = ele.getText();
				markLabels.add(label);
			}
			Thread.sleep(1000);
			element_Click(markInClick);
		}
		if (markOutClicks.size() > 0) {
			Thread.sleep(1000);
			element_Click(markOutClick);
			Thread.sleep(1000);
			for (WebElement ele : markOutLabels) {
				String label = ele.getText();
				markLabels.add(label);
			}
			Thread.sleep(1000);
			element_Click(markOutClick);
		}
		logger.debug(markLabels);
		return markLabels;
	}

	public void markPunchVerify(Map<String, String> data, ArrayList<String> markLabels) throws InterruptedException {
		Boolean actualValidate = false;
		if (markLabels.contains(data.get("SpecialFunction"))) {
			actualValidate = true;
		}
		Boolean expectedValidate = Boolean.parseBoolean(data.get("Validate"));
		Assert.assertEquals(actualValidate, expectedValidate);
	}

	public void markPunchViaESS(Map<String, String> data) throws InterruptedException {
		String markPunch = data.get("SpecialFunction");
		if (markInClicks.size() > 0) {
			element_Click(markInClick);
			Thread.sleep(1000);
			if(data.get("Job") != null && data.get("PunchConfirmationMessage") != null) {
				for (WebElement ele : markInLabels) {
					String label = ele.getText();
					if (label.equalsIgnoreCase(markPunch)) {
						JavascriptExecutor jse = (JavascriptExecutor) driver;
						jse.executeScript("arguments[0].click();", ele);
						pageLoadWaitng();
						Thread.sleep(1000);
						element_DropDownSelectByvisibleText(selectJobDD, data.get("Job"));
						Thread.sleep(500);
						element_Click(selectJobPopupOKBtn);
						Thread.sleep(1500);
						String actualMsg1 = punchConfirmMsg.getText();
						element_Click(punchConfirmOkBtn);
						Thread.sleep(1000);
						Assert.assertEquals(actualMsg1, data.get("PunchConfirmationMessage"));
						break;
					}
				}
			}else {
				for (WebElement ele : markInLabels) {
					String label = ele.getText();
					if (label.equalsIgnoreCase(markPunch)) {
						JavascriptExecutor jse = (JavascriptExecutor) driver;
						jse.executeScript("arguments[0].click();", ele);

						pageLoadWaitng();
						String actualMsg = punchConfirmMsg.getText();
						element_Click(punchConfirmOkBtn);
						// Regular IN punch submitted successfully
						String expectedMsg = markPunch + " punch submitted successfully";
						Assert.assertEquals(actualMsg, expectedMsg);
						break;
					}
				}
			}
			Thread.sleep(1000);
			element_Click(markInClick);
		}
		if (markOutClicks.size() > 0) {
			Thread.sleep(1000);
			element_Click(markOutClick);
			Thread.sleep(1000);
			if(data.get("Job") != null && data.get("PunchConfirmationMessage") != null) {
				for (WebElement ele : markOutLabels) {
					String label = ele.getText();
					if (label.equalsIgnoreCase(markPunch)) {
						JavascriptExecutor jse = (JavascriptExecutor) driver;
						jse.executeScript("arguments[0].click();", ele);
						pageLoadWaitng();
						Thread.sleep(1000);
						element_DropDownSelectByvisibleText(selectJobDD, data.get("Job"));
						Thread.sleep(500);
						element_Click(selectJobPopupOKBtn);
						Thread.sleep(1500);
						String actualMsg1 = punchConfirmMsg.getText();
						element_Click(punchConfirmOkBtn);
						Thread.sleep(1000);
						Assert.assertEquals(actualMsg1, data.get("PunchConfirmationMessage"));
						break;
					}
				}
			}else {
				for (WebElement ele : markOutLabels) {
					String label = ele.getText();
					if (label.equalsIgnoreCase(markPunch)) {
						JavascriptExecutor jse = (JavascriptExecutor) driver;
						jse.executeScript("arguments[0].click();", ele);
						pageLoadWaitng();
						String actualMsg = punchConfirmMsg.getText();
						element_Click(punchConfirmOkBtn);
						// Regular IN punch submitted successfully
						String expectedMsg = markPunch + " punch submitted successfully";
						Assert.assertEquals(actualMsg, expectedMsg);
						break;
					}
				}
			}
			Thread.sleep(1000);
			element_Click(markOutClick);
		}
	}

	// chhaya
	public void essFieldVisitSchedule() {
		element_Click(essFVM);
		element_Click(fieldVisitScheduleOption);
	}

	// chhaya
	public void essFieldVisitStatus() {
		element_Click(essFVM);
		element_Click(fieldVisitStatusOption);
	}

	// chhaya
	public void essFieldVisitCorrection() {
		element_Click(essFVM);
		element_Click(fieldVisitCorrectionOption);
	}

	// chhaya
	public void goToFieldVisitCorretionApproval() throws InterruptedException {
		if (approvalAuthorization.size() == 0) {
			element_Click(approvalAuthorizationTab);
		}
		Thread.sleep(1000);
		element_Click(fieldVisitCorrApprovTab);
	}

	// chhaya
	public void goToAwardPenaltyAuthorization() {
		if (approvalAuthorization.size() == 0) {
			element_Click(approvalAuthorizationTab);
		}
		element_Click(awardPenaltyAuthTab);
	}

	// By Chhaya
	public void goToSelfDeclarationPage() throws InterruptedException {
		element_Click(healthTab);
		element_Click(selfDeclarationTab);
	}

	// By Chhaya
	public void goToLeaveApplicationPage() throws InterruptedException {
		if (leaveManagement.size() == 0) {
			element_Click(leaveManagementTab);
		}
		element_Click(leaveApplicationPage);
	}

	// Chhaya
	public void goToApproveRejectPage(String pageName) throws InterruptedException {
		waitForElementVisible(quickLinksForESS);
		for (int i = 0; i < ricDashboardElements.size(); i++) {
			String getDashboardElement = ricDashboardElements.get(i).getText();
			if (getDashboardElement.equalsIgnoreCase(pageName)) {
				ricDashboardElements.get(i).click();
				break;
			}
		}
	}

	// By Mayank
	public void goToInviteVisitorPage() throws InterruptedException {
		Thread.sleep(1000);
		if (visitorManagementTab.getAttribute("aria-expanded").equalsIgnoreCase("false")) {
			element_Click(visitorManagementTab);
		}
		Thread.sleep(1000);
		element_Click(inviteVisitorPage);
	}

	// By Chhaya
	public void goToTourApplicationPage() throws InterruptedException {
		if (leaveManagement.size() == 0) {
			element_Click(leaveManagementTab);
		}
		element_Click(tourApplicationPage);
	}

	// Mayank
	public void goToVisitorPreRegistrationPage() throws InterruptedException {
		element_Click(visitorManagementTab);
		element_Click(visitorPreRegistrationPage);
	}

	public void goToVisitApprovalPage() throws InterruptedException {
		element_Click(visitorManagementTab);
		element_Click(visitApprovalPage);
	}

	public void goToVisitRegistrationApproval() {
		if (approvalAuthorization.size() == 0) {
			element_Click(approvalAuthorizationTab);
		}
		element_Click(visitRegistrationApprovalPage);
	}

	// By Chhaya
	public void goToCOffApplicationPage() throws InterruptedException {
		if (leaveManagement.size() == 0) {
			element_Click(leaveManagementTab);
		}
		element_Click(cOffApplicationPage);
	}

	// By Chhaya
	public void goToLeaveBalancePage() throws InterruptedException {
		if (leaveManagement.size() == 0) {
			element_Click(leaveManagementTab);
		}
		Thread.sleep(1000);
		element_Click(leaveBalancePage);
	}

	public void goToInductionApprovalPage() throws InterruptedException {
		element_Click(cwmTab);
		element_Click(inductionApprovalPage);
	}

	public void gotoDailyAttendence_TemplateConfiguration() throws InterruptedException {
		if (timeAttendance.size() == 0) {
			element_Click(timeAttendenceTab);
		}
		Thread.sleep(1000);
		element_Click(dailyAttendence);
		Thread.sleep(1000);
		element_Click(templateConfiguartion);
	}

	public void gotoDailyAttendence_ViewPage() throws InterruptedException {
		if (timeAttendance.size() == 0) {
			element_Click(timeAttendenceTab);
		}
		element_Click(dailyAttendence);
		element_Click(viewPage);
	}

	public void goToEventPage() throws InterruptedException {
		element_Click(basicTab);
		element_Click(eventPage);
	}
	
	public void goToAdvanceOvertimeApplicationPage() throws InterruptedException {
		if (timeAttendance.size() == 0) {
			element_Click(timeAttendenceTab);
		}
		Thread.sleep(1000);
		element_Click(advanceOvertimeApplication);
	}
	
	public void goToAttendanceCorrectionPage() throws InterruptedException {
		if (timeAttendance.size() == 0) {
			element_Click(timeAttendenceTab);
		}
		Thread.sleep(1000);
		element_Click(attendanceCorrection);
	}
	
	public void goToshortLeaveOfficialInOut() throws InterruptedException {
		if (timeAttendance.size() == 0) {
			element_Click(timeAttendenceTab);
		}
		Thread.sleep(1000);
		element_Click(shortLeaveOfficialInOut);
	}
	
	//Chhaya
	public void goToOvertimeCOFFAuthorizationPage() throws InterruptedException {
		if (approvalAuthorization.size() == 0) {
			element_Click(approvalAuthorizationTab);
		}
		Thread.sleep(1000);
		element_Click(overtimeCOffAuthrizationTab);
	}
	
	//Chhaya
	public void goToAttendanceDetailsPage() throws InterruptedException {
		if (timeAttendance.size() == 0) {
			element_Click(timeAttendenceTab);
		}
		Thread.sleep(1000);
		element_Click(attendanceDetailsTab);
	}
	
	//Chhaya
	public void goToShiftChangeApplicationPage() throws InterruptedException {
		if (timeAttendance.size() == 0) {
			element_Click(timeAttendenceTab);
		}
		element_Click(shiftChangeApplication);
	}
	
	
	public void goToTrnCorrectionPage() throws InterruptedException {
		Thread.sleep(1000);
		element_Click(cafeteriaTab);
		Thread.sleep(1000);
		element_Click(trnCorrectionPage);
	}
	
	public void goToPreOrderMealsPage() throws InterruptedException {
		Thread.sleep(1000);
		if (cafeteriaTab.getAttribute("aria-expanded").equalsIgnoreCase("false")) {
			element_Click(cafeteriaTab);
		}
		Thread.sleep(1000);
		element_Click(preOrderMealsPage);
	}
	
}
