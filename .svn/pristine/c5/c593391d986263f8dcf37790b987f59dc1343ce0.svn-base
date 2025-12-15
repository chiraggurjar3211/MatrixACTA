package PageObject.UserModule;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class ApprovalPolicyPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(ApprovalPolicyPO.class);

	public ApprovalPolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Main section Elements
	@FindBy(id = "ApprovalPolicyName")
	private WebElement approvalPolicyNameTxt;

	@FindBy(id = "cmbAuthorizationMode")
	private WebElement authorizationModeDrop;

	@FindBy(id = "ddlRicselection")
	private WebElement reportingInChargeDrop;

	@FindBy(id = "ddlFinalAuth")
	private WebElement finalInchargeDrop;


	@FindBy(xpath = "//*[@class='col-md-4 col-sm-4 col-xs-12 grid']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> policyNames;

	@FindBy(xpath = "//*[@class='btn-group open']//*[@class='dropdown-menu multiSelect MSform-hr']//li/a/span[not(@class='glyphicon green')]/ancestor::a")
	private List<WebElement> commonSelectionXpath;

	@FindBy(xpath = "//table[@id=\"tblOneThenTwo\"]/tbody/tr/td")
	private List<WebElement> autoForwardTable;

	// Exception Elements
	@FindBy(xpath = "//*[@class=\"table table-hover table-striped table-condensed table-bordered master-table\"]/thead/tr/th[1]//label[contains(text(),'Application')]//ancestor::table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> exceptionTable;

	@FindBy(id = "grdDetailDataaddBtn")
	private WebElement plusBtn;

	@FindBy(id = "ddlAuthpages")
	private WebElement applicationsDrop;

	@FindBy(xpath = "//button[@id='ddlLeavetype']")
	private WebElement leaveTypeDrop;

	@FindBy(id = "ddlLeavetype")
	private List<WebElement> leaveTypeDropSize;

	@FindBy(id = "cmbDuration")
	private WebElement custmizeBasedOnDrop;

	@FindBy(xpath = "//*[contains(@id,'txtRangeFrom')]")
	private WebElement fromRangeTxt;

	@FindBy(xpath = "//*[contains(@id,'txtRangeTo')]")
	private WebElement toRangeTxt;

	@FindBy(id = "cmbAuthorizationModeExp")
	private WebElement exceptionAuthModeDrop;

	@FindBy(id = "ddlRicselectionExp")
	private WebElement exceptionsRICDrop;

	@FindBy(id = "ddlFinalAuthExp")
	private WebElement exceptionsFinalInchargeDrop;

	@FindBy(id = "btnAdd")
	private WebElement exceptionsAddBtn;

	@FindBy(xpath = "//*[@class=\"table table-hover table-striped table-condensed table-bordered master-table\"]/thead/tr/th[1]//label[contains(text(),'Application')]//ancestor::div[2]//*[@class=\"pagination-next\"]")
	private List<WebElement> paginationXpath;

	@FindBy(xpath = "//*[@class=\"table table-hover table-striped table-condensed table-bordered master-table\"]/thead/tr/th[1]//label[contains(text(),'Application')]//ancestor::div[2]//*[contains(@class,\"pagination-next \")]")
	private WebElement paginationClick;
	
	
	@FindBy(xpath="//*[@class=\"table table-hover table-striped table-condensed table-bordered master-table\"]/thead/tr[not(@hidden)]/th[not(@hidden)]//label[contains(text(),'Application')]//ancestor::table/tbody/tr/td[not(@hidden)][6]/i")
	private List<WebElement> exceptionDeletedSize;

	@FindBy(xpath="//*[@class=\"table table-hover table-striped table-condensed table-bordered master-table\"]/thead/tr[not(@hidden)]/th[not(@hidden)]//label[contains(text(),'Application')]//ancestor::table/tbody/tr/td[not(@hidden)][6]/i")
	private WebElement exceptionDeletedB;
	
	@FindBy(id="ApprovalPolicyID")
	private WebElement approvalPolicyID;
	/////////////////

	public void createApprovalPolicy(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(approvalPolicyNameTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("PolicyName: " + data.get("PolicyName"));
			String policyName = data.get("PolicyName");
			String authorizationMode = data.get("AuthorizationMode");
			String incharge1 = data.get("In-Charge1");
			String incharge2 = data.get("In-Charge2");
			String incharge3 = data.get("In-Charge3");
			String incharge4 = data.get("In-Charge4");
			String incharge5 = data.get("In-Charge5");
			String finalIncharge = data.get("FinalIn-Charge");
			String validation = data.get("Validation");
			if (element_isEnabled(searchTextBoxTitleBar)) {
				element_InputTextUsingActionClass(searchTextBoxTitleBar, policyName);
				element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
				ArrayList<String> ar = new ArrayList<>();
				Thread.sleep(700);
				if (policyNames.size() > 0) {
					for (int j = 0; j < policyNames.size(); j++) {
						String plcname1 = policyNames.get(j).getText();
						ar.add(plcname1);
						if (plcname1.equalsIgnoreCase(policyName)) {
							policyNames.get(j).click();
						}
					}
				}
				// logger.debug(ar);
				if (!ar.contains(policyName)) {
					addButtonClick();
					element_InputTextUsingActionClass(approvalPolicyNameTxt, policyName);
				}
			} else {
				addButtonClick();
				element_InputTextUsingActionClass(approvalPolicyNameTxt, policyName);
			}
			
			if(exceptionDeletedSize.size()>0) {
				for(int i=0;i<exceptionDeletedSize.size();i++) {
					element_Click(exceptionDeletedB);
					driver.switchTo().alert().accept();
				}
			}
			if (policyName != null) {
				element_Clear(approvalPolicyNameTxt);
				element_InputTextUsingActionClass(approvalPolicyNameTxt, policyName);
				element_TextBoxToClickOnTab(approvalPolicyNameTxt);
			}
			if (authorizationMode != null) {
				element_DropDownSelectByvisibleText(authorizationModeDrop, authorizationMode);
			}
			// Reporting Incharge Selection
			element_Click(reportingInChargeDrop);
			for (int i = 0; i < commonSelectionXpath.size(); i++) {
				String ricN = commonSelectionXpath.get(i).getText();
				for (int j = 0; j < commonSelectionXpath.size(); j++) {
					if (commonSelectionXpath.get(i).findElement(By.xpath("span")).getAttribute("class").contains("-check")) {
						element_Click(commonSelectionXpath.get(i));
					}
				}
				String va = null;
				switch (ricN) {
				case "In-Charge 1":
					if (incharge1 != null) {
						boolean incharge1Bool = Boolean.parseBoolean(incharge1);
						va = commonSelectionXpath.get(i).findElement(By.xpath("span")).getAttribute("class");
						if (incharge1Bool == true) {
							if (!va.contains("-check")) {
								element_Click(commonSelectionXpath.get(i));
							}
						} else {
							if (va.contains("-check")) {
								element_Click(commonSelectionXpath.get(i));
							}
						}
					}
					break;
				case "In-Charge 2":
					if (incharge2 != null) {
						boolean incharge2Bool = Boolean.parseBoolean(incharge2);
						va = commonSelectionXpath.get(i).findElement(By.xpath("span")).getAttribute("class");
						if (incharge2Bool == true) {
							if (!va.contains("-check")) {
								element_Click(commonSelectionXpath.get(i));
							}
						} else {
							if (va.contains("-check")) {
								element_Click(commonSelectionXpath.get(i));
							}
						}
					}
					break;
				case "In-Charge 3":
					if (incharge3 != null) {
						boolean incharge3Bool = Boolean.parseBoolean(incharge3);
						va = commonSelectionXpath.get(i).findElement(By.xpath("span")).getAttribute("class");
						if (incharge3Bool == true) {
							if (!va.contains("-check")) {
								element_Click(commonSelectionXpath.get(i));
							}
						} else {
							if (va.contains("-check")) {
								element_Click(commonSelectionXpath.get(i));
							}
						}
					}
					break;
				case "In-Charge 4":
					if (incharge4 != null) {
						boolean incharge4Bool = Boolean.parseBoolean(incharge4);
						va = commonSelectionXpath.get(i).findElement(By.xpath("span")).getAttribute("class");
						if (incharge4Bool == true) {
							if (!va.contains("-check")) {
								element_Click(commonSelectionXpath.get(i));
							}
						} else {
							if (va.contains("-check")) {
								element_Click(commonSelectionXpath.get(i));
							}
						}
					}
					break;
				case "In-Charge 5":
					if (incharge5 != null) {
						boolean incharge5Bool = Boolean.parseBoolean(incharge5);
						va = commonSelectionXpath.get(i).findElement(By.xpath("span")).getAttribute("class");
						if (incharge5Bool == true) {
							if (!va.contains("-check")) {
								element_Click(commonSelectionXpath.get(i));
							}
						} else {
							if (va.contains("-check")) {
								element_Click(commonSelectionXpath.get(i));
							}
						}
					}
					break;
				default:
					break;
				}
			}
			element_Click(reportingInChargeDrop); // To close the dropdown. Because it affects Final Incharge selection
			// Final Incharge Selection
			if (finalIncharge != null) {
				element_Click(finalInchargeDrop);
				element_DropDownSelectByvisibleText(finalInchargeDrop, finalIncharge);
			}
			////////////
			saveButtonClick();
			String valMsg = validationMessage();
			Assert.assertEquals(valMsg, validation);
			reloadPageButtonClick();
		}
	}

	public void addExceptionInApprovalPlc(String policyName, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(approvalPolicyNameTxt);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, policyName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			if (policyNames.size() > 0) {
				for (int j = 0; j < policyNames.size(); j++) {
					String plcname1 = policyNames.get(j).getText();
					if (plcname1.equalsIgnoreCase(policyName)) {
						policyNames.get(j).click();
						waitForElementDisable(approvalPolicyID);
						break;
					}
				}
			}
		}
		waitForElementDisable(approvalPolicyID);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ApplicationType: " + data.get("ApplicationType"));
			String applicationType = data.get("ApplicationType");
			String leaveIdName = data.get("LeaveIdName");
			String customizeBasedOn = data.get("CustomizeBasedOn");
			String fromRange = data.get("FromRange");
			String toRange = data.get("ToRange");
			String authorizationMode = data.get("AuthorizationMode");
			String reportingInCharge = data.get("ReportingIn-Charge");
			String finalInCharge = data.get("FinalIn-Charge");
			String[] commaSeparatedRIC = null;
			String expApplication = applicationType;
			if (applicationType.equalsIgnoreCase("Paid Leave") || applicationType.equalsIgnoreCase("Unpaid Leave")
					|| applicationType.equalsIgnoreCase("Hourly Paid Leave")
					|| applicationType.equalsIgnoreCase("Hourly Unpaid Leave")
					|| applicationType.equalsIgnoreCase("Restricted Holiday Leave")
					|| applicationType.equalsIgnoreCase("Lay off Leave")
					|| applicationType.equalsIgnoreCase("Tour/ON Duty Tour")
					|| applicationType.equalsIgnoreCase("Compensatory Off Leave")) {
				expApplication = expApplication + " - " + leaveIdName;
			}
			if (exceptionTable.size() > 0) {
				int count = 0;
				int d = 0;
				do {
					if (count != 0) {
						element_Click(paginationClick);
					}
					for (int i = 0; i < exceptionTable.size(); i++) {
						String getApplicationName = exceptionTable.get(i).getText();
						if (getApplicationName.equalsIgnoreCase(expApplication)) {
							d++;
							WebElement deleteBtn = exceptionTable.get(i)
									.findElement(By.xpath("following-sibling::td[@class='grid-raw-size cursor']/i"));
							element_Click(deleteBtn);
							driver.switchTo().alert().accept();
							break;
						}
					}
					if (d == 1) {
						break;
					}
					count++;
				} while (paginationXpath.size() != 0);
			}
			element_Click(plusBtn);
			waitForElementClickable(applicationsDrop);
			element_Click(applicationsDrop);
			for (int i = 0; i < commonSelectionXpath.size(); i++) {
				String applicationN = commonSelectionXpath.get(i).getText();
				String val = commonSelectionXpath.get(i).findElement(By.xpath("span")).getAttribute("class");
				if (applicationN.equalsIgnoreCase(applicationType)) {
					if (!val.contains("-check")) {
						element_Click(commonSelectionXpath.get(i));
						break;
					}
				}
			}
			element_Click(applicationsDrop);
			if (leaveIdName != null) {
				if (leaveTypeDropSize.size() > 0) {
					waitForElementVisible(leaveTypeDrop);
					element_Click(leaveTypeDrop);
					for (int i = 0; i < commonSelectionXpath.size(); i++) {
						String leaveIdNameN = commonSelectionXpath.get(i).getText();
						String val = commonSelectionXpath.get(i).findElement(By.xpath("span")).getAttribute("class");
						if (leaveIdNameN.equalsIgnoreCase(leaveIdName)) {
							if (!val.contains("-check")) {
								element_Click(commonSelectionXpath.get(i));
								break;
							}
						}
					}
					element_Click(leaveTypeDrop);
				}
			}
			if (customizeBasedOn != null) {
				if (element_isEnabled(custmizeBasedOnDrop)) {
					//element_Click(custmizeBasedOnDrop);
					element_DropDownSelectByvisibleText(custmizeBasedOnDrop, customizeBasedOn);
				}
//				if (element_isDisplayed(fromRangeTxt) == true && customizeBasedOn.equalsIgnoreCase("Duration")) {
				if (customizeBasedOn.equalsIgnoreCase("Duration")) {
					if (fromRange != null) {
						element_Clear(fromRangeTxt);
						element_InputTextUsingActionClass(fromRangeTxt, fromRange);
					}
					if (toRange != null) {
						element_Clear(toRangeTxt);
						element_InputTextUsingActionClass(toRangeTxt, toRange);
					}
				}
			}
			// Authorization Mode Selection
			element_DropDownSelectByvisibleText(exceptionAuthModeDrop, authorizationMode);
			// ric Selection
			if (reportingInCharge.contains(",")) {
				commaSeparatedRIC = reportingInCharge.split(",");
			}
			element_Click(exceptionsRICDrop);
			for (int i = 0; i < commonSelectionXpath.size(); i++) {
				String ricNameN = commonSelectionXpath.get(i).getText();
				String val = commonSelectionXpath.get(i).findElement(By.xpath("span")).getAttribute("class");
				if (reportingInCharge.contains(",")) {
					for (int j = 0; j < commaSeparatedRIC.length; j++) {
						String appName = commaSeparatedRIC[j].trim();
						if (ricNameN.equalsIgnoreCase(appName)) {
							if (!val.contains("-check")) {
								element_ClickUsingJS(commonSelectionXpath.get(i));
							}
						}
					}
				} else {
					if (ricNameN.equalsIgnoreCase(applicationType)) {
						if (!val.contains("-check")) {
							element_ClickUsingJS(commonSelectionXpath.get(i));
						}
					}
				}
			}
			element_Click(exceptionsRICDrop);
			if (finalInCharge != null) {
				element_DropDownSelectByvisibleText(exceptionsFinalInchargeDrop, finalInCharge);
			}
			///////////////
			element_Click(exceptionsAddBtn);
			}
		saveButtonClick();
		String valMsg = validationMessage();
		Assert.assertEquals(valMsg, "Saved Successfully");
		reloadPageButtonClick();
	}

	public void configureAutoForwardApplication(String policyName, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(approvalPolicyNameTxt);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, policyName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			ArrayList<String> ar = new ArrayList<>();
			if (policyNames.size() > 0) {
				for (int j = 0; j < policyNames.size(); j++) {
					String plcname1 = policyNames.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(policyName)) {
						policyNames.get(j).click();
					}
				}
			} else {
				logger.debug("policy Name Not Found");
			}
		} else {
			logger.debug("Search Box Disable");
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ReportingIn-Charge: " + data.get("ReportingIn-Charge"));
			String reportingInCharge = data.get("ReportingIn-Charge");
			String autoForward = data.get("AutoForward");
			String autoForwardAfterDays = data.get("AutoForwardAfterDays");
			String action = data.get("Action");
			if (autoForwardTable.size() > 0) {
				for (int i = 0; i < autoForwardTable.size(); i++) {
					String ricName = autoForwardTable.get(i).getText();
					if (ricName.equalsIgnoreCase(reportingInCharge)) {
						if (autoForward != null) {
							boolean autoForwardBool = Boolean.parseBoolean(autoForward);
							WebElement autoForwardChk = autoForwardTable.get(i)
									.findElement(By.xpath("following-sibling::td[1]//input"));
							if (autoForwardBool == true) {
								if (element_isSelected(autoForwardChk) != true) {
									element_Click(autoForwardChk);
								}
							} else {
								if (element_isSelected(autoForwardChk) == true) {
									element_Click(autoForwardChk);
								}
							}
							Thread.sleep(1000);
						}
						if (autoForwardAfterDays != null) {
							WebElement autoForwardAfterDaysTxt = autoForwardTable.get(i)
									.findElement(By.xpath("following-sibling::td[2]//input"));
							if (element_isEnabled(autoForwardAfterDaysTxt)) {
								element_Clear(autoForwardAfterDaysTxt);
								element_InputTextUsingActionClass(autoForwardAfterDaysTxt, autoForwardAfterDays);
								Thread.sleep(1000);
							}
						}
						if (action != null) {
							WebElement actionDropdown = autoForwardTable.get(i)
									.findElement(By.xpath("following-sibling::td[3]/select"));
							Thread.sleep(500);
							if (element_isEnabled(actionDropdown)) {
								element_DropDownSelectByvisibleText(actionDropdown, action);
								Thread.sleep(1000);
							}
						}
						break;
					}
				}
			}
		}
		saveButtonClick();
		String valMsg = validationMessage();
		Assert.assertEquals(valMsg, "Saved Successfully");
	}
	
	public void deleteApprovalPolicy(String policyName) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(approvalPolicyNameTxt);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, policyName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			ArrayList<String> ar = new ArrayList<>();
			if (policyNames.size() > 0) {
				for (int j = 0; j < policyNames.size(); j++) {
					String plcname1 = policyNames.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(policyName)) {
						policyNames.get(j).click();
						deleteButtonClick();
						element_AlertIsPresent();
						driver.switchTo().alert().accept();
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
					}
				}
			} else {
				logger.debug("policy Name Not Found");
			}
		} else {
			logger.debug("Search Box Disable");
		}
	}
}
