package PageObject.ContractorWorkerManagement;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;


import CommonAbstract.AbstractMethod;


public class WorkOrderPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(WorkOrderPO.class);
	
	public WorkOrderPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//**********************************************************************************************
	//**************** Elements *******************************************************************
	//*********************************************************************************************
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> workorderIDs;
	
	@FindBy(id = "WorkOrderID")
	private WebElement workorderID;
	
	@FindBy(id = "WorkOrderName")
	private WebElement workorderName;
	
	@FindBy(id = "_FromDate")
	private WebElement validityFromDt;
	
	@FindBy(id = "_ToDate")
	private WebElement validityToDt;
	
	//*******************************************************
	// General Panel Elements
	//*******************************************************
				
	@FindBy(xpath = "//*[@class='collapsed']//*[@default='General']")
	private List<WebElement> generalPanelOpenOrNot;
			
	@FindBy(xpath = "//*[@default='General']")
	private WebElement generalPanel;
	
	@FindBy(id = "CWMValidContractorsName")
	private WebElement contractorNametxt;
	
	@FindBy(id = "CWMAppStageName")
	private WebElement approvalStageNametxt;
	
	@FindBy(id = "txtMaxWrkLimit")
	private WebElement maxWorkerLimittxt;
	
	@FindBy(xpath = "//*[@id='message']/div/label")
	private List<WebElement> validationMessages;
	
	@FindBy(id = "flgchkMaxWorkerLimit")
	private WebElement checkLimitWhileAssigningWorkerFlag;
	
	// SKillWise worker limit
	@FindBy(xpath = "//*[contains(@id,'gvSkillrow')]//*[@title='Delete']")
	private List<WebElement> gridDeleteBtns;
	
	@FindBy(xpath = "//*[@id='gvSkillrow0']//*[@title='Delete']")
	private WebElement gridDeleteBtn;
	
	@FindBy(id = "gvSkilladdBtn")
	private WebElement gvSkilladdBtn;
	
	@FindBy(id = "CWMSkillNameName")
	private WebElement skillNameTxt;
	
	@FindBy(id = "WrkLimit")
	private WebElement skillWorkerLimitTxt;
	
	@FindBy(xpath = "//*[@id='savebtn'][not(@hidden)]")
	private WebElement gridSaveBtn;
	
	//**********************************************************************************************
	//**************** Functions *******************************************************************
	//*********************************************************************************************
	// Created by Mayank
	//**********************************************************
	// Work Order Delete via API
	//**********************************************************
	public String workOrderDeleteAPI(List<String> columnHeader,List<String> apiParameter,Map<String, String> data) {
		String apiPar=null;
		if (columnHeader.contains("id")) {
			if(data.get("id") != null) {
				apiParameter.add("id="+data.get("id"));
			}
		}
		return apiPar;
	}
	
	// Created by Mayank
	//**********************************************************
	// Work Order create 
	//**********************************************************
	public void createWorkOrder(List<String> columnHeader, Map<String, String> data) throws InterruptedException {
		String msg = null;
		Thread.sleep(1000);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Id"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (workorderIDs.size() > 0) {
				for (int j = 0; j < workorderIDs.size(); j++) {
					String id1 = workorderIDs.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(data.get("Id"))) {
						workorderIDs.get(j).click();
					}
				}
			}
			//logger.debug(ar);
			if (!ar.contains(data.get("Id"))) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(workorderID);
				element_InputTextUsingActionClass(workorderID, data.get("Id"));
			}
		}
		else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(workorderID);
			element_InputTextUsingActionClass(workorderID, data.get("Id"));
		}
		Thread.sleep(1000);
		// Main Code
		
		if (columnHeader.contains("ValidityStart")) {
			if (data.get("ValidityStart") != null) {
				String sdate = staticDateOrPlusMinusFromCurrentDate(data.get("ValidityStart"));
				element_Clear(validityFromDt);
				element_InputTextUsingActionClass(validityFromDt, sdate);
			}
		}
		if (columnHeader.contains("ValidityEnd")) {
			if (data.get("ValidityEnd") != null) {
				String edate = staticDateOrPlusMinusFromCurrentDate(data.get("ValidityEnd"));
				element_Clear(validityToDt);
				element_InputTextUsingActionClass(validityToDt, edate);
			}
		}
		//**************************************************************************
		//****** General Panel******************************************************
		//**************************************************************************
		Thread.sleep(1000);
		if (generalPanelOpenOrNot.size()>0) {
			element_Click(generalPanel);
		}
		Thread.sleep(500);
		if (columnHeader.contains("AssociatedContractorName")) {
			if (data.get("AssociatedContractorName") != null) {
				element_Clear(contractorNametxt);
				element_InputTextUsingActionClass(contractorNametxt, data.get("AssociatedContractorName"));
				Thread.sleep(1000);
				element_TextBoxToClickOnTab(contractorNametxt);
			}
		}
		if (columnHeader.contains("ApprovalStageName")) {
			if (data.get("ApprovalStageName") != null) {
				element_Clear(approvalStageNametxt);
				element_InputTextUsingActionClass(approvalStageNametxt, data.get("ApprovalStageName"));
				Thread.sleep(400);
				element_TextBoxToClickOnTab(approvalStageNametxt);
			}
		}
		if (columnHeader.contains("MaxWorkerLimit")) {
			if (data.get("MaxWorkerLimit") != null) {
				element_Clear(maxWorkerLimittxt);
				element_InputTextUsingActionClass(maxWorkerLimittxt, data.get("MaxWorkerLimit"));
			}
		}
		if (columnHeader.contains("ChkLimitWhileAssigningWorker")) {
			if (data.get("ChkLimitWhileAssigningWorker") != null) {
				boolean ChkLimitWhileAssigningWorker1 = Boolean.parseBoolean(data.get("ChkLimitWhileAssigningWorker"));
				if (ChkLimitWhileAssigningWorker1==true) {
					if (!checkLimitWhileAssigningWorkerFlag.isSelected()) {
						element_Click(checkLimitWhileAssigningWorkerFlag);
					}
				}
				else {
					if (checkLimitWhileAssigningWorkerFlag.isSelected()) {
						element_Click(checkLimitWhileAssigningWorkerFlag);
					}
				}
			}
		}
		if (columnHeader.contains("Name")) {
			if (data.get("Name") != null) {
				element_Clear(workorderName);
				element_InputTextUsingActionClass(workorderName, data.get("Name"));
			}
		}
		//*********************************************************************************
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(1000);
		if (validationMessages.size()==0) {
			saveButtonClick();
		}
		msg = validationMessage();
		Assert.assertEquals(msg, data.get("Validation"));
	}
	
	public void verifyWorkOrderName(Map<String, String> data) throws InterruptedException
	{
		pageLoadWaitng();
		//waitForElementVisible(workorderID);
		boolean expRes = true;
		boolean actRes = false;
		addButtonClick();
		Thread.sleep(1000);
		element_Clear(workorderID);
		element_InputTextUsingActionClass(workorderID, data.get("ID"));
		Thread.sleep(500);
		element_TextBoxToClickOnTab(workorderID);
		Thread.sleep(2000);
		if (!element_getInputControlValue(workorderName).isBlank() || !element_getInputControlValue(workorderName).isEmpty()) {
			actRes = true;
		}
		reloadPageButtonClick();
		Thread.sleep(3000);
		Assert.assertEquals(actRes, expRes);
	}
	
	// Mayank
	public String skillWiseWorkerLimitSet(String workorderID, List<Map<String, String>> data) throws InterruptedException {
		String msg= null;
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, workorderID);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (workorderIDs.size() > 0) {
				for (int j = 0; j < workorderIDs.size(); j++) {
					String id1 = workorderIDs.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(workorderID)) {
						logger.debug("WorkorderID Mathched");
						workorderIDs.get(j).click();
						Thread.sleep(1000);
						// General Panel
						if (generalPanelOpenOrNot.size()>0) {
							element_Click(generalPanel);
						}
						Thread.sleep(500);
						//Delete already configured grid components for newly updated configuration if any
						while (gridDeleteBtns.size()!=0) {
							element_Click(gridDeleteBtn);
							driver.switchTo().alert().accept();
							Thread.sleep(1000);
						}
						// Add row
						for (int i = 0; i < data.size(); i++) {
							String skillName = data.get(i).get("SkillName");
							String workerLimit = data.get(i).get("WorkerLimit");
							element_Click(gvSkilladdBtn);
							Thread.sleep(1000);
							if (skillName != null) {
								logger.info("SkillName: "+skillName);
								element_Clear(skillNameTxt);
								element_dynamicDDSelect(skillNameTxt, skillName);
								element_TextBoxToClickOnTab(skillNameTxt);
							}
							if (workerLimit != null) {
								logger.info("WorkerLimit: "+workerLimit);
								element_Clear(skillWorkerLimitTxt);
								element_InputTextUsingActionClass(skillWorkerLimitTxt, workerLimit);
							}
							Thread.sleep(1000);
							element_Click(gridSaveBtn);
						}
						Thread.sleep(1000);
						saveButtonClick();
						msg = validationMessage();
						break;
					}
				}
			}
			//logger.debug(ar);
			if (!ar.contains(workorderID)) {
				msg = "WorkOrder doesn't exist";
			}
		}
		else {
			msg = "WorkOrder doesn't exist";
		}
		return msg;
	}
}
