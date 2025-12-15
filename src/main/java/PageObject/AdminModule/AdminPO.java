package PageObject.AdminModule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class AdminPO extends AbstractMethod {
	WebDriver driver;

	public AdminPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements ////////////////////////////
	@FindBy(id = "System Configuration")
	private WebElement systemConfigurationTab;

	@FindBy(id = "System Utilities")
	private WebElement systemUtilitiesTab;

	@FindBy(id = "1003")
	private WebElement globalPolicy;

	@FindBy(id = "1001")
	private WebElement systemAccount;

	@FindBy(id = "Views/Logs")
	private WebElement viewsLogsTab;

	@FindBy(id = "1024")
	private WebElement alertView;

	@FindBy(id = "1098")
	private WebElement smsConfig;

	@FindBy(id = "1099")
	private WebElement emailConfig;

	@FindBy(id = "1007")
	private WebElement alertMsgConfig;

	@FindBy(id = "1017")
	private WebElement taskSchedulerPage;

	@FindBy(id = "1028")
	private WebElement locationMasterPage;

	@FindBy(id = "1018")
	private WebElement reportScheduler;

	@FindBy(id = "1025")
	private WebElement schedulerLog;

	@FindBy(id = "1012")
	private WebElement exportData;

	@FindBy(id = "1102")
	private WebElement formBuilderPage;

	// By Chhaya
	@FindBy(id = "1011")
	private WebElement importData;

	// By Chhaya
	@FindBy(id = "1005")
	private WebElement renameGroupPage;

	// By Chhaya
	@FindBy(id = "1020")
	private WebElement messageBoardPage;
	
	@FindBy(id = "1101")
	private WebElement agreementBuilderPage;
	
	// Mayank
	@FindBy(id = "1105")
	private WebElement whatsappConfigurationPage;
	
	@FindBy(id="1029")
	private WebElement identificationServerConfiguration;	
	
	@FindBy(id="1006")
	private WebElement enterpriseProfilePage;	

	////////////////////////////////////////
	public void goToGlobalPolicy() {
		element_Click(systemConfigurationTab);
		element_Click(globalPolicy);
	}

	public void goToSystemAccount() {
		element_Click(systemAccount);
	}

	public void goToAlertView() {
		element_Click(viewsLogsTab);
		element_Click(alertView);
	}

	public void goToSMSConfiguration() throws InterruptedException {
		Thread.sleep(2000);
		element_Click(systemConfigurationTab);
		element_Click(smsConfig);
	}

	public void goToEmailConfiguration() {
		element_Click(systemConfigurationTab);
		element_Click(emailConfig);
	}

	public void goToAlertMessageConfiguration() {
		element_Click(systemConfigurationTab);
		element_Click(alertMsgConfig);
	}

	public void goToTaskScheduler() {
		element_Click(systemUtilitiesTab);
		element_Click(taskSchedulerPage);
	}

	public void goToLocationMaster() {
		element_Click(systemConfigurationTab);
		element_Click(locationMasterPage);
	}

	public void goToReportScheduler() {
		element_Click(systemUtilitiesTab);
		element_Click(reportScheduler);
	}

	public void goToSchedulerLog() {
		element_Click(viewsLogsTab);
		element_Click(schedulerLog);
	}

	public void goToExportData() {
		element_Click(systemUtilitiesTab);
		element_Click(exportData);
	}

	public void goToFormBuilderPage() {
		element_Click(systemConfigurationTab);
		element_Click(formBuilderPage);
	}

	// By Chhaya
	public void goToImportData() {
		element_Click(systemUtilitiesTab);
		element_Click(importData);
	}

	// By Chhaya
	public void goToRenameGroupPage() throws InterruptedException {
		element_Click(systemConfigurationTab);
		element_Click(renameGroupPage);
	}

	// By Chhaya
	public void goToMessageBoard() {
		element_Click(systemUtilitiesTab);
		element_Click(messageBoardPage);
	}
	
	public void goToAgreementBuilderPage() {
		element_Click(systemConfigurationTab);
		element_Click(agreementBuilderPage);
	}
	
	public void goToWhatsappConfiguration() {
		element_Click(systemConfigurationTab);
		element_Click(whatsappConfigurationPage);
	}
	
	public void goToIdentificationServerConfiguration() {
		element_Click(systemConfigurationTab);
		element_Click(identificationServerConfiguration);
	}
	
	public void goToEnterpriseProfilePage() {
		element_Click(systemConfigurationTab);
		element_Click(enterpriseProfilePage);
	}

}
