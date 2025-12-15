package PageObject.UserModule;

import java.util.List;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class UserPO extends AbstractMethod {
	WebDriver driver;

	public UserPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "7002")
	private WebElement userConfiguration;

	@FindBy(id = "Utilities")
	private WebElement utilities;

	@FindBy(id = "7016")
	private WebElement deleteUsers;

	@FindBy(id = "Reporting In-Charge")
	private WebElement reportingInCharge;

	@FindBy(id = "7011")
	private WebElement reportingGroup;
	
	@FindBy(id = "7063")
	private WebElement approvalPolicy;

	@FindBy(id = "7048")
	private WebElement essRoleRights;

	@FindBy(id = "Reports")
	private WebElement reports;

	@FindBy(xpath = "//*[@id='7018']/li")
	private List<WebElement> reportsLists;

	@FindBy(id = "7040")
	private WebElement inOutEventReport;

	@FindBy(id = "7041")
	private WebElement inOutSummaryReport;

	@FindBy(id = "7042")
	private WebElement accessDeniedReport;

	@FindBy(id = "7043")
	private WebElement doorAccessbyUser;

	@FindBy(id = "7044")
	private WebElement doorUsageReport;

	@FindBy(id = "7045")
	private WebElement whoIsInReport;

	@FindBy(id = "7046")
	private WebElement outTimeReport;

	@FindBy(id = "7047")
	private WebElement userEventIntervalReport;

	@FindBy(id = "7035")
	private WebElement formerUsersReport;

	@FindBy(id = "7060")
	private WebElement newJoiningReport;

	@FindBy(id = "7036")
	private WebElement pendingConformrionReport;

	@FindBy(id = "7037")
	private WebElement reportingGroupsReport;

	@FindBy(id = "7038")
	private WebElement userWithoutReportingInchargeReport;

	@FindBy(id = "7059")
	private WebElement userWisePolicyAssignmentReport;

	@FindBy(id = "7025")
	private WebElement accessProfileReport;

	@FindBy(id = "7026")
	private WebElement personalInfoReport;

	@FindBy(id = "7027")
	private WebElement contactInfoReport;

	@FindBy(id = "7028")
	private WebElement officalInfoReport;

	@FindBy(id = "7029")
	private WebElement retirementInfoReport;

	@FindBy(id = "7030")
	private WebElement enrollmentInfoReport;

	@FindBy(id = "7033")
	private WebElement changeGroupReport;

	@FindBy(id = "7064")
	private WebElement biometricEnrollmentReport;

	@FindBy(id = "7055")
	private WebElement blacklistUsersPage;

	@FindBy(id = "7051")
	private WebElement userEventsPage;

	@FindBy(id = "7020")
	private WebElement panelWiseUsersReport;

	@FindBy(id = "7021")
	private WebElement doorWiseUsersReport;

	@FindBy(id = "7022")
	private WebElement userWiseControllersReport;

	@FindBy(id = "7023")
	private WebElement blockedUsersReport;

	@FindBy(id = "7062")
	private WebElement deviceAssignmentInformationReport;

	@FindBy(id = "Multi-User Options")
	private WebElement multiUserOption;

	@FindBy(id = "7061")
	private WebElement moduleConfigPage;

	@FindBy(id = "7076")
	private WebElement inviteUserPage;

	@FindBy(id = "7015")
	private WebElement changeGroupPage;

	@FindBy(id = "7058")
	private WebElement changeUserIDPage;

	@FindBy(xpath = "//*[@id='7013']/li")
	private List<WebElement> utilitiesLists;

	@FindBy(id = "7071")
	private WebElement healthDeclarationPage;

	@FindBy(id = "7072")
	private WebElement healthRecordsPage;

	@FindBy(id = "7014")
	private WebElement importUserPage;

	@FindBy(id = "7074")
	private WebElement importHlthDeclarPage;
	
	@FindBy(id = "7004")
	private WebElement multiUserConfigPage;
	
	@FindBy(id = "7005")
	private WebElement userOnDevicePage;

	/////////////////

	public void goToUserConfiguration() {
		element_Click(userConfiguration);
	}

	public void goToDeleteUsers() {
		element_Click(utilities);
		element_Click(deleteUsers);
	}

	public void goToReportingGroup() {
		element_Click(reportingInCharge);
		element_Click(reportingGroup);
	}

	public void goToESSRolesRights() {
		element_Click(utilities);
		element_Click(essRoleRights);
	}

	public void goToInOutEventReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Events")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(inOutEventReport);
	}

	public void goToInOutSummaryReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Events")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(inOutSummaryReport);
	}

	public void goToAccessDeniedReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Events")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(accessDeniedReport);
	}

	// Kamal
	public void gotoDoorAccessbyUser() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Events")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(doorAccessbyUser);

	}

	// Kamal
	public void gotoDoorUsage() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Events")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(doorUsageReport);

	}

	// Kamal
	public void gotoWhoIsInReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Events")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(whoIsInReport);

	}

	// Kamal
	public void gotoOutTimeReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Events")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(outTimeReport);

	}

	// Kamal
	public void gotoUserEventIntervalReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Events")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(userEventIntervalReport);

	}

	// Kamal
	public void gotoFormerUsersReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("Others")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(formerUsersReport);
	}

	// Kamal
	public void gotoNewJoiningReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("Others")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(newJoiningReport);

	}

	// Kamal
	public void gotoPendingConformationReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("Others")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(pendingConformrionReport);

	}

	// Kamal
	public void gotoReportingGroupsReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("Others")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(reportingGroupsReport);

	}

	// Kamal
	public void gotoUserWithoutReportingInchargeReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("Others")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(userWithoutReportingInchargeReport);

	}

	// Kamal
	public void gotoUserWisePolicyAssginmentReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("Others")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(userWisePolicyAssignmentReport);

	}

	// By Chhaya
	public void goToAccessProfileReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Info")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(accessProfileReport);
	}

	// Kamal
	public void goToPersonalInfoReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Info")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(personalInfoReport);
	}

	// By Chhaya
	public void goToContactInfoReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Info")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(contactInfoReport);
	}

	// Kamal
	public void goToOfficalInfoReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Info")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(officalInfoReport);
	}

	// Kamal
	public void goToRetirementInfoReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Info")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(retirementInfoReport);
	}

	// Kamal
	public void goToEnrollmentInfoReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Info")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(enrollmentInfoReport);
	}

	// Kamal
	public void goToChangeGroupReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Info")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(changeGroupReport);
	}

	// Kamal
	public void goToBiometricEnrollmentReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("User Info")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(biometricEnrollmentReport);
	}

	// by Chhaya
	public void goToBlacklistUsers() {
		element_Click(utilities);
		element_Click(blacklistUsersPage);
	}

	// by Chhaya
	public void goToUserEventsPage() {
		element_Click(utilities);
		element_Click(userEventsPage);
	}

	public void gotoPanelWiseUsersReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("Device-Wise Reports")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(panelWiseUsersReport);
	}

	public void gotoDoorWiseUsersReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("Device-Wise Reports")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(doorWiseUsersReport);
	}

	// Kamal
	public void gotoUserWiseControllersReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("Device-Wise Reports")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(userWiseControllersReport);
	}

	// Kamal
	public void gotoBlockedUsersReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("Device-Wise Reports")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(blockedUsersReport);
	}

	// Kamal
	public void gotoDeviceAssignmentInformationReport() throws InterruptedException {
		element_Click(reports);
		Thread.sleep(1000);
		for (int i = 0; i < reportsLists.size(); i++) {
			if (reportsLists.get(i).getText().equalsIgnoreCase("Device-Wise Reports")) {
				reportsLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(deviceAssignmentInformationReport);
	}

	// by Chhaya
	public void goToModuleConfigurationPage() {
		element_Click(multiUserOption);
		element_Click(moduleConfigPage);
	}

	// by Chhaya
	public void goToInviteUserPage() {
		element_Click(utilities);
		element_Click(inviteUserPage);
	}

	// by Chhaya
	public void goToChangeGroupPage() {
		element_Click(utilities);
		element_Click(changeGroupPage);
	}

	// by Chhaya
	public void goToChangeUserIDPage() {
		element_Click(utilities);
		element_Click(changeUserIDPage);
	}

	// by Chhaya
	public void goToHealthDeclarationPage() throws InterruptedException {
		element_Click(utilities);
		Thread.sleep(1000);
		for (int i = 0; i < utilitiesLists.size(); i++) {
			if (utilitiesLists.get(i).getText().equalsIgnoreCase("Health")) {
				utilitiesLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(healthDeclarationPage);
	}

	// by Chhaya
	public void goToHealthRecordsPage() throws InterruptedException {
		element_Click(utilities);
		Thread.sleep(1000);
		for (int i = 0; i < utilitiesLists.size(); i++) {
			if (utilitiesLists.get(i).getText().equalsIgnoreCase("Health")) {
				utilitiesLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(healthRecordsPage);
	}

	// by Chhaya
	public void goToImportHealthDeclarPage() throws InterruptedException {
		element_Click(utilities);
		Thread.sleep(1000);
		for (int i = 0; i < utilitiesLists.size(); i++) {
			if (utilitiesLists.get(i).getText().equalsIgnoreCase("Health")) {
				utilitiesLists.get(i).click();
				break;
			}
		}
		Thread.sleep(1000);
		element_Click(importHlthDeclarPage);
	}

	// by Chhaya
	public void goToImportUsersPage() {
		element_Click(utilities);
		element_Click(importUserPage);
	}
	
	//Chhaya
	public void goToApprovalPolicy() {
		element_Click(reportingInCharge);
		element_Click(approvalPolicy);
	}
	
	public void goToMultiUserConfigurationPage() {
		element_Click(multiUserOption);
		element_Click(multiUserConfigPage);
	}

	public void goToUserOnDevicePage() throws InterruptedException {
		element_Click(multiUserOption);
		Thread.sleep(700);
		element_Click(userOnDevicePage);
	}
	
}
