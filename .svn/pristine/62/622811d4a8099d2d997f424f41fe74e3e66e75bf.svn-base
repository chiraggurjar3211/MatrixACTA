package PageObject.JobProcessingCosting;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class ProjectPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ProjectPO.class);
	public ProjectPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//Elements
	@FindBy(xpath = "//*[@gridname='gvProjectDetail']//*[@name='cmnTxtSearch']")
	private WebElement projectSearchBar;
	
	@FindBy(xpath = "//*[@gridname='gvProjectDetail']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> projectNames;
	
	@FindBy(id = "JPCProjectID")
	private WebElement codetext;
	
	@FindBy(id = "JPCProjectName")
	private WebElement nametext;
	
	@FindBy(xpath = "//*[@name='CalFrom']//*[@id='_txtPhaseFDate']")
	private WebElement projectFromDatetext;
	
	@FindBy(xpath = "//*[@name='CalTo']//*[@id='_txtPhaseTDate']")
	private WebElement projectToDatetext;
	
	@FindBy(xpath = "//*[@gridname='gvProjectDetail']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][3]")
	private List<WebElement> projectStatus;
	
	// Project Tab Grid
	@FindBy(id = "gvPhaseConfigaddBtn")
	private WebElement gridAddBtn;
	
	@FindBy(id = "Phasecode")
	private WebElement gridCodeTxt;
	
	@FindBy(id = "JPCPhaseName")
	private WebElement gridPhaseNameTxt;
	
	@FindBy(id = "_Fromdate")
	private WebElement gridFDateTxt;
	
	@FindBy(id = "_Todate")
	private WebElement gridTDateTxt;
	
	@FindBy(xpath = "//*[@title='OK'][not(@hidden)]")
	private WebElement gridSaveBtn;
	
	@FindBy(xpath = "//*[contains(@id,'gvPhaseConfigrow')]//*[@title='Delete']")
	private List<WebElement> gridDeleteBtns;
	
	@FindBy(xpath = "//*[@id='gvPhaseConfigrow0']//*[@title='Delete']")
	private WebElement gridDeleteBtn;
	
	@FindBy(id = "mdcancel")
	private WebElement popupCancelBtn;
	
	@FindBy(id = "mdcancel")
	private List<WebElement> popupCancelBtnSize;
	
	@FindBy(xpath = "//*[@id='div_grd_gvPhaseConfig']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> phaseConfigTable;
	
	//********************************************************
	// Phase Tab
	@FindBy(xpath = "(//*[@class='nav navbar-nav hr-tab hr-tab-sa-user panel-group accordion']/li)[2]")
	private WebElement phaseTab;
	
	@FindBy(xpath = "(//*[@class='nav navbar-nav hr-tab hr-tab-sa-user panel-group accordion']/li)[2]")
	private WebElement phaseTabClick;	//Chhaya
	
	@FindBy(xpath = "//*[@gridname='gvPhaseDetail']//*[@name='cmnTxtSearch']")
	private WebElement phaseSearchBar;
	
	@FindBy(xpath = "//*[@gridname='gvPhaseDetail']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> phaseNames;
	
	@FindBy(xpath = "//*[contains(@id,'gvJobConfigrow')]//*[@title='Delete']")
	private List<WebElement> gridPhaseTabDeleteBtns;
	
	@FindBy(xpath = "//*[@id='gvJobConfigrow0']//*[@title='Delete']")
	private WebElement gridPhaseTabDeleteBtn;
	
	// Phase Tab Grid
	@FindBy(id = "gvJobConfigaddBtn")
	private WebElement phasegridAddBtn;
		
	@FindBy(id = "JPCJobNotAssignedToProjID")
	private WebElement phasegridJobeCodeTxt;
	
	@FindBy(id = "_FromDate")
	private WebElement phasegridFDateTxt;
	
	@FindBy(id = "_ToDate")
	private WebElement phasegridTDateTxt;
	
	@FindBy(xpath = "//*[@id='message']/div/label")
	private List<WebElement> validationMessagexpathSize;
	
	// By Mayank
	// Functions
	//************************************************************************************
	//************* Create Project *******************************************************
	//************************************************************************************
	public void createProject(String projectName, String projectSdate, String projectEdate, List<Map<String, String>> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(nametext);
		if (element_isEnabled(projectSearchBar))
		{
			element_InputTextUsingActionClass(projectSearchBar, projectName);
			element_TextBoxToClickOnEnter(projectSearchBar);
			Thread.sleep(1000);
			ArrayList<String> allprojectNames = new ArrayList<>();
			if (projectNames.size() > 0) {
				for (int j = 0; j < projectNames.size(); j++) {
					String projName = projectNames.get(j).getText();
					allprojectNames.add(projectName);
					if (projName.equalsIgnoreCase(projectName)) {
						projectNames.get(j).click();
						// if project end date is gone and project is finished then it's not allowed to edit so need to delete that project
						if (projectStatus.get(j).getText().equalsIgnoreCase("Finished")) {
							deleteButtonClick();
							driver.switchTo().alert().accept();
							Thread.sleep(1000);
							Assert.assertEquals(validationMessage(), "Deleted Successfully");
							addButtonClick();
							Thread.sleep(1500);
							element_Clear(codetext);
							element_InputTextUsingActionClass(codetext, projectName);
						}
					}
				}
			}
			if (!allprojectNames.contains(projectName)) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1500);
				element_Clear(codetext);
				element_InputTextUsingActionClass(codetext, projectName);
			}
		}
		else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1500);
			element_Clear(codetext);
			element_InputTextUsingActionClass(codetext, projectName);
		}
		//Main Code
		Thread.sleep(1000);
		if (projectSdate != null) {
			String sdate=staticDateOrPlusMinusFromCurrentDate(projectSdate);
			element_Clear(projectFromDatetext);
			element_InputTextUsingActionClass(projectFromDatetext, sdate);
		}
		if (projectEdate != null) {
			String edate=staticDateOrPlusMinusFromCurrentDate(projectEdate);
			element_Clear(projectToDatetext);
			element_InputTextUsingActionClass(projectToDatetext, edate);
		}
		// Add components in grid
		Thread.sleep(500);
		while (gridDeleteBtns.size()!=0) {
			element_Click(gridDeleteBtn);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
		}
		for (int i = 0; i < data.size(); i++) {
			String codeOfPhaseConfig = data.get(i).get("CodeOfPhaseConfig");
			String phase = data.get(i).get("Phase");
			String startDate = data.get(i).get("StartDate");
			String endDate = data.get(i).get("EndDate");
			element_Click(gridAddBtn);
			Thread.sleep(500);
			if (codeOfPhaseConfig != null) {
				element_Clear(gridCodeTxt);
				element_InputTextUsingActionClass(gridCodeTxt, codeOfPhaseConfig);
				Thread.sleep(1000);
			}
			if (phase != null) {
				element_Clear(gridPhaseNameTxt);
				element_InputTextUsingActionClass(gridPhaseNameTxt, phase);
				Thread.sleep(1000);
			}
			if (startDate != null) {
				String sdate=staticDateOrPlusMinusFromCurrentDate(startDate);
				element_Clear(gridFDateTxt);
				element_InputTextUsingActionClass(gridFDateTxt, sdate);
			}
			if (endDate != null) {
				String edate=staticDateOrPlusMinusFromCurrentDate(endDate);
				element_Clear(gridTDateTxt);
				element_InputTextUsingActionClass(gridTDateTxt, edate);
			}
			Thread.sleep(1000);
			element_Click(gridSaveBtn);
		}
		Thread.sleep(1000);
		if (projectName != null) {
			element_Clear(nametext);
			element_InputTextUsingActionClass(nametext, projectName);
		}
		saveButtonClick();
		String val = validationMessage();
		Assert.assertEquals(val, "Saved Successfully");
	}
	
	// By Mayank
	//************************************************************************************
	//************* Job Configuration In Phase tab of Project *******************************************************
	//************************************************************************************
	public void jobConfigInPhaseInProject(String phase, String project, List<Map<String, String>> data) throws InterruptedException {
		// Project Tab
		pageLoadWaitng();
		waitForElementVisible(nametext);
		String val = null;
		String val1 = null;
		if (element_isEnabled(projectSearchBar))
		{	
			element_InputTextUsingActionClass(projectSearchBar, project);
			element_TextBoxToClickOnEnter(projectSearchBar);
			Thread.sleep(1000);
			ArrayList<String> allprojectNames = new ArrayList<>();
			if (projectNames.size() > 0) {
				for (int j = 0; j < projectNames.size(); j++) {
					String projName = projectNames.get(j).getText();
					allprojectNames.add(project);
					if (projName.equalsIgnoreCase(project)) {
						projectNames.get(j).click();
						// Main Code
						// Phase Tab
						Thread.sleep(1000);
						element_Click(phaseTab);
						Thread.sleep(500);
						if (element_isEnabled(phaseSearchBar))
						{	
							element_InputTextUsingActionClass(phaseSearchBar, phase);
							element_TextBoxToClickOnEnter(phaseSearchBar);
							Thread.sleep(1000);
							ArrayList<String> allphaseNames = new ArrayList<>();
							if (phaseNames.size() > 0) {
								for (int k = 0; k < phaseNames.size(); k++) {
									String phName = phaseNames.get(k).getText();
									allphaseNames.add(phase);
									if (phName.equalsIgnoreCase(phase)) {
										phaseNames.get(k).click();
										// Add components in grid
										Thread.sleep(500);
										while (gridPhaseTabDeleteBtns.size()!=0) {
											element_Click(gridPhaseTabDeleteBtn);
											driver.switchTo().alert().accept();
											Thread.sleep(1000);
										}
										for (int i = 0; i < data.size(); i++) {
											String jobCode = data.get(i).get("JobCode");
											String startDate = data.get(i).get("StartDate");
											String endDate = data.get(i).get("EndDate");
											element_Click(phasegridAddBtn);
											Thread.sleep(500);
											if (jobCode != null) {
												element_InputTextUsingActionClass(phasegridJobeCodeTxt, jobCode);
												Thread.sleep(300);
												element_TextBoxToClickOnTab(phasegridJobeCodeTxt);
										
											}
											if (startDate != null) {
												if (phasegridFDateTxt.isEnabled()) {
													String sdate=staticDateOrPlusMinusFromCurrentDate(startDate);
													element_Clear(phasegridFDateTxt);
													element_InputTextUsingActionClass(phasegridFDateTxt, sdate);
												}
											}
											if (endDate != null) {
												if (phasegridTDateTxt.isEnabled()) {
													String edate=staticDateOrPlusMinusFromCurrentDate(endDate);
													element_Clear(phasegridTDateTxt);
													element_InputTextUsingActionClass(phasegridTDateTxt, edate);
												}
											}
											Thread.sleep(500);
											element_Click(gridSaveBtn);
											Thread.sleep(700);
											if(data.get(i).get("Validation") != null) {
												val1 = data.get(i).get("Validation");
												String valMsg = validationMessage();
												Thread.sleep(500);
												Assert.assertEquals(valMsg, val1);
											}
											Thread.sleep(500);
										}
										Thread.sleep(1000);
										saveButtonClick();
										val = validationMessage();
									}
								}
							}
							if (!allphaseNames.contains(phase)) {
								Thread.sleep(1000);
								val = "Defined Phase is not exist. configure phase in project first.";
								logger.debug(val);
							}
						}
						else {
							Thread.sleep(1000);
							val = "Any Phase is not exist. configure phase in project first.";
							logger.debug(val);
						}
					}
					break;
				}
			}
			if (!allprojectNames.contains(project)) {
				Thread.sleep(1000);
				val = "Project is not exist. create project first.";
				logger.debug(val);
			}
		}
		else {
			Thread.sleep(1000);
			val = "Project is not exist. create project first.";
			logger.debug(val);
		}
		if(val1 != null) {
			Assert.assertEquals(val, val1);
			reloadPageButtonClick();
		}else {
			Assert.assertEquals(val, "Saved Successfully");
		}
		
	}
	
	//*****************************************************************************************
	//**************** Delete Project *********************************************************
	//*****************************************************************************************
	public void deleteProject(String project) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(nametext);
		if (element_isEnabled(projectSearchBar))
		{
			element_InputTextUsingActionClass(projectSearchBar, project);
			element_TextBoxToClickOnEnter(projectSearchBar);
			Thread.sleep(1000);
			ArrayList<String> allprojectNames = new ArrayList<>();
			if (projectNames.size() > 0) {
				for (int j = 0; j < projectNames.size(); j++) {
					String projName = projectNames.get(j).getText();
					allprojectNames.add(project);
					if (projName.equalsIgnoreCase(project)) {
						projectNames.get(j).click();
						Thread.sleep(2000);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
					}
				}
			}
			if (!allprojectNames.contains(project)) {
				logger.debug("Project is not exist.");
			}
		}
		else {
			logger.debug("Project is not exist.");
		}
	}
	//by Chhaya
	public void verifyPhaseTabName(String tabName) throws InterruptedException {
		logger.info("TabName: " + tabName);
		pageLoadWaitng();
		waitForElementVisible(nametext);
		Thread.sleep(1000);
		element_Click(phaseTabClick);
		Thread.sleep(1000);
		String phaseTabName = phaseTabClick.getText();

		Assert.assertEquals(phaseTabName, tabName);
	}
	
	public void updateProject(String projectName, String projectSdate, String projectEdate, Map<String, String> data) throws InterruptedException {
		String valMsg = null;
		String valMsg1 = null;
		pageLoadWaitng();
		waitForElementVisible(nametext);
		element_Clear(codetext);
		element_dynamicDDSelect(codetext, projectName);
//		element_TextBoxToClickOnTab(codetext);
		
		if (!element_getInputControlValue(nametext).isBlank() || !element_getInputControlValue(nametext).isEmpty()) {
			System.out.println("I am here1");
			
			String projectFromDate = staticDateOrPlusMinusFromCurrentDate(projectSdate);
			String projectToDate = staticDateOrPlusMinusFromCurrentDate(projectEdate);		
			element_Clear(projectFromDatetext);
			Thread.sleep(500);
			element_InputTextUsingActionClass(projectFromDatetext, projectFromDate);
			element_TextBoxToClickOnTab(projectFromDatetext);
			element_Clear(projectToDatetext);
			Thread.sleep(500);
			element_InputTextUsingActionClass(projectToDatetext, projectToDate);
			element_TextBoxToClickOnTab(projectToDatetext);
			if(data.get("CodeOfPhaseConfig") != null && data.get("Phase") != null) {
				for(int i = 0; i<phaseConfigTable.size(); i++) {
					String actCode = phaseConfigTable.get(i).getText();
					String actPhase = phaseConfigTable.get(i).findElement(By.xpath("following-sibling::td[1]")).getText();
					if(data.get("CodeOfPhaseConfig").equalsIgnoreCase(actCode) && data.get("Phase").equalsIgnoreCase(actPhase)) {
						WebElement editBtn = phaseConfigTable.get(i).findElement(By.xpath("following-sibling::td[5]/i[@title='Edit']"));
						element_Click(editBtn);
						Thread.sleep(500);
						if(data.get("StartDate") != null) {
							String phFromDate = staticDateOrPlusMinusFromCurrentDate(data.get("StartDate"));
							element_Clear(gridFDateTxt);
							Thread.sleep(500);
							element_InputTextUsingActionClass(gridFDateTxt, phFromDate);
							element_TextBoxToClickOnTab(gridFDateTxt);
						}
						if(data.get("EndDate") != null) {
							String phEndDate = staticDateOrPlusMinusFromCurrentDate(data.get("EndDate"));
							element_Clear(gridTDateTxt);
							Thread.sleep(500);
							element_InputTextUsingActionClass(gridTDateTxt, phEndDate);
							element_TextBoxToClickOnTab(gridTDateTxt);
						}
						Thread.sleep(500);
						element_Click(gridSaveBtn);
						Thread.sleep(700);
						if(validationMessagexpathSize.size() > 0) { //to handle validation messages for grid Save button
							valMsg1 = validationMessage();
							Thread.sleep(500);
							Assert.assertEquals(valMsg1, data.get("Validation")); //grid Save button and title bar save button validation messages are same tha's why used data.get("Validation")
						}
					}
				}
			}
			saveButtonClick();
			Thread.sleep(1000);
			valMsg = validationMessage();
			Assert.assertEquals(valMsg, data.get("Validation"));
			Thread.sleep(500);
			reloadPageButtonClick();
		}else{
			if(popupCancelBtnSize.size() > 0) {
				element_Click(popupCancelBtn);
			}
			Assert.assertEquals("Invalid Project Name", data.get("Validation"));
		}
	}
}
