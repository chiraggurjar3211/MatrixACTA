package PageObject.ContractorWorkerManagement;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class WorkerProfilePO extends AbstractMethod{
	WebDriver driver;
	public WorkerProfilePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//*************************************************************************
	//********** Elements *****************************************************
	//*************************************************************************
	
	@FindBy(xpath = "//*[@class='col-md-8 col-sm-4 removeFullLeftRightPadding div-user-info']//*[@class='form-label label-text control-label mx-input-theme lblRight grd-prevent-rtl']")
	private WebElement statusLabel;
	
	@FindBy(id = "ChkUserEnbl")
	private WebElement active;
	
	@FindBy(id = "AutoUserID")
	private WebElement workerId;
	
	@FindBy(id = "AutoUserName")
	private WebElement userName;
	
	@FindBy(id = "cmnBtnTxtSearch")
	private WebElement searchBox;
	
	@FindBy(xpath = "//html")
	private WebElement blankSpace;
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr[contains(@id,'row')]/td[not(@hidden)][2]")
	private List<WebElement> workerNames;
	
	@FindBy(id = "btnUserBlacklist")
	private WebElement addToBlacklistButton;
	
	@FindBy(id = "txtBlacklistReason")
	private WebElement blacklistReasonTxt;
	
	@FindBy(id = "btnOk")
	private WebElement blacklistPopupOk;
	
	@FindBy(id = "btnUserRestore")
	private WebElement restoreFromBlacklistButton;
	
	@FindBy(id = "btnUserRestore")
	private List<WebElement> restoreFromBlacklistButtonCheck;
	
	@FindBy(id = "btnDeleteOK")
	private WebElement confirmDeleteButton;
	
	// CWM Tab
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='CWM']")
	private WebElement cwmTab;
	
	@FindBy(id = "UserConfigAutoSkillName")
	private WebElement skillNameTxt;
	
	@FindBy(xpath="//*[@id=\"UserConfigAutoSkillName\"]/ancestor::div[1]//span/button")
	private WebElement skillNamePicklistButton;
	
	@FindBy(xpath="//*[@class=\"modal-content\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement skillSearch;
	
	@FindBy(xpath="//*[@class=\"modal-content\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]")
	private List<WebElement> skillColumnSelect;
	
	@FindBy(id = "UserConfigAutoContractorName")
	private WebElement contractorNameTxt;
	
	@FindBy(id = "UserConfigAutoWorkOrderName")
	private WebElement workOrderNameTxt;
	
	@FindBy(id = "_TxtAssignmentStartDate")
	private WebElement assignmentStartDtTxt;
	
	@FindBy(id = "_TxtAssignmentEndDate")
	private WebElement assignmentEndDtTxt;
	
	//Job costing Tab
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[contains(text(),'Costing')]")
	private WebElement jobCostingTab;
	
	@FindBy(xpath = "//*[@name='id_176']")
	private WebElement jobCostingDD;
	
	@FindBy(xpath = "//*[@class='modal-content']")
	private List<WebElement> jobCostingChangePopup;

	@FindBy(xpath = "//*[@value='Ok']")
	private WebElement jobCostingChangePopupOkBtn;
	
	@FindBy(name = "id_129")
	private WebElement deviceBasedJobAssignmentFlag;
	
	@FindBy(xpath = "//*[@default=\"Ok\"]")
	private WebElement popupOKBtn;

	@FindBy(xpath = "//*[@default=\"Ok\"]")
	private List<WebElement> popupOKBtnXpath;
	
	@FindBy(xpath = "//*[contains(text(),'Assigned Job Schedules')]")
	private WebElement assignedJobSchedulesTab;
	
	@FindBy(xpath = "//*[@gridname='grdAssignedJobSchedules']//*[@name='cmnTxtSearch']")
	private WebElement jobSchedulerSearchBox;
	
	@FindBy(xpath = "//*[@gridname='grdAssignedJobSchedules']//table/tbody/tr/td[3]")
	private List<WebElement> jobSchedulerTable;
	
	@FindBy(xpath = "//*[@gridname='grdAssignedJobSchedules']//*[@default='No Data']")
	private WebElement notDataLabel;
	
	@FindBy(xpath = "//*[@gridname='grdAssignedJobSchedules']//*[@default='No Data Found']")
	private WebElement notDataFoundLabel;
	
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='Group']")
	private WebElement groupTab;
	
	@FindBy(id = "UserConfigAutoOrganizationName")
	private WebElement workerProfileOrganizationName;
	
	@FindBy(id = "UserConfigAutoReportingGroupID")
	private WebElement userConfigAutoReportingGroupID;
	
	@FindBy(id = "UserConfigAutoReportingGroupName")
	private WebElement userConfigAutoReportingGroupName;
	
	// ******************************************************************************
		// ************************T&A Tab Element************************
		// ******************************************************************************
		// *************T&A Tab -> Attendance Tab Element************************
		@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='T&A']")
		private WebElement tandATab;

		@FindBy(xpath = "//*[text()='Enable Attendance Calculation']")
		private WebElement enableAttendanceCalculationText;

		@FindBy(xpath = "//*[@title='Check For Enabling Attendance Calculation']")
		private WebElement enableAttendanceCalculationCheckbox;

		@FindBy(xpath = "//*[@title='Select Overtime or C-OFF applied to user']")
		private WebElement otCffEligibilityDD;

		@FindBy(id = "0_chkCoffAuthOn")
		private WebElement autoAuthCoffWO;

		@FindBy(id = "1_chkCoffAuthOn")
		private WebElement autoAuthCoffPH;

		@FindBy(id = "2_chkCoffAuthOn")
		private WebElement autoAuthCoffWOPH;

		@FindBy(id = "3_chkCoffAuthOn")
		private WebElement autoAuthCoffFB;

		@FindBy(id = "4_chkCoffAuthOn")
		private WebElement autoAuthCoffRD;

		@FindBy(id = "5_chkCoffAuthOn")
		private WebElement autoAuthCoffNormal;

		@FindBy(xpath = "//*[contains(@id,'_chkCoffAuthOn')]")
		private List<WebElement> autoAuthCoffOptionsFlag;

		@FindBy(xpath = "//*[@name='id_150']")
		private WebElement attendanceMarkingTypeDD;

		@FindBy(id = "CboMaxATDEVT")
		private WebElement maxPunchesToBeConsideredDD;

		@FindBy(xpath = "//*[@name=\"id_75\"]")
		private WebElement restrictHalfDayConsFlag;

		@FindBy(xpath = "//*[@class='nav navbar-nav hr-tab hr-tab-user panel-group accordion']//*[contains(text(),'Policy')]")
		private WebElement tandAPolicyTab;

		@FindBy(xpath = "//*[@name='id_76']")
		private WebElement flexibleHalfDayTxt;

		@FindBy(xpath = "//*[@name='id_77']")
		private WebElement flexibleFullDayTxt;
		
		// ******************************************************************************
		// ************************T&A Tab Element************************
		// ******************************************************************************
		@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='T&A']")
		private WebElement timeattendanceTab;

		@FindBy(xpath = "//*[@class='nav navbar-nav hr-tab hr-tab-user panel-group accordion']//*[contains(text(),'Policy')]")
		private WebElement policytab;

		@FindBy(id = "UserConfigAutoAttendancePolicyName")
		private WebElement attendancePolicyName;

		@FindBy(id = "UserConfigAutoAbsentPolicyName")
		private WebElement absenteePolicyName;

		@FindBy(id = "UserConfigAutoOTPolicyName")
		private WebElement overtimePolicyName;

		@FindBy(id = "UserConfigAutoLateInPolicyName")
		private WebElement lateINPolicyName;

		@FindBy(id = "UserConfigAutoEarlyOutPolicyName")
		private WebElement earlyOUTPolicyName;

		@FindBy(id = "UserConfigAutoCOPolicyName")
		private WebElement cOffPolicyName;
		
		@FindBy(id = "UserConfigAutoAttendancePolicyID")
		private WebElement userConfigAutoAttendancePolicyID;

		@FindBy(id = "UserConfigAutoAbsentPolicyID")
		private WebElement userConfigAutoAbsentPolicyID;

		@FindBy(id = "UserConfigAutoOTPolicyID")
		private WebElement userConfigAutoOTPolicyID;

		@FindBy(id = "UserConfigAutoLateInPolicyID")
		private WebElement userConfigAutoLateInPolicyID;

		@FindBy(id = "UserConfigAutoEarlyOutPolicyID")
		private WebElement userConfigAutoEarlyOutPolicyID;

		@FindBy(id = "UserConfigAutoCOPolicyID")
		private WebElement userConfigAutoCOPolicyID;
		
		// ******************************************************************************
		// ************************Ess Tab Element************************
		// ******************************************************************************
		@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='ESS']")
		private WebElement essTab;

		@FindBy(name = "id_93")
		private WebElement enableAccount;

		@FindBy(name = "id_94")
		private WebElement editBasicDetails;

		@FindBy(name = "id_95")
		private WebElement punchMarkingViaESS;

		@FindBy(id = "UserConfigAutoESSRoleRightsName")
		private WebElement eSSRoleRightNmTxt;

		@FindBy(name = "id_100")
		private WebElement autoAuthIMEI;
		
		// ******************************************************************************
		// ************************Cafeteria Tab Element************************
		// ******************************************************************************
		@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[text()='Cafeteria']")
		private WebElement cafeteriaTab;

		@FindBy(id = "CboECanflg")
		private WebElement cafeEnableFlag;

		@FindBy(name = "id_174")
		private WebElement accountTypeDD;

		@FindBy(name = "id_175")
		private WebElement balanceManagementDD;
		
		@FindBy(id="TxtAccLmt")
		private WebElement txtAccLmt;

		@FindBy(id = "DdlDscntLvl")
		private WebElement discountLevelDD;

		@FindBy(id = "UserConfigAutoCafeteriaUsagePolicyName")
		private WebElement cafeUsagePlcTxt;

		// ******************************************************************************
		// ************************Field Visit Management Tab
		// Element************************
		// ******************************************************************************
		// Chhaya
		@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[contains(text(),'Field Visit Management')]")
		private WebElement fVMTab;

		@FindBy(name = "id_130")
		private WebElement enableFVMChk;
		
		
		// ******************************************************************************
		// ************************Visitor Management Tab
		// Element************************
		// ******************************************************************************
		@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']//*[contains(text(),'Visitor Management')]")
		private WebElement visitorManagementTab;

		@FindBy(id = "chkIsAuthHost")
		private WebElement authHostUserEnable;

		@FindBy(id = "TxtMinDaysPreRegistration")
		private WebElement minimumDaysBeforeAllowingVisitTxt;

		@FindBy(id = "TxtMaxDaysPreRegistration")
		private WebElement maximumDaysBeforeAllowingVisitTxt;


		
		
		
		

		
	
	////////////////
	public void deleteWorker(String deleteWorkerName) throws InterruptedException {
		Thread.sleep(1000);
		pageLoadWaitng();
		if (element_isEnabled(searchBox)) {
			element_InputTextUsingActionClass(searchBox, deleteWorkerName);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (workerNames.size() > 0) {
				for (int j = 0; j < workerNames.size(); j++) {
					Thread.sleep(1000);
					String id1 = workerNames.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(deleteWorkerName)) {
						workerNames.get(j).click();
						pageLoadWaitng();
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1500);
						element_Click(confirmDeleteButton);
						Thread.sleep(1500);
						String valmsg = validationMessage();
						Assert.assertEquals(valmsg, "Deleted Successfully");
					}
				}
			}
//			if (!ar.contains(deleteWorkerName)) {
//				logger.debug("Worker is not exist");
//			}
		}
	}
	
	// Mayank
		public Boolean verifyWorkerIDfieldWhileAddUser() throws InterruptedException {
			addButtonClick();
			Thread.sleep(2000);
			waitForElementClickable(active);
			Boolean idEnable = element_isEnabled(workerId);
			return idEnable;
		}
		
	public void createWorker(List<String> columnHeader, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		addButtonClick();
		waitForElementClickable(active);
		// Condition for auto generate userid --Mayank
		if (workerId.isEnabled()) {
			element_InputTextUsingActionClass(workerId, data.get("WorkerId"));
			element_TextBoxToClickOnTab(workerId); // This method use for userid control to click on tab
		}
		pageLoadWaitng();
		Thread.sleep(2000);
		element_Clear(userName);
		element_InputTextUsingActionClass(userName, data.get("WorkerId"));
		//******************************************
		//******Basic Tab***************************
		//******************************************
		if (data.get("Active") != null) {
			if (data.get("Active") != null) {
				boolean activeC = Boolean.parseBoolean(data.get("Active"));
				if (activeC == true) {
					if (element_isSelected(active) != true) {
						element_Click(active);
					}
				} else {
					if (element_isSelected(active) == true) {
						element_Click(active);
					}
				}
			}
		}
		//******************************************
		//******Group Tab***************************
		//******************************************
		if (data.get("Organization") != null || data.get("ReportingGroup") != null) {
			Thread.sleep(1000);
			element_Click(groupTab);
			waitForElementVisible(workerProfileOrganizationName);
			// Parameters
			if (data.get("Organization") != null) {
				element_Clear(workerProfileOrganizationName);
				Thread.sleep(500);
				element_dynamicDDSelect(workerProfileOrganizationName, data.get("Organization"));
				element_TextBoxToClickOnTab(workerProfileOrganizationName);
				Thread.sleep(1000);
			}
			if (data.get("ReportingGroup") != null) {
				element_Clear(userConfigAutoReportingGroupID);
				element_TextBoxToClickOnTab(userConfigAutoReportingGroupID);
				element_Clear(userConfigAutoReportingGroupName);
				element_TextBoxToClickOnTab(userConfigAutoReportingGroupName);
				element_dynamicDDSelect(userConfigAutoReportingGroupName, data.get("ReportingGroup"));
				element_TextBoxToClickOnTab(userConfigAutoReportingGroupName);
			} else {
				element_Clear(userConfigAutoReportingGroupID);
				element_TextBoxToClickOnTab(userConfigAutoReportingGroupID);
				element_Clear(userConfigAutoReportingGroupName);
				element_TextBoxToClickOnTab(userConfigAutoReportingGroupName);
				element_Click(groupTab);
			}
		}
		// *****************************************************************
				// ********** T&A tab **************************************
				// ****************************************************************
				if (data.get("AtdEnable") != null || data.get("OtCoffEligibility") != null || data.get("AutoAuthCoff") != null
						|| data.get("AtdMarkingType") != null || data.get("MaxPunchesToBeConsidered") != null
						|| data.get("RestrHalfDayCons") != null || data.get("AttendancePlc") != null
						|| data.get("AbsenteePlc") != null || data.get("OvertimePlc") != null || data.get("LateInPlc") != null
						|| data.get("EarlyOutPlc") != null || data.get("CoffPlc") != null || data.get("FlexibleHalfDay") != null
						|| data.get("FlexibleFullDay") != null) {
					element_Click(tandATab);
					// Parameters
					waitForElementVisible(enableAttendanceCalculationText);
					// T&A Tab Parameters
					if (data.get("AtdEnable") != null) {
						boolean tandAenableCheck = Boolean.parseBoolean(data.get("AtdEnable"));
						if (tandAenableCheck == true) {
							if (element_isSelected(enableAttendanceCalculationCheckbox) != true) {
								element_Click(enableAttendanceCalculationCheckbox);
							}
						} else {
							if (element_isSelected(enableAttendanceCalculationCheckbox) == true) {
								element_Click(enableAttendanceCalculationCheckbox);
							}
						}
					}
					if (element_isSelected(enableAttendanceCalculationCheckbox) == true) {
						// T&A Calculation enable then only other parameters enable
						if (data.get("OtCoffEligibility") != null) {
							if (element_isSelected(enableAttendanceCalculationCheckbox)) {
								element_DropDownSelectByvisibleText(otCffEligibilityDD, data.get("OtCoffEligibility"));
							}
						}
						if (data.get("AutoAuthCoff") != null) {
							if (element_DropDownFirstSelectedValue(otCffEligibilityDD).equalsIgnoreCase("Both")) {
								String autoAuthCoff = data.get("AutoAuthCoff");
								if (autoAuthCoff.contains(",")) {
									String[] commaSeparatedValues = autoAuthCoff.split(",");
									for (int i = 0; i < commaSeparatedValues.length; i++) {
										String autoAuthCoffOptions = commaSeparatedValues[i].trim().toUpperCase();
										if (autoAuthCoffOptions.equalsIgnoreCase("WO")) {
											if (!element_isSelected(autoAuthCoffWO)) {
												element_Click(autoAuthCoffWO);
											}
										}
										if (autoAuthCoffOptions.equalsIgnoreCase("PH")) {
											if (!element_isSelected(autoAuthCoffPH)) {
												element_Click(autoAuthCoffPH);
											}
										}
										if (autoAuthCoffOptions.equalsIgnoreCase("WO/PH")) {
											if (!element_isSelected(autoAuthCoffWOPH)) {
												element_Click(autoAuthCoffWOPH);
											}
										}
										if (autoAuthCoffOptions.equalsIgnoreCase("FB")) {
											if (!element_isSelected(autoAuthCoffFB)) {
												element_Click(autoAuthCoffFB);
											}
										}
										if (autoAuthCoffOptions.equalsIgnoreCase("RD")) {
											if (!element_isSelected(autoAuthCoffRD)) {
												element_Click(autoAuthCoffRD);
											}
										}
										if (autoAuthCoffOptions.equalsIgnoreCase("NORMAL DAY")) {
											if (!element_isSelected(autoAuthCoffNormal)) {
												element_Click(autoAuthCoffNormal);
											}
										}
									}
								} else {
									if (autoAuthCoff.toUpperCase().equalsIgnoreCase("WO")) {
										if (!element_isSelected(autoAuthCoffWO)) {
											element_Click(autoAuthCoffWO);
										}
									}
									if (autoAuthCoff.toUpperCase().equalsIgnoreCase("PH")) {
										if (!element_isSelected(autoAuthCoffPH)) {
											element_Click(autoAuthCoffPH);
										}
									}
									if (autoAuthCoff.toUpperCase().equalsIgnoreCase("WO/PH")) {
										if (!element_isSelected(autoAuthCoffWOPH)) {
											element_Click(autoAuthCoffWOPH);
										}
									}
									if (autoAuthCoff.toUpperCase().equalsIgnoreCase("FB")) {
										if (!element_isSelected(autoAuthCoffFB)) {
											element_Click(autoAuthCoffFB);
										}
									}
									if (autoAuthCoff.toUpperCase().equalsIgnoreCase("RD")) {
										if (!element_isSelected(autoAuthCoffRD)) {
											element_Click(autoAuthCoffRD);
										}
									}
									if (autoAuthCoff.toUpperCase().equalsIgnoreCase("NORMAL DAY")) {
										if (!element_isSelected(autoAuthCoffNormal)) {
											element_Click(autoAuthCoffNormal);
										}
									}
									if (autoAuthCoff.toUpperCase().equalsIgnoreCase("ALL")) {
										for (WebElement ele : autoAuthCoffOptionsFlag) {
											if (!element_isSelected(ele)) {
												element_Click(ele);
											}
										}
									}
								}
							}
						}
						if (data.get("AtdMarkingType") != null) {
							element_DropDownSelectByvisibleText(attendanceMarkingTypeDD, data.get("AtdMarkingType"));
							Thread.sleep(500);
						}
						if (data.get("FlexibleHalfDay") != null) {
							if (dropDownSelectedValue(attendanceMarkingTypeDD).equalsIgnoreCase("Flexible")) {
								element_Clear(flexibleHalfDayTxt);
								element_inputTextUsingActionClassCharacterOneByOne(flexibleHalfDayTxt,
										data.get("FlexibleHalfDay"));
							}
						}
						if (data.get("FlexibleFullDay") != null) {
							if (dropDownSelectedValue(attendanceMarkingTypeDD).equalsIgnoreCase("Flexible")) {
								element_Clear(flexibleFullDayTxt);
								element_inputTextUsingActionClassCharacterOneByOne(flexibleFullDayTxt,
										data.get("FlexibleFullDay"));
							}
						}
						if (data.get("MaxPunchesToBeConsidered") != null) {
							element_DropDownSelectByvisibleText(maxPunchesToBeConsideredDD,
									data.get("MaxPunchesToBeConsidered"));
						}
						if (data.get("RestrHalfDayCons") != null) {
							Boolean restrHalfDayCons = Boolean.parseBoolean(data.get("RestrHalfDayCons"));
							if (restrHalfDayCons == true) {
								if (!restrictHalfDayConsFlag.isSelected()) {
									element_Click(restrictHalfDayConsFlag);
								}
							} else {
								if (restrictHalfDayConsFlag.isSelected()) {
									element_Click(restrictHalfDayConsFlag);
								}
							}
						}
						// ***********************************************
						// Policy Tab parameteres
						element_Click(policytab);
						waitForElementVisible(attendancePolicyName);
						if (data.get("AttendancePlc") != null) {
							element_Clear(userConfigAutoAttendancePolicyID);
							element_TextBoxToClickOnTab(userConfigAutoAttendancePolicyID);
							element_Clear(attendancePolicyName);
							element_TextBoxToClickOnTab(attendancePolicyName);
							element_dynamicDDSelect(attendancePolicyName, data.get("AttendancePlc"));
						}
						if (data.get("AbsenteePlc") != null) {
							element_Clear(userConfigAutoAbsentPolicyID);
							element_TextBoxToClickOnTab(userConfigAutoAbsentPolicyID);
							element_Clear(absenteePolicyName);
							element_TextBoxToClickOnTab(absenteePolicyName);
							element_dynamicDDSelect(absenteePolicyName, data.get("AbsenteePlc"));
						}
						if (data.get("OvertimePlc") != null) {
							element_Clear(userConfigAutoOTPolicyID);
							element_TextBoxToClickOnTab(userConfigAutoOTPolicyID);
							element_Clear(overtimePolicyName);
							element_TextBoxToClickOnTab(overtimePolicyName);
							element_dynamicDDSelect(overtimePolicyName, data.get("OvertimePlc"));

						}
						if (data.get("LateInPlc") != null) {
							element_Clear(userConfigAutoLateInPolicyID);
							element_TextBoxToClickOnTab(userConfigAutoLateInPolicyID);
							element_Clear(lateINPolicyName);
							element_TextBoxToClickOnTab(lateINPolicyName);
							element_dynamicDDSelect(lateINPolicyName, data.get("LateInPlc"));
						}
						if (data.get("EarlyOutPlc") != null) {
							element_Clear(userConfigAutoEarlyOutPolicyID);
							element_TextBoxToClickOnTab(userConfigAutoEarlyOutPolicyID);
							element_Clear(earlyOUTPolicyName);
							element_TextBoxToClickOnTab(earlyOUTPolicyName);
							element_dynamicDDSelect(earlyOUTPolicyName, data.get("EarlyOutPlc"));
						}
						if (data.get("CoffPlc") != null) {
							element_Clear(userConfigAutoCOPolicyID);
							element_TextBoxToClickOnTab(userConfigAutoCOPolicyID);
							element_Clear(cOffPolicyName);
							element_TextBoxToClickOnTab(cOffPolicyName);
							element_dynamicDDSelect(cOffPolicyName, data.get("CoffPlc"));
						}
					}
				}
				
				// *****************************************************************
				// ********** ESS tab **************************************
				// ****************************************************************
				if (data.get("ESSEnable") != null || data.get("ESSDetail") != null || data.get("PunchMarkingviaESS") != null
						|| data.get("ESSRoleRights") != null || data.get("AutoAuthIMEI") != null) {
					element_Click(essTab);
					// Parameters
					// ESS Parameters
					if (columnHeader.contains("ESSEnable")) {
						if (data.get("ESSEnable") != null) {
							boolean essEnable = Boolean.parseBoolean(data.get("ESSEnable"));
							if (essEnable == true) {
								if (element_isSelected(enableAccount) != true) {
									element_Click(enableAccount);
									// if ess enable then All other ESS parameters enable
									// ess Basic Details
									if (columnHeader.contains("ESSDetail")) {
										if (data.get("ESSDetail") != null) {
											boolean essEditBscDetails = Boolean.parseBoolean(data.get("ESSDetail"));
											if (essEditBscDetails == true) {
												if (element_isSelected(editBasicDetails) != true) {
													element_Click(editBasicDetails);
												}
											} else {
												if (element_isSelected(editBasicDetails) == true) {
													element_Click(editBasicDetails);
												}
											}
										}
									}
									// ess Punch marking via ess
									if (columnHeader.contains("PunchMarkingviaESS")) {
										if (data.get("PunchMarkingviaESS") != null) {
											boolean essPunchMarking = Boolean.parseBoolean(data.get("PunchMarkingviaESS"));
											if (essPunchMarking == true) {
												if (element_isSelected(punchMarkingViaESS) != true) {
													element_Click(punchMarkingViaESS);
												}
											} else {
												if (element_isSelected(punchMarkingViaESS) == true) {
													element_Click(punchMarkingViaESS);
												}
											}
										}
									}
									// ESS Role Rights
									if (columnHeader.contains("ESSRoleRights")) {
										if (data.get("ESSRoleRights") != null) {
											String eSSRoleRights = data.get("ESSRoleRights");
											element_Clear(eSSRoleRightNmTxt);
											element_InputTextUsingActionClass(eSSRoleRightNmTxt, eSSRoleRights);
											element_Click(essTab);
										}
									}
									// Auto Authorize IMEI Registration
									if (columnHeader.contains("AutoAuthIMEI")) {
										if (data.get("AutoAuthIMEI") != null) {
											boolean imeiAuth = Boolean.parseBoolean(data.get("AutoAuthIMEI"));
											if (imeiAuth == true) {
												if (element_isSelected(autoAuthIMEI) != true) {
													element_Click(autoAuthIMEI);
												}
											} else {
												if (element_isSelected(autoAuthIMEI) == true) {
													element_Click(autoAuthIMEI);
												}
											}
										} else {
											if (element_isSelected(autoAuthIMEI) == true) {
												element_Click(autoAuthIMEI);
											}
										}
									}
								}

							} else {
								if (element_isSelected(enableAccount) == true) {
									element_Click(enableAccount);
								}
							}
						}
					}
				}
				// *****************************************************************
				// ********** Cafeteria tab **************************************
				// ****************************************************************
				if (data.get("CafeteriaEnable") != null || data.get("AccountType") != null
						|| data.get("BalanceManagement") != null || data.get("DiscountLevel") != null
						|| data.get("CafeUsagePolicy") != null || data.get("AllowedUsagePerMonth") != null ) {
					element_Click(cafeteriaTab);
					
					// Parameters
					if (data.get("CafeteriaEnable") != null) {
						waitForElementVisible(cafeEnableFlag);
						Boolean cafeteriaEnable1 = Boolean.parseBoolean(data.get("CafeteriaEnable"));
						if (cafeteriaEnable1 == true) {
							if (!cafeEnableFlag.isSelected()) {
								element_Click(cafeEnableFlag);
							}
							if (data.get("DiscountLevel") != null) {
								element_DropDownSelectByvisibleText(discountLevelDD, data.get("DiscountLevel"));
							}
							if (data.get("AccountType") != null) {
								element_DropDownSelectByvisibleText(accountTypeDD, data.get("AccountType"));
							}
							if (data.get("BalanceManagement") != null) {
								element_DropDownSelectByvisibleText(balanceManagementDD, data.get("BalanceManagement"));
							}
							if(data.get("AllowedUsagePerMonth") != null) {
								element_Clear(txtAccLmt);
								element_TextBoxToClickOnTab(txtAccLmt);
								element_InputDataUsingJS(txtAccLmt,data.get("AllowedUsagePerMonth"));
							}
							if (data.get("CafeUsagePolicy") != null) {
								element_Clear(cafeUsagePlcTxt);
								element_InputTextUsingActionClass(cafeUsagePlcTxt, data.get("CafeUsagePolicy"));
								element_Click(driver.findElement(By.xpath("//html")));
							}
						} else {
							if (cafeEnableFlag.isSelected()) {
								element_Click(cafeEnableFlag);
							}
						}
					}
				}
				// *****************************************************************
				// ********** Visitor Management tab **************************************
				// ****************************************************************
				if (data.get("AuthorizedHostUser") != null || data.get("MaxDaysBeforeAllowingVisit") != null
						|| data.get("MinDaysBeforeAllowingVisit") != null) {
					element_Click(visitorManagementTab);
					// Parameters
					if (data.get("AuthorizedHostUser") != null) {
						boolean authorizedHostUser = Boolean.parseBoolean(data.get("AuthorizedHostUser"));
						if (authorizedHostUser == true) {
							if (!authHostUserEnable.isSelected()) {
								element_Click(authHostUserEnable);
							}
						} else {
							if (authHostUserEnable.isSelected()) {
								element_Click(authHostUserEnable);
							}
						}
					}
					if (authHostUserEnable.isSelected()) {
						if (data.get("MinDaysBeforeAllowingVisit") != null) {
							element_Clear(minimumDaysBeforeAllowingVisitTxt);
							element_InputTextUsingActionClass(minimumDaysBeforeAllowingVisitTxt,
									data.get("MinDaysBeforeAllowingVisit"));
						}
						if (data.get("MaxDaysBeforeAllowingVisit") != null) {
							element_Clear(maximumDaysBeforeAllowingVisitTxt);
							element_InputTextUsingActionClass(maximumDaysBeforeAllowingVisitTxt,
									data.get("MaxDaysBeforeAllowingVisit"));
						}
					}
				}
				// *****************************************************************
				// ********** JPC tab **************************************
				// ****************************************************************
				if (data.get("JobCosting") != null || data.get("DeviceBasedJobAssign") != null) {
					element_Click(jobCostingTab);
					// Parameters
					if (data.get("JobCosting") != null) {
						waitForElementVisible(jobCostingDD);
						element_DropDownSelectByvisibleText(jobCostingDD, data.get("JobCosting"));
						if (jobCostingChangePopup.size() > 0) {
							element_Click(jobCostingChangePopupOkBtn);
							Thread.sleep(1000);
						}
					}
					if (data.get("DeviceBasedJobAssign") != null) {
						boolean DeviceBasedJobAssign1 = Boolean.parseBoolean(data.get("DeviceBasedJobAssign"));
						if (DeviceBasedJobAssign1 == true) {
							if (!deviceBasedJobAssignmentFlag.isSelected()) {
								element_Click(deviceBasedJobAssignmentFlag);
							}
						} else {
							if (deviceBasedJobAssignmentFlag.isSelected()) {
								element_Click(deviceBasedJobAssignmentFlag);
							}
						}
						if (popupOKBtnXpath.size() > 0) {
							element_Click(popupOKBtn);
						}
					}
				}
				// *****************************************************************
				// ********** FVM tab **************************************
				// ****************************************************************
				if (data.get("EnableFVM") != null) {
					element_Click(fVMTab);
					if (data.get("EnableFVM") != null) {
						boolean enableFVM1 = Boolean.parseBoolean(data.get("EnableFVM"));
						if (enableFVM1 == true) {
							if (!enableFVMChk.isSelected()) {
								element_Click(enableFVMChk);
							}
						} else {
							if (enableFVMChk.isSelected()) {
								element_Click(enableFVMChk);
							}
						}
					}
				}
				
		//******************************************
		//******CWM Tab***************************
		//******************************************
		Thread.sleep(1000);
		element_Click(cwmTab);
		if (data.get("SkillName") != null) {
			//element_Clear(skillNameTxt);
			Thread.sleep(1000);
			element_Click(skillNamePicklistButton);
			Thread.sleep(2000);
			element_InputTextUsingActionClass(skillSearch, data.get("SkillName"));
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(skillSearch);
			Thread.sleep(1000);
			for(int x=0;x<skillColumnSelect.size();x++) {
				if(skillColumnSelect.get(x).getText().equalsIgnoreCase(data.get("SkillName"))) {
					skillColumnSelect.get(x).click();
					break;
				}
			}
			Thread.sleep(1000);
//			element_InputTextUsingActionClass(skillNameTxt, data.get("SkillName"));
//			element_TextBoxToClickOnTab(skillNameTxt);
			Thread.sleep(1000);
		}
		if (data.get("ContractorName") != null) {
			element_Clear(contractorNameTxt);
			element_dynamicDDSelect(contractorNameTxt, data.get("ContractorName"));
			element_TextBoxToClickOnTab(contractorNameTxt);
		}
		if (data.get("WorkOrderName") != null) {
			element_Clear(workOrderNameTxt);
			element_dynamicDDSelect(workOrderNameTxt, data.get("WorkOrderName"));
			element_TextBoxToClickOnTab(workOrderNameTxt);
		}
		Thread.sleep(2000);
		if (data.get("AssignmentStartDt") != null) {
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentStartDt"));
			element_Clear(assignmentStartDtTxt);
			element_InputTextUsingActionClass(assignmentStartDtTxt, date);
			element_TextBoxToClickOnTab(assignmentStartDtTxt);
		}
		if (data.get("AssignmentEndDt") != null) {
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("AssignmentEndDt"));
			element_Clear(assignmentEndDtTxt);
			element_InputTextUsingActionClass(assignmentEndDtTxt, date);
			element_TextBoxToClickOnTab(assignmentEndDtTxt);
		}
		//******************************************
		//******Job Costing Tab***************************
		//******************************************
		if(data.get("JobCosting") != null) {
			element_Click(jobCostingTab);
			Thread.sleep(1000);
			if(data.get("JobCosting") != null) {
				waitForElementVisible(jobCostingDD);
				element_DropDownSelectByvisibleText(jobCostingDD, data.get("JobCosting"));
				Thread.sleep(500);
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		pageLoadWaitng();
		String valmsg = validationMessage();
		Assert.assertEquals(valmsg, data.get("Validation"));
		if (!valmsg.equalsIgnoreCase("Saved Successfully")) {
			cancelButtonClick();
		}
		
	}
	
	// Mayank
	public String verifyWorkerID(String name) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userName);
		element_InputTextUsingActionClass(userName, name);
		Thread.sleep(1000);
		element_Click(workerId);
		pageLoadWaitng();
		String userid = workerId.getAttribute("value");
		return userid;
	}
	
	// Mayank
	public void verifyWorkerFromWorkerProfile(List<String> columnHeader, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String msg = null;
		if (element_isEnabled(searchBox)) {
			element_InputTextUsingActionClass(searchBox, data.get("WorkerName"));
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (workerNames.size() > 0) {
				for (int j = 0; j < workerNames.size(); j++) {
					Thread.sleep(1000);
					String id1 = workerNames.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(data.get("WorkerName"))) {
						msg = "Worker Exist";
						workerNames.get(j).click();
						pageLoadWaitng();
						// Validate paremeters// User status 
						if (data.get("Status") != null) {
							String actualRes = statusLabel.getText();
							cancelButtonClick();
							Thread.sleep(1000);
							Assert.assertEquals(actualRes, data.get("Status"));
						}
						// *****************************************************************
						// ********** CWM tab **************************************
						// ****************************************************************
						if(data.get("ContractorName") != null || data.get("WorkOrderName") != null || data.get("AssStartDt") != null || data.get("AssEndDt") != null) {
							Thread.sleep(1000);
							element_Click(cwmTab);
							if (data.get("ContractorName") != null) {
								String actualContractor = contractorNameTxt.getAttribute("value");
								String expectedContractor = data.get("ContractorName");
								Assert.assertEquals(actualContractor, expectedContractor);
							}
							if (data.get("WorkOrderName") != null) {
								String actualWorkOrder = workOrderNameTxt.getAttribute("value");
								String expectedWorkOrder = data.get("WorkOrderName");
								Assert.assertEquals(actualWorkOrder, expectedWorkOrder);
							}
							if (data.get("AssStartDt") != null) {
								String actualAssStartDt = assignmentStartDtTxt.getAttribute("value");
								String expectAssStartDt = staticDateOrPlusMinusFromCurrentDate(data.get("AssStartDt"));
								Assert.assertEquals(actualAssStartDt, expectAssStartDt);
							}
							if (data.get("AssEndDt") != null) {
								String actualAssEndDt = assignmentEndDtTxt.getAttribute("value");
								String expectAssEndDt = staticDateOrPlusMinusFromCurrentDate(data.get("AssEndDt"));
								Assert.assertEquals(actualAssEndDt, expectAssEndDt);
							}
						}
						
						
					}
				}
			}
			if (!ar.contains(data.get("WorkerName"))) {
				msg = "No Data Found";
			}
		}
		else {
			msg = "No Data Found";
		}
		Assert.assertEquals(msg, "Worker Exist");
	}
	
	// Mayank
	public void addToBlacklistWorker(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String msg = null;
		if (element_isEnabled(searchBox)) {
			element_InputTextUsingActionClass(searchBox, data.get("Name"));
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (workerNames.size() > 0) {
				for (int j = 0; j < workerNames.size(); j++) {
					Thread.sleep(1000);
					String id1 = workerNames.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(data.get("Name"))) {
						workerNames.get(j).click();
						pageLoadWaitng();
						// Add to blacklist
						element_Click(addToBlacklistButton);
						pageLoadWaitng();
						element_InputTextUsingActionClass(blacklistReasonTxt, data.get("Reason"));
						element_Click(blacklistPopupOk);
						msg = validationMessage();
					}
				}
			}
			if (!ar.contains(data.get("Name"))) {
				msg = "No Data Found";
			}
		} else {
			msg = "No Data Found";
		}
		Assert.assertEquals(msg, "Worker has been Blacklisted.");
	}
	
	// Mayank
	public void restoredFromBlacklistWorker(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String msg = null;
		if (element_isEnabled(searchBox)) {
			element_InputTextUsingActionClass(searchBox, data.get("Name"));
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (workerNames.size() > 0) {
				for (int j = 0; j < workerNames.size(); j++) {
					Thread.sleep(1000);
					String id1 = workerNames.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(data.get("Name"))) {
						workerNames.get(j).click();
						pageLoadWaitng();
						// restored from blacklist
						if (restoreFromBlacklistButtonCheck.size()>0) {
							element_Click(restoreFromBlacklistButton);
							msg = validationMessage();
						}
						else {
							msg = "Worker is not blacklisted";
						}
					}
				}
			}
			if (!ar.contains(data.get("Name"))) {
				msg = "No Data Found";
			}
		} else {
			msg = "No Data Found";
		}
		Assert.assertEquals(msg, "Worker has been Restored and Activated.");
	}
	
	public void workerAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data) {
		if(columnHeader.contains(data.get("Id"))) {
			if(data.get("Id") != null) {
				apiParameter.add("Id="+data.get("Id"));
			}
		}
		if(columnHeader.contains(data.get("name"))) {
			if(data.get("name") != null) {
				apiParameter.add(data.get("name"));
			}
		}
		if (columnHeader.contains("full-name")) {
			if (data.get("full-name") != null) {
				apiParameter.add("full-name=" + data.get("full-name"));
			}
		}
		if (columnHeader.contains("short-name")) {
			if (data.get("short-name") != null) {
				apiParameter.add("short-name=" + data.get("short-name"));
			}
		}
		if (columnHeader.contains("Active")) {
			if (data.get("Active") != null) {
				apiParameter.add("Active=" + data.get("Active"));
			}
		}
		if (columnHeader.contains("ContractorID")) {
			if (data.get("ContractorID") != null) {
				apiParameter.add("ContractorID=" + data.get("ContractorID"));
			}
		}
		if (columnHeader.contains("SkillID")) {
			if (data.get("SkillID") != null) {
				apiParameter.add("SkillID=" + data.get("SkillID"));
			}
		}
		if (columnHeader.contains("WorkorderID")) {
			if (data.get("WorkorderID") != null) {
				apiParameter.add("WorkorderID=" + data.get("WorkorderID"));
			}
		}
		if (columnHeader.contains("Assignment-start-date")) {
			if (data.get("Assignment-start-date") != null) {
				String dt = staticDateOrPlusMinusFromCurrentDate(data.get("Assignment-start-date"));
				apiParameter.add("Assignment-start-date=" + dt);
			}
		}
		if (columnHeader.contains("Assignment-end-date")) {
			if (data.get("Assignment-end-date") != null) {
				String dt = staticDateOrPlusMinusFromCurrentDate(data.get("Assignment-end-date"));
				apiParameter.add("Assignment-end-date" + dt);
			}
		}
		if (columnHeader.contains("Module")) {
			if (data.get("Module") != null) {
				apiParameter.add("Module=" + data.get("Module"));
			}
		}
		if (columnHeader.contains("date-of-birth")) {
			if (data.get("date-of-birth") != null) {
				String date = daysMonthYear1999forDOB(data.get("date-of-birth"));
				apiParameter.add("date-of-birth=" + date);
			}
		}
		if (columnHeader.contains("joining-date")) {
			if (data.get("joining-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("joining-date"));
				String daterange = date.replace("/", "");
				apiParameter.add("joining-date=" + daterange);
			}
		}
		if (columnHeader.contains("confirmation-date")) {
			if (data.get("confirmation-date") != null) {
				String date = dateSelectedinddMMyyyy(data.get("confirmation-date"));
				apiParameter.add("confirmation-date=" + date);
			}
		}

		if (columnHeader.contains("Leaving-date")) {
			if (data.get("Leaving-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("Leaving-date"));
				String date1 = date.replace("/", "");
				apiParameter.add("Leaving-date=" + date1);
			}
		}
		if (columnHeader.contains("Reason-for-leaving")) {
			if (data.get("Reason-for-leaving\"") != null) {
				apiParameter.add("Reason-for-leaving=" + data.get("Reason-for-leaving"));
			}
		}
		if (columnHeader.contains("pf-no")) {
			if (data.get("pf-no") != null) {
				apiParameter.add("pf-no=" + data.get("pf-no"));
			}
		}
		if (columnHeader.contains("vehicle-reg-no")) {
			if (data.get("vehicle-reg-no") != null) {
				apiParameter.add("vehicle-reg-no=" + data.get("vehicle-reg-no"));
			}
		}
		if (columnHeader.contains("Pan")) {
			if (data.get("Pan") != null) {
				apiParameter.add("Pan=" + data.get("Pan"));
			}
		}
		if (columnHeader.contains("personal-phone")) {
			if (data.get("personal-phone") != null) {
				apiParameter.add("personal-phone=" + data.get("personal-phone"));
			}
		}
		if (columnHeader.contains("personal-cell")) {
			if (data.get("personal-cell") != null) {
				apiParameter.add("personal-cell=" + data.get("personal-cell"));
			}
		}
		if (columnHeader.contains("personal-email")) {
			if (data.get("personal-email") != null) {
				apiParameter.add("personal-email=" + data.get("personal-email"));
			}
		}
		if (columnHeader.contains("official-phone")) {
			if (data.get("official-phone") != null) {
				apiParameter.add("official-phone=" + data.get("official-phone"));
			}
		}
		if (columnHeader.contains("official-extension")) {
			if (data.get("official-extension") != null) {
				apiParameter.add("official-extension=" + data.get("official-extension"));
			}
		}
		if (columnHeader.contains("official-cell")) {
			if (data.get("official-cell") != null) {
				apiParameter.add("official-cell=" + data.get("official-cell"));
			}
		}
		if (columnHeader.contains("official-email")) {
			if (data.get("official-email") != null) {
				apiParameter.add("official-email=" + data.get("official-email"));
			}
		}
		if (columnHeader.contains("reporting-incharge")) {
			if (data.get("reporting-incharge") != null) {
				apiParameter.add("reporting-incharge=" + data.get("reporting-incharge"));
			}
		}
		if (columnHeader.contains("ess-login")) {
			if (data.get("ess-login") != null) {
				apiParameter.add("ess-login=" + data.get("ess-login"));
			}
		}
		if (columnHeader.contains("Ess-detail-edit")) {
			if (data.get("Ess-detail-edit") != null) {
				apiParameter.add("Ess-detail-edit=" + data.get("Ess-detail-edit"));
			}
		}
		if (columnHeader.contains("Attendance-via-ess")) {
			if (data.get("Attendance-via-ess") != null) {
				apiParameter.add("Attendance-via-ess=" + data.get("Attendance-via-ess"));
			}
		}
		if (columnHeader.contains("Attendance-calc")) {
			if (data.get("Attendance-calc") != null) {
				apiParameter.add("Attendance-calc=" + data.get("Attendance-calc"));
			}
		}
		if (columnHeader.contains("attendance-policy")) {
			if (data.get("attendance-policy") != null) {
				apiParameter.add("attendance-policy=" + data.get("attendance-policy"));
			}
		}
		if (columnHeader.contains("lateIn-policy")) {
			if (data.get("lateIn-policy") != null) {
				apiParameter.add("lateIn-policy=" + data.get("lateIn-policy"));
			}
		}
		if (columnHeader.contains("earlyOut-policy")) {
			if (data.get("earlyOut-policy") != null) {
				apiParameter.add("earlyOut-policy=" + data.get("earlyOut-policy"));
			}
		}
		if (columnHeader.contains("overtime-policy")) {
			if (data.get("overtime-policy") != null) {
				apiParameter.add("overtime-policy=" + data.get("overtime-policy"));
			}
		}
		if (columnHeader.contains("absentee-policy")) {
			if (data.get("absentee-policy") != null) {
				apiParameter.add("absentee-policy=" + data.get("absentee-policy"));
			}
		}
		if (columnHeader.contains("coff-policy")) {
			if (data.get("coff-policy") != null) {
				apiParameter.add("coff-policy=" + data.get("coff-policy"));
			}
		}
		if (columnHeader.contains("pin")) {
			if (data.get("pin") != null) {
				apiParameter.add("pin=" + data.get("pin"));
			}
		}
		if (columnHeader.contains("card-1")) {
			if (data.get("card-1") != null) {
				apiParameter.add("card-1=" + data.get("card-1"));
			}
		}
		if (columnHeader.contains("card-2")) {
			if (data.get("card-2") != null) {
				apiParameter.add("card-2=" + data.get("card-2"));
			}
		}
		if (columnHeader.contains("Shift-schedule")) {
			if (data.get("Shift-schedule") != null) {
				apiParameter.add("Shift-schedule=" + data.get("Shift-schedule"));
			}
		}
		if (columnHeader.contains("start-shift")) {
			if (data.get("start-shift") != null) {
				apiParameter.add("start-shift=" + data.get("start-shift"));
			}
		}
		if (columnHeader.contains("holiday-schedule")) {
			if (data.get("holiday-schedule") != null) {
				apiParameter.add("holiday-schedule=" + data.get("holiday-schedule"));
			}
		}
		if (columnHeader.contains("device-group-id")) {
			if (data.get("device-group-id") != null) {
				apiParameter.add("device-group-id=" + data.get("device-group-id"));
			}
		}
		if (columnHeader.contains("device-group")) {
			if (data.get("device-group") != null) {
				apiParameter.add("device-group=" + data.get("device-group"));
			}
		}
		if (columnHeader.contains("visa-no")) {
			if (data.get("visa-no") != null) {
				apiParameter.add("visa-no=" + data.get("visa-no"));
			}
		}
		if (columnHeader.contains("visa-expiry")) {
			if (data.get("visa-expiry") != null) {
				String date = dateSelectedinddMMyyyy(data.get("visa-expiry"));
				apiParameter.add("visa-expiry=" + date);
			}
		}
		if (columnHeader.contains("driving-license-expiry")) {
			if (data.get("driving-license-expiry") != null) {
				String date = dateSelectedinddMMyyyy(data.get("driving-license-expiry"));
				apiParameter.add("driving-license-expiry=" + date);
			}
		}
		if (columnHeader.contains("driving-license")) {
			if (data.get("driving-license") != null) {
				apiParameter.add("driving-license=" + data.get("driving-license"));
			}
		}
		if (columnHeader.contains("passport-no")) {
			if (data.get("passport-no") != null) {
				apiParameter.add("passport-no=" + data.get("passport-no"));
			}
		}
		if (columnHeader.contains("passport-expiry")) {
			if (data.get("passport-expiry") != null) {
				String date = dateSelectedinddMMyyyy(data.get("passport-expiry"));
				apiParameter.add("passport-expiry=" + date);
			}
		}
		if (columnHeader.contains("job-assignment-type")) {
			if (data.get("job-assignment-type") != null) {
				apiParameter.add("job-assignment-type=" + data.get("job-assignment-type"));
			}
		}
		if (columnHeader.contains("FVM-enable")) {
			if (data.get("FVM-enable") != null) {
				apiParameter.add("FVM-enable=" + data.get("FVM-enable"));
			}
		}
		if (columnHeader.contains("authorized-host-user")) {
			if (data.get("authorized-host-user") != null) {
				apiParameter.add("authorized-host-user=" + data.get("authorized-host-user"));
			}
		}
		if (columnHeader.contains("Allow-ecanteen")) {
			if (data.get("Allow-ecanteen") != null) {
				apiParameter.add("Allow-ecanteen=" + data.get("Allow-ecanteen"));
			}
		}
		if (columnHeader.contains("account-type")) {
			if (data.get("account-type") != null) {
				apiParameter.add("account-type=" + data.get("account-type"));
			}
		}
		if (columnHeader.contains("max-allowed-limit")) {
			if (data.get("max-allowed-limit") != null) {
				apiParameter.add("max-allowed-limit=" + data.get("max-allowed-limit"));
			}
		}
		// by Chhaya
		if (columnHeader.contains("punch-api")) {
			if (data.get("punch-api") != null) {
				apiParameter.add("punch-api=" + data.get("punch-api"));
			}
		}
		// by Chhaya
		if (columnHeader.contains("FVM-enable")) {
			if (data.get("FVM-enable") != null) {
				apiParameter.add("FVM-enable=" + data.get("FVM-enable"));
			}
		}
		// by Chhaya
		if (columnHeader.contains("job-assignment-type")) {
			if (data.get("job-assignment-type") != null) {
				apiParameter.add("job-assignment-type=" + data.get("job-assignment-type"));
			}
		}
		// by Chhaya
		if (columnHeader.contains("enable-fr")) {
			if (data.get("enable-fr") != null) {
				apiParameter.add("enable-fr=" + data.get("enable-fr"));
			}
		}
		// Mayank
		if (columnHeader.contains("Organization_code")) {
			if (data.get("Organization_code") != null) {
				apiParameter.add("Organization_code=" + data.get("Organization_code"));
			}
		}
		if (columnHeader.contains("branch_code")) {
			if (data.get("branch_code") != null) {
				apiParameter.add("branch_code=" + data.get("branch_code"));
			}
		}
		if (columnHeader.contains("department_code")) {
			if (data.get("department_code") != null) {
				apiParameter.add("department_code=" + data.get("department_code"));
			}
		}
		if (columnHeader.contains("category_code")) {
			if (data.get("category_code") != null) {
				apiParameter.add("category_code=" + data.get("category_code"));
			}
		}
		if (columnHeader.contains("grade_code")) {
			if (data.get("grade_code") != null) {
				apiParameter.add("grade_code=" + data.get("grade_code"));
			}
		}
		if (columnHeader.contains("designation_code")) {
			if (data.get("designation_code") != null) {
				apiParameter.add("designation_code=" + data.get("designation_code"));
			}
		}
		if (columnHeader.contains("section_code")) {
			if (data.get("section_code") != null) {
				apiParameter.add("section_code=" + data.get("section_code"));
			}
		}
		if (columnHeader.contains("Blacklisted")) {
			if (data.get("Blacklisted") != null) {
				apiParameter.add("Blacklisted=" + data.get("Blacklisted"));
			}
		}
		if (columnHeader.contains("customgroup1_code")) {
			if (data.get("customgroup1_code") != null) {
				apiParameter.add("customgroup1_code=" + data.get("customgroup1_code"));
			}
		}
		if (columnHeader.contains("customgroup2_code")) {
			if (data.get("customgroup2_code") != null) {
				apiParameter.add("customgroup2_code=" + data.get("customgroup2_code"));
			}
		}
		if (columnHeader.contains("customgroup3_code")) {
			if (data.get("customgroup3_code") != null) {
				apiParameter.add("customgroup3_code=" + data.get("customgroup3_code"));
			}
		}
		if (columnHeader.contains("access-validity-date")) {
			if (data.get("access-validity-date") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("access-validity-date"));
				apiParameter.add("access-validity-date=" + date);
			}
		}
	}
	
	public void verifyJobScheduler(String workerID, DataTable dataTable) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(workerId);
		addButtonClick();
		Thread.sleep(1000);
		element_Clear(workerId);
		element_InputTextUsingActionClass(workerId, workerID);
		element_TextBoxToClickOnTab(workerId);
		
		Thread.sleep(3000);
		if(!element_getInputControlValue(userName).isBlank() || !element_getInputControlValue(userName).isEmpty()) {
			element_Click(jobCostingTab);
			Thread.sleep(1000);
			element_Click(assignedJobSchedulesTab);
			Thread.sleep(1000);
			for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String actualStartDate = null;
				String actualEndDate = null;
				String schedulerStartDate = null;
				String schedulerEndDate = null;
				if(data.get("SchedulerType") != null) {
						if(data.get("SchedulerType").equalsIgnoreCase("Monthly") || data.get("SchedulerType").equalsIgnoreCase("Daily") || data.get("SchedulerType").equalsIgnoreCase("Weekly")) {
						String month = null;
						String year = null;
						if (data.get("Month") != null) {
							if (data.get("Month").equalsIgnoreCase("Current")) {
								month = integerMonthSelected("0");
								year = integerYearSelected("0");
							}else if (data.get("Month").equalsIgnoreCase("Next")) {
								month = integerMonthSelected("1");
								year = staticYearOrPlusMinusYearFromCurrentYear("1","0");
							}
						}else {
							month = integerMonthSelected("0");
							year = integerYearSelected("0");
						}
						if(data.get("SchedulerStartDate") != null) {
							if (data.get("SchedulerStartDate").length() == 1) {
								schedulerStartDate = "0" + data.get("SchedulerStartDate") + "/" + month + "/" + year;
							} else {
								schedulerStartDate = data.get("SchedulerStartDate") + "/" + month + "/" + year;
							}
						}
						if(data.get("SchedulerEndDate") != null) {
								int endDateValue = Integer.parseInt(data.get("SchedulerEndDate"));
								if(endDateValue == 31) {
									DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
									LocalDate lt = LocalDate.now();
									LocalDate currentMonthLastDate=LocalDate.of(lt.getYear(), lt.getMonthValue(), lt.lengthOfMonth());
									schedulerEndDate = currentMonthLastDate.format(formatter);
								} else if (data.get("SchedulerEndDate").length() == 1) {
									schedulerEndDate = "0" + data.get("SchedulerEndDate") + "/" + month + "/" + year;
								} else {
									schedulerEndDate = data.get("SchedulerEndDate") + "/" + month + "/" + year;
								}
						}
					}
				}else if(data.get("SchedulerStartDate") != null && data.get("SchedulerEndDate") != null){
					schedulerStartDate = staticDateOrPlusMinusFromCurrentDate(data.get("SchedulerStartDate"));
					 schedulerEndDate = staticDateOrPlusMinusFromCurrentDate(data.get("SchedulerEndDate"));
				}
				if (data.containsKey("TableContent") && data.get("TableContent") != null ) {
					if (element_isEnabled(jobSchedulerSearchBox)) {
						element_Clear(jobSchedulerSearchBox);
						element_InputTextUsingActionClass(jobSchedulerSearchBox, data.get("SchedulerName"));
						element_TextBoxToClickOnEnter(jobSchedulerSearchBox);
						Assert.assertEquals(notDataFoundLabel.getText(), data.get("TableContent"));
					}else {
						Assert.assertEquals(notDataLabel.getText(), data.get("TableContent"));
					}
				}else if (element_isEnabled(jobSchedulerSearchBox)) {
					element_Clear(jobSchedulerSearchBox);
					element_InputTextUsingActionClass(jobSchedulerSearchBox, data.get("SchedulerName"));
					element_TextBoxToClickOnEnter(jobSchedulerSearchBox);
					if(jobSchedulerTable.size() >0) {
					for (int i = 0; i < jobSchedulerTable.size(); i++) {
						String actualSchedulerName = jobSchedulerTable.get(i).getText();
						if (actualSchedulerName.equalsIgnoreCase(data.get("SchedulerName"))) {
							actualStartDate = jobSchedulerTable.get(i).findElement(By.xpath("following-sibling::td[1]"))
									.getText();
							actualEndDate = jobSchedulerTable.get(i).findElement(By.xpath("following-sibling::td[2]"))
									.getText();
							Thread.sleep(500);
							break;
						}
					}
					Assert.assertEquals(actualStartDate, schedulerStartDate);
					Assert.assertEquals(actualEndDate, schedulerEndDate);
					}
				}else {
					Assert.assertEquals("Job Scheduler not Found", data.get("SchedulerName"));
				}
			}
			cancelButtonClick();
		}else {
			Assert.assertEquals("Worker Not Found", workerID);
		}
	}
}
